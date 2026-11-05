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
    float4 m_62 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_70 [[user(locn9)]];
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _773 = false;
    bool _621 = false;
    bool _507 = false;
    bool _305 = false;
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
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_93)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3437 = as_type<float>(_103);
        out.gl_Position.z = _3437;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_89);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
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
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3507 = as_type<float>(_143);
        out.gl_Position.z = _3507;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    float _179 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _181 = 0.0;
    float _183 = _179;
    if (!_157)
    {
        float _185 = _179 * _179;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_173;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_157)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_157;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _179 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _179);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_157;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _179 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _159, _267);
    float _275 = fma(_263, _161, _269);
    float _277 = fma(_263, _163, _271);
    float _279 = fma(_273, _147, _165);
    float _281 = fma(_275, _147, _167);
    float _283 = fma(_277, _147, _169);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_54.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_89);
        float _309 = 1.0 / _307;
        float _311 = _121 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _313 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _331;
    float _335 = in.m_52.x;
    float _337 = in.m_52.y;
    bool _339 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _341 = isnan(_313);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 1.0 / _325;
    bool _353 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _355 = 1.0 / _329;
    float _357 = 1.0 / _333;
    float _359 = _317 * _351;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _313 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = fma(_367, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = _363 * _355;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    bool _377 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _379 = isnan(_313);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = fma(_375, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = -_387;
    float _393 = _391 + 1.0;
    float _395 = _321 * _357;
    float _397 = -_349;
    float _399 = _397 + 1.0;
    bool _401 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_313);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _387 * _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _419 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _421 = isnan(_313);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = _411 * _393;
    float _433 = -_411;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _441 = fma(_417, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _429 * _435;
    float _445 = fma(_439, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -_429;
    float _449 = _447 + 1.0;
    float _451 = _369 * _443;
    float _453 = _389 * _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _467 = fma(_457, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _469 = fma(_461, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_445, _431, _463);
    float _473 = fma(_441, _431, _465);
    float _475 = fma(_467, _413, _471);
    float _477 = fma(_469, _413, _473);
    float _479 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[146].x, _475);
    float _481 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[146].y, _477);
    float _483 = _479 * _335;
    float _485 = _481 * _337;
    bool _487 = !_353;
    float _505;
    if (!_487)
    {
        float _489 = in.m_54.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _121 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _515 + _517;
    bool _521 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _523 = isnan(_515);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _533;
    bool _537 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _539 = isnan(_515);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _553;
    float _557 = 1.0 / _535;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _561 = _547 * _551;
    float _563 = -_547;
    float _565 = _563 + 1.0;
    float _567 = _519 * _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _569;
    float _573 = fma(_555, _567, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _575;
    float _579 = fma(_571, _567, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _581 = fma(_577, _567, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _583 = _573 * _561;
    float _585 = _579 * _561;
    float _587 = _581 * _561;
    float _589 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].x, _583);
    float _591 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].y, _587);
    float _593 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].z, _585);
    float _595 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].x, _589);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].y, _591);
    float _599 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].z, _593);
    bool _601 = !_559;
    float _619;
    if (!_601)
    {
        float _603 = in.m_54.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_89);
        float _625 = 1.0 / _623;
        float _627 = _121 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _641 = isnan(_629);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _667;
    bool _671 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_629);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _637;
    float _685 = -_649;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _629 + _689;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _695 = _665 * _687;
    float _697 = -_665;
    float _699 = _697 + 1.0;
    float _701 = 1.0 / _653;
    float _703 = _669 * _683;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _709 = fma(_703, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _711 = _707 * _701;
    float _713 = -_681;
    float _715 = _713 + 1.0;
    float _717 = _709 * _695;
    float _719 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _721 = fma(_711, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _723 = _649 * _715;
    float _725 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _717);
    float _727 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = fma(_721, _723, _725);
    float _733 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _731);
    float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _735 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _737;
    out.m_56.y = _729;
    out.m_56.z = _739;
    out.m_56.w = _741;
    bool _743 = !_693;
    float _767;
    float _769;
    float _771;
    if (!_743)
    {
        float _745 = in.m_54.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _749 = float(_89);
        float _751 = 1.0 / _749;
        float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _755 = _121 * _751;
        float _757 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _759 = _757 * _747;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = _749;
        _771 = _755;
        _773 = true;
    }
    else
    {
        float _775 = float(_89);
        float _777 = 1.0 / _775;
        float _779 = _121 * _777;
        _767 = _779;
        _769 = _775;
        _771 = _779;
    }
    _773 = false;
    float _781 = _767;
    float _783 = _769;
    float _785 = _771;
    float _787 = in.m_54.x;
    float _789 = in.m_54.y;
    float _791 = in.m_54.z;
    float _793 = in.m_54.w;
    float _795 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _797 = log2(_795);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _813 = _811 != 0;
    bool _815 = !_805;
    int _817 = _815 ? 0 : 1;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _821 = !_801;
    int _823 = _821 ? 0 : 1;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _827 = _797 * _121;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = exp2(_827);
    float _833 = _791 * 2.0;
    float _835 = _787 * 2.0;
    bool _837 = _789 > 0.5;
    float _839 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _841 = _791 > 0.5;
    float _843 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _845 = floor(_833);
    bool _847 = _789 > 0.5;
    float _849 = -_819;
    float _851 = fma(_839, 2.0, _849);
    int _853 = int(_847);
    int _855 = _841 ? 2 : 0;
    int _857 = _853 | _855;
    int _859 = _809 ? 4 : 0;
    int _861 = _857 | _859;
    int _863 = _813 ? 8 : 0;
    int _865 = _861 | _863;
    int _867 = false ? 16 : 0;
    int _869 = _865 | _867;
    int _871 = _837 ? 32 : 0;
    int _873 = _869 | _871;
    int _875 = false ? 64 : 0;
    int _877 = _873 | _875;
    int _879 = _877 & 32;
    float _881 = fma(_843, -2.0, _829);
    float _883 = -_193;
    int _885 = _847 ? as_type<int>(_883) : as_type<int>(_193);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _889 = -_197;
    int _891 = _841 ? as_type<int>(_889) : as_type<int>(_197);
    float _893 = floor(_835);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _897 = -_831;
    float _899 = _897 + 1.0;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _905 = _787 + (-0.5);
    bool _907 = _845 > 0.0;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _911 = _845 >= 0.0;
    bool _913 = isnan(_845);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _923 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[79].z, _909);
    int _925 = _919 ? 0 : 1;
    float _927 = _789 + _791;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _935 = _933 != 0;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _939 = ~_925;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    float _945 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[79].x, _923);
    float _947 = -_121;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _851);
    int _951 = _943;
    if (!_907)
    {
        int _953 = ~_925;
        int _955 = _953 + 1;
        _951 = _955;
    }
    int _957 = _951;
    float _959 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].w, _937);
    bool _961 = !_931;
    float _963 = _961 ? _193 : as_type<float>(_885);
    float _965 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _881);
    bool _967 = !_935;
    float _969 = _967 ? _197 : as_type<float>(_891);
    float _971 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _959);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _983 = _981 != 0;
    float _985 = _789 * 2.0;
    float _987 = _905 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _989 = _927 + (-1.0);
    bool _991 = !_975;
    int _993 = _991 ? 0 : 1;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _997 = _995 != 0;
    float _999 = floor(_985);
    bool _1001 = _893 >= 0.0;
    bool _1003 = isnan(_893);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan(0.0);
    bool _1009 = _1005 || _1007;
    int _1011 = abs(_993);
    int _1013 = _1009 ? 0 : 1;
    bool _1015 = _893 > 0.0;
    float _1017 = _789 + _787;
    int _1019 = ~_1013;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = float(_1011);
    float _1027 = _1017 + (-1.0);
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1031 = _1027;
    int _1033 = _1023;
    bool _1035 = _809;
    if (_997)
    {
        _1029 = _787;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_997)
    {
        _1039 = _791;
    }
    float _1041 = _1039;
    float _1043 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (!_997)
    {
        _1031 = _791;
    }
    float _1045 = _1031;
    float _1047 = _1045;
    if (_997)
    {
        _1047 = _789;
    }
    float _1049 = _1047;
    float _1051 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1015)
    {
        int _1053 = ~_1013;
        int _1055 = _1053 + 1;
        _1033 = _1055;
    }
    int _1057 = _1033;
    bool _1059 = _999 >= 0.0;
    bool _1061 = isnan(_999);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.0);
    bool _1067 = _1063 || _1065;
    float _1069 = -_825;
    float _1071 = fma(_1051, 2.0, _1069);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _903);
    int _1075 = _1067 ? 0 : 1;
    float _1077 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1079 = _999 > 0.0;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1083 = _999;
    if (!_997)
    {
        _1083 = _789;
    }
    float _1085 = _1083;
    float _1087 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1089 = int(_1087);
    float _1091 = _1085;
    if (_997)
    {
        _1091 = _787;
    }
    float _1093 = _1091;
    float _1095 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1077);
    int _1097 = ~_1075;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    float _1103 = -_121;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1071);
    float _1107 = 0.0;
    float _1109 = _1093;
    int _1111 = _1101;
    if (!_997)
    {
        _1107 = _791;
    }
    float _1113 = _1107;
    float _1115 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1081);
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1119 = _1113;
    if (_997)
    {
        _1109 = _789;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_997)
    {
        _1123 = _787;
    }
    float _1125 = _1123;
    float _1127 = -_887;
    float _1129 = fma(_1117, 2.0, _1127);
    float _1131 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1079)
    {
        int _1133 = ~_1075;
        int _1135 = _1133 + 1;
        _1111 = _1135;
    }
    int _1137 = _1111;
    float _1139 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1095);
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1143 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1131);
    float _1145 = float(_957);
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_997)
    {
        _1119 = _789;
    }
    float _1149 = _1119;
    float _1151 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    float _1153 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1155 = int(_1153);
    float _1157 = _1025 * _1145;
    float _1159 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1161 = -_1147;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = float(_1089);
    float _1167 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1175 = 1.0 + _1173;
    bool _1177 = !_979;
    int _1179 = _1177 ? 0 : 1;
    float _1181 = 1.0 / _1165;
    bool _1183 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1185 = isnan(0.0);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1191 = _1187 || _1189;
    float _1193 = fma(_1167, -2.0, _895);
    float _1195 = abs(_1171);
    float _1197 = abs(_1163);
    float _1199 = precise::max(_1195, _1197);
    float _1201 = _1171 * 0.0625;
    float _1203 = -_121;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1129);
    bool _1207 = _1199 >= 16.0;
    float _1209 = 1.0 / _1175;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1213 = _1191 ? _899 : 0.0;
    float _1215 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1073);
    bool _1217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1219 = isnan(1.0);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1225 = _1221 || _1223;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1229 = !_983;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1157 * (-2.0);
    int _1235 = abs(_1179);
    float _1237 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1227);
    float _1239 = float(_1155);
    float _1241 = fma(_1141, -2.0, _901);
    int _1243 = abs(_1231);
    float _1245 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1211);
    float _1247 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].z, _921);
    float _1249 = _1207 ? _1201 : _1171;
    float _1251 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1237);
    float _1253 = float(_1057);
    float _1255 = _1163;
    float _1257 = _1159;
    if (_1207)
    {
        float _1259 = _1163 * 0.0625;
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = float(_1235);
    float _1265 = _1239 * _121;
    float _1267 = _1181 * _121;
    float _1269 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1245);
    float _1271 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1247);
    float _1273 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1115);
    float _1275 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1193);
    float _1277 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1241);
    float _1279 = abs(_1249);
    bool _1281 = _1279 != 0.0;
    bool _1283 = isnan(_1279);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan(0.0);
    bool _1289 = _1285 || _1287;
    int _1291 = _1289 ? (-1) : 0;
    if (_1225)
    {
        float _1293 = _1213 * _1209;
        _125 = _1293;
    }
    float _1295 = _125;
    float _1297 = fma(_1043, _1233, _1043);
    float _1299 = _1263 * _1253;
    float _1301 = _791 + _787;
    float _1303 = abs(_1261);
    bool _1305 = _1303 == 0.0;
    bool _1307 = !_1289;
    bool _1309 = _1305 && _1307;
    float _1311 = fma(_1297, _1295, _987);
    float _1313 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1315 = _1301 + (-1.0);
    float _1317 = float(_1137);
    float _1319 = _1299 * (-2.0);
    float _1321 = float(_1243);
    float _1323 = _1311 * 0.15915493667125701904296875;
    bool _1325 = !_813;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = fma(_1313, _1319, _1313);
    float _1331 = abs(_1261);
    bool _1333 = _1331 == 0.0;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1337 = _791 + (-0.5);
    float _1339 = _1323 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1321 * _1317;
    float _1345 = _789 + (-0.5);
    bool _1347 = !_809;
    int _1349 = _1347 ? 0 : 1;
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1353 = _1343 * (-2.0);
    int _1355 = as_type<int>(_1337);
    if (_1309)
    {
        bool _1357 = as_type<int>(_1261) >= 0;
        _1035 = _1357;
    }
    bool _1359 = _1035;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1363 = _1323 * 6.283185482025146484375;
    float _1365 = cos(_1363);
    float _1367 = fma(_1335, _1353, _1335);
    if (_1309)
    {
        int _1369 = _1359 ? 0 : 1078530011;
        _1355 = _1369;
    }
    int _1371 = _1355;
    float _1373 = fma(_1329, _1295, _1361);
    float _1375 = fma(_1367, _1295, _1351);
    int _1377 = _1371;
    if (_1309)
    {
        int _1379 = int(0x80000000) & as_type<int>(_1249);
        int _1381 = _1371 | _1379;
        _1377 = _1381;
    }
    int _1383 = _1377;
    bool _1385 = !_1289;
    bool _1387 = _1385 && _1333;
    int _1389 = _1383;
    float _1391 = as_type<float>(_1383);
    float _1393 = _1365;
    if (!_1387)
    {
        float _1395 = abs(_1249);
        bool _1397 = _1395 != as_type<float>(0x7f800000u /* inf */);
        bool _1399 = isnan(_1395);
        bool _1401 = _1397 || _1399;
        bool _1403 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1405 = _1401 || _1403;
        float _1407 = abs(_1261);
        bool _1409 = _1407 == as_type<float>(0x7f800000u /* inf */);
        float _1411 = abs(_1261);
        bool _1413 = _1411 == as_type<float>(0x7f800000u /* inf */);
        bool _1415 = !_1405;
        bool _1417 = _1413 && _1415;
        if (_1417)
        {
            bool _1419 = as_type<int>(_1261) >= 0;
            _1291 = _1419 ? (-1) : 0;
        }
        int _1421 = _1291;
        if (_1417)
        {
            _1389 = 1075235812;
        }
        int _1423 = _1389;
        int _1425 = _1423;
        if (_1417)
        {
            int _1427 = ~_1421;
            int _1429 = (_1427 != 0) ? _1423 : 1061752795;
            _1425 = _1429;
        }
        int _1431 = _1425;
        float _1433 = as_type<float>(_1431);
        if (_1417)
        {
            int _1435 = int(0x80000000) & as_type<int>(_1249);
            int _1437 = _1431 | _1435;
            _1433 = as_type<float>(_1437);
        }
        float _1439 = _1433;
        bool _1441 = !_1405;
        bool _1443 = _1441 && _1409;
        _1391 = _1439;
        if (!_1443)
        {
            float _1445 = abs(_1249);
            float _1447 = abs(_1261);
            float _1449 = precise::max(_1445, _1447);
            float _1451 = abs(_1249);
            float _1453 = abs(_1261);
            float _1455 = precise::min(_1451, _1453);
            float _1457 = 1.0 / _1449;
            float _1459 = abs(_1249);
            float _1461 = abs(_1261);
            bool _1463 = _1459 > _1461;
            bool _1465 = as_type<int>(_1261) >= 0;
            float _1467 = _1455 * _1457;
            float _1469 = _1467 * _1467;
            float _1471 = _1469 + 11.33538818359375;
            float _1473 = fma(_1469, _1471, 28.84246826171875);
            float _1475 = fma(_1469, _1473, 19.6966705322265625);
            float _1477 = fma(_1469, -0.82336294651031494140625, -5.674867153167724609375);
            float _1479 = fma(_1469, _1477, -6.565555095672607421875);
            float _1481 = 1.0 / _1475;
            float _1483 = _1469 * _1479;
            float _1485 = abs(_1249);
            float _1487 = abs(_1261);
            float _1489 = _1485 + _1487;
            int _1491 = as_type<int>(_1249) & int(0x80000000);
            float _1493 = _1467 * _1483;
            bool _1495 = _1489 > as_type<float>(0x7f800000u /* inf */);
            bool _1497 = isnan(_1489);
            bool _1499 = _1495 || _1497;
            bool _1501 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1503 = _1499 || _1501;
            float _1505 = fma(_1493, _1481, _1467);
            float _1507 = _1505;
            _1391 = _1489;
            if (_1463)
            {
                float _1509 = -_1505;
                float _1511 = _1509 + 1.57079637050628662109375;
                _1507 = _1511;
            }
            float _1513 = _1507;
            int _1515 = as_type<int>(_1513);
            if (!_1465)
            {
                float _1517 = -_1513;
                float _1519 = _1517 + 3.1415927410125732421875;
                _1515 = as_type<int>(_1519);
            }
            int _1521 = _1515;
            if (!_1503)
            {
                int _1523 = _1491 | _1521;
                _1391 = as_type<float>(_1523);
            }
        }
    }
    float _1525 = _1391;
    float _1527 = -_1525;
    float _1529 = _1373 + _1527;
    float _1531 = _1375 * 0.15915493667125701904296875;
    float _1533 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1537 = _1529 * 0.15915493667125701904296875;
    float _1539 = _1531 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1545 = _1535 * _1533;
    float _1547 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1551 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1543);
    float _1553 = _1537 * 6.283185482025146484375;
    float _1555 = sin(_1553);
    float _1557 = _1549 * _1547;
    float _1559 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1551);
    float _1561 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1571 = _1567 || _1569;
    float _1573 = _1559 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1577 = isnan(0.5);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1583 = _1579 || _1581;
    float _1585 = _1537 * 6.283185482025146484375;
    float _1587 = cos(_1585);
    float _1589 = _1541 * _1545;
    float _1591 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1593 = _1341 * _1589;
    float _1595 = _1365 * _1589;
    float _1597 = _1531 * 6.283185482025146484375;
    float _1599 = sin(_1597);
    float _1601 = _1365 * _1555;
    float _1603 = _1341 * _1587;
    float _1605 = _1365 * _1587;
    float _1607 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1591);
    float _1609 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1607);
    float _1611 = -_1601;
    float _1613 = fma(_1599, _1603, _1611);
    float _1615 = -_1603;
    float _1617 = fma(_1599, _1601, _1615);
    float _1619 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_1613, _1557, _1593);
    float _1623 = _1341 * _1555;
    float _1625 = -_1545;
    float _1627 = _1599 * _1625;
    float _1629 = _1587 * _1541;
    float _1631 = _1555 * _1541;
    float _1633 = fma(_1599, _1623, _1605);
    float _1635 = 1.0 / _1619;
    float _1637 = fma(_1629, _1557, _1627);
    float _1639 = fma(_1599, _1605, _1623);
    float _1641 = fma(_1633, _1561, _1621);
    float _1643 = fma(_1631, _1561, _1637);
    float _1645 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1647 = _1147 + _1641;
    float _1649 = fma(_1639, _1557, _1595);
    float _1651 = _1159 + _1643;
    float _1653 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1645);
    float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1657 = _1647 + _1655;
    float _1659 = fma(_1617, _1561, _1649);
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1653);
    float _1667 = _1657 * _1657;
    float _1669 = _1573 + _1659;
    float _1671 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1673 = fma(_1663, _1663, _1667);
    float _1675 = _1671 + _1619;
    float _1677 = sqrt(_1673);
    float _1679 = _1675 * _1635;
    float _1681 = _1679 * 0.5;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1685 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1683);
    float _1687 = 1.0 / _1685;
    bool _1689 = _1677 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1691 = _1561;
    float _1693 = _1651;
    float _1695 = _1647;
    float _1697 = _1617;
    float _1699 = _1557;
    float _1701 = _1659;
    float _1703 = _1669;
    float _1705 = _1605;
    if (!_1689)
    {
        _1691 = _1669;
    }
    float _1707 = _1691;
    bool _1709 = !_1689;
    float _1711 = _1707;
    if (!_1709)
    {
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1717 = _1677 + _1715;
        float _1719 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = rsqrt(_1673);
        float _1723 = _1717 * _1713;
        float _1725 = _1723 * 0.15915493667125701904296875;
        float _1727 = _1725 * 6.283185482025146484375;
        float _1729 = cos(_1727);
        float _1731 = _1725 * 6.283185482025146484375;
        float _1733 = sin(_1731);
        float _1735 = _1729 + (-1.0);
        float _1737 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1739 = fma(_1733, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1741 = fma(_1669, _1729, _1737);
        float _1743 = _1721 * _1739;
        float _1745 = fma(_1663, _1743, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1747 = fma(_1657, _1743, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1693 = _1745;
        _1695 = _1747;
        _1697 = _1737;
        _1711 = _1741;
        _1699 = _1725;
        _1393 = _1739;
        _1701 = _1743;
    }
    float _1749 = _1693;
    float _1751 = _1695;
    float _1753 = _1697;
    float _1755 = _1711;
    float _1757 = _1699;
    float _1759 = _1393;
    float _1761 = _1701;
    float _1763 = _1757;
    float _1765 = _1759;
    float _1767 = _1761;
    float _1769 = _1755;
    float _1771 = _1753;
    if (_1583)
    {
        _1763 = 1.0;
    }
    float _1773 = _1763;
    float _1775 = _1773;
    if (_1571)
    {
        _1765 = _1749;
    }
    float _1777 = _1765;
    float _1779 = _1777;
    if (_1571)
    {
        _1767 = _1751;
    }
    float _1781 = _1767;
    float _1783 = _1781;
    if (!_1571)
    {
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1787 = _1573 + _1785;
        float _1789 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1791 = -_1159;
        float _1793 = _1791 + _1749;
        float _1795 = -_1573;
        float _1797 = _1795 + _1755;
        float _1799 = _1787 * _1787;
        float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1803 = _1147 + _1801;
        float _1805 = -_1147;
        float _1807 = _1805 + _1751;
        float _1809 = fma(_1171, _1171, _1799);
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1813 = fma(_1803, _1803, _1809);
        float _1815 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1817 = sqrt(_1813);
        float _1819 = precise::min(_1817, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1821 = _1819 * _1811;
        float _1823 = _1815 * _1821;
        float _1825 = fma(_1793, _1823, _1159);
        float _1827 = fma(_1797, _1823, _1573);
        float _1829 = fma(_1807, _1823, _1147);
        _1703 = _1811;
        _1769 = _1827;
        _1779 = _1825;
        _1783 = _1829;
        _1771 = _1789;
    }
    float _1831 = _1703;
    float _1833 = _1769;
    float _1835 = _1779;
    float _1837 = _1783;
    float _1839 = _1771;
    float _1841 = _1839;
    float _1843 = _1831;
    if (_1583)
    {
        _1841 = 1.0;
    }
    float _1845 = _1841;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1849 = _1687 * _1847;
    float _1851 = _1845;
    if (!_1583)
    {
        float _1853 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1855 = _1853 * 0.15915493667125701904296875;
        float _1857 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1859 = _1855 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        float _1863 = _1857 * 0.15915493667125701904296875;
        float _1865 = _1855 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = 1.0 / _1861;
        float _1871 = _1863 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = _1863 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = 1.0 / _1881;
        float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1887 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1885;
        float _1889 = 1.0 / _1887;
        float _1891 = _1879 * _1883;
        float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1895 = fma(_1849, _1891, _1893);
        float _1897 = _1895 * _1889;
        float _1899 = precise::clamp(_1897, 0.0, 1.0);
        _1843 = _1855;
        _1257 = _1869;
        _1775 = _1899;
    }
    float _1901 = _1843;
    float _1903 = _1257;
    float _1905 = _1775;
    float _1907 = _1901;
    float _1909 = _1903;
    if (!_1583)
    {
        float _1911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1913 = _1911 * 0.15915493667125701904296875;
        float _1915 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = _1913 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1915 * 0.15915493667125701904296875;
        float _1923 = _1913 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = 1.0 / _1919;
        float _1929 = _1921 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = _1921 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = 1.0 / _1939;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1943;
        float _1947 = 1.0 / _1945;
        float _1949 = _1937 * _1941;
        float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1953 = fma(_1849, _1949, _1951);
        float _1955 = _1953 * _1947;
        float _1957 = precise::clamp(_1955, 0.0, 1.0);
        float _1959 = -_1957;
        float _1961 = _1959 + 1.0;
        _1907 = _1939;
        _1909 = _1913;
        _1851 = _1961;
    }
    float _1963 = _1907;
    float _1965 = _1909;
    float _1967 = _1851;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1971 = _1833 + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1975 = _1835 + _1973;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1979 = _1837 + _1977;
    bool _1981 = _879 != 0;
    float _1983 = _1971 * _1971;
    float _1985 = fma(_1975, _1975, _1983);
    float _1987 = fma(_1979, _1979, _1985);
    float _1989 = rsqrt(_1987);
    float _1991 = sqrt(_1987);
    float _1993 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1995 = _1975 * _1993;
    float _1997 = _1979 * _1993;
    float _1999 = _1995 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 + _2001;
    float _2005 = sqrt(_2003);
    bool _2007 = _2005 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = _2005 + _2009;
    float _2013 = _1963;
    float _2015 = _2003;
    float _2017 = _2011;
    float _2019 = _1971;
    if (_2007)
    {
        float _2021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2013 = _2021;
    }
    float _2023 = _2013;
    if (_2007)
    {
        float _2025 = rsqrt(_2003);
        _2015 = _2025;
    }
    float _2027 = _2015;
    float _2029 = _2023;
    float _2031 = _2027;
    if (_2007)
    {
        float _2033 = _2011 * _2023;
        _2017 = _2033;
    }
    float _2035 = _2017;
    if (_2007)
    {
        float _2037 = _2035 * 0.15915493667125701904296875;
        _2029 = _2037;
    }
    float _2039 = _2029;
    float _2041 = _1979;
    float _2043 = _2039;
    if (_2007)
    {
        float _2045 = _2039 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        _2041 = _2047;
    }
    float _2049 = _2041;
    float _2051 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2053 = precise::max(0.0, _2051);
    float _2055 = _1965;
    if (_2007)
    {
        float _2057 = _2039 * 6.283185482025146484375;
        float _2059 = cos(_2057);
        _2055 = _2059;
    }
    float _2061 = _2055;
    float _2063 = -_1993;
    float _2065 = -_2053;
    float _2067 = fma(_1971, _2063, _2065);
    float _2069 = _2067;
    if (_2007)
    {
        float _2071 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2019 = _2071;
    }
    float _2073 = _2019;
    float _2075 = _2049;
    float _2077 = _2073;
    if (_2007)
    {
        float _2079 = fma(_2049, _2073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2075 = _2079;
    }
    float _2081 = _2075;
    float _2083 = _2081;
    float _2085 = _2061;
    if (_2007)
    {
        float _2087 = _2061 + (-1.0);
        _2077 = _2087;
    }
    float _2089 = _2077;
    float _2091 = _2089;
    if (_2007)
    {
        float _2093 = _2027 * _2081;
        _1705 = _2093;
    }
    float _2095 = _1705;
    if (!_2007)
    {
        _2083 = _1995;
    }
    float _2097 = _2083;
    float _2099 = _2097;
    if (_2007)
    {
        float _2101 = _2089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2043 = _2101;
    }
    float _2103 = _2043;
    if (_2007)
    {
        float _2105 = _1995 * _2095;
        _2099 = _2105;
    }
    float _2107 = _2099;
    if (!_2007)
    {
        _2091 = _1997;
    }
    float _2109 = _2091;
    float _2111 = _2109;
    if (_2007)
    {
        float _2113 = _1997 * _2095;
        _2111 = _2113;
    }
    float _2115 = _2111;
    if (!_2007)
    {
        _2031 = _1999;
    }
    float _2117 = _2031;
    float _2119 = _2117;
    if (_2007)
    {
        float _2121 = fma(_2067, _2061, _2103);
        _2069 = _2121;
    }
    float _2123 = _2069;
    if (_2007)
    {
        float _2125 = _2107 * _2107;
        _2119 = _2125;
    }
    float _2127 = _2119;
    if (!_2007)
    {
        _2085 = _2001;
    }
    float _2129 = _2085;
    float _2131 = _2129;
    if (_2007)
    {
        float _2133 = _2115 * _2115;
        _2131 = _2133;
    }
    float _2135 = _2131;
    float _2137 = fma(_2123, _2123, _2127);
    float _2139 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2141 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2143 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = _2137 + _2135;
    float _2147 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2139);
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_1991, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2157 = rsqrt(_2145);
    float _2159 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2147);
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2155);
    float _2167 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2169 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2171 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2173 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2175 = abs(_2163);
    float _2177 = log2(_2175);
    float _2179 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2181 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2171);
    float _2183 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2167);
    float _2185 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = -_2179;
    float _2189 = fma(_2187, _2141, 1.0);
    float _2191 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2183);
    float _2195 = _2157 * _2107;
    float _2197 = _2157 * _2123;
    float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2201 = _2157 * _2115;
    float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2205 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2207 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2199);
    float _2209 = log2(_2189);
    float _2211 = -_2203;
    float _2213 = fma(_2197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2211);
    float _2215 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2217 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2207);
    float _2219 = -_2201;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2213);
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2217);
    float _2227 = exp2(_2215);
    float _2229 = fma(_2221, -0.5, 0.5);
    float _2231 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2233 = fma(_2221, 0.5, 0.5);
    float _2235 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2237 = _2197 + 1.0;
    float _2239 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2231);
    float _2241 = fma(_2233, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2243 = 1.0 / _2225;
    float _2245 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2235);
    float _2247 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2239);
    float _2249 = fma(_2233, _2241, -0.212114393711090087890625);
    float _2251 = _2209 * 0.693147182464599609375;
    float _2253 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2245);
    float _2255 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2247);
    float _2257 = sqrt(_2229);
    float _2259 = -_2197;
    float _2261 = fma(_2227, _2237, _2259);
    float _2263 = fma(_2233, _2249, 1.570728778839111328125);
    float _2265 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2267 = fma(_2261, 0.5, 0.5);
    float _2269 = _2253 * _2243;
    float _2271 = _2255 * _2243;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = fma(_2271, -0.5, 0.5);
    float _2277 = _2257 * 0.636619746685028076171875;
    float _2279 = -_2263;
    float _2281 = fma(_2277, _2279, 1.0);
    float3 _6780 = float3(_2273, _2275, _2265);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float3 _6791 = float3(_2273, _2275, _2265);
    float4 _2286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6791, float3(0.0), isnan(_6791)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6791, float3(0.0), isnan(_6791)), level(0.0)).xyzw;
    float _2288 = _2286.x;
    float _2290 = _2286.y;
    float _2292 = _2286.z;
    float _2294 = _2286.w;
    float2 _6808 = float2(_2281, _2267);
    float3 _2298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6808, float2(0.0), isnan(_6808)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6808, float2(0.0), isnan(_6808)), level(0.0)).xyz;
    float _2300 = _2298.x;
    float _2302 = _2298.y;
    float _2304 = _2298.z;
    float _2306 = float(uint(_1155));
    float _2308 = trunc(_1267);
    int _2310 = int(_2308);
    int _2312 = ~_1155;
    int _2314 = _2312 + 1;
    float _2316 = _945 * (-0.15915493667125701904296875);
    float _2318 = -_1251;
    float _2320 = _2318 + 1.0;
    float _2322 = -_971;
    float _2324 = _2322 + 1.0;
    float _2326 = 1.0 / _2306;
    bool _2328 = !_997;
    float _2330 = _2328 ? _789 : _787;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2336 = !_997;
    float _2338 = _2336 ? 1.2345600128173828125 : 1.0;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2340;
    bool _2344 = _793 > 0.5;
    float _2346 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2350 = _2348 != 0;
    float _2352 = _2338 * _2330;
    float _2354 = float(uint(_2310));
    float _2356 = 1.0 / _2334;
    float _2358 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2360 = -_197;
    int _2362 = _2344 ? as_type<int>(_2360) : as_type<int>(_197);
    float _2364 = -_197;
    int _2366 = _1981 ? as_type<int>(_2364) : as_type<int>(_197);
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _2372 = as_type<int>(_2326) + (-2);
    float _2374 = 1.0 / _2342;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2378 = _2376 != 0;
    float _2380 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2358);
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2384 = _2382 != 0;
    float _2386 = as_type<float>(_2372) * _2354;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2390 = _2388 != 0;
    float _2392 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    int _2394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2396 = _2394 != 0;
    float _2398 = trunc(_2386);
    float _2400 = precise::max(_2398, 0.0);
    uint _2403 = uint(_2400);
    bool _2405 = !_2350;
    float _2407 = _2405 ? _197 : as_type<float>(_2366);
    bool _2409 = _787 > 0.5;
    float _2411 = 1.0 / _2370;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2417 = !_2384;
    float _2419 = _2417 ? _197 : as_type<float>(_2362);
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2421;
    bool _2425 = _1155 == 0;
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _2431 = abs(_823);
    int _2433 = _2314 * int(_2403);
    int _2435 = _2433 + _2310;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2439 = _781 + _2437;
    float _2441 = _2423 * _2356;
    float _2443 = 1.0 / _2415;
    float _2445 = _2439 * _2374;
    float _2447 = float(uint(_2435));
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2451 = _2449 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _2453 = ~_1155;
    int _2455 = _2453 + 1;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2459 = _2457 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2461 = as_type<float>(_2372) * _2447;
    float _2463 = 1.0 / _2429;
    float _2465 = _2451 * _2411;
    float _2467 = trunc(_2461);
    float _2469 = precise::max(_2467, 0.0);
    uint _2471 = uint(_2469);
    float _2473 = 1.0 / _783;
    int _2475 = int(_2403) + int(_2471);
    float _2477 = _2316 * 6.283185482025146484375;
    float _2479 = sin(_2477);
    int _2481 = ~_1155;
    int _2483 = _2481 + 1;
    int _2485 = _2483 * _2475;
    int _2487 = _2485 + _2310;
    float _2489 = _1265 * _2473;
    float _2491 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2495 = _2316 * 6.283185482025146484375;
    float _2497 = cos(_2495);
    bool _2499 = uint(_2487) >= uint(_1155);
    bool _2501 = !_2499;
    int _2503 = _2501 ? 0 : (-1);
    float _2505 = floor(_2352);
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2509 = _2507 != 0;
    float _2511 = float(_2310);
    int _2513 = ~_2475;
    int _2515 = _2513 + _2503;
    int _2517 = _2515 + 1;
    bool _2519 = _2511 >= _1239;
    bool _2521 = isnan(_2511);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(_1239);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = 1.0 / _2459;
    int _2533 = _1155 * _2517;
    int _2535 = _2533 + _2310;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2545 = trunc(_2529);
    int _2547 = int(_2545);
    float _2549 = -_2505;
    float _2551 = _2352 + _2549;
    float _2553 = _2543 * _2463;
    bool _2555 = !_2425;
    int _2557 = _2555 ? _2535 : (-1);
    float _2559 = _2551 * _1239;
    float _2561 = _2539 * _2443;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _2567 = _1155 + (-1);
    float _2569 = trunc(_2489);
    int _2571 = int(_2569);
    float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2573;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _2581 = abs(_817);
    bool _2583 = !_2396;
    int _2585 = _2583 ? 0 : 1;
    float _2587 = _2579 * _2531;
    float _2589 = 1.0 / _2565;
    int _2591 = ~_2547;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = -_193;
    int _2599 = _841 ? as_type<int>(_2597) : as_type<int>(_193);
    bool _2601 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2603 = isnan(_785);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2609 = _2605 || _2607;
    float _2611 = float(_2609);
    int _2613 = _2557 * _2595;
    bool _2615 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2617 = isnan(_785);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = trunc(_2559);
    int _2629 = int(_2627);
    int _2631 = _2547 * _2567;
    int _2633 = _2631 + _2613;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2635;
    int _2639 = _2633 * _2581;
    float _2641 = _2637 * _2589;
    int _2643 = abs(_2585);
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2647 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2645;
    int _2649 = abs(_1349);
    float _2651 = 1.0 / _2493;
    float _2653 = fma(_2647, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2655 = -_193;
    int _2657 = _2409 ? as_type<int>(_2655) : as_type<int>(_193);
    int _2659 = _2629 * _2643;
    int _2661 = _2659 + _2310;
    bool _2663 = !_2378;
    float _2665 = _2663 ? _193 : as_type<float>(_2599);
    int _2667 = _2571 * _2431;
    int _2669 = _2667 + _2639;
    bool _2671 = !_2390;
    float _2673 = _2671 ? _193 : as_type<float>(_2657);
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2677 = _785 + _2675;
    int _2679 = _2661 * _2649;
    int _2681 = _2679 + _2669;
    int _2683 = abs(_1327);
    float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2687 = _785 + _2685;
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2689;
    float _2693 = fma(_2553, _2677, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _2695 = _2629 * _2683;
    int _2697 = _2695 + _2681;
    float _2699 = fma(_2441, _2687, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2701;
    float _2705 = fma(_2691, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2709 = _785 + _2707;
    float _2711 = float(uint(_2697));
    float _2713 = fma(_2703, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2717 = _785 + _2715;
    bool _2719 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2721 = isnan(_785);
    bool _2723 = _2719 || _2721;
    bool _2725 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2727 = _2723 || _2725;
    float _2729 = float(_2727);
    float _2731 = fma(_2561, _2709, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2733 = as_type<float>(_2372) * _2711;
    float _2735 = fma(_2465, _2717, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2737 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2739 = isnan(_785);
    bool _2741 = _2737 || _2739;
    bool _2743 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2745 = _2741 || _2743;
    float _2747 = float(_2745);
    float _2749 = -_2729;
    float _2751 = _2749 + 1.0;
    bool _2753 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2755 = isnan(_785);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    float _2765 = _2575 * _2651;
    float _2767 = trunc(_2733);
    float _2769 = precise::max(_2767, 0.0);
    uint _2771 = uint(_2769);
    float _2773 = -_2747;
    float _2775 = _2773 + 1.0;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2779 = _785 + _2777;
    bool _2781 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2783 = isnan(_785);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2789 = _2785 || _2787;
    float _2791 = float(_2789);
    float _2793 = -_2763;
    float _2795 = _2793 + 1.0;
    float _2797 = _2747 * _2751;
    float _2799 = _2763 * _2775;
    float _2801 = fma(_2765, _2779, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2803 = _2791 * _2795;
    bool _2805 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2807 = isnan(_785);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2611;
    float _2819 = _2817 + 1.0;
    bool _2821 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2823 = isnan(_785);
    bool _2825 = _2821 || _2823;
    bool _2827 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2829 = _2825 || _2827;
    float _2831 = float(_2829);
    float _2833 = -_2791;
    float _2835 = _2833 + 1.0;
    float _2837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2839 = _2815 * _2819;
    int _2841 = _2455 * int(_2771);
    int _2843 = _2841 + _2697;
    float _2845 = _2611 * _2835;
    bool _2847 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2849 = isnan(_781);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = float(uint(_2843));
    float _2861 = -_2815;
    float _2863 = _2861 + 1.0;
    bool _2865 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2867 = isnan(_781);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2879 = _785 + _2877;
    float _2881 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2883 = _785 + _2881;
    float _2885 = as_type<float>(_2372) * _2859;
    float _2887 = _2831 * _2863;
    float _2889 = -_2831;
    float _2891 = _2889 + 1.0;
    float _2893 = -_2875;
    float _2895 = _2893 + 1.0;
    float _2897 = trunc(_2885);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    float _2903 = fma(_2587, _2879, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2905 = _2625 * _2891;
    float _2907 = _2857 * _2895;
    float _2909 = -_2857;
    float _2911 = _2909 + 1.0;
    float _2913 = -_2625;
    float _2915 = _2913 + 1.0;
    float _2917 = _2699 * _2905;
    float _2919 = fma(_2641, _2883, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2921 = _2653 * _2907;
    float _2923 = _2705 * _2907;
    float _2925 = _2713 * _2907;
    float _2927 = fma(_2915, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2917);
    float _2929 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2921);
    float _2931 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2923);
    float _2933 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2925);
    float _2935 = _2407 * _2479;
    float _2937 = fma(_2735, _2887, _2927);
    int _2939 = ~_1155;
    int _2941 = _2939 + 1;
    float _2943 = _2407 * _2497;
    int _2945 = int(_2771) + int(_2901);
    float _2947 = -_2935;
    float _2949 = fma(_2673, _2497, _2947);
    float _2951 = float(uint(_2661));
    float _2953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2955 = _2837 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2957 = _963 + 0.5;
    int _2959 = _2941 * _2945;
    int _2961 = _2959 + _2697;
    float _2963 = as_type<float>(_2372) * _2951;
    int _2965 = ~_1155;
    int _2967 = _2965 + 1;
    float _2969 = fma(_2955, _2957, _1105);
    float _2971 = fma(_2673, _2479, _2943);
    float _2973 = trunc(_2963);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    bool _2979 = uint(_2961) >= uint(_1155);
    float _2981 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2931);
    float _2983 = _2949 + 0.5;
    float _2985 = fma(_2731, _2839, _2937);
    bool _2987 = !_2979;
    int _2989 = _2987 ? 0 : (-1);
    float _2991 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2929);
    float _2993 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2933);
    float _2995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2997 = ~_2945;
    int _2999 = _2997 + _2989;
    int _3001 = _2999 + 1;
    float _3003 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3005 = _2665 + 0.5;
    float _3007 = fma(_2693, _2845, _2985);
    float _3009 = fma(_3003, _2983, _949);
    int _3011 = _1155 * _3001;
    int _3013 = _3011 + _2697;
    float _3015 = fma(_3005, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1205);
    int _3017 = _2967 * int(_2977);
    int _3019 = _3017 + _2661;
    float _3021 = _2971 + (-0.5);
    float _3023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3025 = !_2425;
    int _3027 = _3025 ? _3013 : (-1);
    float _3029 = fma(_2801, _2803, _3007);
    float _3031 = float(uint(_3019));
    float _3033 = _2991 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3035 = _2995 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3037 = _2419 + (-0.5);
    float _3039 = as_type<float>(_2372) * _3031;
    int _3041 = _3027 >> 31;
    float _3043 = -_3035;
    float _3045 = -_965;
    float _3047 = fma(_3043, _3021, _3045);
    float _3049 = -_3037;
    float _3051 = -_1275;
    float _3053 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3051);
    float _3055 = _2981 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3057 = _3041 & 3;
    float _3059 = _2993 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3063 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3065 = _3027 + _3057;
    float _3067 = _969 + (-0.5);
    float _3069 = _3033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3071 = _3055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3073 = _3065 >> 2;
    float _3075 = -_3063;
    float _3077 = -_1277;
    float _3079 = fma(_3075, _3067, _3077);
    float _3081 = _3059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3083 = trunc(_3039);
    float _3085 = precise::max(_3083, 0.0);
    uint _3087 = uint(_3085);
    int _3089 = _3073 << 4;
    int _3091 = _3089 + 512;
    float _3093 = -_1273;
    float _3095 = _3093 + 1.0;
    int _3097 = _3027 & 3;
    bool _3099 = _3097 != 0;
    out.m_58.x = _3069;
    out.m_58.y = _3071;
    out.m_58.z = _3081;
    out.m_58.w = _3061;
    uint _3101 = uint(int(uint(_3091) >> uint(2)));
    uint _3103 = uint(int(uint(int(_3101)) >> uint(2)));
    int _3105 = int(_3101) & 3;
    float _3107 = (*spvDescriptorSet0.vp_c9)._m0[int(_3103)][_3105];
    int _3109 = int(_3101) + 1;
    uint _3111 = uint(int(uint(_3109) >> uint(2)));
    int _3113 = _3109 & 3;
    float _3115 = (*spvDescriptorSet0.vp_c9)._m0[int(_3111)][_3113];
    float _3117 = -_1269;
    float _3119 = _3117 + 1.0;
    int _3121 = _3027 & 3;
    bool _3123 = _3121 != 0;
    float _3125 = -_3095;
    float _3127 = fma(_2665, _3125, _3015);
    int _3129 = ~_1155;
    int _3131 = _3129 + 1;
    float _3133 = fma(_2903, _2799, _3029);
    bool _3135 = uint(_3121) > 1u;
    float _3137 = -_2320;
    float _3139 = fma(_2949, _3137, _3009);
    bool _3141 = uint(_3121) >= 2u;
    float _3143 = fma(_2971, _3119, _3047);
    float _3145 = fma(_969, _2324, _3079);
    int _3147 = int(_2977) + int(_3087);
    float _3149 = exp2(_2346);
    int _3151 = _3091 + 8;
    uint _3153 = uint(int(uint(_3151) >> uint(2)));
    uint _3155 = uint(int(uint(int(_3153)) >> uint(2)));
    int _3157 = int(_3153) & 3;
    float _3159 = (*spvDescriptorSet0.vp_c9)._m0[int(_3155)][_3157];
    int _3161 = int(_3153) + 1;
    uint _3163 = uint(int(uint(_3161) >> uint(2)));
    int _3165 = _3161 & 3;
    float _3167 = (*spvDescriptorSet0.vp_c9)._m0[int(_3163)][_3165];
    float _3169 = -_1271;
    float _3171 = _3169 + 1.0;
    float _3173 = -_1215;
    float _3175 = _3173 + 1.0;
    int _3177 = _3141 ? 0 : 1;
    float _3179 = fma(_2919, _2797, _3133);
    float _3181 = -_3171;
    float _3183 = fma(_963, _3181, _2969);
    int _3185 = _3131 * _3147;
    int _3187 = _3185 + _2661;
    int _3189 = _3099 ? 0 : 1;
    float _3191 = fma(_2419, _3175, _3053);
    bool _3193 = _3121 != 3;
    float _3195 = fma(_2729, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3179);
    bool _3197 = uint(_3187) >= uint(_1155);
    out.m_60.x = _3183;
    out.m_60.y = _3145;
    int _3199 = ~_3189;
    int _3201 = _3199 + 1;
    int _3203 = _3201 + 1;
    float _3205 = -_3149;
    float _3207 = _3205 + 1.0;
    int _3209 = _3203;
    if (!_3135)
    {
        int _3211 = ~_3189;
        int _3213 = _3211 + 1;
        _3209 = _3213;
    }
    int _3215 = _3209;
    out.m_62.x = _3139;
    out.m_62.y = _3143;
    out.m_62.z = _3127;
    out.m_62.w = _3191;
    bool _3217 = !_3123;
    int _3219 = _3217 ? 0 : 1;
    int _3221 = abs(_3215);
    out.m_64.x = _3195;
    bool _3223 = _3121 != 3;
    bool _3225 = !_3197;
    int _3227 = _3225 ? 0 : (-1);
    int _3229 = ~_3147;
    int _3231 = _3229 + _3227;
    int _3233 = _3231 + 1;
    int _3235 = ~_3177;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = abs(_3219);
    int _3243 = _1155 * _3233;
    int _3245 = _3243 + _2661;
    int _3247 = _3239;
    if (_3193)
    {
        int _3249 = ~_3177;
        int _3251 = _3249 + 1;
        _3247 = _3251;
    }
    int _3253 = _3247;
    bool _3255 = !_3223;
    int _3257 = _3255 ? 0 : (-1);
    int _3259 = abs(_3253);
    int _3261 = ~_3221;
    int _3263 = _3261 + 1;
    int _3265 = _3263 + 1;
    int _3267 = abs(_3257);
    int _3269 = ~_3241;
    int _3271 = _3269 + 1;
    int _3273 = _3271 + 1;
    int _3275 = _3265 * as_type<int>(_3115);
    bool _3277 = !_2509;
    int _3279 = _3277 ? 0 : 1;
    int _3281 = _3273 * as_type<int>(_3107);
    int _3283 = _3281 + _3275;
    int _3285 = ~_3259;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    int _3291 = abs(_3279);
    int _3293 = ~_3267;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    int _3299 = _3289 * as_type<int>(_3159);
    int _3301 = _3299 + _3283;
    float _3303 = _2225 * 0.5;
    float _3305 = _1905 * _1967;
    bool _3307 = _1905 > 0.0;
    bool _3309 = isnan(_1905);
    bool _3311 = _3307 || _3309;
    bool _3313 = isnan(0.0);
    bool _3315 = _3311 || _3313;
    int _3317 = _3297 * as_type<int>(_3167);
    int _3319 = _3317 + _3301;
    int _3321 = ~_3291;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    float _3327 = _3305 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3329 = !_2425;
    int _3331 = _3329 ? _3245 : (-1);
    bool _3333 = _1967 <= 0.0;
    bool _3335 = !_3315;
    bool _3337 = _3333 || _3335;
    int _3339 = _3319 * _3325;
    float _3341 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2392);
    float _3343 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3345 = _3331 * _3291;
    int _3347 = _3345 + _3339;
    float _3349 = fma(_2255, -0.5, _3303);
    float _3351 = _3341 + _2225;
    float _3353 = _2253 + _2225;
    out.gl_Position.x = _2253;
    out.gl_Position.y = _2255;
    out.gl_Position.z = _3341;
    out.gl_Position.w = _2225;
    float _3355 = float(_3347);
    float _3357 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3359 = _3351 * 0.5;
    float _3361 = _3353 * 0.5;
    float _3363 = _3357 * _2283;
    float _3365 = -_3357;
    float _3367 = _3365 + 1.0;
    out.m_45.x = _3343;
    float _3369 = _2294 * _3363;
    float _3371 = _2304 * _3363;
    out.m_66.x = _3361;
    out.m_66.y = _3349;
    out.m_66.z = _3359;
    out.m_66.w = _2225;
    float _3373 = fma(_2300, _3369, _2288);
    float _3375 = fma(_2302, _3369, _2290);
    float _3377 = _2294 * _3367;
    float _3379 = fma(_2294, _3371, _2292);
    out.m_68.y = _3355;
    out.m_70.x = _3373;
    out.m_70.y = _3375;
    out.m_70.z = _3379;
    out.m_70.w = _3377;
    if (!_3337)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3381 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3381;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _773 = false;
    bool _621 = false;
    bool _507 = false;
    bool _305 = false;
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
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_93)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3437 = as_type<float>(_103);
        out.gl_Position.z = _3437;
    }
    if (!_93)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_89);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
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
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3507 = as_type<float>(_143);
        out.gl_Position.z = _3507;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    float _179 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _181 = 0.0;
    float _183 = _179;
    if (!_157)
    {
        float _185 = _179 * _179;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_173;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_157)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_157;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _179 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _179);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_157;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _179 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _159, _267);
    float _275 = fma(_263, _161, _269);
    float _277 = fma(_263, _163, _271);
    float _279 = fma(_273, _147, _165);
    float _281 = fma(_275, _147, _167);
    float _283 = fma(_277, _147, _169);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_54.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_89);
        float _309 = 1.0 / _307;
        float _311 = _121 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _313 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _331;
    float _335 = in.m_52.x;
    float _337 = in.m_52.y;
    bool _339 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _341 = isnan(_313);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 1.0 / _325;
    bool _353 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _355 = 1.0 / _329;
    float _357 = 1.0 / _333;
    float _359 = _317 * _351;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _313 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = fma(_367, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = _363 * _355;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    bool _377 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _379 = isnan(_313);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = fma(_375, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = -_387;
    float _393 = _391 + 1.0;
    float _395 = _321 * _357;
    float _397 = -_349;
    float _399 = _397 + 1.0;
    bool _401 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_313);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _387 * _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _419 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _421 = isnan(_313);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = _411 * _393;
    float _433 = -_411;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _441 = fma(_417, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _429 * _435;
    float _445 = fma(_439, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -_429;
    float _449 = _447 + 1.0;
    float _451 = _369 * _443;
    float _453 = _389 * _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _467 = fma(_457, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _469 = fma(_461, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_445, _431, _463);
    float _473 = fma(_441, _431, _465);
    float _475 = fma(_467, _413, _471);
    float _477 = fma(_469, _413, _473);
    float _479 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[146].x, _475);
    float _481 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[146].y, _477);
    float _483 = _479 * _335;
    float _485 = _481 * _337;
    bool _487 = !_353;
    float _505;
    if (!_487)
    {
        float _489 = in.m_54.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _121 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _515 + _517;
    bool _521 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _523 = isnan(_515);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _533;
    bool _537 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _539 = isnan(_515);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _553;
    float _557 = 1.0 / _535;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _561 = _547 * _551;
    float _563 = -_547;
    float _565 = _563 + 1.0;
    float _567 = _519 * _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _569;
    float _573 = fma(_555, _567, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _575;
    float _579 = fma(_571, _567, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _581 = fma(_577, _567, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _583 = _573 * _561;
    float _585 = _579 * _561;
    float _587 = _581 * _561;
    float _589 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].x, _583);
    float _591 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].y, _587);
    float _593 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].z, _585);
    float _595 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].x, _589);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].y, _591);
    float _599 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].z, _593);
    bool _601 = !_559;
    float _619;
    if (!_601)
    {
        float _603 = in.m_54.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_89);
        float _625 = 1.0 / _623;
        float _627 = _121 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _641 = isnan(_629);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _667;
    bool _671 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_629);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _637;
    float _685 = -_649;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _629 + _689;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _695 = _665 * _687;
    float _697 = -_665;
    float _699 = _697 + 1.0;
    float _701 = 1.0 / _653;
    float _703 = _669 * _683;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _709 = fma(_703, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _711 = _707 * _701;
    float _713 = -_681;
    float _715 = _713 + 1.0;
    float _717 = _709 * _695;
    float _719 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _721 = fma(_711, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _723 = _649 * _715;
    float _725 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _717);
    float _727 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = fma(_721, _723, _725);
    float _733 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _731);
    float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _735 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _737;
    out.m_56.y = _729;
    out.m_56.z = _739;
    out.m_56.w = _741;
    bool _743 = !_693;
    float _767;
    float _769;
    float _771;
    if (!_743)
    {
        float _745 = in.m_54.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _749 = float(_89);
        float _751 = 1.0 / _749;
        float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _755 = _121 * _751;
        float _757 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _759 = _757 * _747;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = _749;
        _771 = _755;
        _773 = true;
    }
    else
    {
        float _775 = float(_89);
        float _777 = 1.0 / _775;
        float _779 = _121 * _777;
        _767 = _779;
        _769 = _775;
        _771 = _779;
    }
    _773 = false;
    float _781 = _767;
    float _783 = _769;
    float _785 = _771;
    float _787 = in.m_54.x;
    float _789 = in.m_54.y;
    float _791 = in.m_54.z;
    float _793 = in.m_54.w;
    float _795 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _797 = log2(_795);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _813 = _811 != 0;
    bool _815 = !_805;
    int _817 = _815 ? 0 : 1;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _821 = !_801;
    int _823 = _821 ? 0 : 1;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _827 = _797 * _121;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = exp2(_827);
    float _833 = _791 * 2.0;
    float _835 = _787 * 2.0;
    bool _837 = _789 > 0.5;
    float _839 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _841 = _791 > 0.5;
    float _843 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _845 = floor(_833);
    bool _847 = _789 > 0.5;
    float _849 = -_819;
    float _851 = fma(_839, 2.0, _849);
    int _853 = int(_847);
    int _855 = _841 ? 2 : 0;
    int _857 = _853 | _855;
    int _859 = _809 ? 4 : 0;
    int _861 = _857 | _859;
    int _863 = _813 ? 8 : 0;
    int _865 = _861 | _863;
    int _867 = false ? 16 : 0;
    int _869 = _865 | _867;
    int _871 = _837 ? 32 : 0;
    int _873 = _869 | _871;
    int _875 = false ? 64 : 0;
    int _877 = _873 | _875;
    int _879 = _877 & 32;
    float _881 = fma(_843, -2.0, _829);
    float _883 = -_193;
    int _885 = _847 ? as_type<int>(_883) : as_type<int>(_193);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _889 = -_197;
    int _891 = _841 ? as_type<int>(_889) : as_type<int>(_197);
    float _893 = floor(_835);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _897 = -_831;
    float _899 = _897 + 1.0;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _905 = _787 + (-0.5);
    bool _907 = _845 > 0.0;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _911 = _845 >= 0.0;
    bool _913 = isnan(_845);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _923 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[79].z, _909);
    int _925 = _919 ? 0 : 1;
    float _927 = _789 + _791;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _935 = _933 != 0;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _939 = ~_925;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    float _945 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[79].x, _923);
    float _947 = -_121;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _851);
    int _951 = _943;
    if (!_907)
    {
        int _953 = ~_925;
        int _955 = _953 + 1;
        _951 = _955;
    }
    int _957 = _951;
    float _959 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].w, _937);
    bool _961 = !_931;
    float _963 = _961 ? _193 : as_type<float>(_885);
    float _965 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _881);
    bool _967 = !_935;
    float _969 = _967 ? _197 : as_type<float>(_891);
    float _971 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _959);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _983 = _981 != 0;
    float _985 = _789 * 2.0;
    float _987 = _905 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _989 = _927 + (-1.0);
    bool _991 = !_975;
    int _993 = _991 ? 0 : 1;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _997 = _995 != 0;
    float _999 = floor(_985);
    bool _1001 = _893 >= 0.0;
    bool _1003 = isnan(_893);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan(0.0);
    bool _1009 = _1005 || _1007;
    int _1011 = abs(_993);
    int _1013 = _1009 ? 0 : 1;
    bool _1015 = _893 > 0.0;
    float _1017 = _789 + _787;
    int _1019 = ~_1013;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = float(_1011);
    float _1027 = _1017 + (-1.0);
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1031 = _1027;
    int _1033 = _1023;
    bool _1035 = _809;
    if (_997)
    {
        _1029 = _787;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_997)
    {
        _1039 = _791;
    }
    float _1041 = _1039;
    float _1043 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (!_997)
    {
        _1031 = _791;
    }
    float _1045 = _1031;
    float _1047 = _1045;
    if (_997)
    {
        _1047 = _789;
    }
    float _1049 = _1047;
    float _1051 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1015)
    {
        int _1053 = ~_1013;
        int _1055 = _1053 + 1;
        _1033 = _1055;
    }
    int _1057 = _1033;
    bool _1059 = _999 >= 0.0;
    bool _1061 = isnan(_999);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.0);
    bool _1067 = _1063 || _1065;
    float _1069 = -_825;
    float _1071 = fma(_1051, 2.0, _1069);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _903);
    int _1075 = _1067 ? 0 : 1;
    float _1077 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1079 = _999 > 0.0;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1083 = _999;
    if (!_997)
    {
        _1083 = _789;
    }
    float _1085 = _1083;
    float _1087 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1089 = int(_1087);
    float _1091 = _1085;
    if (_997)
    {
        _1091 = _787;
    }
    float _1093 = _1091;
    float _1095 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1077);
    int _1097 = ~_1075;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    float _1103 = -_121;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1071);
    float _1107 = 0.0;
    float _1109 = _1093;
    int _1111 = _1101;
    if (!_997)
    {
        _1107 = _791;
    }
    float _1113 = _1107;
    float _1115 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1081);
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1119 = _1113;
    if (_997)
    {
        _1109 = _789;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_997)
    {
        _1123 = _787;
    }
    float _1125 = _1123;
    float _1127 = -_887;
    float _1129 = fma(_1117, 2.0, _1127);
    float _1131 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1079)
    {
        int _1133 = ~_1075;
        int _1135 = _1133 + 1;
        _1111 = _1135;
    }
    int _1137 = _1111;
    float _1139 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1095);
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1143 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1131);
    float _1145 = float(_957);
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_997)
    {
        _1119 = _789;
    }
    float _1149 = _1119;
    float _1151 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    float _1153 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1155 = int(_1153);
    float _1157 = _1025 * _1145;
    float _1159 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1161 = -_1147;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = float(_1089);
    float _1167 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1175 = 1.0 + _1173;
    bool _1177 = !_979;
    int _1179 = _1177 ? 0 : 1;
    float _1181 = 1.0 / _1165;
    bool _1183 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1185 = isnan(0.0);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1191 = _1187 || _1189;
    float _1193 = fma(_1167, -2.0, _895);
    float _1195 = abs(_1171);
    float _1197 = abs(_1163);
    float _1199 = precise::max(_1195, _1197);
    float _1201 = _1171 * 0.0625;
    float _1203 = -_121;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1129);
    bool _1207 = _1199 >= 16.0;
    float _1209 = 1.0 / _1175;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1213 = _1191 ? _899 : 0.0;
    float _1215 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1073);
    bool _1217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1219 = isnan(1.0);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1225 = _1221 || _1223;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1229 = !_983;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1157 * (-2.0);
    int _1235 = abs(_1179);
    float _1237 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1227);
    float _1239 = float(_1155);
    float _1241 = fma(_1141, -2.0, _901);
    int _1243 = abs(_1231);
    float _1245 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1211);
    float _1247 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].z, _921);
    float _1249 = _1207 ? _1201 : _1171;
    float _1251 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1237);
    float _1253 = float(_1057);
    float _1255 = _1163;
    float _1257 = _1159;
    if (_1207)
    {
        float _1259 = _1163 * 0.0625;
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = float(_1235);
    float _1265 = _1239 * _121;
    float _1267 = _1181 * _121;
    float _1269 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1245);
    float _1271 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1247);
    float _1273 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1115);
    float _1275 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1193);
    float _1277 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1241);
    float _1279 = abs(_1249);
    bool _1281 = _1279 != 0.0;
    bool _1283 = isnan(_1279);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan(0.0);
    bool _1289 = _1285 || _1287;
    int _1291 = _1289 ? (-1) : 0;
    if (_1225)
    {
        float _1293 = _1213 * _1209;
        _125 = _1293;
    }
    float _1295 = _125;
    float _1297 = fma(_1043, _1233, _1043);
    float _1299 = _1263 * _1253;
    float _1301 = _791 + _787;
    float _1303 = abs(_1261);
    bool _1305 = _1303 == 0.0;
    bool _1307 = !_1289;
    bool _1309 = _1305 && _1307;
    float _1311 = fma(_1297, _1295, _987);
    float _1313 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1315 = _1301 + (-1.0);
    float _1317 = float(_1137);
    float _1319 = _1299 * (-2.0);
    float _1321 = float(_1243);
    float _1323 = _1311 * 0.15915493667125701904296875;
    bool _1325 = !_813;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = fma(_1313, _1319, _1313);
    float _1331 = abs(_1261);
    bool _1333 = _1331 == 0.0;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1337 = _791 + (-0.5);
    float _1339 = _1323 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1321 * _1317;
    float _1345 = _789 + (-0.5);
    bool _1347 = !_809;
    int _1349 = _1347 ? 0 : 1;
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1353 = _1343 * (-2.0);
    int _1355 = as_type<int>(_1337);
    if (_1309)
    {
        bool _1357 = as_type<int>(_1261) >= 0;
        _1035 = _1357;
    }
    bool _1359 = _1035;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1363 = _1323 * 6.283185482025146484375;
    float _1365 = cos(_1363);
    float _1367 = fma(_1335, _1353, _1335);
    if (_1309)
    {
        int _1369 = _1359 ? 0 : 1078530011;
        _1355 = _1369;
    }
    int _1371 = _1355;
    float _1373 = fma(_1329, _1295, _1361);
    float _1375 = fma(_1367, _1295, _1351);
    int _1377 = _1371;
    if (_1309)
    {
        int _1379 = int(0x80000000) & as_type<int>(_1249);
        int _1381 = _1371 | _1379;
        _1377 = _1381;
    }
    int _1383 = _1377;
    bool _1385 = !_1289;
    bool _1387 = _1385 && _1333;
    int _1389 = _1383;
    float _1391 = as_type<float>(_1383);
    float _1393 = _1365;
    if (!_1387)
    {
        float _1395 = abs(_1249);
        bool _1397 = _1395 != as_type<float>(0x7f800000u /* inf */);
        bool _1399 = isnan(_1395);
        bool _1401 = _1397 || _1399;
        bool _1403 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1405 = _1401 || _1403;
        float _1407 = abs(_1261);
        bool _1409 = _1407 == as_type<float>(0x7f800000u /* inf */);
        float _1411 = abs(_1261);
        bool _1413 = _1411 == as_type<float>(0x7f800000u /* inf */);
        bool _1415 = !_1405;
        bool _1417 = _1413 && _1415;
        if (_1417)
        {
            bool _1419 = as_type<int>(_1261) >= 0;
            _1291 = _1419 ? (-1) : 0;
        }
        int _1421 = _1291;
        if (_1417)
        {
            _1389 = 1075235812;
        }
        int _1423 = _1389;
        int _1425 = _1423;
        if (_1417)
        {
            int _1427 = ~_1421;
            int _1429 = (_1427 != 0) ? _1423 : 1061752795;
            _1425 = _1429;
        }
        int _1431 = _1425;
        float _1433 = as_type<float>(_1431);
        if (_1417)
        {
            int _1435 = int(0x80000000) & as_type<int>(_1249);
            int _1437 = _1431 | _1435;
            _1433 = as_type<float>(_1437);
        }
        float _1439 = _1433;
        bool _1441 = !_1405;
        bool _1443 = _1441 && _1409;
        _1391 = _1439;
        if (!_1443)
        {
            float _1445 = abs(_1249);
            float _1447 = abs(_1261);
            float _1449 = precise::max(_1445, _1447);
            float _1451 = abs(_1249);
            float _1453 = abs(_1261);
            float _1455 = precise::min(_1451, _1453);
            float _1457 = 1.0 / _1449;
            float _1459 = abs(_1249);
            float _1461 = abs(_1261);
            bool _1463 = _1459 > _1461;
            bool _1465 = as_type<int>(_1261) >= 0;
            float _1467 = _1455 * _1457;
            float _1469 = _1467 * _1467;
            float _1471 = _1469 + 11.33538818359375;
            float _1473 = fma(_1469, _1471, 28.84246826171875);
            float _1475 = fma(_1469, _1473, 19.6966705322265625);
            float _1477 = fma(_1469, -0.82336294651031494140625, -5.674867153167724609375);
            float _1479 = fma(_1469, _1477, -6.565555095672607421875);
            float _1481 = 1.0 / _1475;
            float _1483 = _1469 * _1479;
            float _1485 = abs(_1249);
            float _1487 = abs(_1261);
            float _1489 = _1485 + _1487;
            int _1491 = as_type<int>(_1249) & int(0x80000000);
            float _1493 = _1467 * _1483;
            bool _1495 = _1489 > as_type<float>(0x7f800000u /* inf */);
            bool _1497 = isnan(_1489);
            bool _1499 = _1495 || _1497;
            bool _1501 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1503 = _1499 || _1501;
            float _1505 = fma(_1493, _1481, _1467);
            float _1507 = _1505;
            _1391 = _1489;
            if (_1463)
            {
                float _1509 = -_1505;
                float _1511 = _1509 + 1.57079637050628662109375;
                _1507 = _1511;
            }
            float _1513 = _1507;
            int _1515 = as_type<int>(_1513);
            if (!_1465)
            {
                float _1517 = -_1513;
                float _1519 = _1517 + 3.1415927410125732421875;
                _1515 = as_type<int>(_1519);
            }
            int _1521 = _1515;
            if (!_1503)
            {
                int _1523 = _1491 | _1521;
                _1391 = as_type<float>(_1523);
            }
        }
    }
    float _1525 = _1391;
    float _1527 = -_1525;
    float _1529 = _1373 + _1527;
    float _1531 = _1375 * 0.15915493667125701904296875;
    float _1533 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1537 = _1529 * 0.15915493667125701904296875;
    float _1539 = _1531 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1545 = _1535 * _1533;
    float _1547 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1551 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1543);
    float _1553 = _1537 * 6.283185482025146484375;
    float _1555 = sin(_1553);
    float _1557 = _1549 * _1547;
    float _1559 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1551);
    float _1561 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1571 = _1567 || _1569;
    float _1573 = _1559 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1577 = isnan(0.5);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1583 = _1579 || _1581;
    float _1585 = _1537 * 6.283185482025146484375;
    float _1587 = cos(_1585);
    float _1589 = _1541 * _1545;
    float _1591 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1593 = _1341 * _1589;
    float _1595 = _1365 * _1589;
    float _1597 = _1531 * 6.283185482025146484375;
    float _1599 = sin(_1597);
    float _1601 = _1365 * _1555;
    float _1603 = _1341 * _1587;
    float _1605 = _1365 * _1587;
    float _1607 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1591);
    float _1609 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1607);
    float _1611 = -_1601;
    float _1613 = fma(_1599, _1603, _1611);
    float _1615 = -_1603;
    float _1617 = fma(_1599, _1601, _1615);
    float _1619 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_1613, _1557, _1593);
    float _1623 = _1341 * _1555;
    float _1625 = -_1545;
    float _1627 = _1599 * _1625;
    float _1629 = _1587 * _1541;
    float _1631 = _1555 * _1541;
    float _1633 = fma(_1599, _1623, _1605);
    float _1635 = 1.0 / _1619;
    float _1637 = fma(_1629, _1557, _1627);
    float _1639 = fma(_1599, _1605, _1623);
    float _1641 = fma(_1633, _1561, _1621);
    float _1643 = fma(_1631, _1561, _1637);
    float _1645 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1647 = _1147 + _1641;
    float _1649 = fma(_1639, _1557, _1595);
    float _1651 = _1159 + _1643;
    float _1653 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1645);
    float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1657 = _1647 + _1655;
    float _1659 = fma(_1617, _1561, _1649);
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1653);
    float _1667 = _1657 * _1657;
    float _1669 = _1573 + _1659;
    float _1671 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1673 = fma(_1663, _1663, _1667);
    float _1675 = _1671 + _1619;
    float _1677 = sqrt(_1673);
    float _1679 = _1675 * _1635;
    float _1681 = _1679 * 0.5;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1685 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1683);
    float _1687 = 1.0 / _1685;
    bool _1689 = _1677 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1691 = _1561;
    float _1693 = _1651;
    float _1695 = _1647;
    float _1697 = _1617;
    float _1699 = _1557;
    float _1701 = _1659;
    float _1703 = _1669;
    float _1705 = _1605;
    if (!_1689)
    {
        _1691 = _1669;
    }
    float _1707 = _1691;
    bool _1709 = !_1689;
    float _1711 = _1707;
    if (!_1709)
    {
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1717 = _1677 + _1715;
        float _1719 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = rsqrt(_1673);
        float _1723 = _1717 * _1713;
        float _1725 = _1723 * 0.15915493667125701904296875;
        float _1727 = _1725 * 6.283185482025146484375;
        float _1729 = cos(_1727);
        float _1731 = _1725 * 6.283185482025146484375;
        float _1733 = sin(_1731);
        float _1735 = _1729 + (-1.0);
        float _1737 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1739 = fma(_1733, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1741 = fma(_1669, _1729, _1737);
        float _1743 = _1721 * _1739;
        float _1745 = fma(_1663, _1743, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1747 = fma(_1657, _1743, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1693 = _1745;
        _1695 = _1747;
        _1697 = _1737;
        _1711 = _1741;
        _1699 = _1725;
        _1393 = _1739;
        _1701 = _1743;
    }
    float _1749 = _1693;
    float _1751 = _1695;
    float _1753 = _1697;
    float _1755 = _1711;
    float _1757 = _1699;
    float _1759 = _1393;
    float _1761 = _1701;
    float _1763 = _1757;
    float _1765 = _1759;
    float _1767 = _1761;
    float _1769 = _1755;
    float _1771 = _1753;
    if (_1583)
    {
        _1763 = 1.0;
    }
    float _1773 = _1763;
    float _1775 = _1773;
    if (_1571)
    {
        _1765 = _1749;
    }
    float _1777 = _1765;
    float _1779 = _1777;
    if (_1571)
    {
        _1767 = _1751;
    }
    float _1781 = _1767;
    float _1783 = _1781;
    if (!_1571)
    {
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1787 = _1573 + _1785;
        float _1789 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1791 = -_1159;
        float _1793 = _1791 + _1749;
        float _1795 = -_1573;
        float _1797 = _1795 + _1755;
        float _1799 = _1787 * _1787;
        float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1803 = _1147 + _1801;
        float _1805 = -_1147;
        float _1807 = _1805 + _1751;
        float _1809 = fma(_1171, _1171, _1799);
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1813 = fma(_1803, _1803, _1809);
        float _1815 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1817 = sqrt(_1813);
        float _1819 = precise::min(_1817, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1821 = _1819 * _1811;
        float _1823 = _1815 * _1821;
        float _1825 = fma(_1793, _1823, _1159);
        float _1827 = fma(_1797, _1823, _1573);
        float _1829 = fma(_1807, _1823, _1147);
        _1703 = _1811;
        _1769 = _1827;
        _1779 = _1825;
        _1783 = _1829;
        _1771 = _1789;
    }
    float _1831 = _1703;
    float _1833 = _1769;
    float _1835 = _1779;
    float _1837 = _1783;
    float _1839 = _1771;
    float _1841 = _1839;
    float _1843 = _1831;
    if (_1583)
    {
        _1841 = 1.0;
    }
    float _1845 = _1841;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1849 = _1687 * _1847;
    float _1851 = _1845;
    if (!_1583)
    {
        float _1853 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1855 = _1853 * 0.15915493667125701904296875;
        float _1857 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1859 = _1855 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        float _1863 = _1857 * 0.15915493667125701904296875;
        float _1865 = _1855 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = 1.0 / _1861;
        float _1871 = _1863 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = _1863 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = 1.0 / _1881;
        float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1887 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1885;
        float _1889 = 1.0 / _1887;
        float _1891 = _1879 * _1883;
        float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1895 = fma(_1849, _1891, _1893);
        float _1897 = _1895 * _1889;
        float _1899 = precise::clamp(_1897, 0.0, 1.0);
        _1843 = _1855;
        _1257 = _1869;
        _1775 = _1899;
    }
    float _1901 = _1843;
    float _1903 = _1257;
    float _1905 = _1775;
    float _1907 = _1901;
    float _1909 = _1903;
    if (!_1583)
    {
        float _1911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1913 = _1911 * 0.15915493667125701904296875;
        float _1915 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = _1913 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1915 * 0.15915493667125701904296875;
        float _1923 = _1913 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = 1.0 / _1919;
        float _1929 = _1921 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = _1921 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = 1.0 / _1939;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1943;
        float _1947 = 1.0 / _1945;
        float _1949 = _1937 * _1941;
        float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1953 = fma(_1849, _1949, _1951);
        float _1955 = _1953 * _1947;
        float _1957 = precise::clamp(_1955, 0.0, 1.0);
        float _1959 = -_1957;
        float _1961 = _1959 + 1.0;
        _1907 = _1939;
        _1909 = _1913;
        _1851 = _1961;
    }
    float _1963 = _1907;
    float _1965 = _1909;
    float _1967 = _1851;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1971 = _1833 + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1975 = _1835 + _1973;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1979 = _1837 + _1977;
    bool _1981 = _879 != 0;
    float _1983 = _1971 * _1971;
    float _1985 = fma(_1975, _1975, _1983);
    float _1987 = fma(_1979, _1979, _1985);
    float _1989 = rsqrt(_1987);
    float _1991 = sqrt(_1987);
    float _1993 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1995 = _1975 * _1993;
    float _1997 = _1979 * _1993;
    float _1999 = _1995 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 + _2001;
    float _2005 = sqrt(_2003);
    bool _2007 = _2005 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = _2005 + _2009;
    float _2013 = _1963;
    float _2015 = _2003;
    float _2017 = _2011;
    float _2019 = _1971;
    if (_2007)
    {
        float _2021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2013 = _2021;
    }
    float _2023 = _2013;
    if (_2007)
    {
        float _2025 = rsqrt(_2003);
        _2015 = _2025;
    }
    float _2027 = _2015;
    float _2029 = _2023;
    float _2031 = _2027;
    if (_2007)
    {
        float _2033 = _2011 * _2023;
        _2017 = _2033;
    }
    float _2035 = _2017;
    if (_2007)
    {
        float _2037 = _2035 * 0.15915493667125701904296875;
        _2029 = _2037;
    }
    float _2039 = _2029;
    float _2041 = _1979;
    float _2043 = _2039;
    if (_2007)
    {
        float _2045 = _2039 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        _2041 = _2047;
    }
    float _2049 = _2041;
    float _2051 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2053 = precise::max(0.0, _2051);
    float _2055 = _1965;
    if (_2007)
    {
        float _2057 = _2039 * 6.283185482025146484375;
        float _2059 = cos(_2057);
        _2055 = _2059;
    }
    float _2061 = _2055;
    float _2063 = -_1993;
    float _2065 = -_2053;
    float _2067 = fma(_1971, _2063, _2065);
    float _2069 = _2067;
    if (_2007)
    {
        float _2071 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2019 = _2071;
    }
    float _2073 = _2019;
    float _2075 = _2049;
    float _2077 = _2073;
    if (_2007)
    {
        float _2079 = fma(_2049, _2073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2075 = _2079;
    }
    float _2081 = _2075;
    float _2083 = _2081;
    float _2085 = _2061;
    if (_2007)
    {
        float _2087 = _2061 + (-1.0);
        _2077 = _2087;
    }
    float _2089 = _2077;
    float _2091 = _2089;
    if (_2007)
    {
        float _2093 = _2027 * _2081;
        _1705 = _2093;
    }
    float _2095 = _1705;
    if (!_2007)
    {
        _2083 = _1995;
    }
    float _2097 = _2083;
    float _2099 = _2097;
    if (_2007)
    {
        float _2101 = _2089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2043 = _2101;
    }
    float _2103 = _2043;
    if (_2007)
    {
        float _2105 = _1995 * _2095;
        _2099 = _2105;
    }
    float _2107 = _2099;
    if (!_2007)
    {
        _2091 = _1997;
    }
    float _2109 = _2091;
    float _2111 = _2109;
    if (_2007)
    {
        float _2113 = _1997 * _2095;
        _2111 = _2113;
    }
    float _2115 = _2111;
    if (!_2007)
    {
        _2031 = _1999;
    }
    float _2117 = _2031;
    float _2119 = _2117;
    if (_2007)
    {
        float _2121 = fma(_2067, _2061, _2103);
        _2069 = _2121;
    }
    float _2123 = _2069;
    if (_2007)
    {
        float _2125 = _2107 * _2107;
        _2119 = _2125;
    }
    float _2127 = _2119;
    if (!_2007)
    {
        _2085 = _2001;
    }
    float _2129 = _2085;
    float _2131 = _2129;
    if (_2007)
    {
        float _2133 = _2115 * _2115;
        _2131 = _2133;
    }
    float _2135 = _2131;
    float _2137 = fma(_2123, _2123, _2127);
    float _2139 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2141 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2143 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = _2137 + _2135;
    float _2147 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2139);
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_1991, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2157 = rsqrt(_2145);
    float _2159 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2147);
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2155);
    float _2167 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2169 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2171 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2173 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2175 = abs(_2163);
    float _2177 = log2(_2175);
    float _2179 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2181 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2171);
    float _2183 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2167);
    float _2185 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = -_2179;
    float _2189 = fma(_2187, _2141, 1.0);
    float _2191 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2183);
    float _2195 = _2157 * _2107;
    float _2197 = _2157 * _2123;
    float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2201 = _2157 * _2115;
    float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2205 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2207 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2199);
    float _2209 = log2(_2189);
    float _2211 = -_2203;
    float _2213 = fma(_2197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2211);
    float _2215 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2217 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2207);
    float _2219 = -_2201;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2213);
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2217);
    float _2227 = exp2(_2215);
    float _2229 = fma(_2221, -0.5, 0.5);
    float _2231 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2233 = fma(_2221, 0.5, 0.5);
    float _2235 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2237 = _2197 + 1.0;
    float _2239 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2231);
    float _2241 = fma(_2233, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2243 = 1.0 / _2225;
    float _2245 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2235);
    float _2247 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2239);
    float _2249 = fma(_2233, _2241, -0.212114393711090087890625);
    float _2251 = _2209 * 0.693147182464599609375;
    float _2253 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2245);
    float _2255 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2247);
    float _2257 = sqrt(_2229);
    float _2259 = -_2197;
    float _2261 = fma(_2227, _2237, _2259);
    float _2263 = fma(_2233, _2249, 1.570728778839111328125);
    float _2265 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2267 = fma(_2261, 0.5, 0.5);
    float _2269 = _2253 * _2243;
    float _2271 = _2255 * _2243;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = fma(_2271, -0.5, 0.5);
    float _2277 = _2257 * 0.636619746685028076171875;
    float _2279 = -_2263;
    float _2281 = fma(_2277, _2279, 1.0);
    float3 _6780 = float3(_2273, _2275, _2265);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float3 _6791 = float3(_2273, _2275, _2265);
    float4 _2286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6791, float3(0.0), isnan(_6791)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6791, float3(0.0), isnan(_6791)), level(0.0)).xyzw;
    float _2288 = _2286.x;
    float _2290 = _2286.y;
    float _2292 = _2286.z;
    float _2294 = _2286.w;
    float2 _6808 = float2(_2281, _2267);
    float3 _2298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6808, float2(0.0), isnan(_6808)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6808, float2(0.0), isnan(_6808)), level(0.0)).xyz;
    float _2300 = _2298.x;
    float _2302 = _2298.y;
    float _2304 = _2298.z;
    float _2306 = float(uint(_1155));
    float _2308 = trunc(_1267);
    int _2310 = int(_2308);
    int _2312 = ~_1155;
    int _2314 = _2312 + 1;
    float _2316 = _945 * (-0.15915493667125701904296875);
    float _2318 = -_1251;
    float _2320 = _2318 + 1.0;
    float _2322 = -_971;
    float _2324 = _2322 + 1.0;
    float _2326 = 1.0 / _2306;
    bool _2328 = !_997;
    float _2330 = _2328 ? _789 : _787;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2336 = !_997;
    float _2338 = _2336 ? 1.2345600128173828125 : 1.0;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2340;
    bool _2344 = _793 > 0.5;
    float _2346 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2350 = _2348 != 0;
    float _2352 = _2338 * _2330;
    float _2354 = float(uint(_2310));
    float _2356 = 1.0 / _2334;
    float _2358 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2360 = -_197;
    int _2362 = _2344 ? as_type<int>(_2360) : as_type<int>(_197);
    float _2364 = -_197;
    int _2366 = _1981 ? as_type<int>(_2364) : as_type<int>(_197);
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _2372 = as_type<int>(_2326) + (-2);
    float _2374 = 1.0 / _2342;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2378 = _2376 != 0;
    float _2380 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2358);
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2384 = _2382 != 0;
    float _2386 = as_type<float>(_2372) * _2354;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2390 = _2388 != 0;
    float _2392 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    int _2394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2396 = _2394 != 0;
    float _2398 = trunc(_2386);
    float _2400 = precise::max(_2398, 0.0);
    uint _2403 = uint(_2400);
    bool _2405 = !_2350;
    float _2407 = _2405 ? _197 : as_type<float>(_2366);
    bool _2409 = _787 > 0.5;
    float _2411 = 1.0 / _2370;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2417 = !_2384;
    float _2419 = _2417 ? _197 : as_type<float>(_2362);
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2421;
    bool _2425 = _1155 == 0;
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _2431 = abs(_823);
    int _2433 = _2314 * int(_2403);
    int _2435 = _2433 + _2310;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2439 = _781 + _2437;
    float _2441 = _2423 * _2356;
    float _2443 = 1.0 / _2415;
    float _2445 = _2439 * _2374;
    float _2447 = float(uint(_2435));
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2451 = _2449 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _2453 = ~_1155;
    int _2455 = _2453 + 1;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2459 = _2457 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2461 = as_type<float>(_2372) * _2447;
    float _2463 = 1.0 / _2429;
    float _2465 = _2451 * _2411;
    float _2467 = trunc(_2461);
    float _2469 = precise::max(_2467, 0.0);
    uint _2471 = uint(_2469);
    float _2473 = 1.0 / _783;
    int _2475 = int(_2403) + int(_2471);
    float _2477 = _2316 * 6.283185482025146484375;
    float _2479 = sin(_2477);
    int _2481 = ~_1155;
    int _2483 = _2481 + 1;
    int _2485 = _2483 * _2475;
    int _2487 = _2485 + _2310;
    float _2489 = _1265 * _2473;
    float _2491 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2495 = _2316 * 6.283185482025146484375;
    float _2497 = cos(_2495);
    bool _2499 = uint(_2487) >= uint(_1155);
    bool _2501 = !_2499;
    int _2503 = _2501 ? 0 : (-1);
    float _2505 = floor(_2352);
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2509 = _2507 != 0;
    float _2511 = float(_2310);
    int _2513 = ~_2475;
    int _2515 = _2513 + _2503;
    int _2517 = _2515 + 1;
    bool _2519 = _2511 >= _1239;
    bool _2521 = isnan(_2511);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(_1239);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = 1.0 / _2459;
    int _2533 = _1155 * _2517;
    int _2535 = _2533 + _2310;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2545 = trunc(_2529);
    int _2547 = int(_2545);
    float _2549 = -_2505;
    float _2551 = _2352 + _2549;
    float _2553 = _2543 * _2463;
    bool _2555 = !_2425;
    int _2557 = _2555 ? _2535 : (-1);
    float _2559 = _2551 * _1239;
    float _2561 = _2539 * _2443;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _2567 = _1155 + (-1);
    float _2569 = trunc(_2489);
    int _2571 = int(_2569);
    float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2573;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _2581 = abs(_817);
    bool _2583 = !_2396;
    int _2585 = _2583 ? 0 : 1;
    float _2587 = _2579 * _2531;
    float _2589 = 1.0 / _2565;
    int _2591 = ~_2547;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = -_193;
    int _2599 = _841 ? as_type<int>(_2597) : as_type<int>(_193);
    bool _2601 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2603 = isnan(_785);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2609 = _2605 || _2607;
    float _2611 = float(_2609);
    int _2613 = _2557 * _2595;
    bool _2615 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2617 = isnan(_785);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = trunc(_2559);
    int _2629 = int(_2627);
    int _2631 = _2547 * _2567;
    int _2633 = _2631 + _2613;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2635;
    int _2639 = _2633 * _2581;
    float _2641 = _2637 * _2589;
    int _2643 = abs(_2585);
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2647 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2645;
    int _2649 = abs(_1349);
    float _2651 = 1.0 / _2493;
    float _2653 = fma(_2647, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2655 = -_193;
    int _2657 = _2409 ? as_type<int>(_2655) : as_type<int>(_193);
    int _2659 = _2629 * _2643;
    int _2661 = _2659 + _2310;
    bool _2663 = !_2378;
    float _2665 = _2663 ? _193 : as_type<float>(_2599);
    int _2667 = _2571 * _2431;
    int _2669 = _2667 + _2639;
    bool _2671 = !_2390;
    float _2673 = _2671 ? _193 : as_type<float>(_2657);
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2677 = _785 + _2675;
    int _2679 = _2661 * _2649;
    int _2681 = _2679 + _2669;
    int _2683 = abs(_1327);
    float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2687 = _785 + _2685;
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2689;
    float _2693 = fma(_2553, _2677, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _2695 = _2629 * _2683;
    int _2697 = _2695 + _2681;
    float _2699 = fma(_2441, _2687, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2701;
    float _2705 = fma(_2691, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2709 = _785 + _2707;
    float _2711 = float(uint(_2697));
    float _2713 = fma(_2703, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2717 = _785 + _2715;
    bool _2719 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2721 = isnan(_785);
    bool _2723 = _2719 || _2721;
    bool _2725 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2727 = _2723 || _2725;
    float _2729 = float(_2727);
    float _2731 = fma(_2561, _2709, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2733 = as_type<float>(_2372) * _2711;
    float _2735 = fma(_2465, _2717, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2737 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2739 = isnan(_785);
    bool _2741 = _2737 || _2739;
    bool _2743 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2745 = _2741 || _2743;
    float _2747 = float(_2745);
    float _2749 = -_2729;
    float _2751 = _2749 + 1.0;
    bool _2753 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2755 = isnan(_785);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    float _2765 = _2575 * _2651;
    float _2767 = trunc(_2733);
    float _2769 = precise::max(_2767, 0.0);
    uint _2771 = uint(_2769);
    float _2773 = -_2747;
    float _2775 = _2773 + 1.0;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2779 = _785 + _2777;
    bool _2781 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2783 = isnan(_785);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2789 = _2785 || _2787;
    float _2791 = float(_2789);
    float _2793 = -_2763;
    float _2795 = _2793 + 1.0;
    float _2797 = _2747 * _2751;
    float _2799 = _2763 * _2775;
    float _2801 = fma(_2765, _2779, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2803 = _2791 * _2795;
    bool _2805 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2807 = isnan(_785);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2611;
    float _2819 = _2817 + 1.0;
    bool _2821 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2823 = isnan(_785);
    bool _2825 = _2821 || _2823;
    bool _2827 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2829 = _2825 || _2827;
    float _2831 = float(_2829);
    float _2833 = -_2791;
    float _2835 = _2833 + 1.0;
    float _2837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2839 = _2815 * _2819;
    int _2841 = _2455 * int(_2771);
    int _2843 = _2841 + _2697;
    float _2845 = _2611 * _2835;
    bool _2847 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2849 = isnan(_781);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = float(uint(_2843));
    float _2861 = -_2815;
    float _2863 = _2861 + 1.0;
    bool _2865 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2867 = isnan(_781);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2879 = _785 + _2877;
    float _2881 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2883 = _785 + _2881;
    float _2885 = as_type<float>(_2372) * _2859;
    float _2887 = _2831 * _2863;
    float _2889 = -_2831;
    float _2891 = _2889 + 1.0;
    float _2893 = -_2875;
    float _2895 = _2893 + 1.0;
    float _2897 = trunc(_2885);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    float _2903 = fma(_2587, _2879, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2905 = _2625 * _2891;
    float _2907 = _2857 * _2895;
    float _2909 = -_2857;
    float _2911 = _2909 + 1.0;
    float _2913 = -_2625;
    float _2915 = _2913 + 1.0;
    float _2917 = _2699 * _2905;
    float _2919 = fma(_2641, _2883, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2921 = _2653 * _2907;
    float _2923 = _2705 * _2907;
    float _2925 = _2713 * _2907;
    float _2927 = fma(_2915, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2917);
    float _2929 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2921);
    float _2931 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2923);
    float _2933 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2925);
    float _2935 = _2407 * _2479;
    float _2937 = fma(_2735, _2887, _2927);
    int _2939 = ~_1155;
    int _2941 = _2939 + 1;
    float _2943 = _2407 * _2497;
    int _2945 = int(_2771) + int(_2901);
    float _2947 = -_2935;
    float _2949 = fma(_2673, _2497, _2947);
    float _2951 = float(uint(_2661));
    float _2953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2955 = _2837 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2957 = _963 + 0.5;
    int _2959 = _2941 * _2945;
    int _2961 = _2959 + _2697;
    float _2963 = as_type<float>(_2372) * _2951;
    int _2965 = ~_1155;
    int _2967 = _2965 + 1;
    float _2969 = fma(_2955, _2957, _1105);
    float _2971 = fma(_2673, _2479, _2943);
    float _2973 = trunc(_2963);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    bool _2979 = uint(_2961) >= uint(_1155);
    float _2981 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2931);
    float _2983 = _2949 + 0.5;
    float _2985 = fma(_2731, _2839, _2937);
    bool _2987 = !_2979;
    int _2989 = _2987 ? 0 : (-1);
    float _2991 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2929);
    float _2993 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2933);
    float _2995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2997 = ~_2945;
    int _2999 = _2997 + _2989;
    int _3001 = _2999 + 1;
    float _3003 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3005 = _2665 + 0.5;
    float _3007 = fma(_2693, _2845, _2985);
    float _3009 = fma(_3003, _2983, _949);
    int _3011 = _1155 * _3001;
    int _3013 = _3011 + _2697;
    float _3015 = fma(_3005, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1205);
    int _3017 = _2967 * int(_2977);
    int _3019 = _3017 + _2661;
    float _3021 = _2971 + (-0.5);
    float _3023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3025 = !_2425;
    int _3027 = _3025 ? _3013 : (-1);
    float _3029 = fma(_2801, _2803, _3007);
    float _3031 = float(uint(_3019));
    float _3033 = _2991 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3035 = _2995 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3037 = _2419 + (-0.5);
    float _3039 = as_type<float>(_2372) * _3031;
    int _3041 = _3027 >> 31;
    float _3043 = -_3035;
    float _3045 = -_965;
    float _3047 = fma(_3043, _3021, _3045);
    float _3049 = -_3037;
    float _3051 = -_1275;
    float _3053 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3051);
    float _3055 = _2981 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3057 = _3041 & 3;
    float _3059 = _2993 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3063 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3065 = _3027 + _3057;
    float _3067 = _969 + (-0.5);
    float _3069 = _3033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3071 = _3055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3073 = _3065 >> 2;
    float _3075 = -_3063;
    float _3077 = -_1277;
    float _3079 = fma(_3075, _3067, _3077);
    float _3081 = _3059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3083 = trunc(_3039);
    float _3085 = precise::max(_3083, 0.0);
    uint _3087 = uint(_3085);
    int _3089 = _3073 << 4;
    int _3091 = _3089 + 512;
    float _3093 = -_1273;
    float _3095 = _3093 + 1.0;
    int _3097 = _3027 & 3;
    bool _3099 = _3097 != 0;
    out.m_58.x = _3069;
    out.m_58.y = _3071;
    out.m_58.z = _3081;
    out.m_58.w = _3061;
    uint _3101 = uint(int(uint(_3091) >> uint(2)));
    uint _3103 = uint(int(uint(int(_3101)) >> uint(2)));
    int _3105 = int(_3101) & 3;
    float _3107 = (*spvDescriptorSet0.vp_c9)._m0[int(_3103)][_3105];
    int _3109 = int(_3101) + 1;
    uint _3111 = uint(int(uint(_3109) >> uint(2)));
    int _3113 = _3109 & 3;
    float _3115 = (*spvDescriptorSet0.vp_c9)._m0[int(_3111)][_3113];
    float _3117 = -_1269;
    float _3119 = _3117 + 1.0;
    int _3121 = _3027 & 3;
    bool _3123 = _3121 != 0;
    float _3125 = -_3095;
    float _3127 = fma(_2665, _3125, _3015);
    int _3129 = ~_1155;
    int _3131 = _3129 + 1;
    float _3133 = fma(_2903, _2799, _3029);
    bool _3135 = uint(_3121) > 1u;
    float _3137 = -_2320;
    float _3139 = fma(_2949, _3137, _3009);
    bool _3141 = uint(_3121) >= 2u;
    float _3143 = fma(_2971, _3119, _3047);
    float _3145 = fma(_969, _2324, _3079);
    int _3147 = int(_2977) + int(_3087);
    float _3149 = exp2(_2346);
    int _3151 = _3091 + 8;
    uint _3153 = uint(int(uint(_3151) >> uint(2)));
    uint _3155 = uint(int(uint(int(_3153)) >> uint(2)));
    int _3157 = int(_3153) & 3;
    float _3159 = (*spvDescriptorSet0.vp_c9)._m0[int(_3155)][_3157];
    int _3161 = int(_3153) + 1;
    uint _3163 = uint(int(uint(_3161) >> uint(2)));
    int _3165 = _3161 & 3;
    float _3167 = (*spvDescriptorSet0.vp_c9)._m0[int(_3163)][_3165];
    float _3169 = -_1271;
    float _3171 = _3169 + 1.0;
    float _3173 = -_1215;
    float _3175 = _3173 + 1.0;
    int _3177 = _3141 ? 0 : 1;
    float _3179 = fma(_2919, _2797, _3133);
    float _3181 = -_3171;
    float _3183 = fma(_963, _3181, _2969);
    int _3185 = _3131 * _3147;
    int _3187 = _3185 + _2661;
    int _3189 = _3099 ? 0 : 1;
    float _3191 = fma(_2419, _3175, _3053);
    bool _3193 = _3121 != 3;
    float _3195 = fma(_2729, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3179);
    bool _3197 = uint(_3187) >= uint(_1155);
    out.m_60.x = _3183;
    out.m_60.y = _3145;
    int _3199 = ~_3189;
    int _3201 = _3199 + 1;
    int _3203 = _3201 + 1;
    float _3205 = -_3149;
    float _3207 = _3205 + 1.0;
    int _3209 = _3203;
    if (!_3135)
    {
        int _3211 = ~_3189;
        int _3213 = _3211 + 1;
        _3209 = _3213;
    }
    int _3215 = _3209;
    out.m_62.x = _3139;
    out.m_62.y = _3143;
    out.m_62.z = _3127;
    out.m_62.w = _3191;
    bool _3217 = !_3123;
    int _3219 = _3217 ? 0 : 1;
    int _3221 = abs(_3215);
    out.m_64.x = _3195;
    bool _3223 = _3121 != 3;
    bool _3225 = !_3197;
    int _3227 = _3225 ? 0 : (-1);
    int _3229 = ~_3147;
    int _3231 = _3229 + _3227;
    int _3233 = _3231 + 1;
    int _3235 = ~_3177;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = abs(_3219);
    int _3243 = _1155 * _3233;
    int _3245 = _3243 + _2661;
    int _3247 = _3239;
    if (_3193)
    {
        int _3249 = ~_3177;
        int _3251 = _3249 + 1;
        _3247 = _3251;
    }
    int _3253 = _3247;
    bool _3255 = !_3223;
    int _3257 = _3255 ? 0 : (-1);
    int _3259 = abs(_3253);
    int _3261 = ~_3221;
    int _3263 = _3261 + 1;
    int _3265 = _3263 + 1;
    int _3267 = abs(_3257);
    int _3269 = ~_3241;
    int _3271 = _3269 + 1;
    int _3273 = _3271 + 1;
    int _3275 = _3265 * as_type<int>(_3115);
    bool _3277 = !_2509;
    int _3279 = _3277 ? 0 : 1;
    int _3281 = _3273 * as_type<int>(_3107);
    int _3283 = _3281 + _3275;
    int _3285 = ~_3259;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    int _3291 = abs(_3279);
    int _3293 = ~_3267;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    int _3299 = _3289 * as_type<int>(_3159);
    int _3301 = _3299 + _3283;
    float _3303 = _2225 * 0.5;
    float _3305 = _1905 * _1967;
    bool _3307 = _1905 > 0.0;
    bool _3309 = isnan(_1905);
    bool _3311 = _3307 || _3309;
    bool _3313 = isnan(0.0);
    bool _3315 = _3311 || _3313;
    int _3317 = _3297 * as_type<int>(_3167);
    int _3319 = _3317 + _3301;
    int _3321 = ~_3291;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    float _3327 = _3305 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3329 = !_2425;
    int _3331 = _3329 ? _3245 : (-1);
    bool _3333 = _1967 <= 0.0;
    bool _3335 = !_3315;
    bool _3337 = _3333 || _3335;
    int _3339 = _3319 * _3325;
    float _3341 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2392);
    float _3343 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3345 = _3331 * _3291;
    int _3347 = _3345 + _3339;
    float _3349 = fma(_2255, -0.5, _3303);
    float _3351 = _3341 + _2225;
    float _3353 = _2253 + _2225;
    out.gl_Position.x = _2253;
    out.gl_Position.y = _2255;
    out.gl_Position.z = _3341;
    out.gl_Position.w = _2225;
    float _3355 = float(_3347);
    float _3357 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3359 = _3351 * 0.5;
    float _3361 = _3353 * 0.5;
    float _3363 = _3357 * _2283;
    float _3365 = -_3357;
    float _3367 = _3365 + 1.0;
    out.m_45.x = _3343;
    float _3369 = _2294 * _3363;
    float _3371 = _2304 * _3363;
    out.m_66.x = _3361;
    out.m_66.y = _3349;
    out.m_66.z = _3359;
    out.m_66.w = _2225;
    float _3373 = fma(_2300, _3369, _2288);
    float _3375 = fma(_2302, _3369, _2290);
    float _3377 = _2294 * _3367;
    float _3379 = fma(_2294, _3371, _2292);
    out.m_68.y = _3355;
    out.m_70.x = _3373;
    out.m_70.y = _3375;
    out.m_70.z = _3379;
    out.m_70.w = _3377;
    if (!_3337)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3381 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3381;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _773 = false;
    bool _621 = false;
    bool _507 = false;
    bool _305 = false;
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
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_93)
    {
        float _101 = _97 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3437 = as_type<float>(_103);
        out.gl_Position.z = _3437;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_89);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
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
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3507 = as_type<float>(_143);
        out.gl_Position.z = _3507;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = in.m_42.x;
    float _167 = in.m_42.y;
    float _169 = in.m_42.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    float _179 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _181 = 0.0;
    float _183 = _179;
    if (!_157)
    {
        float _185 = _179 * _179;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_173;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_157)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_157;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _179 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _179);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_157;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _179 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _159, _267);
    float _275 = fma(_263, _161, _269);
    float _277 = fma(_263, _163, _271);
    float _279 = fma(_273, _147, _165);
    float _281 = fma(_275, _147, _167);
    float _283 = fma(_277, _147, _169);
    bool _285 = !_265;
    float _303;
    if (!_285)
    {
        float _287 = in.m_54.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_89);
        float _309 = 1.0 / _307;
        float _311 = _121 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _313 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _331;
    float _335 = in.m_52.x;
    float _337 = in.m_52.y;
    bool _339 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _341 = isnan(_313);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 1.0 / _325;
    bool _353 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _355 = 1.0 / _329;
    float _357 = 1.0 / _333;
    float _359 = _317 * _351;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _313 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _365;
    float _369 = fma(_367, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = _363 * _355;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _373;
    bool _377 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _379 = isnan(_313);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = fma(_375, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = -_387;
    float _393 = _391 + 1.0;
    float _395 = _321 * _357;
    float _397 = -_349;
    float _399 = _397 + 1.0;
    bool _401 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_313);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _387 * _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _419 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _421 = isnan(_313);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = _411 * _393;
    float _433 = -_411;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _441 = fma(_417, _371, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _429 * _435;
    float _445 = fma(_439, _371, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -_429;
    float _449 = _447 + 1.0;
    float _451 = _369 * _443;
    float _453 = _389 * _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _467 = fma(_457, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _469 = fma(_461, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_445, _431, _463);
    float _473 = fma(_441, _431, _465);
    float _475 = fma(_467, _413, _471);
    float _477 = fma(_469, _413, _473);
    float _479 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[146].x, _475);
    float _481 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[146].y, _477);
    float _483 = _479 * _335;
    float _485 = _481 * _337;
    bool _487 = !_353;
    float _505;
    if (!_487)
    {
        float _489 = in.m_54.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _121 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _515 + _517;
    bool _521 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _523 = isnan(_515);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _533;
    bool _537 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _539 = isnan(_515);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _553;
    float _557 = 1.0 / _535;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _561 = _547 * _551;
    float _563 = -_547;
    float _565 = _563 + 1.0;
    float _567 = _519 * _557;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _569;
    float _573 = fma(_555, _567, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _575;
    float _579 = fma(_571, _567, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _581 = fma(_577, _567, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _583 = _573 * _561;
    float _585 = _579 * _561;
    float _587 = _581 * _561;
    float _589 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].x, _583);
    float _591 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].y, _587);
    float _593 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[107].z, _585);
    float _595 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].x, _589);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].y, _591);
    float _599 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[108].z, _593);
    bool _601 = !_559;
    float _619;
    if (!_601)
    {
        float _603 = in.m_54.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_89);
        float _625 = 1.0 / _623;
        float _627 = _121 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _641 = isnan(_629);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _667;
    bool _671 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_629);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _637;
    float _685 = -_649;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _629 + _689;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _695 = _665 * _687;
    float _697 = -_665;
    float _699 = _697 + 1.0;
    float _701 = 1.0 / _653;
    float _703 = _669 * _683;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _709 = fma(_703, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _711 = _707 * _701;
    float _713 = -_681;
    float _715 = _713 + 1.0;
    float _717 = _709 * _695;
    float _719 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _721 = fma(_711, _691, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _723 = _649 * _715;
    float _725 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _717);
    float _727 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = fma(_721, _723, _725);
    float _733 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _731);
    float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _735 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _737;
    out.m_56.y = _729;
    out.m_56.z = _739;
    out.m_56.w = _741;
    bool _743 = !_693;
    float _767;
    float _769;
    float _771;
    if (!_743)
    {
        float _745 = in.m_54.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _749 = float(_89);
        float _751 = 1.0 / _749;
        float _753 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _755 = _121 * _751;
        float _757 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _759 = _757 * _747;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = _749;
        _771 = _755;
        _773 = true;
    }
    else
    {
        float _775 = float(_89);
        float _777 = 1.0 / _775;
        float _779 = _121 * _777;
        _767 = _779;
        _769 = _775;
        _771 = _779;
    }
    _773 = false;
    float _781 = _767;
    float _783 = _769;
    float _785 = _771;
    float _787 = in.m_54.x;
    float _789 = in.m_54.y;
    float _791 = in.m_54.z;
    float _793 = in.m_54.w;
    float _795 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _797 = log2(_795);
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _801 = _799 != 0;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _809 = _807 != 0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _813 = _811 != 0;
    bool _815 = !_805;
    int _817 = _815 ? 0 : 1;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _821 = !_801;
    int _823 = _821 ? 0 : 1;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _827 = _797 * _121;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _831 = exp2(_827);
    float _833 = _791 * 2.0;
    float _835 = _787 * 2.0;
    bool _837 = _789 > 0.5;
    float _839 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _841 = _791 > 0.5;
    float _843 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _845 = floor(_833);
    bool _847 = _789 > 0.5;
    float _849 = -_819;
    float _851 = fma(_839, 2.0, _849);
    int _853 = int(_847);
    int _855 = _841 ? 2 : 0;
    int _857 = _853 | _855;
    int _859 = _809 ? 4 : 0;
    int _861 = _857 | _859;
    int _863 = _813 ? 8 : 0;
    int _865 = _861 | _863;
    int _867 = false ? 16 : 0;
    int _869 = _865 | _867;
    int _871 = _837 ? 32 : 0;
    int _873 = _869 | _871;
    int _875 = false ? 64 : 0;
    int _877 = _873 | _875;
    int _879 = _877 & 32;
    float _881 = fma(_843, -2.0, _829);
    float _883 = -_193;
    int _885 = _847 ? as_type<int>(_883) : as_type<int>(_193);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _889 = -_197;
    int _891 = _841 ? as_type<int>(_889) : as_type<int>(_197);
    float _893 = floor(_835);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _897 = -_831;
    float _899 = _897 + 1.0;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _905 = _787 + (-0.5);
    bool _907 = _845 > 0.0;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _911 = _845 >= 0.0;
    bool _913 = isnan(_845);
    bool _915 = _911 || _913;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _923 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[79].z, _909);
    int _925 = _919 ? 0 : 1;
    float _927 = _789 + _791;
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _935 = _933 != 0;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _939 = ~_925;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    float _945 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[79].x, _923);
    float _947 = -_121;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[76].x, _851);
    int _951 = _943;
    if (!_907)
    {
        int _953 = ~_925;
        int _955 = _953 + 1;
        _951 = _955;
    }
    int _957 = _951;
    float _959 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].w, _937);
    bool _961 = !_931;
    float _963 = _961 ? _193 : as_type<float>(_885);
    float _965 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _881);
    bool _967 = !_935;
    float _969 = _967 ? _197 : as_type<float>(_891);
    float _971 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].w, _959);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _983 = _981 != 0;
    float _985 = _789 * 2.0;
    float _987 = _905 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _989 = _927 + (-1.0);
    bool _991 = !_975;
    int _993 = _991 ? 0 : 1;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _997 = _995 != 0;
    float _999 = floor(_985);
    bool _1001 = _893 >= 0.0;
    bool _1003 = isnan(_893);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan(0.0);
    bool _1009 = _1005 || _1007;
    int _1011 = abs(_993);
    int _1013 = _1009 ? 0 : 1;
    bool _1015 = _893 > 0.0;
    float _1017 = _789 + _787;
    int _1019 = ~_1013;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = float(_1011);
    float _1027 = _1017 + (-1.0);
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1031 = _1027;
    int _1033 = _1023;
    bool _1035 = _809;
    if (_997)
    {
        _1029 = _787;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_997)
    {
        _1039 = _791;
    }
    float _1041 = _1039;
    float _1043 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (!_997)
    {
        _1031 = _791;
    }
    float _1045 = _1031;
    float _1047 = _1045;
    if (_997)
    {
        _1047 = _789;
    }
    float _1049 = _1047;
    float _1051 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1015)
    {
        int _1053 = ~_1013;
        int _1055 = _1053 + 1;
        _1033 = _1055;
    }
    int _1057 = _1033;
    bool _1059 = _999 >= 0.0;
    bool _1061 = isnan(_999);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.0);
    bool _1067 = _1063 || _1065;
    float _1069 = -_825;
    float _1071 = fma(_1051, 2.0, _1069);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _903);
    int _1075 = _1067 ? 0 : 1;
    float _1077 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1079 = _999 > 0.0;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1083 = _999;
    if (!_997)
    {
        _1083 = _789;
    }
    float _1085 = _1083;
    float _1087 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1089 = int(_1087);
    float _1091 = _1085;
    if (_997)
    {
        _1091 = _787;
    }
    float _1093 = _1091;
    float _1095 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1077);
    int _1097 = ~_1075;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    float _1103 = -_121;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1071);
    float _1107 = 0.0;
    float _1109 = _1093;
    int _1111 = _1101;
    if (!_997)
    {
        _1107 = _791;
    }
    float _1113 = _1107;
    float _1115 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1081);
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1119 = _1113;
    if (_997)
    {
        _1109 = _789;
    }
    float _1121 = _1109;
    float _1123 = _1121;
    if (!_997)
    {
        _1123 = _787;
    }
    float _1125 = _1123;
    float _1127 = -_887;
    float _1129 = fma(_1117, 2.0, _1127);
    float _1131 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1079)
    {
        int _1133 = ~_1075;
        int _1135 = _1133 + 1;
        _1111 = _1135;
    }
    int _1137 = _1111;
    float _1139 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1095);
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1143 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1131);
    float _1145 = float(_957);
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_997)
    {
        _1119 = _789;
    }
    float _1149 = _1119;
    float _1151 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1143);
    float _1153 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1155 = int(_1153);
    float _1157 = _1025 * _1145;
    float _1159 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1161 = -_1147;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = float(_1089);
    float _1167 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1175 = 1.0 + _1173;
    bool _1177 = !_979;
    int _1179 = _1177 ? 0 : 1;
    float _1181 = 1.0 / _1165;
    bool _1183 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1185 = isnan(0.0);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1191 = _1187 || _1189;
    float _1193 = fma(_1167, -2.0, _895);
    float _1195 = abs(_1171);
    float _1197 = abs(_1163);
    float _1199 = precise::max(_1195, _1197);
    float _1201 = _1171 * 0.0625;
    float _1203 = -_121;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1129);
    bool _1207 = _1199 >= 16.0;
    float _1209 = 1.0 / _1175;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1213 = _1191 ? _899 : 0.0;
    float _1215 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1073);
    bool _1217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1219 = isnan(1.0);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1225 = _1221 || _1223;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1229 = !_983;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1157 * (-2.0);
    int _1235 = abs(_1179);
    float _1237 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1227);
    float _1239 = float(_1155);
    float _1241 = fma(_1141, -2.0, _901);
    int _1243 = abs(_1231);
    float _1245 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1211);
    float _1247 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].z, _921);
    float _1249 = _1207 ? _1201 : _1171;
    float _1251 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1237);
    float _1253 = float(_1057);
    float _1255 = _1163;
    float _1257 = _1159;
    if (_1207)
    {
        float _1259 = _1163 * 0.0625;
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = float(_1235);
    float _1265 = _1239 * _121;
    float _1267 = _1181 * _121;
    float _1269 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1245);
    float _1271 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1247);
    float _1273 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1115);
    float _1275 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1193);
    float _1277 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1241);
    float _1279 = abs(_1249);
    bool _1281 = _1279 != 0.0;
    bool _1283 = isnan(_1279);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan(0.0);
    bool _1289 = _1285 || _1287;
    int _1291 = _1289 ? (-1) : 0;
    if (_1225)
    {
        float _1293 = _1213 * _1209;
        _125 = _1293;
    }
    float _1295 = _125;
    float _1297 = fma(_1043, _1233, _1043);
    float _1299 = _1263 * _1253;
    float _1301 = _791 + _787;
    float _1303 = abs(_1261);
    bool _1305 = _1303 == 0.0;
    bool _1307 = !_1289;
    bool _1309 = _1305 && _1307;
    float _1311 = fma(_1297, _1295, _987);
    float _1313 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1315 = _1301 + (-1.0);
    float _1317 = float(_1137);
    float _1319 = _1299 * (-2.0);
    float _1321 = float(_1243);
    float _1323 = _1311 * 0.15915493667125701904296875;
    bool _1325 = !_813;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = fma(_1313, _1319, _1313);
    float _1331 = abs(_1261);
    bool _1333 = _1331 == 0.0;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1337 = _791 + (-0.5);
    float _1339 = _1323 * 6.283185482025146484375;
    float _1341 = sin(_1339);
    float _1343 = _1321 * _1317;
    float _1345 = _789 + (-0.5);
    bool _1347 = !_809;
    int _1349 = _1347 ? 0 : 1;
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1353 = _1343 * (-2.0);
    int _1355 = as_type<int>(_1337);
    if (_1309)
    {
        bool _1357 = as_type<int>(_1261) >= 0;
        _1035 = _1357;
    }
    bool _1359 = _1035;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1363 = _1323 * 6.283185482025146484375;
    float _1365 = cos(_1363);
    float _1367 = fma(_1335, _1353, _1335);
    if (_1309)
    {
        int _1369 = _1359 ? 0 : 1078530011;
        _1355 = _1369;
    }
    int _1371 = _1355;
    float _1373 = fma(_1329, _1295, _1361);
    float _1375 = fma(_1367, _1295, _1351);
    int _1377 = _1371;
    if (_1309)
    {
        int _1379 = int(0x80000000) & as_type<int>(_1249);
        int _1381 = _1371 | _1379;
        _1377 = _1381;
    }
    int _1383 = _1377;
    bool _1385 = !_1289;
    bool _1387 = _1385 && _1333;
    int _1389 = _1383;
    float _1391 = as_type<float>(_1383);
    float _1393 = _1365;
    if (!_1387)
    {
        float _1395 = abs(_1249);
        bool _1397 = _1395 != as_type<float>(0x7f800000u /* inf */);
        bool _1399 = isnan(_1395);
        bool _1401 = _1397 || _1399;
        bool _1403 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1405 = _1401 || _1403;
        float _1407 = abs(_1261);
        bool _1409 = _1407 == as_type<float>(0x7f800000u /* inf */);
        float _1411 = abs(_1261);
        bool _1413 = _1411 == as_type<float>(0x7f800000u /* inf */);
        bool _1415 = !_1405;
        bool _1417 = _1413 && _1415;
        if (_1417)
        {
            bool _1419 = as_type<int>(_1261) >= 0;
            _1291 = _1419 ? (-1) : 0;
        }
        int _1421 = _1291;
        if (_1417)
        {
            _1389 = 1075235812;
        }
        int _1423 = _1389;
        int _1425 = _1423;
        if (_1417)
        {
            int _1427 = ~_1421;
            int _1429 = (_1427 != 0) ? _1423 : 1061752795;
            _1425 = _1429;
        }
        int _1431 = _1425;
        float _1433 = as_type<float>(_1431);
        if (_1417)
        {
            int _1435 = int(0x80000000) & as_type<int>(_1249);
            int _1437 = _1431 | _1435;
            _1433 = as_type<float>(_1437);
        }
        float _1439 = _1433;
        bool _1441 = !_1405;
        bool _1443 = _1441 && _1409;
        _1391 = _1439;
        if (!_1443)
        {
            float _1445 = abs(_1249);
            float _1447 = abs(_1261);
            float _1449 = precise::max(_1445, _1447);
            float _1451 = abs(_1249);
            float _1453 = abs(_1261);
            float _1455 = precise::min(_1451, _1453);
            float _1457 = 1.0 / _1449;
            float _1459 = abs(_1249);
            float _1461 = abs(_1261);
            bool _1463 = _1459 > _1461;
            bool _1465 = as_type<int>(_1261) >= 0;
            float _1467 = _1455 * _1457;
            float _1469 = _1467 * _1467;
            float _1471 = _1469 + 11.33538818359375;
            float _1473 = fma(_1469, _1471, 28.84246826171875);
            float _1475 = fma(_1469, _1473, 19.6966705322265625);
            float _1477 = fma(_1469, -0.82336294651031494140625, -5.674867153167724609375);
            float _1479 = fma(_1469, _1477, -6.565555095672607421875);
            float _1481 = 1.0 / _1475;
            float _1483 = _1469 * _1479;
            float _1485 = abs(_1249);
            float _1487 = abs(_1261);
            float _1489 = _1485 + _1487;
            int _1491 = as_type<int>(_1249) & int(0x80000000);
            float _1493 = _1467 * _1483;
            bool _1495 = _1489 > as_type<float>(0x7f800000u /* inf */);
            bool _1497 = isnan(_1489);
            bool _1499 = _1495 || _1497;
            bool _1501 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1503 = _1499 || _1501;
            float _1505 = fma(_1493, _1481, _1467);
            float _1507 = _1505;
            _1391 = _1489;
            if (_1463)
            {
                float _1509 = -_1505;
                float _1511 = _1509 + 1.57079637050628662109375;
                _1507 = _1511;
            }
            float _1513 = _1507;
            int _1515 = as_type<int>(_1513);
            if (!_1465)
            {
                float _1517 = -_1513;
                float _1519 = _1517 + 3.1415927410125732421875;
                _1515 = as_type<int>(_1519);
            }
            int _1521 = _1515;
            if (!_1503)
            {
                int _1523 = _1491 | _1521;
                _1391 = as_type<float>(_1523);
            }
        }
    }
    float _1525 = _1391;
    float _1527 = -_1525;
    float _1529 = _1373 + _1527;
    float _1531 = _1375 * 0.15915493667125701904296875;
    float _1533 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1537 = _1529 * 0.15915493667125701904296875;
    float _1539 = _1531 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1545 = _1535 * _1533;
    float _1547 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1551 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1543);
    float _1553 = _1537 * 6.283185482025146484375;
    float _1555 = sin(_1553);
    float _1557 = _1549 * _1547;
    float _1559 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1551);
    float _1561 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1571 = _1567 || _1569;
    float _1573 = _1559 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1577 = isnan(0.5);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1583 = _1579 || _1581;
    float _1585 = _1537 * 6.283185482025146484375;
    float _1587 = cos(_1585);
    float _1589 = _1541 * _1545;
    float _1591 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1593 = _1341 * _1589;
    float _1595 = _1365 * _1589;
    float _1597 = _1531 * 6.283185482025146484375;
    float _1599 = sin(_1597);
    float _1601 = _1365 * _1555;
    float _1603 = _1341 * _1587;
    float _1605 = _1365 * _1587;
    float _1607 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1591);
    float _1609 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1607);
    float _1611 = -_1601;
    float _1613 = fma(_1599, _1603, _1611);
    float _1615 = -_1603;
    float _1617 = fma(_1599, _1601, _1615);
    float _1619 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1621 = fma(_1613, _1557, _1593);
    float _1623 = _1341 * _1555;
    float _1625 = -_1545;
    float _1627 = _1599 * _1625;
    float _1629 = _1587 * _1541;
    float _1631 = _1555 * _1541;
    float _1633 = fma(_1599, _1623, _1605);
    float _1635 = 1.0 / _1619;
    float _1637 = fma(_1629, _1557, _1627);
    float _1639 = fma(_1599, _1605, _1623);
    float _1641 = fma(_1633, _1561, _1621);
    float _1643 = fma(_1631, _1561, _1637);
    float _1645 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1647 = _1147 + _1641;
    float _1649 = fma(_1639, _1557, _1595);
    float _1651 = _1159 + _1643;
    float _1653 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1645);
    float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1657 = _1647 + _1655;
    float _1659 = fma(_1617, _1561, _1649);
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1653);
    float _1667 = _1657 * _1657;
    float _1669 = _1573 + _1659;
    float _1671 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1673 = fma(_1663, _1663, _1667);
    float _1675 = _1671 + _1619;
    float _1677 = sqrt(_1673);
    float _1679 = _1675 * _1635;
    float _1681 = _1679 * 0.5;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1685 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1683);
    float _1687 = 1.0 / _1685;
    bool _1689 = _1677 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1691 = _1561;
    float _1693 = _1651;
    float _1695 = _1647;
    float _1697 = _1617;
    float _1699 = _1557;
    float _1701 = _1659;
    float _1703 = _1669;
    float _1705 = _1605;
    if (!_1689)
    {
        _1691 = _1669;
    }
    float _1707 = _1691;
    bool _1709 = !_1689;
    float _1711 = _1707;
    if (!_1709)
    {
        float _1713 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1717 = _1677 + _1715;
        float _1719 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = rsqrt(_1673);
        float _1723 = _1717 * _1713;
        float _1725 = _1723 * 0.15915493667125701904296875;
        float _1727 = _1725 * 6.283185482025146484375;
        float _1729 = cos(_1727);
        float _1731 = _1725 * 6.283185482025146484375;
        float _1733 = sin(_1731);
        float _1735 = _1729 + (-1.0);
        float _1737 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1739 = fma(_1733, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1741 = fma(_1669, _1729, _1737);
        float _1743 = _1721 * _1739;
        float _1745 = fma(_1663, _1743, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1747 = fma(_1657, _1743, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1693 = _1745;
        _1695 = _1747;
        _1697 = _1737;
        _1711 = _1741;
        _1699 = _1725;
        _1393 = _1739;
        _1701 = _1743;
    }
    float _1749 = _1693;
    float _1751 = _1695;
    float _1753 = _1697;
    float _1755 = _1711;
    float _1757 = _1699;
    float _1759 = _1393;
    float _1761 = _1701;
    float _1763 = _1757;
    float _1765 = _1759;
    float _1767 = _1761;
    float _1769 = _1755;
    float _1771 = _1753;
    if (_1583)
    {
        _1763 = 1.0;
    }
    float _1773 = _1763;
    float _1775 = _1773;
    if (_1571)
    {
        _1765 = _1749;
    }
    float _1777 = _1765;
    float _1779 = _1777;
    if (_1571)
    {
        _1767 = _1751;
    }
    float _1781 = _1767;
    float _1783 = _1781;
    if (!_1571)
    {
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1787 = _1573 + _1785;
        float _1789 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1791 = -_1159;
        float _1793 = _1791 + _1749;
        float _1795 = -_1573;
        float _1797 = _1795 + _1755;
        float _1799 = _1787 * _1787;
        float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1803 = _1147 + _1801;
        float _1805 = -_1147;
        float _1807 = _1805 + _1751;
        float _1809 = fma(_1171, _1171, _1799);
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1813 = fma(_1803, _1803, _1809);
        float _1815 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1817 = sqrt(_1813);
        float _1819 = precise::min(_1817, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1821 = _1819 * _1811;
        float _1823 = _1815 * _1821;
        float _1825 = fma(_1793, _1823, _1159);
        float _1827 = fma(_1797, _1823, _1573);
        float _1829 = fma(_1807, _1823, _1147);
        _1703 = _1811;
        _1769 = _1827;
        _1779 = _1825;
        _1783 = _1829;
        _1771 = _1789;
    }
    float _1831 = _1703;
    float _1833 = _1769;
    float _1835 = _1779;
    float _1837 = _1783;
    float _1839 = _1771;
    float _1841 = _1839;
    float _1843 = _1831;
    if (_1583)
    {
        _1841 = 1.0;
    }
    float _1845 = _1841;
    float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1849 = _1687 * _1847;
    float _1851 = _1845;
    if (!_1583)
    {
        float _1853 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1855 = _1853 * 0.15915493667125701904296875;
        float _1857 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1859 = _1855 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        float _1863 = _1857 * 0.15915493667125701904296875;
        float _1865 = _1855 * 6.283185482025146484375;
        float _1867 = sin(_1865);
        float _1869 = 1.0 / _1861;
        float _1871 = _1863 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = _1863 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = 1.0 / _1881;
        float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1887 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1885;
        float _1889 = 1.0 / _1887;
        float _1891 = _1879 * _1883;
        float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1895 = fma(_1849, _1891, _1893);
        float _1897 = _1895 * _1889;
        float _1899 = precise::clamp(_1897, 0.0, 1.0);
        _1843 = _1855;
        _1257 = _1869;
        _1775 = _1899;
    }
    float _1901 = _1843;
    float _1903 = _1257;
    float _1905 = _1775;
    float _1907 = _1901;
    float _1909 = _1903;
    if (!_1583)
    {
        float _1911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1913 = _1911 * 0.15915493667125701904296875;
        float _1915 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = _1913 * 6.283185482025146484375;
        float _1919 = cos(_1917);
        float _1921 = _1915 * 0.15915493667125701904296875;
        float _1923 = _1913 * 6.283185482025146484375;
        float _1925 = sin(_1923);
        float _1927 = 1.0 / _1919;
        float _1929 = _1921 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = _1921 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = _1931 * _1933;
        float _1941 = 1.0 / _1939;
        float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1945 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1943;
        float _1947 = 1.0 / _1945;
        float _1949 = _1937 * _1941;
        float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1953 = fma(_1849, _1949, _1951);
        float _1955 = _1953 * _1947;
        float _1957 = precise::clamp(_1955, 0.0, 1.0);
        float _1959 = -_1957;
        float _1961 = _1959 + 1.0;
        _1907 = _1939;
        _1909 = _1913;
        _1851 = _1961;
    }
    float _1963 = _1907;
    float _1965 = _1909;
    float _1967 = _1851;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1971 = _1833 + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1975 = _1835 + _1973;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1979 = _1837 + _1977;
    bool _1981 = _879 != 0;
    float _1983 = _1971 * _1971;
    float _1985 = fma(_1975, _1975, _1983);
    float _1987 = fma(_1979, _1979, _1985);
    float _1989 = rsqrt(_1987);
    float _1991 = sqrt(_1987);
    float _1993 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1995 = _1975 * _1993;
    float _1997 = _1979 * _1993;
    float _1999 = _1995 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 + _2001;
    float _2005 = sqrt(_2003);
    bool _2007 = _2005 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = _2005 + _2009;
    float _2013 = _1963;
    float _2015 = _2003;
    float _2017 = _2011;
    float _2019 = _1971;
    if (_2007)
    {
        float _2021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2013 = _2021;
    }
    float _2023 = _2013;
    if (_2007)
    {
        float _2025 = rsqrt(_2003);
        _2015 = _2025;
    }
    float _2027 = _2015;
    float _2029 = _2023;
    float _2031 = _2027;
    if (_2007)
    {
        float _2033 = _2011 * _2023;
        _2017 = _2033;
    }
    float _2035 = _2017;
    if (_2007)
    {
        float _2037 = _2035 * 0.15915493667125701904296875;
        _2029 = _2037;
    }
    float _2039 = _2029;
    float _2041 = _1979;
    float _2043 = _2039;
    if (_2007)
    {
        float _2045 = _2039 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        _2041 = _2047;
    }
    float _2049 = _2041;
    float _2051 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2053 = precise::max(0.0, _2051);
    float _2055 = _1965;
    if (_2007)
    {
        float _2057 = _2039 * 6.283185482025146484375;
        float _2059 = cos(_2057);
        _2055 = _2059;
    }
    float _2061 = _2055;
    float _2063 = -_1993;
    float _2065 = -_2053;
    float _2067 = fma(_1971, _2063, _2065);
    float _2069 = _2067;
    if (_2007)
    {
        float _2071 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2019 = _2071;
    }
    float _2073 = _2019;
    float _2075 = _2049;
    float _2077 = _2073;
    if (_2007)
    {
        float _2079 = fma(_2049, _2073, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2075 = _2079;
    }
    float _2081 = _2075;
    float _2083 = _2081;
    float _2085 = _2061;
    if (_2007)
    {
        float _2087 = _2061 + (-1.0);
        _2077 = _2087;
    }
    float _2089 = _2077;
    float _2091 = _2089;
    if (_2007)
    {
        float _2093 = _2027 * _2081;
        _1705 = _2093;
    }
    float _2095 = _1705;
    if (!_2007)
    {
        _2083 = _1995;
    }
    float _2097 = _2083;
    float _2099 = _2097;
    if (_2007)
    {
        float _2101 = _2089 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2043 = _2101;
    }
    float _2103 = _2043;
    if (_2007)
    {
        float _2105 = _1995 * _2095;
        _2099 = _2105;
    }
    float _2107 = _2099;
    if (!_2007)
    {
        _2091 = _1997;
    }
    float _2109 = _2091;
    float _2111 = _2109;
    if (_2007)
    {
        float _2113 = _1997 * _2095;
        _2111 = _2113;
    }
    float _2115 = _2111;
    if (!_2007)
    {
        _2031 = _1999;
    }
    float _2117 = _2031;
    float _2119 = _2117;
    if (_2007)
    {
        float _2121 = fma(_2067, _2061, _2103);
        _2069 = _2121;
    }
    float _2123 = _2069;
    if (_2007)
    {
        float _2125 = _2107 * _2107;
        _2119 = _2125;
    }
    float _2127 = _2119;
    if (!_2007)
    {
        _2085 = _2001;
    }
    float _2129 = _2085;
    float _2131 = _2129;
    if (_2007)
    {
        float _2133 = _2115 * _2115;
        _2131 = _2133;
    }
    float _2135 = _2131;
    float _2137 = fma(_2123, _2123, _2127);
    float _2139 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2141 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2143 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2145 = _2137 + _2135;
    float _2147 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2139);
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_1991, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2157 = rsqrt(_2145);
    float _2159 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2147);
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2155);
    float _2167 = _1833 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2169 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2171 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2143);
    float _2173 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2175 = abs(_2163);
    float _2177 = log2(_2175);
    float _2179 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2181 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2171);
    float _2183 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2167);
    float _2185 = _2173 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2187 = -_2179;
    float _2189 = fma(_2187, _2141, 1.0);
    float _2191 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2183);
    float _2195 = _2157 * _2107;
    float _2197 = _2157 * _2123;
    float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2201 = _2157 * _2115;
    float _2203 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2205 = _2193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2207 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2199);
    float _2209 = log2(_2189);
    float _2211 = -_2203;
    float _2213 = fma(_2197, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2211);
    float _2215 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2217 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2207);
    float _2219 = -_2201;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2213);
    float _2223 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2225 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2217);
    float _2227 = exp2(_2215);
    float _2229 = fma(_2221, -0.5, 0.5);
    float _2231 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2233 = fma(_2221, 0.5, 0.5);
    float _2235 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2223);
    float _2237 = _2197 + 1.0;
    float _2239 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2231);
    float _2241 = fma(_2233, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2243 = 1.0 / _2225;
    float _2245 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2235);
    float _2247 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2239);
    float _2249 = fma(_2233, _2241, -0.212114393711090087890625);
    float _2251 = _2209 * 0.693147182464599609375;
    float _2253 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2245);
    float _2255 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2247);
    float _2257 = sqrt(_2229);
    float _2259 = -_2197;
    float _2261 = fma(_2227, _2237, _2259);
    float _2263 = fma(_2233, _2249, 1.570728778839111328125);
    float _2265 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2267 = fma(_2261, 0.5, 0.5);
    float _2269 = _2253 * _2243;
    float _2271 = _2255 * _2243;
    float _2273 = fma(_2269, 0.5, 0.5);
    float _2275 = fma(_2271, -0.5, 0.5);
    float _2277 = _2257 * 0.636619746685028076171875;
    float _2279 = -_2263;
    float _2281 = fma(_2277, _2279, 1.0);
    float3 _6780 = float3(_2273, _2275, _2265);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float3 _6791 = float3(_2273, _2275, _2265);
    float4 _2286 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6791, float3(0.0), isnan(_6791)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6791, float3(0.0), isnan(_6791)), level(0.0)).xyzw;
    float _2288 = _2286.x;
    float _2290 = _2286.y;
    float _2292 = _2286.z;
    float _2294 = _2286.w;
    float2 _6808 = float2(_2281, _2267);
    float3 _2298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6808, float2(0.0), isnan(_6808)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6808, float2(0.0), isnan(_6808)), level(0.0)).xyz;
    float _2300 = _2298.x;
    float _2302 = _2298.y;
    float _2304 = _2298.z;
    float _2306 = float(uint(_1155));
    float _2308 = trunc(_1267);
    int _2310 = int(_2308);
    int _2312 = ~_1155;
    int _2314 = _2312 + 1;
    float _2316 = _945 * (-0.15915493667125701904296875);
    float _2318 = -_1251;
    float _2320 = _2318 + 1.0;
    float _2322 = -_971;
    float _2324 = _2322 + 1.0;
    float _2326 = 1.0 / _2306;
    bool _2328 = !_997;
    float _2330 = _2328 ? _789 : _787;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2334 = _2332 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2336 = !_997;
    float _2338 = _2336 ? 1.2345600128173828125 : 1.0;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2340;
    bool _2344 = _793 > 0.5;
    float _2346 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2350 = _2348 != 0;
    float _2352 = _2338 * _2330;
    float _2354 = float(uint(_2310));
    float _2356 = 1.0 / _2334;
    float _2358 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2360 = -_197;
    int _2362 = _2344 ? as_type<int>(_2360) : as_type<int>(_197);
    float _2364 = -_197;
    int _2366 = _1981 ? as_type<int>(_2364) : as_type<int>(_197);
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _2372 = as_type<int>(_2326) + (-2);
    float _2374 = 1.0 / _2342;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2378 = _2376 != 0;
    float _2380 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2358);
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2384 = _2382 != 0;
    float _2386 = as_type<float>(_2372) * _2354;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2390 = _2388 != 0;
    float _2392 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    int _2394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2396 = _2394 != 0;
    float _2398 = trunc(_2386);
    float _2400 = precise::max(_2398, 0.0);
    uint _2403 = uint(_2400);
    bool _2405 = !_2350;
    float _2407 = _2405 ? _197 : as_type<float>(_2366);
    bool _2409 = _787 > 0.5;
    float _2411 = 1.0 / _2370;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2417 = !_2384;
    float _2419 = _2417 ? _197 : as_type<float>(_2362);
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2421;
    bool _2425 = _1155 == 0;
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2429 = _2427 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _2431 = abs(_823);
    int _2433 = _2314 * int(_2403);
    int _2435 = _2433 + _2310;
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2439 = _781 + _2437;
    float _2441 = _2423 * _2356;
    float _2443 = 1.0 / _2415;
    float _2445 = _2439 * _2374;
    float _2447 = float(uint(_2435));
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2451 = _2449 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _2453 = ~_1155;
    int _2455 = _2453 + 1;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2459 = _2457 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2461 = as_type<float>(_2372) * _2447;
    float _2463 = 1.0 / _2429;
    float _2465 = _2451 * _2411;
    float _2467 = trunc(_2461);
    float _2469 = precise::max(_2467, 0.0);
    uint _2471 = uint(_2469);
    float _2473 = 1.0 / _783;
    int _2475 = int(_2403) + int(_2471);
    float _2477 = _2316 * 6.283185482025146484375;
    float _2479 = sin(_2477);
    int _2481 = ~_1155;
    int _2483 = _2481 + 1;
    int _2485 = _2483 * _2475;
    int _2487 = _2485 + _2310;
    float _2489 = _1265 * _2473;
    float _2491 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2493 = _2491 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2495 = _2316 * 6.283185482025146484375;
    float _2497 = cos(_2495);
    bool _2499 = uint(_2487) >= uint(_1155);
    bool _2501 = !_2499;
    int _2503 = _2501 ? 0 : (-1);
    float _2505 = floor(_2352);
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2509 = _2507 != 0;
    float _2511 = float(_2310);
    int _2513 = ~_2475;
    int _2515 = _2513 + _2503;
    int _2517 = _2515 + 1;
    bool _2519 = _2511 >= _1239;
    bool _2521 = isnan(_2511);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(_1239);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = 1.0 / _2459;
    int _2533 = _1155 * _2517;
    int _2535 = _2533 + _2310;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2545 = trunc(_2529);
    int _2547 = int(_2545);
    float _2549 = -_2505;
    float _2551 = _2352 + _2549;
    float _2553 = _2543 * _2463;
    bool _2555 = !_2425;
    int _2557 = _2555 ? _2535 : (-1);
    float _2559 = _2551 * _1239;
    float _2561 = _2539 * _2443;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _2567 = _1155 + (-1);
    float _2569 = trunc(_2489);
    int _2571 = int(_2569);
    float _2573 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2573;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _2581 = abs(_817);
    bool _2583 = !_2396;
    int _2585 = _2583 ? 0 : 1;
    float _2587 = _2579 * _2531;
    float _2589 = 1.0 / _2565;
    int _2591 = ~_2547;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = -_193;
    int _2599 = _841 ? as_type<int>(_2597) : as_type<int>(_193);
    bool _2601 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2603 = isnan(_785);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2609 = _2605 || _2607;
    float _2611 = float(_2609);
    int _2613 = _2557 * _2595;
    bool _2615 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2617 = isnan(_785);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = trunc(_2559);
    int _2629 = int(_2627);
    int _2631 = _2547 * _2567;
    int _2633 = _2631 + _2613;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2637 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2635;
    int _2639 = _2633 * _2581;
    float _2641 = _2637 * _2589;
    int _2643 = abs(_2585);
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2647 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2645;
    int _2649 = abs(_1349);
    float _2651 = 1.0 / _2493;
    float _2653 = fma(_2647, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2655 = -_193;
    int _2657 = _2409 ? as_type<int>(_2655) : as_type<int>(_193);
    int _2659 = _2629 * _2643;
    int _2661 = _2659 + _2310;
    bool _2663 = !_2378;
    float _2665 = _2663 ? _193 : as_type<float>(_2599);
    int _2667 = _2571 * _2431;
    int _2669 = _2667 + _2639;
    bool _2671 = !_2390;
    float _2673 = _2671 ? _193 : as_type<float>(_2657);
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2677 = _785 + _2675;
    int _2679 = _2661 * _2649;
    int _2681 = _2679 + _2669;
    int _2683 = abs(_1327);
    float _2685 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2687 = _785 + _2685;
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2689;
    float _2693 = fma(_2553, _2677, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    int _2695 = _2629 * _2683;
    int _2697 = _2695 + _2681;
    float _2699 = fma(_2441, _2687, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2701;
    float _2705 = fma(_2691, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2709 = _785 + _2707;
    float _2711 = float(uint(_2697));
    float _2713 = fma(_2703, _2445, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2717 = _785 + _2715;
    bool _2719 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2721 = isnan(_785);
    bool _2723 = _2719 || _2721;
    bool _2725 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2727 = _2723 || _2725;
    float _2729 = float(_2727);
    float _2731 = fma(_2561, _2709, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2733 = as_type<float>(_2372) * _2711;
    float _2735 = fma(_2465, _2717, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2737 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2739 = isnan(_785);
    bool _2741 = _2737 || _2739;
    bool _2743 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2745 = _2741 || _2743;
    float _2747 = float(_2745);
    float _2749 = -_2729;
    float _2751 = _2749 + 1.0;
    bool _2753 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2755 = isnan(_785);
    bool _2757 = _2753 || _2755;
    bool _2759 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2761 = _2757 || _2759;
    float _2763 = float(_2761);
    float _2765 = _2575 * _2651;
    float _2767 = trunc(_2733);
    float _2769 = precise::max(_2767, 0.0);
    uint _2771 = uint(_2769);
    float _2773 = -_2747;
    float _2775 = _2773 + 1.0;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2779 = _785 + _2777;
    bool _2781 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2783 = isnan(_785);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2789 = _2785 || _2787;
    float _2791 = float(_2789);
    float _2793 = -_2763;
    float _2795 = _2793 + 1.0;
    float _2797 = _2747 * _2751;
    float _2799 = _2763 * _2775;
    float _2801 = fma(_2765, _2779, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2803 = _2791 * _2795;
    bool _2805 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2807 = isnan(_785);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2611;
    float _2819 = _2817 + 1.0;
    bool _2821 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2823 = isnan(_785);
    bool _2825 = _2821 || _2823;
    bool _2827 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2829 = _2825 || _2827;
    float _2831 = float(_2829);
    float _2833 = -_2791;
    float _2835 = _2833 + 1.0;
    float _2837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2839 = _2815 * _2819;
    int _2841 = _2455 * int(_2771);
    int _2843 = _2841 + _2697;
    float _2845 = _2611 * _2835;
    bool _2847 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2849 = isnan(_781);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = float(uint(_2843));
    float _2861 = -_2815;
    float _2863 = _2861 + 1.0;
    bool _2865 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2867 = isnan(_781);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2879 = _785 + _2877;
    float _2881 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2883 = _785 + _2881;
    float _2885 = as_type<float>(_2372) * _2859;
    float _2887 = _2831 * _2863;
    float _2889 = -_2831;
    float _2891 = _2889 + 1.0;
    float _2893 = -_2875;
    float _2895 = _2893 + 1.0;
    float _2897 = trunc(_2885);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    float _2903 = fma(_2587, _2879, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2905 = _2625 * _2891;
    float _2907 = _2857 * _2895;
    float _2909 = -_2857;
    float _2911 = _2909 + 1.0;
    float _2913 = -_2625;
    float _2915 = _2913 + 1.0;
    float _2917 = _2699 * _2905;
    float _2919 = fma(_2641, _2883, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2921 = _2653 * _2907;
    float _2923 = _2705 * _2907;
    float _2925 = _2713 * _2907;
    float _2927 = fma(_2915, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2917);
    float _2929 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2921);
    float _2931 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2923);
    float _2933 = fma(_2911, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2925);
    float _2935 = _2407 * _2479;
    float _2937 = fma(_2735, _2887, _2927);
    int _2939 = ~_1155;
    int _2941 = _2939 + 1;
    float _2943 = _2407 * _2497;
    int _2945 = int(_2771) + int(_2901);
    float _2947 = -_2935;
    float _2949 = fma(_2673, _2497, _2947);
    float _2951 = float(uint(_2661));
    float _2953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2955 = _2837 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2957 = _963 + 0.5;
    int _2959 = _2941 * _2945;
    int _2961 = _2959 + _2697;
    float _2963 = as_type<float>(_2372) * _2951;
    int _2965 = ~_1155;
    int _2967 = _2965 + 1;
    float _2969 = fma(_2955, _2957, _1105);
    float _2971 = fma(_2673, _2479, _2943);
    float _2973 = trunc(_2963);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    bool _2979 = uint(_2961) >= uint(_1155);
    float _2981 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2931);
    float _2983 = _2949 + 0.5;
    float _2985 = fma(_2731, _2839, _2937);
    bool _2987 = !_2979;
    int _2989 = _2987 ? 0 : (-1);
    float _2991 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2929);
    float _2993 = fma(_2875, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2933);
    float _2995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2997 = ~_2945;
    int _2999 = _2997 + _2989;
    int _3001 = _2999 + 1;
    float _3003 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3005 = _2665 + 0.5;
    float _3007 = fma(_2693, _2845, _2985);
    float _3009 = fma(_3003, _2983, _949);
    int _3011 = _1155 * _3001;
    int _3013 = _3011 + _2697;
    float _3015 = fma(_3005, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1205);
    int _3017 = _2967 * int(_2977);
    int _3019 = _3017 + _2661;
    float _3021 = _2971 + (-0.5);
    float _3023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3025 = !_2425;
    int _3027 = _3025 ? _3013 : (-1);
    float _3029 = fma(_2801, _2803, _3007);
    float _3031 = float(uint(_3019));
    float _3033 = _2991 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3035 = _2995 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3037 = _2419 + (-0.5);
    float _3039 = as_type<float>(_2372) * _3031;
    int _3041 = _3027 >> 31;
    float _3043 = -_3035;
    float _3045 = -_965;
    float _3047 = fma(_3043, _3021, _3045);
    float _3049 = -_3037;
    float _3051 = -_1275;
    float _3053 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3051);
    float _3055 = _2981 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3057 = _3041 & 3;
    float _3059 = _2993 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3063 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3065 = _3027 + _3057;
    float _3067 = _969 + (-0.5);
    float _3069 = _3033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3071 = _3055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3073 = _3065 >> 2;
    float _3075 = -_3063;
    float _3077 = -_1277;
    float _3079 = fma(_3075, _3067, _3077);
    float _3081 = _3059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3083 = trunc(_3039);
    float _3085 = precise::max(_3083, 0.0);
    uint _3087 = uint(_3085);
    int _3089 = _3073 << 4;
    int _3091 = _3089 + 512;
    float _3093 = -_1273;
    float _3095 = _3093 + 1.0;
    int _3097 = _3027 & 3;
    bool _3099 = _3097 != 0;
    out.m_58.x = _3069;
    out.m_58.y = _3071;
    out.m_58.z = _3081;
    out.m_58.w = _3061;
    uint _3101 = uint(int(uint(_3091) >> uint(2)));
    uint _3103 = uint(int(uint(int(_3101)) >> uint(2)));
    int _3105 = int(_3101) & 3;
    float _3107 = (*spvDescriptorSet0.vp_c9)._m0[int(_3103)][_3105];
    int _3109 = int(_3101) + 1;
    uint _3111 = uint(int(uint(_3109) >> uint(2)));
    int _3113 = _3109 & 3;
    float _3115 = (*spvDescriptorSet0.vp_c9)._m0[int(_3111)][_3113];
    float _3117 = -_1269;
    float _3119 = _3117 + 1.0;
    int _3121 = _3027 & 3;
    bool _3123 = _3121 != 0;
    float _3125 = -_3095;
    float _3127 = fma(_2665, _3125, _3015);
    int _3129 = ~_1155;
    int _3131 = _3129 + 1;
    float _3133 = fma(_2903, _2799, _3029);
    bool _3135 = uint(_3121) > 1u;
    float _3137 = -_2320;
    float _3139 = fma(_2949, _3137, _3009);
    bool _3141 = uint(_3121) >= 2u;
    float _3143 = fma(_2971, _3119, _3047);
    float _3145 = fma(_969, _2324, _3079);
    int _3147 = int(_2977) + int(_3087);
    float _3149 = exp2(_2346);
    int _3151 = _3091 + 8;
    uint _3153 = uint(int(uint(_3151) >> uint(2)));
    uint _3155 = uint(int(uint(int(_3153)) >> uint(2)));
    int _3157 = int(_3153) & 3;
    float _3159 = (*spvDescriptorSet0.vp_c9)._m0[int(_3155)][_3157];
    int _3161 = int(_3153) + 1;
    uint _3163 = uint(int(uint(_3161) >> uint(2)));
    int _3165 = _3161 & 3;
    float _3167 = (*spvDescriptorSet0.vp_c9)._m0[int(_3163)][_3165];
    float _3169 = -_1271;
    float _3171 = _3169 + 1.0;
    float _3173 = -_1215;
    float _3175 = _3173 + 1.0;
    int _3177 = _3141 ? 0 : 1;
    float _3179 = fma(_2919, _2797, _3133);
    float _3181 = -_3171;
    float _3183 = fma(_963, _3181, _2969);
    int _3185 = _3131 * _3147;
    int _3187 = _3185 + _2661;
    int _3189 = _3099 ? 0 : 1;
    float _3191 = fma(_2419, _3175, _3053);
    bool _3193 = _3121 != 3;
    float _3195 = fma(_2729, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3179);
    bool _3197 = uint(_3187) >= uint(_1155);
    out.m_60.x = _3183;
    out.m_60.y = _3145;
    int _3199 = ~_3189;
    int _3201 = _3199 + 1;
    int _3203 = _3201 + 1;
    float _3205 = -_3149;
    float _3207 = _3205 + 1.0;
    int _3209 = _3203;
    if (!_3135)
    {
        int _3211 = ~_3189;
        int _3213 = _3211 + 1;
        _3209 = _3213;
    }
    int _3215 = _3209;
    out.m_62.x = _3139;
    out.m_62.y = _3143;
    out.m_62.z = _3127;
    out.m_62.w = _3191;
    bool _3217 = !_3123;
    int _3219 = _3217 ? 0 : 1;
    int _3221 = abs(_3215);
    out.m_64.x = _3195;
    bool _3223 = _3121 != 3;
    bool _3225 = !_3197;
    int _3227 = _3225 ? 0 : (-1);
    int _3229 = ~_3147;
    int _3231 = _3229 + _3227;
    int _3233 = _3231 + 1;
    int _3235 = ~_3177;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = abs(_3219);
    int _3243 = _1155 * _3233;
    int _3245 = _3243 + _2661;
    int _3247 = _3239;
    if (_3193)
    {
        int _3249 = ~_3177;
        int _3251 = _3249 + 1;
        _3247 = _3251;
    }
    int _3253 = _3247;
    bool _3255 = !_3223;
    int _3257 = _3255 ? 0 : (-1);
    int _3259 = abs(_3253);
    int _3261 = ~_3221;
    int _3263 = _3261 + 1;
    int _3265 = _3263 + 1;
    int _3267 = abs(_3257);
    int _3269 = ~_3241;
    int _3271 = _3269 + 1;
    int _3273 = _3271 + 1;
    int _3275 = _3265 * as_type<int>(_3115);
    bool _3277 = !_2509;
    int _3279 = _3277 ? 0 : 1;
    int _3281 = _3273 * as_type<int>(_3107);
    int _3283 = _3281 + _3275;
    int _3285 = ~_3259;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    int _3291 = abs(_3279);
    int _3293 = ~_3267;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    int _3299 = _3289 * as_type<int>(_3159);
    int _3301 = _3299 + _3283;
    float _3303 = _2225 * 0.5;
    float _3305 = _1905 * _1967;
    bool _3307 = _1905 > 0.0;
    bool _3309 = isnan(_1905);
    bool _3311 = _3307 || _3309;
    bool _3313 = isnan(0.0);
    bool _3315 = _3311 || _3313;
    int _3317 = _3297 * as_type<int>(_3167);
    int _3319 = _3317 + _3301;
    int _3321 = ~_3291;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    float _3327 = _3305 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3329 = !_2425;
    int _3331 = _3329 ? _3245 : (-1);
    bool _3333 = _1967 <= 0.0;
    bool _3335 = !_3315;
    bool _3337 = _3333 || _3335;
    int _3339 = _3319 * _3325;
    float _3341 = fma(_2205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2392);
    float _3343 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3345 = _3331 * _3291;
    int _3347 = _3345 + _3339;
    float _3349 = fma(_2255, -0.5, _3303);
    float _3351 = _3341 + _2225;
    float _3353 = _2253 + _2225;
    out.gl_Position.x = _2253;
    out.gl_Position.y = _2255;
    out.gl_Position.z = _3341;
    out.gl_Position.w = _2225;
    float _3355 = float(_3347);
    float _3357 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3359 = _3351 * 0.5;
    float _3361 = _3353 * 0.5;
    float _3363 = _3357 * _2283;
    float _3365 = -_3357;
    float _3367 = _3365 + 1.0;
    out.m_45.x = _3343;
    float _3369 = _2294 * _3363;
    float _3371 = _2304 * _3363;
    out.m_66.x = _3361;
    out.m_66.y = _3349;
    out.m_66.z = _3359;
    out.m_66.w = _2225;
    float _3373 = fma(_2300, _3369, _2288);
    float _3375 = fma(_2302, _3369, _2290);
    float _3377 = _2294 * _3367;
    float _3379 = fma(_2294, _3371, _2292);
    out.m_68.y = _3355;
    out.m_70.x = _3373;
    out.m_70.y = _3375;
    out.m_70.z = _3379;
    out.m_70.w = _3377;
    if (!_3337)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3381 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3381;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

