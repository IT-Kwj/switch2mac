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
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _905 = false;
    bool _791 = false;
    bool _497 = false;
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
        float _3652 = as_type<float>(_105);
        out.gl_Position.z = _3652;
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
        float _3722 = as_type<float>(_143);
        out.gl_Position.z = _3722;
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
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _307 = _297;
    if (!_159)
    {
        float _309 = _123 * _123;
        float _311 = _309 * 0.5;
        _273 = _311;
    }
    float _313 = _273;
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _319 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _321 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _323 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _323;
    }
    float _325 = _275;
    bool _327 = !_159;
    float _329 = _325;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = _123 * _333;
        float _343 = 1.0 / _337;
        float _345 = _339 * 0.693147182464599609375;
        float _347 = exp2(_341);
        float _349 = 1.0 / _345;
        float _351 = _347 + (-1.0);
        float _353 = -_351;
        float _355 = fma(_353, _349, _123);
        float _357 = _355 * _343;
        float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _359;
    }
    float _361 = _329;
    float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].y, _317);
    float _367 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].x, _315);
    float _369 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _375 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _377 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].z, _319);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].x, _373);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].z, _375);
    float _387 = fma(_297, _161, _367);
    float _389 = fma(_297, _163, _365);
    float _391 = fma(_297, _165, _377);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].x, _383);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].z, _385);
    if (!_159)
    {
        _307 = _123;
    }
    float _399 = _307;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _431 = fma(_389, _149, _169);
    float _433 = fma(_425, _161, _395);
    float _435 = -_427;
    float _437 = _389 + _435;
    float _439 = fma(_425, _165, _397);
    float _441 = fma(_387, _149, _167);
    float _443 = -_433;
    float _445 = _387 + _443;
    float _447 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _451 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _453 = -_439;
    float _455 = _391 + _453;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _449);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
    float _463 = fma(_391, _149, _171);
    float _465 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].z, _459);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
    bool _471 = !_429;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _509 = _505 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _527 = 1.0 / _513;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _529;
    float _533 = 1.0 / _517;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = _505 + _535;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _541 = 1.0 / _521;
    float _543 = _537 * _527;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _547 = _505 + _545;
    float _549 = 1.0 / _531;
    float _551 = _509 * _533;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _555 = _505 + _553;
    bool _557 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _559 = isnan(_505);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _571 = _505 + _569;
    float _573 = 1.0 / _525;
    float _575 = _547 * _541;
    bool _577 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _579 = isnan(_505);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _591 = isnan(_505);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _555 * _549;
    float _603 = -_567;
    float _605 = _603 + 1.0;
    float _607 = -_587;
    float _609 = _607 + 1.0;
    bool _611 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_505);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -_599;
    float _625 = _623 + 1.0;
    float _627 = _599 * _609;
    bool _629 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _631 = isnan(_505);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _571 * _573;
    float _643 = _587 * _605;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _649;
    bool _653 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _655 = isnan(_505);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _621 * _625;
    float _667 = fma(_647, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _669 = fma(_651, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _671 = -_621;
    float _673 = _671 + 1.0;
    float _675 = -_639;
    float _677 = _675 + 1.0;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = _639 * _673;
    float _689 = _663 * _677;
    float _691 = fma(_681, _551, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _693;
    float _697 = -_663;
    float _699 = _697 + 1.0;
    float _701 = _667 * _689;
    float _703 = _669 * _689;
    float _705 = fma(_695, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = fma(_685, _551, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _711;
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _717 = in.m_52.x;
    float _719 = in.m_52.y;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _725 = fma(_713, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _731 = fma(_691, _687, _709);
    float _733 = fma(_707, _687, _715);
    float _735 = fma(_723, _641, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _737 = fma(_729, _641, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _743;
    float _747 = fma(_705, _665, _731);
    float _749 = fma(_725, _665, _733);
    float _751 = fma(_741, _601, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _753 = fma(_745, _601, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _755 = fma(_735, _627, _747);
    float _757 = fma(_737, _627, _749);
    float _759 = fma(_751, _643, _755);
    float _761 = fma(_753, _643, _757);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[148].x, _759);
    float _765 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[148].y, _761);
    float _767 = _763 * _717;
    float _769 = _765 * _719;
    bool _771 = !_539;
    float _789;
    if (!_771)
    {
        float _773 = in.m_54.x;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _777 = _773 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_89);
        float _795 = 1.0 / _793;
        float _797 = _123 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    bool _801 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_799);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _817 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _819 = isnan(_799);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _835 = _799 + _833;
    float _837 = -_811;
    float _839 = _837 + 1.0;
    float _841 = 1.0 / _815;
    float _843 = _827 * _839;
    float _845 = -_827;
    float _847 = _845 + 1.0;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _853 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _831 * _841;
    float _865 = fma(_863, _835, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _867 = _865 * _843;
    float _869 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[115].x, _867);
    float _871 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[116].x, _869);
    float _873 = _871 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _857;
    out.m_56.y = _859;
    out.m_56.z = _861;
    out.m_56.w = _873;
    bool _875 = !_853;
    float _899;
    float _901;
    float _903;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _881 = float(_89);
        float _883 = 1.0 / _881;
        float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = _123 * _883;
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _891 = _889 * _879;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _887;
        _901 = _897;
        _903 = _881;
        _905 = true;
    }
    else
    {
        float _907 = float(_89);
        float _909 = 1.0 / _907;
        float _911 = _123 * _909;
        _899 = _911;
        _901 = _911;
        _903 = _907;
    }
    _905 = false;
    float _913 = _899;
    float _915 = _901;
    float _917 = _903;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _921 = int(_919);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _925 = _913 + _923;
    float _927 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _935 = int(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _949 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _951 = isnan(_915);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = 1.0 / _931;
    float _963 = float(_921);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _965;
    bool _969 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _971 = isnan(_913);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    bool _981 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _983 = isnan(_913);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = 1.0 / _963;
    float _995 = float(uint(_935));
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _999 = ~_935;
    int _1001 = _999 + 1;
    float _1003 = float(_935);
    bool _1005 = _935 == 0;
    float _1007 = 1.0 / _995;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1011 = _123 * _993;
    int _1013 = ~_935;
    int _1015 = _1013 + 1;
    float _1017 = 1.0 / _939;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>(_1007) + (-2);
    float _1027 = trunc(_1011);
    int _1029 = int(_1027);
    float _1031 = 1.0 / _943;
    float _1033 = float(uint(_1029));
    float _1035 = 1.0 / _947;
    float _1037 = as_type<float>(_1025) * _1033;
    float _1039 = in.m_54.x;
    float _1041 = in.m_54.y;
    float _1043 = in.m_54.z;
    float _1045 = in.m_54.w;
    float _1047 = trunc(_1037);
    float _1049 = precise::max(_1047, 0.0);
    uint _1052 = uint(_1049);
    float _1054 = float(_1029);
    int _1056 = _1015 * int(_1052);
    int _1058 = _1056 + _1029;
    float _1060 = float(uint(_1058));
    float _1062 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1064 = !_1023;
    float _1066 = _1064 ? _1041 : _1039;
    float _1068 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[79].z, _997);
    float _1070 = 0.0;
    if (!_1023)
    {
        _1070 = _1043;
    }
    float _1072 = _1070;
    float _1074 = as_type<float>(_1025) * _1060;
    float _1076 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1068);
    float _1078 = _1072;
    if (_1023)
    {
        _1078 = _1041;
    }
    float _1080 = _1078;
    float _1082 = -_979;
    float _1084 = _1082 + 1.0;
    bool _1086 = !_1023;
    float _1088 = _1086 ? 1.2345600128173828125 : 1.0;
    float _1090 = trunc(_1074);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    float _1096 = _1076 * (-0.15915493667125701904296875);
    float _1098 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1100 = _1088 * _1066;
    float _1102 = floor(_1100);
    int _1104 = int(_1052) + int(_1094);
    bool _1106 = _1054 >= _1003;
    bool _1108 = isnan(_1054);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1003);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = _1001 * _1104;
    int _1120 = _1118 + _1029;
    float _1122 = 1.0 / _917;
    float _1124 = -_1102;
    float _1126 = _1100 + _1124;
    bool _1128 = uint(_1120) >= uint(_935);
    float _1130 = trunc(_1116);
    int _1132 = int(_1130);
    bool _1134 = !_1128;
    int _1136 = _1134 ? 0 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1152 = _1150 != 0;
    int _1154 = ~_1104;
    int _1156 = _1154 + _1136;
    int _1158 = _1156 + 1;
    float _1160 = _1126 * _1003;
    float _1162 = _123 * _1003;
    bool _1164 = !_1144;
    int _1166 = _1164 ? 0 : 1;
    int _1168 = _935 * _1158;
    int _1170 = _1168 + _1029;
    float _1172 = _1162 * _1122;
    float _1174 = trunc(_1160);
    int _1176 = int(_1174);
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1180 = _1178 != 0;
    bool _1182 = !_1005;
    int _1184 = _1182 ? _1170 : (-1);
    int _1186 = ~_1132;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = _935 + (-1);
    float _1194 = trunc(_1172);
    int _1196 = int(_1194);
    bool _1198 = !_1180;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = _1184 * _1190;
    int _1204 = abs(_1166);
    bool _1206 = !_1148;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = _1132 * _1192;
    int _1212 = _1210 + _1202;
    bool _1214 = !_1140;
    int _1216 = _1214 ? 0 : 1;
    int _1218 = abs(_1200);
    int _1220 = abs(_1216);
    int _1222 = _1176 * _1218;
    int _1224 = _1222 + _1029;
    bool _1226 = !_1152;
    int _1228 = _1226 ? 0 : 1;
    int _1230 = abs(_1208);
    int _1232 = _1212 * _1204;
    int _1234 = abs(_1228);
    int _1236 = _1196 * _1220;
    int _1238 = _1236 + _1232;
    float _1240 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1242 = _1224 * _1230;
    int _1244 = _1242 + _1238;
    int _1246 = ~_935;
    int _1248 = _1246 + 1;
    int _1250 = _1176 * _1234;
    int _1252 = _1250 + _1244;
    float _1254 = as_type<float>(_1176);
    if (!_1023)
    {
        _1254 = _1041;
    }
    float _1256 = _1254;
    float _1258 = _1256;
    if (_1023)
    {
        _1258 = _1039;
    }
    float _1260 = _1258;
    float _1262 = float(uint(_1252));
    float _1264 = as_type<float>(_1025) * _1262;
    float _1266 = trunc(_1264);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    int _1272 = _1248 * int(_1270);
    int _1274 = _1272 + _1252;
    float _1276 = float(uint(_1274));
    float _1278 = as_type<float>(_1025) * _1276;
    int _1280 = ~_935;
    int _1282 = _1280 + 1;
    float _1284 = trunc(_1278);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = int(_1270) + int(_1288);
    int _1292 = _1282 * _1290;
    int _1294 = _1292 + _1252;
    float _1296 = _1039 * 2.0;
    bool _1298 = uint(_1294) >= uint(_935);
    float _1300 = floor(_1296);
    bool _1302 = !_1298;
    int _1304 = _1302 ? 0 : (-1);
    int _1306 = ~_1290;
    int _1308 = _1306 + _1304;
    int _1310 = _1308 + 1;
    float _1312 = _1041 * 2.0;
    int _1314 = _935 * _1310;
    int _1316 = _1314 + _1252;
    float _1318 = floor(_1312);
    bool _1320 = !_1005;
    int _1322 = _1320 ? _1316 : (-1);
    bool _1324 = _1300 > 0.0;
    int _1326 = _1322 & 3;
    bool _1328 = _1326 != 0;
    int _1330 = _1322 & 3;
    bool _1332 = _1330 != 0;
    int _1334 = _1328 ? 0 : 1;
    bool _1336 = uint(_1330) > 1u;
    bool _1338 = _1300 >= 0.0;
    bool _1340 = isnan(_1300);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan(0.0);
    bool _1346 = _1342 || _1344;
    int _1348 = ~_1334;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1356 = log2(_1354);
    int _1358 = _1346 ? 0 : 1;
    bool _1360 = _1045 > 0.5;
    int _1362 = ~_1358;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    int _1368 = _1366;
    int _1370 = _1352;
    if (!_1324)
    {
        int _1372 = ~_1358;
        int _1374 = _1372 + 1;
        _1368 = _1374;
    }
    int _1376 = _1368;
    float _1378 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_1336)
    {
        int _1380 = ~_1334;
        int _1382 = _1380 + 1;
        _1370 = _1382;
    }
    int _1384 = _1370;
    bool _1386 = _1039 > 0.5;
    float _1388 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1378);
    bool _1390 = _1041 > 0.5;
    float _1392 = -_225;
    int _1394 = _1360 ? as_type<int>(_1392) : as_type<int>(_225);
    bool _1396 = _1318 >= 0.0;
    bool _1398 = isnan(_1318);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    float _1406 = -_221;
    int _1408 = _1386 ? as_type<int>(_1406) : as_type<int>(_221);
    float _1410 = -_225;
    int _1412 = _1390 ? as_type<int>(_1410) : as_type<int>(_225);
    bool _1414 = _1043 > 0.5;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1418 = _1416 != 0;
    int _1420 = _1404 ? 0 : 1;
    bool _1422 = _1318 > 0.0;
    float _1424 = -_221;
    int _1426 = _1414 ? as_type<int>(_1424) : as_type<int>(_221);
    bool _1428 = !_1418;
    float _1430 = _1428 ? _225 : as_type<float>(_1394);
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1438 = _1436 != 0;
    bool _1440 = !_1434;
    float _1442 = _1440 ? _221 : as_type<float>(_1408);
    float _1444 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1446 = !_1438;
    float _1448 = _1446 ? _225 : as_type<float>(_1412);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1452 = _1450 != 0;
    float _1454 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1444);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1458 = _1456 != 0;
    float _1460 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1462 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1454);
    int _1464 = ~_1420;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1460);
    int _1472 = _1468;
    float _1474 = _1444;
    if (!_1422)
    {
        int _1476 = ~_1420;
        int _1478 = _1476 + 1;
        _1472 = _1478;
    }
    int _1480 = _1472;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1486 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1470);
    float _1488 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1388);
    if (!_1023)
    {
        _1474 = _1043;
    }
    float _1490 = _1474;
    float _1492 = 1.0 / _1484;
    float _1494 = _1490;
    if (_1023)
    {
        _1494 = _1041;
    }
    float _1496 = _1494;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1510 = _1508 != 0;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1514 = -_1498;
    float _1516 = fma(_1240, 2.0, _1514);
    float _1518 = fma(_1062, -2.0, _1512);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1522 = _1520 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1526 = _915 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1532;
    float _1536 = _1526 * _961;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1542 = _1043 * 2.0;
    float _1544 = 1.0 / _1530;
    float _1546 = _1540 * _1017;
    float _1548 = _1534 * _1031;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1550;
    bool _1554 = !_1458;
    float _1556 = _1554 ? _221 : as_type<float>(_1426);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1562 = fma(_967, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1564 = 1.0 / _1522;
    float _1566 = _1552 * _1035;
    float _1568 = fma(_1546, _925, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1570 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1572 = isnan(_915);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = _1486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1584 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1586 = isnan(_913);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1462 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1598 = floor(_1542);
    float _1600 = _123 * _1356;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1604 = _1602 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1610 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1612 = isnan(_913);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1618 = _1614 || _1616;
    float _1620 = float(_1618);
    float _1622 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1624 = _1604 * _1492;
    float _1626 = _1041 + _1039;
    float _1628 = exp2(_1600);
    float _1630 = _1626 + (-1.0);
    int _1632 = abs(_1384);
    bool _1634 = _935 == 0;
    float _1636 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1638 = 1.0 / _1560;
    bool _1640 = _1598 >= 0.0;
    bool _1642 = isnan(_1598);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan(0.0);
    bool _1648 = _1644 || _1646;
    int _1650 = _1648 ? 0 : 1;
    bool _1652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1654 = isnan(0.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1660 = _1656 || _1658;
    float _1662 = -_1628;
    float _1664 = _1662 + 1.0;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1674;
    int _1678 = ~_1632;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = _1668 * _1544;
    float _1686 = _1041 + _1043;
    float _1688 = _1672 * _1564;
    float _1690 = fma(_1676, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1692 = _1686 + (-1.0);
    float _1694 = _1660 ? _1664 : 0.0;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1698 = _913 + _1696;
    bool _1700 = _1598 > 0.0;
    float _1702 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1706 = _913 + _1704;
    float _1708 = fma(_1684, _1698, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1712 = _913 + _1710;
    float _1714 = _1608 * _1638;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1716;
    float _1720 = fma(_1566, _1706, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1724 = _913 + _1722;
    float _1726 = fma(_1688, _1712, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1728 = fma(_1718, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1732 = _913 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1736 = _913 + _1734;
    bool _1738 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1740 = isnan(_913);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1746 = _1742 || _1744;
    float _1748 = float(_1746);
    float _1750 = fma(_1714, _1724, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1752 = fma(_1624, _1732, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1754 = fma(_1548, _1736, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1756 = -_1580;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1748;
    float _1762 = _1760 + 1.0;
    bool _1764 = !_1506;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1770 = _959 * _1758;
    float _1772 = _1594 * _1762;
    float _1774 = -_1594;
    float _1776 = _1774 + 1.0;
    float _1778 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1768);
    bool _1780 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1782 = isnan(_913);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = _1690 * _1770;
    float _1794 = _1562 * _1770;
    float _1796 = _1728 * _1770;
    bool _1798 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1800 = isnan(_913);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _1790 * _1776;
    float _1812 = -_1790;
    float _1814 = _1812 + 1.0;
    float _1816 = -_1808;
    float _1818 = _1816 + 1.0;
    bool _1820 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1822 = isnan(_913);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1808 * _1814;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1836 = 1.0 + _1834;
    float _1838 = _1620 * _1818;
    float _1840 = -_1620;
    float _1842 = _1840 + 1.0;
    float _1844 = _1830 * _1084;
    float _1846 = 1.0 / _1836;
    float _1848 = -_1830;
    float _1850 = _1848 + 1.0;
    float _1852 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1009);
    float _1854 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1858 = _991 * _1850;
    float _1860 = -_991;
    float _1862 = _1860 + 1.0;
    float _1864 = -_1019;
    float _1866 = fma(_1854, 2.0, _1864);
    float _1868 = _979 * _1842;
    float _1870 = _1754 * _1858;
    float _1872 = -_959;
    float _1874 = _1872 + 1.0;
    float _1876 = fma(_1098, -2.0, _1856);
    float _1878 = _1096 * 6.283185482025146484375;
    float _1880 = sin(_1878);
    float _1882 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1870);
    float _1884 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1794);
    int _1886 = ~_1650;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    float _1892 = _1694 * _1846;
    float _1894 = fma(_1568, _1844, _1882);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1792);
    float _1898 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1796);
    float _1900 = _1096 * 6.283185482025146484375;
    float _1902 = cos(_1900);
    float _1904 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1884);
    float _1906 = fma(_1720, _1868, _1894);
    float _1908 = float(uint(_1224));
    float _1910 = _1556 + 0.5;
    bool _1912 = !_1502;
    int _1914 = _1912 ? 0 : 1;
    float _1916 = -_123;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1866);
    int _1920 = _1890;
    if (!_1700)
    {
        int _1922 = ~_1650;
        int _1924 = _1922 + 1;
        _1920 = _1924;
    }
    int _1926 = _1920;
    float _1928 = as_type<float>(_1025) * _1908;
    float _1930 = _1448 * _1880;
    int _1932 = abs(_1914);
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1936 = _1582 + _1934;
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1876);
    int _1940 = abs(_1766);
    float _1942 = trunc(_1928);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    bool _1948 = uint(_1330) >= 2u;
    float _1950 = _1448 * _1902;
    float _1952 = -_1930;
    float _1954 = fma(_1442, _1902, _1952);
    float _1956 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1898);
    float _1958 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1960 = fma(_1442, _1880, _1950);
    float _1962 = _1430 + (-0.5);
    float _1964 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1896);
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1968 = _1596 + _1966;
    float _1970 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1918);
    float _1972 = -_1962;
    float _1974 = -_1938;
    float _1976 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1974);
    float _1978 = float(_1940);
    float _1980 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1958);
    int _1982 = _1948 ? 0 : 1;
    float _1984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1986 = float(_1376);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1990 = _1622 + _1988;
    int _1992 = ~_935;
    int _1994 = _1992 + 1;
    bool _1996 = _1330 != 3;
    float _1998 = _1978 * _1986;
    float _2000 = float(_1932);
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2004 = float(_1926);
    int _2006 = _1994 * int(_1946);
    int _2008 = _2006 + _1224;
    int _2010 = ~_1982;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    float _2016 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1980);
    float _2018 = _1998 * (-2.0);
    float _2020 = _2000 * _2004;
    int _2022 = _1322 >> 31;
    float _2024 = float(uint(_2008));
    float _2026 = _2020 * (-2.0);
    int _2028 = _2022 & 3;
    float _2030 = fma(_1702, _2018, _1702);
    int _2032 = _2014;
    if (_1996)
    {
        int _2034 = ~_1982;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    float _2040 = fma(_1752, _1838, _1906);
    int _2042 = _1322 + _2028;
    float _2044 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2046 = as_type<float>(_1025) * _2024;
    float _2048 = -_123;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1516);
    int _2052 = _2042 >> 2;
    float _2054 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1518);
    float _2056 = _1964 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2058 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2060 = _1956 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2062 = _1954 + 0.5;
    float _2064 = _1904 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2066 = _1960 + (-0.5);
    float _2068 = trunc(_2046);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2052 << 4;
    int _2076 = _2074 + 512;
    float _2078 = fma(_2058, _2062, _2050);
    float _2080 = -_2044;
    float _2082 = -_2054;
    float _2084 = fma(_2080, _2066, _2082);
    uint _2086 = uint(int(uint(_2076) >> uint(2)));
    uint _2088 = uint(int(uint(int(_2086)) >> uint(2)));
    int _2090 = int(_2086) & 3;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[int(_2088)][_2090];
    int _2094 = int(_2086) + 1;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    int _2098 = _2094 & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    float _2102 = fma(_1708, _1832, _2040);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2106 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2110 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2114 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1778);
    int _2118 = int(_1946) + int(_2072);
    float _2120 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1852);
    float _2122 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2104);
    out.m_58.x = _2106;
    out.m_58.y = _2110;
    out.m_58.z = _2114;
    out.m_58.w = _2112;
    int _2124 = _2076 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = int(_2126) + 1;
    uint _2136 = uint(int(uint(_2134) >> uint(2)));
    int _2138 = _2134 & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    float _2142 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2108);
    float _2144 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2122);
    float _2146 = in.m_60.x;
    float _2148 = in.m_60.y;
    float _2150 = in.m_60.z;
    float _2152 = fma(_1750, _1810, _2102);
    float _2154 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2142);
    int _2156 = abs(_2038);
    float _2158 = fma(_1636, _2026, _1636);
    bool _2160 = _2016 >= 0.0;
    float _2162 = fma(_1726, _1772, _2152);
    float _2164 = -_2120;
    float _2166 = _2164 + 1.0;
    float _2168 = -_2116;
    float _2170 = _2168 + 1.0;
    float _2172 = -_2144;
    float _2174 = _2172 + 1.0;
    float _2176 = -_2154;
    float _2178 = _2176 + 1.0;
    float _2180 = -_2166;
    float _2182 = fma(_1556, _2180, _1970);
    int _2184 = ~_935;
    int _2186 = _2184 + 1;
    float _2188 = fma(_1430, _2170, _1976);
    bool _2190 = !_1332;
    int _2192 = _2190 ? 0 : 1;
    float _2194 = -_2174;
    float _2196 = fma(_1954, _2194, _2078);
    float _2198 = fma(_1960, _2178, _2084);
    int _2200 = _2186 * _2118;
    int _2202 = _2200 + _1224;
    int _2204 = abs(_2192);
    float _2206 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2162);
    if (_2160)
    {
        out.m_45.x = 0.0;
    }
    float _2208 = fma(_2026, _2146, _2146);
    bool _2210 = uint(_2202) >= uint(_935);
    float _2212 = fma(_2018, _2148, _2148);
    out.m_62.x = _2196;
    out.m_62.y = _2198;
    out.m_62.z = _2182;
    out.m_62.w = _2188;
    bool _2214 = !_2210;
    int _2216 = _2214 ? 0 : (-1);
    int _2218 = _1682 * as_type<int>(_2100);
    bool _2220 = _1330 != 3;
    out.m_64.x = _2206;
    int _2222 = ~_2118;
    int _2224 = _2222 + _2216;
    int _2226 = _2224 + 1;
    bool _2228 = !_2220;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = ~_2204;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = abs(_2230);
    int _2240 = _2236 * as_type<int>(_2092);
    int _2242 = _2240 + _2218;
    bool _2244 = !_1452;
    int _2246 = _2244 ? 0 : 1;
    int _2248 = ~_2156;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = _1936 * _1936;
    int _2256 = abs(_2246);
    float _2258 = fma(_1968, _1968, _2254);
    float _2260 = _1039 + (-0.5);
    int _2262 = _2252 * as_type<int>(_2132);
    int _2264 = _2262 + _2242;
    int _2266 = ~_2238;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    float _2272 = fma(_1990, _1990, _2258);
    float _2274 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2208);
    int _2276 = _935 * _2226;
    int _2278 = _2276 + _1224;
    int _2280 = ~_2256;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = _2270 * as_type<int>(_2140);
    int _2288 = _2286 + _2264;
    float _2290 = _2258;
    float _2292 = _2150;
    if (_2160)
    {
        _2290 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2294 = _2290;
    float _2296 = rsqrt(_2272);
    bool _2298 = !_1634;
    int _2300 = _2298 ? _2278 : (-1);
    int _2302 = _2288 * _2284;
    bool _2304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(1.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    int _2314 = as_type<int>(_2294);
    if (_2160)
    {
        float _2316 = _2294 * 5.0;
        _2314 = as_type<int>(_2316);
    }
    int _2318 = _2314;
    int _2320 = _2300 * _2256;
    int _2322 = _2320 + _2302;
    float _2324 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2326 = !_2312;
    float _2328 = _2326 ? _123 : _1892;
    float _2330 = _1041 + (-0.5);
    bool _2332 = !_1510;
    int _2334 = _2332 ? 0 : 1;
    if (_2160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7083 = as_type<float>(_2318);
        out.gl_Position.z = _7083;
    }
    float _2336 = float(_2322);
    float _2338 = fma(_2328, _2158, _2274);
    int _2340 = abs(_2334);
    float _2342 = _2324 * _2296;
    out.m_66.y = _2336;
    float _2344 = _1968 * _2342;
    float _2346 = _1936 * _2342;
    if (_2160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2348 = -_2346;
    float _2350 = _1582 + _2348;
    float _2352 = _1990 * _2342;
    float _2354 = -_2344;
    float _2356 = _1596 + _2354;
    float _2358 = float(_2340);
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2362 = _2350 + _2360;
    float _2364 = -_2352;
    float _2366 = _1622 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2370 = _2356 + _2368;
    float _2372 = float(_1480);
    float _2374 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2378 = _2366 + _2376;
    float _2380 = _1043 + _1039;
    float _2382 = -_2346;
    float _2384 = _1936 + _2382;
    float _2386 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2374);
    float _2388 = _2358 * _2372;
    float _2390 = _2380 + (-1.0);
    float _2392 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2212);
    float _2394 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2386);
    float _2396 = -_2344;
    float _2398 = _1968 + _2396;
    float _2400 = _2384 * _2384;
    float _2402 = _2388 * (-2.0);
    float _2404 = fma(_2328, _2030, _2392);
    bool _2406 = _2394 >= 0.0;
    float _2408 = fma(_2398, _2398, _2400);
    float _2410 = -_2352;
    float _2412 = _1990 + _2410;
    float _2414 = _1043 + (-0.5);
    float _2416 = _2404 * 0.15915493667125701904296875;
    float _2418 = _2338 * 0.15915493667125701904296875;
    float _2420 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2422 = fma(_2402, _2150, _2150);
    float _2424 = fma(_2412, _2412, _2408);
    float _2426 = _2418 * 6.283185482025146484375;
    float _2428 = sin(_2426);
    float _2430 = fma(_2420, _2402, _2420);
    float _2432 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2422);
    int _2434 = as_type<int>(_2414);
    float _2436 = _2416;
    float _2438 = _2370;
    float _2440 = _2356;
    float _2442 = _2366;
    if (_2406)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2444 = _2292;
    if (_2406)
    {
        out.m_45.x = 0.0;
    }
    float _2446 = fma(_2328, _2430, _2432);
    float _2448 = _2418 * 6.283185482025146484375;
    float _2450 = cos(_2448);
    if (_2406)
    {
        float _2452 = _2444 * 5.0;
        _2434 = as_type<int>(_2452);
    }
    int _2454 = _2434;
    float _2456 = _2446 * 0.15915493667125701904296875;
    if (_2406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7278 = as_type<float>(_2454);
        out.gl_Position.z = _7278;
    }
    float _2458 = _2416 * 6.283185482025146484375;
    float _2460 = sin(_2458);
    float _2462 = sqrt(_2424);
    float _2464 = _2416 * 6.283185482025146484375;
    float _2466 = cos(_2464);
    if (_2406)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2468 = _2456 * 6.283185482025146484375;
    float _2470 = cos(_2468);
    float _2472 = _2296 * _2462;
    float _2474 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2478 = _2450 * _2466;
    float _2480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2482 = _2472 * _2474;
    float _2484 = _927 * _2472;
    float _2486 = _2456 * 6.283185482025146484375;
    float _2488 = sin(_2486);
    float _2490 = _2476 * _2482;
    float _2492 = _2428 * _2460;
    float _2494 = _2470 * _2490;
    float _2496 = _2480 * _2484;
    float _2498 = _2450 * _2460;
    float _2500 = _2428 * _2466;
    float _2502 = _2450 * _2494;
    float _2504 = _2460 * _2470;
    float _2506 = _2466 * _2470;
    float _2508 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2510 = _2508 * 0.5;
    float _2512 = fma(_2488, _2478, _2492);
    float _2514 = -_2490;
    float _2516 = _2488 * _2514;
    float _2518 = _2428 * _2494;
    float _2520 = fma(_2488, _2492, _2478);
    float _2522 = fma(_2512, _2496, _2502);
    float _2524 = -_2500;
    float _2526 = fma(_2488, _2498, _2524);
    float _2528 = -_2498;
    float _2530 = fma(_2488, _2500, _2528);
    float _2532 = fma(_2506, _2496, _2516);
    float _2534 = fma(_2526, _2510, _2522);
    float _2536 = fma(_2530, _2496, _2518);
    float _2538 = fma(_2504, _2510, _2532);
    float _2540 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2542 = fma(_2520, _2510, _2536);
    float _2544 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2546 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2540);
    float _2548 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2544);
    float _2550 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2548);
    float _2554 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2556 = _2552 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2558 = _1622 + _2554;
    float _2560 = _1596 + _2556;
    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2564 = _2558 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2568 = _2560 + _2566;
    float _2570 = _2564 * _2564;
    float _2572 = fma(_2568, _2568, _2570);
    float _2574 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2576 = sqrt(_2572);
    float _2578 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2574);
    float _2580 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2578);
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2584 = _1582 + _2582;
    bool _2586 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2588 = _2582;
    float _2590 = _2560;
    float _2592 = _2500;
    float _2594 = _2564;
    if (!_2586)
    {
        _2588 = _2560;
    }
    float _2596 = _2588;
    float _2598 = _2596;
    if (!_2586)
    {
        _2590 = _2558;
    }
    float _2600 = _2590;
    float _2602 = _2600;
    if (!_2586)
    {
        _2592 = _2584;
    }
    float _2604 = _2592;
    bool _2606 = !_2586;
    float _2608 = _2604;
    if (!_2606)
    {
        float _2610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2614 = _2576 + _2612;
        float _2616 = rsqrt(_2572);
        float _2618 = _2614 * _2610;
        float _2620 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2622 = _2618 * 0.15915493667125701904296875;
        float _2624 = _2622 * 6.283185482025146484375;
        float _2626 = cos(_2624);
        float _2628 = _2622 * 6.283185482025146484375;
        float _2630 = sin(_2628);
        float _2632 = _2626 + (-1.0);
        float _2634 = fma(_2630, _2620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2636 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2638 = _2616 * _2634;
        float _2640 = fma(_2584, _2626, _2636);
        float _2642 = fma(_2568, _2638, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2644 = fma(_2564, _2638, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2608 = _2640;
        _2598 = _2642;
        _2602 = _2644;
    }
    float _2646 = _2608;
    float _2648 = _2598;
    float _2650 = _2602;
    float _2652 = -_1582;
    float _2654 = _2652 + _2646;
    float _2656 = -_1596;
    float _2658 = _2656 + _2648;
    float _2660 = -_1622;
    float _2662 = _2660 + _2650;
    float _2664 = _2654 * _2654;
    float _2666 = fma(_2658, _2658, _2664);
    float _2668 = fma(_2662, _2662, _2666);
    float _2670 = sqrt(_2668);
    bool _2672 = _2670 > 0.0;
    float _2674 = _2670;
    float _2676 = _2650;
    float _2678 = _2646;
    float _2680 = _2654;
    float _2682 = _2668;
    if (!_2672)
    {
        _2674 = _2648;
    }
    float _2684 = _2674;
    bool _2686 = !_2672;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2694 = _2568;
        if (_2692)
        {
            float _2696 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2694 = _2696;
        }
        float _2698 = _2694;
        float _2700 = _2698;
        if (_2692)
        {
            float _2702 = _465 * _2698;
            _2436 = _2702;
        }
        float _2704 = _2436;
        float _2706 = _2704;
        if (_2692)
        {
            float _2708 = _467 * _2698;
            _2594 = _2708;
        }
        float _2710 = _2594;
        float _2712 = _2710;
        if (_2692)
        {
            float _2714 = _469 * _2698;
            _2700 = _2714;
        }
        float _2716 = _2700;
        float _2718 = _2716;
        if (!_2692)
        {
            bool _2720 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2724 = _2720 || _2722;
            bool _2726 = isnan(1.0);
            bool _2728 = _2724 || _2726;
            float _2730 = _123 + 1.0;
            if (!_2728)
            {
                float _2732 = _2730 * _2730;
                float _2734 = _2732 * 0.5;
                _125 = _2734;
            }
            float _2736 = _125;
            float _2738 = _2736;
            if (!_2728)
            {
                float _2740 = _2736 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2738 = _2740;
            }
            float _2742 = _2738;
            bool _2744 = !_2728;
            float _2746 = _2742;
            if (!_2744)
            {
                float _2748 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2750 = log2(_2748);
                float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2754 = 1.0 + _2752;
                float _2756 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2758 = _2750 * _2730;
                float _2760 = 1.0 / _2754;
                float _2762 = _2756 * 0.693147182464599609375;
                float _2764 = exp2(_2758);
                float _2766 = 1.0 / _2762;
                float _2768 = _2764 + (-1.0);
                float _2770 = -_2768;
                float _2772 = fma(_2770, _2766, _2730);
                float _2774 = _2772 * _2760;
                float _2776 = _2774 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2746 = _2776;
            }
            float _2778 = _2746;
            float _2780 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2782 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2784 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2786 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2788 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2790 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2792 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2786);
            float _2794 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2788);
            float _2796 = _2788;
            _2688 = _2784;
            if (!_2728)
            {
                _2796 = _2730;
            }
            float _2798 = _2796;
            float _2800 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2792);
            bool _2802 = !_2728;
            float _2804 = _2798;
            if (!_2802)
            {
                float _2806 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2808 = log2(_2806);
                float _2810 = _2808 * _2730;
                float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2814 = 1.0 + _2812;
                float _2816 = exp2(_2810);
                float _2818 = 1.0 / _2814;
                float _2820 = -_2816;
                float _2822 = _2820 + 1.0;
                float _2824 = _2822 * _2818;
                _2804 = _2824;
            }
            float _2826 = _2804;
            float _2828 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2790);
            float _2830 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2794);
            float _2832 = fma(_2826, _163, _2800);
            float _2834 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2828);
            float _2836 = fma(_2826, _161, _2830);
            float _2838 = -_427;
            float _2840 = _2838 + _2832;
            float _2842 = fma(_2826, _165, _2834);
            float _2844 = -_433;
            float _2846 = _2844 + _2836;
            float _2848 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2850 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2852 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2854 = -_439;
            float _2856 = _2854 + _2842;
            float _2858 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2848);
            float _2860 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2850);
            float _2862 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2852);
            float _2864 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2858);
            float _2866 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2860);
            float _2868 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2862);
            _473 = _2866;
            _475 = _2864;
            _477 = _2868;
            _2706 = _2864;
            _2712 = _2866;
            _2718 = _2868;
        }
        float _2870 = _473;
        float _2872 = _475;
        float _2874 = _477;
        float _2876 = _2706;
        float _2878 = _2712;
        float _2880 = _2718;
        float _2882 = _2688;
        float _2884 = _2870 * _2870;
        float _2886 = rsqrt(_2668);
        float _2888 = fma(_2872, _2872, _2884);
        float _2890 = fma(_2874, _2874, _2888);
        float _2892 = sqrt(_2890);
        float _2894 = _2658 * _2886;
        float _2896 = _2654 * _2886;
        float _2898 = _2662 * _2886;
        bool _2900 = _2892 > 0.0;
        float _2902 = _2882;
        if (!_2900)
        {
            _2902 = _2648;
        }
        float _2904 = _2902;
        bool _2906 = !_2900;
        _2690 = _2904;
        if (!_2906)
        {
            float _2908 = rsqrt(_2890);
            float _2910 = _2908 * _2870;
            float _2912 = _2908 * _2872;
            float _2914 = _2908 * _2874;
            float _2916 = _2896 * _2910;
            float _2918 = fma(_2894, _2912, _2916);
            float _2920 = fma(_2898, _2914, _2918);
            float _2922 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2924 = fma(_2876, _2922, _2648);
            float _2926 = fma(_2878, _2922, _2646);
            float _2928 = fma(_2880, _2922, _2650);
            _2676 = _2928;
            _2690 = _2924;
            _2678 = _2926;
        }
    }
    float _2930 = _2676;
    float _2932 = _2690;
    float _2934 = _2678;
    float _2936 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2938 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2946 = _2942 || _2944;
    float _2948 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2936);
    bool _2950 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2952 = isnan(0.5);
    bool _2954 = _2950 || _2952;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2958 = _2954 || _2956;
    float _2960 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2948);
    float _2962 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2964 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2966 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2962);
    float _2968 = 1.0 / _2964;
    float _2970 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2966);
    float _2972 = _2930;
    if (_2958)
    {
        _2680 = 1.0;
    }
    float _2974 = _2680;
    float _2976 = _2970 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2978 = _2976 + _2964;
    float _2980 = -_2352;
    float _2982 = _2980 + _2930;
    float _2984 = _2978 * _2968;
    float _2986 = _2984 * 0.5;
    float _2988 = -_2344;
    float _2990 = _2988 + _2932;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2994 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2992);
    float _2996 = -_2346;
    float _2998 = _2996 + _2934;
    float _3000 = 1.0 / _2994;
    float _3002 = _2998;
    float _3004 = _2990;
    float _3006 = _2982;
    float _3008 = _2974;
    if (!_2946)
    {
        float _3010 = _2362 * _2362;
        float _3012 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3014 = -_1622;
        float _3016 = _3014 + _2930;
        float _3018 = -_1582;
        float _3020 = _3018 + _2934;
        float _3022 = fma(_2370, _2370, _3010);
        float _3024 = fma(_2378, _2378, _3022);
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3028 = sqrt(_3024);
        float _3030 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3032 = 1.0 / _2472;
        float _3034 = precise::min(_3028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3036 = _3034 * _3026;
        float _3038 = _3036 * _3032;
        float _3040 = -_1596;
        float _3042 = _3040 + _2932;
        float _3044 = _3030 * _3038;
        float _3046 = _3016 * _3038;
        float _3048 = fma(_3042, _3044, _2356);
        float _3050 = fma(_3020, _3044, _2350);
        float _3052 = fma(_3030, _3046, _2366);
        _3002 = _3050;
        _3004 = _3048;
        _3006 = _3052;
        _2438 = _3028;
        _2972 = _3046;
    }
    float _3054 = _3002;
    float _3056 = _3004;
    float _3058 = _3006;
    float _3060 = _2438;
    float _3062 = _2972;
    float _3064 = _3062;
    float _3066 = _3060;
    if (_2958)
    {
        _3064 = 1.0;
    }
    float _3068 = _3064;
    float _3070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3072 = _3000 * _3070;
    float _3074 = _3068;
    if (!_2958)
    {
        float _3076 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3078 = _3076 * 0.15915493667125701904296875;
        float _3080 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3082;
        float _3086 = _3078 * 6.283185482025146484375;
        float _3088 = cos(_3086);
        float _3090 = _3080 * 0.15915493667125701904296875;
        float _3092 = _3078 * 6.283185482025146484375;
        float _3094 = sin(_3092);
        float _3096 = 1.0 / _3088;
        float _3098 = _3090 * 6.283185482025146484375;
        float _3100 = cos(_3098);
        float _3102 = _3094 * _3096;
        float _3104 = _3090 * 6.283185482025146484375;
        float _3106 = sin(_3104);
        float _3108 = _3100 * _3102;
        float _3110 = 1.0 / _3084;
        float _3112 = 1.0 / _3108;
        float _3114 = _3106 * _3112;
        float _3116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3118 = fma(_3072, _3114, _3116);
        float _3120 = _3118 * _3110;
        float _3122 = precise::clamp(_3120, 0.0, 1.0);
        _2440 = _3090;
        _2442 = _3078;
        _3008 = _3122;
    }
    float _3124 = _2440;
    float _3126 = _2442;
    float _3128 = _3008;
    float _3130 = _3124;
    float _3132 = _3126;
    if (!_2958)
    {
        float _3134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3136 = _3134 * 0.15915493667125701904296875;
        float _3138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3140 = _3136 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        float _3144 = _3138 * 0.15915493667125701904296875;
        float _3146 = _3136 * 6.283185482025146484375;
        float _3148 = sin(_3146);
        float _3150 = 1.0 / _3142;
        float _3152 = _3144 * 6.283185482025146484375;
        float _3154 = cos(_3152);
        float _3156 = _3148 * _3150;
        float _3158 = _3144 * 6.283185482025146484375;
        float _3160 = sin(_3158);
        float _3162 = _3154 * _3156;
        float _3164 = 1.0 / _3162;
        float _3166 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3168 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3166;
        float _3170 = 1.0 / _3168;
        float _3172 = _3160 * _3164;
        float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3176 = fma(_3072, _3172, _3174);
        float _3178 = _3176 * _3170;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        float _3182 = -_3180;
        float _3184 = _3182 + 1.0;
        _3130 = _3142;
        _3074 = _3184;
    }
    float _3186 = _3130;
    float _3188 = _3074;
    float _3190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3192 = _3054 + _3190;
    float _3194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3196 = _3056 + _3194;
    float _3198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3200 = _3058 + _3198;
    float _3202 = _3192 * _3192;
    float _3204 = fma(_3196, _3196, _3202);
    float _3206 = fma(_3200, _3200, _3204);
    float _3208 = rsqrt(_3206);
    float _3210 = sqrt(_3206);
    float _3212 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3214 = _3196 * _3212;
    float _3216 = _3200 * _3212;
    float _3218 = _3214 * _3214;
    float _3220 = _3216 * _3216;
    float _3222 = _3218 + _3220;
    float _3224 = sqrt(_3222);
    bool _3226 = _3224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3230 = _3224 + _3228;
    float _3232 = _3200;
    float _3234 = _3208;
    float _3236 = _3230;
    float _3238 = _3212;
    if (_3226)
    {
        float _3240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3232 = _3240;
    }
    float _3242 = _3232;
    if (_3226)
    {
        float _3244 = rsqrt(_3222);
        _3234 = _3244;
    }
    float _3246 = _3234;
    float _3248 = _3246;
    if (_3226)
    {
        float _3250 = _3230 * _3242;
        _3236 = _3250;
    }
    float _3252 = _3236;
    if (_3226)
    {
        float _3254 = _3252 * 0.15915493667125701904296875;
        _3132 = _3254;
    }
    float _3256 = _3132;
    float _3258 = _3242;
    if (_3226)
    {
        float _3260 = _3256 * 6.283185482025146484375;
        float _3262 = sin(_3260);
        _3258 = _3262;
    }
    float _3264 = _3258;
    float _3266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3268 = precise::max(0.0, _3266);
    float _3270 = _3186;
    float _3272 = _3268;
    if (_3226)
    {
        float _3274 = _3256 * 6.283185482025146484375;
        float _3276 = cos(_3274);
        _3270 = _3276;
    }
    float _3278 = _3270;
    float _3280 = -_3212;
    float _3282 = -_3268;
    float _3284 = fma(_3192, _3280, _3282);
    float _3286 = _3284;
    if (_3226)
    {
        float _3288 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3272 = _3288;
    }
    float _3290 = _3272;
    float _3292 = _3264;
    float _3294 = _3290;
    if (_3226)
    {
        float _3296 = fma(_3264, _3290, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3238 = _3296;
    }
    float _3298 = _3238;
    float _3300 = _3298;
    if (!_3226)
    {
        _3292 = _3284;
    }
    float _3302 = _3292;
    float _3304 = _3302;
    if (_3226)
    {
        float _3306 = _3278 + (-1.0);
        _3294 = _3306;
    }
    float _3308 = _3294;
    float _3310 = _3308;
    if (_3226)
    {
        float _3312 = _3246 * _3298;
        _2682 = _3312;
    }
    float _3314 = _2682;
    if (!_3226)
    {
        _3248 = _3214;
    }
    float _3316 = _3248;
    float _3318 = _3316;
    if (_3226)
    {
        float _3320 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3066 = _3320;
    }
    float _3322 = _3066;
    if (_3226)
    {
        float _3324 = _3214 * _3314;
        _3318 = _3324;
    }
    float _3326 = _3318;
    if (!_3226)
    {
        _3310 = _3216;
    }
    float _3328 = _3310;
    float _3330 = _3328;
    if (_3226)
    {
        float _3332 = _3216 * _3314;
        _3330 = _3332;
    }
    float _3334 = _3330;
    if (!_3226)
    {
        _3300 = _3218;
    }
    float _3336 = _3300;
    float _3338 = _3336;
    if (_3226)
    {
        float _3340 = fma(_3284, _3278, _3322);
        _3304 = _3340;
    }
    float _3342 = _3304;
    if (_3226)
    {
        float _3344 = _3326 * _3326;
        _3338 = _3344;
    }
    float _3346 = _3338;
    if (!_3226)
    {
        _3286 = _3220;
    }
    float _3348 = _3286;
    float _3350 = _3348;
    if (_3226)
    {
        float _3352 = _3334 * _3334;
        _3350 = _3352;
    }
    float _3354 = _3350;
    float _3356 = fma(_3342, _3342, _3346);
    float _3358 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3360 = _3356 + _3354;
    float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3364 = fma(_3210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3362);
    float _3366 = precise::clamp(_3364, 0.0, 1.0);
    float _3368 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3358);
    float _3370 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3372 = rsqrt(_3360);
    float _3374 = -_3366;
    float _3376 = _3374 + 1.0;
    float _3378 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3380 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3368);
    float _3382 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3384 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3370);
    float _3386 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3388 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3390 = abs(_3376);
    float _3392 = log2(_3390);
    float _3394 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3382);
    float _3396 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3384);
    float _3398 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3386);
    float _3400 = _3388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3402 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3394);
    float _3404 = _3396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3406 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3398);
    float _3408 = _3372 * _3326;
    float _3410 = -_3400;
    float _3412 = fma(_3410, _3378, 1.0);
    float _3414 = _3402 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3416 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3418 = _3372 * _3342;
    float _3420 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3422 = _3406 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3424 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3416);
    float _3426 = _3372 * _3334;
    float _3428 = -_3420;
    float _3430 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3428);
    float _3432 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3434 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3424);
    float _3436 = log2(_3412);
    float _3438 = -_3426;
    float _3440 = fma(_3438, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3430);
    float _3442 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3444 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3434);
    float _3446 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3448 = fma(_3440, -0.5, 0.5);
    float _3450 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3442);
    float _3452 = fma(_3440, 0.5, 0.5);
    float _3454 = exp2(_3432);
    float _3456 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3446);
    float _3458 = _3418 + 1.0;
    float _3460 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3450);
    float _3462 = fma(_3452, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3464 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3456);
    float _3466 = 1.0 / _3444;
    float _3468 = fma(_3452, _3462, -0.212114393711090087890625);
    float _3470 = _3436 * 0.693147182464599609375;
    float _3472 = fma(_3452, _3468, 1.570728778839111328125);
    float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3476 = sqrt(_3448);
    float _3478 = -_3418;
    float _3480 = fma(_3454, _3458, _3478);
    float _3482 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3484 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3464);
    float _3486 = _3482 * _3466;
    float _3488 = _3484 * _3466;
    float _3490 = fma(_3486, 0.5, 0.5);
    float _3492 = fma(_3488, -0.5, 0.5);
    float _3494 = fma(_3480, 0.5, 0.5);
    float _3496 = _3476 * 0.636619746685028076171875;
    float _3498 = -_3472;
    float _3500 = fma(_3496, _3498, 1.0);
    float3 _8906 = float3(_3490, _3492, _3474);
    float _3502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8906, float3(0.0), isnan(_8906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8906, float3(0.0), isnan(_8906)), level(0.0)).x;
    float3 _8917 = float3(_3490, _3492, _3474);
    float4 _3505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8917, float3(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8917, float3(0.0), isnan(_8917)), level(0.0)).xyzw;
    float _3507 = _3505.x;
    float _3509 = _3505.y;
    float _3511 = _3505.z;
    float _3513 = _3505.w;
    float2 _8934 = float2(_3500, _3494);
    float3 _3517 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8934, float2(0.0), isnan(_8934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8934, float2(0.0), isnan(_8934)), level(0.0)).xyz;
    float _3519 = _3517.x;
    float _3521 = _3517.y;
    float _3523 = _3517.z;
    float _3525 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3527 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3529 = _3128 > 0.0;
    bool _3531 = isnan(_3128);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan(0.0);
    bool _3537 = _3533 || _3535;
    float _3539 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3527);
    float _3541 = exp2(_3525);
    bool _3543 = _3188 <= 0.0;
    bool _3545 = !_3537;
    bool _3547 = _3543 || _3545;
    float _3549 = _3444 * 0.5;
    float _3551 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3539);
    float _3553 = _3482 + _3444;
    float _3555 = fma(_3484, -0.5, _3549);
    float _3557 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3551);
    float _3559 = _3553 * 0.5;
    float _3561 = _3128 * _3188;
    float _3563 = _3557 + _3444;
    out.gl_Position.x = _3482;
    out.gl_Position.y = _3484;
    out.gl_Position.z = _3557;
    out.gl_Position.w = _3444;
    float _3565 = _3561 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3567 = _3563 * 0.5;
    float _3569 = -_3541;
    float _3571 = _3569 + 1.0;
    float _3573 = _3565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3575 = _3571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3559;
    out.m_68.y = _3555;
    out.m_68.z = _3567;
    out.m_68.w = _3444;
    out.m_45.x = _3573;
    float _3577 = _3575 * _3502;
    float _3579 = -_3575;
    float _3581 = _3579 + 1.0;
    float _3583 = _3513 * _3577;
    float _3585 = _3523 * _3577;
    float _3587 = _3513 * _3581;
    float _3589 = fma(_3519, _3583, _3507);
    float _3591 = fma(_3521, _3583, _3509);
    float _3593 = fma(_3513, _3585, _3511);
    out.m_70.x = _3589;
    out.m_70.y = _3591;
    out.m_70.z = _3593;
    out.m_70.w = _3587;
    if (!_3547)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3595 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3595;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _905 = false;
    bool _791 = false;
    bool _497 = false;
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
        float _3652 = as_type<float>(_105);
        out.gl_Position.z = _3652;
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
        float _3722 = as_type<float>(_143);
        out.gl_Position.z = _3722;
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
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _307 = _297;
    if (!_159)
    {
        float _309 = _123 * _123;
        float _311 = _309 * 0.5;
        _273 = _311;
    }
    float _313 = _273;
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _319 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _321 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _323 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _323;
    }
    float _325 = _275;
    bool _327 = !_159;
    float _329 = _325;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = _123 * _333;
        float _343 = 1.0 / _337;
        float _345 = _339 * 0.693147182464599609375;
        float _347 = exp2(_341);
        float _349 = 1.0 / _345;
        float _351 = _347 + (-1.0);
        float _353 = -_351;
        float _355 = fma(_353, _349, _123);
        float _357 = _355 * _343;
        float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _359;
    }
    float _361 = _329;
    float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].y, _317);
    float _367 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].x, _315);
    float _369 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _375 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _377 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].z, _319);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].x, _373);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].z, _375);
    float _387 = fma(_297, _161, _367);
    float _389 = fma(_297, _163, _365);
    float _391 = fma(_297, _165, _377);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].x, _383);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].z, _385);
    if (!_159)
    {
        _307 = _123;
    }
    float _399 = _307;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _431 = fma(_389, _149, _169);
    float _433 = fma(_425, _161, _395);
    float _435 = -_427;
    float _437 = _389 + _435;
    float _439 = fma(_425, _165, _397);
    float _441 = fma(_387, _149, _167);
    float _443 = -_433;
    float _445 = _387 + _443;
    float _447 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _451 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _453 = -_439;
    float _455 = _391 + _453;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _449);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
    float _463 = fma(_391, _149, _171);
    float _465 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].z, _459);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
    bool _471 = !_429;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _509 = _505 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _527 = 1.0 / _513;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _529;
    float _533 = 1.0 / _517;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = _505 + _535;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _541 = 1.0 / _521;
    float _543 = _537 * _527;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _547 = _505 + _545;
    float _549 = 1.0 / _531;
    float _551 = _509 * _533;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _555 = _505 + _553;
    bool _557 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _559 = isnan(_505);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _571 = _505 + _569;
    float _573 = 1.0 / _525;
    float _575 = _547 * _541;
    bool _577 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _579 = isnan(_505);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _591 = isnan(_505);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _555 * _549;
    float _603 = -_567;
    float _605 = _603 + 1.0;
    float _607 = -_587;
    float _609 = _607 + 1.0;
    bool _611 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_505);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -_599;
    float _625 = _623 + 1.0;
    float _627 = _599 * _609;
    bool _629 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _631 = isnan(_505);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _571 * _573;
    float _643 = _587 * _605;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _649;
    bool _653 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _655 = isnan(_505);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _621 * _625;
    float _667 = fma(_647, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _669 = fma(_651, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _671 = -_621;
    float _673 = _671 + 1.0;
    float _675 = -_639;
    float _677 = _675 + 1.0;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = _639 * _673;
    float _689 = _663 * _677;
    float _691 = fma(_681, _551, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _693;
    float _697 = -_663;
    float _699 = _697 + 1.0;
    float _701 = _667 * _689;
    float _703 = _669 * _689;
    float _705 = fma(_695, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = fma(_685, _551, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _711;
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _717 = in.m_52.x;
    float _719 = in.m_52.y;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _725 = fma(_713, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _731 = fma(_691, _687, _709);
    float _733 = fma(_707, _687, _715);
    float _735 = fma(_723, _641, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _737 = fma(_729, _641, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _743;
    float _747 = fma(_705, _665, _731);
    float _749 = fma(_725, _665, _733);
    float _751 = fma(_741, _601, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _753 = fma(_745, _601, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _755 = fma(_735, _627, _747);
    float _757 = fma(_737, _627, _749);
    float _759 = fma(_751, _643, _755);
    float _761 = fma(_753, _643, _757);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[148].x, _759);
    float _765 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[148].y, _761);
    float _767 = _763 * _717;
    float _769 = _765 * _719;
    bool _771 = !_539;
    float _789;
    if (!_771)
    {
        float _773 = in.m_54.x;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _777 = _773 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_89);
        float _795 = 1.0 / _793;
        float _797 = _123 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    bool _801 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_799);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _817 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _819 = isnan(_799);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _835 = _799 + _833;
    float _837 = -_811;
    float _839 = _837 + 1.0;
    float _841 = 1.0 / _815;
    float _843 = _827 * _839;
    float _845 = -_827;
    float _847 = _845 + 1.0;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _853 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _831 * _841;
    float _865 = fma(_863, _835, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _867 = _865 * _843;
    float _869 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[115].x, _867);
    float _871 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[116].x, _869);
    float _873 = _871 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _857;
    out.m_56.y = _859;
    out.m_56.z = _861;
    out.m_56.w = _873;
    bool _875 = !_853;
    float _899;
    float _901;
    float _903;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _881 = float(_89);
        float _883 = 1.0 / _881;
        float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = _123 * _883;
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _891 = _889 * _879;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _887;
        _901 = _897;
        _903 = _881;
        _905 = true;
    }
    else
    {
        float _907 = float(_89);
        float _909 = 1.0 / _907;
        float _911 = _123 * _909;
        _899 = _911;
        _901 = _911;
        _903 = _907;
    }
    _905 = false;
    float _913 = _899;
    float _915 = _901;
    float _917 = _903;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _921 = int(_919);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _925 = _913 + _923;
    float _927 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _935 = int(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _949 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _951 = isnan(_915);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = 1.0 / _931;
    float _963 = float(_921);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _965;
    bool _969 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _971 = isnan(_913);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    bool _981 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _983 = isnan(_913);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = 1.0 / _963;
    float _995 = float(uint(_935));
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _999 = ~_935;
    int _1001 = _999 + 1;
    float _1003 = float(_935);
    bool _1005 = _935 == 0;
    float _1007 = 1.0 / _995;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1011 = _123 * _993;
    int _1013 = ~_935;
    int _1015 = _1013 + 1;
    float _1017 = 1.0 / _939;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>(_1007) + (-2);
    float _1027 = trunc(_1011);
    int _1029 = int(_1027);
    float _1031 = 1.0 / _943;
    float _1033 = float(uint(_1029));
    float _1035 = 1.0 / _947;
    float _1037 = as_type<float>(_1025) * _1033;
    float _1039 = in.m_54.x;
    float _1041 = in.m_54.y;
    float _1043 = in.m_54.z;
    float _1045 = in.m_54.w;
    float _1047 = trunc(_1037);
    float _1049 = precise::max(_1047, 0.0);
    uint _1052 = uint(_1049);
    float _1054 = float(_1029);
    int _1056 = _1015 * int(_1052);
    int _1058 = _1056 + _1029;
    float _1060 = float(uint(_1058));
    float _1062 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1064 = !_1023;
    float _1066 = _1064 ? _1041 : _1039;
    float _1068 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[79].z, _997);
    float _1070 = 0.0;
    if (!_1023)
    {
        _1070 = _1043;
    }
    float _1072 = _1070;
    float _1074 = as_type<float>(_1025) * _1060;
    float _1076 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1068);
    float _1078 = _1072;
    if (_1023)
    {
        _1078 = _1041;
    }
    float _1080 = _1078;
    float _1082 = -_979;
    float _1084 = _1082 + 1.0;
    bool _1086 = !_1023;
    float _1088 = _1086 ? 1.2345600128173828125 : 1.0;
    float _1090 = trunc(_1074);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    float _1096 = _1076 * (-0.15915493667125701904296875);
    float _1098 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1100 = _1088 * _1066;
    float _1102 = floor(_1100);
    int _1104 = int(_1052) + int(_1094);
    bool _1106 = _1054 >= _1003;
    bool _1108 = isnan(_1054);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1003);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = _1001 * _1104;
    int _1120 = _1118 + _1029;
    float _1122 = 1.0 / _917;
    float _1124 = -_1102;
    float _1126 = _1100 + _1124;
    bool _1128 = uint(_1120) >= uint(_935);
    float _1130 = trunc(_1116);
    int _1132 = int(_1130);
    bool _1134 = !_1128;
    int _1136 = _1134 ? 0 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1152 = _1150 != 0;
    int _1154 = ~_1104;
    int _1156 = _1154 + _1136;
    int _1158 = _1156 + 1;
    float _1160 = _1126 * _1003;
    float _1162 = _123 * _1003;
    bool _1164 = !_1144;
    int _1166 = _1164 ? 0 : 1;
    int _1168 = _935 * _1158;
    int _1170 = _1168 + _1029;
    float _1172 = _1162 * _1122;
    float _1174 = trunc(_1160);
    int _1176 = int(_1174);
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1180 = _1178 != 0;
    bool _1182 = !_1005;
    int _1184 = _1182 ? _1170 : (-1);
    int _1186 = ~_1132;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = _935 + (-1);
    float _1194 = trunc(_1172);
    int _1196 = int(_1194);
    bool _1198 = !_1180;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = _1184 * _1190;
    int _1204 = abs(_1166);
    bool _1206 = !_1148;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = _1132 * _1192;
    int _1212 = _1210 + _1202;
    bool _1214 = !_1140;
    int _1216 = _1214 ? 0 : 1;
    int _1218 = abs(_1200);
    int _1220 = abs(_1216);
    int _1222 = _1176 * _1218;
    int _1224 = _1222 + _1029;
    bool _1226 = !_1152;
    int _1228 = _1226 ? 0 : 1;
    int _1230 = abs(_1208);
    int _1232 = _1212 * _1204;
    int _1234 = abs(_1228);
    int _1236 = _1196 * _1220;
    int _1238 = _1236 + _1232;
    float _1240 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1242 = _1224 * _1230;
    int _1244 = _1242 + _1238;
    int _1246 = ~_935;
    int _1248 = _1246 + 1;
    int _1250 = _1176 * _1234;
    int _1252 = _1250 + _1244;
    float _1254 = as_type<float>(_1176);
    if (!_1023)
    {
        _1254 = _1041;
    }
    float _1256 = _1254;
    float _1258 = _1256;
    if (_1023)
    {
        _1258 = _1039;
    }
    float _1260 = _1258;
    float _1262 = float(uint(_1252));
    float _1264 = as_type<float>(_1025) * _1262;
    float _1266 = trunc(_1264);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    int _1272 = _1248 * int(_1270);
    int _1274 = _1272 + _1252;
    float _1276 = float(uint(_1274));
    float _1278 = as_type<float>(_1025) * _1276;
    int _1280 = ~_935;
    int _1282 = _1280 + 1;
    float _1284 = trunc(_1278);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = int(_1270) + int(_1288);
    int _1292 = _1282 * _1290;
    int _1294 = _1292 + _1252;
    float _1296 = _1039 * 2.0;
    bool _1298 = uint(_1294) >= uint(_935);
    float _1300 = floor(_1296);
    bool _1302 = !_1298;
    int _1304 = _1302 ? 0 : (-1);
    int _1306 = ~_1290;
    int _1308 = _1306 + _1304;
    int _1310 = _1308 + 1;
    float _1312 = _1041 * 2.0;
    int _1314 = _935 * _1310;
    int _1316 = _1314 + _1252;
    float _1318 = floor(_1312);
    bool _1320 = !_1005;
    int _1322 = _1320 ? _1316 : (-1);
    bool _1324 = _1300 > 0.0;
    int _1326 = _1322 & 3;
    bool _1328 = _1326 != 0;
    int _1330 = _1322 & 3;
    bool _1332 = _1330 != 0;
    int _1334 = _1328 ? 0 : 1;
    bool _1336 = uint(_1330) > 1u;
    bool _1338 = _1300 >= 0.0;
    bool _1340 = isnan(_1300);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan(0.0);
    bool _1346 = _1342 || _1344;
    int _1348 = ~_1334;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1356 = log2(_1354);
    int _1358 = _1346 ? 0 : 1;
    bool _1360 = _1045 > 0.5;
    int _1362 = ~_1358;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    int _1368 = _1366;
    int _1370 = _1352;
    if (!_1324)
    {
        int _1372 = ~_1358;
        int _1374 = _1372 + 1;
        _1368 = _1374;
    }
    int _1376 = _1368;
    float _1378 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_1336)
    {
        int _1380 = ~_1334;
        int _1382 = _1380 + 1;
        _1370 = _1382;
    }
    int _1384 = _1370;
    bool _1386 = _1039 > 0.5;
    float _1388 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1378);
    bool _1390 = _1041 > 0.5;
    float _1392 = -_225;
    int _1394 = _1360 ? as_type<int>(_1392) : as_type<int>(_225);
    bool _1396 = _1318 >= 0.0;
    bool _1398 = isnan(_1318);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    float _1406 = -_221;
    int _1408 = _1386 ? as_type<int>(_1406) : as_type<int>(_221);
    float _1410 = -_225;
    int _1412 = _1390 ? as_type<int>(_1410) : as_type<int>(_225);
    bool _1414 = _1043 > 0.5;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1418 = _1416 != 0;
    int _1420 = _1404 ? 0 : 1;
    bool _1422 = _1318 > 0.0;
    float _1424 = -_221;
    int _1426 = _1414 ? as_type<int>(_1424) : as_type<int>(_221);
    bool _1428 = !_1418;
    float _1430 = _1428 ? _225 : as_type<float>(_1394);
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1438 = _1436 != 0;
    bool _1440 = !_1434;
    float _1442 = _1440 ? _221 : as_type<float>(_1408);
    float _1444 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1446 = !_1438;
    float _1448 = _1446 ? _225 : as_type<float>(_1412);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1452 = _1450 != 0;
    float _1454 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1444);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1458 = _1456 != 0;
    float _1460 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1462 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1454);
    int _1464 = ~_1420;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1460);
    int _1472 = _1468;
    float _1474 = _1444;
    if (!_1422)
    {
        int _1476 = ~_1420;
        int _1478 = _1476 + 1;
        _1472 = _1478;
    }
    int _1480 = _1472;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1486 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1470);
    float _1488 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1388);
    if (!_1023)
    {
        _1474 = _1043;
    }
    float _1490 = _1474;
    float _1492 = 1.0 / _1484;
    float _1494 = _1490;
    if (_1023)
    {
        _1494 = _1041;
    }
    float _1496 = _1494;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1510 = _1508 != 0;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1514 = -_1498;
    float _1516 = fma(_1240, 2.0, _1514);
    float _1518 = fma(_1062, -2.0, _1512);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1522 = _1520 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1526 = _915 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1532;
    float _1536 = _1526 * _961;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1542 = _1043 * 2.0;
    float _1544 = 1.0 / _1530;
    float _1546 = _1540 * _1017;
    float _1548 = _1534 * _1031;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1550;
    bool _1554 = !_1458;
    float _1556 = _1554 ? _221 : as_type<float>(_1426);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1562 = fma(_967, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1564 = 1.0 / _1522;
    float _1566 = _1552 * _1035;
    float _1568 = fma(_1546, _925, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1570 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1572 = isnan(_915);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = _1486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1584 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1586 = isnan(_913);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1462 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1598 = floor(_1542);
    float _1600 = _123 * _1356;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1604 = _1602 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1610 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1612 = isnan(_913);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1618 = _1614 || _1616;
    float _1620 = float(_1618);
    float _1622 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1624 = _1604 * _1492;
    float _1626 = _1041 + _1039;
    float _1628 = exp2(_1600);
    float _1630 = _1626 + (-1.0);
    int _1632 = abs(_1384);
    bool _1634 = _935 == 0;
    float _1636 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1638 = 1.0 / _1560;
    bool _1640 = _1598 >= 0.0;
    bool _1642 = isnan(_1598);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan(0.0);
    bool _1648 = _1644 || _1646;
    int _1650 = _1648 ? 0 : 1;
    bool _1652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1654 = isnan(0.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1660 = _1656 || _1658;
    float _1662 = -_1628;
    float _1664 = _1662 + 1.0;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1674;
    int _1678 = ~_1632;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = _1668 * _1544;
    float _1686 = _1041 + _1043;
    float _1688 = _1672 * _1564;
    float _1690 = fma(_1676, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1692 = _1686 + (-1.0);
    float _1694 = _1660 ? _1664 : 0.0;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1698 = _913 + _1696;
    bool _1700 = _1598 > 0.0;
    float _1702 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1706 = _913 + _1704;
    float _1708 = fma(_1684, _1698, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1712 = _913 + _1710;
    float _1714 = _1608 * _1638;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1716;
    float _1720 = fma(_1566, _1706, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1724 = _913 + _1722;
    float _1726 = fma(_1688, _1712, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1728 = fma(_1718, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1732 = _913 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1736 = _913 + _1734;
    bool _1738 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1740 = isnan(_913);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1746 = _1742 || _1744;
    float _1748 = float(_1746);
    float _1750 = fma(_1714, _1724, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1752 = fma(_1624, _1732, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1754 = fma(_1548, _1736, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1756 = -_1580;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1748;
    float _1762 = _1760 + 1.0;
    bool _1764 = !_1506;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1770 = _959 * _1758;
    float _1772 = _1594 * _1762;
    float _1774 = -_1594;
    float _1776 = _1774 + 1.0;
    float _1778 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1768);
    bool _1780 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1782 = isnan(_913);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = _1690 * _1770;
    float _1794 = _1562 * _1770;
    float _1796 = _1728 * _1770;
    bool _1798 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1800 = isnan(_913);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _1790 * _1776;
    float _1812 = -_1790;
    float _1814 = _1812 + 1.0;
    float _1816 = -_1808;
    float _1818 = _1816 + 1.0;
    bool _1820 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1822 = isnan(_913);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1808 * _1814;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1836 = 1.0 + _1834;
    float _1838 = _1620 * _1818;
    float _1840 = -_1620;
    float _1842 = _1840 + 1.0;
    float _1844 = _1830 * _1084;
    float _1846 = 1.0 / _1836;
    float _1848 = -_1830;
    float _1850 = _1848 + 1.0;
    float _1852 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1009);
    float _1854 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1858 = _991 * _1850;
    float _1860 = -_991;
    float _1862 = _1860 + 1.0;
    float _1864 = -_1019;
    float _1866 = fma(_1854, 2.0, _1864);
    float _1868 = _979 * _1842;
    float _1870 = _1754 * _1858;
    float _1872 = -_959;
    float _1874 = _1872 + 1.0;
    float _1876 = fma(_1098, -2.0, _1856);
    float _1878 = _1096 * 6.283185482025146484375;
    float _1880 = sin(_1878);
    float _1882 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1870);
    float _1884 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1794);
    int _1886 = ~_1650;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    float _1892 = _1694 * _1846;
    float _1894 = fma(_1568, _1844, _1882);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1792);
    float _1898 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1796);
    float _1900 = _1096 * 6.283185482025146484375;
    float _1902 = cos(_1900);
    float _1904 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1884);
    float _1906 = fma(_1720, _1868, _1894);
    float _1908 = float(uint(_1224));
    float _1910 = _1556 + 0.5;
    bool _1912 = !_1502;
    int _1914 = _1912 ? 0 : 1;
    float _1916 = -_123;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1866);
    int _1920 = _1890;
    if (!_1700)
    {
        int _1922 = ~_1650;
        int _1924 = _1922 + 1;
        _1920 = _1924;
    }
    int _1926 = _1920;
    float _1928 = as_type<float>(_1025) * _1908;
    float _1930 = _1448 * _1880;
    int _1932 = abs(_1914);
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1936 = _1582 + _1934;
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1876);
    int _1940 = abs(_1766);
    float _1942 = trunc(_1928);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    bool _1948 = uint(_1330) >= 2u;
    float _1950 = _1448 * _1902;
    float _1952 = -_1930;
    float _1954 = fma(_1442, _1902, _1952);
    float _1956 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1898);
    float _1958 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1960 = fma(_1442, _1880, _1950);
    float _1962 = _1430 + (-0.5);
    float _1964 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1896);
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1968 = _1596 + _1966;
    float _1970 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1918);
    float _1972 = -_1962;
    float _1974 = -_1938;
    float _1976 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1974);
    float _1978 = float(_1940);
    float _1980 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1958);
    int _1982 = _1948 ? 0 : 1;
    float _1984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1986 = float(_1376);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1990 = _1622 + _1988;
    int _1992 = ~_935;
    int _1994 = _1992 + 1;
    bool _1996 = _1330 != 3;
    float _1998 = _1978 * _1986;
    float _2000 = float(_1932);
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2004 = float(_1926);
    int _2006 = _1994 * int(_1946);
    int _2008 = _2006 + _1224;
    int _2010 = ~_1982;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    float _2016 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1980);
    float _2018 = _1998 * (-2.0);
    float _2020 = _2000 * _2004;
    int _2022 = _1322 >> 31;
    float _2024 = float(uint(_2008));
    float _2026 = _2020 * (-2.0);
    int _2028 = _2022 & 3;
    float _2030 = fma(_1702, _2018, _1702);
    int _2032 = _2014;
    if (_1996)
    {
        int _2034 = ~_1982;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    float _2040 = fma(_1752, _1838, _1906);
    int _2042 = _1322 + _2028;
    float _2044 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2046 = as_type<float>(_1025) * _2024;
    float _2048 = -_123;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1516);
    int _2052 = _2042 >> 2;
    float _2054 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1518);
    float _2056 = _1964 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2058 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2060 = _1956 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2062 = _1954 + 0.5;
    float _2064 = _1904 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2066 = _1960 + (-0.5);
    float _2068 = trunc(_2046);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2052 << 4;
    int _2076 = _2074 + 512;
    float _2078 = fma(_2058, _2062, _2050);
    float _2080 = -_2044;
    float _2082 = -_2054;
    float _2084 = fma(_2080, _2066, _2082);
    uint _2086 = uint(int(uint(_2076) >> uint(2)));
    uint _2088 = uint(int(uint(int(_2086)) >> uint(2)));
    int _2090 = int(_2086) & 3;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[int(_2088)][_2090];
    int _2094 = int(_2086) + 1;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    int _2098 = _2094 & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    float _2102 = fma(_1708, _1832, _2040);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2106 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2110 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2114 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1778);
    int _2118 = int(_1946) + int(_2072);
    float _2120 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1852);
    float _2122 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2104);
    out.m_58.x = _2106;
    out.m_58.y = _2110;
    out.m_58.z = _2114;
    out.m_58.w = _2112;
    int _2124 = _2076 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = int(_2126) + 1;
    uint _2136 = uint(int(uint(_2134) >> uint(2)));
    int _2138 = _2134 & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    float _2142 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2108);
    float _2144 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2122);
    float _2146 = in.m_60.x;
    float _2148 = in.m_60.y;
    float _2150 = in.m_60.z;
    float _2152 = fma(_1750, _1810, _2102);
    float _2154 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2142);
    int _2156 = abs(_2038);
    float _2158 = fma(_1636, _2026, _1636);
    bool _2160 = _2016 >= 0.0;
    float _2162 = fma(_1726, _1772, _2152);
    float _2164 = -_2120;
    float _2166 = _2164 + 1.0;
    float _2168 = -_2116;
    float _2170 = _2168 + 1.0;
    float _2172 = -_2144;
    float _2174 = _2172 + 1.0;
    float _2176 = -_2154;
    float _2178 = _2176 + 1.0;
    float _2180 = -_2166;
    float _2182 = fma(_1556, _2180, _1970);
    int _2184 = ~_935;
    int _2186 = _2184 + 1;
    float _2188 = fma(_1430, _2170, _1976);
    bool _2190 = !_1332;
    int _2192 = _2190 ? 0 : 1;
    float _2194 = -_2174;
    float _2196 = fma(_1954, _2194, _2078);
    float _2198 = fma(_1960, _2178, _2084);
    int _2200 = _2186 * _2118;
    int _2202 = _2200 + _1224;
    int _2204 = abs(_2192);
    float _2206 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2162);
    if (_2160)
    {
        out.m_45.x = 0.0;
    }
    float _2208 = fma(_2026, _2146, _2146);
    bool _2210 = uint(_2202) >= uint(_935);
    float _2212 = fma(_2018, _2148, _2148);
    out.m_62.x = _2196;
    out.m_62.y = _2198;
    out.m_62.z = _2182;
    out.m_62.w = _2188;
    bool _2214 = !_2210;
    int _2216 = _2214 ? 0 : (-1);
    int _2218 = _1682 * as_type<int>(_2100);
    bool _2220 = _1330 != 3;
    out.m_64.x = _2206;
    int _2222 = ~_2118;
    int _2224 = _2222 + _2216;
    int _2226 = _2224 + 1;
    bool _2228 = !_2220;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = ~_2204;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = abs(_2230);
    int _2240 = _2236 * as_type<int>(_2092);
    int _2242 = _2240 + _2218;
    bool _2244 = !_1452;
    int _2246 = _2244 ? 0 : 1;
    int _2248 = ~_2156;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = _1936 * _1936;
    int _2256 = abs(_2246);
    float _2258 = fma(_1968, _1968, _2254);
    float _2260 = _1039 + (-0.5);
    int _2262 = _2252 * as_type<int>(_2132);
    int _2264 = _2262 + _2242;
    int _2266 = ~_2238;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    float _2272 = fma(_1990, _1990, _2258);
    float _2274 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2208);
    int _2276 = _935 * _2226;
    int _2278 = _2276 + _1224;
    int _2280 = ~_2256;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = _2270 * as_type<int>(_2140);
    int _2288 = _2286 + _2264;
    float _2290 = _2258;
    float _2292 = _2150;
    if (_2160)
    {
        _2290 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2294 = _2290;
    float _2296 = rsqrt(_2272);
    bool _2298 = !_1634;
    int _2300 = _2298 ? _2278 : (-1);
    int _2302 = _2288 * _2284;
    bool _2304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(1.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    int _2314 = as_type<int>(_2294);
    if (_2160)
    {
        float _2316 = _2294 * 5.0;
        _2314 = as_type<int>(_2316);
    }
    int _2318 = _2314;
    int _2320 = _2300 * _2256;
    int _2322 = _2320 + _2302;
    float _2324 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2326 = !_2312;
    float _2328 = _2326 ? _123 : _1892;
    float _2330 = _1041 + (-0.5);
    bool _2332 = !_1510;
    int _2334 = _2332 ? 0 : 1;
    if (_2160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7083 = as_type<float>(_2318);
        out.gl_Position.z = _7083;
    }
    float _2336 = float(_2322);
    float _2338 = fma(_2328, _2158, _2274);
    int _2340 = abs(_2334);
    float _2342 = _2324 * _2296;
    out.m_66.y = _2336;
    float _2344 = _1968 * _2342;
    float _2346 = _1936 * _2342;
    if (_2160)
    {
        return out;
    }
    float _2348 = -_2346;
    float _2350 = _1582 + _2348;
    float _2352 = _1990 * _2342;
    float _2354 = -_2344;
    float _2356 = _1596 + _2354;
    float _2358 = float(_2340);
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2362 = _2350 + _2360;
    float _2364 = -_2352;
    float _2366 = _1622 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2370 = _2356 + _2368;
    float _2372 = float(_1480);
    float _2374 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2378 = _2366 + _2376;
    float _2380 = _1043 + _1039;
    float _2382 = -_2346;
    float _2384 = _1936 + _2382;
    float _2386 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2374);
    float _2388 = _2358 * _2372;
    float _2390 = _2380 + (-1.0);
    float _2392 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2212);
    float _2394 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2386);
    float _2396 = -_2344;
    float _2398 = _1968 + _2396;
    float _2400 = _2384 * _2384;
    float _2402 = _2388 * (-2.0);
    float _2404 = fma(_2328, _2030, _2392);
    bool _2406 = _2394 >= 0.0;
    float _2408 = fma(_2398, _2398, _2400);
    float _2410 = -_2352;
    float _2412 = _1990 + _2410;
    float _2414 = _1043 + (-0.5);
    float _2416 = _2404 * 0.15915493667125701904296875;
    float _2418 = _2338 * 0.15915493667125701904296875;
    float _2420 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2422 = fma(_2402, _2150, _2150);
    float _2424 = fma(_2412, _2412, _2408);
    float _2426 = _2418 * 6.283185482025146484375;
    float _2428 = sin(_2426);
    float _2430 = fma(_2420, _2402, _2420);
    float _2432 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2422);
    int _2434 = as_type<int>(_2414);
    float _2436 = _2416;
    float _2438 = _2370;
    float _2440 = _2356;
    float _2442 = _2366;
    if (_2406)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2444 = _2292;
    if (_2406)
    {
        out.m_45.x = 0.0;
    }
    float _2446 = fma(_2328, _2430, _2432);
    float _2448 = _2418 * 6.283185482025146484375;
    float _2450 = cos(_2448);
    if (_2406)
    {
        float _2452 = _2444 * 5.0;
        _2434 = as_type<int>(_2452);
    }
    int _2454 = _2434;
    float _2456 = _2446 * 0.15915493667125701904296875;
    if (_2406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7278 = as_type<float>(_2454);
        out.gl_Position.z = _7278;
    }
    float _2458 = _2416 * 6.283185482025146484375;
    float _2460 = sin(_2458);
    float _2462 = sqrt(_2424);
    float _2464 = _2416 * 6.283185482025146484375;
    float _2466 = cos(_2464);
    if (_2406)
    {
        return out;
    }
    float _2468 = _2456 * 6.283185482025146484375;
    float _2470 = cos(_2468);
    float _2472 = _2296 * _2462;
    float _2474 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2478 = _2450 * _2466;
    float _2480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2482 = _2472 * _2474;
    float _2484 = _927 * _2472;
    float _2486 = _2456 * 6.283185482025146484375;
    float _2488 = sin(_2486);
    float _2490 = _2476 * _2482;
    float _2492 = _2428 * _2460;
    float _2494 = _2470 * _2490;
    float _2496 = _2480 * _2484;
    float _2498 = _2450 * _2460;
    float _2500 = _2428 * _2466;
    float _2502 = _2450 * _2494;
    float _2504 = _2460 * _2470;
    float _2506 = _2466 * _2470;
    float _2508 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2510 = _2508 * 0.5;
    float _2512 = fma(_2488, _2478, _2492);
    float _2514 = -_2490;
    float _2516 = _2488 * _2514;
    float _2518 = _2428 * _2494;
    float _2520 = fma(_2488, _2492, _2478);
    float _2522 = fma(_2512, _2496, _2502);
    float _2524 = -_2500;
    float _2526 = fma(_2488, _2498, _2524);
    float _2528 = -_2498;
    float _2530 = fma(_2488, _2500, _2528);
    float _2532 = fma(_2506, _2496, _2516);
    float _2534 = fma(_2526, _2510, _2522);
    float _2536 = fma(_2530, _2496, _2518);
    float _2538 = fma(_2504, _2510, _2532);
    float _2540 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2542 = fma(_2520, _2510, _2536);
    float _2544 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2546 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2540);
    float _2548 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2544);
    float _2550 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2548);
    float _2554 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2556 = _2552 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2558 = _1622 + _2554;
    float _2560 = _1596 + _2556;
    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2564 = _2558 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2568 = _2560 + _2566;
    float _2570 = _2564 * _2564;
    float _2572 = fma(_2568, _2568, _2570);
    float _2574 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2576 = sqrt(_2572);
    float _2578 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2574);
    float _2580 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2578);
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2584 = _1582 + _2582;
    bool _2586 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2588 = _2582;
    float _2590 = _2560;
    float _2592 = _2500;
    float _2594 = _2564;
    if (!_2586)
    {
        _2588 = _2560;
    }
    float _2596 = _2588;
    float _2598 = _2596;
    if (!_2586)
    {
        _2590 = _2558;
    }
    float _2600 = _2590;
    float _2602 = _2600;
    if (!_2586)
    {
        _2592 = _2584;
    }
    float _2604 = _2592;
    bool _2606 = !_2586;
    float _2608 = _2604;
    if (!_2606)
    {
        float _2610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2614 = _2576 + _2612;
        float _2616 = rsqrt(_2572);
        float _2618 = _2614 * _2610;
        float _2620 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2622 = _2618 * 0.15915493667125701904296875;
        float _2624 = _2622 * 6.283185482025146484375;
        float _2626 = cos(_2624);
        float _2628 = _2622 * 6.283185482025146484375;
        float _2630 = sin(_2628);
        float _2632 = _2626 + (-1.0);
        float _2634 = fma(_2630, _2620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2636 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2638 = _2616 * _2634;
        float _2640 = fma(_2584, _2626, _2636);
        float _2642 = fma(_2568, _2638, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2644 = fma(_2564, _2638, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2608 = _2640;
        _2598 = _2642;
        _2602 = _2644;
    }
    float _2646 = _2608;
    float _2648 = _2598;
    float _2650 = _2602;
    float _2652 = -_1582;
    float _2654 = _2652 + _2646;
    float _2656 = -_1596;
    float _2658 = _2656 + _2648;
    float _2660 = -_1622;
    float _2662 = _2660 + _2650;
    float _2664 = _2654 * _2654;
    float _2666 = fma(_2658, _2658, _2664);
    float _2668 = fma(_2662, _2662, _2666);
    float _2670 = sqrt(_2668);
    bool _2672 = _2670 > 0.0;
    float _2674 = _2670;
    float _2676 = _2650;
    float _2678 = _2646;
    float _2680 = _2654;
    float _2682 = _2668;
    if (!_2672)
    {
        _2674 = _2648;
    }
    float _2684 = _2674;
    bool _2686 = !_2672;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2694 = _2568;
        if (_2692)
        {
            float _2696 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2694 = _2696;
        }
        float _2698 = _2694;
        float _2700 = _2698;
        if (_2692)
        {
            float _2702 = _465 * _2698;
            _2436 = _2702;
        }
        float _2704 = _2436;
        float _2706 = _2704;
        if (_2692)
        {
            float _2708 = _467 * _2698;
            _2594 = _2708;
        }
        float _2710 = _2594;
        float _2712 = _2710;
        if (_2692)
        {
            float _2714 = _469 * _2698;
            _2700 = _2714;
        }
        float _2716 = _2700;
        float _2718 = _2716;
        if (!_2692)
        {
            bool _2720 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2724 = _2720 || _2722;
            bool _2726 = isnan(1.0);
            bool _2728 = _2724 || _2726;
            float _2730 = _123 + 1.0;
            if (!_2728)
            {
                float _2732 = _2730 * _2730;
                float _2734 = _2732 * 0.5;
                _125 = _2734;
            }
            float _2736 = _125;
            float _2738 = _2736;
            if (!_2728)
            {
                float _2740 = _2736 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2738 = _2740;
            }
            float _2742 = _2738;
            bool _2744 = !_2728;
            float _2746 = _2742;
            if (!_2744)
            {
                float _2748 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2750 = log2(_2748);
                float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2754 = 1.0 + _2752;
                float _2756 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2758 = _2750 * _2730;
                float _2760 = 1.0 / _2754;
                float _2762 = _2756 * 0.693147182464599609375;
                float _2764 = exp2(_2758);
                float _2766 = 1.0 / _2762;
                float _2768 = _2764 + (-1.0);
                float _2770 = -_2768;
                float _2772 = fma(_2770, _2766, _2730);
                float _2774 = _2772 * _2760;
                float _2776 = _2774 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2746 = _2776;
            }
            float _2778 = _2746;
            float _2780 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2782 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2784 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2786 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2788 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2790 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2792 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2786);
            float _2794 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2788);
            float _2796 = _2788;
            _2688 = _2784;
            if (!_2728)
            {
                _2796 = _2730;
            }
            float _2798 = _2796;
            float _2800 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2792);
            bool _2802 = !_2728;
            float _2804 = _2798;
            if (!_2802)
            {
                float _2806 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2808 = log2(_2806);
                float _2810 = _2808 * _2730;
                float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2814 = 1.0 + _2812;
                float _2816 = exp2(_2810);
                float _2818 = 1.0 / _2814;
                float _2820 = -_2816;
                float _2822 = _2820 + 1.0;
                float _2824 = _2822 * _2818;
                _2804 = _2824;
            }
            float _2826 = _2804;
            float _2828 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2790);
            float _2830 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2794);
            float _2832 = fma(_2826, _163, _2800);
            float _2834 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2828);
            float _2836 = fma(_2826, _161, _2830);
            float _2838 = -_427;
            float _2840 = _2838 + _2832;
            float _2842 = fma(_2826, _165, _2834);
            float _2844 = -_433;
            float _2846 = _2844 + _2836;
            float _2848 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2850 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2852 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2854 = -_439;
            float _2856 = _2854 + _2842;
            float _2858 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2848);
            float _2860 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2850);
            float _2862 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2852);
            float _2864 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2858);
            float _2866 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2860);
            float _2868 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2862);
            _473 = _2866;
            _475 = _2864;
            _477 = _2868;
            _2706 = _2864;
            _2712 = _2866;
            _2718 = _2868;
        }
        float _2870 = _473;
        float _2872 = _475;
        float _2874 = _477;
        float _2876 = _2706;
        float _2878 = _2712;
        float _2880 = _2718;
        float _2882 = _2688;
        float _2884 = _2870 * _2870;
        float _2886 = rsqrt(_2668);
        float _2888 = fma(_2872, _2872, _2884);
        float _2890 = fma(_2874, _2874, _2888);
        float _2892 = sqrt(_2890);
        float _2894 = _2658 * _2886;
        float _2896 = _2654 * _2886;
        float _2898 = _2662 * _2886;
        bool _2900 = _2892 > 0.0;
        float _2902 = _2882;
        if (!_2900)
        {
            _2902 = _2648;
        }
        float _2904 = _2902;
        bool _2906 = !_2900;
        _2690 = _2904;
        if (!_2906)
        {
            float _2908 = rsqrt(_2890);
            float _2910 = _2908 * _2870;
            float _2912 = _2908 * _2872;
            float _2914 = _2908 * _2874;
            float _2916 = _2896 * _2910;
            float _2918 = fma(_2894, _2912, _2916);
            float _2920 = fma(_2898, _2914, _2918);
            float _2922 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2924 = fma(_2876, _2922, _2648);
            float _2926 = fma(_2878, _2922, _2646);
            float _2928 = fma(_2880, _2922, _2650);
            _2676 = _2928;
            _2690 = _2924;
            _2678 = _2926;
        }
    }
    float _2930 = _2676;
    float _2932 = _2690;
    float _2934 = _2678;
    float _2936 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2938 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2946 = _2942 || _2944;
    float _2948 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2936);
    bool _2950 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2952 = isnan(0.5);
    bool _2954 = _2950 || _2952;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2958 = _2954 || _2956;
    float _2960 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2948);
    float _2962 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2964 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2966 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2962);
    float _2968 = 1.0 / _2964;
    float _2970 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2966);
    float _2972 = _2930;
    if (_2958)
    {
        _2680 = 1.0;
    }
    float _2974 = _2680;
    float _2976 = _2970 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2978 = _2976 + _2964;
    float _2980 = -_2352;
    float _2982 = _2980 + _2930;
    float _2984 = _2978 * _2968;
    float _2986 = _2984 * 0.5;
    float _2988 = -_2344;
    float _2990 = _2988 + _2932;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2994 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2992);
    float _2996 = -_2346;
    float _2998 = _2996 + _2934;
    float _3000 = 1.0 / _2994;
    float _3002 = _2998;
    float _3004 = _2990;
    float _3006 = _2982;
    float _3008 = _2974;
    if (!_2946)
    {
        float _3010 = _2362 * _2362;
        float _3012 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3014 = -_1622;
        float _3016 = _3014 + _2930;
        float _3018 = -_1582;
        float _3020 = _3018 + _2934;
        float _3022 = fma(_2370, _2370, _3010);
        float _3024 = fma(_2378, _2378, _3022);
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3028 = sqrt(_3024);
        float _3030 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3032 = 1.0 / _2472;
        float _3034 = precise::min(_3028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3036 = _3034 * _3026;
        float _3038 = _3036 * _3032;
        float _3040 = -_1596;
        float _3042 = _3040 + _2932;
        float _3044 = _3030 * _3038;
        float _3046 = _3016 * _3038;
        float _3048 = fma(_3042, _3044, _2356);
        float _3050 = fma(_3020, _3044, _2350);
        float _3052 = fma(_3030, _3046, _2366);
        _3002 = _3050;
        _3004 = _3048;
        _3006 = _3052;
        _2438 = _3028;
        _2972 = _3046;
    }
    float _3054 = _3002;
    float _3056 = _3004;
    float _3058 = _3006;
    float _3060 = _2438;
    float _3062 = _2972;
    float _3064 = _3062;
    float _3066 = _3060;
    if (_2958)
    {
        _3064 = 1.0;
    }
    float _3068 = _3064;
    float _3070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3072 = _3000 * _3070;
    float _3074 = _3068;
    if (!_2958)
    {
        float _3076 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3078 = _3076 * 0.15915493667125701904296875;
        float _3080 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3082;
        float _3086 = _3078 * 6.283185482025146484375;
        float _3088 = cos(_3086);
        float _3090 = _3080 * 0.15915493667125701904296875;
        float _3092 = _3078 * 6.283185482025146484375;
        float _3094 = sin(_3092);
        float _3096 = 1.0 / _3088;
        float _3098 = _3090 * 6.283185482025146484375;
        float _3100 = cos(_3098);
        float _3102 = _3094 * _3096;
        float _3104 = _3090 * 6.283185482025146484375;
        float _3106 = sin(_3104);
        float _3108 = _3100 * _3102;
        float _3110 = 1.0 / _3084;
        float _3112 = 1.0 / _3108;
        float _3114 = _3106 * _3112;
        float _3116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3118 = fma(_3072, _3114, _3116);
        float _3120 = _3118 * _3110;
        float _3122 = precise::clamp(_3120, 0.0, 1.0);
        _2440 = _3090;
        _2442 = _3078;
        _3008 = _3122;
    }
    float _3124 = _2440;
    float _3126 = _2442;
    float _3128 = _3008;
    float _3130 = _3124;
    float _3132 = _3126;
    if (!_2958)
    {
        float _3134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3136 = _3134 * 0.15915493667125701904296875;
        float _3138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3140 = _3136 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        float _3144 = _3138 * 0.15915493667125701904296875;
        float _3146 = _3136 * 6.283185482025146484375;
        float _3148 = sin(_3146);
        float _3150 = 1.0 / _3142;
        float _3152 = _3144 * 6.283185482025146484375;
        float _3154 = cos(_3152);
        float _3156 = _3148 * _3150;
        float _3158 = _3144 * 6.283185482025146484375;
        float _3160 = sin(_3158);
        float _3162 = _3154 * _3156;
        float _3164 = 1.0 / _3162;
        float _3166 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3168 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3166;
        float _3170 = 1.0 / _3168;
        float _3172 = _3160 * _3164;
        float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3176 = fma(_3072, _3172, _3174);
        float _3178 = _3176 * _3170;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        float _3182 = -_3180;
        float _3184 = _3182 + 1.0;
        _3130 = _3142;
        _3074 = _3184;
    }
    float _3186 = _3130;
    float _3188 = _3074;
    float _3190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3192 = _3054 + _3190;
    float _3194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3196 = _3056 + _3194;
    float _3198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3200 = _3058 + _3198;
    float _3202 = _3192 * _3192;
    float _3204 = fma(_3196, _3196, _3202);
    float _3206 = fma(_3200, _3200, _3204);
    float _3208 = rsqrt(_3206);
    float _3210 = sqrt(_3206);
    float _3212 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3214 = _3196 * _3212;
    float _3216 = _3200 * _3212;
    float _3218 = _3214 * _3214;
    float _3220 = _3216 * _3216;
    float _3222 = _3218 + _3220;
    float _3224 = sqrt(_3222);
    bool _3226 = _3224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3230 = _3224 + _3228;
    float _3232 = _3200;
    float _3234 = _3208;
    float _3236 = _3230;
    float _3238 = _3212;
    if (_3226)
    {
        float _3240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3232 = _3240;
    }
    float _3242 = _3232;
    if (_3226)
    {
        float _3244 = rsqrt(_3222);
        _3234 = _3244;
    }
    float _3246 = _3234;
    float _3248 = _3246;
    if (_3226)
    {
        float _3250 = _3230 * _3242;
        _3236 = _3250;
    }
    float _3252 = _3236;
    if (_3226)
    {
        float _3254 = _3252 * 0.15915493667125701904296875;
        _3132 = _3254;
    }
    float _3256 = _3132;
    float _3258 = _3242;
    if (_3226)
    {
        float _3260 = _3256 * 6.283185482025146484375;
        float _3262 = sin(_3260);
        _3258 = _3262;
    }
    float _3264 = _3258;
    float _3266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3268 = precise::max(0.0, _3266);
    float _3270 = _3186;
    float _3272 = _3268;
    if (_3226)
    {
        float _3274 = _3256 * 6.283185482025146484375;
        float _3276 = cos(_3274);
        _3270 = _3276;
    }
    float _3278 = _3270;
    float _3280 = -_3212;
    float _3282 = -_3268;
    float _3284 = fma(_3192, _3280, _3282);
    float _3286 = _3284;
    if (_3226)
    {
        float _3288 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3272 = _3288;
    }
    float _3290 = _3272;
    float _3292 = _3264;
    float _3294 = _3290;
    if (_3226)
    {
        float _3296 = fma(_3264, _3290, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3238 = _3296;
    }
    float _3298 = _3238;
    float _3300 = _3298;
    if (!_3226)
    {
        _3292 = _3284;
    }
    float _3302 = _3292;
    float _3304 = _3302;
    if (_3226)
    {
        float _3306 = _3278 + (-1.0);
        _3294 = _3306;
    }
    float _3308 = _3294;
    float _3310 = _3308;
    if (_3226)
    {
        float _3312 = _3246 * _3298;
        _2682 = _3312;
    }
    float _3314 = _2682;
    if (!_3226)
    {
        _3248 = _3214;
    }
    float _3316 = _3248;
    float _3318 = _3316;
    if (_3226)
    {
        float _3320 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3066 = _3320;
    }
    float _3322 = _3066;
    if (_3226)
    {
        float _3324 = _3214 * _3314;
        _3318 = _3324;
    }
    float _3326 = _3318;
    if (!_3226)
    {
        _3310 = _3216;
    }
    float _3328 = _3310;
    float _3330 = _3328;
    if (_3226)
    {
        float _3332 = _3216 * _3314;
        _3330 = _3332;
    }
    float _3334 = _3330;
    if (!_3226)
    {
        _3300 = _3218;
    }
    float _3336 = _3300;
    float _3338 = _3336;
    if (_3226)
    {
        float _3340 = fma(_3284, _3278, _3322);
        _3304 = _3340;
    }
    float _3342 = _3304;
    if (_3226)
    {
        float _3344 = _3326 * _3326;
        _3338 = _3344;
    }
    float _3346 = _3338;
    if (!_3226)
    {
        _3286 = _3220;
    }
    float _3348 = _3286;
    float _3350 = _3348;
    if (_3226)
    {
        float _3352 = _3334 * _3334;
        _3350 = _3352;
    }
    float _3354 = _3350;
    float _3356 = fma(_3342, _3342, _3346);
    float _3358 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3360 = _3356 + _3354;
    float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3364 = fma(_3210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3362);
    float _3366 = precise::clamp(_3364, 0.0, 1.0);
    float _3368 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3358);
    float _3370 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3372 = rsqrt(_3360);
    float _3374 = -_3366;
    float _3376 = _3374 + 1.0;
    float _3378 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3380 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3368);
    float _3382 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3384 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3370);
    float _3386 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3388 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3390 = abs(_3376);
    float _3392 = log2(_3390);
    float _3394 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3382);
    float _3396 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3384);
    float _3398 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3386);
    float _3400 = _3388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3402 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3394);
    float _3404 = _3396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3406 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3398);
    float _3408 = _3372 * _3326;
    float _3410 = -_3400;
    float _3412 = fma(_3410, _3378, 1.0);
    float _3414 = _3402 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3416 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3418 = _3372 * _3342;
    float _3420 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3422 = _3406 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3424 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3416);
    float _3426 = _3372 * _3334;
    float _3428 = -_3420;
    float _3430 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3428);
    float _3432 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3434 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3424);
    float _3436 = log2(_3412);
    float _3438 = -_3426;
    float _3440 = fma(_3438, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3430);
    float _3442 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3444 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3434);
    float _3446 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3448 = fma(_3440, -0.5, 0.5);
    float _3450 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3442);
    float _3452 = fma(_3440, 0.5, 0.5);
    float _3454 = exp2(_3432);
    float _3456 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3446);
    float _3458 = _3418 + 1.0;
    float _3460 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3450);
    float _3462 = fma(_3452, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3464 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3456);
    float _3466 = 1.0 / _3444;
    float _3468 = fma(_3452, _3462, -0.212114393711090087890625);
    float _3470 = _3436 * 0.693147182464599609375;
    float _3472 = fma(_3452, _3468, 1.570728778839111328125);
    float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3476 = sqrt(_3448);
    float _3478 = -_3418;
    float _3480 = fma(_3454, _3458, _3478);
    float _3482 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3484 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3464);
    float _3486 = _3482 * _3466;
    float _3488 = _3484 * _3466;
    float _3490 = fma(_3486, 0.5, 0.5);
    float _3492 = fma(_3488, -0.5, 0.5);
    float _3494 = fma(_3480, 0.5, 0.5);
    float _3496 = _3476 * 0.636619746685028076171875;
    float _3498 = -_3472;
    float _3500 = fma(_3496, _3498, 1.0);
    float3 _8906 = float3(_3490, _3492, _3474);
    float _3502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8906, float3(0.0), isnan(_8906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8906, float3(0.0), isnan(_8906)), level(0.0)).x;
    float3 _8917 = float3(_3490, _3492, _3474);
    float4 _3505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8917, float3(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8917, float3(0.0), isnan(_8917)), level(0.0)).xyzw;
    float _3507 = _3505.x;
    float _3509 = _3505.y;
    float _3511 = _3505.z;
    float _3513 = _3505.w;
    float2 _8934 = float2(_3500, _3494);
    float3 _3517 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8934, float2(0.0), isnan(_8934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8934, float2(0.0), isnan(_8934)), level(0.0)).xyz;
    float _3519 = _3517.x;
    float _3521 = _3517.y;
    float _3523 = _3517.z;
    float _3525 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3527 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3529 = _3128 > 0.0;
    bool _3531 = isnan(_3128);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan(0.0);
    bool _3537 = _3533 || _3535;
    float _3539 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3527);
    float _3541 = exp2(_3525);
    bool _3543 = _3188 <= 0.0;
    bool _3545 = !_3537;
    bool _3547 = _3543 || _3545;
    float _3549 = _3444 * 0.5;
    float _3551 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3539);
    float _3553 = _3482 + _3444;
    float _3555 = fma(_3484, -0.5, _3549);
    float _3557 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3551);
    float _3559 = _3553 * 0.5;
    float _3561 = _3128 * _3188;
    float _3563 = _3557 + _3444;
    out.gl_Position.x = _3482;
    out.gl_Position.y = _3484;
    out.gl_Position.z = _3557;
    out.gl_Position.w = _3444;
    float _3565 = _3561 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3567 = _3563 * 0.5;
    float _3569 = -_3541;
    float _3571 = _3569 + 1.0;
    float _3573 = _3565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3575 = _3571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3559;
    out.m_68.y = _3555;
    out.m_68.z = _3567;
    out.m_68.w = _3444;
    out.m_45.x = _3573;
    float _3577 = _3575 * _3502;
    float _3579 = -_3575;
    float _3581 = _3579 + 1.0;
    float _3583 = _3513 * _3577;
    float _3585 = _3523 * _3577;
    float _3587 = _3513 * _3581;
    float _3589 = fma(_3519, _3583, _3507);
    float _3591 = fma(_3521, _3583, _3509);
    float _3593 = fma(_3513, _3585, _3511);
    out.m_70.x = _3589;
    out.m_70.y = _3591;
    out.m_70.z = _3593;
    out.m_70.w = _3587;
    if (!_3547)
    {
        return out;
    }
    float _3595 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3595;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _905 = false;
    bool _791 = false;
    bool _497 = false;
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
        float _3652 = as_type<float>(_105);
        out.gl_Position.z = _3652;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3722 = as_type<float>(_143);
        out.gl_Position.z = _3722;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _307 = _297;
    if (!_159)
    {
        float _309 = _123 * _123;
        float _311 = _309 * 0.5;
        _273 = _311;
    }
    float _313 = _273;
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _319 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _321 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _323 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _323;
    }
    float _325 = _275;
    bool _327 = !_159;
    float _329 = _325;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = _123 * _333;
        float _343 = 1.0 / _337;
        float _345 = _339 * 0.693147182464599609375;
        float _347 = exp2(_341);
        float _349 = 1.0 / _345;
        float _351 = _347 + (-1.0);
        float _353 = -_351;
        float _355 = fma(_353, _349, _123);
        float _357 = _355 * _343;
        float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _359;
    }
    float _361 = _329;
    float _363 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].y, _317);
    float _367 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].x, _315);
    float _369 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _375 = _363 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _377 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[10].z, _319);
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].x, _373);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[8].z, _375);
    float _387 = fma(_297, _161, _367);
    float _389 = fma(_297, _163, _365);
    float _391 = fma(_297, _165, _377);
    float _393 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].x, _383);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[10].z, _385);
    if (!_159)
    {
        _307 = _123;
    }
    float _399 = _307;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _431 = fma(_389, _149, _169);
    float _433 = fma(_425, _161, _395);
    float _435 = -_427;
    float _437 = _389 + _435;
    float _439 = fma(_425, _165, _397);
    float _441 = fma(_387, _149, _167);
    float _443 = -_433;
    float _445 = _387 + _443;
    float _447 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _449 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _451 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _453 = -_439;
    float _455 = _391 + _453;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _449);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
    float _463 = fma(_391, _149, _171);
    float _465 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].z, _457);
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].z, _459);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
    bool _471 = !_429;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _509 = _505 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _527 = 1.0 / _513;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _529;
    float _533 = 1.0 / _517;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _537 = _505 + _535;
    bool _539 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _541 = 1.0 / _521;
    float _543 = _537 * _527;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _547 = _505 + _545;
    float _549 = 1.0 / _531;
    float _551 = _509 * _533;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _555 = _505 + _553;
    bool _557 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _559 = isnan(_505);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _571 = _505 + _569;
    float _573 = 1.0 / _525;
    float _575 = _547 * _541;
    bool _577 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _579 = isnan(_505);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _591 = isnan(_505);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _555 * _549;
    float _603 = -_567;
    float _605 = _603 + 1.0;
    float _607 = -_587;
    float _609 = _607 + 1.0;
    bool _611 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_505);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -_599;
    float _625 = _623 + 1.0;
    float _627 = _599 * _609;
    bool _629 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _631 = isnan(_505);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _571 * _573;
    float _643 = _587 * _605;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _649;
    bool _653 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _655 = isnan(_505);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _621 * _625;
    float _667 = fma(_647, _543, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _669 = fma(_651, _543, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _671 = -_621;
    float _673 = _671 + 1.0;
    float _675 = -_639;
    float _677 = _675 + 1.0;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _687 = _639 * _673;
    float _689 = _663 * _677;
    float _691 = fma(_681, _551, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _693;
    float _697 = -_663;
    float _699 = _697 + 1.0;
    float _701 = _667 * _689;
    float _703 = _669 * _689;
    float _705 = fma(_695, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _707 = fma(_685, _551, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _709 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _711;
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _717 = in.m_52.x;
    float _719 = in.m_52.y;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _725 = fma(_713, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _731 = fma(_691, _687, _709);
    float _733 = fma(_707, _687, _715);
    float _735 = fma(_723, _641, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _737 = fma(_729, _641, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _743;
    float _747 = fma(_705, _665, _731);
    float _749 = fma(_725, _665, _733);
    float _751 = fma(_741, _601, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _753 = fma(_745, _601, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _755 = fma(_735, _627, _747);
    float _757 = fma(_737, _627, _749);
    float _759 = fma(_751, _643, _755);
    float _761 = fma(_753, _643, _757);
    float _763 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[148].x, _759);
    float _765 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[148].y, _761);
    float _767 = _763 * _717;
    float _769 = _765 * _719;
    bool _771 = !_539;
    float _789;
    if (!_771)
    {
        float _773 = in.m_54.x;
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _777 = _773 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_89);
        float _795 = 1.0 / _793;
        float _797 = _123 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    bool _801 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _803 = isnan(_799);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _817 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _819 = isnan(_799);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _835 = _799 + _833;
    float _837 = -_811;
    float _839 = _837 + 1.0;
    float _841 = 1.0 / _815;
    float _843 = _827 * _839;
    float _845 = -_827;
    float _847 = _845 + 1.0;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _853 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _831 * _841;
    float _865 = fma(_863, _835, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _867 = _865 * _843;
    float _869 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[115].x, _867);
    float _871 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[116].x, _869);
    float _873 = _871 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _857;
    out.m_56.y = _859;
    out.m_56.z = _861;
    out.m_56.w = _873;
    bool _875 = !_853;
    float _899;
    float _901;
    float _903;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _881 = float(_89);
        float _883 = 1.0 / _881;
        float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = _123 * _883;
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _891 = _889 * _879;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _887;
        _901 = _897;
        _903 = _881;
        _905 = true;
    }
    else
    {
        float _907 = float(_89);
        float _909 = 1.0 / _907;
        float _911 = _123 * _909;
        _899 = _911;
        _901 = _911;
        _903 = _907;
    }
    _905 = false;
    float _913 = _899;
    float _915 = _901;
    float _917 = _903;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _921 = int(_919);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _925 = _913 + _923;
    float _927 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _929;
    float _933 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _935 = int(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _949 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _951 = isnan(_915);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = 1.0 / _931;
    float _963 = float(_921);
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _965;
    bool _969 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _971 = isnan(_913);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    bool _981 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _983 = isnan(_913);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = 1.0 / _963;
    float _995 = float(uint(_935));
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _999 = ~_935;
    int _1001 = _999 + 1;
    float _1003 = float(_935);
    bool _1005 = _935 == 0;
    float _1007 = 1.0 / _995;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1011 = _123 * _993;
    int _1013 = ~_935;
    int _1015 = _1013 + 1;
    float _1017 = 1.0 / _939;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>(_1007) + (-2);
    float _1027 = trunc(_1011);
    int _1029 = int(_1027);
    float _1031 = 1.0 / _943;
    float _1033 = float(uint(_1029));
    float _1035 = 1.0 / _947;
    float _1037 = as_type<float>(_1025) * _1033;
    float _1039 = in.m_54.x;
    float _1041 = in.m_54.y;
    float _1043 = in.m_54.z;
    float _1045 = in.m_54.w;
    float _1047 = trunc(_1037);
    float _1049 = precise::max(_1047, 0.0);
    uint _1052 = uint(_1049);
    float _1054 = float(_1029);
    int _1056 = _1015 * int(_1052);
    int _1058 = _1056 + _1029;
    float _1060 = float(uint(_1058));
    float _1062 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1064 = !_1023;
    float _1066 = _1064 ? _1041 : _1039;
    float _1068 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[79].z, _997);
    float _1070 = 0.0;
    if (!_1023)
    {
        _1070 = _1043;
    }
    float _1072 = _1070;
    float _1074 = as_type<float>(_1025) * _1060;
    float _1076 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1068);
    float _1078 = _1072;
    if (_1023)
    {
        _1078 = _1041;
    }
    float _1080 = _1078;
    float _1082 = -_979;
    float _1084 = _1082 + 1.0;
    bool _1086 = !_1023;
    float _1088 = _1086 ? 1.2345600128173828125 : 1.0;
    float _1090 = trunc(_1074);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    float _1096 = _1076 * (-0.15915493667125701904296875);
    float _1098 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1100 = _1088 * _1066;
    float _1102 = floor(_1100);
    int _1104 = int(_1052) + int(_1094);
    bool _1106 = _1054 >= _1003;
    bool _1108 = isnan(_1054);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1003);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = _1001 * _1104;
    int _1120 = _1118 + _1029;
    float _1122 = 1.0 / _917;
    float _1124 = -_1102;
    float _1126 = _1100 + _1124;
    bool _1128 = uint(_1120) >= uint(_935);
    float _1130 = trunc(_1116);
    int _1132 = int(_1130);
    bool _1134 = !_1128;
    int _1136 = _1134 ? 0 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1152 = _1150 != 0;
    int _1154 = ~_1104;
    int _1156 = _1154 + _1136;
    int _1158 = _1156 + 1;
    float _1160 = _1126 * _1003;
    float _1162 = _123 * _1003;
    bool _1164 = !_1144;
    int _1166 = _1164 ? 0 : 1;
    int _1168 = _935 * _1158;
    int _1170 = _1168 + _1029;
    float _1172 = _1162 * _1122;
    float _1174 = trunc(_1160);
    int _1176 = int(_1174);
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1180 = _1178 != 0;
    bool _1182 = !_1005;
    int _1184 = _1182 ? _1170 : (-1);
    int _1186 = ~_1132;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = _935 + (-1);
    float _1194 = trunc(_1172);
    int _1196 = int(_1194);
    bool _1198 = !_1180;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = _1184 * _1190;
    int _1204 = abs(_1166);
    bool _1206 = !_1148;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = _1132 * _1192;
    int _1212 = _1210 + _1202;
    bool _1214 = !_1140;
    int _1216 = _1214 ? 0 : 1;
    int _1218 = abs(_1200);
    int _1220 = abs(_1216);
    int _1222 = _1176 * _1218;
    int _1224 = _1222 + _1029;
    bool _1226 = !_1152;
    int _1228 = _1226 ? 0 : 1;
    int _1230 = abs(_1208);
    int _1232 = _1212 * _1204;
    int _1234 = abs(_1228);
    int _1236 = _1196 * _1220;
    int _1238 = _1236 + _1232;
    float _1240 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1242 = _1224 * _1230;
    int _1244 = _1242 + _1238;
    int _1246 = ~_935;
    int _1248 = _1246 + 1;
    int _1250 = _1176 * _1234;
    int _1252 = _1250 + _1244;
    float _1254 = as_type<float>(_1176);
    if (!_1023)
    {
        _1254 = _1041;
    }
    float _1256 = _1254;
    float _1258 = _1256;
    if (_1023)
    {
        _1258 = _1039;
    }
    float _1260 = _1258;
    float _1262 = float(uint(_1252));
    float _1264 = as_type<float>(_1025) * _1262;
    float _1266 = trunc(_1264);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    int _1272 = _1248 * int(_1270);
    int _1274 = _1272 + _1252;
    float _1276 = float(uint(_1274));
    float _1278 = as_type<float>(_1025) * _1276;
    int _1280 = ~_935;
    int _1282 = _1280 + 1;
    float _1284 = trunc(_1278);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = int(_1270) + int(_1288);
    int _1292 = _1282 * _1290;
    int _1294 = _1292 + _1252;
    float _1296 = _1039 * 2.0;
    bool _1298 = uint(_1294) >= uint(_935);
    float _1300 = floor(_1296);
    bool _1302 = !_1298;
    int _1304 = _1302 ? 0 : (-1);
    int _1306 = ~_1290;
    int _1308 = _1306 + _1304;
    int _1310 = _1308 + 1;
    float _1312 = _1041 * 2.0;
    int _1314 = _935 * _1310;
    int _1316 = _1314 + _1252;
    float _1318 = floor(_1312);
    bool _1320 = !_1005;
    int _1322 = _1320 ? _1316 : (-1);
    bool _1324 = _1300 > 0.0;
    int _1326 = _1322 & 3;
    bool _1328 = _1326 != 0;
    int _1330 = _1322 & 3;
    bool _1332 = _1330 != 0;
    int _1334 = _1328 ? 0 : 1;
    bool _1336 = uint(_1330) > 1u;
    bool _1338 = _1300 >= 0.0;
    bool _1340 = isnan(_1300);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan(0.0);
    bool _1346 = _1342 || _1344;
    int _1348 = ~_1334;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1356 = log2(_1354);
    int _1358 = _1346 ? 0 : 1;
    bool _1360 = _1045 > 0.5;
    int _1362 = ~_1358;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    int _1368 = _1366;
    int _1370 = _1352;
    if (!_1324)
    {
        int _1372 = ~_1358;
        int _1374 = _1372 + 1;
        _1368 = _1374;
    }
    int _1376 = _1368;
    float _1378 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_1336)
    {
        int _1380 = ~_1334;
        int _1382 = _1380 + 1;
        _1370 = _1382;
    }
    int _1384 = _1370;
    bool _1386 = _1039 > 0.5;
    float _1388 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1378);
    bool _1390 = _1041 > 0.5;
    float _1392 = -_225;
    int _1394 = _1360 ? as_type<int>(_1392) : as_type<int>(_225);
    bool _1396 = _1318 >= 0.0;
    bool _1398 = isnan(_1318);
    bool _1400 = _1396 || _1398;
    bool _1402 = isnan(0.0);
    bool _1404 = _1400 || _1402;
    float _1406 = -_221;
    int _1408 = _1386 ? as_type<int>(_1406) : as_type<int>(_221);
    float _1410 = -_225;
    int _1412 = _1390 ? as_type<int>(_1410) : as_type<int>(_225);
    bool _1414 = _1043 > 0.5;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1418 = _1416 != 0;
    int _1420 = _1404 ? 0 : 1;
    bool _1422 = _1318 > 0.0;
    float _1424 = -_221;
    int _1426 = _1414 ? as_type<int>(_1424) : as_type<int>(_221);
    bool _1428 = !_1418;
    float _1430 = _1428 ? _225 : as_type<float>(_1394);
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1438 = _1436 != 0;
    bool _1440 = !_1434;
    float _1442 = _1440 ? _221 : as_type<float>(_1408);
    float _1444 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1446 = !_1438;
    float _1448 = _1446 ? _225 : as_type<float>(_1412);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1452 = _1450 != 0;
    float _1454 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1444);
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1458 = _1456 != 0;
    float _1460 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1462 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1454);
    int _1464 = ~_1420;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1460);
    int _1472 = _1468;
    float _1474 = _1444;
    if (!_1422)
    {
        int _1476 = ~_1420;
        int _1478 = _1476 + 1;
        _1472 = _1478;
    }
    int _1480 = _1472;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1486 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1470);
    float _1488 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1388);
    if (!_1023)
    {
        _1474 = _1043;
    }
    float _1490 = _1474;
    float _1492 = 1.0 / _1484;
    float _1494 = _1490;
    if (_1023)
    {
        _1494 = _1041;
    }
    float _1496 = _1494;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1510 = _1508 != 0;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1514 = -_1498;
    float _1516 = fma(_1240, 2.0, _1514);
    float _1518 = fma(_1062, -2.0, _1512);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1522 = _1520 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1526 = _915 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1532;
    float _1536 = _1526 * _961;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1542 = _1043 * 2.0;
    float _1544 = 1.0 / _1530;
    float _1546 = _1540 * _1017;
    float _1548 = _1534 * _1031;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1550;
    bool _1554 = !_1458;
    float _1556 = _1554 ? _221 : as_type<float>(_1426);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1562 = fma(_967, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1564 = 1.0 / _1522;
    float _1566 = _1552 * _1035;
    float _1568 = fma(_1546, _925, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1570 = _915 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1572 = isnan(_915);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = _1486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1584 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1586 = isnan(_913);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1462 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1598 = floor(_1542);
    float _1600 = _123 * _1356;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1604 = _1602 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1610 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1612 = isnan(_913);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1618 = _1614 || _1616;
    float _1620 = float(_1618);
    float _1622 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1624 = _1604 * _1492;
    float _1626 = _1041 + _1039;
    float _1628 = exp2(_1600);
    float _1630 = _1626 + (-1.0);
    int _1632 = abs(_1384);
    bool _1634 = _935 == 0;
    float _1636 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1638 = 1.0 / _1560;
    bool _1640 = _1598 >= 0.0;
    bool _1642 = isnan(_1598);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan(0.0);
    bool _1648 = _1644 || _1646;
    int _1650 = _1648 ? 0 : 1;
    bool _1652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1654 = isnan(0.0);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1660 = _1656 || _1658;
    float _1662 = -_1628;
    float _1664 = _1662 + 1.0;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1674;
    int _1678 = ~_1632;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = _1668 * _1544;
    float _1686 = _1041 + _1043;
    float _1688 = _1672 * _1564;
    float _1690 = fma(_1676, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1692 = _1686 + (-1.0);
    float _1694 = _1660 ? _1664 : 0.0;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1698 = _913 + _1696;
    bool _1700 = _1598 > 0.0;
    float _1702 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1706 = _913 + _1704;
    float _1708 = fma(_1684, _1698, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1712 = _913 + _1710;
    float _1714 = _1608 * _1638;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1716;
    float _1720 = fma(_1566, _1706, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1724 = _913 + _1722;
    float _1726 = fma(_1688, _1712, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1728 = fma(_1718, _1536, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1732 = _913 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1736 = _913 + _1734;
    bool _1738 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1740 = isnan(_913);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1746 = _1742 || _1744;
    float _1748 = float(_1746);
    float _1750 = fma(_1714, _1724, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1752 = fma(_1624, _1732, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1754 = fma(_1548, _1736, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1756 = -_1580;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1748;
    float _1762 = _1760 + 1.0;
    bool _1764 = !_1506;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1770 = _959 * _1758;
    float _1772 = _1594 * _1762;
    float _1774 = -_1594;
    float _1776 = _1774 + 1.0;
    float _1778 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1768);
    bool _1780 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1782 = isnan(_913);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = _1690 * _1770;
    float _1794 = _1562 * _1770;
    float _1796 = _1728 * _1770;
    bool _1798 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1800 = isnan(_913);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _1790 * _1776;
    float _1812 = -_1790;
    float _1814 = _1812 + 1.0;
    float _1816 = -_1808;
    float _1818 = _1816 + 1.0;
    bool _1820 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1822 = isnan(_913);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1828 = _1824 || _1826;
    float _1830 = float(_1828);
    float _1832 = _1808 * _1814;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1836 = 1.0 + _1834;
    float _1838 = _1620 * _1818;
    float _1840 = -_1620;
    float _1842 = _1840 + 1.0;
    float _1844 = _1830 * _1084;
    float _1846 = 1.0 / _1836;
    float _1848 = -_1830;
    float _1850 = _1848 + 1.0;
    float _1852 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1009);
    float _1854 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1858 = _991 * _1850;
    float _1860 = -_991;
    float _1862 = _1860 + 1.0;
    float _1864 = -_1019;
    float _1866 = fma(_1854, 2.0, _1864);
    float _1868 = _979 * _1842;
    float _1870 = _1754 * _1858;
    float _1872 = -_959;
    float _1874 = _1872 + 1.0;
    float _1876 = fma(_1098, -2.0, _1856);
    float _1878 = _1096 * 6.283185482025146484375;
    float _1880 = sin(_1878);
    float _1882 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1870);
    float _1884 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1794);
    int _1886 = ~_1650;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    float _1892 = _1694 * _1846;
    float _1894 = fma(_1568, _1844, _1882);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1792);
    float _1898 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1796);
    float _1900 = _1096 * 6.283185482025146484375;
    float _1902 = cos(_1900);
    float _1904 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1884);
    float _1906 = fma(_1720, _1868, _1894);
    float _1908 = float(uint(_1224));
    float _1910 = _1556 + 0.5;
    bool _1912 = !_1502;
    int _1914 = _1912 ? 0 : 1;
    float _1916 = -_123;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1866);
    int _1920 = _1890;
    if (!_1700)
    {
        int _1922 = ~_1650;
        int _1924 = _1922 + 1;
        _1920 = _1924;
    }
    int _1926 = _1920;
    float _1928 = as_type<float>(_1025) * _1908;
    float _1930 = _1448 * _1880;
    int _1932 = abs(_1914);
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1936 = _1582 + _1934;
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1876);
    int _1940 = abs(_1766);
    float _1942 = trunc(_1928);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    bool _1948 = uint(_1330) >= 2u;
    float _1950 = _1448 * _1902;
    float _1952 = -_1930;
    float _1954 = fma(_1442, _1902, _1952);
    float _1956 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1898);
    float _1958 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1960 = fma(_1442, _1880, _1950);
    float _1962 = _1430 + (-0.5);
    float _1964 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1896);
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1968 = _1596 + _1966;
    float _1970 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1918);
    float _1972 = -_1962;
    float _1974 = -_1938;
    float _1976 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1974);
    float _1978 = float(_1940);
    float _1980 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1958);
    int _1982 = _1948 ? 0 : 1;
    float _1984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1986 = float(_1376);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1990 = _1622 + _1988;
    int _1992 = ~_935;
    int _1994 = _1992 + 1;
    bool _1996 = _1330 != 3;
    float _1998 = _1978 * _1986;
    float _2000 = float(_1932);
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2004 = float(_1926);
    int _2006 = _1994 * int(_1946);
    int _2008 = _2006 + _1224;
    int _2010 = ~_1982;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    float _2016 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1980);
    float _2018 = _1998 * (-2.0);
    float _2020 = _2000 * _2004;
    int _2022 = _1322 >> 31;
    float _2024 = float(uint(_2008));
    float _2026 = _2020 * (-2.0);
    int _2028 = _2022 & 3;
    float _2030 = fma(_1702, _2018, _1702);
    int _2032 = _2014;
    if (_1996)
    {
        int _2034 = ~_1982;
        int _2036 = _2034 + 1;
        _2032 = _2036;
    }
    int _2038 = _2032;
    float _2040 = fma(_1752, _1838, _1906);
    int _2042 = _1322 + _2028;
    float _2044 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2046 = as_type<float>(_1025) * _2024;
    float _2048 = -_123;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1516);
    int _2052 = _2042 >> 2;
    float _2054 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1518);
    float _2056 = _1964 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2058 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2060 = _1956 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2062 = _1954 + 0.5;
    float _2064 = _1904 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2066 = _1960 + (-0.5);
    float _2068 = trunc(_2046);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = _2052 << 4;
    int _2076 = _2074 + 512;
    float _2078 = fma(_2058, _2062, _2050);
    float _2080 = -_2044;
    float _2082 = -_2054;
    float _2084 = fma(_2080, _2066, _2082);
    uint _2086 = uint(int(uint(_2076) >> uint(2)));
    uint _2088 = uint(int(uint(int(_2086)) >> uint(2)));
    int _2090 = int(_2086) & 3;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[int(_2088)][_2090];
    int _2094 = int(_2086) + 1;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    int _2098 = _2094 & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    float _2102 = fma(_1708, _1832, _2040);
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2106 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2110 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2114 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2116 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1778);
    int _2118 = int(_1946) + int(_2072);
    float _2120 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1852);
    float _2122 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2104);
    out.m_58.x = _2106;
    out.m_58.y = _2110;
    out.m_58.z = _2114;
    out.m_58.w = _2112;
    int _2124 = _2076 + 8;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    uint _2128 = uint(int(uint(int(_2126)) >> uint(2)));
    int _2130 = int(_2126) & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    int _2134 = int(_2126) + 1;
    uint _2136 = uint(int(uint(_2134) >> uint(2)));
    int _2138 = _2134 & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    float _2142 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2108);
    float _2144 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2122);
    float _2146 = in.m_60.x;
    float _2148 = in.m_60.y;
    float _2150 = in.m_60.z;
    float _2152 = fma(_1750, _1810, _2102);
    float _2154 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2142);
    int _2156 = abs(_2038);
    float _2158 = fma(_1636, _2026, _1636);
    bool _2160 = _2016 >= 0.0;
    float _2162 = fma(_1726, _1772, _2152);
    float _2164 = -_2120;
    float _2166 = _2164 + 1.0;
    float _2168 = -_2116;
    float _2170 = _2168 + 1.0;
    float _2172 = -_2144;
    float _2174 = _2172 + 1.0;
    float _2176 = -_2154;
    float _2178 = _2176 + 1.0;
    float _2180 = -_2166;
    float _2182 = fma(_1556, _2180, _1970);
    int _2184 = ~_935;
    int _2186 = _2184 + 1;
    float _2188 = fma(_1430, _2170, _1976);
    bool _2190 = !_1332;
    int _2192 = _2190 ? 0 : 1;
    float _2194 = -_2174;
    float _2196 = fma(_1954, _2194, _2078);
    float _2198 = fma(_1960, _2178, _2084);
    int _2200 = _2186 * _2118;
    int _2202 = _2200 + _1224;
    int _2204 = abs(_2192);
    float _2206 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2162);
    if (_2160)
    {
        out.m_45.x = 0.0;
    }
    float _2208 = fma(_2026, _2146, _2146);
    bool _2210 = uint(_2202) >= uint(_935);
    float _2212 = fma(_2018, _2148, _2148);
    out.m_62.x = _2196;
    out.m_62.y = _2198;
    out.m_62.z = _2182;
    out.m_62.w = _2188;
    bool _2214 = !_2210;
    int _2216 = _2214 ? 0 : (-1);
    int _2218 = _1682 * as_type<int>(_2100);
    bool _2220 = _1330 != 3;
    out.m_64.x = _2206;
    int _2222 = ~_2118;
    int _2224 = _2222 + _2216;
    int _2226 = _2224 + 1;
    bool _2228 = !_2220;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = ~_2204;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = abs(_2230);
    int _2240 = _2236 * as_type<int>(_2092);
    int _2242 = _2240 + _2218;
    bool _2244 = !_1452;
    int _2246 = _2244 ? 0 : 1;
    int _2248 = ~_2156;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = _1936 * _1936;
    int _2256 = abs(_2246);
    float _2258 = fma(_1968, _1968, _2254);
    float _2260 = _1039 + (-0.5);
    int _2262 = _2252 * as_type<int>(_2132);
    int _2264 = _2262 + _2242;
    int _2266 = ~_2238;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    float _2272 = fma(_1990, _1990, _2258);
    float _2274 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2208);
    int _2276 = _935 * _2226;
    int _2278 = _2276 + _1224;
    int _2280 = ~_2256;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    int _2286 = _2270 * as_type<int>(_2140);
    int _2288 = _2286 + _2264;
    float _2290 = _2258;
    float _2292 = _2150;
    if (_2160)
    {
        _2290 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2294 = _2290;
    float _2296 = rsqrt(_2272);
    bool _2298 = !_1634;
    int _2300 = _2298 ? _2278 : (-1);
    int _2302 = _2288 * _2284;
    bool _2304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2306 = isnan(1.0);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2312 = _2308 || _2310;
    int _2314 = as_type<int>(_2294);
    if (_2160)
    {
        float _2316 = _2294 * 5.0;
        _2314 = as_type<int>(_2316);
    }
    int _2318 = _2314;
    int _2320 = _2300 * _2256;
    int _2322 = _2320 + _2302;
    float _2324 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2326 = !_2312;
    float _2328 = _2326 ? _123 : _1892;
    float _2330 = _1041 + (-0.5);
    bool _2332 = !_1510;
    int _2334 = _2332 ? 0 : 1;
    if (_2160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7083 = as_type<float>(_2318);
        out.gl_Position.z = _7083;
    }
    float _2336 = float(_2322);
    float _2338 = fma(_2328, _2158, _2274);
    int _2340 = abs(_2334);
    float _2342 = _2324 * _2296;
    out.m_66.y = _2336;
    float _2344 = _1968 * _2342;
    float _2346 = _1936 * _2342;
    if (_2160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2348 = -_2346;
    float _2350 = _1582 + _2348;
    float _2352 = _1990 * _2342;
    float _2354 = -_2344;
    float _2356 = _1596 + _2354;
    float _2358 = float(_2340);
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2362 = _2350 + _2360;
    float _2364 = -_2352;
    float _2366 = _1622 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2370 = _2356 + _2368;
    float _2372 = float(_1480);
    float _2374 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2378 = _2366 + _2376;
    float _2380 = _1043 + _1039;
    float _2382 = -_2346;
    float _2384 = _1936 + _2382;
    float _2386 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2374);
    float _2388 = _2358 * _2372;
    float _2390 = _2380 + (-1.0);
    float _2392 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2212);
    float _2394 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2386);
    float _2396 = -_2344;
    float _2398 = _1968 + _2396;
    float _2400 = _2384 * _2384;
    float _2402 = _2388 * (-2.0);
    float _2404 = fma(_2328, _2030, _2392);
    bool _2406 = _2394 >= 0.0;
    float _2408 = fma(_2398, _2398, _2400);
    float _2410 = -_2352;
    float _2412 = _1990 + _2410;
    float _2414 = _1043 + (-0.5);
    float _2416 = _2404 * 0.15915493667125701904296875;
    float _2418 = _2338 * 0.15915493667125701904296875;
    float _2420 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2422 = fma(_2402, _2150, _2150);
    float _2424 = fma(_2412, _2412, _2408);
    float _2426 = _2418 * 6.283185482025146484375;
    float _2428 = sin(_2426);
    float _2430 = fma(_2420, _2402, _2420);
    float _2432 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2422);
    int _2434 = as_type<int>(_2414);
    float _2436 = _2416;
    float _2438 = _2370;
    float _2440 = _2356;
    float _2442 = _2366;
    if (_2406)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2444 = _2292;
    if (_2406)
    {
        out.m_45.x = 0.0;
    }
    float _2446 = fma(_2328, _2430, _2432);
    float _2448 = _2418 * 6.283185482025146484375;
    float _2450 = cos(_2448);
    if (_2406)
    {
        float _2452 = _2444 * 5.0;
        _2434 = as_type<int>(_2452);
    }
    int _2454 = _2434;
    float _2456 = _2446 * 0.15915493667125701904296875;
    if (_2406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7278 = as_type<float>(_2454);
        out.gl_Position.z = _7278;
    }
    float _2458 = _2416 * 6.283185482025146484375;
    float _2460 = sin(_2458);
    float _2462 = sqrt(_2424);
    float _2464 = _2416 * 6.283185482025146484375;
    float _2466 = cos(_2464);
    if (_2406)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2468 = _2456 * 6.283185482025146484375;
    float _2470 = cos(_2468);
    float _2472 = _2296 * _2462;
    float _2474 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2478 = _2450 * _2466;
    float _2480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2482 = _2472 * _2474;
    float _2484 = _927 * _2472;
    float _2486 = _2456 * 6.283185482025146484375;
    float _2488 = sin(_2486);
    float _2490 = _2476 * _2482;
    float _2492 = _2428 * _2460;
    float _2494 = _2470 * _2490;
    float _2496 = _2480 * _2484;
    float _2498 = _2450 * _2460;
    float _2500 = _2428 * _2466;
    float _2502 = _2450 * _2494;
    float _2504 = _2460 * _2470;
    float _2506 = _2466 * _2470;
    float _2508 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2510 = _2508 * 0.5;
    float _2512 = fma(_2488, _2478, _2492);
    float _2514 = -_2490;
    float _2516 = _2488 * _2514;
    float _2518 = _2428 * _2494;
    float _2520 = fma(_2488, _2492, _2478);
    float _2522 = fma(_2512, _2496, _2502);
    float _2524 = -_2500;
    float _2526 = fma(_2488, _2498, _2524);
    float _2528 = -_2498;
    float _2530 = fma(_2488, _2500, _2528);
    float _2532 = fma(_2506, _2496, _2516);
    float _2534 = fma(_2526, _2510, _2522);
    float _2536 = fma(_2530, _2496, _2518);
    float _2538 = fma(_2504, _2510, _2532);
    float _2540 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2542 = fma(_2520, _2510, _2536);
    float _2544 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2546 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2540);
    float _2548 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2544);
    float _2550 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2548);
    float _2554 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2556 = _2552 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2558 = _1622 + _2554;
    float _2560 = _1596 + _2556;
    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2564 = _2558 + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2568 = _2560 + _2566;
    float _2570 = _2564 * _2564;
    float _2572 = fma(_2568, _2568, _2570);
    float _2574 = _2534 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2576 = sqrt(_2572);
    float _2578 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2574);
    float _2580 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2578);
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2584 = _1582 + _2582;
    bool _2586 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2588 = _2582;
    float _2590 = _2560;
    float _2592 = _2500;
    float _2594 = _2564;
    if (!_2586)
    {
        _2588 = _2560;
    }
    float _2596 = _2588;
    float _2598 = _2596;
    if (!_2586)
    {
        _2590 = _2558;
    }
    float _2600 = _2590;
    float _2602 = _2600;
    if (!_2586)
    {
        _2592 = _2584;
    }
    float _2604 = _2592;
    bool _2606 = !_2586;
    float _2608 = _2604;
    if (!_2606)
    {
        float _2610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2614 = _2576 + _2612;
        float _2616 = rsqrt(_2572);
        float _2618 = _2614 * _2610;
        float _2620 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2622 = _2618 * 0.15915493667125701904296875;
        float _2624 = _2622 * 6.283185482025146484375;
        float _2626 = cos(_2624);
        float _2628 = _2622 * 6.283185482025146484375;
        float _2630 = sin(_2628);
        float _2632 = _2626 + (-1.0);
        float _2634 = fma(_2630, _2620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2636 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2638 = _2616 * _2634;
        float _2640 = fma(_2584, _2626, _2636);
        float _2642 = fma(_2568, _2638, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2644 = fma(_2564, _2638, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2608 = _2640;
        _2598 = _2642;
        _2602 = _2644;
    }
    float _2646 = _2608;
    float _2648 = _2598;
    float _2650 = _2602;
    float _2652 = -_1582;
    float _2654 = _2652 + _2646;
    float _2656 = -_1596;
    float _2658 = _2656 + _2648;
    float _2660 = -_1622;
    float _2662 = _2660 + _2650;
    float _2664 = _2654 * _2654;
    float _2666 = fma(_2658, _2658, _2664);
    float _2668 = fma(_2662, _2662, _2666);
    float _2670 = sqrt(_2668);
    bool _2672 = _2670 > 0.0;
    float _2674 = _2670;
    float _2676 = _2650;
    float _2678 = _2646;
    float _2680 = _2654;
    float _2682 = _2668;
    if (!_2672)
    {
        _2674 = _2648;
    }
    float _2684 = _2674;
    bool _2686 = !_2672;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2694 = _2568;
        if (_2692)
        {
            float _2696 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2694 = _2696;
        }
        float _2698 = _2694;
        float _2700 = _2698;
        if (_2692)
        {
            float _2702 = _465 * _2698;
            _2436 = _2702;
        }
        float _2704 = _2436;
        float _2706 = _2704;
        if (_2692)
        {
            float _2708 = _467 * _2698;
            _2594 = _2708;
        }
        float _2710 = _2594;
        float _2712 = _2710;
        if (_2692)
        {
            float _2714 = _469 * _2698;
            _2700 = _2714;
        }
        float _2716 = _2700;
        float _2718 = _2716;
        if (!_2692)
        {
            bool _2720 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2724 = _2720 || _2722;
            bool _2726 = isnan(1.0);
            bool _2728 = _2724 || _2726;
            float _2730 = _123 + 1.0;
            if (!_2728)
            {
                float _2732 = _2730 * _2730;
                float _2734 = _2732 * 0.5;
                _125 = _2734;
            }
            float _2736 = _125;
            float _2738 = _2736;
            if (!_2728)
            {
                float _2740 = _2736 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2738 = _2740;
            }
            float _2742 = _2738;
            bool _2744 = !_2728;
            float _2746 = _2742;
            if (!_2744)
            {
                float _2748 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2750 = log2(_2748);
                float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2754 = 1.0 + _2752;
                float _2756 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2758 = _2750 * _2730;
                float _2760 = 1.0 / _2754;
                float _2762 = _2756 * 0.693147182464599609375;
                float _2764 = exp2(_2758);
                float _2766 = 1.0 / _2762;
                float _2768 = _2764 + (-1.0);
                float _2770 = -_2768;
                float _2772 = fma(_2770, _2766, _2730);
                float _2774 = _2772 * _2760;
                float _2776 = _2774 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2746 = _2776;
            }
            float _2778 = _2746;
            float _2780 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2782 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2784 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2786 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2788 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2790 = _2780 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2792 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2786);
            float _2794 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2788);
            float _2796 = _2788;
            _2688 = _2784;
            if (!_2728)
            {
                _2796 = _2730;
            }
            float _2798 = _2796;
            float _2800 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2792);
            bool _2802 = !_2728;
            float _2804 = _2798;
            if (!_2802)
            {
                float _2806 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2808 = log2(_2806);
                float _2810 = _2808 * _2730;
                float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2814 = 1.0 + _2812;
                float _2816 = exp2(_2810);
                float _2818 = 1.0 / _2814;
                float _2820 = -_2816;
                float _2822 = _2820 + 1.0;
                float _2824 = _2822 * _2818;
                _2804 = _2824;
            }
            float _2826 = _2804;
            float _2828 = fma(_2782, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2790);
            float _2830 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2794);
            float _2832 = fma(_2826, _163, _2800);
            float _2834 = fma(_2784, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2828);
            float _2836 = fma(_2826, _161, _2830);
            float _2838 = -_427;
            float _2840 = _2838 + _2832;
            float _2842 = fma(_2826, _165, _2834);
            float _2844 = -_433;
            float _2846 = _2844 + _2836;
            float _2848 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2850 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2852 = _2840 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2854 = -_439;
            float _2856 = _2854 + _2842;
            float _2858 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2848);
            float _2860 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2850);
            float _2862 = fma(_2846, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2852);
            float _2864 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2858);
            float _2866 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2860);
            float _2868 = fma(_2856, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2862);
            _473 = _2866;
            _475 = _2864;
            _477 = _2868;
            _2706 = _2864;
            _2712 = _2866;
            _2718 = _2868;
        }
        float _2870 = _473;
        float _2872 = _475;
        float _2874 = _477;
        float _2876 = _2706;
        float _2878 = _2712;
        float _2880 = _2718;
        float _2882 = _2688;
        float _2884 = _2870 * _2870;
        float _2886 = rsqrt(_2668);
        float _2888 = fma(_2872, _2872, _2884);
        float _2890 = fma(_2874, _2874, _2888);
        float _2892 = sqrt(_2890);
        float _2894 = _2658 * _2886;
        float _2896 = _2654 * _2886;
        float _2898 = _2662 * _2886;
        bool _2900 = _2892 > 0.0;
        float _2902 = _2882;
        if (!_2900)
        {
            _2902 = _2648;
        }
        float _2904 = _2902;
        bool _2906 = !_2900;
        _2690 = _2904;
        if (!_2906)
        {
            float _2908 = rsqrt(_2890);
            float _2910 = _2908 * _2870;
            float _2912 = _2908 * _2872;
            float _2914 = _2908 * _2874;
            float _2916 = _2896 * _2910;
            float _2918 = fma(_2894, _2912, _2916);
            float _2920 = fma(_2898, _2914, _2918);
            float _2922 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2924 = fma(_2876, _2922, _2648);
            float _2926 = fma(_2878, _2922, _2646);
            float _2928 = fma(_2880, _2922, _2650);
            _2676 = _2928;
            _2690 = _2924;
            _2678 = _2926;
        }
    }
    float _2930 = _2676;
    float _2932 = _2690;
    float _2934 = _2678;
    float _2936 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2938 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2946 = _2942 || _2944;
    float _2948 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2936);
    bool _2950 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2952 = isnan(0.5);
    bool _2954 = _2950 || _2952;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2958 = _2954 || _2956;
    float _2960 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2948);
    float _2962 = _2350 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2964 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2966 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2962);
    float _2968 = 1.0 / _2964;
    float _2970 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2966);
    float _2972 = _2930;
    if (_2958)
    {
        _2680 = 1.0;
    }
    float _2974 = _2680;
    float _2976 = _2970 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2978 = _2976 + _2964;
    float _2980 = -_2352;
    float _2982 = _2980 + _2930;
    float _2984 = _2978 * _2968;
    float _2986 = _2984 * 0.5;
    float _2988 = -_2344;
    float _2990 = _2988 + _2932;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2994 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2992);
    float _2996 = -_2346;
    float _2998 = _2996 + _2934;
    float _3000 = 1.0 / _2994;
    float _3002 = _2998;
    float _3004 = _2990;
    float _3006 = _2982;
    float _3008 = _2974;
    if (!_2946)
    {
        float _3010 = _2362 * _2362;
        float _3012 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3014 = -_1622;
        float _3016 = _3014 + _2930;
        float _3018 = -_1582;
        float _3020 = _3018 + _2934;
        float _3022 = fma(_2370, _2370, _3010);
        float _3024 = fma(_2378, _2378, _3022);
        float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3028 = sqrt(_3024);
        float _3030 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3032 = 1.0 / _2472;
        float _3034 = precise::min(_3028, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3036 = _3034 * _3026;
        float _3038 = _3036 * _3032;
        float _3040 = -_1596;
        float _3042 = _3040 + _2932;
        float _3044 = _3030 * _3038;
        float _3046 = _3016 * _3038;
        float _3048 = fma(_3042, _3044, _2356);
        float _3050 = fma(_3020, _3044, _2350);
        float _3052 = fma(_3030, _3046, _2366);
        _3002 = _3050;
        _3004 = _3048;
        _3006 = _3052;
        _2438 = _3028;
        _2972 = _3046;
    }
    float _3054 = _3002;
    float _3056 = _3004;
    float _3058 = _3006;
    float _3060 = _2438;
    float _3062 = _2972;
    float _3064 = _3062;
    float _3066 = _3060;
    if (_2958)
    {
        _3064 = 1.0;
    }
    float _3068 = _3064;
    float _3070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3072 = _3000 * _3070;
    float _3074 = _3068;
    if (!_2958)
    {
        float _3076 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3078 = _3076 * 0.15915493667125701904296875;
        float _3080 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3082;
        float _3086 = _3078 * 6.283185482025146484375;
        float _3088 = cos(_3086);
        float _3090 = _3080 * 0.15915493667125701904296875;
        float _3092 = _3078 * 6.283185482025146484375;
        float _3094 = sin(_3092);
        float _3096 = 1.0 / _3088;
        float _3098 = _3090 * 6.283185482025146484375;
        float _3100 = cos(_3098);
        float _3102 = _3094 * _3096;
        float _3104 = _3090 * 6.283185482025146484375;
        float _3106 = sin(_3104);
        float _3108 = _3100 * _3102;
        float _3110 = 1.0 / _3084;
        float _3112 = 1.0 / _3108;
        float _3114 = _3106 * _3112;
        float _3116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3118 = fma(_3072, _3114, _3116);
        float _3120 = _3118 * _3110;
        float _3122 = precise::clamp(_3120, 0.0, 1.0);
        _2440 = _3090;
        _2442 = _3078;
        _3008 = _3122;
    }
    float _3124 = _2440;
    float _3126 = _2442;
    float _3128 = _3008;
    float _3130 = _3124;
    float _3132 = _3126;
    if (!_2958)
    {
        float _3134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3136 = _3134 * 0.15915493667125701904296875;
        float _3138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3140 = _3136 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        float _3144 = _3138 * 0.15915493667125701904296875;
        float _3146 = _3136 * 6.283185482025146484375;
        float _3148 = sin(_3146);
        float _3150 = 1.0 / _3142;
        float _3152 = _3144 * 6.283185482025146484375;
        float _3154 = cos(_3152);
        float _3156 = _3148 * _3150;
        float _3158 = _3144 * 6.283185482025146484375;
        float _3160 = sin(_3158);
        float _3162 = _3154 * _3156;
        float _3164 = 1.0 / _3162;
        float _3166 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3168 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3166;
        float _3170 = 1.0 / _3168;
        float _3172 = _3160 * _3164;
        float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3176 = fma(_3072, _3172, _3174);
        float _3178 = _3176 * _3170;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        float _3182 = -_3180;
        float _3184 = _3182 + 1.0;
        _3130 = _3142;
        _3074 = _3184;
    }
    float _3186 = _3130;
    float _3188 = _3074;
    float _3190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3192 = _3054 + _3190;
    float _3194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3196 = _3056 + _3194;
    float _3198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3200 = _3058 + _3198;
    float _3202 = _3192 * _3192;
    float _3204 = fma(_3196, _3196, _3202);
    float _3206 = fma(_3200, _3200, _3204);
    float _3208 = rsqrt(_3206);
    float _3210 = sqrt(_3206);
    float _3212 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3214 = _3196 * _3212;
    float _3216 = _3200 * _3212;
    float _3218 = _3214 * _3214;
    float _3220 = _3216 * _3216;
    float _3222 = _3218 + _3220;
    float _3224 = sqrt(_3222);
    bool _3226 = _3224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3230 = _3224 + _3228;
    float _3232 = _3200;
    float _3234 = _3208;
    float _3236 = _3230;
    float _3238 = _3212;
    if (_3226)
    {
        float _3240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3232 = _3240;
    }
    float _3242 = _3232;
    if (_3226)
    {
        float _3244 = rsqrt(_3222);
        _3234 = _3244;
    }
    float _3246 = _3234;
    float _3248 = _3246;
    if (_3226)
    {
        float _3250 = _3230 * _3242;
        _3236 = _3250;
    }
    float _3252 = _3236;
    if (_3226)
    {
        float _3254 = _3252 * 0.15915493667125701904296875;
        _3132 = _3254;
    }
    float _3256 = _3132;
    float _3258 = _3242;
    if (_3226)
    {
        float _3260 = _3256 * 6.283185482025146484375;
        float _3262 = sin(_3260);
        _3258 = _3262;
    }
    float _3264 = _3258;
    float _3266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3268 = precise::max(0.0, _3266);
    float _3270 = _3186;
    float _3272 = _3268;
    if (_3226)
    {
        float _3274 = _3256 * 6.283185482025146484375;
        float _3276 = cos(_3274);
        _3270 = _3276;
    }
    float _3278 = _3270;
    float _3280 = -_3212;
    float _3282 = -_3268;
    float _3284 = fma(_3192, _3280, _3282);
    float _3286 = _3284;
    if (_3226)
    {
        float _3288 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3272 = _3288;
    }
    float _3290 = _3272;
    float _3292 = _3264;
    float _3294 = _3290;
    if (_3226)
    {
        float _3296 = fma(_3264, _3290, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3238 = _3296;
    }
    float _3298 = _3238;
    float _3300 = _3298;
    if (!_3226)
    {
        _3292 = _3284;
    }
    float _3302 = _3292;
    float _3304 = _3302;
    if (_3226)
    {
        float _3306 = _3278 + (-1.0);
        _3294 = _3306;
    }
    float _3308 = _3294;
    float _3310 = _3308;
    if (_3226)
    {
        float _3312 = _3246 * _3298;
        _2682 = _3312;
    }
    float _3314 = _2682;
    if (!_3226)
    {
        _3248 = _3214;
    }
    float _3316 = _3248;
    float _3318 = _3316;
    if (_3226)
    {
        float _3320 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3066 = _3320;
    }
    float _3322 = _3066;
    if (_3226)
    {
        float _3324 = _3214 * _3314;
        _3318 = _3324;
    }
    float _3326 = _3318;
    if (!_3226)
    {
        _3310 = _3216;
    }
    float _3328 = _3310;
    float _3330 = _3328;
    if (_3226)
    {
        float _3332 = _3216 * _3314;
        _3330 = _3332;
    }
    float _3334 = _3330;
    if (!_3226)
    {
        _3300 = _3218;
    }
    float _3336 = _3300;
    float _3338 = _3336;
    if (_3226)
    {
        float _3340 = fma(_3284, _3278, _3322);
        _3304 = _3340;
    }
    float _3342 = _3304;
    if (_3226)
    {
        float _3344 = _3326 * _3326;
        _3338 = _3344;
    }
    float _3346 = _3338;
    if (!_3226)
    {
        _3286 = _3220;
    }
    float _3348 = _3286;
    float _3350 = _3348;
    if (_3226)
    {
        float _3352 = _3334 * _3334;
        _3350 = _3352;
    }
    float _3354 = _3350;
    float _3356 = fma(_3342, _3342, _3346);
    float _3358 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3360 = _3356 + _3354;
    float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3364 = fma(_3210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3362);
    float _3366 = precise::clamp(_3364, 0.0, 1.0);
    float _3368 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3358);
    float _3370 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3372 = rsqrt(_3360);
    float _3374 = -_3366;
    float _3376 = _3374 + 1.0;
    float _3378 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3380 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3368);
    float _3382 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3384 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3370);
    float _3386 = _3054 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3388 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3390 = abs(_3376);
    float _3392 = log2(_3390);
    float _3394 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3382);
    float _3396 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3384);
    float _3398 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3386);
    float _3400 = _3388 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3402 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3394);
    float _3404 = _3396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3406 = fma(_3058, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3398);
    float _3408 = _3372 * _3326;
    float _3410 = -_3400;
    float _3412 = fma(_3410, _3378, 1.0);
    float _3414 = _3402 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3416 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3418 = _3372 * _3342;
    float _3420 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3422 = _3406 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3424 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3416);
    float _3426 = _3372 * _3334;
    float _3428 = -_3420;
    float _3430 = fma(_3418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3428);
    float _3432 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3434 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3424);
    float _3436 = log2(_3412);
    float _3438 = -_3426;
    float _3440 = fma(_3438, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3430);
    float _3442 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3444 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3434);
    float _3446 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3448 = fma(_3440, -0.5, 0.5);
    float _3450 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3442);
    float _3452 = fma(_3440, 0.5, 0.5);
    float _3454 = exp2(_3432);
    float _3456 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3446);
    float _3458 = _3418 + 1.0;
    float _3460 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3450);
    float _3462 = fma(_3452, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3464 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3456);
    float _3466 = 1.0 / _3444;
    float _3468 = fma(_3452, _3462, -0.212114393711090087890625);
    float _3470 = _3436 * 0.693147182464599609375;
    float _3472 = fma(_3452, _3468, 1.570728778839111328125);
    float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3476 = sqrt(_3448);
    float _3478 = -_3418;
    float _3480 = fma(_3454, _3458, _3478);
    float _3482 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3484 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3464);
    float _3486 = _3482 * _3466;
    float _3488 = _3484 * _3466;
    float _3490 = fma(_3486, 0.5, 0.5);
    float _3492 = fma(_3488, -0.5, 0.5);
    float _3494 = fma(_3480, 0.5, 0.5);
    float _3496 = _3476 * 0.636619746685028076171875;
    float _3498 = -_3472;
    float _3500 = fma(_3496, _3498, 1.0);
    float3 _8906 = float3(_3490, _3492, _3474);
    float _3502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8906, float3(0.0), isnan(_8906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8906, float3(0.0), isnan(_8906)), level(0.0)).x;
    float3 _8917 = float3(_3490, _3492, _3474);
    float4 _3505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8917, float3(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8917, float3(0.0), isnan(_8917)), level(0.0)).xyzw;
    float _3507 = _3505.x;
    float _3509 = _3505.y;
    float _3511 = _3505.z;
    float _3513 = _3505.w;
    float2 _8934 = float2(_3500, _3494);
    float3 _3517 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8934, float2(0.0), isnan(_8934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8934, float2(0.0), isnan(_8934)), level(0.0)).xyz;
    float _3519 = _3517.x;
    float _3521 = _3517.y;
    float _3523 = _3517.z;
    float _3525 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3527 = _3404 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3529 = _3128 > 0.0;
    bool _3531 = isnan(_3128);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan(0.0);
    bool _3537 = _3533 || _3535;
    float _3539 = fma(_3414, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3527);
    float _3541 = exp2(_3525);
    bool _3543 = _3188 <= 0.0;
    bool _3545 = !_3537;
    bool _3547 = _3543 || _3545;
    float _3549 = _3444 * 0.5;
    float _3551 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3539);
    float _3553 = _3482 + _3444;
    float _3555 = fma(_3484, -0.5, _3549);
    float _3557 = fma(_3422, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3551);
    float _3559 = _3553 * 0.5;
    float _3561 = _3128 * _3188;
    float _3563 = _3557 + _3444;
    out.gl_Position.x = _3482;
    out.gl_Position.y = _3484;
    out.gl_Position.z = _3557;
    out.gl_Position.w = _3444;
    float _3565 = _3561 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3567 = _3563 * 0.5;
    float _3569 = -_3541;
    float _3571 = _3569 + 1.0;
    float _3573 = _3565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3575 = _3571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3559;
    out.m_68.y = _3555;
    out.m_68.z = _3567;
    out.m_68.w = _3444;
    out.m_45.x = _3573;
    float _3577 = _3575 * _3502;
    float _3579 = -_3575;
    float _3581 = _3579 + 1.0;
    float _3583 = _3513 * _3577;
    float _3585 = _3523 * _3577;
    float _3587 = _3513 * _3581;
    float _3589 = fma(_3519, _3583, _3507);
    float _3591 = fma(_3521, _3583, _3509);
    float _3593 = fma(_3513, _3585, _3511);
    out.m_70.x = _3589;
    out.m_70.y = _3591;
    out.m_70.z = _3593;
    out.m_70.w = _3587;
    if (!_3547)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3595 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3595;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

