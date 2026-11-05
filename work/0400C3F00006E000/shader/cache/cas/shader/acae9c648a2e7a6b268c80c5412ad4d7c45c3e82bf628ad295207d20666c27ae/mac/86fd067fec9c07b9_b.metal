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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
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
    float4 m_58 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _939 = false;
    bool _841 = false;
    bool _571 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = in.m_44.w;
    float _88 = trunc(_84);
    int _91 = int(_88);
    float _93 = -_86;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _95;
    bool _99 = _91 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_91);
    float _105 = _95;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_99)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_113);
        out.gl_Position.z = _3172;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _117 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_86);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = float(_91);
    bool _129 = _95 >= _127;
    bool _131 = !_125;
    bool _133 = _129 || _131;
    if (_133)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _103;
    if (_133)
    {
        out.m_49.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _115 = as_type<int>(_137);
    }
    int _139 = _115;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3227 = as_type<float>(_139);
        out.gl_Position.z = _3227;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_54.w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    float _163 = in.m_42.x;
    float _165 = in.m_42.y;
    float _167 = in.m_42.z;
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = _141;
    if (!_155)
    {
        float _179 = _143 * _143;
        float _181 = _179 * 0.5;
        _177 = _181;
    }
    float _183 = _177;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _183;
    if (!_155)
    {
        float _191 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_155;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _143 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _143);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _237 = 1.0 / _127;
    float _239 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _245 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _247 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _249 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].x, _243);
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].y, _245);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    float _257 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    float _259 = _249;
    if (!_155)
    {
        _259 = _143;
    }
    float _261 = _259;
    bool _263 = !_155;
    float _265 = _261;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _143 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _265 = _285;
    }
    float _287 = _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _293 = fma(_287, _157, _255);
    float _295 = fma(_287, _159, _257);
    float _297 = _95 * _237;
    float _299 = fma(_287, _161, _291);
    float _301 = fma(_293, _145, _163);
    float _303 = fma(_295, _145, _165);
    float _305 = fma(_299, _145, _167);
    bool _307 = !_289;
    float _309 = _297;
    float _327;
    if (!_307)
    {
        float _311 = in.m_56.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        _327 = _297;
    }
    _329 = false;
    float _331 = _327;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = 1.0 / _343;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _361 = 1.0 / _347;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _331 + _363;
    float _367 = 1.0 / _351;
    float _369 = _335 * _357;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _331 + _371;
    float _375 = 1.0 / _355;
    float _377 = _339 * _361;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    bool _383 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_331);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_381, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _365 * _367;
    bool _399 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _401 = isnan(_331);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_393;
    float _413 = _411 + 1.0;
    bool _415 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_331);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_409;
    float _429 = _427 + 1.0;
    float _431 = _373 * _375;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _433;
    float _437 = _393 * _429;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = fma(_435, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _449 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _451 = isnan(_331);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = fma(_441, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = fma(_445, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _465 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _467 = isnan(_331);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _459 * _413;
    float _479 = -_459;
    float _481 = _479 + 1.0;
    float _483 = in.m_54.x;
    float _485 = in.m_54.y;
    float _487 = _425 * _481;
    float _489 = -_425;
    float _491 = _489 + 1.0;
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = _475 * _491;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = _447 * _497;
    float _509 = _395 * _497;
    float _511 = fma(_501, _397, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_505, _397, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _515 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _517 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _527 = fma(_461, _487, _515);
    float _529 = fma(_463, _487, _517);
    float _531 = fma(_521, _431, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_525, _431, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _535 = fma(_511, _477, _527);
    float _537 = fma(_513, _477, _529);
    float _539 = fma(_531, _437, _535);
    float _541 = fma(_533, _437, _537);
    float _543 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[147].x, _539);
    float _545 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[147].y, _541);
    float _547 = _543 * _483;
    float _549 = _545 * _485;
    bool _551 = !_359;
    float _569;
    if (!_551)
    {
        float _553 = in.m_56.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        _569 = _297;
    }
    _571 = false;
    float _573 = _569;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _577 = _573 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _585 = _573 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _603 = 1.0 / _597;
    bool _605 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _607 = isnan(_573);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _593;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _621 = _573 + _619;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _625 = 1.0 / _601;
    float _627 = _581 * _603;
    float _629 = 1.0 / _589;
    float _631 = _621 * _617;
    bool _633 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _635 = isnan(_573);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    bool _645 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _647 = isnan(_573);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_643;
    float _659 = _657 + 1.0;
    float _661 = _577 * _625;
    bool _663 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _665 = isnan(_573);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _675;
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = _673 * _659;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = _585 * _629;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _695;
    float _699 = fma(_677, _627, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _705 = fma(_693, _627, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _707 = fma(_697, _627, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _709 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _711 = isnan(_573);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _615 * _681;
    float _723 = -_615;
    float _725 = _723 + 1.0;
    float _727 = _655 * _687;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _737 = _719 * _725;
    float _739 = -_719;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, _661, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _745 = fma(_703, _661, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _747 = _699 * _737;
    float _749 = _705 * _737;
    float _751 = _707 * _737;
    float _753 = fma(_735, _661, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _763;
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].x, _747);
    float _769 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].y, _749);
    float _771 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].z, _751);
    float _773 = fma(_757, _689, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _775 = fma(_761, _689, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _777 = fma(_765, _689, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _779 = fma(_743, _721, _767);
    float _781 = fma(_745, _721, _769);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _791 = fma(_753, _721, _771);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _797 = fma(_773, _727, _779);
    float _799 = fma(_785, _631, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _801 = fma(_789, _631, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _803 = fma(_795, _631, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _805 = fma(_775, _727, _781);
    float _807 = fma(_777, _727, _791);
    float _809 = fma(_799, _683, _797);
    float _811 = fma(_801, _683, _805);
    float _813 = fma(_803, _683, _807);
    float _815 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].x, _809);
    float _817 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].y, _811);
    float _819 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].z, _813);
    bool _821 = !_623;
    float _839;
    if (!_821)
    {
        float _823 = in.m_56.x;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _827 = _823 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        _839 = _297;
    }
    _841 = false;
    float _843 = _839;
    bool _845 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = isnan(_843);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _861 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _863 = isnan(_843);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _879 = _843 + _877;
    float _881 = -_855;
    float _883 = _881 + 1.0;
    bool _885 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _887 = 1.0 / _859;
    float _889 = _871 * _883;
    float _891 = -_871;
    float _893 = _891 + 1.0;
    float _895 = _875 * _887;
    float _897 = _819 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _899 = fma(_895, _879, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _901 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _899 * _889;
    float _907 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[115].x, _905);
    float _911 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _913 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[116].x, _909);
    float _915 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _913 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _915;
    out.m_58.y = _907;
    out.m_58.z = _903;
    out.m_58.w = _917;
    bool _919 = !_885;
    float _937;
    if (!_919)
    {
        float _921 = in.m_56.x;
        float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _925 = _921 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].z, _95);
        float _929 = _927 * _923;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _935;
        _939 = true;
    }
    else
    {
        _937 = _297;
    }
    _939 = false;
    float _941 = _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _945 = _941 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = _941 + _947;
    bool _951 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _953 = isnan(_941);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _981 = _941 + _979;
    float _983 = 1.0 / _973;
    bool _985 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _987 = isnan(_941);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = 1.0 / _969;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1001 = _941 + _999;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1005 = 1.0 / _965;
    float _1007 = _945 * _983;
    float _1009 = 1.0 / _977;
    float _1011 = _1001 * _997;
    bool _1013 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1015 = isnan(_941);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = -_961;
    float _1027 = _1025 + 1.0;
    float _1029 = _1023 * _1027;
    float _1031 = _949 * _1005;
    bool _1033 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1035 = isnan(_941);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1045;
    float _1049 = -_1023;
    float _1051 = _1049 + 1.0;
    float _1053 = fma(_1047, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1055 = -_1043;
    float _1057 = _1055 + 1.0;
    float _1059 = _981 * _1009;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1065;
    float _1069 = fma(_1063, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1071 = fma(_1067, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1073 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1075 = isnan(_941);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1043 * _1051;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = _995 * _1057;
    float _1093 = -_995;
    float _1095 = _1093 + 1.0;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1105 = fma(_1089, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1107 = _1083 * _1095;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    float _1113 = fma(_1099, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1115 = fma(_1103, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1117 = _1069 * _1107;
    float _1119 = _1071 * _1107;
    float _1121 = _1053 * _1107;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1127;
    float _1131 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1117);
    float _1133 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1119);
    float _1135 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1121);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1137;
    float _1141 = fma(_1125, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1143 = fma(_1129, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1145 = fma(_1113, _1091, _1131);
    float _1147 = fma(_1105, _1091, _1133);
    float _1149 = fma(_1115, _1091, _1135);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1159 = fma(_1139, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1165 = fma(_1141, _1085, _1145);
    float _1167 = fma(_1153, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = fma(_1157, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1171 = fma(_1143, _1085, _1147);
    float _1173 = fma(_1163, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1175 = fma(_1159, _1085, _1149);
    float _1177 = fma(_1167, _1029, _1165);
    float _1179 = fma(_1169, _1029, _1171);
    float _1181 = fma(_1173, _1029, _1175);
    float _1183 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1177);
    float _1185 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1179);
    float _1187 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1181);
    bool _1189 = !_1003;
    if (!_1189)
    {
        float _1191 = in.m_56.x;
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1195 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[11].w, _95);
        float _1199 = _1197 * _1193;
        float _1201 = floor(_1199);
        float _1203 = -_1201;
        float _1205 = _1199 + _1203;
        _309 = _1205;
    }
    float _1207 = _309;
    float _1209 = in.m_56.x;
    float _1211 = in.m_56.y;
    float _1213 = in.m_56.z;
    float _1215 = in.m_56.w;
    float _1217 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1219 = log2(_1217);
    float _1221 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1223 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1235 = _1233 != 0;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1243 = !_1235;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1249 = _1209 * 2.0;
    float _1251 = _1213 * 2.0;
    float _1253 = _1211 * 2.0;
    float _1255 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1257 = floor(_1249);
    float _1259 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1263 = -_1237;
    float _1265 = fma(_1255, 2.0, _1263);
    float _1267 = _1209 + (-0.5);
    float _1269 = fma(_1259, -2.0, _1239);
    float _1271 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1261);
    int _1273 = abs(_1245);
    float _1275 = floor(_1251);
    float _1277 = _1211 + _1209;
    float _1279 = _1277 + (-1.0);
    float _1281 = floor(_1253);
    bool _1283 = _1257 > 0.0;
    float _1285 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1287 = !_1227;
    int _1289 = _1287 ? 0 : 1;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1293 = _1291 != 0;
    bool _1295 = _1257 >= 0.0;
    bool _1297 = isnan(_1257);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.0);
    bool _1303 = _1299 || _1301;
    float _1305 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1307 = int(_1305);
    bool _1309 = _1275 >= 0.0;
    bool _1311 = isnan(_1275);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _1317 ? 0 : 1;
    bool _1321 = _1275 > 0.0;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1325 = _1303 ? 0 : 1;
    float _1327 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1329 = int(_1327);
    float _1331 = _1279;
    float _1333 = _1255;
    if (!_1293)
    {
        _1331 = _1213;
    }
    float _1335 = _1331;
    float _1337 = _1335;
    if (_1293)
    {
        _1337 = _1211;
    }
    float _1339 = _1337;
    bool _1341 = _1281 > 0.0;
    bool _1343 = _1281 >= 0.0;
    bool _1345 = isnan(_1281);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.0);
    bool _1351 = _1347 || _1349;
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1323);
    float _1355 = _1339;
    if (!_1293)
    {
        _1333 = _1211;
    }
    float _1357 = _1333;
    float _1359 = _1357;
    if (_1293)
    {
        _1359 = _1209;
    }
    float _1361 = _1359;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1293)
    {
        _1355 = _1213;
    }
    float _1365 = _1355;
    int _1367 = ~_1319;
    int _1369 = _1367 + 1;
    int _1371 = _1369 + 1;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1375 = _1365;
    int _1377 = _1371;
    if (_1293)
    {
        _1375 = _1211;
    }
    float _1379 = _1375;
    float _1381 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1363);
    if (!_1321)
    {
        int _1383 = ~_1319;
        int _1385 = _1383 + 1;
        _1377 = _1385;
    }
    int _1387 = _1377;
    float _1389 = -_1247;
    float _1391 = fma(_1373, 2.0, _1389);
    int _1393 = abs(_1289);
    float _1395 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1397 = float(_1307);
    float _1399 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1381);
    int _1401 = _1351 ? 0 : 1;
    float _1403 = fma(_1395, -2.0, _1241);
    float _1405 = float(_1393);
    float _1407 = 1.0 / _1397;
    float _1409 = float(_1387);
    int _1411 = ~_1325;
    int _1413 = _1411 + 1;
    int _1415 = _1413 + 1;
    int _1417 = _1415;
    if (!_1283)
    {
        int _1419 = ~_1325;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    float _1425 = _1219 * _95;
    int _1427 = ~_1401;
    int _1429 = _1427 + 1;
    int _1431 = _1429 + 1;
    float _1433 = _1405 * _1409;
    int _1435 = _1431;
    if (!_1341)
    {
        int _1437 = ~_1401;
        int _1439 = _1437 + 1;
        _1435 = _1439;
    }
    int _1441 = _1435;
    float _1443 = exp2(_1425);
    float _1445 = in.m_60.x;
    float _1447 = in.m_60.y;
    float _1449 = in.m_60.z;
    bool _1451 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1453 = isnan(0.0);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1459 = _1455 || _1457;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1463 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1465 = isnan(1.0);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1475 = 1.0 + _1473;
    float _1477 = float(_1329);
    float _1479 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    bool _1481 = !_1231;
    int _1483 = _1481 ? 0 : 1;
    float _1485 = 1.0 / _1475;
    float _1487 = float(_1423);
    float _1489 = -_95;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1265);
    int _1493 = abs(_1483);
    float _1495 = -_1443;
    float _1497 = _1495 + 1.0;
    float _1499 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1269);
    float _1501 = _1477 * _95;
    float _1503 = _1433 * (-2.0);
    float _1505 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1353);
    float _1507 = _1459 ? _1497 : 0.0;
    float _1509 = _1407 * _95;
    float _1511 = float(_1493);
    float _1513 = fma(_1503, _1445, _1445);
    float _1515 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1479);
    float _1517 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1271);
    float _1519 = -_95;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1391);
    float _1523 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1403);
    if (_1471)
    {
        float _1525 = _1507 * _1485;
        _105 = _1525;
    }
    float _1527 = _105;
    float _1529 = fma(_1285, _1503, _1285);
    float _1531 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1513);
    float _1533 = _1511 * _1487;
    float _1535 = _1211 + _1213;
    float _1537 = fma(_1529, _1527, _1531);
    float _1539 = _1533 * (-2.0);
    float _1541 = float(_1273);
    float _1543 = _1535 + (-1.0);
    float _1545 = float(_1441);
    float _1547 = _1537 * 0.15915493667125701904296875;
    float _1549 = fma(_1539, _1447, _1447);
    float _1551 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1553 = _1213 + _1209;
    float _1555 = _1541 * _1545;
    float _1557 = _1211 + (-0.5);
    float _1559 = fma(_1551, _1539, _1551);
    float _1561 = _1555 * (-2.0);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1549);
    float _1565 = _1553 + (-1.0);
    float _1567 = _1547 * 6.283185482025146484375;
    float _1569 = sin(_1567);
    float _1571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1573 = fma(_1559, _1527, _1563);
    float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1577 = fma(_1561, _1449, _1449);
    float _1579 = _1213 + (-0.5);
    float _1581 = _1573 * 0.15915493667125701904296875;
    float _1583 = fma(_1575, _1561, _1575);
    float _1585 = _1547 * 6.283185482025146484375;
    float _1587 = cos(_1585);
    float _1589 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1577);
    float _1591 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1593 = _1223 * _1571;
    bool _1595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1597 = isnan(0.5);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1603 = _1599 || _1601;
    float _1605 = fma(_1583, _1527, _1589);
    float _1607 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1609 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1611 = _1581 * 6.283185482025146484375;
    float _1613 = sin(_1611);
    float _1615 = _1605 * 0.15915493667125701904296875;
    float _1617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1619 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1607);
    float _1621 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1609);
    float _1623 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1591);
    float _1625 = _1221 * _1617;
    float _1627 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1619);
    float _1629 = _1615 * 6.283185482025146484375;
    float _1631 = cos(_1629);
    float _1633 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1623);
    float _1635 = _1581 * 6.283185482025146484375;
    float _1637 = cos(_1635);
    float _1639 = _1569 * _1613;
    float _1641 = _1587 * _1613;
    float _1643 = _1615 * 6.283185482025146484375;
    float _1645 = sin(_1643);
    float _1647 = _1631 * _1625;
    float _1649 = _1613 * _1631;
    float _1651 = _1587 * _1647;
    float _1653 = _1569 * _1647;
    float _1655 = _1587 * _1637;
    float _1657 = _1569 * _1637;
    float _1659 = _1637 * _1631;
    float _1661 = fma(_1645, _1655, _1639);
    float _1663 = -_1641;
    float _1665 = fma(_1645, _1657, _1663);
    float _1667 = -_1657;
    float _1669 = fma(_1645, _1641, _1667);
    float _1671 = -_1625;
    float _1673 = _1645 * _1671;
    float _1675 = fma(_1661, _1593, _1651);
    float _1677 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1679 = fma(_1645, _1639, _1655);
    float _1681 = fma(_1659, _1593, _1673);
    float _1683 = fma(_1665, _1593, _1653);
    float _1685 = fma(_1669, _1677, _1675);
    float _1687 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1621);
    float _1689 = fma(_1649, _1677, _1681);
    float _1691 = fma(_1679, _1677, _1683);
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1697 = _1687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1699 = _1627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1693);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1695);
    float _1705 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = _1633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1701);
    float _1711 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1703);
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1715 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1717 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1721 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1713);
    float _1723 = _1707 + _1717;
    float _1725 = _1699 + _1719;
    float _1727 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1731 = _1723 + _1729;
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1735 = _1725 + _1733;
    float _1737 = 1.0 / _1727;
    float _1739 = _1731 * _1731;
    float _1741 = fma(_1735, _1735, _1739);
    float _1743 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1715);
    float _1745 = sqrt(_1741);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1743);
    float _1749 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1751 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1753 = _1749 + _1727;
    float _1755 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1751);
    float _1757 = _1753 * _1737;
    float _1759 = _1757 * 0.5;
    float _1761 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1755);
    bool _1763 = _1745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1767 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1765);
    float _1769 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1771 = _1759;
    float _1773 = _1691;
    float _1775 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1777 = _1769;
    float _1779 = _1745;
    float _1781 = _1675;
    float _1783 = _1737;
    if (_1603)
    {
        _1771 = 1.0;
    }
    float _1785 = _1771;
    int _1787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1789 = _1787 != 0;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1793 = _1791 != 0;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1797 = _1795 != 0;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1801 = _1799 != 0;
    float _1803 = _1697 + _1769;
    float _1805 = 1.0 / _1767;
    bool _1807 = !_1793;
    int _1809 = _1807 ? 0 : 1;
    bool _1811 = !_1789;
    int _1813 = _1811 ? 0 : 1;
    bool _1815 = !_1797;
    int _1817 = _1815 ? 0 : 1;
    bool _1819 = !_1801;
    int _1821 = _1819 ? 0 : 1;
    float _1823 = _1785;
    if (!_1763)
    {
        _1773 = _1725;
    }
    float _1825 = _1773;
    float _1827 = _1825;
    if (!_1763)
    {
        _1775 = _1723;
    }
    float _1829 = _1775;
    float _1831 = _1829;
    if (!_1763)
    {
        _1777 = _1803;
    }
    float _1833 = _1777;
    bool _1835 = !_1763;
    float _1837 = _1833;
    float _1839 = _1805;
    if (!_1835)
    {
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1845 = _1745 + _1843;
        float _1847 = rsqrt(_1741);
        float _1849 = _1845 * _1841;
        float _1851 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1853 = _1849 * 0.15915493667125701904296875;
        float _1855 = _1853 * 6.283185482025146484375;
        float _1857 = cos(_1855);
        float _1859 = _1853 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = _1857 + (-1.0);
        float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1867 = fma(_1861, _1851, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1869 = fma(_1803, _1857, _1865);
        float _1871 = _1847 * _1867;
        float _1873 = fma(_1735, _1871, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1875 = fma(_1731, _1871, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1837 = _1869;
        _1827 = _1873;
        _1831 = _1875;
    }
    float _1877 = _1837;
    float _1879 = _1827;
    float _1881 = _1831;
    if (_1603)
    {
        _1779 = 1.0;
    }
    float _1883 = _1779;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1887 = _1805 * _1885;
    float _1889 = _1883;
    if (!_1603)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = _1893 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1895 * 0.15915493667125701904296875;
        float _1903 = _1893 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1899;
        float _1909 = _1901 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = _1905 * _1907;
        float _1915 = _1901 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = 1.0 / _1919;
        float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1925 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1923;
        float _1927 = 1.0 / _1925;
        float _1929 = _1917 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1933 = fma(_1887, _1929, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        _1839 = _1893;
        _1823 = _1937;
    }
    float _1939 = _1839;
    float _1941 = _1823;
    float _1943 = _1939;
    if (!_1603)
    {
        float _1945 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1947 = _1945 * 0.15915493667125701904296875;
        float _1949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1951 = _1947 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = _1949 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1953;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = _1955 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1977;
        float _1981 = 1.0 / _1979;
        float _1983 = _1971 * _1975;
        float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1987 = fma(_1887, _1983, _1985);
        float _1989 = _1987 * _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        float _1993 = -_1991;
        float _1995 = _1993 + 1.0;
        _1943 = _1961;
        _1889 = _1995;
    }
    float _1997 = _1943;
    float _1999 = _1889;
    float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2003 = _1877 + _2001;
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2007 = _1879 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2011 = _1881 + _2009;
    float _2013 = _2003 * _2003;
    float _2015 = fma(_2007, _2007, _2013);
    float _2017 = fma(_2011, _2011, _2015);
    float _2019 = rsqrt(_2017);
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2023 = _2007 * _2021;
    float _2025 = _2011 * _2021;
    float _2027 = _2023 * _2023;
    float _2029 = _2025 * _2025;
    float _2031 = _2027 + _2029;
    float _2033 = sqrt(_2031);
    bool _2035 = _2033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2039 = _2033 + _2037;
    float _2041 = _1997;
    float _2043 = _2031;
    float _2045 = _2039;
    float _2047 = _2003;
    float _2049 = _2023;
    float _2051 = _2025;
    float _2053 = _2027;
    float _2055 = _2029;
    if (_2035)
    {
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2041 = _2057;
    }
    float _2059 = _2041;
    if (_2035)
    {
        float _2061 = rsqrt(_2031);
        _2043 = _2061;
    }
    float _2063 = _2043;
    if (_2035)
    {
        float _2065 = _2039 * _2059;
        _2045 = _2065;
    }
    float _2067 = _2045;
    if (_2035)
    {
        float _2069 = _2067 * 0.15915493667125701904296875;
        _1781 = _2069;
    }
    float _2071 = _1781;
    float _2073 = _1803;
    if (_2035)
    {
        float _2075 = _2071 * 6.283185482025146484375;
        float _2077 = sin(_2075);
        _2073 = _2077;
    }
    float _2079 = _2073;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2083 = precise::max(0.0, _2081);
    float _2085 = _2059;
    float _2087 = _2083;
    if (_2035)
    {
        float _2089 = _2071 * 6.283185482025146484375;
        float _2091 = cos(_2089);
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = -_2021;
    float _2097 = -_2083;
    float _2099 = fma(_2003, _2095, _2097);
    if (_2035)
    {
        float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2101;
    }
    float _2103 = _2047;
    float _2105 = _2103;
    if (_2035)
    {
        float _2107 = fma(_2079, _2103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1783 = _2107;
    }
    float _2109 = _1783;
    float _2111 = _2109;
    if (!_2035)
    {
        _2105 = _2099;
    }
    float _2113 = _2105;
    float _2115 = sqrt(_2017);
    float _2117 = _2113;
    if (_2035)
    {
        float _2119 = _2093 + (-1.0);
        _2087 = _2119;
    }
    float _2121 = _2087;
    float _2123 = _2121;
    if (_2035)
    {
        float _2125 = _2063 * _2109;
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (_2035)
    {
        float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2129;
    }
    float _2131 = _2123;
    if (_2035)
    {
        float _2133 = _2023 * _2127;
        _2049 = _2133;
    }
    float _2135 = _2049;
    if (_2035)
    {
        float _2137 = _2025 * _2127;
        _2051 = _2137;
    }
    float _2139 = _2051;
    float _2141 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_2035)
    {
        float _2143 = fma(_2099, _2093, _2131);
        _2117 = _2143;
    }
    float _2145 = _2117;
    if (_2035)
    {
        float _2147 = _2135 * _2135;
        _2053 = _2147;
    }
    float _2149 = _2053;
    if (_2035)
    {
        float _2151 = _2139 * _2139;
        _2055 = _2151;
    }
    float _2153 = _2055;
    float _2155 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2157 = fma(_2145, _2145, _2149);
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2161 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2159);
    float _2163 = precise::clamp(_2161, 0.0, 1.0);
    float _2165 = _2157 + _2153;
    float _2167 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2155);
    float _2169 = -_2163;
    float _2171 = _2169 + 1.0;
    float _2173 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2175 = rsqrt(_2165);
    float _2177 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2167);
    float _2179 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2181 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2173);
    float _2183 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2185 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2187 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2179);
    float _2189 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2191 = abs(_2171);
    float _2193 = log2(_2191);
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2197 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2187);
    float _2199 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2183);
    float _2203 = -_2195;
    float _2205 = fma(_2203, _2141, 1.0);
    float _2207 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2211 = _2175 * _2135;
    float _2213 = _2175 * _2145;
    float _2215 = _2175 * _2139;
    float _2217 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2201);
    float _2219 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2221 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2209);
    float _2223 = log2(_2205);
    float _2225 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2227 = -_2219;
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2227);
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2233 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2221);
    float _2235 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2237 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2233);
    float _2239 = -_2215;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2229);
    float _2243 = exp2(_2231);
    float _2245 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2247 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2235);
    float _2249 = fma(_2241, -0.5, 0.5);
    float _2251 = fma(_2241, 0.5, 0.5);
    float _2253 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2245);
    float _2255 = _2213 + 1.0;
    float _2257 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2247);
    float _2259 = 1.0 / _2237;
    float _2261 = fma(_2251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2263 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2253);
    float _2265 = _2223 * 0.693147182464599609375;
    float _2267 = fma(_2251, _2261, -0.212114393711090087890625);
    float _2269 = _2265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = sqrt(_2249);
    float _2273 = -_2213;
    float _2275 = fma(_2243, _2255, _2273);
    float _2277 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2263);
    float _2279 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2281 = fma(_2251, _2267, 1.570728778839111328125);
    float _2283 = fma(_2275, 0.5, 0.5);
    float _2285 = _2277 * _2259;
    float _2287 = _2279 * _2259;
    float _2289 = fma(_2285, 0.5, 0.5);
    float _2291 = fma(_2287, -0.5, 0.5);
    float _2293 = _2271 * 0.636619746685028076171875;
    float _2295 = -_2281;
    float _2297 = fma(_2293, _2295, 1.0);
    float3 _6678 = float3(_2289, _2291, _2269);
    float _2299 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6678, float3(0.0), isnan(_6678)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6678, float3(0.0), isnan(_6678)), level(0.0)).x;
    float3 _6689 = float3(_2289, _2291, _2269);
    float4 _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6689, float3(0.0), isnan(_6689)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6689, float3(0.0), isnan(_6689)), level(0.0)).xyzw;
    float _2304 = _2302.x;
    float _2306 = _2302.y;
    float _2308 = _2302.z;
    float _2310 = _2302.w;
    float2 _6706 = float2(_2297, _2283);
    float3 _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).xyz;
    float _2316 = _2314.x;
    float _2318 = _2314.y;
    float _2320 = _2314.z;
    float _2322 = float(uint(_1329));
    float _2324 = trunc(_1509);
    int _2326 = int(_2324);
    int _2328 = ~_1329;
    int _2330 = _2328 + 1;
    float _2332 = _1501 * _237;
    int _2334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2336 = _2334 != 0;
    float _2338 = -_1399;
    float _2340 = _2338 + 1.0;
    int _2342 = abs(_1809);
    float _2344 = -_1505;
    float _2346 = _2344 + 1.0;
    int _2348 = abs(_1813);
    float _2350 = 1.0 / _2322;
    float _2352 = -_1515;
    float _2354 = _2352 + 1.0;
    int _2356 = _1329 + (-1);
    float _2358 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2360 = !_2336;
    float _2362 = _2360 ? 1.2345600128173828125 : 1.0;
    float _2364 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2366 = abs(_1817);
    float _2368 = trunc(_2332);
    int _2370 = int(_2368);
    float _2372 = float(uint(_2326));
    float _2374 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2358);
    int _2376 = abs(_1821);
    bool _2378 = _1215 > 0.5;
    float _2380 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2374);
    int _2382 = as_type<int>(_2350) + (-2);
    float _2384 = exp2(_2364);
    float _2386 = as_type<float>(_2382) * _2372;
    float _2388 = trunc(_2386);
    float _2390 = precise::max(_2388, 0.0);
    uint _2393 = uint(_2390);
    float _2395 = -_2384;
    float _2397 = _2395 + 1.0;
    float _2399 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2401 = _2330 * int(_2393);
    int _2403 = _2401 + _2326;
    float _2405 = float(uint(_2403));
    float _2407 = as_type<float>(_2382) * _2405;
    bool _2409 = !_2336;
    float _2411 = _2409 ? _1211 : _1209;
    float _2413 = trunc(_2407);
    float _2415 = precise::max(_2413, 0.0);
    uint _2417 = uint(_2415);
    float _2419 = _2411 * _2362;
    float _2421 = float(_2326);
    bool _2423 = _2421 >= _1477;
    bool _2425 = isnan(_2421);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(_1477);
    bool _2431 = _2427 || _2429;
    float _2433 = float(_2431);
    float _2435 = floor(_2419);
    int _2437 = int(_2393) + int(_2417);
    float _2439 = trunc(_2433);
    int _2441 = int(_2439);
    int _2443 = _2330 * _2437;
    int _2445 = _2443 + _2326;
    float _2447 = -_2435;
    float _2449 = _2419 + _2447;
    bool _2451 = uint(_2445) >= uint(_1329);
    float _2453 = _2449 * _1477;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2457 = _2455 != 0;
    bool _2459 = !_2451;
    int _2461 = _2459 ? 0 : (-1);
    bool _2463 = _1329 == 0;
    float _2465 = trunc(_2453);
    int _2467 = int(_2465);
    int _2469 = ~_2437;
    int _2471 = _2469 + _2461;
    int _2473 = _2471 + 1;
    int _2475 = ~_2441;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    bool _2481 = !_2457;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _1329 * _2473;
    int _2487 = _2485 + _2326;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2491 = _2489 != 0;
    int _2493 = abs(_2483);
    bool _2495 = !_2463;
    int _2497 = _2495 ? _2487 : (-1);
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2501 = _2499 != 0;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2505 = _2503 != 0;
    int _2507 = _2497 * _2479;
    int _2509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2511 = _2509 != 0;
    int _2513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2515 = _2513 != 0;
    int _2517 = _2441 * _2356;
    int _2519 = _2517 + _2507;
    int _2521 = _2519 * _2342;
    bool _2523 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2525 = isnan(_1207);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    int _2535 = _2467 * _2493;
    int _2537 = _2535 + _2326;
    int _2539 = _2370 * _2348;
    int _2541 = _2539 + _2521;
    int _2543 = ~_1329;
    int _2545 = _2543 + 1;
    int _2547 = _2537 * _2366;
    int _2549 = _2547 + _2541;
    int _2551 = ~_1329;
    int _2553 = _2551 + 1;
    int _2555 = _2467 * _2376;
    int _2557 = _2555 + _2549;
    int _2559 = ~_1329;
    int _2561 = _2559 + 1;
    float _2563 = float(uint(_2557));
    float _2565 = as_type<float>(_2382) * _2563;
    float _2567 = trunc(_2565);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    int _2573 = _2561 * int(_2571);
    int _2575 = _2573 + _2557;
    float _2577 = float(uint(_2575));
    float _2579 = as_type<float>(_2382) * _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2585 = trunc(_2579);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2599 = 1.0 / _2583;
    int _2601 = int(_2571) + int(_2589);
    float _2603 = 1.0 / _2593;
    float _2605 = -_197;
    int _2607 = _2378 ? as_type<int>(_2605) : as_type<int>(_197);
    int _2609 = _2545 * _2601;
    int _2611 = _2609 + _2557;
    float _2613 = 1.0 / _2597;
    bool _2615 = uint(_2611) >= uint(_1329);
    bool _2617 = !_2491;
    float _2619 = _2617 ? _197 : as_type<float>(_2607);
    bool _2621 = _1211 > 0.5;
    float _2623 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2625 = _2623 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2627 = !_2615;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _1209 > 0.5;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2635 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2633;
    float _2637 = -_197;
    int _2639 = _2621 ? as_type<int>(_2637) : as_type<int>(_197);
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2641;
    bool _2645 = _1213 > 0.5;
    float _2647 = _2635 * _2599;
    float _2649 = _2625 * _2603;
    float _2651 = float(uint(_2537));
    float _2653 = _2643 * _2613;
    bool _2655 = !_2511;
    float _2657 = _2655 ? _197 : as_type<float>(_2639);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2661 = _1207 + _2659;
    int _2663 = ~_2601;
    int _2665 = _2663 + _2629;
    int _2667 = _2665 + 1;
    float _2669 = as_type<float>(_2382) * _2651;
    float _2671 = -_187;
    int _2673 = _2631 ? as_type<int>(_2671) : as_type<int>(_187);
    float _2675 = fma(_2647, _2661, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2677 = -_187;
    int _2679 = _2645 ? as_type<int>(_2677) : as_type<int>(_187);
    int _2681 = _1329 * _2667;
    int _2683 = _2681 + _2557;
    bool _2685 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2687 = isnan(_1207);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2693 = _2689 || _2691;
    float _2695 = float(_2693);
    float _2697 = trunc(_2669);
    float _2699 = precise::max(_2697, 0.0);
    uint _2701 = uint(_2699);
    bool _2703 = !_2505;
    float _2705 = _2703 ? _187 : as_type<float>(_2673);
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2709 = _1207 + _2707;
    bool _2711 = !_2515;
    float _2713 = _2711 ? _187 : as_type<float>(_2679);
    float _2715 = -_2695;
    float _2717 = _2715 + 1.0;
    bool _2719 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2721 = isnan(_1207);
    bool _2723 = _2719 || _2721;
    bool _2725 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2727 = _2723 || _2725;
    float _2729 = float(_2727);
    float _2731 = fma(_2649, _2709, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2733 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2735 = isnan(_1207);
    bool _2737 = _2733 || _2735;
    bool _2739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2741 = _2737 || _2739;
    float _2743 = float(_2741);
    float _2745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2749 = _1207 + _2747;
    float _2751 = _2729 * _2717;
    float _2753 = -_2729;
    float _2755 = _2753 + 1.0;
    bool _2757 = !_2463;
    int _2759 = _2757 ? _2683 : (-1);
    float _2761 = fma(_2653, _2749, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2763 = _2743 * _2755;
    int _2765 = _2759 >> 31;
    float _2767 = -_2743;
    float _2769 = _2767 + 1.0;
    float _2771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2773 = _2553 * int(_2701);
    int _2775 = _2773 + _2537;
    int _2777 = _2765 & 3;
    float _2779 = _2533 * _2769;
    float _2781 = -_2533;
    float _2783 = _2781 + 1.0;
    int _2785 = _2759 & 3;
    bool _2787 = _2785 != 0;
    float _2789 = _2705 + 0.5;
    int _2791 = _2759 + _2777;
    float _2793 = _2675 * _2779;
    float _2795 = float(uint(_2775));
    float _2797 = _2657 + (-0.5);
    int _2799 = _2791 >> 2;
    float _2801 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2793);
    float _2803 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2805 = as_type<float>(_2382) * _2795;
    int _2807 = _2799 << 4;
    int _2809 = _2807 + 512;
    float _2811 = _2713 + 0.5;
    float _2813 = _2771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2815 = fma(_2731, _2763, _2801);
    uint _2817 = uint(int(uint(_2809) >> uint(2)));
    uint _2819 = uint(int(uint(int(_2817)) >> uint(2)));
    int _2821 = int(_2817) & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    int _2825 = int(_2817) + 1;
    uint _2827 = uint(int(uint(_2825) >> uint(2)));
    int _2829 = _2825 & 3;
    float _2831 = (*spvDescriptorSet0.vp_c9)._m0[int(_2827)][_2829];
    float _2833 = fma(_2811, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1521);
    float _2835 = -_2813;
    float _2837 = -_1499;
    float _2839 = fma(_2835, _2797, _2837);
    float _2841 = -_1517;
    float _2843 = _2841 + 1.0;
    float _2845 = trunc(_2805);
    float _2847 = precise::max(_2845, 0.0);
    uint _2849 = uint(_2847);
    int _2851 = _2759 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = fma(_2803, _2789, _1491);
    float _2857 = _2619 + (-0.5);
    int _2859 = _2809 + 8;
    uint _2861 = uint(int(uint(_2859) >> uint(2)));
    uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
    int _2865 = int(_2861) & 3;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[int(_2863)][_2865];
    int _2869 = int(_2861) + 1;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    int _2873 = _2869 & 3;
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[int(_2871)][_2873];
    bool _2877 = uint(_2851) > 1u;
    float _2879 = fma(_2657, _2843, _2839);
    bool _2881 = _2851 != 3;
    float _2883 = -_2857;
    float _2885 = -_1523;
    float _2887 = fma(_2883, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2885);
    int _2889 = ~_1329;
    int _2891 = _2889 + 1;
    float _2893 = -_2340;
    float _2895 = fma(_2713, _2893, _2833);
    int _2897 = _2787 ? 0 : 1;
    float _2899 = fma(_2619, _2346, _2887);
    bool _2901 = uint(_2851) >= 2u;
    float _2903 = -_2354;
    float _2905 = fma(_2705, _2903, _2855);
    int _2907 = ~_2897;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = fma(_2761, _2751, _2815);
    int _2915 = int(_2701) + int(_2849);
    float _2917 = _2399 * _2299;
    int _2919 = _2911;
    if (!_2877)
    {
        int _2921 = ~_2897;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    out.m_62.x = _2905;
    out.m_62.y = _2879;
    out.m_62.z = _2895;
    out.m_62.w = _2899;
    int _2927 = _2901 ? 0 : 1;
    int _2929 = _2891 * _2915;
    int _2931 = _2929 + _2537;
    bool _2933 = !_2853;
    int _2935 = _2933 ? 0 : 1;
    int _2937 = abs(_2925);
    bool _2939 = uint(_2931) >= uint(_1329);
    int _2941 = ~_2927;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    bool _2947 = _2851 != 3;
    int _2949 = _2945;
    if (_2881)
    {
        int _2951 = ~_2927;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    float _2957 = fma(_2695, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2913);
    int _2959 = abs(_2935);
    float _2961 = _2957 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2963 = !_2947;
    int _2965 = _2963 ? 0 : (-1);
    int _2967 = abs(_2955);
    int _2969 = ~_2937;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = abs(_2965);
    int _2977 = ~_2959;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = _2973 * as_type<int>(_2831);
    bool _2985 = !_2939;
    int _2987 = _2985 ? 0 : (-1);
    int _2989 = _2981 * as_type<int>(_2823);
    int _2991 = _2989 + _2983;
    int _2993 = ~_2967;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3001 = ~_2915;
    int _3003 = _3001 + _2987;
    int _3005 = _3003 + 1;
    int _3007 = ~_2975;
    int _3009 = _3007 + 1;
    int _3011 = _3009 + 1;
    int _3013 = _2997 * as_type<int>(_2867);
    int _3015 = _3013 + _2991;
    bool _3017 = !_2501;
    int _3019 = _3017 ? 0 : 1;
    int _3021 = _1329 * _3005;
    int _3023 = _3021 + _2537;
    float _3025 = _1941 * _1999;
    int _3027 = _3011 * as_type<int>(_2875);
    int _3029 = _3027 + _3015;
    int _3031 = abs(_3019);
    float _3033 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3035 = !_2463;
    int _3037 = _3035 ? _3023 : (-1);
    float _3039 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3041 = _3025 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3043 = _1941 > 0.0;
    bool _3045 = isnan(_1941);
    bool _3047 = _3043 || _3045;
    bool _3049 = isnan(0.0);
    bool _3051 = _3047 || _3049;
    float _3053 = _3033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3055 = ~_3031;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    float _3061 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3063 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3065 = _1999 <= 0.0;
    bool _3067 = !_3051;
    bool _3069 = _3065 || _3067;
    int _3071 = _3029 * _3059;
    float _3073 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2380);
    out.m_64.x = _3053;
    out.m_64.y = _3061;
    out.m_64.z = _3063;
    out.m_64.w = _2961;
    int _3075 = _3037 * _3031;
    int _3077 = _3075 + _3071;
    float _3079 = _3073 + _2237;
    float _3081 = _3041 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3083 = _2320 * _2917;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2279;
    out.gl_Position.z = _3073;
    out.gl_Position.w = _2237;
    float _3085 = _3079 * 0.5;
    float _3087 = float(_3077);
    out.m_49.x = _3081;
    float _3089 = _2310 * _2917;
    float _3091 = -_2399;
    float _3093 = _3091 + 1.0;
    out.m_66.y = _3087;
    float _3095 = fma(_2316, _3089, _2304);
    float _3097 = fma(_2318, _3089, _2306);
    float _3099 = _2310 * _3093;
    out.m_68.z = _3085;
    out.m_68.w = _2237;
    float _3101 = fma(_2310, _3083, _2308);
    out.m_70.x = _3095;
    out.m_70.y = _3097;
    out.m_70.z = _3101;
    out.m_70.w = _3099;
    if (!_3069)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3103 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3103;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _939 = false;
    bool _841 = false;
    bool _571 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = in.m_44.w;
    float _88 = trunc(_84);
    int _91 = int(_88);
    float _93 = -_86;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _95;
    bool _99 = _91 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_91);
    float _105 = _95;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_99)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_113);
        out.gl_Position.z = _3172;
    }
    if (!_99)
    {
        return out;
    }
    bool _117 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_86);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = float(_91);
    bool _129 = _95 >= _127;
    bool _131 = !_125;
    bool _133 = _129 || _131;
    if (_133)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _103;
    if (_133)
    {
        out.m_49.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _115 = as_type<int>(_137);
    }
    int _139 = _115;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3227 = as_type<float>(_139);
        out.gl_Position.z = _3227;
    }
    if (_133)
    {
        return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_54.w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    float _163 = in.m_42.x;
    float _165 = in.m_42.y;
    float _167 = in.m_42.z;
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = _141;
    if (!_155)
    {
        float _179 = _143 * _143;
        float _181 = _179 * 0.5;
        _177 = _181;
    }
    float _183 = _177;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _183;
    if (!_155)
    {
        float _191 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_155;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _143 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _143);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _237 = 1.0 / _127;
    float _239 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _245 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _247 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _249 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].x, _243);
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].y, _245);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    float _257 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    float _259 = _249;
    if (!_155)
    {
        _259 = _143;
    }
    float _261 = _259;
    bool _263 = !_155;
    float _265 = _261;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _143 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _265 = _285;
    }
    float _287 = _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _293 = fma(_287, _157, _255);
    float _295 = fma(_287, _159, _257);
    float _297 = _95 * _237;
    float _299 = fma(_287, _161, _291);
    float _301 = fma(_293, _145, _163);
    float _303 = fma(_295, _145, _165);
    float _305 = fma(_299, _145, _167);
    bool _307 = !_289;
    float _309 = _297;
    float _327;
    if (!_307)
    {
        float _311 = in.m_56.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        _327 = _297;
    }
    _329 = false;
    float _331 = _327;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = 1.0 / _343;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _361 = 1.0 / _347;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _331 + _363;
    float _367 = 1.0 / _351;
    float _369 = _335 * _357;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _331 + _371;
    float _375 = 1.0 / _355;
    float _377 = _339 * _361;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    bool _383 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_331);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_381, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _365 * _367;
    bool _399 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _401 = isnan(_331);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_393;
    float _413 = _411 + 1.0;
    bool _415 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_331);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_409;
    float _429 = _427 + 1.0;
    float _431 = _373 * _375;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _433;
    float _437 = _393 * _429;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = fma(_435, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _449 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _451 = isnan(_331);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = fma(_441, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = fma(_445, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _465 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _467 = isnan(_331);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _459 * _413;
    float _479 = -_459;
    float _481 = _479 + 1.0;
    float _483 = in.m_54.x;
    float _485 = in.m_54.y;
    float _487 = _425 * _481;
    float _489 = -_425;
    float _491 = _489 + 1.0;
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = _475 * _491;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = _447 * _497;
    float _509 = _395 * _497;
    float _511 = fma(_501, _397, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_505, _397, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _515 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _517 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _527 = fma(_461, _487, _515);
    float _529 = fma(_463, _487, _517);
    float _531 = fma(_521, _431, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_525, _431, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _535 = fma(_511, _477, _527);
    float _537 = fma(_513, _477, _529);
    float _539 = fma(_531, _437, _535);
    float _541 = fma(_533, _437, _537);
    float _543 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[147].x, _539);
    float _545 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[147].y, _541);
    float _547 = _543 * _483;
    float _549 = _545 * _485;
    bool _551 = !_359;
    float _569;
    if (!_551)
    {
        float _553 = in.m_56.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        _569 = _297;
    }
    _571 = false;
    float _573 = _569;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _577 = _573 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _585 = _573 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _603 = 1.0 / _597;
    bool _605 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _607 = isnan(_573);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _593;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _621 = _573 + _619;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _625 = 1.0 / _601;
    float _627 = _581 * _603;
    float _629 = 1.0 / _589;
    float _631 = _621 * _617;
    bool _633 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _635 = isnan(_573);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    bool _645 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _647 = isnan(_573);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_643;
    float _659 = _657 + 1.0;
    float _661 = _577 * _625;
    bool _663 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _665 = isnan(_573);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _675;
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = _673 * _659;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = _585 * _629;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _695;
    float _699 = fma(_677, _627, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _705 = fma(_693, _627, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _707 = fma(_697, _627, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _709 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _711 = isnan(_573);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _615 * _681;
    float _723 = -_615;
    float _725 = _723 + 1.0;
    float _727 = _655 * _687;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _737 = _719 * _725;
    float _739 = -_719;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, _661, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _745 = fma(_703, _661, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _747 = _699 * _737;
    float _749 = _705 * _737;
    float _751 = _707 * _737;
    float _753 = fma(_735, _661, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _763;
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].x, _747);
    float _769 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].y, _749);
    float _771 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].z, _751);
    float _773 = fma(_757, _689, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _775 = fma(_761, _689, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _777 = fma(_765, _689, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _779 = fma(_743, _721, _767);
    float _781 = fma(_745, _721, _769);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _791 = fma(_753, _721, _771);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _797 = fma(_773, _727, _779);
    float _799 = fma(_785, _631, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _801 = fma(_789, _631, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _803 = fma(_795, _631, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _805 = fma(_775, _727, _781);
    float _807 = fma(_777, _727, _791);
    float _809 = fma(_799, _683, _797);
    float _811 = fma(_801, _683, _805);
    float _813 = fma(_803, _683, _807);
    float _815 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].x, _809);
    float _817 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].y, _811);
    float _819 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].z, _813);
    bool _821 = !_623;
    float _839;
    if (!_821)
    {
        float _823 = in.m_56.x;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _827 = _823 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        _839 = _297;
    }
    _841 = false;
    float _843 = _839;
    bool _845 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = isnan(_843);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _861 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _863 = isnan(_843);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _879 = _843 + _877;
    float _881 = -_855;
    float _883 = _881 + 1.0;
    bool _885 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _887 = 1.0 / _859;
    float _889 = _871 * _883;
    float _891 = -_871;
    float _893 = _891 + 1.0;
    float _895 = _875 * _887;
    float _897 = _819 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _899 = fma(_895, _879, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _901 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _899 * _889;
    float _907 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[115].x, _905);
    float _911 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _913 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[116].x, _909);
    float _915 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _913 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _915;
    out.m_58.y = _907;
    out.m_58.z = _903;
    out.m_58.w = _917;
    bool _919 = !_885;
    float _937;
    if (!_919)
    {
        float _921 = in.m_56.x;
        float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _925 = _921 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].z, _95);
        float _929 = _927 * _923;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _935;
        _939 = true;
    }
    else
    {
        _937 = _297;
    }
    _939 = false;
    float _941 = _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _945 = _941 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = _941 + _947;
    bool _951 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _953 = isnan(_941);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _981 = _941 + _979;
    float _983 = 1.0 / _973;
    bool _985 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _987 = isnan(_941);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = 1.0 / _969;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1001 = _941 + _999;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1005 = 1.0 / _965;
    float _1007 = _945 * _983;
    float _1009 = 1.0 / _977;
    float _1011 = _1001 * _997;
    bool _1013 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1015 = isnan(_941);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = -_961;
    float _1027 = _1025 + 1.0;
    float _1029 = _1023 * _1027;
    float _1031 = _949 * _1005;
    bool _1033 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1035 = isnan(_941);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1045;
    float _1049 = -_1023;
    float _1051 = _1049 + 1.0;
    float _1053 = fma(_1047, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1055 = -_1043;
    float _1057 = _1055 + 1.0;
    float _1059 = _981 * _1009;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1065;
    float _1069 = fma(_1063, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1071 = fma(_1067, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1073 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1075 = isnan(_941);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1043 * _1051;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = _995 * _1057;
    float _1093 = -_995;
    float _1095 = _1093 + 1.0;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1105 = fma(_1089, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1107 = _1083 * _1095;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    float _1113 = fma(_1099, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1115 = fma(_1103, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1117 = _1069 * _1107;
    float _1119 = _1071 * _1107;
    float _1121 = _1053 * _1107;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1127;
    float _1131 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1117);
    float _1133 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1119);
    float _1135 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1121);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1137;
    float _1141 = fma(_1125, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1143 = fma(_1129, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1145 = fma(_1113, _1091, _1131);
    float _1147 = fma(_1105, _1091, _1133);
    float _1149 = fma(_1115, _1091, _1135);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1159 = fma(_1139, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1165 = fma(_1141, _1085, _1145);
    float _1167 = fma(_1153, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = fma(_1157, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1171 = fma(_1143, _1085, _1147);
    float _1173 = fma(_1163, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1175 = fma(_1159, _1085, _1149);
    float _1177 = fma(_1167, _1029, _1165);
    float _1179 = fma(_1169, _1029, _1171);
    float _1181 = fma(_1173, _1029, _1175);
    float _1183 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1177);
    float _1185 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1179);
    float _1187 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1181);
    bool _1189 = !_1003;
    if (!_1189)
    {
        float _1191 = in.m_56.x;
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1195 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[11].w, _95);
        float _1199 = _1197 * _1193;
        float _1201 = floor(_1199);
        float _1203 = -_1201;
        float _1205 = _1199 + _1203;
        _309 = _1205;
    }
    float _1207 = _309;
    float _1209 = in.m_56.x;
    float _1211 = in.m_56.y;
    float _1213 = in.m_56.z;
    float _1215 = in.m_56.w;
    float _1217 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1219 = log2(_1217);
    float _1221 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1223 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1235 = _1233 != 0;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1243 = !_1235;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1249 = _1209 * 2.0;
    float _1251 = _1213 * 2.0;
    float _1253 = _1211 * 2.0;
    float _1255 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1257 = floor(_1249);
    float _1259 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1263 = -_1237;
    float _1265 = fma(_1255, 2.0, _1263);
    float _1267 = _1209 + (-0.5);
    float _1269 = fma(_1259, -2.0, _1239);
    float _1271 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1261);
    int _1273 = abs(_1245);
    float _1275 = floor(_1251);
    float _1277 = _1211 + _1209;
    float _1279 = _1277 + (-1.0);
    float _1281 = floor(_1253);
    bool _1283 = _1257 > 0.0;
    float _1285 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1287 = !_1227;
    int _1289 = _1287 ? 0 : 1;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1293 = _1291 != 0;
    bool _1295 = _1257 >= 0.0;
    bool _1297 = isnan(_1257);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.0);
    bool _1303 = _1299 || _1301;
    float _1305 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1307 = int(_1305);
    bool _1309 = _1275 >= 0.0;
    bool _1311 = isnan(_1275);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _1317 ? 0 : 1;
    bool _1321 = _1275 > 0.0;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1325 = _1303 ? 0 : 1;
    float _1327 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1329 = int(_1327);
    float _1331 = _1279;
    float _1333 = _1255;
    if (!_1293)
    {
        _1331 = _1213;
    }
    float _1335 = _1331;
    float _1337 = _1335;
    if (_1293)
    {
        _1337 = _1211;
    }
    float _1339 = _1337;
    bool _1341 = _1281 > 0.0;
    bool _1343 = _1281 >= 0.0;
    bool _1345 = isnan(_1281);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.0);
    bool _1351 = _1347 || _1349;
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1323);
    float _1355 = _1339;
    if (!_1293)
    {
        _1333 = _1211;
    }
    float _1357 = _1333;
    float _1359 = _1357;
    if (_1293)
    {
        _1359 = _1209;
    }
    float _1361 = _1359;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1293)
    {
        _1355 = _1213;
    }
    float _1365 = _1355;
    int _1367 = ~_1319;
    int _1369 = _1367 + 1;
    int _1371 = _1369 + 1;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1375 = _1365;
    int _1377 = _1371;
    if (_1293)
    {
        _1375 = _1211;
    }
    float _1379 = _1375;
    float _1381 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1363);
    if (!_1321)
    {
        int _1383 = ~_1319;
        int _1385 = _1383 + 1;
        _1377 = _1385;
    }
    int _1387 = _1377;
    float _1389 = -_1247;
    float _1391 = fma(_1373, 2.0, _1389);
    int _1393 = abs(_1289);
    float _1395 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1397 = float(_1307);
    float _1399 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1381);
    int _1401 = _1351 ? 0 : 1;
    float _1403 = fma(_1395, -2.0, _1241);
    float _1405 = float(_1393);
    float _1407 = 1.0 / _1397;
    float _1409 = float(_1387);
    int _1411 = ~_1325;
    int _1413 = _1411 + 1;
    int _1415 = _1413 + 1;
    int _1417 = _1415;
    if (!_1283)
    {
        int _1419 = ~_1325;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    float _1425 = _1219 * _95;
    int _1427 = ~_1401;
    int _1429 = _1427 + 1;
    int _1431 = _1429 + 1;
    float _1433 = _1405 * _1409;
    int _1435 = _1431;
    if (!_1341)
    {
        int _1437 = ~_1401;
        int _1439 = _1437 + 1;
        _1435 = _1439;
    }
    int _1441 = _1435;
    float _1443 = exp2(_1425);
    float _1445 = in.m_60.x;
    float _1447 = in.m_60.y;
    float _1449 = in.m_60.z;
    bool _1451 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1453 = isnan(0.0);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1459 = _1455 || _1457;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1463 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1465 = isnan(1.0);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1475 = 1.0 + _1473;
    float _1477 = float(_1329);
    float _1479 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    bool _1481 = !_1231;
    int _1483 = _1481 ? 0 : 1;
    float _1485 = 1.0 / _1475;
    float _1487 = float(_1423);
    float _1489 = -_95;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1265);
    int _1493 = abs(_1483);
    float _1495 = -_1443;
    float _1497 = _1495 + 1.0;
    float _1499 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1269);
    float _1501 = _1477 * _95;
    float _1503 = _1433 * (-2.0);
    float _1505 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1353);
    float _1507 = _1459 ? _1497 : 0.0;
    float _1509 = _1407 * _95;
    float _1511 = float(_1493);
    float _1513 = fma(_1503, _1445, _1445);
    float _1515 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1479);
    float _1517 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1271);
    float _1519 = -_95;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1391);
    float _1523 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1403);
    if (_1471)
    {
        float _1525 = _1507 * _1485;
        _105 = _1525;
    }
    float _1527 = _105;
    float _1529 = fma(_1285, _1503, _1285);
    float _1531 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1513);
    float _1533 = _1511 * _1487;
    float _1535 = _1211 + _1213;
    float _1537 = fma(_1529, _1527, _1531);
    float _1539 = _1533 * (-2.0);
    float _1541 = float(_1273);
    float _1543 = _1535 + (-1.0);
    float _1545 = float(_1441);
    float _1547 = _1537 * 0.15915493667125701904296875;
    float _1549 = fma(_1539, _1447, _1447);
    float _1551 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1553 = _1213 + _1209;
    float _1555 = _1541 * _1545;
    float _1557 = _1211 + (-0.5);
    float _1559 = fma(_1551, _1539, _1551);
    float _1561 = _1555 * (-2.0);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1549);
    float _1565 = _1553 + (-1.0);
    float _1567 = _1547 * 6.283185482025146484375;
    float _1569 = sin(_1567);
    float _1571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1573 = fma(_1559, _1527, _1563);
    float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1577 = fma(_1561, _1449, _1449);
    float _1579 = _1213 + (-0.5);
    float _1581 = _1573 * 0.15915493667125701904296875;
    float _1583 = fma(_1575, _1561, _1575);
    float _1585 = _1547 * 6.283185482025146484375;
    float _1587 = cos(_1585);
    float _1589 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1577);
    float _1591 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1593 = _1223 * _1571;
    bool _1595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1597 = isnan(0.5);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1603 = _1599 || _1601;
    float _1605 = fma(_1583, _1527, _1589);
    float _1607 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1609 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1611 = _1581 * 6.283185482025146484375;
    float _1613 = sin(_1611);
    float _1615 = _1605 * 0.15915493667125701904296875;
    float _1617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1619 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1607);
    float _1621 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1609);
    float _1623 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1591);
    float _1625 = _1221 * _1617;
    float _1627 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1619);
    float _1629 = _1615 * 6.283185482025146484375;
    float _1631 = cos(_1629);
    float _1633 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1623);
    float _1635 = _1581 * 6.283185482025146484375;
    float _1637 = cos(_1635);
    float _1639 = _1569 * _1613;
    float _1641 = _1587 * _1613;
    float _1643 = _1615 * 6.283185482025146484375;
    float _1645 = sin(_1643);
    float _1647 = _1631 * _1625;
    float _1649 = _1613 * _1631;
    float _1651 = _1587 * _1647;
    float _1653 = _1569 * _1647;
    float _1655 = _1587 * _1637;
    float _1657 = _1569 * _1637;
    float _1659 = _1637 * _1631;
    float _1661 = fma(_1645, _1655, _1639);
    float _1663 = -_1641;
    float _1665 = fma(_1645, _1657, _1663);
    float _1667 = -_1657;
    float _1669 = fma(_1645, _1641, _1667);
    float _1671 = -_1625;
    float _1673 = _1645 * _1671;
    float _1675 = fma(_1661, _1593, _1651);
    float _1677 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1679 = fma(_1645, _1639, _1655);
    float _1681 = fma(_1659, _1593, _1673);
    float _1683 = fma(_1665, _1593, _1653);
    float _1685 = fma(_1669, _1677, _1675);
    float _1687 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1621);
    float _1689 = fma(_1649, _1677, _1681);
    float _1691 = fma(_1679, _1677, _1683);
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1697 = _1687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1699 = _1627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1693);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1695);
    float _1705 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = _1633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1701);
    float _1711 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1703);
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1715 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1717 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1721 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1713);
    float _1723 = _1707 + _1717;
    float _1725 = _1699 + _1719;
    float _1727 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1731 = _1723 + _1729;
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1735 = _1725 + _1733;
    float _1737 = 1.0 / _1727;
    float _1739 = _1731 * _1731;
    float _1741 = fma(_1735, _1735, _1739);
    float _1743 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1715);
    float _1745 = sqrt(_1741);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1743);
    float _1749 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1751 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1753 = _1749 + _1727;
    float _1755 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1751);
    float _1757 = _1753 * _1737;
    float _1759 = _1757 * 0.5;
    float _1761 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1755);
    bool _1763 = _1745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1767 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1765);
    float _1769 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1771 = _1759;
    float _1773 = _1691;
    float _1775 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1777 = _1769;
    float _1779 = _1745;
    float _1781 = _1675;
    float _1783 = _1737;
    if (_1603)
    {
        _1771 = 1.0;
    }
    float _1785 = _1771;
    int _1787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1789 = _1787 != 0;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1793 = _1791 != 0;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1797 = _1795 != 0;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1801 = _1799 != 0;
    float _1803 = _1697 + _1769;
    float _1805 = 1.0 / _1767;
    bool _1807 = !_1793;
    int _1809 = _1807 ? 0 : 1;
    bool _1811 = !_1789;
    int _1813 = _1811 ? 0 : 1;
    bool _1815 = !_1797;
    int _1817 = _1815 ? 0 : 1;
    bool _1819 = !_1801;
    int _1821 = _1819 ? 0 : 1;
    float _1823 = _1785;
    if (!_1763)
    {
        _1773 = _1725;
    }
    float _1825 = _1773;
    float _1827 = _1825;
    if (!_1763)
    {
        _1775 = _1723;
    }
    float _1829 = _1775;
    float _1831 = _1829;
    if (!_1763)
    {
        _1777 = _1803;
    }
    float _1833 = _1777;
    bool _1835 = !_1763;
    float _1837 = _1833;
    float _1839 = _1805;
    if (!_1835)
    {
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1845 = _1745 + _1843;
        float _1847 = rsqrt(_1741);
        float _1849 = _1845 * _1841;
        float _1851 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1853 = _1849 * 0.15915493667125701904296875;
        float _1855 = _1853 * 6.283185482025146484375;
        float _1857 = cos(_1855);
        float _1859 = _1853 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = _1857 + (-1.0);
        float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1867 = fma(_1861, _1851, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1869 = fma(_1803, _1857, _1865);
        float _1871 = _1847 * _1867;
        float _1873 = fma(_1735, _1871, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1875 = fma(_1731, _1871, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1837 = _1869;
        _1827 = _1873;
        _1831 = _1875;
    }
    float _1877 = _1837;
    float _1879 = _1827;
    float _1881 = _1831;
    if (_1603)
    {
        _1779 = 1.0;
    }
    float _1883 = _1779;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1887 = _1805 * _1885;
    float _1889 = _1883;
    if (!_1603)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = _1893 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1895 * 0.15915493667125701904296875;
        float _1903 = _1893 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1899;
        float _1909 = _1901 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = _1905 * _1907;
        float _1915 = _1901 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = 1.0 / _1919;
        float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1925 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1923;
        float _1927 = 1.0 / _1925;
        float _1929 = _1917 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1933 = fma(_1887, _1929, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        _1839 = _1893;
        _1823 = _1937;
    }
    float _1939 = _1839;
    float _1941 = _1823;
    float _1943 = _1939;
    if (!_1603)
    {
        float _1945 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1947 = _1945 * 0.15915493667125701904296875;
        float _1949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1951 = _1947 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = _1949 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1953;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = _1955 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1977;
        float _1981 = 1.0 / _1979;
        float _1983 = _1971 * _1975;
        float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1987 = fma(_1887, _1983, _1985);
        float _1989 = _1987 * _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        float _1993 = -_1991;
        float _1995 = _1993 + 1.0;
        _1943 = _1961;
        _1889 = _1995;
    }
    float _1997 = _1943;
    float _1999 = _1889;
    float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2003 = _1877 + _2001;
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2007 = _1879 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2011 = _1881 + _2009;
    float _2013 = _2003 * _2003;
    float _2015 = fma(_2007, _2007, _2013);
    float _2017 = fma(_2011, _2011, _2015);
    float _2019 = rsqrt(_2017);
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2023 = _2007 * _2021;
    float _2025 = _2011 * _2021;
    float _2027 = _2023 * _2023;
    float _2029 = _2025 * _2025;
    float _2031 = _2027 + _2029;
    float _2033 = sqrt(_2031);
    bool _2035 = _2033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2039 = _2033 + _2037;
    float _2041 = _1997;
    float _2043 = _2031;
    float _2045 = _2039;
    float _2047 = _2003;
    float _2049 = _2023;
    float _2051 = _2025;
    float _2053 = _2027;
    float _2055 = _2029;
    if (_2035)
    {
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2041 = _2057;
    }
    float _2059 = _2041;
    if (_2035)
    {
        float _2061 = rsqrt(_2031);
        _2043 = _2061;
    }
    float _2063 = _2043;
    if (_2035)
    {
        float _2065 = _2039 * _2059;
        _2045 = _2065;
    }
    float _2067 = _2045;
    if (_2035)
    {
        float _2069 = _2067 * 0.15915493667125701904296875;
        _1781 = _2069;
    }
    float _2071 = _1781;
    float _2073 = _1803;
    if (_2035)
    {
        float _2075 = _2071 * 6.283185482025146484375;
        float _2077 = sin(_2075);
        _2073 = _2077;
    }
    float _2079 = _2073;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2083 = precise::max(0.0, _2081);
    float _2085 = _2059;
    float _2087 = _2083;
    if (_2035)
    {
        float _2089 = _2071 * 6.283185482025146484375;
        float _2091 = cos(_2089);
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = -_2021;
    float _2097 = -_2083;
    float _2099 = fma(_2003, _2095, _2097);
    if (_2035)
    {
        float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2101;
    }
    float _2103 = _2047;
    float _2105 = _2103;
    if (_2035)
    {
        float _2107 = fma(_2079, _2103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1783 = _2107;
    }
    float _2109 = _1783;
    float _2111 = _2109;
    if (!_2035)
    {
        _2105 = _2099;
    }
    float _2113 = _2105;
    float _2115 = sqrt(_2017);
    float _2117 = _2113;
    if (_2035)
    {
        float _2119 = _2093 + (-1.0);
        _2087 = _2119;
    }
    float _2121 = _2087;
    float _2123 = _2121;
    if (_2035)
    {
        float _2125 = _2063 * _2109;
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (_2035)
    {
        float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2129;
    }
    float _2131 = _2123;
    if (_2035)
    {
        float _2133 = _2023 * _2127;
        _2049 = _2133;
    }
    float _2135 = _2049;
    if (_2035)
    {
        float _2137 = _2025 * _2127;
        _2051 = _2137;
    }
    float _2139 = _2051;
    float _2141 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_2035)
    {
        float _2143 = fma(_2099, _2093, _2131);
        _2117 = _2143;
    }
    float _2145 = _2117;
    if (_2035)
    {
        float _2147 = _2135 * _2135;
        _2053 = _2147;
    }
    float _2149 = _2053;
    if (_2035)
    {
        float _2151 = _2139 * _2139;
        _2055 = _2151;
    }
    float _2153 = _2055;
    float _2155 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2157 = fma(_2145, _2145, _2149);
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2161 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2159);
    float _2163 = precise::clamp(_2161, 0.0, 1.0);
    float _2165 = _2157 + _2153;
    float _2167 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2155);
    float _2169 = -_2163;
    float _2171 = _2169 + 1.0;
    float _2173 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2175 = rsqrt(_2165);
    float _2177 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2167);
    float _2179 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2181 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2173);
    float _2183 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2185 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2187 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2179);
    float _2189 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2191 = abs(_2171);
    float _2193 = log2(_2191);
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2197 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2187);
    float _2199 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2183);
    float _2203 = -_2195;
    float _2205 = fma(_2203, _2141, 1.0);
    float _2207 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2211 = _2175 * _2135;
    float _2213 = _2175 * _2145;
    float _2215 = _2175 * _2139;
    float _2217 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2201);
    float _2219 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2221 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2209);
    float _2223 = log2(_2205);
    float _2225 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2227 = -_2219;
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2227);
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2233 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2221);
    float _2235 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2237 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2233);
    float _2239 = -_2215;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2229);
    float _2243 = exp2(_2231);
    float _2245 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2247 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2235);
    float _2249 = fma(_2241, -0.5, 0.5);
    float _2251 = fma(_2241, 0.5, 0.5);
    float _2253 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2245);
    float _2255 = _2213 + 1.0;
    float _2257 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2247);
    float _2259 = 1.0 / _2237;
    float _2261 = fma(_2251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2263 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2253);
    float _2265 = _2223 * 0.693147182464599609375;
    float _2267 = fma(_2251, _2261, -0.212114393711090087890625);
    float _2269 = _2265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = sqrt(_2249);
    float _2273 = -_2213;
    float _2275 = fma(_2243, _2255, _2273);
    float _2277 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2263);
    float _2279 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2281 = fma(_2251, _2267, 1.570728778839111328125);
    float _2283 = fma(_2275, 0.5, 0.5);
    float _2285 = _2277 * _2259;
    float _2287 = _2279 * _2259;
    float _2289 = fma(_2285, 0.5, 0.5);
    float _2291 = fma(_2287, -0.5, 0.5);
    float _2293 = _2271 * 0.636619746685028076171875;
    float _2295 = -_2281;
    float _2297 = fma(_2293, _2295, 1.0);
    float3 _6678 = float3(_2289, _2291, _2269);
    float _2299 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6678, float3(0.0), isnan(_6678)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6678, float3(0.0), isnan(_6678)), level(0.0)).x;
    float3 _6689 = float3(_2289, _2291, _2269);
    float4 _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6689, float3(0.0), isnan(_6689)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6689, float3(0.0), isnan(_6689)), level(0.0)).xyzw;
    float _2304 = _2302.x;
    float _2306 = _2302.y;
    float _2308 = _2302.z;
    float _2310 = _2302.w;
    float2 _6706 = float2(_2297, _2283);
    float3 _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).xyz;
    float _2316 = _2314.x;
    float _2318 = _2314.y;
    float _2320 = _2314.z;
    float _2322 = float(uint(_1329));
    float _2324 = trunc(_1509);
    int _2326 = int(_2324);
    int _2328 = ~_1329;
    int _2330 = _2328 + 1;
    float _2332 = _1501 * _237;
    int _2334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2336 = _2334 != 0;
    float _2338 = -_1399;
    float _2340 = _2338 + 1.0;
    int _2342 = abs(_1809);
    float _2344 = -_1505;
    float _2346 = _2344 + 1.0;
    int _2348 = abs(_1813);
    float _2350 = 1.0 / _2322;
    float _2352 = -_1515;
    float _2354 = _2352 + 1.0;
    int _2356 = _1329 + (-1);
    float _2358 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2360 = !_2336;
    float _2362 = _2360 ? 1.2345600128173828125 : 1.0;
    float _2364 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2366 = abs(_1817);
    float _2368 = trunc(_2332);
    int _2370 = int(_2368);
    float _2372 = float(uint(_2326));
    float _2374 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2358);
    int _2376 = abs(_1821);
    bool _2378 = _1215 > 0.5;
    float _2380 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2374);
    int _2382 = as_type<int>(_2350) + (-2);
    float _2384 = exp2(_2364);
    float _2386 = as_type<float>(_2382) * _2372;
    float _2388 = trunc(_2386);
    float _2390 = precise::max(_2388, 0.0);
    uint _2393 = uint(_2390);
    float _2395 = -_2384;
    float _2397 = _2395 + 1.0;
    float _2399 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2401 = _2330 * int(_2393);
    int _2403 = _2401 + _2326;
    float _2405 = float(uint(_2403));
    float _2407 = as_type<float>(_2382) * _2405;
    bool _2409 = !_2336;
    float _2411 = _2409 ? _1211 : _1209;
    float _2413 = trunc(_2407);
    float _2415 = precise::max(_2413, 0.0);
    uint _2417 = uint(_2415);
    float _2419 = _2411 * _2362;
    float _2421 = float(_2326);
    bool _2423 = _2421 >= _1477;
    bool _2425 = isnan(_2421);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(_1477);
    bool _2431 = _2427 || _2429;
    float _2433 = float(_2431);
    float _2435 = floor(_2419);
    int _2437 = int(_2393) + int(_2417);
    float _2439 = trunc(_2433);
    int _2441 = int(_2439);
    int _2443 = _2330 * _2437;
    int _2445 = _2443 + _2326;
    float _2447 = -_2435;
    float _2449 = _2419 + _2447;
    bool _2451 = uint(_2445) >= uint(_1329);
    float _2453 = _2449 * _1477;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2457 = _2455 != 0;
    bool _2459 = !_2451;
    int _2461 = _2459 ? 0 : (-1);
    bool _2463 = _1329 == 0;
    float _2465 = trunc(_2453);
    int _2467 = int(_2465);
    int _2469 = ~_2437;
    int _2471 = _2469 + _2461;
    int _2473 = _2471 + 1;
    int _2475 = ~_2441;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    bool _2481 = !_2457;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _1329 * _2473;
    int _2487 = _2485 + _2326;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2491 = _2489 != 0;
    int _2493 = abs(_2483);
    bool _2495 = !_2463;
    int _2497 = _2495 ? _2487 : (-1);
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2501 = _2499 != 0;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2505 = _2503 != 0;
    int _2507 = _2497 * _2479;
    int _2509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2511 = _2509 != 0;
    int _2513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2515 = _2513 != 0;
    int _2517 = _2441 * _2356;
    int _2519 = _2517 + _2507;
    int _2521 = _2519 * _2342;
    bool _2523 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2525 = isnan(_1207);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    int _2535 = _2467 * _2493;
    int _2537 = _2535 + _2326;
    int _2539 = _2370 * _2348;
    int _2541 = _2539 + _2521;
    int _2543 = ~_1329;
    int _2545 = _2543 + 1;
    int _2547 = _2537 * _2366;
    int _2549 = _2547 + _2541;
    int _2551 = ~_1329;
    int _2553 = _2551 + 1;
    int _2555 = _2467 * _2376;
    int _2557 = _2555 + _2549;
    int _2559 = ~_1329;
    int _2561 = _2559 + 1;
    float _2563 = float(uint(_2557));
    float _2565 = as_type<float>(_2382) * _2563;
    float _2567 = trunc(_2565);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    int _2573 = _2561 * int(_2571);
    int _2575 = _2573 + _2557;
    float _2577 = float(uint(_2575));
    float _2579 = as_type<float>(_2382) * _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2585 = trunc(_2579);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2599 = 1.0 / _2583;
    int _2601 = int(_2571) + int(_2589);
    float _2603 = 1.0 / _2593;
    float _2605 = -_197;
    int _2607 = _2378 ? as_type<int>(_2605) : as_type<int>(_197);
    int _2609 = _2545 * _2601;
    int _2611 = _2609 + _2557;
    float _2613 = 1.0 / _2597;
    bool _2615 = uint(_2611) >= uint(_1329);
    bool _2617 = !_2491;
    float _2619 = _2617 ? _197 : as_type<float>(_2607);
    bool _2621 = _1211 > 0.5;
    float _2623 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2625 = _2623 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2627 = !_2615;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _1209 > 0.5;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2635 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2633;
    float _2637 = -_197;
    int _2639 = _2621 ? as_type<int>(_2637) : as_type<int>(_197);
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2641;
    bool _2645 = _1213 > 0.5;
    float _2647 = _2635 * _2599;
    float _2649 = _2625 * _2603;
    float _2651 = float(uint(_2537));
    float _2653 = _2643 * _2613;
    bool _2655 = !_2511;
    float _2657 = _2655 ? _197 : as_type<float>(_2639);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2661 = _1207 + _2659;
    int _2663 = ~_2601;
    int _2665 = _2663 + _2629;
    int _2667 = _2665 + 1;
    float _2669 = as_type<float>(_2382) * _2651;
    float _2671 = -_187;
    int _2673 = _2631 ? as_type<int>(_2671) : as_type<int>(_187);
    float _2675 = fma(_2647, _2661, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2677 = -_187;
    int _2679 = _2645 ? as_type<int>(_2677) : as_type<int>(_187);
    int _2681 = _1329 * _2667;
    int _2683 = _2681 + _2557;
    bool _2685 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2687 = isnan(_1207);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2693 = _2689 || _2691;
    float _2695 = float(_2693);
    float _2697 = trunc(_2669);
    float _2699 = precise::max(_2697, 0.0);
    uint _2701 = uint(_2699);
    bool _2703 = !_2505;
    float _2705 = _2703 ? _187 : as_type<float>(_2673);
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2709 = _1207 + _2707;
    bool _2711 = !_2515;
    float _2713 = _2711 ? _187 : as_type<float>(_2679);
    float _2715 = -_2695;
    float _2717 = _2715 + 1.0;
    bool _2719 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2721 = isnan(_1207);
    bool _2723 = _2719 || _2721;
    bool _2725 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2727 = _2723 || _2725;
    float _2729 = float(_2727);
    float _2731 = fma(_2649, _2709, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2733 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2735 = isnan(_1207);
    bool _2737 = _2733 || _2735;
    bool _2739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2741 = _2737 || _2739;
    float _2743 = float(_2741);
    float _2745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2749 = _1207 + _2747;
    float _2751 = _2729 * _2717;
    float _2753 = -_2729;
    float _2755 = _2753 + 1.0;
    bool _2757 = !_2463;
    int _2759 = _2757 ? _2683 : (-1);
    float _2761 = fma(_2653, _2749, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2763 = _2743 * _2755;
    int _2765 = _2759 >> 31;
    float _2767 = -_2743;
    float _2769 = _2767 + 1.0;
    float _2771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2773 = _2553 * int(_2701);
    int _2775 = _2773 + _2537;
    int _2777 = _2765 & 3;
    float _2779 = _2533 * _2769;
    float _2781 = -_2533;
    float _2783 = _2781 + 1.0;
    int _2785 = _2759 & 3;
    bool _2787 = _2785 != 0;
    float _2789 = _2705 + 0.5;
    int _2791 = _2759 + _2777;
    float _2793 = _2675 * _2779;
    float _2795 = float(uint(_2775));
    float _2797 = _2657 + (-0.5);
    int _2799 = _2791 >> 2;
    float _2801 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2793);
    float _2803 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2805 = as_type<float>(_2382) * _2795;
    int _2807 = _2799 << 4;
    int _2809 = _2807 + 512;
    float _2811 = _2713 + 0.5;
    float _2813 = _2771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2815 = fma(_2731, _2763, _2801);
    uint _2817 = uint(int(uint(_2809) >> uint(2)));
    uint _2819 = uint(int(uint(int(_2817)) >> uint(2)));
    int _2821 = int(_2817) & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    int _2825 = int(_2817) + 1;
    uint _2827 = uint(int(uint(_2825) >> uint(2)));
    int _2829 = _2825 & 3;
    float _2831 = (*spvDescriptorSet0.vp_c9)._m0[int(_2827)][_2829];
    float _2833 = fma(_2811, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1521);
    float _2835 = -_2813;
    float _2837 = -_1499;
    float _2839 = fma(_2835, _2797, _2837);
    float _2841 = -_1517;
    float _2843 = _2841 + 1.0;
    float _2845 = trunc(_2805);
    float _2847 = precise::max(_2845, 0.0);
    uint _2849 = uint(_2847);
    int _2851 = _2759 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = fma(_2803, _2789, _1491);
    float _2857 = _2619 + (-0.5);
    int _2859 = _2809 + 8;
    uint _2861 = uint(int(uint(_2859) >> uint(2)));
    uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
    int _2865 = int(_2861) & 3;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[int(_2863)][_2865];
    int _2869 = int(_2861) + 1;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    int _2873 = _2869 & 3;
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[int(_2871)][_2873];
    bool _2877 = uint(_2851) > 1u;
    float _2879 = fma(_2657, _2843, _2839);
    bool _2881 = _2851 != 3;
    float _2883 = -_2857;
    float _2885 = -_1523;
    float _2887 = fma(_2883, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2885);
    int _2889 = ~_1329;
    int _2891 = _2889 + 1;
    float _2893 = -_2340;
    float _2895 = fma(_2713, _2893, _2833);
    int _2897 = _2787 ? 0 : 1;
    float _2899 = fma(_2619, _2346, _2887);
    bool _2901 = uint(_2851) >= 2u;
    float _2903 = -_2354;
    float _2905 = fma(_2705, _2903, _2855);
    int _2907 = ~_2897;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = fma(_2761, _2751, _2815);
    int _2915 = int(_2701) + int(_2849);
    float _2917 = _2399 * _2299;
    int _2919 = _2911;
    if (!_2877)
    {
        int _2921 = ~_2897;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    out.m_62.x = _2905;
    out.m_62.y = _2879;
    out.m_62.z = _2895;
    out.m_62.w = _2899;
    int _2927 = _2901 ? 0 : 1;
    int _2929 = _2891 * _2915;
    int _2931 = _2929 + _2537;
    bool _2933 = !_2853;
    int _2935 = _2933 ? 0 : 1;
    int _2937 = abs(_2925);
    bool _2939 = uint(_2931) >= uint(_1329);
    int _2941 = ~_2927;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    bool _2947 = _2851 != 3;
    int _2949 = _2945;
    if (_2881)
    {
        int _2951 = ~_2927;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    float _2957 = fma(_2695, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2913);
    int _2959 = abs(_2935);
    float _2961 = _2957 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2963 = !_2947;
    int _2965 = _2963 ? 0 : (-1);
    int _2967 = abs(_2955);
    int _2969 = ~_2937;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = abs(_2965);
    int _2977 = ~_2959;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = _2973 * as_type<int>(_2831);
    bool _2985 = !_2939;
    int _2987 = _2985 ? 0 : (-1);
    int _2989 = _2981 * as_type<int>(_2823);
    int _2991 = _2989 + _2983;
    int _2993 = ~_2967;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3001 = ~_2915;
    int _3003 = _3001 + _2987;
    int _3005 = _3003 + 1;
    int _3007 = ~_2975;
    int _3009 = _3007 + 1;
    int _3011 = _3009 + 1;
    int _3013 = _2997 * as_type<int>(_2867);
    int _3015 = _3013 + _2991;
    bool _3017 = !_2501;
    int _3019 = _3017 ? 0 : 1;
    int _3021 = _1329 * _3005;
    int _3023 = _3021 + _2537;
    float _3025 = _1941 * _1999;
    int _3027 = _3011 * as_type<int>(_2875);
    int _3029 = _3027 + _3015;
    int _3031 = abs(_3019);
    float _3033 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3035 = !_2463;
    int _3037 = _3035 ? _3023 : (-1);
    float _3039 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3041 = _3025 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3043 = _1941 > 0.0;
    bool _3045 = isnan(_1941);
    bool _3047 = _3043 || _3045;
    bool _3049 = isnan(0.0);
    bool _3051 = _3047 || _3049;
    float _3053 = _3033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3055 = ~_3031;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    float _3061 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3063 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3065 = _1999 <= 0.0;
    bool _3067 = !_3051;
    bool _3069 = _3065 || _3067;
    int _3071 = _3029 * _3059;
    float _3073 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2380);
    out.m_64.x = _3053;
    out.m_64.y = _3061;
    out.m_64.z = _3063;
    out.m_64.w = _2961;
    int _3075 = _3037 * _3031;
    int _3077 = _3075 + _3071;
    float _3079 = _3073 + _2237;
    float _3081 = _3041 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3083 = _2320 * _2917;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2279;
    out.gl_Position.z = _3073;
    out.gl_Position.w = _2237;
    float _3085 = _3079 * 0.5;
    float _3087 = float(_3077);
    out.m_49.x = _3081;
    float _3089 = _2310 * _2917;
    float _3091 = -_2399;
    float _3093 = _3091 + 1.0;
    out.m_66.y = _3087;
    float _3095 = fma(_2316, _3089, _2304);
    float _3097 = fma(_2318, _3089, _2306);
    float _3099 = _2310 * _3093;
    out.m_68.z = _3085;
    out.m_68.w = _2237;
    float _3101 = fma(_2310, _3083, _2308);
    out.m_70.x = _3095;
    out.m_70.y = _3097;
    out.m_70.z = _3101;
    out.m_70.w = _3099;
    if (!_3069)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3103 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3103;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _939 = false;
    bool _841 = false;
    bool _571 = false;
    bool _329 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = in.m_44.w;
    float _88 = trunc(_84);
    int _91 = int(_88);
    float _93 = -_86;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _95;
    bool _99 = _91 >= 1;
    float _101 = 0.0;
    float _103 = as_type<float>(_91);
    float _105 = _95;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_99)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_113);
        out.gl_Position.z = _3172;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _117 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_86);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = float(_91);
    bool _129 = _95 >= _127;
    bool _131 = !_125;
    bool _133 = _129 || _131;
    if (_133)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _103;
    if (_133)
    {
        out.m_49.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _115 = as_type<int>(_137);
    }
    int _139 = _115;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3227 = as_type<float>(_139);
        out.gl_Position.z = _3227;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_54.w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    float _163 = in.m_42.x;
    float _165 = in.m_42.y;
    float _167 = in.m_42.z;
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = _141;
    if (!_155)
    {
        float _179 = _143 * _143;
        float _181 = _179 * 0.5;
        _177 = _181;
    }
    float _183 = _177;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _183;
    if (!_155)
    {
        float _191 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_155;
    float _201 = _193;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _143 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _143);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _237 = 1.0 / _127;
    float _239 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _245 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _247 = _235 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _249 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].x, _243);
    float _251 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].y, _245);
    float _253 = fma(_239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _249);
    float _257 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _251);
    float _259 = _249;
    if (!_155)
    {
        _259 = _143;
    }
    float _261 = _259;
    bool _263 = !_155;
    float _265 = _261;
    if (!_263)
    {
        float _267 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = log2(_267);
        float _271 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _273 = _271 + 1.0;
        float _275 = 1.0 / _273;
        float _277 = _143 * _269;
        float _279 = exp2(_277);
        float _281 = -_279;
        float _283 = _281 + 1.0;
        float _285 = _283 * _275;
        _265 = _285;
    }
    float _287 = _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _291 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _253);
    float _293 = fma(_287, _157, _255);
    float _295 = fma(_287, _159, _257);
    float _297 = _95 * _237;
    float _299 = fma(_287, _161, _291);
    float _301 = fma(_293, _145, _163);
    float _303 = fma(_295, _145, _165);
    float _305 = fma(_299, _145, _167);
    bool _307 = !_289;
    float _309 = _297;
    float _327;
    if (!_307)
    {
        float _311 = in.m_56.x;
        float _313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _315 = _311 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _319 = _317 * _313;
        float _321 = floor(_319);
        float _323 = -_321;
        float _325 = _319 + _323;
        _327 = _325;
        _329 = true;
    }
    else
    {
        _327 = _297;
    }
    _329 = false;
    float _331 = _327;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = 1.0 / _343;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _361 = 1.0 / _347;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = _331 + _363;
    float _367 = 1.0 / _351;
    float _369 = _335 * _357;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _373 = _331 + _371;
    float _375 = 1.0 / _355;
    float _377 = _339 * _361;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    bool _383 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _385 = isnan(_331);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = fma(_381, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _365 * _367;
    bool _399 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _401 = isnan(_331);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -_393;
    float _413 = _411 + 1.0;
    bool _415 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_331);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_409;
    float _429 = _427 + 1.0;
    float _431 = _373 * _375;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _433;
    float _437 = _393 * _429;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = fma(_435, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _449 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _451 = isnan(_331);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = fma(_441, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _463 = fma(_445, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _465 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _467 = isnan(_331);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = _459 * _413;
    float _479 = -_459;
    float _481 = _479 + 1.0;
    float _483 = in.m_54.x;
    float _485 = in.m_54.y;
    float _487 = _425 * _481;
    float _489 = -_425;
    float _491 = _489 + 1.0;
    float _493 = -_475;
    float _495 = _493 + 1.0;
    float _497 = _475 * _491;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = _447 * _497;
    float _509 = _395 * _497;
    float _511 = fma(_501, _397, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _513 = fma(_505, _397, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _515 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _517 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _527 = fma(_461, _487, _515);
    float _529 = fma(_463, _487, _517);
    float _531 = fma(_521, _431, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_525, _431, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _535 = fma(_511, _477, _527);
    float _537 = fma(_513, _477, _529);
    float _539 = fma(_531, _437, _535);
    float _541 = fma(_533, _437, _537);
    float _543 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[147].x, _539);
    float _545 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[147].y, _541);
    float _547 = _543 * _483;
    float _549 = _545 * _485;
    bool _551 = !_359;
    float _569;
    if (!_551)
    {
        float _553 = in.m_56.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        _569 = _297;
    }
    _571 = false;
    float _573 = _569;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _577 = _573 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = _573 + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _585 = _573 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _603 = 1.0 / _597;
    bool _605 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _607 = isnan(_573);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _593;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _621 = _573 + _619;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _625 = 1.0 / _601;
    float _627 = _581 * _603;
    float _629 = 1.0 / _589;
    float _631 = _621 * _617;
    bool _633 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _635 = isnan(_573);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    bool _645 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _647 = isnan(_573);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_643;
    float _659 = _657 + 1.0;
    float _661 = _577 * _625;
    bool _663 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _665 = isnan(_573);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _675;
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = _673 * _659;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = _585 * _629;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _695;
    float _699 = fma(_677, _627, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _705 = fma(_693, _627, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _707 = fma(_697, _627, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _709 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _711 = isnan(_573);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _615 * _681;
    float _723 = -_615;
    float _725 = _723 + 1.0;
    float _727 = _655 * _687;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _737 = _719 * _725;
    float _739 = -_719;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, _661, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _745 = fma(_703, _661, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _747 = _699 * _737;
    float _749 = _705 * _737;
    float _751 = _707 * _737;
    float _753 = fma(_735, _661, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _755;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _763;
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].x, _747);
    float _769 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].y, _749);
    float _771 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[107].z, _751);
    float _773 = fma(_757, _689, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _775 = fma(_761, _689, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _777 = fma(_765, _689, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _779 = fma(_743, _721, _767);
    float _781 = fma(_745, _721, _769);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _791 = fma(_753, _721, _771);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _797 = fma(_773, _727, _779);
    float _799 = fma(_785, _631, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _801 = fma(_789, _631, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _803 = fma(_795, _631, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _805 = fma(_775, _727, _781);
    float _807 = fma(_777, _727, _791);
    float _809 = fma(_799, _683, _797);
    float _811 = fma(_801, _683, _805);
    float _813 = fma(_803, _683, _807);
    float _815 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].x, _809);
    float _817 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].y, _811);
    float _819 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[111].z, _813);
    bool _821 = !_623;
    float _839;
    if (!_821)
    {
        float _823 = in.m_56.x;
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _827 = _823 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        _839 = _297;
    }
    _841 = false;
    float _843 = _839;
    bool _845 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = isnan(_843);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _861 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _863 = isnan(_843);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _879 = _843 + _877;
    float _881 = -_855;
    float _883 = _881 + 1.0;
    bool _885 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _887 = 1.0 / _859;
    float _889 = _871 * _883;
    float _891 = -_871;
    float _893 = _891 + 1.0;
    float _895 = _875 * _887;
    float _897 = _819 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _899 = fma(_895, _879, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _901 = _817 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _903 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _899 * _889;
    float _907 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[115].x, _905);
    float _911 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _913 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[116].x, _909);
    float _915 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _917 = _913 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _915;
    out.m_58.y = _907;
    out.m_58.z = _903;
    out.m_58.w = _917;
    bool _919 = !_885;
    float _937;
    if (!_919)
    {
        float _921 = in.m_56.x;
        float _923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _925 = _921 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[11].z, _95);
        float _929 = _927 * _923;
        float _931 = floor(_929);
        float _933 = -_931;
        float _935 = _929 + _933;
        _937 = _935;
        _939 = true;
    }
    else
    {
        _937 = _297;
    }
    _939 = false;
    float _941 = _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _945 = _941 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _949 = _941 + _947;
    bool _951 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _953 = isnan(_941);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _981 = _941 + _979;
    float _983 = 1.0 / _973;
    bool _985 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _987 = isnan(_941);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = 1.0 / _969;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1001 = _941 + _999;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1005 = 1.0 / _965;
    float _1007 = _945 * _983;
    float _1009 = 1.0 / _977;
    float _1011 = _1001 * _997;
    bool _1013 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1015 = isnan(_941);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = -_961;
    float _1027 = _1025 + 1.0;
    float _1029 = _1023 * _1027;
    float _1031 = _949 * _1005;
    bool _1033 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1035 = isnan(_941);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1045;
    float _1049 = -_1023;
    float _1051 = _1049 + 1.0;
    float _1053 = fma(_1047, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1055 = -_1043;
    float _1057 = _1055 + 1.0;
    float _1059 = _981 * _1009;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1065;
    float _1069 = fma(_1063, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1071 = fma(_1067, _1007, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1073 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1075 = isnan(_941);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = _1043 * _1051;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1091 = _995 * _1057;
    float _1093 = -_995;
    float _1095 = _1093 + 1.0;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1103 = _1101 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1105 = fma(_1089, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1107 = _1083 * _1095;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    float _1113 = fma(_1099, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1115 = fma(_1103, _1059, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1117 = _1069 * _1107;
    float _1119 = _1071 * _1107;
    float _1121 = _1053 * _1107;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1127;
    float _1131 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1117);
    float _1133 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1119);
    float _1135 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1121);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1137;
    float _1141 = fma(_1125, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1143 = fma(_1129, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1145 = fma(_1113, _1091, _1131);
    float _1147 = fma(_1105, _1091, _1133);
    float _1149 = fma(_1115, _1091, _1135);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1159 = fma(_1139, _1031, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1165 = fma(_1141, _1085, _1145);
    float _1167 = fma(_1153, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = fma(_1157, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1171 = fma(_1143, _1085, _1147);
    float _1173 = fma(_1163, _1011, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1175 = fma(_1159, _1085, _1149);
    float _1177 = fma(_1167, _1029, _1165);
    float _1179 = fma(_1169, _1029, _1171);
    float _1181 = fma(_1173, _1029, _1175);
    float _1183 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1177);
    float _1185 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1179);
    float _1187 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1181);
    bool _1189 = !_1003;
    if (!_1189)
    {
        float _1191 = in.m_56.x;
        float _1193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1195 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[11].w, _95);
        float _1199 = _1197 * _1193;
        float _1201 = floor(_1199);
        float _1203 = -_1201;
        float _1205 = _1199 + _1203;
        _309 = _1205;
    }
    float _1207 = _309;
    float _1209 = in.m_56.x;
    float _1211 = in.m_56.y;
    float _1213 = in.m_56.z;
    float _1215 = in.m_56.w;
    float _1217 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1219 = log2(_1217);
    float _1221 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1223 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1235 = _1233 != 0;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1243 = !_1235;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1249 = _1209 * 2.0;
    float _1251 = _1213 * 2.0;
    float _1253 = _1211 * 2.0;
    float _1255 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1257 = floor(_1249);
    float _1259 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1263 = -_1237;
    float _1265 = fma(_1255, 2.0, _1263);
    float _1267 = _1209 + (-0.5);
    float _1269 = fma(_1259, -2.0, _1239);
    float _1271 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1261);
    int _1273 = abs(_1245);
    float _1275 = floor(_1251);
    float _1277 = _1211 + _1209;
    float _1279 = _1277 + (-1.0);
    float _1281 = floor(_1253);
    bool _1283 = _1257 > 0.0;
    float _1285 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1287 = !_1227;
    int _1289 = _1287 ? 0 : 1;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1293 = _1291 != 0;
    bool _1295 = _1257 >= 0.0;
    bool _1297 = isnan(_1257);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.0);
    bool _1303 = _1299 || _1301;
    float _1305 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1307 = int(_1305);
    bool _1309 = _1275 >= 0.0;
    bool _1311 = isnan(_1275);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _1317 ? 0 : 1;
    bool _1321 = _1275 > 0.0;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1325 = _1303 ? 0 : 1;
    float _1327 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1329 = int(_1327);
    float _1331 = _1279;
    float _1333 = _1255;
    if (!_1293)
    {
        _1331 = _1213;
    }
    float _1335 = _1331;
    float _1337 = _1335;
    if (_1293)
    {
        _1337 = _1211;
    }
    float _1339 = _1337;
    bool _1341 = _1281 > 0.0;
    bool _1343 = _1281 >= 0.0;
    bool _1345 = isnan(_1281);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.0);
    bool _1351 = _1347 || _1349;
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1323);
    float _1355 = _1339;
    if (!_1293)
    {
        _1333 = _1211;
    }
    float _1357 = _1333;
    float _1359 = _1357;
    if (_1293)
    {
        _1359 = _1209;
    }
    float _1361 = _1359;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1293)
    {
        _1355 = _1213;
    }
    float _1365 = _1355;
    int _1367 = ~_1319;
    int _1369 = _1367 + 1;
    int _1371 = _1369 + 1;
    float _1373 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1375 = _1365;
    int _1377 = _1371;
    if (_1293)
    {
        _1375 = _1211;
    }
    float _1379 = _1375;
    float _1381 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1363);
    if (!_1321)
    {
        int _1383 = ~_1319;
        int _1385 = _1383 + 1;
        _1377 = _1385;
    }
    int _1387 = _1377;
    float _1389 = -_1247;
    float _1391 = fma(_1373, 2.0, _1389);
    int _1393 = abs(_1289);
    float _1395 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1397 = float(_1307);
    float _1399 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1381);
    int _1401 = _1351 ? 0 : 1;
    float _1403 = fma(_1395, -2.0, _1241);
    float _1405 = float(_1393);
    float _1407 = 1.0 / _1397;
    float _1409 = float(_1387);
    int _1411 = ~_1325;
    int _1413 = _1411 + 1;
    int _1415 = _1413 + 1;
    int _1417 = _1415;
    if (!_1283)
    {
        int _1419 = ~_1325;
        int _1421 = _1419 + 1;
        _1417 = _1421;
    }
    int _1423 = _1417;
    float _1425 = _1219 * _95;
    int _1427 = ~_1401;
    int _1429 = _1427 + 1;
    int _1431 = _1429 + 1;
    float _1433 = _1405 * _1409;
    int _1435 = _1431;
    if (!_1341)
    {
        int _1437 = ~_1401;
        int _1439 = _1437 + 1;
        _1435 = _1439;
    }
    int _1441 = _1435;
    float _1443 = exp2(_1425);
    float _1445 = in.m_60.x;
    float _1447 = in.m_60.y;
    float _1449 = in.m_60.z;
    bool _1451 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1453 = isnan(0.0);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1459 = _1455 || _1457;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1463 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1465 = isnan(1.0);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1475 = 1.0 + _1473;
    float _1477 = float(_1329);
    float _1479 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    bool _1481 = !_1231;
    int _1483 = _1481 ? 0 : 1;
    float _1485 = 1.0 / _1475;
    float _1487 = float(_1423);
    float _1489 = -_95;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1265);
    int _1493 = abs(_1483);
    float _1495 = -_1443;
    float _1497 = _1495 + 1.0;
    float _1499 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1269);
    float _1501 = _1477 * _95;
    float _1503 = _1433 * (-2.0);
    float _1505 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1353);
    float _1507 = _1459 ? _1497 : 0.0;
    float _1509 = _1407 * _95;
    float _1511 = float(_1493);
    float _1513 = fma(_1503, _1445, _1445);
    float _1515 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1479);
    float _1517 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1271);
    float _1519 = -_95;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1391);
    float _1523 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1403);
    if (_1471)
    {
        float _1525 = _1507 * _1485;
        _105 = _1525;
    }
    float _1527 = _105;
    float _1529 = fma(_1285, _1503, _1285);
    float _1531 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1513);
    float _1533 = _1511 * _1487;
    float _1535 = _1211 + _1213;
    float _1537 = fma(_1529, _1527, _1531);
    float _1539 = _1533 * (-2.0);
    float _1541 = float(_1273);
    float _1543 = _1535 + (-1.0);
    float _1545 = float(_1441);
    float _1547 = _1537 * 0.15915493667125701904296875;
    float _1549 = fma(_1539, _1447, _1447);
    float _1551 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1553 = _1213 + _1209;
    float _1555 = _1541 * _1545;
    float _1557 = _1211 + (-0.5);
    float _1559 = fma(_1551, _1539, _1551);
    float _1561 = _1555 * (-2.0);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1549);
    float _1565 = _1553 + (-1.0);
    float _1567 = _1547 * 6.283185482025146484375;
    float _1569 = sin(_1567);
    float _1571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1573 = fma(_1559, _1527, _1563);
    float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1577 = fma(_1561, _1449, _1449);
    float _1579 = _1213 + (-0.5);
    float _1581 = _1573 * 0.15915493667125701904296875;
    float _1583 = fma(_1575, _1561, _1575);
    float _1585 = _1547 * 6.283185482025146484375;
    float _1587 = cos(_1585);
    float _1589 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1577);
    float _1591 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1593 = _1223 * _1571;
    bool _1595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1597 = isnan(0.5);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1603 = _1599 || _1601;
    float _1605 = fma(_1583, _1527, _1589);
    float _1607 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1609 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1611 = _1581 * 6.283185482025146484375;
    float _1613 = sin(_1611);
    float _1615 = _1605 * 0.15915493667125701904296875;
    float _1617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1619 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1607);
    float _1621 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1609);
    float _1623 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1591);
    float _1625 = _1221 * _1617;
    float _1627 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1619);
    float _1629 = _1615 * 6.283185482025146484375;
    float _1631 = cos(_1629);
    float _1633 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1623);
    float _1635 = _1581 * 6.283185482025146484375;
    float _1637 = cos(_1635);
    float _1639 = _1569 * _1613;
    float _1641 = _1587 * _1613;
    float _1643 = _1615 * 6.283185482025146484375;
    float _1645 = sin(_1643);
    float _1647 = _1631 * _1625;
    float _1649 = _1613 * _1631;
    float _1651 = _1587 * _1647;
    float _1653 = _1569 * _1647;
    float _1655 = _1587 * _1637;
    float _1657 = _1569 * _1637;
    float _1659 = _1637 * _1631;
    float _1661 = fma(_1645, _1655, _1639);
    float _1663 = -_1641;
    float _1665 = fma(_1645, _1657, _1663);
    float _1667 = -_1657;
    float _1669 = fma(_1645, _1641, _1667);
    float _1671 = -_1625;
    float _1673 = _1645 * _1671;
    float _1675 = fma(_1661, _1593, _1651);
    float _1677 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1679 = fma(_1645, _1639, _1655);
    float _1681 = fma(_1659, _1593, _1673);
    float _1683 = fma(_1665, _1593, _1653);
    float _1685 = fma(_1669, _1677, _1675);
    float _1687 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1621);
    float _1689 = fma(_1649, _1677, _1681);
    float _1691 = fma(_1679, _1677, _1683);
    float _1693 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1697 = _1687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1699 = _1627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1701 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1693);
    float _1703 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1695);
    float _1705 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1707 = _1633 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1709 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1701);
    float _1711 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1703);
    float _1713 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1705);
    float _1715 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1717 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1721 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1713);
    float _1723 = _1707 + _1717;
    float _1725 = _1699 + _1719;
    float _1727 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1731 = _1723 + _1729;
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1735 = _1725 + _1733;
    float _1737 = 1.0 / _1727;
    float _1739 = _1731 * _1731;
    float _1741 = fma(_1735, _1735, _1739);
    float _1743 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1715);
    float _1745 = sqrt(_1741);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1743);
    float _1749 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1751 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1753 = _1749 + _1727;
    float _1755 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1751);
    float _1757 = _1753 * _1737;
    float _1759 = _1757 * 0.5;
    float _1761 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1755);
    bool _1763 = _1745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1767 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1765);
    float _1769 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1771 = _1759;
    float _1773 = _1691;
    float _1775 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1777 = _1769;
    float _1779 = _1745;
    float _1781 = _1675;
    float _1783 = _1737;
    if (_1603)
    {
        _1771 = 1.0;
    }
    float _1785 = _1771;
    int _1787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1789 = _1787 != 0;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1793 = _1791 != 0;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1797 = _1795 != 0;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1801 = _1799 != 0;
    float _1803 = _1697 + _1769;
    float _1805 = 1.0 / _1767;
    bool _1807 = !_1793;
    int _1809 = _1807 ? 0 : 1;
    bool _1811 = !_1789;
    int _1813 = _1811 ? 0 : 1;
    bool _1815 = !_1797;
    int _1817 = _1815 ? 0 : 1;
    bool _1819 = !_1801;
    int _1821 = _1819 ? 0 : 1;
    float _1823 = _1785;
    if (!_1763)
    {
        _1773 = _1725;
    }
    float _1825 = _1773;
    float _1827 = _1825;
    if (!_1763)
    {
        _1775 = _1723;
    }
    float _1829 = _1775;
    float _1831 = _1829;
    if (!_1763)
    {
        _1777 = _1803;
    }
    float _1833 = _1777;
    bool _1835 = !_1763;
    float _1837 = _1833;
    float _1839 = _1805;
    if (!_1835)
    {
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1845 = _1745 + _1843;
        float _1847 = rsqrt(_1741);
        float _1849 = _1845 * _1841;
        float _1851 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1853 = _1849 * 0.15915493667125701904296875;
        float _1855 = _1853 * 6.283185482025146484375;
        float _1857 = cos(_1855);
        float _1859 = _1853 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = _1857 + (-1.0);
        float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1867 = fma(_1861, _1851, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1869 = fma(_1803, _1857, _1865);
        float _1871 = _1847 * _1867;
        float _1873 = fma(_1735, _1871, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1875 = fma(_1731, _1871, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1837 = _1869;
        _1827 = _1873;
        _1831 = _1875;
    }
    float _1877 = _1837;
    float _1879 = _1827;
    float _1881 = _1831;
    if (_1603)
    {
        _1779 = 1.0;
    }
    float _1883 = _1779;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1887 = _1805 * _1885;
    float _1889 = _1883;
    if (!_1603)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = _1893 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1895 * 0.15915493667125701904296875;
        float _1903 = _1893 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1899;
        float _1909 = _1901 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = _1905 * _1907;
        float _1915 = _1901 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = 1.0 / _1919;
        float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1925 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1923;
        float _1927 = 1.0 / _1925;
        float _1929 = _1917 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1933 = fma(_1887, _1929, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        _1839 = _1893;
        _1823 = _1937;
    }
    float _1939 = _1839;
    float _1941 = _1823;
    float _1943 = _1939;
    if (!_1603)
    {
        float _1945 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1947 = _1945 * 0.15915493667125701904296875;
        float _1949 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1951 = _1947 * 6.283185482025146484375;
        float _1953 = cos(_1951);
        float _1955 = _1949 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = 1.0 / _1953;
        float _1963 = _1955 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = _1959 * _1961;
        float _1969 = _1955 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        float _1973 = _1965 * _1967;
        float _1975 = 1.0 / _1973;
        float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1979 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1977;
        float _1981 = 1.0 / _1979;
        float _1983 = _1971 * _1975;
        float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1987 = fma(_1887, _1983, _1985);
        float _1989 = _1987 * _1981;
        float _1991 = precise::clamp(_1989, 0.0, 1.0);
        float _1993 = -_1991;
        float _1995 = _1993 + 1.0;
        _1943 = _1961;
        _1889 = _1995;
    }
    float _1997 = _1943;
    float _1999 = _1889;
    float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2003 = _1877 + _2001;
    float _2005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2007 = _1879 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2011 = _1881 + _2009;
    float _2013 = _2003 * _2003;
    float _2015 = fma(_2007, _2007, _2013);
    float _2017 = fma(_2011, _2011, _2015);
    float _2019 = rsqrt(_2017);
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2023 = _2007 * _2021;
    float _2025 = _2011 * _2021;
    float _2027 = _2023 * _2023;
    float _2029 = _2025 * _2025;
    float _2031 = _2027 + _2029;
    float _2033 = sqrt(_2031);
    bool _2035 = _2033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2039 = _2033 + _2037;
    float _2041 = _1997;
    float _2043 = _2031;
    float _2045 = _2039;
    float _2047 = _2003;
    float _2049 = _2023;
    float _2051 = _2025;
    float _2053 = _2027;
    float _2055 = _2029;
    if (_2035)
    {
        float _2057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2041 = _2057;
    }
    float _2059 = _2041;
    if (_2035)
    {
        float _2061 = rsqrt(_2031);
        _2043 = _2061;
    }
    float _2063 = _2043;
    if (_2035)
    {
        float _2065 = _2039 * _2059;
        _2045 = _2065;
    }
    float _2067 = _2045;
    if (_2035)
    {
        float _2069 = _2067 * 0.15915493667125701904296875;
        _1781 = _2069;
    }
    float _2071 = _1781;
    float _2073 = _1803;
    if (_2035)
    {
        float _2075 = _2071 * 6.283185482025146484375;
        float _2077 = sin(_2075);
        _2073 = _2077;
    }
    float _2079 = _2073;
    float _2081 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2083 = precise::max(0.0, _2081);
    float _2085 = _2059;
    float _2087 = _2083;
    if (_2035)
    {
        float _2089 = _2071 * 6.283185482025146484375;
        float _2091 = cos(_2089);
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = -_2021;
    float _2097 = -_2083;
    float _2099 = fma(_2003, _2095, _2097);
    if (_2035)
    {
        float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2047 = _2101;
    }
    float _2103 = _2047;
    float _2105 = _2103;
    if (_2035)
    {
        float _2107 = fma(_2079, _2103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1783 = _2107;
    }
    float _2109 = _1783;
    float _2111 = _2109;
    if (!_2035)
    {
        _2105 = _2099;
    }
    float _2113 = _2105;
    float _2115 = sqrt(_2017);
    float _2117 = _2113;
    if (_2035)
    {
        float _2119 = _2093 + (-1.0);
        _2087 = _2119;
    }
    float _2121 = _2087;
    float _2123 = _2121;
    if (_2035)
    {
        float _2125 = _2063 * _2109;
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (_2035)
    {
        float _2129 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2129;
    }
    float _2131 = _2123;
    if (_2035)
    {
        float _2133 = _2023 * _2127;
        _2049 = _2133;
    }
    float _2135 = _2049;
    if (_2035)
    {
        float _2137 = _2025 * _2127;
        _2051 = _2137;
    }
    float _2139 = _2051;
    float _2141 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_2035)
    {
        float _2143 = fma(_2099, _2093, _2131);
        _2117 = _2143;
    }
    float _2145 = _2117;
    if (_2035)
    {
        float _2147 = _2135 * _2135;
        _2053 = _2147;
    }
    float _2149 = _2053;
    if (_2035)
    {
        float _2151 = _2139 * _2139;
        _2055 = _2151;
    }
    float _2153 = _2055;
    float _2155 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2157 = fma(_2145, _2145, _2149);
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2161 = fma(_2115, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2159);
    float _2163 = precise::clamp(_2161, 0.0, 1.0);
    float _2165 = _2157 + _2153;
    float _2167 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2155);
    float _2169 = -_2163;
    float _2171 = _2169 + 1.0;
    float _2173 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2175 = rsqrt(_2165);
    float _2177 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2167);
    float _2179 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2181 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2173);
    float _2183 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2185 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2187 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2179);
    float _2189 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2191 = abs(_2171);
    float _2193 = log2(_2191);
    float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2197 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2187);
    float _2199 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2183);
    float _2203 = -_2195;
    float _2205 = fma(_2203, _2141, 1.0);
    float _2207 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2211 = _2175 * _2135;
    float _2213 = _2175 * _2145;
    float _2215 = _2175 * _2139;
    float _2217 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2201);
    float _2219 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2221 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2209);
    float _2223 = log2(_2205);
    float _2225 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2227 = -_2219;
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2227);
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2233 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2221);
    float _2235 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2237 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2233);
    float _2239 = -_2215;
    float _2241 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2229);
    float _2243 = exp2(_2231);
    float _2245 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2247 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2235);
    float _2249 = fma(_2241, -0.5, 0.5);
    float _2251 = fma(_2241, 0.5, 0.5);
    float _2253 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2245);
    float _2255 = _2213 + 1.0;
    float _2257 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2247);
    float _2259 = 1.0 / _2237;
    float _2261 = fma(_2251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2263 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2253);
    float _2265 = _2223 * 0.693147182464599609375;
    float _2267 = fma(_2251, _2261, -0.212114393711090087890625);
    float _2269 = _2265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = sqrt(_2249);
    float _2273 = -_2213;
    float _2275 = fma(_2243, _2255, _2273);
    float _2277 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2263);
    float _2279 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2281 = fma(_2251, _2267, 1.570728778839111328125);
    float _2283 = fma(_2275, 0.5, 0.5);
    float _2285 = _2277 * _2259;
    float _2287 = _2279 * _2259;
    float _2289 = fma(_2285, 0.5, 0.5);
    float _2291 = fma(_2287, -0.5, 0.5);
    float _2293 = _2271 * 0.636619746685028076171875;
    float _2295 = -_2281;
    float _2297 = fma(_2293, _2295, 1.0);
    float3 _6678 = float3(_2289, _2291, _2269);
    float _2299 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6678, float3(0.0), isnan(_6678)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6678, float3(0.0), isnan(_6678)), level(0.0)).x;
    float3 _6689 = float3(_2289, _2291, _2269);
    float4 _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6689, float3(0.0), isnan(_6689)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6689, float3(0.0), isnan(_6689)), level(0.0)).xyzw;
    float _2304 = _2302.x;
    float _2306 = _2302.y;
    float _2308 = _2302.z;
    float _2310 = _2302.w;
    float2 _6706 = float2(_2297, _2283);
    float3 _2314 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6706, float2(0.0), isnan(_6706)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6706, float2(0.0), isnan(_6706)), level(0.0)).xyz;
    float _2316 = _2314.x;
    float _2318 = _2314.y;
    float _2320 = _2314.z;
    float _2322 = float(uint(_1329));
    float _2324 = trunc(_1509);
    int _2326 = int(_2324);
    int _2328 = ~_1329;
    int _2330 = _2328 + 1;
    float _2332 = _1501 * _237;
    int _2334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2336 = _2334 != 0;
    float _2338 = -_1399;
    float _2340 = _2338 + 1.0;
    int _2342 = abs(_1809);
    float _2344 = -_1505;
    float _2346 = _2344 + 1.0;
    int _2348 = abs(_1813);
    float _2350 = 1.0 / _2322;
    float _2352 = -_1515;
    float _2354 = _2352 + 1.0;
    int _2356 = _1329 + (-1);
    float _2358 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2360 = !_2336;
    float _2362 = _2360 ? 1.2345600128173828125 : 1.0;
    float _2364 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2366 = abs(_1817);
    float _2368 = trunc(_2332);
    int _2370 = int(_2368);
    float _2372 = float(uint(_2326));
    float _2374 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2358);
    int _2376 = abs(_1821);
    bool _2378 = _1215 > 0.5;
    float _2380 = fma(_2185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2374);
    int _2382 = as_type<int>(_2350) + (-2);
    float _2384 = exp2(_2364);
    float _2386 = as_type<float>(_2382) * _2372;
    float _2388 = trunc(_2386);
    float _2390 = precise::max(_2388, 0.0);
    uint _2393 = uint(_2390);
    float _2395 = -_2384;
    float _2397 = _2395 + 1.0;
    float _2399 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2401 = _2330 * int(_2393);
    int _2403 = _2401 + _2326;
    float _2405 = float(uint(_2403));
    float _2407 = as_type<float>(_2382) * _2405;
    bool _2409 = !_2336;
    float _2411 = _2409 ? _1211 : _1209;
    float _2413 = trunc(_2407);
    float _2415 = precise::max(_2413, 0.0);
    uint _2417 = uint(_2415);
    float _2419 = _2411 * _2362;
    float _2421 = float(_2326);
    bool _2423 = _2421 >= _1477;
    bool _2425 = isnan(_2421);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(_1477);
    bool _2431 = _2427 || _2429;
    float _2433 = float(_2431);
    float _2435 = floor(_2419);
    int _2437 = int(_2393) + int(_2417);
    float _2439 = trunc(_2433);
    int _2441 = int(_2439);
    int _2443 = _2330 * _2437;
    int _2445 = _2443 + _2326;
    float _2447 = -_2435;
    float _2449 = _2419 + _2447;
    bool _2451 = uint(_2445) >= uint(_1329);
    float _2453 = _2449 * _1477;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2457 = _2455 != 0;
    bool _2459 = !_2451;
    int _2461 = _2459 ? 0 : (-1);
    bool _2463 = _1329 == 0;
    float _2465 = trunc(_2453);
    int _2467 = int(_2465);
    int _2469 = ~_2437;
    int _2471 = _2469 + _2461;
    int _2473 = _2471 + 1;
    int _2475 = ~_2441;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    bool _2481 = !_2457;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _1329 * _2473;
    int _2487 = _2485 + _2326;
    int _2489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2491 = _2489 != 0;
    int _2493 = abs(_2483);
    bool _2495 = !_2463;
    int _2497 = _2495 ? _2487 : (-1);
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2501 = _2499 != 0;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2505 = _2503 != 0;
    int _2507 = _2497 * _2479;
    int _2509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2511 = _2509 != 0;
    int _2513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2515 = _2513 != 0;
    int _2517 = _2441 * _2356;
    int _2519 = _2517 + _2507;
    int _2521 = _2519 * _2342;
    bool _2523 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2525 = isnan(_1207);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    int _2535 = _2467 * _2493;
    int _2537 = _2535 + _2326;
    int _2539 = _2370 * _2348;
    int _2541 = _2539 + _2521;
    int _2543 = ~_1329;
    int _2545 = _2543 + 1;
    int _2547 = _2537 * _2366;
    int _2549 = _2547 + _2541;
    int _2551 = ~_1329;
    int _2553 = _2551 + 1;
    int _2555 = _2467 * _2376;
    int _2557 = _2555 + _2549;
    int _2559 = ~_1329;
    int _2561 = _2559 + 1;
    float _2563 = float(uint(_2557));
    float _2565 = as_type<float>(_2382) * _2563;
    float _2567 = trunc(_2565);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    int _2573 = _2561 * int(_2571);
    int _2575 = _2573 + _2557;
    float _2577 = float(uint(_2575));
    float _2579 = as_type<float>(_2382) * _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2585 = trunc(_2579);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2599 = 1.0 / _2583;
    int _2601 = int(_2571) + int(_2589);
    float _2603 = 1.0 / _2593;
    float _2605 = -_197;
    int _2607 = _2378 ? as_type<int>(_2605) : as_type<int>(_197);
    int _2609 = _2545 * _2601;
    int _2611 = _2609 + _2557;
    float _2613 = 1.0 / _2597;
    bool _2615 = uint(_2611) >= uint(_1329);
    bool _2617 = !_2491;
    float _2619 = _2617 ? _197 : as_type<float>(_2607);
    bool _2621 = _1211 > 0.5;
    float _2623 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2625 = _2623 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2627 = !_2615;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _1209 > 0.5;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2635 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2633;
    float _2637 = -_197;
    int _2639 = _2621 ? as_type<int>(_2637) : as_type<int>(_197);
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2641;
    bool _2645 = _1213 > 0.5;
    float _2647 = _2635 * _2599;
    float _2649 = _2625 * _2603;
    float _2651 = float(uint(_2537));
    float _2653 = _2643 * _2613;
    bool _2655 = !_2511;
    float _2657 = _2655 ? _197 : as_type<float>(_2639);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2661 = _1207 + _2659;
    int _2663 = ~_2601;
    int _2665 = _2663 + _2629;
    int _2667 = _2665 + 1;
    float _2669 = as_type<float>(_2382) * _2651;
    float _2671 = -_187;
    int _2673 = _2631 ? as_type<int>(_2671) : as_type<int>(_187);
    float _2675 = fma(_2647, _2661, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2677 = -_187;
    int _2679 = _2645 ? as_type<int>(_2677) : as_type<int>(_187);
    int _2681 = _1329 * _2667;
    int _2683 = _2681 + _2557;
    bool _2685 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2687 = isnan(_1207);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2693 = _2689 || _2691;
    float _2695 = float(_2693);
    float _2697 = trunc(_2669);
    float _2699 = precise::max(_2697, 0.0);
    uint _2701 = uint(_2699);
    bool _2703 = !_2505;
    float _2705 = _2703 ? _187 : as_type<float>(_2673);
    float _2707 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2709 = _1207 + _2707;
    bool _2711 = !_2515;
    float _2713 = _2711 ? _187 : as_type<float>(_2679);
    float _2715 = -_2695;
    float _2717 = _2715 + 1.0;
    bool _2719 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2721 = isnan(_1207);
    bool _2723 = _2719 || _2721;
    bool _2725 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2727 = _2723 || _2725;
    float _2729 = float(_2727);
    float _2731 = fma(_2649, _2709, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2733 = _1207 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2735 = isnan(_1207);
    bool _2737 = _2733 || _2735;
    bool _2739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2741 = _2737 || _2739;
    float _2743 = float(_2741);
    float _2745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2747 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2749 = _1207 + _2747;
    float _2751 = _2729 * _2717;
    float _2753 = -_2729;
    float _2755 = _2753 + 1.0;
    bool _2757 = !_2463;
    int _2759 = _2757 ? _2683 : (-1);
    float _2761 = fma(_2653, _2749, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2763 = _2743 * _2755;
    int _2765 = _2759 >> 31;
    float _2767 = -_2743;
    float _2769 = _2767 + 1.0;
    float _2771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2773 = _2553 * int(_2701);
    int _2775 = _2773 + _2537;
    int _2777 = _2765 & 3;
    float _2779 = _2533 * _2769;
    float _2781 = -_2533;
    float _2783 = _2781 + 1.0;
    int _2785 = _2759 & 3;
    bool _2787 = _2785 != 0;
    float _2789 = _2705 + 0.5;
    int _2791 = _2759 + _2777;
    float _2793 = _2675 * _2779;
    float _2795 = float(uint(_2775));
    float _2797 = _2657 + (-0.5);
    int _2799 = _2791 >> 2;
    float _2801 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2793);
    float _2803 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2805 = as_type<float>(_2382) * _2795;
    int _2807 = _2799 << 4;
    int _2809 = _2807 + 512;
    float _2811 = _2713 + 0.5;
    float _2813 = _2771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2815 = fma(_2731, _2763, _2801);
    uint _2817 = uint(int(uint(_2809) >> uint(2)));
    uint _2819 = uint(int(uint(int(_2817)) >> uint(2)));
    int _2821 = int(_2817) & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    int _2825 = int(_2817) + 1;
    uint _2827 = uint(int(uint(_2825) >> uint(2)));
    int _2829 = _2825 & 3;
    float _2831 = (*spvDescriptorSet0.vp_c9)._m0[int(_2827)][_2829];
    float _2833 = fma(_2811, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1521);
    float _2835 = -_2813;
    float _2837 = -_1499;
    float _2839 = fma(_2835, _2797, _2837);
    float _2841 = -_1517;
    float _2843 = _2841 + 1.0;
    float _2845 = trunc(_2805);
    float _2847 = precise::max(_2845, 0.0);
    uint _2849 = uint(_2847);
    int _2851 = _2759 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = fma(_2803, _2789, _1491);
    float _2857 = _2619 + (-0.5);
    int _2859 = _2809 + 8;
    uint _2861 = uint(int(uint(_2859) >> uint(2)));
    uint _2863 = uint(int(uint(int(_2861)) >> uint(2)));
    int _2865 = int(_2861) & 3;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[int(_2863)][_2865];
    int _2869 = int(_2861) + 1;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    int _2873 = _2869 & 3;
    float _2875 = (*spvDescriptorSet0.vp_c9)._m0[int(_2871)][_2873];
    bool _2877 = uint(_2851) > 1u;
    float _2879 = fma(_2657, _2843, _2839);
    bool _2881 = _2851 != 3;
    float _2883 = -_2857;
    float _2885 = -_1523;
    float _2887 = fma(_2883, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2885);
    int _2889 = ~_1329;
    int _2891 = _2889 + 1;
    float _2893 = -_2340;
    float _2895 = fma(_2713, _2893, _2833);
    int _2897 = _2787 ? 0 : 1;
    float _2899 = fma(_2619, _2346, _2887);
    bool _2901 = uint(_2851) >= 2u;
    float _2903 = -_2354;
    float _2905 = fma(_2705, _2903, _2855);
    int _2907 = ~_2897;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = fma(_2761, _2751, _2815);
    int _2915 = int(_2701) + int(_2849);
    float _2917 = _2399 * _2299;
    int _2919 = _2911;
    if (!_2877)
    {
        int _2921 = ~_2897;
        int _2923 = _2921 + 1;
        _2919 = _2923;
    }
    int _2925 = _2919;
    out.m_62.x = _2905;
    out.m_62.y = _2879;
    out.m_62.z = _2895;
    out.m_62.w = _2899;
    int _2927 = _2901 ? 0 : 1;
    int _2929 = _2891 * _2915;
    int _2931 = _2929 + _2537;
    bool _2933 = !_2853;
    int _2935 = _2933 ? 0 : 1;
    int _2937 = abs(_2925);
    bool _2939 = uint(_2931) >= uint(_1329);
    int _2941 = ~_2927;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    bool _2947 = _2851 != 3;
    int _2949 = _2945;
    if (_2881)
    {
        int _2951 = ~_2927;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    float _2957 = fma(_2695, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2913);
    int _2959 = abs(_2935);
    float _2961 = _2957 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2963 = !_2947;
    int _2965 = _2963 ? 0 : (-1);
    int _2967 = abs(_2955);
    int _2969 = ~_2937;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = abs(_2965);
    int _2977 = ~_2959;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = _2973 * as_type<int>(_2831);
    bool _2985 = !_2939;
    int _2987 = _2985 ? 0 : (-1);
    int _2989 = _2981 * as_type<int>(_2823);
    int _2991 = _2989 + _2983;
    int _2993 = ~_2967;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    float _2999 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3001 = ~_2915;
    int _3003 = _3001 + _2987;
    int _3005 = _3003 + 1;
    int _3007 = ~_2975;
    int _3009 = _3007 + 1;
    int _3011 = _3009 + 1;
    int _3013 = _2997 * as_type<int>(_2867);
    int _3015 = _3013 + _2991;
    bool _3017 = !_2501;
    int _3019 = _3017 ? 0 : 1;
    int _3021 = _1329 * _3005;
    int _3023 = _3021 + _2537;
    float _3025 = _1941 * _1999;
    int _3027 = _3011 * as_type<int>(_2875);
    int _3029 = _3027 + _3015;
    int _3031 = abs(_3019);
    float _3033 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3035 = !_2463;
    int _3037 = _3035 ? _3023 : (-1);
    float _3039 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3041 = _3025 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3043 = _1941 > 0.0;
    bool _3045 = isnan(_1941);
    bool _3047 = _3043 || _3045;
    bool _3049 = isnan(0.0);
    bool _3051 = _3047 || _3049;
    float _3053 = _3033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3055 = ~_3031;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    float _3061 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3063 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3065 = _1999 <= 0.0;
    bool _3067 = !_3051;
    bool _3069 = _3065 || _3067;
    int _3071 = _3029 * _3059;
    float _3073 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2380);
    out.m_64.x = _3053;
    out.m_64.y = _3061;
    out.m_64.z = _3063;
    out.m_64.w = _2961;
    int _3075 = _3037 * _3031;
    int _3077 = _3075 + _3071;
    float _3079 = _3073 + _2237;
    float _3081 = _3041 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3083 = _2320 * _2917;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2279;
    out.gl_Position.z = _3073;
    out.gl_Position.w = _2237;
    float _3085 = _3079 * 0.5;
    float _3087 = float(_3077);
    out.m_49.x = _3081;
    float _3089 = _2310 * _2917;
    float _3091 = -_2399;
    float _3093 = _3091 + 1.0;
    out.m_66.y = _3087;
    float _3095 = fma(_2316, _3089, _2304);
    float _3097 = fma(_2318, _3089, _2306);
    float _3099 = _2310 * _3093;
    out.m_68.z = _3085;
    out.m_68.w = _2237;
    float _3101 = fma(_2310, _3083, _2308);
    out.m_70.x = _3095;
    out.m_70.y = _3097;
    out.m_70.z = _3101;
    out.m_70.w = _3099;
    if (!_3069)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3103 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3103;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

