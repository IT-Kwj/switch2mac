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
    float4 m_62 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _721 = false;
    bool _327 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2757 = as_type<float>(_105);
        out.gl_Position.z = _2757;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_143);
        out.gl_Position.z = _2827;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    if (!_159)
    {
        float _175 = _147 * _147;
        float _177 = _175 * 0.5;
        _173 = _177;
    }
    float _179 = _173;
    float _181 = _179;
    if (!_159)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_145) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_145) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_159;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _147 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _147);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _247 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _249 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _251 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].x, _245);
    float _253 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].y, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].z, _249);
    float _257 = _247;
    if (!_159)
    {
        _257 = _147;
    }
    float _259 = _257;
    float _261 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _251);
    bool _263 = !_159;
    float _265 = _259;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _147 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _265 = _285;
    }
    float _287 = _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].y, _253);
    float _293 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _255);
    float _295 = fma(_287, _161, _261);
    float _297 = fma(_287, _163, _291);
    float _299 = fma(_287, _165, _293);
    float _301 = fma(_295, _149, _167);
    float _303 = fma(_297, _149, _169);
    float _305 = fma(_299, _149, _171);
    bool _307 = !_289;
    float _325;
    if (!_307)
    {
        float _309 = in.m_54.x;
        float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _313 = _309 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _317 = _315 * _311;
        float _319 = floor(_317);
        float _321 = -_319;
        float _323 = _317 + _321;
        _325 = _323;
        _327 = true;
    }
    else
    {
        float _329 = float(_89);
        float _331 = 1.0 / _329;
        float _333 = _123 * _331;
        _325 = _333;
    }
    _327 = false;
    float _335 = _325;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _353 = 1.0 / _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _367 = 1.0 / _343;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = _335 + _369;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = 1.0 / _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _335 + _377;
    float _381 = _371 * _353;
    bool _383 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _385 = isnan(_335);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = _335 + _395;
    float _399 = 1.0 / _347;
    float _401 = _379 * _367;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = _335 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _409 = _335 + _407;
    float _411 = 1.0 / _357;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _335 + _413;
    float _417 = _415 * _375;
    bool _419 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _421 = isnan(_335);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _431;
    float _435 = 1.0 / _365;
    float _437 = _405 * _399;
    float _439 = -_393;
    float _441 = _439 + 1.0;
    bool _443 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _445 = isnan(_335);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = fma(_433, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = _429 * _441;
    float _459 = -_429;
    float _461 = _459 + 1.0;
    float _463 = 1.0 / _361;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _467 = _335 + _465;
    float _469 = _409 * _411;
    bool _471 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_335);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _467 * _435;
    bool _485 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _487 = isnan(_335);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    bool _497 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _499 = isnan(_335);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -_495;
    float _511 = _509 + 1.0;
    float _513 = _495 * _461;
    float _515 = _397 * _463;
    float _517 = -_481;
    float _519 = _517 + 1.0;
    float _521 = _481 * _511;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _523;
    float _527 = -_507;
    float _529 = _527 + 1.0;
    float _531 = _507 * _519;
    bool _533 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_335);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = fma(_525, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _547 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _549 = isnan(_335);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = _453 * _529;
    float _565 = -_543;
    float _567 = _565 + 1.0;
    float _569 = -_453;
    float _571 = _569 + 1.0;
    float _573 = fma(_561, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = _557 * _567;
    float _581 = _543 * _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -_557;
    float _589 = _587 + 1.0;
    float _591 = _455 * _579;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = fma(_585, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _599;
    float _603 = _545 * _579;
    float _605 = fma(_595, _417, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _611 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _591);
    float _613 = fma(_601, _437, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _615 = fma(_577, _437, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _617 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _619 = fma(_573, _581, _611);
    float _621 = fma(_597, _581, _617);
    float _623 = fma(_609, _417, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_613, _563, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_615, _563, _621);
    float _637 = in.m_52.x;
    float _639 = in.m_52.y;
    float _641 = fma(_627, _515, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _643 = fma(_633, _515, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _649 = fma(_605, _531, _629);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = fma(_623, _531, _635);
    float _657 = fma(_647, _483, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _659;
    float _663 = fma(_641, _521, _649);
    float _665 = fma(_653, _483, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _667;
    float _671 = fma(_643, _521, _655);
    float _673 = fma(_661, _469, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _675 = fma(_657, _513, _663);
    float _677 = fma(_669, _469, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _679 = fma(_665, _513, _671);
    float _681 = fma(_673, _457, _675);
    float _683 = fma(_677, _457, _679);
    float _685 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[150].x, _681);
    float _687 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[150].y, _683);
    float _689 = _685 * _637;
    float _691 = _687 * _639;
    bool _693 = !_373;
    float _695 = _457;
    int _697 = as_type<int>(_661);
    int _699 = as_type<int>(_673);
    float _701 = _513;
    float _719;
    if (!_693)
    {
        float _703 = in.m_54.x;
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _707 = _703 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _711 = _709 * _705;
        float _713 = floor(_711);
        float _715 = -_713;
        float _717 = _711 + _715;
        _695 = _705;
        _719 = _717;
        _721 = true;
    }
    else
    {
        float _723 = float(_89);
        float _725 = 1.0 / _723;
        float _727 = _123 * _725;
        _719 = _727;
    }
    _721 = false;
    float _729 = _695;
    float _731 = _719;
    float _733 = in.m_54.z;
    float _735 = in.m_54.w;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _739 = _737 != 0;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[150].x;
    float _745 = _683;
    float _747 = _729;
    if (_739)
    {
        float _749 = in.m_54.x;
        float _751 = in.m_54.y;
        _743 = _749;
        _745 = _751;
    }
    float _753 = _743;
    float _755 = _745;
    if (_739)
    {
        _697 = 0;
    }
    int _757 = _697;
    int _759 = _757;
    if (_739)
    {
        _699 = 0;
    }
    int _761 = _699;
    float _763 = _733 * 2.0;
    float _765 = floor(_763);
    float _767 = _753;
    int _769 = _761;
    float _771 = _755;
    if (_739)
    {
        _701 = _753;
    }
    float _773 = _701;
    float _775 = _773;
    if (_739)
    {
        _747 = _755;
    }
    float _777 = _747;
    bool _779 = _765 >= 0.0;
    bool _781 = isnan(_765);
    bool _783 = _779 || _781;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = _765 > 0.0;
    float _791 = _787 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _793 = _777;
    float _795 = _791;
    if (!_739)
    {
        float _797 = in.m_54.x;
        float _799 = in.m_54.y;
        float _801 = _797 * 3.1415927410125732421875;
        float _803 = _801 * 0.15915493667125701904296875;
        float _805 = _799 * 3.1415927410125732421875;
        float _807 = _805 * 0.15915493667125701904296875;
        float _809 = _803 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _807 * 6.283185482025146484375;
        float _815 = sin(_813);
        _759 = 1;
        _767 = _797;
        _769 = 2;
        _775 = _811;
        _771 = _799;
        _793 = _815;
    }
    int _817 = _759;
    float _819 = _767;
    int _821 = _769;
    float _823 = _775;
    float _825 = _771;
    float _827 = _793;
    bool _829 = _817 != 1;
    float _831 = _819 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _833 = _819 + (-0.5);
    bool _835 = _821 != 2;
    float _837 = _819 * 2.0;
    float _839 = -_741;
    float _841 = fma(_831, 2.0, _839);
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _845 = _823 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _847 = -_123;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[76].x, _841);
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[93].z, _843);
    float _853 = floor(_837);
    float _855 = _825 + _819;
    float _857 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _859 = _855 + (-1.0);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _863 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = _825 * 2.0;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _871 = fma(_857, -2.0, _861);
    float _873 = floor(_865);
    int _875 = ~as_type<int>(_791);
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[93].w, _867);
    bool _883 = _853 > 0.0;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _887 = _853 >= 0.0;
    bool _889 = isnan(_853);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _827 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _899 = _853;
    float _901 = _857;
    int _903 = _879;
    float _905 = _845;
    float _907 = _897;
    float _909 = _865;
    if (!_829)
    {
        _899 = _733;
    }
    float _911 = _899;
    float _913 = -_869;
    float _915 = fma(_845, 2.0, _913);
    float _917 = _911;
    if (!_829)
    {
        _901 = _825;
    }
    float _919 = _901;
    float _921 = fma(_897, -2.0, _885);
    float _923 = _919;
    if (!_789)
    {
        int _925 = ~as_type<int>(_791);
        int _927 = _925 + 1;
        _903 = _927;
    }
    int _929 = _903;
    float _931 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _851);
    float _933 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _921);
    bool _935 = _733 > 0.5;
    float _937 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _881);
    float _939 = 0.0;
    if (!_829)
    {
        _939 = _819;
    }
    float _941 = _939;
    float _943 = -_123;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[91].x, _915);
    float _947 = _941;
    if (!_829)
    {
        _905 = _919;
    }
    float _949 = _905;
    float _951 = _691 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = _949;
    if (!_829)
    {
        _795 = _911;
    }
    float _955 = _795;
    float _957 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _959 = _955;
    if (_829)
    {
        _953 = _819;
    }
    float _961 = _953;
    if (_829)
    {
        _923 = _819;
    }
    float _963 = _923;
    if (_829)
    {
        _947 = _733;
    }
    float _965 = _947;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_829)
    {
        _959 = _825;
    }
    float _969 = _959;
    if (_829)
    {
        _917 = _825;
    }
    float _971 = _917;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _983 = _981 != 0;
    if (_835)
    {
        _907 = _825;
    }
    float _985 = _907;
    float _987 = _985;
    if (_835)
    {
        _909 = _819;
    }
    float _989 = _909;
    float _991 = 0.0;
    float _993 = _989;
    if (_835)
    {
        _991 = _733;
    }
    float _995 = _991;
    float _997 = -_201;
    int _999 = _935 ? as_type<int>(_997) : as_type<int>(_201);
    float _1001 = _995;
    if (!_835)
    {
        _987 = _819;
    }
    float _1003 = _987;
    if (!_835)
    {
        _993 = _733;
    }
    float _1005 = _993;
    if (!_835)
    {
        _1001 = _825;
    }
    float _1007 = _1001;
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1011 = _825 > 0.5;
    int _1013 = _895 ? 0 : 1;
    bool _1015 = !_983;
    float _1017 = _1015 ? _201 : as_type<float>(_999);
    bool _1019 = _873 > 0.0;
    bool _1021 = _873 >= 0.0;
    bool _1023 = isnan(_873);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    float _1031 = -_197;
    int _1033 = _1011 ? as_type<int>(_1031) : as_type<int>(_197);
    int _1035 = ~_1013;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _1039;
    if (!_883)
    {
        int _1043 = ~_1013;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1051 = !_979;
    float _1053 = _1051 ? _197 : as_type<float>(_1033);
    int _1055 = _1029 ? 0 : 1;
    float _1057 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1059 = log2(_1057);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1049);
    float _1075 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1073);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1081 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1077);
    bool _1083 = !_1063;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = _969 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1089 = float(_929);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1093 = abs(_1085);
    float _1095 = fma(_1087, -2.0, _1079);
    float _1097 = _1059 * _123;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1101 = float(_1093);
    float _1103 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1107 = fma(_1009, -2.0, _1091);
    float _1109 = exp2(_1097);
    float _1111 = _1101 * _1089;
    float _1113 = -_1099;
    float _1115 = fma(_1103, 2.0, _1113);
    float _1117 = in.m_56.x;
    float _1119 = in.m_56.y;
    float _1121 = in.m_56.z;
    float _1123 = -_1105;
    float _1125 = fma(_967, 2.0, _1123);
    float _1127 = _1111 * (-2.0);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1131 = 1.0 + _1129;
    int _1133 = ~_1055;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1141 = _1137;
    float _1143 = _1115;
    if (!_1019)
    {
        int _1145 = ~_1055;
        int _1147 = _1145 + 1;
        _1141 = _1147;
    }
    int _1149 = _1141;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _1153 = !_1067;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = 1.0 / _1131;
    float _1159 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1139);
    float _1161 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1151);
    float _1163 = -_1109;
    float _1165 = _1163 + 1.0;
    int _1167 = abs(_1155);
    float _1169 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1081);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1173 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1095);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1179 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1181 = isnan(1.0);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1187 = _1183 || _1185;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1193 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1195 = isnan(0.0);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1201 = _1197 || _1199;
    float _1203 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1171);
    bool _1205 = !_1071;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1175);
    float _1211 = float(_1047);
    float _1213 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1215 = float(_1167);
    float _1217 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1191);
    float _1219 = _1201 ? _1165 : 0.0;
    float _1221 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1177);
    int _1223 = abs(_1207);
    float _1225 = fma(_1127, _1117, _1117);
    float _1227 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _871);
    float _1229 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1203);
    float _1231 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1159);
    float _1233 = _1215 * _1211;
    float _1235 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1209);
    float _1237 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1221);
    float _1239 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1213);
    float _1241 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1217);
    float _1243 = -_123;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    float _1247 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1161);
    float _1249 = -_123;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1115);
    float _1253 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1107);
    float _1255 = fma(_863, _1127, _863);
    if (_1187)
    {
        float _1257 = _1219 * _1157;
        _125 = _1257;
    }
    float _1259 = _125;
    float _1261 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1225);
    float _1263 = _825 + _733;
    float _1265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1267 = float(_1149);
    float _1269 = fma(_1255, _1259, _1261);
    float _1271 = float(_1223);
    float _1273 = _1263 + (-1.0);
    float _1275 = _1233 * (-2.0);
    float _1277 = _1269 * 0.15915493667125701904296875;
    float _1279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1283 = _1271 * _1267;
    float _1285 = _825 + (-0.5);
    float _1287 = fma(_1275, _1119, _1119);
    float _1289 = _733 + _819;
    float _1291 = fma(_1281, _1275, _1281);
    float _1293 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1287);
    float _1295 = _1289 + (-1.0);
    float _1297 = _1283 * (-2.0);
    float _1299 = _733 + (-0.5);
    float _1301 = fma(_1291, _1259, _1293);
    float _1303 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1305 = fma(_1297, _1121, _1121);
    float _1307 = _1277 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _1301 * 0.15915493667125701904296875;
    float _1313 = fma(_1303, _1297, _1303);
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    float _1317 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1319 = _951 * _1265;
    float _1321 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1323 = fma(_1313, _1259, _1315);
    float _1325 = _1277 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1331 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1317);
    float _1333 = _1323 * 0.15915493667125701904296875;
    float _1335 = _957 * _1279;
    float _1337 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1321);
    float _1339 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1329);
    bool _1341 = _735 > 0.5;
    float _1343 = _1311 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = -_201;
    float _1359 = _1341 ? _1357 : _201;
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = _1311 * 6.283185482025146484375;
    float _1373 = cos(_1371);
    float _1375 = _1333 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1309 * _1345;
    float _1381 = _1327 * _1345;
    float _1383 = _1333 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = _1327 * _1373;
    float _1389 = _1309 * _1373;
    float _1391 = _1377 * _1319;
    float _1393 = _1345 * _1377;
    float _1395 = _1373 * _1377;
    float _1397 = _1327 * _1391;
    float _1399 = _1309 * _1391;
    float _1401 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1331);
    float _1403 = fma(_1385, _1387, _1379);
    float _1405 = -_1381;
    float _1407 = fma(_1385, _1389, _1405);
    float _1409 = -_1389;
    float _1411 = fma(_1385, _1381, _1409);
    float _1413 = -_1319;
    float _1415 = _1385 * _1413;
    float _1417 = fma(_1403, _1335, _1397);
    float _1419 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1421 = fma(_1385, _1379, _1387);
    float _1423 = fma(_1395, _1335, _1415);
    float _1425 = fma(_1407, _1335, _1399);
    float _1427 = fma(_1411, _1419, _1417);
    float _1429 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1337);
    float _1431 = fma(_1393, _1419, _1423);
    float _1433 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1339);
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1437 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1439 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1441 = fma(_1421, _1419, _1425);
    float _1443 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1435);
    float _1445 = _1429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1439);
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1443);
    float _1453 = _1433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1449);
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1461 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1463 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1467 = _1453 + _1459;
    float _1469 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1461);
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1473 = _1445 + _1465;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1477 = _1467 + _1475;
    float _1479 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1469);
    float _1481 = 1.0 / _1471;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1485 = _1473 + _1483;
    float _1487 = _1477 * _1477;
    float _1489 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1491 = !_975;
    float _1493 = _1491 ? _201 : _1359;
    float _1495 = fma(_1485, _1485, _1487);
    float _1497 = _1489 + _1471;
    float _1499 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1501 = sqrt(_1495);
    float _1503 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1499);
    float _1505 = _1497 * _1481;
    float _1507 = _1505 * 0.5;
    float _1509 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1503);
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1513 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1511);
    float _1515 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1517 = _1437 + _1515;
    bool _1519 = _1501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1521 = 1.0 / _1513;
    float _1523 = _1359;
    float _1525 = _1507;
    float _1527 = _1515;
    float _1529 = _1499;
    float _1531 = _1501;
    float _1533 = _1473;
    float _1535 = _1477;
    float _1537 = _1485;
    float _1539 = _1311;
    bool _1541 = _1355;
    if (!_1519)
    {
        _1523 = _1473;
    }
    float _1543 = _1523;
    float _1545 = _1543;
    if (!_1519)
    {
        _1525 = _1467;
    }
    float _1547 = _1525;
    float _1549 = _1547;
    if (!_1519)
    {
        _1527 = _1517;
    }
    float _1551 = _1527;
    bool _1553 = !_1519;
    float _1555 = _1551;
    if (!_1553)
    {
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1561 = _1501 + _1559;
        float _1563 = rsqrt(_1495);
        float _1565 = _1561 * _1557;
        float _1567 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1569 = _1565 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1569 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = fma(_1573, _1567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1581 = _1563 * _1579;
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1485, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1587 = fma(_1477, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1589 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = fma(_1517, _1577, _1589);
        _1555 = _1591;
        _1549 = _1587;
        _1545 = _1585;
        _1529 = _1589;
        _1531 = _1569;
    }
    float _1593 = _1555;
    float _1595 = _1549;
    float _1597 = _1545;
    float _1599 = _1529;
    float _1601 = _1531;
    float _1603 = _1599;
    float _1605 = _1597;
    float _1607 = _1595;
    float _1609 = _1601;
    if (_1369)
    {
        _1533 = 1.0;
    }
    float _1611 = _1533;
    float _1613 = _1611;
    if (_1355)
    {
        _1535 = _1593;
    }
    float _1615 = _1535;
    float _1617 = _1615;
    if (_1355)
    {
        _1537 = _1595;
    }
    float _1619 = _1537;
    float _1621 = _1619;
    if (!_1355)
    {
        float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1625 = _1437 + _1623;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1629 = _1445 + _1627;
        float _1631 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1633 = -_1445;
        float _1635 = _1633 + _1597;
        float _1637 = _1625 * _1625;
        float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1641 = _1453 + _1639;
        float _1643 = -_1437;
        float _1645 = _1643 + _1593;
        float _1647 = -_1453;
        float _1649 = _1647 + _1595;
        float _1651 = fma(_1629, _1629, _1637);
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1655 = fma(_1641, _1641, _1651);
        float _1657 = sqrt(_1655);
        float _1659 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1661 = precise::min(_1657, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1663 = _1661 * _1653;
        float _1665 = _1659 * _1663;
        float _1667 = fma(_1635, _1665, _1445);
        float _1669 = fma(_1645, _1665, _1437);
        float _1671 = fma(_1649, _1665, _1453);
        _1603 = _1661;
        _1617 = _1669;
        _1605 = _1667;
        _1621 = _1671;
        _1607 = _1649;
    }
    float _1673 = _1603;
    float _1675 = _1617;
    float _1677 = _1605;
    float _1679 = _1621;
    float _1681 = _1607;
    float _1683 = _1673;
    float _1685 = _1681;
    if (_1369)
    {
        _1609 = 1.0;
    }
    float _1687 = _1609;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1691 = _1521 * _1689;
    float _1693 = _1687;
    if (!_1369)
    {
        float _1695 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1701 = _1697 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        float _1705 = _1699 * 0.15915493667125701904296875;
        float _1707 = _1697 * 6.283185482025146484375;
        float _1709 = sin(_1707);
        float _1711 = 1.0 / _1703;
        float _1713 = _1705 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = _1709 * _1711;
        float _1719 = _1705 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1715 * _1717;
        float _1725 = 1.0 / _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1729 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1727;
        float _1731 = 1.0 / _1729;
        float _1733 = _1721 * _1725;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = fma(_1691, _1733, _1735);
        float _1739 = _1737 * _1731;
        float _1741 = precise::clamp(_1739, 0.0, 1.0);
        _1683 = _1697;
        _1685 = _1705;
        _1613 = _1741;
    }
    float _1743 = _1683;
    float _1745 = _1685;
    float _1747 = _1613;
    float _1749 = _1743;
    float _1751 = _1745;
    if (!_1369)
    {
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1755 = _1753 * 0.15915493667125701904296875;
        float _1757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1759 = _1755 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1757 * 0.15915493667125701904296875;
        float _1765 = _1755 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1761;
        float _1771 = _1763 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1763 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1781;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1785;
        float _1789 = 1.0 / _1787;
        float _1791 = _1779 * _1783;
        float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1795 = fma(_1691, _1791, _1793);
        float _1797 = _1795 * _1789;
        float _1799 = precise::clamp(_1797, 0.0, 1.0);
        float _1801 = -_1799;
        float _1803 = _1801 + 1.0;
        _1749 = _1769;
        _1751 = _1783;
        _1693 = _1803;
    }
    float _1805 = _1749;
    float _1807 = _1751;
    float _1809 = _1693;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1813 = _1675 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1817 = _1677 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1821 = _1679 + _1819;
    float _1823 = _1813 * _1813;
    float _1825 = fma(_1817, _1817, _1823);
    float _1827 = fma(_1821, _1821, _1825);
    float _1829 = rsqrt(_1827);
    float _1831 = sqrt(_1827);
    float _1833 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1835 = _1817 * _1833;
    float _1837 = _1821 * _1833;
    float _1839 = _1835 * _1835;
    float _1841 = _1837 * _1837;
    float _1843 = _1839 + _1841;
    float _1845 = sqrt(_1843);
    bool _1847 = _1845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1851 = _1845 + _1849;
    float _1853 = _1829;
    float _1855 = _1851;
    float _1857 = _1805;
    float _1859 = _1813;
    if (_1847)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1853 = _1861;
    }
    float _1863 = _1853;
    float _1865 = _1863;
    if (_1847)
    {
        float _1867 = _1851 * _1863;
        _1855 = _1867;
    }
    float _1869 = _1855;
    if (_1847)
    {
        float _1871 = rsqrt(_1843);
        _1865 = _1871;
    }
    float _1873 = _1865;
    float _1875 = _1873;
    if (_1847)
    {
        float _1877 = _1869 * 0.15915493667125701904296875;
        _1857 = _1877;
    }
    float _1879 = _1857;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1883 = _1821;
    float _1885 = _1879;
    if (_1847)
    {
        float _1887 = _1879 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        _1883 = _1889;
    }
    float _1891 = _1883;
    float _1893 = precise::max(0.0, _1881);
    float _1895 = _1807;
    float _1897 = _1893;
    if (_1847)
    {
        float _1899 = _1879 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        _1895 = _1901;
    }
    float _1903 = _1895;
    float _1905 = -_1833;
    float _1907 = -_1893;
    float _1909 = fma(_1813, _1905, _1907);
    if (_1847)
    {
        float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1859 = _1911;
    }
    float _1913 = _1859;
    float _1915 = _1891;
    float _1917 = _1913;
    if (_1847)
    {
        float _1919 = fma(_1891, _1913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = _1921;
    if (!_1847)
    {
        _1917 = _1839;
    }
    float _1925 = _1917;
    float _1927 = _1925;
    if (_1847)
    {
        float _1929 = _1873 * _1921;
        _1539 = _1929;
    }
    float _1931 = _1539;
    if (!_1847)
    {
        _1875 = _1835;
    }
    float _1933 = _1875;
    float _1935 = _1933;
    float _1937 = _1903;
    if (_1847)
    {
        float _1939 = _1903 + (-1.0);
        _1897 = _1939;
    }
    float _1941 = _1897;
    float _1943 = _1941;
    if (_1847)
    {
        float _1945 = _1835 * _1931;
        _1935 = _1945;
    }
    float _1947 = _1935;
    if (!_1847)
    {
        _1923 = _1909;
    }
    float _1949 = _1923;
    float _1951 = _1949;
    if (_1847)
    {
        float _1953 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1953;
    }
    float _1955 = _1885;
    if (!_1847)
    {
        _1943 = _1837;
    }
    float _1957 = _1943;
    float _1959 = _1957;
    if (_1847)
    {
        float _1961 = _1837 * _1931;
        _1959 = _1961;
    }
    float _1963 = _1959;
    if (_1847)
    {
        float _1965 = _1947 * _1947;
        _1927 = _1965;
    }
    float _1967 = _1927;
    if (_1847)
    {
        float _1969 = fma(_1909, _1903, _1955);
        _1951 = _1969;
    }
    float _1971 = _1951;
    if (!_1847)
    {
        _1937 = _1841;
    }
    float _1973 = _1937;
    float _1975 = _1973;
    if (_1847)
    {
        float _1977 = _1963 * _1963;
        _1975 = _1977;
    }
    float _1979 = _1975;
    float _1981 = fma(_1971, _1971, _1967);
    float _1983 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1985 = _1981 + _1979;
    float _1987 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1989 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1983);
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1993 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1991);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = rsqrt(_1985);
    float _1999 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2001 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2003 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1987);
    float _2005 = -_1995;
    float _2007 = _2005 + 1.0;
    float _2009 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2011 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2001);
    float _2013 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2015 = abs(_2007);
    float _2017 = log2(_2015);
    float _2019 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _2021 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2011);
    float _2023 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2009);
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2029 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2033 = _1997 * _1947;
    float _2035 = _1997 * _1971;
    float _2037 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2025);
    float _2039 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2031);
    float _2041 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2043 = _1997 * _1963;
    float _2045 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2047 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2049 = -_2041;
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2049);
    float _2053 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2039);
    float _2055 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2057 = -_2045;
    float _2059 = fma(_2057, _1999, 1.0);
    float _2061 = -_2043;
    float _2063 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2051);
    float _2065 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2053);
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2069 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2071 = fma(_2063, -0.5, 0.5);
    float _2073 = exp2(_2055);
    float _2075 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2067);
    float _2077 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2069);
    float _2079 = fma(_2063, 0.5, 0.5);
    float _2081 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2075);
    float _2083 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2077);
    float _2085 = _2035 + 1.0;
    float _2087 = 1.0 / _2065;
    float _2089 = fma(_2079, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2091 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2081);
    float _2093 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2083);
    float _2095 = fma(_2079, _2089, -0.212114393711090087890625);
    float _2097 = log2(_2059);
    float _2099 = -_2035;
    float _2101 = fma(_2073, _2085, _2099);
    float _2103 = fma(_2079, _2095, 1.570728778839111328125);
    float _2105 = fma(_2101, 0.5, 0.5);
    float _2107 = sqrt(_2071);
    float _2109 = _2091 * _2087;
    float _2111 = _2093 * _2087;
    float _2113 = fma(_2109, 0.5, 0.5);
    float _2115 = fma(_2111, -0.5, 0.5);
    float _2117 = _2097 * 0.693147182464599609375;
    float _2119 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2121 = _2107 * 0.636619746685028076171875;
    float _2123 = -_2103;
    float _2125 = fma(_2121, _2123, 1.0);
    float3 _5952 = float3(_2113, _2115, _2119);
    float _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5952, float3(0.0), isnan(_5952)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5952, float3(0.0), isnan(_5952)), level(0.0)).x;
    float3 _5963 = float3(_2113, _2115, _2119);
    float4 _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5963, float3(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5963, float3(0.0), isnan(_5963)), level(0.0)).xyzw;
    float _2132 = _2130.x;
    float _2134 = _2130.y;
    float _2136 = _2130.z;
    float _2138 = _2130.w;
    float2 _5980 = float2(_2125, _2105);
    float3 _2142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5980, float2(0.0), isnan(_5980)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5980, float2(0.0), isnan(_5980)), level(0.0)).xyz;
    float _2144 = _2142.x;
    float _2146 = _2142.y;
    float _2148 = _2142.z;
    int _2150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2152 = _2150 != 0;
    float _2154 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2158 = _2156 != 0;
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2162 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2164 = isnan(_731);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2170 = _2166 || _2168;
    float _2172 = float(_2170);
    float _2174 = -_1075;
    float _2176 = _2174 + 1.0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2180 = _2178 != 0;
    float _2182 = -_1169;
    float _2184 = _2182 + 1.0;
    int _2186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2188 = _2186 != 0;
    float _2190 = -_2172;
    float _2192 = _2190 + 1.0;
    float _2194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2196 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2198 = isnan(_731);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2204 = _2200 || _2202;
    float _2206 = float(_2204);
    float _2208 = _2103;
    bool _2210 = _2152;
    if (_2152)
    {
        float _2212 = in.m_54.w;
        _2208 = _2212;
    }
    float _2214 = _2208;
    bool _2216 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2218 = isnan(_731);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    float _2228 = -_1239;
    float _2230 = _2228 + 1.0;
    float _2232 = _1219;
    if (_2158)
    {
        float _2234 = in.m_54.x;
        _2232 = _2234;
    }
    float _2236 = _2232;
    float _2238 = -_2206;
    float _2240 = _2238 + 1.0;
    float _2242 = _2206 * _2192;
    float _2244 = -_2226;
    float _2246 = _2244 + 1.0;
    float _2248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2250 = _2226 * _2240;
    float _2252 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2254 = -_1241;
    float _2256 = _2254 + 1.0;
    float _2258 = exp2(_2154);
    float _2260 = _2214;
    if (_2152)
    {
        float _2262 = _2214 * 3.1415927410125732421875;
        _2260 = _2262;
    }
    float _2264 = _2260;
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2152)
    {
        float _2268 = _2264 * 0.15915493667125701904296875;
        _1143 = _2268;
    }
    float _2270 = _1143;
    float _2272 = _2236;
    float _2274 = _2270;
    if (_2158)
    {
        float _2276 = _2236 * 3.1415927410125732421875;
        _2272 = _2276;
    }
    float _2278 = _2272;
    float _2280 = _1127;
    if (_2152)
    {
        float _2282 = _2270 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    float _2288 = -_2258;
    float _2290 = _2288 + 1.0;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2302 = 1.0 / _2294;
    if (!_2152)
    {
        _2274 = _197;
    }
    float _2304 = _2274;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2308 = _2306 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2310 = _2304;
    if (_2152)
    {
        bool _2312 = _2286 > 0.5;
        _1541 = _2312;
    }
    bool _2314 = _1541;
    float _2316 = 1.0 / _2298;
    if (_2152)
    {
        float _2318 = -_197;
        float _2320 = _2314 ? _2318 : _197;
        _2310 = _2320;
    }
    float _2322 = _2310;
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2326 = _2324 != 0;
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2336 = 1.0 / _2308;
    float _2338 = _2330 * _2302;
    float _2340 = _2330;
    if (_2158)
    {
        float _2342 = _2278 * 0.15915493667125701904296875;
        _2340 = _2342;
    }
    float _2344 = _2340;
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2348 = _731 + _2346;
    bool _2350 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2352 = isnan(_731);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    float _2362 = fma(_2338, _2348, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2364 = _2344;
    if (_2158)
    {
        float _2366 = _2344 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        _2364 = _2368;
    }
    float _2370 = _2364;
    float _2372 = _2360 * _2246;
    float _2374 = _2334 * _2316;
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2378 = _731 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2380;
    float _2384 = _2362 * _2372;
    float _2386 = -_2360;
    float _2388 = _2386 + 1.0;
    float _2390 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2394 = _2382 * _2336;
    float _2396 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2384);
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2400 = _731 + _2398;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2406 = _2402;
    if (_2158)
    {
        bool _2408 = _2370 > 0.5;
        _2210 = _2408;
    }
    bool _2410 = _2210;
    float _2412 = _1235 * (-0.15915493667125701904296875);
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2158)
    {
        _2406 = _201;
    }
    float _2418 = _2406;
    float _2420 = fma(_2394, _2400, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2424 = fma(_2390, _2250, _2396);
    float _2426 = _2418;
    if (_2158)
    {
        float _2428 = -_201;
        float _2430 = _2410 ? _2428 : _201;
        _2426 = _2430;
    }
    float _2432 = _2426;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2436 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2440 = _819 > 0.5;
    float _2442 = fma(_2420, _2242, _2424);
    float _2444 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2446 = _2322 + 0.5;
    float _2448 = -_201;
    int _2450 = _1011 ? as_type<int>(_2448) : as_type<int>(_201);
    float _2452 = _1231 * (-0.15915493667125701904296875);
    float _2454 = _2404 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2456 = _2432 + (-0.5);
    out.m_58.x = _2436;
    out.m_58.y = _2438;
    out.m_58.z = _2416;
    out.m_58.w = _2434;
    float _2458 = fma(_2444, _2446, _945);
    float _2460 = _2412 * 6.283185482025146484375;
    float _2462 = sin(_2460);
    float _2464 = -_931;
    float _2466 = _2464 + 1.0;
    float _2468 = -_197;
    int _2470 = _2440 ? as_type<int>(_2468) : as_type<int>(_197);
    float _2472 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2442);
    bool _2474 = _1747 > 0.0;
    bool _2476 = isnan(_1747);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(0.0);
    bool _2482 = _2478 || _2480;
    float _2484 = -_2466;
    float _2486 = fma(_2484, _2322, _2458);
    float _2488 = -_937;
    float _2490 = _2488 + 1.0;
    bool _2492 = !_2180;
    float _2494 = _2492 ? _197 : as_type<float>(_2470);
    float _2496 = _2412 * 6.283185482025146484375;
    float _2498 = cos(_2496);
    bool _2500 = _1809 <= 0.0;
    bool _2502 = !_2482;
    bool _2504 = _2500 || _2502;
    bool _2506 = !_2188;
    float _2508 = _2506 ? _201 : as_type<float>(_2450);
    float _2510 = -_2454;
    float _2512 = -_933;
    float _2514 = fma(_2510, _2456, _2512);
    float _2516 = _1247 * (-0.15915493667125701904296875);
    float _2518 = -_197;
    int _2520 = _935 ? as_type<int>(_2518) : as_type<int>(_197);
    float _2522 = _2452 * 6.283185482025146484375;
    float _2524 = sin(_2522);
    float _2526 = fma(_2490, _2432, _2514);
    float _2528 = _2508 * _2462;
    out.m_60.x = _2486;
    out.m_60.y = _2526;
    float _2530 = _2452 * 6.283185482025146484375;
    float _2532 = cos(_2530);
    bool _2534 = !_2326;
    float _2536 = _2534 ? _197 : as_type<float>(_2520);
    float _2538 = _2508 * _2498;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2546 = -_2528;
    float _2548 = fma(_2494, _2498, _2546);
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2552 = _2516 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _1493 * _2524;
    float _2558 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2562 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2564 = fma(_2494, _2462, _2538);
    float _2566 = _2548 + 0.5;
    float _2568 = _2516 * 6.283185482025146484375;
    float _2570 = cos(_2568);
    float _2572 = _1493 * _2532;
    float _2574 = -_2556;
    float _2576 = fma(_2536, _2532, _2574);
    out.m_62.x = _2550;
    out.m_62.y = _2558;
    out.m_62.z = _2560;
    out.m_62.w = _2562;
    float _2578 = _2564 + (-0.5);
    float _2580 = fma(_2536, _2524, _2572);
    float _2582 = fma(_2252, _2566, _849);
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2586 = _1017 * _2554;
    float _2588 = -_2266;
    float _2590 = -_1227;
    float _2592 = fma(_2588, _2578, _2590);
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2596 = _1017 * _2570;
    float _2598 = -_2586;
    float _2600 = fma(_1053, _2570, _2598);
    float _2602 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2604 = _2576 + 0.5;
    float _2606 = fma(_1053, _2554, _2596);
    float _2608 = _2580 + (-0.5);
    float _2610 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2614 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2616 = _2606 + (-0.5);
    float _2618 = fma(_2602, _2604, _1245);
    float _2620 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2610);
    float _2622 = -_2614;
    float _2624 = -_1173;
    float _2626 = fma(_2622, _2608, _2624);
    float _2628 = -_1237;
    float _2630 = _2628 + 1.0;
    float _2632 = -_1229;
    float _2634 = _2632 + 1.0;
    float _2636 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2638 = _2600 + 0.5;
    float _2640 = -_2630;
    float _2642 = fma(_2548, _2640, _2582);
    float _2644 = fma(_2564, _2634, _2592);
    float _2646 = -_2636;
    float _2648 = -_1253;
    float _2650 = fma(_2646, _2616, _2648);
    float _2652 = _1747 * _1809;
    float _2654 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2620);
    float _2656 = -_2176;
    float _2658 = fma(_2576, _2656, _2618);
    float _2660 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2662 = fma(_2580, _2184, _2626);
    float _2664 = _2652 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2666 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2654);
    float _2668 = fma(_2660, _2638, _1251);
    float _2670 = fma(_2606, _2256, _2650);
    out.m_64.x = _2642;
    out.m_64.y = _2644;
    out.m_64.z = _2658;
    out.m_64.w = _2662;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2674 = -_2230;
    float _2676 = fma(_2600, _2674, _2668);
    float _2678 = _2666 + _2065;
    out.m_45.x = _2672;
    float _2680 = _2678 * 0.5;
    out.m_66.x = _2676;
    out.m_66.y = _2670;
    float _2682 = -_2300;
    float _2684 = _2682 + 1.0;
    out.gl_Position.x = _2091;
    out.gl_Position.y = _2093;
    out.gl_Position.z = _2666;
    out.gl_Position.w = _2065;
    out.m_68.z = _2680;
    out.m_68.w = _2065;
    float _2686 = _2300 * _2127;
    float _2688 = _2138 * _2684;
    float _2690 = _2138 * _2686;
    float _2692 = _2148 * _2686;
    float _2694 = fma(_2144, _2690, _2132);
    float _2696 = fma(_2146, _2690, _2134);
    float _2698 = fma(_2138, _2692, _2136);
    out.m_70.x = _2694;
    out.m_70.y = _2696;
    out.m_70.z = _2698;
    out.m_70.w = _2688;
    if (!_2504)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2700 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2700;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _721 = false;
    bool _327 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2757 = as_type<float>(_105);
        out.gl_Position.z = _2757;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_143);
        out.gl_Position.z = _2827;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    if (!_159)
    {
        float _175 = _147 * _147;
        float _177 = _175 * 0.5;
        _173 = _177;
    }
    float _179 = _173;
    float _181 = _179;
    if (!_159)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_145) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_145) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_159;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _147 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _147);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _247 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _249 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _251 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].x, _245);
    float _253 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].y, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].z, _249);
    float _257 = _247;
    if (!_159)
    {
        _257 = _147;
    }
    float _259 = _257;
    float _261 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _251);
    bool _263 = !_159;
    float _265 = _259;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _147 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _265 = _285;
    }
    float _287 = _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].y, _253);
    float _293 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _255);
    float _295 = fma(_287, _161, _261);
    float _297 = fma(_287, _163, _291);
    float _299 = fma(_287, _165, _293);
    float _301 = fma(_295, _149, _167);
    float _303 = fma(_297, _149, _169);
    float _305 = fma(_299, _149, _171);
    bool _307 = !_289;
    float _325;
    if (!_307)
    {
        float _309 = in.m_54.x;
        float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _313 = _309 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _317 = _315 * _311;
        float _319 = floor(_317);
        float _321 = -_319;
        float _323 = _317 + _321;
        _325 = _323;
        _327 = true;
    }
    else
    {
        float _329 = float(_89);
        float _331 = 1.0 / _329;
        float _333 = _123 * _331;
        _325 = _333;
    }
    _327 = false;
    float _335 = _325;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _353 = 1.0 / _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _367 = 1.0 / _343;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = _335 + _369;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = 1.0 / _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _335 + _377;
    float _381 = _371 * _353;
    bool _383 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _385 = isnan(_335);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = _335 + _395;
    float _399 = 1.0 / _347;
    float _401 = _379 * _367;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = _335 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _409 = _335 + _407;
    float _411 = 1.0 / _357;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _335 + _413;
    float _417 = _415 * _375;
    bool _419 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _421 = isnan(_335);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _431;
    float _435 = 1.0 / _365;
    float _437 = _405 * _399;
    float _439 = -_393;
    float _441 = _439 + 1.0;
    bool _443 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _445 = isnan(_335);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = fma(_433, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = _429 * _441;
    float _459 = -_429;
    float _461 = _459 + 1.0;
    float _463 = 1.0 / _361;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _467 = _335 + _465;
    float _469 = _409 * _411;
    bool _471 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_335);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _467 * _435;
    bool _485 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _487 = isnan(_335);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    bool _497 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _499 = isnan(_335);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -_495;
    float _511 = _509 + 1.0;
    float _513 = _495 * _461;
    float _515 = _397 * _463;
    float _517 = -_481;
    float _519 = _517 + 1.0;
    float _521 = _481 * _511;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _523;
    float _527 = -_507;
    float _529 = _527 + 1.0;
    float _531 = _507 * _519;
    bool _533 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_335);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = fma(_525, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _547 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _549 = isnan(_335);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = _453 * _529;
    float _565 = -_543;
    float _567 = _565 + 1.0;
    float _569 = -_453;
    float _571 = _569 + 1.0;
    float _573 = fma(_561, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = _557 * _567;
    float _581 = _543 * _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -_557;
    float _589 = _587 + 1.0;
    float _591 = _455 * _579;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = fma(_585, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _599;
    float _603 = _545 * _579;
    float _605 = fma(_595, _417, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _611 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _591);
    float _613 = fma(_601, _437, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _615 = fma(_577, _437, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _617 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _619 = fma(_573, _581, _611);
    float _621 = fma(_597, _581, _617);
    float _623 = fma(_609, _417, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_613, _563, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_615, _563, _621);
    float _637 = in.m_52.x;
    float _639 = in.m_52.y;
    float _641 = fma(_627, _515, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _643 = fma(_633, _515, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _649 = fma(_605, _531, _629);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = fma(_623, _531, _635);
    float _657 = fma(_647, _483, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _659;
    float _663 = fma(_641, _521, _649);
    float _665 = fma(_653, _483, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _667;
    float _671 = fma(_643, _521, _655);
    float _673 = fma(_661, _469, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _675 = fma(_657, _513, _663);
    float _677 = fma(_669, _469, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _679 = fma(_665, _513, _671);
    float _681 = fma(_673, _457, _675);
    float _683 = fma(_677, _457, _679);
    float _685 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[150].x, _681);
    float _687 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[150].y, _683);
    float _689 = _685 * _637;
    float _691 = _687 * _639;
    bool _693 = !_373;
    float _695 = _457;
    int _697 = as_type<int>(_661);
    int _699 = as_type<int>(_673);
    float _701 = _513;
    float _719;
    if (!_693)
    {
        float _703 = in.m_54.x;
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _707 = _703 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _711 = _709 * _705;
        float _713 = floor(_711);
        float _715 = -_713;
        float _717 = _711 + _715;
        _695 = _705;
        _719 = _717;
        _721 = true;
    }
    else
    {
        float _723 = float(_89);
        float _725 = 1.0 / _723;
        float _727 = _123 * _725;
        _719 = _727;
    }
    _721 = false;
    float _729 = _695;
    float _731 = _719;
    float _733 = in.m_54.z;
    float _735 = in.m_54.w;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _739 = _737 != 0;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[150].x;
    float _745 = _683;
    float _747 = _729;
    if (_739)
    {
        float _749 = in.m_54.x;
        float _751 = in.m_54.y;
        _743 = _749;
        _745 = _751;
    }
    float _753 = _743;
    float _755 = _745;
    if (_739)
    {
        _697 = 0;
    }
    int _757 = _697;
    int _759 = _757;
    if (_739)
    {
        _699 = 0;
    }
    int _761 = _699;
    float _763 = _733 * 2.0;
    float _765 = floor(_763);
    float _767 = _753;
    int _769 = _761;
    float _771 = _755;
    if (_739)
    {
        _701 = _753;
    }
    float _773 = _701;
    float _775 = _773;
    if (_739)
    {
        _747 = _755;
    }
    float _777 = _747;
    bool _779 = _765 >= 0.0;
    bool _781 = isnan(_765);
    bool _783 = _779 || _781;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = _765 > 0.0;
    float _791 = _787 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _793 = _777;
    float _795 = _791;
    if (!_739)
    {
        float _797 = in.m_54.x;
        float _799 = in.m_54.y;
        float _801 = _797 * 3.1415927410125732421875;
        float _803 = _801 * 0.15915493667125701904296875;
        float _805 = _799 * 3.1415927410125732421875;
        float _807 = _805 * 0.15915493667125701904296875;
        float _809 = _803 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _807 * 6.283185482025146484375;
        float _815 = sin(_813);
        _759 = 1;
        _767 = _797;
        _769 = 2;
        _775 = _811;
        _771 = _799;
        _793 = _815;
    }
    int _817 = _759;
    float _819 = _767;
    int _821 = _769;
    float _823 = _775;
    float _825 = _771;
    float _827 = _793;
    bool _829 = _817 != 1;
    float _831 = _819 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _833 = _819 + (-0.5);
    bool _835 = _821 != 2;
    float _837 = _819 * 2.0;
    float _839 = -_741;
    float _841 = fma(_831, 2.0, _839);
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _845 = _823 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _847 = -_123;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[76].x, _841);
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[93].z, _843);
    float _853 = floor(_837);
    float _855 = _825 + _819;
    float _857 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _859 = _855 + (-1.0);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _863 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = _825 * 2.0;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _871 = fma(_857, -2.0, _861);
    float _873 = floor(_865);
    int _875 = ~as_type<int>(_791);
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[93].w, _867);
    bool _883 = _853 > 0.0;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _887 = _853 >= 0.0;
    bool _889 = isnan(_853);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _827 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _899 = _853;
    float _901 = _857;
    int _903 = _879;
    float _905 = _845;
    float _907 = _897;
    float _909 = _865;
    if (!_829)
    {
        _899 = _733;
    }
    float _911 = _899;
    float _913 = -_869;
    float _915 = fma(_845, 2.0, _913);
    float _917 = _911;
    if (!_829)
    {
        _901 = _825;
    }
    float _919 = _901;
    float _921 = fma(_897, -2.0, _885);
    float _923 = _919;
    if (!_789)
    {
        int _925 = ~as_type<int>(_791);
        int _927 = _925 + 1;
        _903 = _927;
    }
    int _929 = _903;
    float _931 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _851);
    float _933 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _921);
    bool _935 = _733 > 0.5;
    float _937 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _881);
    float _939 = 0.0;
    if (!_829)
    {
        _939 = _819;
    }
    float _941 = _939;
    float _943 = -_123;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[91].x, _915);
    float _947 = _941;
    if (!_829)
    {
        _905 = _919;
    }
    float _949 = _905;
    float _951 = _691 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = _949;
    if (!_829)
    {
        _795 = _911;
    }
    float _955 = _795;
    float _957 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _959 = _955;
    if (_829)
    {
        _953 = _819;
    }
    float _961 = _953;
    if (_829)
    {
        _923 = _819;
    }
    float _963 = _923;
    if (_829)
    {
        _947 = _733;
    }
    float _965 = _947;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_829)
    {
        _959 = _825;
    }
    float _969 = _959;
    if (_829)
    {
        _917 = _825;
    }
    float _971 = _917;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _983 = _981 != 0;
    if (_835)
    {
        _907 = _825;
    }
    float _985 = _907;
    float _987 = _985;
    if (_835)
    {
        _909 = _819;
    }
    float _989 = _909;
    float _991 = 0.0;
    float _993 = _989;
    if (_835)
    {
        _991 = _733;
    }
    float _995 = _991;
    float _997 = -_201;
    int _999 = _935 ? as_type<int>(_997) : as_type<int>(_201);
    float _1001 = _995;
    if (!_835)
    {
        _987 = _819;
    }
    float _1003 = _987;
    if (!_835)
    {
        _993 = _733;
    }
    float _1005 = _993;
    if (!_835)
    {
        _1001 = _825;
    }
    float _1007 = _1001;
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1011 = _825 > 0.5;
    int _1013 = _895 ? 0 : 1;
    bool _1015 = !_983;
    float _1017 = _1015 ? _201 : as_type<float>(_999);
    bool _1019 = _873 > 0.0;
    bool _1021 = _873 >= 0.0;
    bool _1023 = isnan(_873);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    float _1031 = -_197;
    int _1033 = _1011 ? as_type<int>(_1031) : as_type<int>(_197);
    int _1035 = ~_1013;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _1039;
    if (!_883)
    {
        int _1043 = ~_1013;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1051 = !_979;
    float _1053 = _1051 ? _197 : as_type<float>(_1033);
    int _1055 = _1029 ? 0 : 1;
    float _1057 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1059 = log2(_1057);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1049);
    float _1075 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1073);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1081 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1077);
    bool _1083 = !_1063;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = _969 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1089 = float(_929);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1093 = abs(_1085);
    float _1095 = fma(_1087, -2.0, _1079);
    float _1097 = _1059 * _123;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1101 = float(_1093);
    float _1103 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1107 = fma(_1009, -2.0, _1091);
    float _1109 = exp2(_1097);
    float _1111 = _1101 * _1089;
    float _1113 = -_1099;
    float _1115 = fma(_1103, 2.0, _1113);
    float _1117 = in.m_56.x;
    float _1119 = in.m_56.y;
    float _1121 = in.m_56.z;
    float _1123 = -_1105;
    float _1125 = fma(_967, 2.0, _1123);
    float _1127 = _1111 * (-2.0);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1131 = 1.0 + _1129;
    int _1133 = ~_1055;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1141 = _1137;
    float _1143 = _1115;
    if (!_1019)
    {
        int _1145 = ~_1055;
        int _1147 = _1145 + 1;
        _1141 = _1147;
    }
    int _1149 = _1141;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _1153 = !_1067;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = 1.0 / _1131;
    float _1159 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1139);
    float _1161 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1151);
    float _1163 = -_1109;
    float _1165 = _1163 + 1.0;
    int _1167 = abs(_1155);
    float _1169 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1081);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1173 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1095);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1179 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1181 = isnan(1.0);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1187 = _1183 || _1185;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1193 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1195 = isnan(0.0);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1201 = _1197 || _1199;
    float _1203 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1171);
    bool _1205 = !_1071;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1175);
    float _1211 = float(_1047);
    float _1213 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1215 = float(_1167);
    float _1217 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1191);
    float _1219 = _1201 ? _1165 : 0.0;
    float _1221 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1177);
    int _1223 = abs(_1207);
    float _1225 = fma(_1127, _1117, _1117);
    float _1227 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _871);
    float _1229 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1203);
    float _1231 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1159);
    float _1233 = _1215 * _1211;
    float _1235 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1209);
    float _1237 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1221);
    float _1239 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1213);
    float _1241 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1217);
    float _1243 = -_123;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    float _1247 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1161);
    float _1249 = -_123;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1115);
    float _1253 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1107);
    float _1255 = fma(_863, _1127, _863);
    if (_1187)
    {
        float _1257 = _1219 * _1157;
        _125 = _1257;
    }
    float _1259 = _125;
    float _1261 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1225);
    float _1263 = _825 + _733;
    float _1265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1267 = float(_1149);
    float _1269 = fma(_1255, _1259, _1261);
    float _1271 = float(_1223);
    float _1273 = _1263 + (-1.0);
    float _1275 = _1233 * (-2.0);
    float _1277 = _1269 * 0.15915493667125701904296875;
    float _1279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1283 = _1271 * _1267;
    float _1285 = _825 + (-0.5);
    float _1287 = fma(_1275, _1119, _1119);
    float _1289 = _733 + _819;
    float _1291 = fma(_1281, _1275, _1281);
    float _1293 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1287);
    float _1295 = _1289 + (-1.0);
    float _1297 = _1283 * (-2.0);
    float _1299 = _733 + (-0.5);
    float _1301 = fma(_1291, _1259, _1293);
    float _1303 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1305 = fma(_1297, _1121, _1121);
    float _1307 = _1277 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _1301 * 0.15915493667125701904296875;
    float _1313 = fma(_1303, _1297, _1303);
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    float _1317 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1319 = _951 * _1265;
    float _1321 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1323 = fma(_1313, _1259, _1315);
    float _1325 = _1277 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1331 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1317);
    float _1333 = _1323 * 0.15915493667125701904296875;
    float _1335 = _957 * _1279;
    float _1337 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1321);
    float _1339 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1329);
    bool _1341 = _735 > 0.5;
    float _1343 = _1311 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = -_201;
    float _1359 = _1341 ? _1357 : _201;
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = _1311 * 6.283185482025146484375;
    float _1373 = cos(_1371);
    float _1375 = _1333 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1309 * _1345;
    float _1381 = _1327 * _1345;
    float _1383 = _1333 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = _1327 * _1373;
    float _1389 = _1309 * _1373;
    float _1391 = _1377 * _1319;
    float _1393 = _1345 * _1377;
    float _1395 = _1373 * _1377;
    float _1397 = _1327 * _1391;
    float _1399 = _1309 * _1391;
    float _1401 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1331);
    float _1403 = fma(_1385, _1387, _1379);
    float _1405 = -_1381;
    float _1407 = fma(_1385, _1389, _1405);
    float _1409 = -_1389;
    float _1411 = fma(_1385, _1381, _1409);
    float _1413 = -_1319;
    float _1415 = _1385 * _1413;
    float _1417 = fma(_1403, _1335, _1397);
    float _1419 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1421 = fma(_1385, _1379, _1387);
    float _1423 = fma(_1395, _1335, _1415);
    float _1425 = fma(_1407, _1335, _1399);
    float _1427 = fma(_1411, _1419, _1417);
    float _1429 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1337);
    float _1431 = fma(_1393, _1419, _1423);
    float _1433 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1339);
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1437 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1439 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1441 = fma(_1421, _1419, _1425);
    float _1443 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1435);
    float _1445 = _1429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1439);
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1443);
    float _1453 = _1433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1449);
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1461 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1463 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1467 = _1453 + _1459;
    float _1469 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1461);
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1473 = _1445 + _1465;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1477 = _1467 + _1475;
    float _1479 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1469);
    float _1481 = 1.0 / _1471;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1485 = _1473 + _1483;
    float _1487 = _1477 * _1477;
    float _1489 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1491 = !_975;
    float _1493 = _1491 ? _201 : _1359;
    float _1495 = fma(_1485, _1485, _1487);
    float _1497 = _1489 + _1471;
    float _1499 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1501 = sqrt(_1495);
    float _1503 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1499);
    float _1505 = _1497 * _1481;
    float _1507 = _1505 * 0.5;
    float _1509 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1503);
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1513 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1511);
    float _1515 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1517 = _1437 + _1515;
    bool _1519 = _1501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1521 = 1.0 / _1513;
    float _1523 = _1359;
    float _1525 = _1507;
    float _1527 = _1515;
    float _1529 = _1499;
    float _1531 = _1501;
    float _1533 = _1473;
    float _1535 = _1477;
    float _1537 = _1485;
    float _1539 = _1311;
    bool _1541 = _1355;
    if (!_1519)
    {
        _1523 = _1473;
    }
    float _1543 = _1523;
    float _1545 = _1543;
    if (!_1519)
    {
        _1525 = _1467;
    }
    float _1547 = _1525;
    float _1549 = _1547;
    if (!_1519)
    {
        _1527 = _1517;
    }
    float _1551 = _1527;
    bool _1553 = !_1519;
    float _1555 = _1551;
    if (!_1553)
    {
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1561 = _1501 + _1559;
        float _1563 = rsqrt(_1495);
        float _1565 = _1561 * _1557;
        float _1567 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1569 = _1565 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1569 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = fma(_1573, _1567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1581 = _1563 * _1579;
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1485, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1587 = fma(_1477, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1589 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = fma(_1517, _1577, _1589);
        _1555 = _1591;
        _1549 = _1587;
        _1545 = _1585;
        _1529 = _1589;
        _1531 = _1569;
    }
    float _1593 = _1555;
    float _1595 = _1549;
    float _1597 = _1545;
    float _1599 = _1529;
    float _1601 = _1531;
    float _1603 = _1599;
    float _1605 = _1597;
    float _1607 = _1595;
    float _1609 = _1601;
    if (_1369)
    {
        _1533 = 1.0;
    }
    float _1611 = _1533;
    float _1613 = _1611;
    if (_1355)
    {
        _1535 = _1593;
    }
    float _1615 = _1535;
    float _1617 = _1615;
    if (_1355)
    {
        _1537 = _1595;
    }
    float _1619 = _1537;
    float _1621 = _1619;
    if (!_1355)
    {
        float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1625 = _1437 + _1623;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1629 = _1445 + _1627;
        float _1631 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1633 = -_1445;
        float _1635 = _1633 + _1597;
        float _1637 = _1625 * _1625;
        float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1641 = _1453 + _1639;
        float _1643 = -_1437;
        float _1645 = _1643 + _1593;
        float _1647 = -_1453;
        float _1649 = _1647 + _1595;
        float _1651 = fma(_1629, _1629, _1637);
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1655 = fma(_1641, _1641, _1651);
        float _1657 = sqrt(_1655);
        float _1659 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1661 = precise::min(_1657, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1663 = _1661 * _1653;
        float _1665 = _1659 * _1663;
        float _1667 = fma(_1635, _1665, _1445);
        float _1669 = fma(_1645, _1665, _1437);
        float _1671 = fma(_1649, _1665, _1453);
        _1603 = _1661;
        _1617 = _1669;
        _1605 = _1667;
        _1621 = _1671;
        _1607 = _1649;
    }
    float _1673 = _1603;
    float _1675 = _1617;
    float _1677 = _1605;
    float _1679 = _1621;
    float _1681 = _1607;
    float _1683 = _1673;
    float _1685 = _1681;
    if (_1369)
    {
        _1609 = 1.0;
    }
    float _1687 = _1609;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1691 = _1521 * _1689;
    float _1693 = _1687;
    if (!_1369)
    {
        float _1695 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1701 = _1697 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        float _1705 = _1699 * 0.15915493667125701904296875;
        float _1707 = _1697 * 6.283185482025146484375;
        float _1709 = sin(_1707);
        float _1711 = 1.0 / _1703;
        float _1713 = _1705 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = _1709 * _1711;
        float _1719 = _1705 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1715 * _1717;
        float _1725 = 1.0 / _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1729 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1727;
        float _1731 = 1.0 / _1729;
        float _1733 = _1721 * _1725;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = fma(_1691, _1733, _1735);
        float _1739 = _1737 * _1731;
        float _1741 = precise::clamp(_1739, 0.0, 1.0);
        _1683 = _1697;
        _1685 = _1705;
        _1613 = _1741;
    }
    float _1743 = _1683;
    float _1745 = _1685;
    float _1747 = _1613;
    float _1749 = _1743;
    float _1751 = _1745;
    if (!_1369)
    {
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1755 = _1753 * 0.15915493667125701904296875;
        float _1757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1759 = _1755 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1757 * 0.15915493667125701904296875;
        float _1765 = _1755 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1761;
        float _1771 = _1763 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1763 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1781;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1785;
        float _1789 = 1.0 / _1787;
        float _1791 = _1779 * _1783;
        float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1795 = fma(_1691, _1791, _1793);
        float _1797 = _1795 * _1789;
        float _1799 = precise::clamp(_1797, 0.0, 1.0);
        float _1801 = -_1799;
        float _1803 = _1801 + 1.0;
        _1749 = _1769;
        _1751 = _1783;
        _1693 = _1803;
    }
    float _1805 = _1749;
    float _1807 = _1751;
    float _1809 = _1693;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1813 = _1675 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1817 = _1677 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1821 = _1679 + _1819;
    float _1823 = _1813 * _1813;
    float _1825 = fma(_1817, _1817, _1823);
    float _1827 = fma(_1821, _1821, _1825);
    float _1829 = rsqrt(_1827);
    float _1831 = sqrt(_1827);
    float _1833 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1835 = _1817 * _1833;
    float _1837 = _1821 * _1833;
    float _1839 = _1835 * _1835;
    float _1841 = _1837 * _1837;
    float _1843 = _1839 + _1841;
    float _1845 = sqrt(_1843);
    bool _1847 = _1845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1851 = _1845 + _1849;
    float _1853 = _1829;
    float _1855 = _1851;
    float _1857 = _1805;
    float _1859 = _1813;
    if (_1847)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1853 = _1861;
    }
    float _1863 = _1853;
    float _1865 = _1863;
    if (_1847)
    {
        float _1867 = _1851 * _1863;
        _1855 = _1867;
    }
    float _1869 = _1855;
    if (_1847)
    {
        float _1871 = rsqrt(_1843);
        _1865 = _1871;
    }
    float _1873 = _1865;
    float _1875 = _1873;
    if (_1847)
    {
        float _1877 = _1869 * 0.15915493667125701904296875;
        _1857 = _1877;
    }
    float _1879 = _1857;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1883 = _1821;
    float _1885 = _1879;
    if (_1847)
    {
        float _1887 = _1879 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        _1883 = _1889;
    }
    float _1891 = _1883;
    float _1893 = precise::max(0.0, _1881);
    float _1895 = _1807;
    float _1897 = _1893;
    if (_1847)
    {
        float _1899 = _1879 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        _1895 = _1901;
    }
    float _1903 = _1895;
    float _1905 = -_1833;
    float _1907 = -_1893;
    float _1909 = fma(_1813, _1905, _1907);
    if (_1847)
    {
        float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1859 = _1911;
    }
    float _1913 = _1859;
    float _1915 = _1891;
    float _1917 = _1913;
    if (_1847)
    {
        float _1919 = fma(_1891, _1913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = _1921;
    if (!_1847)
    {
        _1917 = _1839;
    }
    float _1925 = _1917;
    float _1927 = _1925;
    if (_1847)
    {
        float _1929 = _1873 * _1921;
        _1539 = _1929;
    }
    float _1931 = _1539;
    if (!_1847)
    {
        _1875 = _1835;
    }
    float _1933 = _1875;
    float _1935 = _1933;
    float _1937 = _1903;
    if (_1847)
    {
        float _1939 = _1903 + (-1.0);
        _1897 = _1939;
    }
    float _1941 = _1897;
    float _1943 = _1941;
    if (_1847)
    {
        float _1945 = _1835 * _1931;
        _1935 = _1945;
    }
    float _1947 = _1935;
    if (!_1847)
    {
        _1923 = _1909;
    }
    float _1949 = _1923;
    float _1951 = _1949;
    if (_1847)
    {
        float _1953 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1953;
    }
    float _1955 = _1885;
    if (!_1847)
    {
        _1943 = _1837;
    }
    float _1957 = _1943;
    float _1959 = _1957;
    if (_1847)
    {
        float _1961 = _1837 * _1931;
        _1959 = _1961;
    }
    float _1963 = _1959;
    if (_1847)
    {
        float _1965 = _1947 * _1947;
        _1927 = _1965;
    }
    float _1967 = _1927;
    if (_1847)
    {
        float _1969 = fma(_1909, _1903, _1955);
        _1951 = _1969;
    }
    float _1971 = _1951;
    if (!_1847)
    {
        _1937 = _1841;
    }
    float _1973 = _1937;
    float _1975 = _1973;
    if (_1847)
    {
        float _1977 = _1963 * _1963;
        _1975 = _1977;
    }
    float _1979 = _1975;
    float _1981 = fma(_1971, _1971, _1967);
    float _1983 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1985 = _1981 + _1979;
    float _1987 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1989 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1983);
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1993 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1991);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = rsqrt(_1985);
    float _1999 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2001 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2003 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1987);
    float _2005 = -_1995;
    float _2007 = _2005 + 1.0;
    float _2009 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2011 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2001);
    float _2013 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2015 = abs(_2007);
    float _2017 = log2(_2015);
    float _2019 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _2021 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2011);
    float _2023 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2009);
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2029 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2033 = _1997 * _1947;
    float _2035 = _1997 * _1971;
    float _2037 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2025);
    float _2039 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2031);
    float _2041 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2043 = _1997 * _1963;
    float _2045 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2047 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2049 = -_2041;
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2049);
    float _2053 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2039);
    float _2055 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2057 = -_2045;
    float _2059 = fma(_2057, _1999, 1.0);
    float _2061 = -_2043;
    float _2063 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2051);
    float _2065 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2053);
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2069 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2071 = fma(_2063, -0.5, 0.5);
    float _2073 = exp2(_2055);
    float _2075 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2067);
    float _2077 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2069);
    float _2079 = fma(_2063, 0.5, 0.5);
    float _2081 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2075);
    float _2083 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2077);
    float _2085 = _2035 + 1.0;
    float _2087 = 1.0 / _2065;
    float _2089 = fma(_2079, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2091 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2081);
    float _2093 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2083);
    float _2095 = fma(_2079, _2089, -0.212114393711090087890625);
    float _2097 = log2(_2059);
    float _2099 = -_2035;
    float _2101 = fma(_2073, _2085, _2099);
    float _2103 = fma(_2079, _2095, 1.570728778839111328125);
    float _2105 = fma(_2101, 0.5, 0.5);
    float _2107 = sqrt(_2071);
    float _2109 = _2091 * _2087;
    float _2111 = _2093 * _2087;
    float _2113 = fma(_2109, 0.5, 0.5);
    float _2115 = fma(_2111, -0.5, 0.5);
    float _2117 = _2097 * 0.693147182464599609375;
    float _2119 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2121 = _2107 * 0.636619746685028076171875;
    float _2123 = -_2103;
    float _2125 = fma(_2121, _2123, 1.0);
    float3 _5952 = float3(_2113, _2115, _2119);
    float _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5952, float3(0.0), isnan(_5952)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5952, float3(0.0), isnan(_5952)), level(0.0)).x;
    float3 _5963 = float3(_2113, _2115, _2119);
    float4 _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5963, float3(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5963, float3(0.0), isnan(_5963)), level(0.0)).xyzw;
    float _2132 = _2130.x;
    float _2134 = _2130.y;
    float _2136 = _2130.z;
    float _2138 = _2130.w;
    float2 _5980 = float2(_2125, _2105);
    float3 _2142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5980, float2(0.0), isnan(_5980)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5980, float2(0.0), isnan(_5980)), level(0.0)).xyz;
    float _2144 = _2142.x;
    float _2146 = _2142.y;
    float _2148 = _2142.z;
    int _2150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2152 = _2150 != 0;
    float _2154 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2158 = _2156 != 0;
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2162 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2164 = isnan(_731);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2170 = _2166 || _2168;
    float _2172 = float(_2170);
    float _2174 = -_1075;
    float _2176 = _2174 + 1.0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2180 = _2178 != 0;
    float _2182 = -_1169;
    float _2184 = _2182 + 1.0;
    int _2186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2188 = _2186 != 0;
    float _2190 = -_2172;
    float _2192 = _2190 + 1.0;
    float _2194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2196 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2198 = isnan(_731);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2204 = _2200 || _2202;
    float _2206 = float(_2204);
    float _2208 = _2103;
    bool _2210 = _2152;
    if (_2152)
    {
        float _2212 = in.m_54.w;
        _2208 = _2212;
    }
    float _2214 = _2208;
    bool _2216 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2218 = isnan(_731);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    float _2228 = -_1239;
    float _2230 = _2228 + 1.0;
    float _2232 = _1219;
    if (_2158)
    {
        float _2234 = in.m_54.x;
        _2232 = _2234;
    }
    float _2236 = _2232;
    float _2238 = -_2206;
    float _2240 = _2238 + 1.0;
    float _2242 = _2206 * _2192;
    float _2244 = -_2226;
    float _2246 = _2244 + 1.0;
    float _2248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2250 = _2226 * _2240;
    float _2252 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2254 = -_1241;
    float _2256 = _2254 + 1.0;
    float _2258 = exp2(_2154);
    float _2260 = _2214;
    if (_2152)
    {
        float _2262 = _2214 * 3.1415927410125732421875;
        _2260 = _2262;
    }
    float _2264 = _2260;
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2152)
    {
        float _2268 = _2264 * 0.15915493667125701904296875;
        _1143 = _2268;
    }
    float _2270 = _1143;
    float _2272 = _2236;
    float _2274 = _2270;
    if (_2158)
    {
        float _2276 = _2236 * 3.1415927410125732421875;
        _2272 = _2276;
    }
    float _2278 = _2272;
    float _2280 = _1127;
    if (_2152)
    {
        float _2282 = _2270 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    float _2288 = -_2258;
    float _2290 = _2288 + 1.0;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2302 = 1.0 / _2294;
    if (!_2152)
    {
        _2274 = _197;
    }
    float _2304 = _2274;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2308 = _2306 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2310 = _2304;
    if (_2152)
    {
        bool _2312 = _2286 > 0.5;
        _1541 = _2312;
    }
    bool _2314 = _1541;
    float _2316 = 1.0 / _2298;
    if (_2152)
    {
        float _2318 = -_197;
        float _2320 = _2314 ? _2318 : _197;
        _2310 = _2320;
    }
    float _2322 = _2310;
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2326 = _2324 != 0;
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2336 = 1.0 / _2308;
    float _2338 = _2330 * _2302;
    float _2340 = _2330;
    if (_2158)
    {
        float _2342 = _2278 * 0.15915493667125701904296875;
        _2340 = _2342;
    }
    float _2344 = _2340;
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2348 = _731 + _2346;
    bool _2350 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2352 = isnan(_731);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    float _2362 = fma(_2338, _2348, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2364 = _2344;
    if (_2158)
    {
        float _2366 = _2344 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        _2364 = _2368;
    }
    float _2370 = _2364;
    float _2372 = _2360 * _2246;
    float _2374 = _2334 * _2316;
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2378 = _731 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2380;
    float _2384 = _2362 * _2372;
    float _2386 = -_2360;
    float _2388 = _2386 + 1.0;
    float _2390 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2394 = _2382 * _2336;
    float _2396 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2384);
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2400 = _731 + _2398;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2406 = _2402;
    if (_2158)
    {
        bool _2408 = _2370 > 0.5;
        _2210 = _2408;
    }
    bool _2410 = _2210;
    float _2412 = _1235 * (-0.15915493667125701904296875);
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2158)
    {
        _2406 = _201;
    }
    float _2418 = _2406;
    float _2420 = fma(_2394, _2400, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2424 = fma(_2390, _2250, _2396);
    float _2426 = _2418;
    if (_2158)
    {
        float _2428 = -_201;
        float _2430 = _2410 ? _2428 : _201;
        _2426 = _2430;
    }
    float _2432 = _2426;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2436 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2440 = _819 > 0.5;
    float _2442 = fma(_2420, _2242, _2424);
    float _2444 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2446 = _2322 + 0.5;
    float _2448 = -_201;
    int _2450 = _1011 ? as_type<int>(_2448) : as_type<int>(_201);
    float _2452 = _1231 * (-0.15915493667125701904296875);
    float _2454 = _2404 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2456 = _2432 + (-0.5);
    out.m_58.x = _2436;
    out.m_58.y = _2438;
    out.m_58.z = _2416;
    out.m_58.w = _2434;
    float _2458 = fma(_2444, _2446, _945);
    float _2460 = _2412 * 6.283185482025146484375;
    float _2462 = sin(_2460);
    float _2464 = -_931;
    float _2466 = _2464 + 1.0;
    float _2468 = -_197;
    int _2470 = _2440 ? as_type<int>(_2468) : as_type<int>(_197);
    float _2472 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2442);
    bool _2474 = _1747 > 0.0;
    bool _2476 = isnan(_1747);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(0.0);
    bool _2482 = _2478 || _2480;
    float _2484 = -_2466;
    float _2486 = fma(_2484, _2322, _2458);
    float _2488 = -_937;
    float _2490 = _2488 + 1.0;
    bool _2492 = !_2180;
    float _2494 = _2492 ? _197 : as_type<float>(_2470);
    float _2496 = _2412 * 6.283185482025146484375;
    float _2498 = cos(_2496);
    bool _2500 = _1809 <= 0.0;
    bool _2502 = !_2482;
    bool _2504 = _2500 || _2502;
    bool _2506 = !_2188;
    float _2508 = _2506 ? _201 : as_type<float>(_2450);
    float _2510 = -_2454;
    float _2512 = -_933;
    float _2514 = fma(_2510, _2456, _2512);
    float _2516 = _1247 * (-0.15915493667125701904296875);
    float _2518 = -_197;
    int _2520 = _935 ? as_type<int>(_2518) : as_type<int>(_197);
    float _2522 = _2452 * 6.283185482025146484375;
    float _2524 = sin(_2522);
    float _2526 = fma(_2490, _2432, _2514);
    float _2528 = _2508 * _2462;
    out.m_60.x = _2486;
    out.m_60.y = _2526;
    float _2530 = _2452 * 6.283185482025146484375;
    float _2532 = cos(_2530);
    bool _2534 = !_2326;
    float _2536 = _2534 ? _197 : as_type<float>(_2520);
    float _2538 = _2508 * _2498;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2546 = -_2528;
    float _2548 = fma(_2494, _2498, _2546);
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2552 = _2516 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _1493 * _2524;
    float _2558 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2562 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2564 = fma(_2494, _2462, _2538);
    float _2566 = _2548 + 0.5;
    float _2568 = _2516 * 6.283185482025146484375;
    float _2570 = cos(_2568);
    float _2572 = _1493 * _2532;
    float _2574 = -_2556;
    float _2576 = fma(_2536, _2532, _2574);
    out.m_62.x = _2550;
    out.m_62.y = _2558;
    out.m_62.z = _2560;
    out.m_62.w = _2562;
    float _2578 = _2564 + (-0.5);
    float _2580 = fma(_2536, _2524, _2572);
    float _2582 = fma(_2252, _2566, _849);
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2586 = _1017 * _2554;
    float _2588 = -_2266;
    float _2590 = -_1227;
    float _2592 = fma(_2588, _2578, _2590);
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2596 = _1017 * _2570;
    float _2598 = -_2586;
    float _2600 = fma(_1053, _2570, _2598);
    float _2602 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2604 = _2576 + 0.5;
    float _2606 = fma(_1053, _2554, _2596);
    float _2608 = _2580 + (-0.5);
    float _2610 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2614 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2616 = _2606 + (-0.5);
    float _2618 = fma(_2602, _2604, _1245);
    float _2620 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2610);
    float _2622 = -_2614;
    float _2624 = -_1173;
    float _2626 = fma(_2622, _2608, _2624);
    float _2628 = -_1237;
    float _2630 = _2628 + 1.0;
    float _2632 = -_1229;
    float _2634 = _2632 + 1.0;
    float _2636 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2638 = _2600 + 0.5;
    float _2640 = -_2630;
    float _2642 = fma(_2548, _2640, _2582);
    float _2644 = fma(_2564, _2634, _2592);
    float _2646 = -_2636;
    float _2648 = -_1253;
    float _2650 = fma(_2646, _2616, _2648);
    float _2652 = _1747 * _1809;
    float _2654 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2620);
    float _2656 = -_2176;
    float _2658 = fma(_2576, _2656, _2618);
    float _2660 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2662 = fma(_2580, _2184, _2626);
    float _2664 = _2652 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2666 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2654);
    float _2668 = fma(_2660, _2638, _1251);
    float _2670 = fma(_2606, _2256, _2650);
    out.m_64.x = _2642;
    out.m_64.y = _2644;
    out.m_64.z = _2658;
    out.m_64.w = _2662;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2674 = -_2230;
    float _2676 = fma(_2600, _2674, _2668);
    float _2678 = _2666 + _2065;
    out.m_45.x = _2672;
    float _2680 = _2678 * 0.5;
    out.m_66.x = _2676;
    out.m_66.y = _2670;
    float _2682 = -_2300;
    float _2684 = _2682 + 1.0;
    out.gl_Position.x = _2091;
    out.gl_Position.y = _2093;
    out.gl_Position.z = _2666;
    out.gl_Position.w = _2065;
    out.m_68.z = _2680;
    out.m_68.w = _2065;
    float _2686 = _2300 * _2127;
    float _2688 = _2138 * _2684;
    float _2690 = _2138 * _2686;
    float _2692 = _2148 * _2686;
    float _2694 = fma(_2144, _2690, _2132);
    float _2696 = fma(_2146, _2690, _2134);
    float _2698 = fma(_2138, _2692, _2136);
    out.m_70.x = _2694;
    out.m_70.y = _2696;
    out.m_70.z = _2698;
    out.m_70.w = _2688;
    if (!_2504)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2700 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2700;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _721 = false;
    bool _327 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2757 = as_type<float>(_105);
        out.gl_Position.z = _2757;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_143);
        out.gl_Position.z = _2827;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    if (!_159)
    {
        float _175 = _147 * _147;
        float _177 = _175 * 0.5;
        _173 = _177;
    }
    float _179 = _173;
    float _181 = _179;
    if (!_159)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_145) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_145) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_159;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _147 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _147);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _247 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _249 = _239 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _251 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].x, _245);
    float _253 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].y, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[8].z, _249);
    float _257 = _247;
    if (!_159)
    {
        _257 = _147;
    }
    float _259 = _257;
    float _261 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _251);
    bool _263 = !_159;
    float _265 = _259;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _147 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _265 = _285;
    }
    float _287 = _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].y, _253);
    float _293 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _255);
    float _295 = fma(_287, _161, _261);
    float _297 = fma(_287, _163, _291);
    float _299 = fma(_287, _165, _293);
    float _301 = fma(_295, _149, _167);
    float _303 = fma(_297, _149, _169);
    float _305 = fma(_299, _149, _171);
    bool _307 = !_289;
    float _325;
    if (!_307)
    {
        float _309 = in.m_54.x;
        float _311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _313 = _309 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _317 = _315 * _311;
        float _319 = floor(_317);
        float _321 = -_319;
        float _323 = _317 + _321;
        _325 = _323;
        _327 = true;
    }
    else
    {
        float _329 = float(_89);
        float _331 = 1.0 / _329;
        float _333 = _123 * _331;
        _325 = _333;
    }
    _327 = false;
    float _335 = _325;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _353 = 1.0 / _339;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _367 = 1.0 / _343;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = _335 + _369;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = 1.0 / _351;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _335 + _377;
    float _381 = _371 * _353;
    bool _383 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _385 = isnan(_335);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = _335 + _395;
    float _399 = 1.0 / _347;
    float _401 = _379 * _367;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = _335 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _409 = _335 + _407;
    float _411 = 1.0 / _357;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _335 + _413;
    float _417 = _415 * _375;
    bool _419 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _421 = isnan(_335);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _431;
    float _435 = 1.0 / _365;
    float _437 = _405 * _399;
    float _439 = -_393;
    float _441 = _439 + 1.0;
    bool _443 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _445 = isnan(_335);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = fma(_433, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _457 = _429 * _441;
    float _459 = -_429;
    float _461 = _459 + 1.0;
    float _463 = 1.0 / _361;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _467 = _335 + _465;
    float _469 = _409 * _411;
    bool _471 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_335);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _467 * _435;
    bool _485 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _487 = isnan(_335);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    bool _497 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _499 = isnan(_335);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -_495;
    float _511 = _509 + 1.0;
    float _513 = _495 * _461;
    float _515 = _397 * _463;
    float _517 = -_481;
    float _519 = _517 + 1.0;
    float _521 = _481 * _511;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _523;
    float _527 = -_507;
    float _529 = _527 + 1.0;
    float _531 = _507 * _519;
    bool _533 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_335);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = fma(_525, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _547 = _335 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _549 = isnan(_335);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = _453 * _529;
    float _565 = -_543;
    float _567 = _565 + 1.0;
    float _569 = -_453;
    float _571 = _569 + 1.0;
    float _573 = fma(_561, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = _557 * _567;
    float _581 = _543 * _571;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -_557;
    float _589 = _587 + 1.0;
    float _591 = _455 * _579;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = fma(_585, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _599;
    float _603 = _545 * _579;
    float _605 = fma(_595, _417, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _611 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _591);
    float _613 = fma(_601, _437, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _615 = fma(_577, _437, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _617 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _619 = fma(_573, _581, _611);
    float _621 = fma(_597, _581, _617);
    float _623 = fma(_609, _417, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_613, _563, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_615, _563, _621);
    float _637 = in.m_52.x;
    float _639 = in.m_52.y;
    float _641 = fma(_627, _515, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _643 = fma(_633, _515, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _649 = fma(_605, _531, _629);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = fma(_623, _531, _635);
    float _657 = fma(_647, _483, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _659;
    float _663 = fma(_641, _521, _649);
    float _665 = fma(_653, _483, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _667;
    float _671 = fma(_643, _521, _655);
    float _673 = fma(_661, _469, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _675 = fma(_657, _513, _663);
    float _677 = fma(_669, _469, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _679 = fma(_665, _513, _671);
    float _681 = fma(_673, _457, _675);
    float _683 = fma(_677, _457, _679);
    float _685 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[150].x, _681);
    float _687 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[150].y, _683);
    float _689 = _685 * _637;
    float _691 = _687 * _639;
    bool _693 = !_373;
    float _695 = _457;
    int _697 = as_type<int>(_661);
    int _699 = as_type<int>(_673);
    float _701 = _513;
    float _719;
    if (!_693)
    {
        float _703 = in.m_54.x;
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _707 = _703 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _711 = _709 * _705;
        float _713 = floor(_711);
        float _715 = -_713;
        float _717 = _711 + _715;
        _695 = _705;
        _719 = _717;
        _721 = true;
    }
    else
    {
        float _723 = float(_89);
        float _725 = 1.0 / _723;
        float _727 = _123 * _725;
        _719 = _727;
    }
    _721 = false;
    float _729 = _695;
    float _731 = _719;
    float _733 = in.m_54.z;
    float _735 = in.m_54.w;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _739 = _737 != 0;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[150].x;
    float _745 = _683;
    float _747 = _729;
    if (_739)
    {
        float _749 = in.m_54.x;
        float _751 = in.m_54.y;
        _743 = _749;
        _745 = _751;
    }
    float _753 = _743;
    float _755 = _745;
    if (_739)
    {
        _697 = 0;
    }
    int _757 = _697;
    int _759 = _757;
    if (_739)
    {
        _699 = 0;
    }
    int _761 = _699;
    float _763 = _733 * 2.0;
    float _765 = floor(_763);
    float _767 = _753;
    int _769 = _761;
    float _771 = _755;
    if (_739)
    {
        _701 = _753;
    }
    float _773 = _701;
    float _775 = _773;
    if (_739)
    {
        _747 = _755;
    }
    float _777 = _747;
    bool _779 = _765 >= 0.0;
    bool _781 = isnan(_765);
    bool _783 = _779 || _781;
    bool _785 = isnan(0.0);
    bool _787 = _783 || _785;
    bool _789 = _765 > 0.0;
    float _791 = _787 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _793 = _777;
    float _795 = _791;
    if (!_739)
    {
        float _797 = in.m_54.x;
        float _799 = in.m_54.y;
        float _801 = _797 * 3.1415927410125732421875;
        float _803 = _801 * 0.15915493667125701904296875;
        float _805 = _799 * 3.1415927410125732421875;
        float _807 = _805 * 0.15915493667125701904296875;
        float _809 = _803 * 6.283185482025146484375;
        float _811 = sin(_809);
        float _813 = _807 * 6.283185482025146484375;
        float _815 = sin(_813);
        _759 = 1;
        _767 = _797;
        _769 = 2;
        _775 = _811;
        _771 = _799;
        _793 = _815;
    }
    int _817 = _759;
    float _819 = _767;
    int _821 = _769;
    float _823 = _775;
    float _825 = _771;
    float _827 = _793;
    bool _829 = _817 != 1;
    float _831 = _819 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _833 = _819 + (-0.5);
    bool _835 = _821 != 2;
    float _837 = _819 * 2.0;
    float _839 = -_741;
    float _841 = fma(_831, 2.0, _839);
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _845 = _823 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _847 = -_123;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[76].x, _841);
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[93].z, _843);
    float _853 = floor(_837);
    float _855 = _825 + _819;
    float _857 = _825 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _859 = _855 + (-1.0);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _863 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = _825 * 2.0;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _871 = fma(_857, -2.0, _861);
    float _873 = floor(_865);
    int _875 = ~as_type<int>(_791);
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    float _881 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[93].w, _867);
    bool _883 = _853 > 0.0;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _887 = _853 >= 0.0;
    bool _889 = isnan(_853);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _827 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _899 = _853;
    float _901 = _857;
    int _903 = _879;
    float _905 = _845;
    float _907 = _897;
    float _909 = _865;
    if (!_829)
    {
        _899 = _733;
    }
    float _911 = _899;
    float _913 = -_869;
    float _915 = fma(_845, 2.0, _913);
    float _917 = _911;
    if (!_829)
    {
        _901 = _825;
    }
    float _919 = _901;
    float _921 = fma(_897, -2.0, _885);
    float _923 = _919;
    if (!_789)
    {
        int _925 = ~as_type<int>(_791);
        int _927 = _925 + 1;
        _903 = _927;
    }
    int _929 = _903;
    float _931 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _851);
    float _933 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _921);
    bool _935 = _733 > 0.5;
    float _937 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _881);
    float _939 = 0.0;
    if (!_829)
    {
        _939 = _819;
    }
    float _941 = _939;
    float _943 = -_123;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[91].x, _915);
    float _947 = _941;
    if (!_829)
    {
        _905 = _919;
    }
    float _949 = _905;
    float _951 = _691 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = _949;
    if (!_829)
    {
        _795 = _911;
    }
    float _955 = _795;
    float _957 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _959 = _955;
    if (_829)
    {
        _953 = _819;
    }
    float _961 = _953;
    if (_829)
    {
        _923 = _819;
    }
    float _963 = _923;
    if (_829)
    {
        _947 = _733;
    }
    float _965 = _947;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_829)
    {
        _959 = _825;
    }
    float _969 = _959;
    if (_829)
    {
        _917 = _825;
    }
    float _971 = _917;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _983 = _981 != 0;
    if (_835)
    {
        _907 = _825;
    }
    float _985 = _907;
    float _987 = _985;
    if (_835)
    {
        _909 = _819;
    }
    float _989 = _909;
    float _991 = 0.0;
    float _993 = _989;
    if (_835)
    {
        _991 = _733;
    }
    float _995 = _991;
    float _997 = -_201;
    int _999 = _935 ? as_type<int>(_997) : as_type<int>(_201);
    float _1001 = _995;
    if (!_835)
    {
        _987 = _819;
    }
    float _1003 = _987;
    if (!_835)
    {
        _993 = _733;
    }
    float _1005 = _993;
    if (!_835)
    {
        _1001 = _825;
    }
    float _1007 = _1001;
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1011 = _825 > 0.5;
    int _1013 = _895 ? 0 : 1;
    bool _1015 = !_983;
    float _1017 = _1015 ? _201 : as_type<float>(_999);
    bool _1019 = _873 > 0.0;
    bool _1021 = _873 >= 0.0;
    bool _1023 = isnan(_873);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    float _1031 = -_197;
    int _1033 = _1011 ? as_type<int>(_1031) : as_type<int>(_197);
    int _1035 = ~_1013;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _1039;
    if (!_883)
    {
        int _1043 = ~_1013;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1051 = !_979;
    float _1053 = _1051 ? _197 : as_type<float>(_1033);
    int _1055 = _1029 ? 0 : 1;
    float _1057 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1059 = log2(_1057);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1049);
    float _1075 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1073);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1081 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1077);
    bool _1083 = !_1063;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = _969 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1089 = float(_929);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1093 = abs(_1085);
    float _1095 = fma(_1087, -2.0, _1079);
    float _1097 = _1059 * _123;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1101 = float(_1093);
    float _1103 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1107 = fma(_1009, -2.0, _1091);
    float _1109 = exp2(_1097);
    float _1111 = _1101 * _1089;
    float _1113 = -_1099;
    float _1115 = fma(_1103, 2.0, _1113);
    float _1117 = in.m_56.x;
    float _1119 = in.m_56.y;
    float _1121 = in.m_56.z;
    float _1123 = -_1105;
    float _1125 = fma(_967, 2.0, _1123);
    float _1127 = _1111 * (-2.0);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1131 = 1.0 + _1129;
    int _1133 = ~_1055;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    int _1141 = _1137;
    float _1143 = _1115;
    if (!_1019)
    {
        int _1145 = ~_1055;
        int _1147 = _1145 + 1;
        _1141 = _1147;
    }
    int _1149 = _1141;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _1153 = !_1067;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = 1.0 / _1131;
    float _1159 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1139);
    float _1161 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1151);
    float _1163 = -_1109;
    float _1165 = _1163 + 1.0;
    int _1167 = abs(_1155);
    float _1169 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1081);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1173 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1095);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1179 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1181 = isnan(1.0);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1187 = _1183 || _1185;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1193 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1195 = isnan(0.0);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1201 = _1197 || _1199;
    float _1203 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1171);
    bool _1205 = !_1071;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1175);
    float _1211 = float(_1047);
    float _1213 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1189);
    float _1215 = float(_1167);
    float _1217 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1191);
    float _1219 = _1201 ? _1165 : 0.0;
    float _1221 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1177);
    int _1223 = abs(_1207);
    float _1225 = fma(_1127, _1117, _1117);
    float _1227 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _871);
    float _1229 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1203);
    float _1231 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1159);
    float _1233 = _1215 * _1211;
    float _1235 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1209);
    float _1237 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1221);
    float _1239 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1213);
    float _1241 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1217);
    float _1243 = -_123;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1125);
    float _1247 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1161);
    float _1249 = -_123;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1115);
    float _1253 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1107);
    float _1255 = fma(_863, _1127, _863);
    if (_1187)
    {
        float _1257 = _1219 * _1157;
        _125 = _1257;
    }
    float _1259 = _125;
    float _1261 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1225);
    float _1263 = _825 + _733;
    float _1265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1267 = float(_1149);
    float _1269 = fma(_1255, _1259, _1261);
    float _1271 = float(_1223);
    float _1273 = _1263 + (-1.0);
    float _1275 = _1233 * (-2.0);
    float _1277 = _1269 * 0.15915493667125701904296875;
    float _1279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1281 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1283 = _1271 * _1267;
    float _1285 = _825 + (-0.5);
    float _1287 = fma(_1275, _1119, _1119);
    float _1289 = _733 + _819;
    float _1291 = fma(_1281, _1275, _1281);
    float _1293 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1287);
    float _1295 = _1289 + (-1.0);
    float _1297 = _1283 * (-2.0);
    float _1299 = _733 + (-0.5);
    float _1301 = fma(_1291, _1259, _1293);
    float _1303 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1305 = fma(_1297, _1121, _1121);
    float _1307 = _1277 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _1301 * 0.15915493667125701904296875;
    float _1313 = fma(_1303, _1297, _1303);
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1305);
    float _1317 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1319 = _951 * _1265;
    float _1321 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1323 = fma(_1313, _1259, _1315);
    float _1325 = _1277 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1331 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1317);
    float _1333 = _1323 * 0.15915493667125701904296875;
    float _1335 = _957 * _1279;
    float _1337 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1321);
    float _1339 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1329);
    bool _1341 = _735 > 0.5;
    float _1343 = _1311 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = -_201;
    float _1359 = _1341 ? _1357 : _201;
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = _1311 * 6.283185482025146484375;
    float _1373 = cos(_1371);
    float _1375 = _1333 * 6.283185482025146484375;
    float _1377 = cos(_1375);
    float _1379 = _1309 * _1345;
    float _1381 = _1327 * _1345;
    float _1383 = _1333 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = _1327 * _1373;
    float _1389 = _1309 * _1373;
    float _1391 = _1377 * _1319;
    float _1393 = _1345 * _1377;
    float _1395 = _1373 * _1377;
    float _1397 = _1327 * _1391;
    float _1399 = _1309 * _1391;
    float _1401 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1331);
    float _1403 = fma(_1385, _1387, _1379);
    float _1405 = -_1381;
    float _1407 = fma(_1385, _1389, _1405);
    float _1409 = -_1389;
    float _1411 = fma(_1385, _1381, _1409);
    float _1413 = -_1319;
    float _1415 = _1385 * _1413;
    float _1417 = fma(_1403, _1335, _1397);
    float _1419 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1421 = fma(_1385, _1379, _1387);
    float _1423 = fma(_1395, _1335, _1415);
    float _1425 = fma(_1407, _1335, _1399);
    float _1427 = fma(_1411, _1419, _1417);
    float _1429 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1337);
    float _1431 = fma(_1393, _1419, _1423);
    float _1433 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1339);
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1437 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1439 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1441 = fma(_1421, _1419, _1425);
    float _1443 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1435);
    float _1445 = _1429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1447 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1439);
    float _1451 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1443);
    float _1453 = _1433 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1449);
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1461 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1463 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1455);
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1467 = _1453 + _1459;
    float _1469 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1461);
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1473 = _1445 + _1465;
    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1477 = _1467 + _1475;
    float _1479 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1469);
    float _1481 = 1.0 / _1471;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1485 = _1473 + _1483;
    float _1487 = _1477 * _1477;
    float _1489 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1491 = !_975;
    float _1493 = _1491 ? _201 : _1359;
    float _1495 = fma(_1485, _1485, _1487);
    float _1497 = _1489 + _1471;
    float _1499 = _1427 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1501 = sqrt(_1495);
    float _1503 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1499);
    float _1505 = _1497 * _1481;
    float _1507 = _1505 * 0.5;
    float _1509 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1503);
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1513 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1511);
    float _1515 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1517 = _1437 + _1515;
    bool _1519 = _1501 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1521 = 1.0 / _1513;
    float _1523 = _1359;
    float _1525 = _1507;
    float _1527 = _1515;
    float _1529 = _1499;
    float _1531 = _1501;
    float _1533 = _1473;
    float _1535 = _1477;
    float _1537 = _1485;
    float _1539 = _1311;
    bool _1541 = _1355;
    if (!_1519)
    {
        _1523 = _1473;
    }
    float _1543 = _1523;
    float _1545 = _1543;
    if (!_1519)
    {
        _1525 = _1467;
    }
    float _1547 = _1525;
    float _1549 = _1547;
    if (!_1519)
    {
        _1527 = _1517;
    }
    float _1551 = _1527;
    bool _1553 = !_1519;
    float _1555 = _1551;
    if (!_1553)
    {
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1561 = _1501 + _1559;
        float _1563 = rsqrt(_1495);
        float _1565 = _1561 * _1557;
        float _1567 = _1517 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1569 = _1565 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1569 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = fma(_1573, _1567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1581 = _1563 * _1579;
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1485, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1587 = fma(_1477, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1589 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = fma(_1517, _1577, _1589);
        _1555 = _1591;
        _1549 = _1587;
        _1545 = _1585;
        _1529 = _1589;
        _1531 = _1569;
    }
    float _1593 = _1555;
    float _1595 = _1549;
    float _1597 = _1545;
    float _1599 = _1529;
    float _1601 = _1531;
    float _1603 = _1599;
    float _1605 = _1597;
    float _1607 = _1595;
    float _1609 = _1601;
    if (_1369)
    {
        _1533 = 1.0;
    }
    float _1611 = _1533;
    float _1613 = _1611;
    if (_1355)
    {
        _1535 = _1593;
    }
    float _1615 = _1535;
    float _1617 = _1615;
    if (_1355)
    {
        _1537 = _1595;
    }
    float _1619 = _1537;
    float _1621 = _1619;
    if (!_1355)
    {
        float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1625 = _1437 + _1623;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1629 = _1445 + _1627;
        float _1631 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1633 = -_1445;
        float _1635 = _1633 + _1597;
        float _1637 = _1625 * _1625;
        float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1641 = _1453 + _1639;
        float _1643 = -_1437;
        float _1645 = _1643 + _1593;
        float _1647 = -_1453;
        float _1649 = _1647 + _1595;
        float _1651 = fma(_1629, _1629, _1637);
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1655 = fma(_1641, _1641, _1651);
        float _1657 = sqrt(_1655);
        float _1659 = _1631 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1661 = precise::min(_1657, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1663 = _1661 * _1653;
        float _1665 = _1659 * _1663;
        float _1667 = fma(_1635, _1665, _1445);
        float _1669 = fma(_1645, _1665, _1437);
        float _1671 = fma(_1649, _1665, _1453);
        _1603 = _1661;
        _1617 = _1669;
        _1605 = _1667;
        _1621 = _1671;
        _1607 = _1649;
    }
    float _1673 = _1603;
    float _1675 = _1617;
    float _1677 = _1605;
    float _1679 = _1621;
    float _1681 = _1607;
    float _1683 = _1673;
    float _1685 = _1681;
    if (_1369)
    {
        _1609 = 1.0;
    }
    float _1687 = _1609;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1691 = _1521 * _1689;
    float _1693 = _1687;
    if (!_1369)
    {
        float _1695 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1701 = _1697 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        float _1705 = _1699 * 0.15915493667125701904296875;
        float _1707 = _1697 * 6.283185482025146484375;
        float _1709 = sin(_1707);
        float _1711 = 1.0 / _1703;
        float _1713 = _1705 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = _1709 * _1711;
        float _1719 = _1705 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1715 * _1717;
        float _1725 = 1.0 / _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1729 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1727;
        float _1731 = 1.0 / _1729;
        float _1733 = _1721 * _1725;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = fma(_1691, _1733, _1735);
        float _1739 = _1737 * _1731;
        float _1741 = precise::clamp(_1739, 0.0, 1.0);
        _1683 = _1697;
        _1685 = _1705;
        _1613 = _1741;
    }
    float _1743 = _1683;
    float _1745 = _1685;
    float _1747 = _1613;
    float _1749 = _1743;
    float _1751 = _1745;
    if (!_1369)
    {
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1755 = _1753 * 0.15915493667125701904296875;
        float _1757 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1759 = _1755 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1757 * 0.15915493667125701904296875;
        float _1765 = _1755 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1761;
        float _1771 = _1763 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1763 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1781;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1785;
        float _1789 = 1.0 / _1787;
        float _1791 = _1779 * _1783;
        float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1795 = fma(_1691, _1791, _1793);
        float _1797 = _1795 * _1789;
        float _1799 = precise::clamp(_1797, 0.0, 1.0);
        float _1801 = -_1799;
        float _1803 = _1801 + 1.0;
        _1749 = _1769;
        _1751 = _1783;
        _1693 = _1803;
    }
    float _1805 = _1749;
    float _1807 = _1751;
    float _1809 = _1693;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1813 = _1675 + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1817 = _1677 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1821 = _1679 + _1819;
    float _1823 = _1813 * _1813;
    float _1825 = fma(_1817, _1817, _1823);
    float _1827 = fma(_1821, _1821, _1825);
    float _1829 = rsqrt(_1827);
    float _1831 = sqrt(_1827);
    float _1833 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1835 = _1817 * _1833;
    float _1837 = _1821 * _1833;
    float _1839 = _1835 * _1835;
    float _1841 = _1837 * _1837;
    float _1843 = _1839 + _1841;
    float _1845 = sqrt(_1843);
    bool _1847 = _1845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1851 = _1845 + _1849;
    float _1853 = _1829;
    float _1855 = _1851;
    float _1857 = _1805;
    float _1859 = _1813;
    if (_1847)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1853 = _1861;
    }
    float _1863 = _1853;
    float _1865 = _1863;
    if (_1847)
    {
        float _1867 = _1851 * _1863;
        _1855 = _1867;
    }
    float _1869 = _1855;
    if (_1847)
    {
        float _1871 = rsqrt(_1843);
        _1865 = _1871;
    }
    float _1873 = _1865;
    float _1875 = _1873;
    if (_1847)
    {
        float _1877 = _1869 * 0.15915493667125701904296875;
        _1857 = _1877;
    }
    float _1879 = _1857;
    float _1881 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1883 = _1821;
    float _1885 = _1879;
    if (_1847)
    {
        float _1887 = _1879 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        _1883 = _1889;
    }
    float _1891 = _1883;
    float _1893 = precise::max(0.0, _1881);
    float _1895 = _1807;
    float _1897 = _1893;
    if (_1847)
    {
        float _1899 = _1879 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        _1895 = _1901;
    }
    float _1903 = _1895;
    float _1905 = -_1833;
    float _1907 = -_1893;
    float _1909 = fma(_1813, _1905, _1907);
    if (_1847)
    {
        float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1859 = _1911;
    }
    float _1913 = _1859;
    float _1915 = _1891;
    float _1917 = _1913;
    if (_1847)
    {
        float _1919 = fma(_1891, _1913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = _1921;
    if (!_1847)
    {
        _1917 = _1839;
    }
    float _1925 = _1917;
    float _1927 = _1925;
    if (_1847)
    {
        float _1929 = _1873 * _1921;
        _1539 = _1929;
    }
    float _1931 = _1539;
    if (!_1847)
    {
        _1875 = _1835;
    }
    float _1933 = _1875;
    float _1935 = _1933;
    float _1937 = _1903;
    if (_1847)
    {
        float _1939 = _1903 + (-1.0);
        _1897 = _1939;
    }
    float _1941 = _1897;
    float _1943 = _1941;
    if (_1847)
    {
        float _1945 = _1835 * _1931;
        _1935 = _1945;
    }
    float _1947 = _1935;
    if (!_1847)
    {
        _1923 = _1909;
    }
    float _1949 = _1923;
    float _1951 = _1949;
    if (_1847)
    {
        float _1953 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1953;
    }
    float _1955 = _1885;
    if (!_1847)
    {
        _1943 = _1837;
    }
    float _1957 = _1943;
    float _1959 = _1957;
    if (_1847)
    {
        float _1961 = _1837 * _1931;
        _1959 = _1961;
    }
    float _1963 = _1959;
    if (_1847)
    {
        float _1965 = _1947 * _1947;
        _1927 = _1965;
    }
    float _1967 = _1927;
    if (_1847)
    {
        float _1969 = fma(_1909, _1903, _1955);
        _1951 = _1969;
    }
    float _1971 = _1951;
    if (!_1847)
    {
        _1937 = _1841;
    }
    float _1973 = _1937;
    float _1975 = _1973;
    if (_1847)
    {
        float _1977 = _1963 * _1963;
        _1975 = _1977;
    }
    float _1979 = _1975;
    float _1981 = fma(_1971, _1971, _1967);
    float _1983 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1985 = _1981 + _1979;
    float _1987 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1989 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1983);
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1993 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1991);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = rsqrt(_1985);
    float _1999 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2001 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2003 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1987);
    float _2005 = -_1995;
    float _2007 = _2005 + 1.0;
    float _2009 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2011 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2001);
    float _2013 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2015 = abs(_2007);
    float _2017 = log2(_2015);
    float _2019 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _2021 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2011);
    float _2023 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2009);
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2029 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2033 = _1997 * _1947;
    float _2035 = _1997 * _1971;
    float _2037 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2025);
    float _2039 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2031);
    float _2041 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2043 = _1997 * _1963;
    float _2045 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2047 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2049 = -_2041;
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2049);
    float _2053 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2039);
    float _2055 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2057 = -_2045;
    float _2059 = fma(_2057, _1999, 1.0);
    float _2061 = -_2043;
    float _2063 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2051);
    float _2065 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2053);
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2069 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2071 = fma(_2063, -0.5, 0.5);
    float _2073 = exp2(_2055);
    float _2075 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2067);
    float _2077 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2069);
    float _2079 = fma(_2063, 0.5, 0.5);
    float _2081 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2075);
    float _2083 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2077);
    float _2085 = _2035 + 1.0;
    float _2087 = 1.0 / _2065;
    float _2089 = fma(_2079, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2091 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2081);
    float _2093 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2083);
    float _2095 = fma(_2079, _2089, -0.212114393711090087890625);
    float _2097 = log2(_2059);
    float _2099 = -_2035;
    float _2101 = fma(_2073, _2085, _2099);
    float _2103 = fma(_2079, _2095, 1.570728778839111328125);
    float _2105 = fma(_2101, 0.5, 0.5);
    float _2107 = sqrt(_2071);
    float _2109 = _2091 * _2087;
    float _2111 = _2093 * _2087;
    float _2113 = fma(_2109, 0.5, 0.5);
    float _2115 = fma(_2111, -0.5, 0.5);
    float _2117 = _2097 * 0.693147182464599609375;
    float _2119 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2121 = _2107 * 0.636619746685028076171875;
    float _2123 = -_2103;
    float _2125 = fma(_2121, _2123, 1.0);
    float3 _5952 = float3(_2113, _2115, _2119);
    float _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5952, float3(0.0), isnan(_5952)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5952, float3(0.0), isnan(_5952)), level(0.0)).x;
    float3 _5963 = float3(_2113, _2115, _2119);
    float4 _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5963, float3(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5963, float3(0.0), isnan(_5963)), level(0.0)).xyzw;
    float _2132 = _2130.x;
    float _2134 = _2130.y;
    float _2136 = _2130.z;
    float _2138 = _2130.w;
    float2 _5980 = float2(_2125, _2105);
    float3 _2142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5980, float2(0.0), isnan(_5980)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5980, float2(0.0), isnan(_5980)), level(0.0)).xyz;
    float _2144 = _2142.x;
    float _2146 = _2142.y;
    float _2148 = _2142.z;
    int _2150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2152 = _2150 != 0;
    float _2154 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2158 = _2156 != 0;
    float _2160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2162 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2164 = isnan(_731);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2170 = _2166 || _2168;
    float _2172 = float(_2170);
    float _2174 = -_1075;
    float _2176 = _2174 + 1.0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2180 = _2178 != 0;
    float _2182 = -_1169;
    float _2184 = _2182 + 1.0;
    int _2186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2188 = _2186 != 0;
    float _2190 = -_2172;
    float _2192 = _2190 + 1.0;
    float _2194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2196 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2198 = isnan(_731);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2204 = _2200 || _2202;
    float _2206 = float(_2204);
    float _2208 = _2103;
    bool _2210 = _2152;
    if (_2152)
    {
        float _2212 = in.m_54.w;
        _2208 = _2212;
    }
    float _2214 = _2208;
    bool _2216 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2218 = isnan(_731);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    float _2228 = -_1239;
    float _2230 = _2228 + 1.0;
    float _2232 = _1219;
    if (_2158)
    {
        float _2234 = in.m_54.x;
        _2232 = _2234;
    }
    float _2236 = _2232;
    float _2238 = -_2206;
    float _2240 = _2238 + 1.0;
    float _2242 = _2206 * _2192;
    float _2244 = -_2226;
    float _2246 = _2244 + 1.0;
    float _2248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2250 = _2226 * _2240;
    float _2252 = _2160 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2254 = -_1241;
    float _2256 = _2254 + 1.0;
    float _2258 = exp2(_2154);
    float _2260 = _2214;
    if (_2152)
    {
        float _2262 = _2214 * 3.1415927410125732421875;
        _2260 = _2262;
    }
    float _2264 = _2260;
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2152)
    {
        float _2268 = _2264 * 0.15915493667125701904296875;
        _1143 = _2268;
    }
    float _2270 = _1143;
    float _2272 = _2236;
    float _2274 = _2270;
    if (_2158)
    {
        float _2276 = _2236 * 3.1415927410125732421875;
        _2272 = _2276;
    }
    float _2278 = _2272;
    float _2280 = _1127;
    if (_2152)
    {
        float _2282 = _2270 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    float _2288 = -_2258;
    float _2290 = _2288 + 1.0;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2300 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2302 = 1.0 / _2294;
    if (!_2152)
    {
        _2274 = _197;
    }
    float _2304 = _2274;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2308 = _2306 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2310 = _2304;
    if (_2152)
    {
        bool _2312 = _2286 > 0.5;
        _1541 = _2312;
    }
    bool _2314 = _1541;
    float _2316 = 1.0 / _2298;
    if (_2152)
    {
        float _2318 = -_197;
        float _2320 = _2314 ? _2318 : _197;
        _2310 = _2320;
    }
    float _2322 = _2310;
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2326 = _2324 != 0;
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2336 = 1.0 / _2308;
    float _2338 = _2330 * _2302;
    float _2340 = _2330;
    if (_2158)
    {
        float _2342 = _2278 * 0.15915493667125701904296875;
        _2340 = _2342;
    }
    float _2344 = _2340;
    float _2346 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2348 = _731 + _2346;
    bool _2350 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2352 = isnan(_731);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    float _2362 = fma(_2338, _2348, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2364 = _2344;
    if (_2158)
    {
        float _2366 = _2344 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        _2364 = _2368;
    }
    float _2370 = _2364;
    float _2372 = _2360 * _2246;
    float _2374 = _2334 * _2316;
    float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2378 = _731 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2380;
    float _2384 = _2362 * _2372;
    float _2386 = -_2360;
    float _2388 = _2386 + 1.0;
    float _2390 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2394 = _2382 * _2336;
    float _2396 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2384);
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2400 = _731 + _2398;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2406 = _2402;
    if (_2158)
    {
        bool _2408 = _2370 > 0.5;
        _2210 = _2408;
    }
    bool _2410 = _2210;
    float _2412 = _1235 * (-0.15915493667125701904296875);
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2416 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2158)
    {
        _2406 = _201;
    }
    float _2418 = _2406;
    float _2420 = fma(_2394, _2400, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2424 = fma(_2390, _2250, _2396);
    float _2426 = _2418;
    if (_2158)
    {
        float _2428 = -_201;
        float _2430 = _2410 ? _2428 : _201;
        _2426 = _2430;
    }
    float _2432 = _2426;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2436 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2440 = _819 > 0.5;
    float _2442 = fma(_2420, _2242, _2424);
    float _2444 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2446 = _2322 + 0.5;
    float _2448 = -_201;
    int _2450 = _1011 ? as_type<int>(_2448) : as_type<int>(_201);
    float _2452 = _1231 * (-0.15915493667125701904296875);
    float _2454 = _2404 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2456 = _2432 + (-0.5);
    out.m_58.x = _2436;
    out.m_58.y = _2438;
    out.m_58.z = _2416;
    out.m_58.w = _2434;
    float _2458 = fma(_2444, _2446, _945);
    float _2460 = _2412 * 6.283185482025146484375;
    float _2462 = sin(_2460);
    float _2464 = -_931;
    float _2466 = _2464 + 1.0;
    float _2468 = -_197;
    int _2470 = _2440 ? as_type<int>(_2468) : as_type<int>(_197);
    float _2472 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2442);
    bool _2474 = _1747 > 0.0;
    bool _2476 = isnan(_1747);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(0.0);
    bool _2482 = _2478 || _2480;
    float _2484 = -_2466;
    float _2486 = fma(_2484, _2322, _2458);
    float _2488 = -_937;
    float _2490 = _2488 + 1.0;
    bool _2492 = !_2180;
    float _2494 = _2492 ? _197 : as_type<float>(_2470);
    float _2496 = _2412 * 6.283185482025146484375;
    float _2498 = cos(_2496);
    bool _2500 = _1809 <= 0.0;
    bool _2502 = !_2482;
    bool _2504 = _2500 || _2502;
    bool _2506 = !_2188;
    float _2508 = _2506 ? _201 : as_type<float>(_2450);
    float _2510 = -_2454;
    float _2512 = -_933;
    float _2514 = fma(_2510, _2456, _2512);
    float _2516 = _1247 * (-0.15915493667125701904296875);
    float _2518 = -_197;
    int _2520 = _935 ? as_type<int>(_2518) : as_type<int>(_197);
    float _2522 = _2452 * 6.283185482025146484375;
    float _2524 = sin(_2522);
    float _2526 = fma(_2490, _2432, _2514);
    float _2528 = _2508 * _2462;
    out.m_60.x = _2486;
    out.m_60.y = _2526;
    float _2530 = _2452 * 6.283185482025146484375;
    float _2532 = cos(_2530);
    bool _2534 = !_2326;
    float _2536 = _2534 ? _197 : as_type<float>(_2520);
    float _2538 = _2508 * _2498;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2546 = -_2528;
    float _2548 = fma(_2494, _2498, _2546);
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2552 = _2516 * 6.283185482025146484375;
    float _2554 = sin(_2552);
    float _2556 = _1493 * _2524;
    float _2558 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2562 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2564 = fma(_2494, _2462, _2538);
    float _2566 = _2548 + 0.5;
    float _2568 = _2516 * 6.283185482025146484375;
    float _2570 = cos(_2568);
    float _2572 = _1493 * _2532;
    float _2574 = -_2556;
    float _2576 = fma(_2536, _2532, _2574);
    out.m_62.x = _2550;
    out.m_62.y = _2558;
    out.m_62.z = _2560;
    out.m_62.w = _2562;
    float _2578 = _2564 + (-0.5);
    float _2580 = fma(_2536, _2524, _2572);
    float _2582 = fma(_2252, _2566, _849);
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2586 = _1017 * _2554;
    float _2588 = -_2266;
    float _2590 = -_1227;
    float _2592 = fma(_2588, _2578, _2590);
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2596 = _1017 * _2570;
    float _2598 = -_2586;
    float _2600 = fma(_1053, _2570, _2598);
    float _2602 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2604 = _2576 + 0.5;
    float _2606 = fma(_1053, _2554, _2596);
    float _2608 = _2580 + (-0.5);
    float _2610 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2614 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2616 = _2606 + (-0.5);
    float _2618 = fma(_2602, _2604, _1245);
    float _2620 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2610);
    float _2622 = -_2614;
    float _2624 = -_1173;
    float _2626 = fma(_2622, _2608, _2624);
    float _2628 = -_1237;
    float _2630 = _2628 + 1.0;
    float _2632 = -_1229;
    float _2634 = _2632 + 1.0;
    float _2636 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2638 = _2600 + 0.5;
    float _2640 = -_2630;
    float _2642 = fma(_2548, _2640, _2582);
    float _2644 = fma(_2564, _2634, _2592);
    float _2646 = -_2636;
    float _2648 = -_1253;
    float _2650 = fma(_2646, _2616, _2648);
    float _2652 = _1747 * _1809;
    float _2654 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2620);
    float _2656 = -_2176;
    float _2658 = fma(_2576, _2656, _2618);
    float _2660 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2662 = fma(_2580, _2184, _2626);
    float _2664 = _2652 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2666 = fma(_2047, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2654);
    float _2668 = fma(_2660, _2638, _1251);
    float _2670 = fma(_2606, _2256, _2650);
    out.m_64.x = _2642;
    out.m_64.y = _2644;
    out.m_64.z = _2658;
    out.m_64.w = _2662;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2674 = -_2230;
    float _2676 = fma(_2600, _2674, _2668);
    float _2678 = _2666 + _2065;
    out.m_45.x = _2672;
    float _2680 = _2678 * 0.5;
    out.m_66.x = _2676;
    out.m_66.y = _2670;
    float _2682 = -_2300;
    float _2684 = _2682 + 1.0;
    out.gl_Position.x = _2091;
    out.gl_Position.y = _2093;
    out.gl_Position.z = _2666;
    out.gl_Position.w = _2065;
    out.m_68.z = _2680;
    out.m_68.w = _2065;
    float _2686 = _2300 * _2127;
    float _2688 = _2138 * _2684;
    float _2690 = _2138 * _2686;
    float _2692 = _2148 * _2686;
    float _2694 = fma(_2144, _2690, _2132);
    float _2696 = fma(_2146, _2690, _2134);
    float _2698 = fma(_2138, _2692, _2136);
    out.m_70.x = _2694;
    out.m_70.y = _2696;
    out.m_70.z = _2698;
    out.m_70.w = _2688;
    if (!_2504)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2700 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2700;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

