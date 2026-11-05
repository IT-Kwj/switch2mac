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
    bool _859 = false;
    bool _745 = false;
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
        float _3606 = as_type<float>(_105);
        out.gl_Position.z = _3606;
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
        float _3676 = as_type<float>(_143);
        out.gl_Position.z = _3676;
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
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _505 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = 1.0 / _517;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = 1.0 / _525;
    float _537 = 1.0 / _521;
    float _539 = _509 * _531;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = _505 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _505 + _545;
    bool _549 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _551 = isnan(_505);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _529;
    float _563 = _543 * _535;
    bool _565 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _567 = isnan(_505);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _577;
    float _581 = _513 * _537;
    bool _583 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _585 = isnan(_505);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_579, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = -_593;
    float _603 = _601 + 1.0;
    float _605 = _547 * _561;
    float _607 = -_575;
    float _609 = _607 + 1.0;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _611;
    float _615 = _559 * _603;
    bool _617 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_505);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _593 * _609;
    bool _631 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _633 = isnan(_505);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _647 = -_559;
    float _649 = _647 + 1.0;
    float _651 = fma(_613, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _653 = fma(_599, _581, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = fma(_645, _581, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _657 = _641 * _649;
    float _659 = -_641;
    float _661 = _659 + 1.0;
    float _663 = -_627;
    float _665 = _663 + 1.0;
    float _667 = in.m_52.x;
    float _669 = in.m_52.y;
    float _671 = _627 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _677;
    float _681 = _595 * _671;
    float _683 = _651 * _671;
    float _685 = fma(_675, _563, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _687 = fma(_679, _563, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _689 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _681);
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _683);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _701 = fma(_653, _657, _689);
    float _703 = fma(_655, _657, _691);
    float _705 = fma(_695, _605, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _707 = fma(_699, _605, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _709 = fma(_685, _615, _701);
    float _711 = fma(_687, _615, _703);
    float _713 = fma(_705, _629, _709);
    float _715 = fma(_707, _629, _711);
    float _717 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[147].x, _713);
    float _719 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[147].y, _715);
    float _721 = _717 * _667;
    float _723 = _719 * _669;
    bool _725 = !_533;
    float _743;
    if (!_725)
    {
        float _727 = in.m_54.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_89);
        float _749 = 1.0 / _747;
        float _751 = _123 * _749;
        _743 = _751;
    }
    _745 = false;
    float _753 = _743;
    bool _755 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _757 = isnan(_753);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _771 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _773 = isnan(_753);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _789 = _753 + _787;
    float _791 = -_765;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _769;
    float _797 = _781 * _793;
    float _799 = -_781;
    float _801 = _799 + 1.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _785 * _795;
    float _819 = fma(_817, _789, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _821 = _819 * _797;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[115].x, _821);
    float _825 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[116].x, _823);
    float _827 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _811;
    out.m_56.y = _813;
    out.m_56.z = _815;
    out.m_56.w = _827;
    bool _829 = !_807;
    float _853;
    float _855;
    float _857;
    if (!_829)
    {
        float _831 = in.m_54.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _835 = float(_89);
        float _837 = 1.0 / _835;
        float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _841 = _123 * _837;
        float _843 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _845 = _843 * _833;
        float _847 = floor(_845);
        float _849 = -_847;
        float _851 = _845 + _849;
        _853 = _841;
        _855 = _851;
        _857 = _835;
        _859 = true;
    }
    else
    {
        float _861 = float(_89);
        float _863 = 1.0 / _861;
        float _865 = _123 * _863;
        _853 = _865;
        _855 = _865;
        _857 = _861;
    }
    _859 = false;
    float _867 = _853;
    float _869 = _855;
    float _871 = _857;
    float _873 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _875 = int(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _879 = _867 + _877;
    float _881 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _883;
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _889 = int(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _903 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _905 = isnan(_869);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = 1.0 / _885;
    float _917 = float(_875);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _919;
    bool _923 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _925 = isnan(_867);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    bool _935 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _937 = isnan(_867);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = 1.0 / _917;
    float _949 = float(uint(_889));
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _953 = ~_889;
    int _955 = _953 + 1;
    float _957 = float(_889);
    bool _959 = _889 == 0;
    float _961 = 1.0 / _949;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _965 = _123 * _947;
    int _967 = ~_889;
    int _969 = _967 + 1;
    float _971 = 1.0 / _893;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _977 = _975 != 0;
    int _979 = as_type<int>(_961) + (-2);
    float _981 = trunc(_965);
    int _983 = int(_981);
    float _985 = 1.0 / _897;
    float _987 = float(uint(_983));
    float _989 = 1.0 / _901;
    float _991 = as_type<float>(_979) * _987;
    float _993 = in.m_54.x;
    float _995 = in.m_54.y;
    float _997 = in.m_54.z;
    float _999 = in.m_54.w;
    float _1001 = trunc(_991);
    float _1003 = precise::max(_1001, 0.0);
    uint _1006 = uint(_1003);
    float _1008 = float(_983);
    int _1010 = _969 * int(_1006);
    int _1012 = _1010 + _983;
    float _1014 = float(uint(_1012));
    float _1016 = _995 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1018 = !_977;
    float _1020 = _1018 ? _995 : _993;
    float _1022 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[79].z, _951);
    float _1024 = 0.0;
    if (!_977)
    {
        _1024 = _997;
    }
    float _1026 = _1024;
    float _1028 = as_type<float>(_979) * _1014;
    float _1030 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1022);
    float _1032 = _1026;
    if (_977)
    {
        _1032 = _995;
    }
    float _1034 = _1032;
    float _1036 = -_933;
    float _1038 = _1036 + 1.0;
    bool _1040 = !_977;
    float _1042 = _1040 ? 1.2345600128173828125 : 1.0;
    float _1044 = trunc(_1028);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    float _1050 = _1030 * (-0.15915493667125701904296875);
    float _1052 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1054 = _1042 * _1020;
    float _1056 = floor(_1054);
    int _1058 = int(_1006) + int(_1048);
    bool _1060 = _1008 >= _957;
    bool _1062 = isnan(_1008);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(_957);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    int _1072 = _955 * _1058;
    int _1074 = _1072 + _983;
    float _1076 = 1.0 / _871;
    float _1078 = -_1056;
    float _1080 = _1054 + _1078;
    bool _1082 = uint(_1074) >= uint(_889);
    float _1084 = trunc(_1070);
    int _1086 = int(_1084);
    bool _1088 = !_1082;
    int _1090 = _1088 ? 0 : (-1);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1106 = _1104 != 0;
    int _1108 = ~_1058;
    int _1110 = _1108 + _1090;
    int _1112 = _1110 + 1;
    float _1114 = _1080 * _957;
    float _1116 = _123 * _957;
    bool _1118 = !_1098;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _889 * _1112;
    int _1124 = _1122 + _983;
    float _1126 = _1116 * _1076;
    float _1128 = trunc(_1114);
    int _1130 = int(_1128);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1134 = _1132 != 0;
    bool _1136 = !_959;
    int _1138 = _1136 ? _1124 : (-1);
    int _1140 = ~_1086;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    int _1146 = _889 + (-1);
    float _1148 = trunc(_1126);
    int _1150 = int(_1148);
    bool _1152 = !_1134;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1138 * _1144;
    int _1158 = abs(_1120);
    bool _1160 = !_1102;
    int _1162 = _1160 ? 0 : 1;
    int _1164 = _1086 * _1146;
    int _1166 = _1164 + _1156;
    bool _1168 = !_1094;
    int _1170 = _1168 ? 0 : 1;
    int _1172 = abs(_1154);
    int _1174 = abs(_1170);
    int _1176 = _1130 * _1172;
    int _1178 = _1176 + _983;
    bool _1180 = !_1106;
    int _1182 = _1180 ? 0 : 1;
    int _1184 = abs(_1162);
    int _1186 = _1166 * _1158;
    int _1188 = abs(_1182);
    int _1190 = _1150 * _1174;
    int _1192 = _1190 + _1186;
    float _1194 = _993 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1196 = _1178 * _1184;
    int _1198 = _1196 + _1192;
    int _1200 = ~_889;
    int _1202 = _1200 + 1;
    int _1204 = _1130 * _1188;
    int _1206 = _1204 + _1198;
    float _1208 = as_type<float>(_1130);
    if (!_977)
    {
        _1208 = _995;
    }
    float _1210 = _1208;
    float _1212 = _1210;
    if (_977)
    {
        _1212 = _993;
    }
    float _1214 = _1212;
    float _1216 = float(uint(_1206));
    float _1218 = as_type<float>(_979) * _1216;
    float _1220 = trunc(_1218);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    int _1226 = _1202 * int(_1224);
    int _1228 = _1226 + _1206;
    float _1230 = float(uint(_1228));
    float _1232 = as_type<float>(_979) * _1230;
    int _1234 = ~_889;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1232);
    float _1240 = precise::max(_1238, 0.0);
    uint _1242 = uint(_1240);
    int _1244 = int(_1224) + int(_1242);
    int _1246 = _1236 * _1244;
    int _1248 = _1246 + _1206;
    float _1250 = _993 * 2.0;
    bool _1252 = uint(_1248) >= uint(_889);
    float _1254 = floor(_1250);
    bool _1256 = !_1252;
    int _1258 = _1256 ? 0 : (-1);
    int _1260 = ~_1244;
    int _1262 = _1260 + _1258;
    int _1264 = _1262 + 1;
    float _1266 = _995 * 2.0;
    int _1268 = _889 * _1264;
    int _1270 = _1268 + _1206;
    float _1272 = floor(_1266);
    bool _1274 = !_959;
    int _1276 = _1274 ? _1270 : (-1);
    bool _1278 = _1254 > 0.0;
    int _1280 = _1276 & 3;
    bool _1282 = _1280 != 0;
    int _1284 = _1276 & 3;
    bool _1286 = _1284 != 0;
    int _1288 = _1282 ? 0 : 1;
    bool _1290 = uint(_1284) > 1u;
    bool _1292 = _1254 >= 0.0;
    bool _1294 = isnan(_1254);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    int _1302 = ~_1288;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    float _1308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1310 = log2(_1308);
    int _1312 = _1300 ? 0 : 1;
    bool _1314 = _999 > 0.5;
    int _1316 = ~_1312;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _1320;
    int _1324 = _1306;
    if (!_1278)
    {
        int _1326 = ~_1312;
        int _1328 = _1326 + 1;
        _1322 = _1328;
    }
    int _1330 = _1322;
    float _1332 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_1290)
    {
        int _1334 = ~_1288;
        int _1336 = _1334 + 1;
        _1324 = _1336;
    }
    int _1338 = _1324;
    bool _1340 = _993 > 0.5;
    float _1342 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1332);
    bool _1344 = _995 > 0.5;
    float _1346 = -_225;
    int _1348 = _1314 ? as_type<int>(_1346) : as_type<int>(_225);
    bool _1350 = _1272 >= 0.0;
    bool _1352 = isnan(_1272);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    float _1360 = -_221;
    int _1362 = _1340 ? as_type<int>(_1360) : as_type<int>(_221);
    float _1364 = -_225;
    int _1366 = _1344 ? as_type<int>(_1364) : as_type<int>(_225);
    bool _1368 = _997 > 0.5;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1372 = _1370 != 0;
    int _1374 = _1358 ? 0 : 1;
    bool _1376 = _1272 > 0.0;
    float _1378 = -_221;
    int _1380 = _1368 ? as_type<int>(_1378) : as_type<int>(_221);
    bool _1382 = !_1372;
    float _1384 = _1382 ? _225 : as_type<float>(_1348);
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    bool _1394 = !_1388;
    float _1396 = _1394 ? _221 : as_type<float>(_1362);
    float _1398 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1400 = !_1392;
    float _1402 = _1400 ? _225 : as_type<float>(_1366);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1406 = _1404 != 0;
    float _1408 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1398);
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1412 = _1410 != 0;
    float _1414 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1416 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1408);
    int _1418 = ~_1374;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1414);
    int _1426 = _1422;
    float _1428 = _1398;
    if (!_1376)
    {
        int _1430 = ~_1374;
        int _1432 = _1430 + 1;
        _1426 = _1432;
    }
    int _1434 = _1426;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1440 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1424);
    float _1442 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1342);
    if (!_977)
    {
        _1428 = _997;
    }
    float _1444 = _1428;
    float _1446 = 1.0 / _1438;
    float _1448 = _1444;
    if (_977)
    {
        _1448 = _995;
    }
    float _1450 = _1448;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1464 = _1462 != 0;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1468 = -_1452;
    float _1470 = fma(_1194, 2.0, _1468);
    float _1472 = fma(_1016, -2.0, _1466);
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1480 = _869 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1486;
    float _1490 = _1480 * _915;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1496 = _997 * 2.0;
    float _1498 = 1.0 / _1484;
    float _1500 = _1494 * _971;
    float _1502 = _1488 * _985;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1504;
    bool _1508 = !_1412;
    float _1510 = _1508 ? _221 : as_type<float>(_1380);
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1514 = _1512 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1516 = fma(_921, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1518 = 1.0 / _1476;
    float _1520 = _1506 * _989;
    float _1522 = fma(_1500, _879, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1524 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1526 = isnan(_869);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = _1440 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1538 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1540 = isnan(_867);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1552 = floor(_1496);
    float _1554 = _123 * _1310;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1564 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1566 = isnan(_867);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = _1442 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1578 = _1558 * _1446;
    float _1580 = _995 + _993;
    float _1582 = exp2(_1554);
    float _1584 = _1580 + (-1.0);
    int _1586 = abs(_1338);
    bool _1588 = _889 == 0;
    float _1590 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1592 = 1.0 / _1514;
    bool _1594 = _1552 >= 0.0;
    bool _1596 = isnan(_1552);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan(0.0);
    bool _1602 = _1598 || _1600;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = -_1582;
    float _1618 = _1616 + 1.0;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1620;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1628;
    int _1632 = ~_1586;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    float _1638 = _1622 * _1498;
    float _1640 = _995 + _997;
    float _1642 = _1626 * _1518;
    float _1644 = fma(_1630, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1646 = _1640 + (-1.0);
    float _1648 = _1614 ? _1618 : 0.0;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1652 = _867 + _1650;
    bool _1654 = _1552 > 0.0;
    float _1656 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1660 = _867 + _1658;
    float _1662 = fma(_1638, _1652, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1666 = _867 + _1664;
    float _1668 = _1562 * _1592;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1670;
    float _1674 = fma(_1520, _1660, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1678 = _867 + _1676;
    float _1680 = fma(_1642, _1666, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1682 = fma(_1672, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1686 = _867 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1690 = _867 + _1688;
    bool _1692 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1694 = isnan(_867);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1700 = _1696 || _1698;
    float _1702 = float(_1700);
    float _1704 = fma(_1668, _1678, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1706 = fma(_1578, _1686, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1708 = fma(_1502, _1690, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1710 = -_1534;
    float _1712 = _1710 + 1.0;
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    bool _1718 = !_1460;
    int _1720 = _1718 ? 0 : 1;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1724 = _913 * _1712;
    float _1726 = _1548 * _1716;
    float _1728 = -_1548;
    float _1730 = _1728 + 1.0;
    float _1732 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1722);
    bool _1734 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1736 = isnan(_867);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1644 * _1724;
    float _1748 = _1516 * _1724;
    float _1750 = _1682 * _1724;
    bool _1752 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1754 = isnan(_867);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = _1744 * _1730;
    float _1766 = -_1744;
    float _1768 = _1766 + 1.0;
    float _1770 = -_1762;
    float _1772 = _1770 + 1.0;
    bool _1774 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1776 = isnan(_867);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = _1762 * _1768;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1790 = 1.0 + _1788;
    float _1792 = _1574 * _1772;
    float _1794 = -_1574;
    float _1796 = _1794 + 1.0;
    float _1798 = _1784 * _1038;
    float _1800 = 1.0 / _1790;
    float _1802 = -_1784;
    float _1804 = _1802 + 1.0;
    float _1806 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[83].z, _963);
    float _1808 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1812 = _945 * _1804;
    float _1814 = -_945;
    float _1816 = _1814 + 1.0;
    float _1818 = -_973;
    float _1820 = fma(_1808, 2.0, _1818);
    float _1822 = _933 * _1796;
    float _1824 = _1708 * _1812;
    float _1826 = -_913;
    float _1828 = _1826 + 1.0;
    float _1830 = fma(_1052, -2.0, _1810);
    float _1832 = _1050 * 6.283185482025146484375;
    float _1834 = sin(_1832);
    float _1836 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1824);
    float _1838 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1748);
    int _1840 = ~_1604;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    float _1846 = _1648 * _1800;
    float _1848 = fma(_1522, _1798, _1836);
    float _1850 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1746);
    float _1852 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1750);
    float _1854 = _1050 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1838);
    float _1860 = fma(_1674, _1822, _1848);
    float _1862 = float(uint(_1178));
    float _1864 = _1510 + 0.5;
    bool _1866 = !_1456;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = -_123;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1820);
    int _1874 = _1844;
    if (!_1654)
    {
        int _1876 = ~_1604;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    float _1882 = as_type<float>(_979) * _1862;
    float _1884 = _1402 * _1834;
    int _1886 = abs(_1868);
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = _1536 + _1888;
    float _1892 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1830);
    int _1894 = abs(_1720);
    float _1896 = trunc(_1882);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    bool _1902 = uint(_1284) >= 2u;
    float _1904 = _1402 * _1856;
    float _1906 = -_1884;
    float _1908 = fma(_1396, _1856, _1906);
    float _1910 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1852);
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1914 = fma(_1396, _1834, _1904);
    float _1916 = _1384 + (-0.5);
    float _1918 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1850);
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1922 = _1550 + _1920;
    float _1924 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1872);
    float _1926 = -_1916;
    float _1928 = -_1892;
    float _1930 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1928);
    float _1932 = float(_1894);
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1912);
    int _1936 = _1902 ? 0 : 1;
    float _1938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1940 = float(_1330);
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1944 = _1576 + _1942;
    int _1946 = ~_889;
    int _1948 = _1946 + 1;
    bool _1950 = _1284 != 3;
    float _1952 = _1932 * _1940;
    float _1954 = float(_1886);
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1958 = float(_1880);
    int _1960 = _1948 * int(_1900);
    int _1962 = _1960 + _1178;
    int _1964 = ~_1936;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    float _1970 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1934);
    float _1972 = _1952 * (-2.0);
    float _1974 = _1954 * _1958;
    int _1976 = _1276 >> 31;
    float _1978 = float(uint(_1962));
    float _1980 = _1974 * (-2.0);
    int _1982 = _1976 & 3;
    float _1984 = fma(_1656, _1972, _1656);
    int _1986 = _1968;
    if (_1950)
    {
        int _1988 = ~_1936;
        int _1990 = _1988 + 1;
        _1986 = _1990;
    }
    int _1992 = _1986;
    float _1994 = fma(_1706, _1792, _1860);
    int _1996 = _1276 + _1982;
    float _1998 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2000 = as_type<float>(_979) * _1978;
    float _2002 = -_123;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1470);
    int _2006 = _1996 >> 2;
    float _2008 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1472);
    float _2010 = _1918 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2012 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2014 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2016 = _1908 + 0.5;
    float _2018 = _1858 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2020 = _1914 + (-0.5);
    float _2022 = trunc(_2000);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    int _2028 = _2006 << 4;
    int _2030 = _2028 + 512;
    float _2032 = fma(_2012, _2016, _2004);
    float _2034 = -_1998;
    float _2036 = -_2008;
    float _2038 = fma(_2034, _2020, _2036);
    uint _2040 = uint(int(uint(_2030) >> uint(2)));
    uint _2042 = uint(int(uint(int(_2040)) >> uint(2)));
    int _2044 = int(_2040) & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    int _2048 = int(_2040) + 1;
    uint _2050 = uint(int(uint(_2048) >> uint(2)));
    int _2052 = _2048 & 3;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[int(_2050)][_2052];
    float _2056 = fma(_1662, _1786, _1994);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2060 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2064 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2068 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1732);
    int _2072 = int(_1900) + int(_2026);
    float _2074 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1806);
    float _2076 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2058);
    out.m_58.x = _2060;
    out.m_58.y = _2064;
    out.m_58.z = _2068;
    out.m_58.w = _2066;
    int _2078 = _2030 + 8;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[int(_2090)][_2092];
    float _2096 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2062);
    float _2098 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2076);
    float _2100 = in.m_60.x;
    float _2102 = in.m_60.y;
    float _2104 = in.m_60.z;
    float _2106 = fma(_1704, _1764, _2056);
    float _2108 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2096);
    int _2110 = abs(_1992);
    float _2112 = fma(_1590, _1980, _1590);
    bool _2114 = _1970 >= 0.0;
    float _2116 = fma(_1680, _1726, _2106);
    float _2118 = -_2074;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2070;
    float _2124 = _2122 + 1.0;
    float _2126 = -_2098;
    float _2128 = _2126 + 1.0;
    float _2130 = -_2108;
    float _2132 = _2130 + 1.0;
    float _2134 = -_2120;
    float _2136 = fma(_1510, _2134, _1924);
    int _2138 = ~_889;
    int _2140 = _2138 + 1;
    float _2142 = fma(_1384, _2124, _1930);
    bool _2144 = !_1286;
    int _2146 = _2144 ? 0 : 1;
    float _2148 = -_2128;
    float _2150 = fma(_1908, _2148, _2032);
    float _2152 = fma(_1914, _2132, _2038);
    int _2154 = _2140 * _2072;
    int _2156 = _2154 + _1178;
    int _2158 = abs(_2146);
    float _2160 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2116);
    if (_2114)
    {
        out.m_45.x = 0.0;
    }
    float _2162 = fma(_1980, _2100, _2100);
    bool _2164 = uint(_2156) >= uint(_889);
    float _2166 = fma(_1972, _2102, _2102);
    out.m_62.x = _2150;
    out.m_62.y = _2152;
    out.m_62.z = _2136;
    out.m_62.w = _2142;
    bool _2168 = !_2164;
    int _2170 = _2168 ? 0 : (-1);
    int _2172 = _1636 * as_type<int>(_2054);
    bool _2174 = _1284 != 3;
    out.m_64.x = _2160;
    int _2176 = ~_2072;
    int _2178 = _2176 + _2170;
    int _2180 = _2178 + 1;
    bool _2182 = !_2174;
    int _2184 = _2182 ? 0 : (-1);
    int _2186 = ~_2158;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = abs(_2184);
    int _2194 = _2190 * as_type<int>(_2046);
    int _2196 = _2194 + _2172;
    bool _2198 = !_1406;
    int _2200 = _2198 ? 0 : 1;
    int _2202 = ~_2110;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = _1890 * _1890;
    int _2210 = abs(_2200);
    float _2212 = fma(_1922, _1922, _2208);
    float _2214 = _993 + (-0.5);
    int _2216 = _2206 * as_type<int>(_2086);
    int _2218 = _2216 + _2196;
    int _2220 = ~_2192;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = fma(_1944, _1944, _2212);
    float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2162);
    int _2230 = _889 * _2180;
    int _2232 = _2230 + _1178;
    int _2234 = ~_2210;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = _2224 * as_type<int>(_2094);
    int _2242 = _2240 + _2218;
    float _2244 = _2212;
    float _2246 = _2104;
    if (_2114)
    {
        _2244 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2248 = _2244;
    float _2250 = rsqrt(_2226);
    bool _2252 = !_1588;
    int _2254 = _2252 ? _2232 : (-1);
    int _2256 = _2242 * _2238;
    bool _2258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2260 = isnan(1.0);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2266 = _2262 || _2264;
    int _2268 = as_type<int>(_2248);
    if (_2114)
    {
        float _2270 = _2248 * 5.0;
        _2268 = as_type<int>(_2270);
    }
    int _2272 = _2268;
    int _2274 = _2254 * _2210;
    int _2276 = _2274 + _2256;
    float _2278 = _881 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2280 = !_2266;
    float _2282 = _2280 ? _123 : _1846;
    float _2284 = _995 + (-0.5);
    bool _2286 = !_1464;
    int _2288 = _2286 ? 0 : 1;
    if (_2114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6962 = as_type<float>(_2272);
        out.gl_Position.z = _6962;
    }
    float _2290 = float(_2276);
    float _2292 = fma(_2282, _2112, _2228);
    int _2294 = abs(_2288);
    float _2296 = _2278 * _2250;
    out.m_66.y = _2290;
    float _2298 = _1922 * _2296;
    float _2300 = _1890 * _2296;
    if (_2114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2302 = -_2300;
    float _2304 = _1536 + _2302;
    float _2306 = _1944 * _2296;
    float _2308 = -_2298;
    float _2310 = _1550 + _2308;
    float _2312 = float(_2294);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2316 = _2304 + _2314;
    float _2318 = -_2306;
    float _2320 = _1576 + _2318;
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2324 = _2310 + _2322;
    float _2326 = float(_1434);
    float _2328 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2320 + _2330;
    float _2334 = _997 + _993;
    float _2336 = -_2300;
    float _2338 = _1890 + _2336;
    float _2340 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2328);
    float _2342 = _2312 * _2326;
    float _2344 = _2334 + (-1.0);
    float _2346 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2166);
    float _2348 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2340);
    float _2350 = -_2298;
    float _2352 = _1922 + _2350;
    float _2354 = _2338 * _2338;
    float _2356 = _2342 * (-2.0);
    float _2358 = fma(_2282, _1984, _2346);
    bool _2360 = _2348 >= 0.0;
    float _2362 = fma(_2352, _2352, _2354);
    float _2364 = -_2306;
    float _2366 = _1944 + _2364;
    float _2368 = _997 + (-0.5);
    float _2370 = _2358 * 0.15915493667125701904296875;
    float _2372 = _2292 * 0.15915493667125701904296875;
    float _2374 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2376 = fma(_2356, _2104, _2104);
    float _2378 = fma(_2366, _2366, _2362);
    float _2380 = _2372 * 6.283185482025146484375;
    float _2382 = sin(_2380);
    float _2384 = fma(_2374, _2356, _2374);
    float _2386 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2376);
    int _2388 = as_type<int>(_2368);
    float _2390 = _2370;
    float _2392 = _2324;
    float _2394 = _2310;
    float _2396 = _2320;
    if (_2360)
    {
        _2246 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2398 = _2246;
    if (_2360)
    {
        out.m_45.x = 0.0;
    }
    float _2400 = fma(_2282, _2384, _2386);
    float _2402 = _2372 * 6.283185482025146484375;
    float _2404 = cos(_2402);
    if (_2360)
    {
        float _2406 = _2398 * 5.0;
        _2388 = as_type<int>(_2406);
    }
    int _2408 = _2388;
    float _2410 = _2400 * 0.15915493667125701904296875;
    if (_2360)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7157 = as_type<float>(_2408);
        out.gl_Position.z = _7157;
    }
    float _2412 = _2370 * 6.283185482025146484375;
    float _2414 = sin(_2412);
    float _2416 = sqrt(_2378);
    float _2418 = _2370 * 6.283185482025146484375;
    float _2420 = cos(_2418);
    if (_2360)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2422 = _2410 * 6.283185482025146484375;
    float _2424 = cos(_2422);
    float _2426 = _2250 * _2416;
    float _2428 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2430 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2432 = _2404 * _2420;
    float _2434 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2436 = _2426 * _2428;
    float _2438 = _881 * _2426;
    float _2440 = _2410 * 6.283185482025146484375;
    float _2442 = sin(_2440);
    float _2444 = _2430 * _2436;
    float _2446 = _2382 * _2414;
    float _2448 = _2424 * _2444;
    float _2450 = _2434 * _2438;
    float _2452 = _2404 * _2414;
    float _2454 = _2382 * _2420;
    float _2456 = _2404 * _2448;
    float _2458 = _2414 * _2424;
    float _2460 = _2420 * _2424;
    float _2462 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2464 = _2462 * 0.5;
    float _2466 = fma(_2442, _2432, _2446);
    float _2468 = -_2444;
    float _2470 = _2442 * _2468;
    float _2472 = _2382 * _2448;
    float _2474 = fma(_2442, _2446, _2432);
    float _2476 = fma(_2466, _2450, _2456);
    float _2478 = -_2454;
    float _2480 = fma(_2442, _2452, _2478);
    float _2482 = -_2452;
    float _2484 = fma(_2442, _2454, _2482);
    float _2486 = fma(_2460, _2450, _2470);
    float _2488 = fma(_2480, _2464, _2476);
    float _2490 = fma(_2484, _2450, _2472);
    float _2492 = fma(_2458, _2464, _2486);
    float _2494 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2496 = fma(_2474, _2464, _2490);
    float _2498 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2500 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2494);
    float _2502 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2498);
    float _2504 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2500);
    float _2506 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2502);
    float _2508 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2510 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2512 = _1576 + _2508;
    float _2514 = _1550 + _2510;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2518 = _2512 + _2516;
    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2522 = _2514 + _2520;
    float _2524 = _2518 * _2518;
    float _2526 = fma(_2522, _2522, _2524);
    float _2528 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2530 = sqrt(_2526);
    float _2532 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2528);
    float _2534 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2532);
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2538 = _1536 + _2536;
    bool _2540 = _2530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2542 = _2536;
    float _2544 = _2514;
    float _2546 = _2454;
    float _2548 = _2518;
    if (!_2540)
    {
        _2542 = _2514;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (!_2540)
    {
        _2544 = _2512;
    }
    float _2554 = _2544;
    float _2556 = _2554;
    if (!_2540)
    {
        _2546 = _2538;
    }
    float _2558 = _2546;
    bool _2560 = !_2540;
    float _2562 = _2558;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2530 + _2566;
        float _2570 = rsqrt(_2526);
        float _2572 = _2568 * _2564;
        float _2574 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = cos(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = sin(_2582);
        float _2586 = _2580 + (-1.0);
        float _2588 = fma(_2584, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2590 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = _2570 * _2588;
        float _2594 = fma(_2538, _2580, _2590);
        float _2596 = fma(_2522, _2592, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2598 = fma(_2518, _2592, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2562 = _2594;
        _2552 = _2596;
        _2556 = _2598;
    }
    float _2600 = _2562;
    float _2602 = _2552;
    float _2604 = _2556;
    float _2606 = -_1536;
    float _2608 = _2606 + _2600;
    float _2610 = -_1550;
    float _2612 = _2610 + _2602;
    float _2614 = -_1576;
    float _2616 = _2614 + _2604;
    float _2618 = _2608 * _2608;
    float _2620 = fma(_2612, _2612, _2618);
    float _2622 = fma(_2616, _2616, _2620);
    float _2624 = sqrt(_2622);
    bool _2626 = _2624 > 0.0;
    float _2628 = _2624;
    float _2630 = _2604;
    float _2632 = _2600;
    float _2634 = _2608;
    float _2636 = _2622;
    if (!_2626)
    {
        _2628 = _2602;
    }
    float _2638 = _2628;
    bool _2640 = !_2626;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2640)
    {
        bool _2646 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2648 = _2522;
        if (_2646)
        {
            float _2650 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2648 = _2650;
        }
        float _2652 = _2648;
        float _2654 = _2652;
        if (_2646)
        {
            float _2656 = _465 * _2652;
            _2390 = _2656;
        }
        float _2658 = _2390;
        float _2660 = _2658;
        if (_2646)
        {
            float _2662 = _467 * _2652;
            _2548 = _2662;
        }
        float _2664 = _2548;
        float _2666 = _2664;
        if (_2646)
        {
            float _2668 = _469 * _2652;
            _2654 = _2668;
        }
        float _2670 = _2654;
        float _2672 = _2670;
        if (!_2646)
        {
            bool _2674 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2676 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan(1.0);
            bool _2682 = _2678 || _2680;
            float _2684 = _123 + 1.0;
            if (!_2682)
            {
                float _2686 = _2684 * _2684;
                float _2688 = _2686 * 0.5;
                _125 = _2688;
            }
            float _2690 = _125;
            float _2692 = _2690;
            if (!_2682)
            {
                float _2694 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2692 = _2694;
            }
            float _2696 = _2692;
            bool _2698 = !_2682;
            float _2700 = _2696;
            if (!_2698)
            {
                float _2702 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2704 = log2(_2702);
                float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2708 = 1.0 + _2706;
                float _2710 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2712 = _2704 * _2684;
                float _2714 = 1.0 / _2708;
                float _2716 = _2710 * 0.693147182464599609375;
                float _2718 = exp2(_2712);
                float _2720 = 1.0 / _2716;
                float _2722 = _2718 + (-1.0);
                float _2724 = -_2722;
                float _2726 = fma(_2724, _2720, _2684);
                float _2728 = _2726 * _2714;
                float _2730 = _2728 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2700 = _2730;
            }
            float _2732 = _2700;
            float _2734 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2736 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2738 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2740 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2742 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2744 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2746 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2740);
            float _2748 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2742);
            float _2750 = _2742;
            _2642 = _2738;
            if (!_2682)
            {
                _2750 = _2684;
            }
            float _2752 = _2750;
            float _2754 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2746);
            bool _2756 = !_2682;
            float _2758 = _2752;
            if (!_2756)
            {
                float _2760 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2762 = log2(_2760);
                float _2764 = _2762 * _2684;
                float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2768 = 1.0 + _2766;
                float _2770 = exp2(_2764);
                float _2772 = 1.0 / _2768;
                float _2774 = -_2770;
                float _2776 = _2774 + 1.0;
                float _2778 = _2776 * _2772;
                _2758 = _2778;
            }
            float _2780 = _2758;
            float _2782 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2744);
            float _2784 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2748);
            float _2786 = fma(_2780, _163, _2754);
            float _2788 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2782);
            float _2790 = fma(_2780, _161, _2784);
            float _2792 = -_427;
            float _2794 = _2792 + _2786;
            float _2796 = fma(_2780, _165, _2788);
            float _2798 = -_433;
            float _2800 = _2798 + _2790;
            float _2802 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2804 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2806 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2808 = -_439;
            float _2810 = _2808 + _2796;
            float _2812 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2802);
            float _2814 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2804);
            float _2816 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2806);
            float _2818 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2812);
            float _2820 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2814);
            float _2822 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2816);
            _473 = _2820;
            _475 = _2818;
            _477 = _2822;
            _2660 = _2818;
            _2666 = _2820;
            _2672 = _2822;
        }
        float _2824 = _473;
        float _2826 = _475;
        float _2828 = _477;
        float _2830 = _2660;
        float _2832 = _2666;
        float _2834 = _2672;
        float _2836 = _2642;
        float _2838 = _2824 * _2824;
        float _2840 = rsqrt(_2622);
        float _2842 = fma(_2826, _2826, _2838);
        float _2844 = fma(_2828, _2828, _2842);
        float _2846 = sqrt(_2844);
        float _2848 = _2612 * _2840;
        float _2850 = _2608 * _2840;
        float _2852 = _2616 * _2840;
        bool _2854 = _2846 > 0.0;
        float _2856 = _2836;
        if (!_2854)
        {
            _2856 = _2602;
        }
        float _2858 = _2856;
        bool _2860 = !_2854;
        _2644 = _2858;
        if (!_2860)
        {
            float _2862 = rsqrt(_2844);
            float _2864 = _2862 * _2824;
            float _2866 = _2862 * _2826;
            float _2868 = _2862 * _2828;
            float _2870 = _2850 * _2864;
            float _2872 = fma(_2848, _2866, _2870);
            float _2874 = fma(_2852, _2868, _2872);
            float _2876 = _2874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2878 = fma(_2830, _2876, _2602);
            float _2880 = fma(_2832, _2876, _2600);
            float _2882 = fma(_2834, _2876, _2604);
            _2630 = _2882;
            _2644 = _2878;
            _2632 = _2880;
        }
    }
    float _2884 = _2630;
    float _2886 = _2644;
    float _2888 = _2632;
    float _2890 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2894 = isnan(0.5);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2890);
    bool _2904 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2906 = isnan(0.5);
    bool _2908 = _2904 || _2906;
    bool _2910 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2912 = _2908 || _2910;
    float _2914 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2902);
    float _2916 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2918 = _2914 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2920 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2916);
    float _2922 = 1.0 / _2918;
    float _2924 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2920);
    float _2926 = _2884;
    if (_2912)
    {
        _2634 = 1.0;
    }
    float _2928 = _2634;
    float _2930 = _2924 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2932 = _2930 + _2918;
    float _2934 = -_2306;
    float _2936 = _2934 + _2884;
    float _2938 = _2932 * _2922;
    float _2940 = _2938 * 0.5;
    float _2942 = -_2298;
    float _2944 = _2942 + _2886;
    float _2946 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2948 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2946);
    float _2950 = -_2300;
    float _2952 = _2950 + _2888;
    float _2954 = 1.0 / _2948;
    float _2956 = _2952;
    float _2958 = _2944;
    float _2960 = _2936;
    float _2962 = _2928;
    if (!_2900)
    {
        float _2964 = _2316 * _2316;
        float _2966 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2968 = -_1576;
        float _2970 = _2968 + _2884;
        float _2972 = -_1536;
        float _2974 = _2972 + _2888;
        float _2976 = fma(_2324, _2324, _2964);
        float _2978 = fma(_2332, _2332, _2976);
        float _2980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2982 = sqrt(_2978);
        float _2984 = _2966 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2986 = 1.0 / _2426;
        float _2988 = precise::min(_2982, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2990 = _2988 * _2980;
        float _2992 = _2990 * _2986;
        float _2994 = -_1550;
        float _2996 = _2994 + _2886;
        float _2998 = _2984 * _2992;
        float _3000 = _2970 * _2992;
        float _3002 = fma(_2996, _2998, _2310);
        float _3004 = fma(_2974, _2998, _2304);
        float _3006 = fma(_2984, _3000, _2320);
        _2956 = _3004;
        _2958 = _3002;
        _2960 = _3006;
        _2392 = _2982;
        _2926 = _3000;
    }
    float _3008 = _2956;
    float _3010 = _2958;
    float _3012 = _2960;
    float _3014 = _2392;
    float _3016 = _2926;
    float _3018 = _3016;
    float _3020 = _3014;
    if (_2912)
    {
        _3018 = 1.0;
    }
    float _3022 = _3018;
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3026 = _2954 * _3024;
    float _3028 = _3022;
    if (!_2912)
    {
        float _3030 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3032 = _3030 * 0.15915493667125701904296875;
        float _3034 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3038 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3036;
        float _3040 = _3032 * 6.283185482025146484375;
        float _3042 = cos(_3040);
        float _3044 = _3034 * 0.15915493667125701904296875;
        float _3046 = _3032 * 6.283185482025146484375;
        float _3048 = sin(_3046);
        float _3050 = 1.0 / _3042;
        float _3052 = _3044 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        float _3056 = _3048 * _3050;
        float _3058 = _3044 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = _3054 * _3056;
        float _3064 = 1.0 / _3038;
        float _3066 = 1.0 / _3062;
        float _3068 = _3060 * _3066;
        float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3072 = fma(_3026, _3068, _3070);
        float _3074 = _3072 * _3064;
        float _3076 = precise::clamp(_3074, 0.0, 1.0);
        _2394 = _3044;
        _2396 = _3032;
        _2962 = _3076;
    }
    float _3078 = _2394;
    float _3080 = _2396;
    float _3082 = _2962;
    float _3084 = _3078;
    float _3086 = _3080;
    if (!_2912)
    {
        float _3088 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3090 = _3088 * 0.15915493667125701904296875;
        float _3092 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3094 = _3090 * 6.283185482025146484375;
        float _3096 = cos(_3094);
        float _3098 = _3092 * 0.15915493667125701904296875;
        float _3100 = _3090 * 6.283185482025146484375;
        float _3102 = sin(_3100);
        float _3104 = 1.0 / _3096;
        float _3106 = _3098 * 6.283185482025146484375;
        float _3108 = cos(_3106);
        float _3110 = _3102 * _3104;
        float _3112 = _3098 * 6.283185482025146484375;
        float _3114 = sin(_3112);
        float _3116 = _3108 * _3110;
        float _3118 = 1.0 / _3116;
        float _3120 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3122 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3120;
        float _3124 = 1.0 / _3122;
        float _3126 = _3114 * _3118;
        float _3128 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3130 = fma(_3026, _3126, _3128);
        float _3132 = _3130 * _3124;
        float _3134 = precise::clamp(_3132, 0.0, 1.0);
        float _3136 = -_3134;
        float _3138 = _3136 + 1.0;
        _3084 = _3096;
        _3028 = _3138;
    }
    float _3140 = _3084;
    float _3142 = _3028;
    float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3146 = _3008 + _3144;
    float _3148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3150 = _3010 + _3148;
    float _3152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3154 = _3012 + _3152;
    float _3156 = _3146 * _3146;
    float _3158 = fma(_3150, _3150, _3156);
    float _3160 = fma(_3154, _3154, _3158);
    float _3162 = rsqrt(_3160);
    float _3164 = sqrt(_3160);
    float _3166 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3168 = _3150 * _3166;
    float _3170 = _3154 * _3166;
    float _3172 = _3168 * _3168;
    float _3174 = _3170 * _3170;
    float _3176 = _3172 + _3174;
    float _3178 = sqrt(_3176);
    bool _3180 = _3178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3184 = _3178 + _3182;
    float _3186 = _3154;
    float _3188 = _3162;
    float _3190 = _3184;
    float _3192 = _3166;
    if (_3180)
    {
        float _3194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3186 = _3194;
    }
    float _3196 = _3186;
    if (_3180)
    {
        float _3198 = rsqrt(_3176);
        _3188 = _3198;
    }
    float _3200 = _3188;
    float _3202 = _3200;
    if (_3180)
    {
        float _3204 = _3184 * _3196;
        _3190 = _3204;
    }
    float _3206 = _3190;
    if (_3180)
    {
        float _3208 = _3206 * 0.15915493667125701904296875;
        _3086 = _3208;
    }
    float _3210 = _3086;
    float _3212 = _3196;
    if (_3180)
    {
        float _3214 = _3210 * 6.283185482025146484375;
        float _3216 = sin(_3214);
        _3212 = _3216;
    }
    float _3218 = _3212;
    float _3220 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3222 = precise::max(0.0, _3220);
    float _3224 = _3140;
    float _3226 = _3222;
    if (_3180)
    {
        float _3228 = _3210 * 6.283185482025146484375;
        float _3230 = cos(_3228);
        _3224 = _3230;
    }
    float _3232 = _3224;
    float _3234 = -_3166;
    float _3236 = -_3222;
    float _3238 = fma(_3146, _3234, _3236);
    float _3240 = _3238;
    if (_3180)
    {
        float _3242 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3226 = _3242;
    }
    float _3244 = _3226;
    float _3246 = _3218;
    float _3248 = _3244;
    if (_3180)
    {
        float _3250 = fma(_3218, _3244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3192 = _3250;
    }
    float _3252 = _3192;
    float _3254 = _3252;
    if (!_3180)
    {
        _3246 = _3238;
    }
    float _3256 = _3246;
    float _3258 = _3256;
    if (_3180)
    {
        float _3260 = _3232 + (-1.0);
        _3248 = _3260;
    }
    float _3262 = _3248;
    float _3264 = _3262;
    if (_3180)
    {
        float _3266 = _3200 * _3252;
        _2636 = _3266;
    }
    float _3268 = _2636;
    if (!_3180)
    {
        _3202 = _3168;
    }
    float _3270 = _3202;
    float _3272 = _3270;
    if (_3180)
    {
        float _3274 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3020 = _3274;
    }
    float _3276 = _3020;
    if (_3180)
    {
        float _3278 = _3168 * _3268;
        _3272 = _3278;
    }
    float _3280 = _3272;
    if (!_3180)
    {
        _3264 = _3170;
    }
    float _3282 = _3264;
    float _3284 = _3282;
    if (_3180)
    {
        float _3286 = _3170 * _3268;
        _3284 = _3286;
    }
    float _3288 = _3284;
    if (!_3180)
    {
        _3254 = _3172;
    }
    float _3290 = _3254;
    float _3292 = _3290;
    if (_3180)
    {
        float _3294 = fma(_3238, _3232, _3276);
        _3258 = _3294;
    }
    float _3296 = _3258;
    if (_3180)
    {
        float _3298 = _3280 * _3280;
        _3292 = _3298;
    }
    float _3300 = _3292;
    if (!_3180)
    {
        _3240 = _3174;
    }
    float _3302 = _3240;
    float _3304 = _3302;
    if (_3180)
    {
        float _3306 = _3288 * _3288;
        _3304 = _3306;
    }
    float _3308 = _3304;
    float _3310 = fma(_3296, _3296, _3300);
    float _3312 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3314 = _3310 + _3308;
    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3318 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3316);
    float _3320 = precise::clamp(_3318, 0.0, 1.0);
    float _3322 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3312);
    float _3324 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3326 = rsqrt(_3314);
    float _3328 = -_3320;
    float _3330 = _3328 + 1.0;
    float _3332 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3334 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3322);
    float _3336 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3338 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3324);
    float _3340 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3342 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3344 = abs(_3330);
    float _3346 = log2(_3344);
    float _3348 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3336);
    float _3350 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3338);
    float _3352 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3340);
    float _3354 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3356 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3348);
    float _3358 = _3350 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3360 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3352);
    float _3362 = _3326 * _3280;
    float _3364 = -_3354;
    float _3366 = fma(_3364, _3332, 1.0);
    float _3368 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3370 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3372 = _3326 * _3296;
    float _3374 = _3362 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3376 = _3360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3378 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3370);
    float _3380 = _3326 * _3288;
    float _3382 = -_3374;
    float _3384 = fma(_3372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3382);
    float _3386 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3388 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3378);
    float _3390 = log2(_3366);
    float _3392 = -_3380;
    float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3384);
    float _3396 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3398 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3388);
    float _3400 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3402 = fma(_3394, -0.5, 0.5);
    float _3404 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3396);
    float _3406 = fma(_3394, 0.5, 0.5);
    float _3408 = exp2(_3386);
    float _3410 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3400);
    float _3412 = _3372 + 1.0;
    float _3414 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3404);
    float _3416 = fma(_3406, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3418 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3410);
    float _3420 = 1.0 / _3398;
    float _3422 = fma(_3406, _3416, -0.212114393711090087890625);
    float _3424 = _3390 * 0.693147182464599609375;
    float _3426 = fma(_3406, _3422, 1.570728778839111328125);
    float _3428 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3430 = sqrt(_3402);
    float _3432 = -_3372;
    float _3434 = fma(_3408, _3412, _3432);
    float _3436 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3414);
    float _3438 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3418);
    float _3440 = _3436 * _3420;
    float _3442 = _3438 * _3420;
    float _3444 = fma(_3440, 0.5, 0.5);
    float _3446 = fma(_3442, -0.5, 0.5);
    float _3448 = fma(_3434, 0.5, 0.5);
    float _3450 = _3430 * 0.636619746685028076171875;
    float _3452 = -_3426;
    float _3454 = fma(_3450, _3452, 1.0);
    float3 _8785 = float3(_3444, _3446, _3428);
    float _3456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8785, float3(0.0), isnan(_8785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8785, float3(0.0), isnan(_8785)), level(0.0)).x;
    float3 _8796 = float3(_3444, _3446, _3428);
    float4 _3459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8796, float3(0.0), isnan(_8796)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8796, float3(0.0), isnan(_8796)), level(0.0)).xyzw;
    float _3461 = _3459.x;
    float _3463 = _3459.y;
    float _3465 = _3459.z;
    float _3467 = _3459.w;
    float2 _8813 = float2(_3454, _3448);
    float3 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8813, float2(0.0), isnan(_8813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8813, float2(0.0), isnan(_8813)), level(0.0)).xyz;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3481 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3483 = _3082 > 0.0;
    bool _3485 = isnan(_3082);
    bool _3487 = _3483 || _3485;
    bool _3489 = isnan(0.0);
    bool _3491 = _3487 || _3489;
    float _3493 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3481);
    float _3495 = exp2(_3479);
    bool _3497 = _3142 <= 0.0;
    bool _3499 = !_3491;
    bool _3501 = _3497 || _3499;
    float _3503 = _3398 * 0.5;
    float _3505 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3493);
    float _3507 = _3436 + _3398;
    float _3509 = fma(_3438, -0.5, _3503);
    float _3511 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3513 = _3507 * 0.5;
    float _3515 = _3082 * _3142;
    float _3517 = _3511 + _3398;
    out.gl_Position.x = _3436;
    out.gl_Position.y = _3438;
    out.gl_Position.z = _3511;
    out.gl_Position.w = _3398;
    float _3519 = _3515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3521 = _3517 * 0.5;
    float _3523 = -_3495;
    float _3525 = _3523 + 1.0;
    float _3527 = _3519 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3529 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3513;
    out.m_68.y = _3509;
    out.m_68.z = _3521;
    out.m_68.w = _3398;
    out.m_45.x = _3527;
    float _3531 = _3529 * _3456;
    float _3533 = -_3529;
    float _3535 = _3533 + 1.0;
    float _3537 = _3467 * _3531;
    float _3539 = _3477 * _3531;
    float _3541 = _3467 * _3535;
    float _3543 = fma(_3473, _3537, _3461);
    float _3545 = fma(_3475, _3537, _3463);
    float _3547 = fma(_3467, _3539, _3465);
    out.m_70.x = _3543;
    out.m_70.y = _3545;
    out.m_70.z = _3547;
    out.m_70.w = _3541;
    if (!_3501)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3549;
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
    bool _859 = false;
    bool _745 = false;
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
        float _3606 = as_type<float>(_105);
        out.gl_Position.z = _3606;
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
        float _3676 = as_type<float>(_143);
        out.gl_Position.z = _3676;
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
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _505 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = 1.0 / _517;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = 1.0 / _525;
    float _537 = 1.0 / _521;
    float _539 = _509 * _531;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = _505 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _505 + _545;
    bool _549 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _551 = isnan(_505);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _529;
    float _563 = _543 * _535;
    bool _565 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _567 = isnan(_505);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _577;
    float _581 = _513 * _537;
    bool _583 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _585 = isnan(_505);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_579, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = -_593;
    float _603 = _601 + 1.0;
    float _605 = _547 * _561;
    float _607 = -_575;
    float _609 = _607 + 1.0;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _611;
    float _615 = _559 * _603;
    bool _617 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_505);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _593 * _609;
    bool _631 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _633 = isnan(_505);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _647 = -_559;
    float _649 = _647 + 1.0;
    float _651 = fma(_613, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _653 = fma(_599, _581, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = fma(_645, _581, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _657 = _641 * _649;
    float _659 = -_641;
    float _661 = _659 + 1.0;
    float _663 = -_627;
    float _665 = _663 + 1.0;
    float _667 = in.m_52.x;
    float _669 = in.m_52.y;
    float _671 = _627 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _677;
    float _681 = _595 * _671;
    float _683 = _651 * _671;
    float _685 = fma(_675, _563, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _687 = fma(_679, _563, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _689 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _681);
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _683);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _701 = fma(_653, _657, _689);
    float _703 = fma(_655, _657, _691);
    float _705 = fma(_695, _605, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _707 = fma(_699, _605, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _709 = fma(_685, _615, _701);
    float _711 = fma(_687, _615, _703);
    float _713 = fma(_705, _629, _709);
    float _715 = fma(_707, _629, _711);
    float _717 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[147].x, _713);
    float _719 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[147].y, _715);
    float _721 = _717 * _667;
    float _723 = _719 * _669;
    bool _725 = !_533;
    float _743;
    if (!_725)
    {
        float _727 = in.m_54.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_89);
        float _749 = 1.0 / _747;
        float _751 = _123 * _749;
        _743 = _751;
    }
    _745 = false;
    float _753 = _743;
    bool _755 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _757 = isnan(_753);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _771 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _773 = isnan(_753);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _789 = _753 + _787;
    float _791 = -_765;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _769;
    float _797 = _781 * _793;
    float _799 = -_781;
    float _801 = _799 + 1.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _785 * _795;
    float _819 = fma(_817, _789, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _821 = _819 * _797;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[115].x, _821);
    float _825 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[116].x, _823);
    float _827 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _811;
    out.m_56.y = _813;
    out.m_56.z = _815;
    out.m_56.w = _827;
    bool _829 = !_807;
    float _853;
    float _855;
    float _857;
    if (!_829)
    {
        float _831 = in.m_54.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _835 = float(_89);
        float _837 = 1.0 / _835;
        float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _841 = _123 * _837;
        float _843 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _845 = _843 * _833;
        float _847 = floor(_845);
        float _849 = -_847;
        float _851 = _845 + _849;
        _853 = _841;
        _855 = _851;
        _857 = _835;
        _859 = true;
    }
    else
    {
        float _861 = float(_89);
        float _863 = 1.0 / _861;
        float _865 = _123 * _863;
        _853 = _865;
        _855 = _865;
        _857 = _861;
    }
    _859 = false;
    float _867 = _853;
    float _869 = _855;
    float _871 = _857;
    float _873 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _875 = int(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _879 = _867 + _877;
    float _881 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _883;
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _889 = int(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _903 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _905 = isnan(_869);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = 1.0 / _885;
    float _917 = float(_875);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _919;
    bool _923 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _925 = isnan(_867);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    bool _935 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _937 = isnan(_867);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = 1.0 / _917;
    float _949 = float(uint(_889));
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _953 = ~_889;
    int _955 = _953 + 1;
    float _957 = float(_889);
    bool _959 = _889 == 0;
    float _961 = 1.0 / _949;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _965 = _123 * _947;
    int _967 = ~_889;
    int _969 = _967 + 1;
    float _971 = 1.0 / _893;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _977 = _975 != 0;
    int _979 = as_type<int>(_961) + (-2);
    float _981 = trunc(_965);
    int _983 = int(_981);
    float _985 = 1.0 / _897;
    float _987 = float(uint(_983));
    float _989 = 1.0 / _901;
    float _991 = as_type<float>(_979) * _987;
    float _993 = in.m_54.x;
    float _995 = in.m_54.y;
    float _997 = in.m_54.z;
    float _999 = in.m_54.w;
    float _1001 = trunc(_991);
    float _1003 = precise::max(_1001, 0.0);
    uint _1006 = uint(_1003);
    float _1008 = float(_983);
    int _1010 = _969 * int(_1006);
    int _1012 = _1010 + _983;
    float _1014 = float(uint(_1012));
    float _1016 = _995 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1018 = !_977;
    float _1020 = _1018 ? _995 : _993;
    float _1022 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[79].z, _951);
    float _1024 = 0.0;
    if (!_977)
    {
        _1024 = _997;
    }
    float _1026 = _1024;
    float _1028 = as_type<float>(_979) * _1014;
    float _1030 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1022);
    float _1032 = _1026;
    if (_977)
    {
        _1032 = _995;
    }
    float _1034 = _1032;
    float _1036 = -_933;
    float _1038 = _1036 + 1.0;
    bool _1040 = !_977;
    float _1042 = _1040 ? 1.2345600128173828125 : 1.0;
    float _1044 = trunc(_1028);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    float _1050 = _1030 * (-0.15915493667125701904296875);
    float _1052 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1054 = _1042 * _1020;
    float _1056 = floor(_1054);
    int _1058 = int(_1006) + int(_1048);
    bool _1060 = _1008 >= _957;
    bool _1062 = isnan(_1008);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(_957);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    int _1072 = _955 * _1058;
    int _1074 = _1072 + _983;
    float _1076 = 1.0 / _871;
    float _1078 = -_1056;
    float _1080 = _1054 + _1078;
    bool _1082 = uint(_1074) >= uint(_889);
    float _1084 = trunc(_1070);
    int _1086 = int(_1084);
    bool _1088 = !_1082;
    int _1090 = _1088 ? 0 : (-1);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1106 = _1104 != 0;
    int _1108 = ~_1058;
    int _1110 = _1108 + _1090;
    int _1112 = _1110 + 1;
    float _1114 = _1080 * _957;
    float _1116 = _123 * _957;
    bool _1118 = !_1098;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _889 * _1112;
    int _1124 = _1122 + _983;
    float _1126 = _1116 * _1076;
    float _1128 = trunc(_1114);
    int _1130 = int(_1128);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1134 = _1132 != 0;
    bool _1136 = !_959;
    int _1138 = _1136 ? _1124 : (-1);
    int _1140 = ~_1086;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    int _1146 = _889 + (-1);
    float _1148 = trunc(_1126);
    int _1150 = int(_1148);
    bool _1152 = !_1134;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1138 * _1144;
    int _1158 = abs(_1120);
    bool _1160 = !_1102;
    int _1162 = _1160 ? 0 : 1;
    int _1164 = _1086 * _1146;
    int _1166 = _1164 + _1156;
    bool _1168 = !_1094;
    int _1170 = _1168 ? 0 : 1;
    int _1172 = abs(_1154);
    int _1174 = abs(_1170);
    int _1176 = _1130 * _1172;
    int _1178 = _1176 + _983;
    bool _1180 = !_1106;
    int _1182 = _1180 ? 0 : 1;
    int _1184 = abs(_1162);
    int _1186 = _1166 * _1158;
    int _1188 = abs(_1182);
    int _1190 = _1150 * _1174;
    int _1192 = _1190 + _1186;
    float _1194 = _993 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1196 = _1178 * _1184;
    int _1198 = _1196 + _1192;
    int _1200 = ~_889;
    int _1202 = _1200 + 1;
    int _1204 = _1130 * _1188;
    int _1206 = _1204 + _1198;
    float _1208 = as_type<float>(_1130);
    if (!_977)
    {
        _1208 = _995;
    }
    float _1210 = _1208;
    float _1212 = _1210;
    if (_977)
    {
        _1212 = _993;
    }
    float _1214 = _1212;
    float _1216 = float(uint(_1206));
    float _1218 = as_type<float>(_979) * _1216;
    float _1220 = trunc(_1218);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    int _1226 = _1202 * int(_1224);
    int _1228 = _1226 + _1206;
    float _1230 = float(uint(_1228));
    float _1232 = as_type<float>(_979) * _1230;
    int _1234 = ~_889;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1232);
    float _1240 = precise::max(_1238, 0.0);
    uint _1242 = uint(_1240);
    int _1244 = int(_1224) + int(_1242);
    int _1246 = _1236 * _1244;
    int _1248 = _1246 + _1206;
    float _1250 = _993 * 2.0;
    bool _1252 = uint(_1248) >= uint(_889);
    float _1254 = floor(_1250);
    bool _1256 = !_1252;
    int _1258 = _1256 ? 0 : (-1);
    int _1260 = ~_1244;
    int _1262 = _1260 + _1258;
    int _1264 = _1262 + 1;
    float _1266 = _995 * 2.0;
    int _1268 = _889 * _1264;
    int _1270 = _1268 + _1206;
    float _1272 = floor(_1266);
    bool _1274 = !_959;
    int _1276 = _1274 ? _1270 : (-1);
    bool _1278 = _1254 > 0.0;
    int _1280 = _1276 & 3;
    bool _1282 = _1280 != 0;
    int _1284 = _1276 & 3;
    bool _1286 = _1284 != 0;
    int _1288 = _1282 ? 0 : 1;
    bool _1290 = uint(_1284) > 1u;
    bool _1292 = _1254 >= 0.0;
    bool _1294 = isnan(_1254);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    int _1302 = ~_1288;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    float _1308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1310 = log2(_1308);
    int _1312 = _1300 ? 0 : 1;
    bool _1314 = _999 > 0.5;
    int _1316 = ~_1312;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _1320;
    int _1324 = _1306;
    if (!_1278)
    {
        int _1326 = ~_1312;
        int _1328 = _1326 + 1;
        _1322 = _1328;
    }
    int _1330 = _1322;
    float _1332 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_1290)
    {
        int _1334 = ~_1288;
        int _1336 = _1334 + 1;
        _1324 = _1336;
    }
    int _1338 = _1324;
    bool _1340 = _993 > 0.5;
    float _1342 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1332);
    bool _1344 = _995 > 0.5;
    float _1346 = -_225;
    int _1348 = _1314 ? as_type<int>(_1346) : as_type<int>(_225);
    bool _1350 = _1272 >= 0.0;
    bool _1352 = isnan(_1272);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    float _1360 = -_221;
    int _1362 = _1340 ? as_type<int>(_1360) : as_type<int>(_221);
    float _1364 = -_225;
    int _1366 = _1344 ? as_type<int>(_1364) : as_type<int>(_225);
    bool _1368 = _997 > 0.5;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1372 = _1370 != 0;
    int _1374 = _1358 ? 0 : 1;
    bool _1376 = _1272 > 0.0;
    float _1378 = -_221;
    int _1380 = _1368 ? as_type<int>(_1378) : as_type<int>(_221);
    bool _1382 = !_1372;
    float _1384 = _1382 ? _225 : as_type<float>(_1348);
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    bool _1394 = !_1388;
    float _1396 = _1394 ? _221 : as_type<float>(_1362);
    float _1398 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1400 = !_1392;
    float _1402 = _1400 ? _225 : as_type<float>(_1366);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1406 = _1404 != 0;
    float _1408 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1398);
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1412 = _1410 != 0;
    float _1414 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1416 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1408);
    int _1418 = ~_1374;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1414);
    int _1426 = _1422;
    float _1428 = _1398;
    if (!_1376)
    {
        int _1430 = ~_1374;
        int _1432 = _1430 + 1;
        _1426 = _1432;
    }
    int _1434 = _1426;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1440 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1424);
    float _1442 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1342);
    if (!_977)
    {
        _1428 = _997;
    }
    float _1444 = _1428;
    float _1446 = 1.0 / _1438;
    float _1448 = _1444;
    if (_977)
    {
        _1448 = _995;
    }
    float _1450 = _1448;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1464 = _1462 != 0;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1468 = -_1452;
    float _1470 = fma(_1194, 2.0, _1468);
    float _1472 = fma(_1016, -2.0, _1466);
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1480 = _869 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1486;
    float _1490 = _1480 * _915;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1496 = _997 * 2.0;
    float _1498 = 1.0 / _1484;
    float _1500 = _1494 * _971;
    float _1502 = _1488 * _985;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1504;
    bool _1508 = !_1412;
    float _1510 = _1508 ? _221 : as_type<float>(_1380);
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1514 = _1512 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1516 = fma(_921, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1518 = 1.0 / _1476;
    float _1520 = _1506 * _989;
    float _1522 = fma(_1500, _879, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1524 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1526 = isnan(_869);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = _1440 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1538 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1540 = isnan(_867);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1552 = floor(_1496);
    float _1554 = _123 * _1310;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1564 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1566 = isnan(_867);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = _1442 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1578 = _1558 * _1446;
    float _1580 = _995 + _993;
    float _1582 = exp2(_1554);
    float _1584 = _1580 + (-1.0);
    int _1586 = abs(_1338);
    bool _1588 = _889 == 0;
    float _1590 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1592 = 1.0 / _1514;
    bool _1594 = _1552 >= 0.0;
    bool _1596 = isnan(_1552);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan(0.0);
    bool _1602 = _1598 || _1600;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = -_1582;
    float _1618 = _1616 + 1.0;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1620;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1628;
    int _1632 = ~_1586;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    float _1638 = _1622 * _1498;
    float _1640 = _995 + _997;
    float _1642 = _1626 * _1518;
    float _1644 = fma(_1630, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1646 = _1640 + (-1.0);
    float _1648 = _1614 ? _1618 : 0.0;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1652 = _867 + _1650;
    bool _1654 = _1552 > 0.0;
    float _1656 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1660 = _867 + _1658;
    float _1662 = fma(_1638, _1652, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1666 = _867 + _1664;
    float _1668 = _1562 * _1592;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1670;
    float _1674 = fma(_1520, _1660, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1678 = _867 + _1676;
    float _1680 = fma(_1642, _1666, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1682 = fma(_1672, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1686 = _867 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1690 = _867 + _1688;
    bool _1692 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1694 = isnan(_867);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1700 = _1696 || _1698;
    float _1702 = float(_1700);
    float _1704 = fma(_1668, _1678, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1706 = fma(_1578, _1686, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1708 = fma(_1502, _1690, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1710 = -_1534;
    float _1712 = _1710 + 1.0;
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    bool _1718 = !_1460;
    int _1720 = _1718 ? 0 : 1;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1724 = _913 * _1712;
    float _1726 = _1548 * _1716;
    float _1728 = -_1548;
    float _1730 = _1728 + 1.0;
    float _1732 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1722);
    bool _1734 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1736 = isnan(_867);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1644 * _1724;
    float _1748 = _1516 * _1724;
    float _1750 = _1682 * _1724;
    bool _1752 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1754 = isnan(_867);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = _1744 * _1730;
    float _1766 = -_1744;
    float _1768 = _1766 + 1.0;
    float _1770 = -_1762;
    float _1772 = _1770 + 1.0;
    bool _1774 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1776 = isnan(_867);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = _1762 * _1768;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1790 = 1.0 + _1788;
    float _1792 = _1574 * _1772;
    float _1794 = -_1574;
    float _1796 = _1794 + 1.0;
    float _1798 = _1784 * _1038;
    float _1800 = 1.0 / _1790;
    float _1802 = -_1784;
    float _1804 = _1802 + 1.0;
    float _1806 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[83].z, _963);
    float _1808 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1812 = _945 * _1804;
    float _1814 = -_945;
    float _1816 = _1814 + 1.0;
    float _1818 = -_973;
    float _1820 = fma(_1808, 2.0, _1818);
    float _1822 = _933 * _1796;
    float _1824 = _1708 * _1812;
    float _1826 = -_913;
    float _1828 = _1826 + 1.0;
    float _1830 = fma(_1052, -2.0, _1810);
    float _1832 = _1050 * 6.283185482025146484375;
    float _1834 = sin(_1832);
    float _1836 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1824);
    float _1838 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1748);
    int _1840 = ~_1604;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    float _1846 = _1648 * _1800;
    float _1848 = fma(_1522, _1798, _1836);
    float _1850 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1746);
    float _1852 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1750);
    float _1854 = _1050 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1838);
    float _1860 = fma(_1674, _1822, _1848);
    float _1862 = float(uint(_1178));
    float _1864 = _1510 + 0.5;
    bool _1866 = !_1456;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = -_123;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1820);
    int _1874 = _1844;
    if (!_1654)
    {
        int _1876 = ~_1604;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    float _1882 = as_type<float>(_979) * _1862;
    float _1884 = _1402 * _1834;
    int _1886 = abs(_1868);
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = _1536 + _1888;
    float _1892 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1830);
    int _1894 = abs(_1720);
    float _1896 = trunc(_1882);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    bool _1902 = uint(_1284) >= 2u;
    float _1904 = _1402 * _1856;
    float _1906 = -_1884;
    float _1908 = fma(_1396, _1856, _1906);
    float _1910 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1852);
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1914 = fma(_1396, _1834, _1904);
    float _1916 = _1384 + (-0.5);
    float _1918 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1850);
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1922 = _1550 + _1920;
    float _1924 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1872);
    float _1926 = -_1916;
    float _1928 = -_1892;
    float _1930 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1928);
    float _1932 = float(_1894);
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1912);
    int _1936 = _1902 ? 0 : 1;
    float _1938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1940 = float(_1330);
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1944 = _1576 + _1942;
    int _1946 = ~_889;
    int _1948 = _1946 + 1;
    bool _1950 = _1284 != 3;
    float _1952 = _1932 * _1940;
    float _1954 = float(_1886);
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1958 = float(_1880);
    int _1960 = _1948 * int(_1900);
    int _1962 = _1960 + _1178;
    int _1964 = ~_1936;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    float _1970 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1934);
    float _1972 = _1952 * (-2.0);
    float _1974 = _1954 * _1958;
    int _1976 = _1276 >> 31;
    float _1978 = float(uint(_1962));
    float _1980 = _1974 * (-2.0);
    int _1982 = _1976 & 3;
    float _1984 = fma(_1656, _1972, _1656);
    int _1986 = _1968;
    if (_1950)
    {
        int _1988 = ~_1936;
        int _1990 = _1988 + 1;
        _1986 = _1990;
    }
    int _1992 = _1986;
    float _1994 = fma(_1706, _1792, _1860);
    int _1996 = _1276 + _1982;
    float _1998 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2000 = as_type<float>(_979) * _1978;
    float _2002 = -_123;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1470);
    int _2006 = _1996 >> 2;
    float _2008 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1472);
    float _2010 = _1918 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2012 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2014 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2016 = _1908 + 0.5;
    float _2018 = _1858 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2020 = _1914 + (-0.5);
    float _2022 = trunc(_2000);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    int _2028 = _2006 << 4;
    int _2030 = _2028 + 512;
    float _2032 = fma(_2012, _2016, _2004);
    float _2034 = -_1998;
    float _2036 = -_2008;
    float _2038 = fma(_2034, _2020, _2036);
    uint _2040 = uint(int(uint(_2030) >> uint(2)));
    uint _2042 = uint(int(uint(int(_2040)) >> uint(2)));
    int _2044 = int(_2040) & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    int _2048 = int(_2040) + 1;
    uint _2050 = uint(int(uint(_2048) >> uint(2)));
    int _2052 = _2048 & 3;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[int(_2050)][_2052];
    float _2056 = fma(_1662, _1786, _1994);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2060 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2064 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2068 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1732);
    int _2072 = int(_1900) + int(_2026);
    float _2074 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1806);
    float _2076 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2058);
    out.m_58.x = _2060;
    out.m_58.y = _2064;
    out.m_58.z = _2068;
    out.m_58.w = _2066;
    int _2078 = _2030 + 8;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[int(_2090)][_2092];
    float _2096 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2062);
    float _2098 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2076);
    float _2100 = in.m_60.x;
    float _2102 = in.m_60.y;
    float _2104 = in.m_60.z;
    float _2106 = fma(_1704, _1764, _2056);
    float _2108 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2096);
    int _2110 = abs(_1992);
    float _2112 = fma(_1590, _1980, _1590);
    bool _2114 = _1970 >= 0.0;
    float _2116 = fma(_1680, _1726, _2106);
    float _2118 = -_2074;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2070;
    float _2124 = _2122 + 1.0;
    float _2126 = -_2098;
    float _2128 = _2126 + 1.0;
    float _2130 = -_2108;
    float _2132 = _2130 + 1.0;
    float _2134 = -_2120;
    float _2136 = fma(_1510, _2134, _1924);
    int _2138 = ~_889;
    int _2140 = _2138 + 1;
    float _2142 = fma(_1384, _2124, _1930);
    bool _2144 = !_1286;
    int _2146 = _2144 ? 0 : 1;
    float _2148 = -_2128;
    float _2150 = fma(_1908, _2148, _2032);
    float _2152 = fma(_1914, _2132, _2038);
    int _2154 = _2140 * _2072;
    int _2156 = _2154 + _1178;
    int _2158 = abs(_2146);
    float _2160 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2116);
    if (_2114)
    {
        out.m_45.x = 0.0;
    }
    float _2162 = fma(_1980, _2100, _2100);
    bool _2164 = uint(_2156) >= uint(_889);
    float _2166 = fma(_1972, _2102, _2102);
    out.m_62.x = _2150;
    out.m_62.y = _2152;
    out.m_62.z = _2136;
    out.m_62.w = _2142;
    bool _2168 = !_2164;
    int _2170 = _2168 ? 0 : (-1);
    int _2172 = _1636 * as_type<int>(_2054);
    bool _2174 = _1284 != 3;
    out.m_64.x = _2160;
    int _2176 = ~_2072;
    int _2178 = _2176 + _2170;
    int _2180 = _2178 + 1;
    bool _2182 = !_2174;
    int _2184 = _2182 ? 0 : (-1);
    int _2186 = ~_2158;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = abs(_2184);
    int _2194 = _2190 * as_type<int>(_2046);
    int _2196 = _2194 + _2172;
    bool _2198 = !_1406;
    int _2200 = _2198 ? 0 : 1;
    int _2202 = ~_2110;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = _1890 * _1890;
    int _2210 = abs(_2200);
    float _2212 = fma(_1922, _1922, _2208);
    float _2214 = _993 + (-0.5);
    int _2216 = _2206 * as_type<int>(_2086);
    int _2218 = _2216 + _2196;
    int _2220 = ~_2192;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = fma(_1944, _1944, _2212);
    float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2162);
    int _2230 = _889 * _2180;
    int _2232 = _2230 + _1178;
    int _2234 = ~_2210;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = _2224 * as_type<int>(_2094);
    int _2242 = _2240 + _2218;
    float _2244 = _2212;
    float _2246 = _2104;
    if (_2114)
    {
        _2244 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2248 = _2244;
    float _2250 = rsqrt(_2226);
    bool _2252 = !_1588;
    int _2254 = _2252 ? _2232 : (-1);
    int _2256 = _2242 * _2238;
    bool _2258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2260 = isnan(1.0);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2266 = _2262 || _2264;
    int _2268 = as_type<int>(_2248);
    if (_2114)
    {
        float _2270 = _2248 * 5.0;
        _2268 = as_type<int>(_2270);
    }
    int _2272 = _2268;
    int _2274 = _2254 * _2210;
    int _2276 = _2274 + _2256;
    float _2278 = _881 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2280 = !_2266;
    float _2282 = _2280 ? _123 : _1846;
    float _2284 = _995 + (-0.5);
    bool _2286 = !_1464;
    int _2288 = _2286 ? 0 : 1;
    if (_2114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6962 = as_type<float>(_2272);
        out.gl_Position.z = _6962;
    }
    float _2290 = float(_2276);
    float _2292 = fma(_2282, _2112, _2228);
    int _2294 = abs(_2288);
    float _2296 = _2278 * _2250;
    out.m_66.y = _2290;
    float _2298 = _1922 * _2296;
    float _2300 = _1890 * _2296;
    if (_2114)
    {
        return out;
    }
    float _2302 = -_2300;
    float _2304 = _1536 + _2302;
    float _2306 = _1944 * _2296;
    float _2308 = -_2298;
    float _2310 = _1550 + _2308;
    float _2312 = float(_2294);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2316 = _2304 + _2314;
    float _2318 = -_2306;
    float _2320 = _1576 + _2318;
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2324 = _2310 + _2322;
    float _2326 = float(_1434);
    float _2328 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2320 + _2330;
    float _2334 = _997 + _993;
    float _2336 = -_2300;
    float _2338 = _1890 + _2336;
    float _2340 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2328);
    float _2342 = _2312 * _2326;
    float _2344 = _2334 + (-1.0);
    float _2346 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2166);
    float _2348 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2340);
    float _2350 = -_2298;
    float _2352 = _1922 + _2350;
    float _2354 = _2338 * _2338;
    float _2356 = _2342 * (-2.0);
    float _2358 = fma(_2282, _1984, _2346);
    bool _2360 = _2348 >= 0.0;
    float _2362 = fma(_2352, _2352, _2354);
    float _2364 = -_2306;
    float _2366 = _1944 + _2364;
    float _2368 = _997 + (-0.5);
    float _2370 = _2358 * 0.15915493667125701904296875;
    float _2372 = _2292 * 0.15915493667125701904296875;
    float _2374 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2376 = fma(_2356, _2104, _2104);
    float _2378 = fma(_2366, _2366, _2362);
    float _2380 = _2372 * 6.283185482025146484375;
    float _2382 = sin(_2380);
    float _2384 = fma(_2374, _2356, _2374);
    float _2386 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2376);
    int _2388 = as_type<int>(_2368);
    float _2390 = _2370;
    float _2392 = _2324;
    float _2394 = _2310;
    float _2396 = _2320;
    if (_2360)
    {
        _2246 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2398 = _2246;
    if (_2360)
    {
        out.m_45.x = 0.0;
    }
    float _2400 = fma(_2282, _2384, _2386);
    float _2402 = _2372 * 6.283185482025146484375;
    float _2404 = cos(_2402);
    if (_2360)
    {
        float _2406 = _2398 * 5.0;
        _2388 = as_type<int>(_2406);
    }
    int _2408 = _2388;
    float _2410 = _2400 * 0.15915493667125701904296875;
    if (_2360)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7157 = as_type<float>(_2408);
        out.gl_Position.z = _7157;
    }
    float _2412 = _2370 * 6.283185482025146484375;
    float _2414 = sin(_2412);
    float _2416 = sqrt(_2378);
    float _2418 = _2370 * 6.283185482025146484375;
    float _2420 = cos(_2418);
    if (_2360)
    {
        return out;
    }
    float _2422 = _2410 * 6.283185482025146484375;
    float _2424 = cos(_2422);
    float _2426 = _2250 * _2416;
    float _2428 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2430 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2432 = _2404 * _2420;
    float _2434 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2436 = _2426 * _2428;
    float _2438 = _881 * _2426;
    float _2440 = _2410 * 6.283185482025146484375;
    float _2442 = sin(_2440);
    float _2444 = _2430 * _2436;
    float _2446 = _2382 * _2414;
    float _2448 = _2424 * _2444;
    float _2450 = _2434 * _2438;
    float _2452 = _2404 * _2414;
    float _2454 = _2382 * _2420;
    float _2456 = _2404 * _2448;
    float _2458 = _2414 * _2424;
    float _2460 = _2420 * _2424;
    float _2462 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2464 = _2462 * 0.5;
    float _2466 = fma(_2442, _2432, _2446);
    float _2468 = -_2444;
    float _2470 = _2442 * _2468;
    float _2472 = _2382 * _2448;
    float _2474 = fma(_2442, _2446, _2432);
    float _2476 = fma(_2466, _2450, _2456);
    float _2478 = -_2454;
    float _2480 = fma(_2442, _2452, _2478);
    float _2482 = -_2452;
    float _2484 = fma(_2442, _2454, _2482);
    float _2486 = fma(_2460, _2450, _2470);
    float _2488 = fma(_2480, _2464, _2476);
    float _2490 = fma(_2484, _2450, _2472);
    float _2492 = fma(_2458, _2464, _2486);
    float _2494 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2496 = fma(_2474, _2464, _2490);
    float _2498 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2500 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2494);
    float _2502 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2498);
    float _2504 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2500);
    float _2506 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2502);
    float _2508 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2510 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2512 = _1576 + _2508;
    float _2514 = _1550 + _2510;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2518 = _2512 + _2516;
    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2522 = _2514 + _2520;
    float _2524 = _2518 * _2518;
    float _2526 = fma(_2522, _2522, _2524);
    float _2528 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2530 = sqrt(_2526);
    float _2532 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2528);
    float _2534 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2532);
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2538 = _1536 + _2536;
    bool _2540 = _2530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2542 = _2536;
    float _2544 = _2514;
    float _2546 = _2454;
    float _2548 = _2518;
    if (!_2540)
    {
        _2542 = _2514;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (!_2540)
    {
        _2544 = _2512;
    }
    float _2554 = _2544;
    float _2556 = _2554;
    if (!_2540)
    {
        _2546 = _2538;
    }
    float _2558 = _2546;
    bool _2560 = !_2540;
    float _2562 = _2558;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2530 + _2566;
        float _2570 = rsqrt(_2526);
        float _2572 = _2568 * _2564;
        float _2574 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = cos(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = sin(_2582);
        float _2586 = _2580 + (-1.0);
        float _2588 = fma(_2584, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2590 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = _2570 * _2588;
        float _2594 = fma(_2538, _2580, _2590);
        float _2596 = fma(_2522, _2592, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2598 = fma(_2518, _2592, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2562 = _2594;
        _2552 = _2596;
        _2556 = _2598;
    }
    float _2600 = _2562;
    float _2602 = _2552;
    float _2604 = _2556;
    float _2606 = -_1536;
    float _2608 = _2606 + _2600;
    float _2610 = -_1550;
    float _2612 = _2610 + _2602;
    float _2614 = -_1576;
    float _2616 = _2614 + _2604;
    float _2618 = _2608 * _2608;
    float _2620 = fma(_2612, _2612, _2618);
    float _2622 = fma(_2616, _2616, _2620);
    float _2624 = sqrt(_2622);
    bool _2626 = _2624 > 0.0;
    float _2628 = _2624;
    float _2630 = _2604;
    float _2632 = _2600;
    float _2634 = _2608;
    float _2636 = _2622;
    if (!_2626)
    {
        _2628 = _2602;
    }
    float _2638 = _2628;
    bool _2640 = !_2626;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2640)
    {
        bool _2646 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2648 = _2522;
        if (_2646)
        {
            float _2650 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2648 = _2650;
        }
        float _2652 = _2648;
        float _2654 = _2652;
        if (_2646)
        {
            float _2656 = _465 * _2652;
            _2390 = _2656;
        }
        float _2658 = _2390;
        float _2660 = _2658;
        if (_2646)
        {
            float _2662 = _467 * _2652;
            _2548 = _2662;
        }
        float _2664 = _2548;
        float _2666 = _2664;
        if (_2646)
        {
            float _2668 = _469 * _2652;
            _2654 = _2668;
        }
        float _2670 = _2654;
        float _2672 = _2670;
        if (!_2646)
        {
            bool _2674 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2676 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan(1.0);
            bool _2682 = _2678 || _2680;
            float _2684 = _123 + 1.0;
            if (!_2682)
            {
                float _2686 = _2684 * _2684;
                float _2688 = _2686 * 0.5;
                _125 = _2688;
            }
            float _2690 = _125;
            float _2692 = _2690;
            if (!_2682)
            {
                float _2694 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2692 = _2694;
            }
            float _2696 = _2692;
            bool _2698 = !_2682;
            float _2700 = _2696;
            if (!_2698)
            {
                float _2702 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2704 = log2(_2702);
                float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2708 = 1.0 + _2706;
                float _2710 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2712 = _2704 * _2684;
                float _2714 = 1.0 / _2708;
                float _2716 = _2710 * 0.693147182464599609375;
                float _2718 = exp2(_2712);
                float _2720 = 1.0 / _2716;
                float _2722 = _2718 + (-1.0);
                float _2724 = -_2722;
                float _2726 = fma(_2724, _2720, _2684);
                float _2728 = _2726 * _2714;
                float _2730 = _2728 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2700 = _2730;
            }
            float _2732 = _2700;
            float _2734 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2736 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2738 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2740 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2742 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2744 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2746 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2740);
            float _2748 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2742);
            float _2750 = _2742;
            _2642 = _2738;
            if (!_2682)
            {
                _2750 = _2684;
            }
            float _2752 = _2750;
            float _2754 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2746);
            bool _2756 = !_2682;
            float _2758 = _2752;
            if (!_2756)
            {
                float _2760 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2762 = log2(_2760);
                float _2764 = _2762 * _2684;
                float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2768 = 1.0 + _2766;
                float _2770 = exp2(_2764);
                float _2772 = 1.0 / _2768;
                float _2774 = -_2770;
                float _2776 = _2774 + 1.0;
                float _2778 = _2776 * _2772;
                _2758 = _2778;
            }
            float _2780 = _2758;
            float _2782 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2744);
            float _2784 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2748);
            float _2786 = fma(_2780, _163, _2754);
            float _2788 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2782);
            float _2790 = fma(_2780, _161, _2784);
            float _2792 = -_427;
            float _2794 = _2792 + _2786;
            float _2796 = fma(_2780, _165, _2788);
            float _2798 = -_433;
            float _2800 = _2798 + _2790;
            float _2802 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2804 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2806 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2808 = -_439;
            float _2810 = _2808 + _2796;
            float _2812 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2802);
            float _2814 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2804);
            float _2816 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2806);
            float _2818 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2812);
            float _2820 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2814);
            float _2822 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2816);
            _473 = _2820;
            _475 = _2818;
            _477 = _2822;
            _2660 = _2818;
            _2666 = _2820;
            _2672 = _2822;
        }
        float _2824 = _473;
        float _2826 = _475;
        float _2828 = _477;
        float _2830 = _2660;
        float _2832 = _2666;
        float _2834 = _2672;
        float _2836 = _2642;
        float _2838 = _2824 * _2824;
        float _2840 = rsqrt(_2622);
        float _2842 = fma(_2826, _2826, _2838);
        float _2844 = fma(_2828, _2828, _2842);
        float _2846 = sqrt(_2844);
        float _2848 = _2612 * _2840;
        float _2850 = _2608 * _2840;
        float _2852 = _2616 * _2840;
        bool _2854 = _2846 > 0.0;
        float _2856 = _2836;
        if (!_2854)
        {
            _2856 = _2602;
        }
        float _2858 = _2856;
        bool _2860 = !_2854;
        _2644 = _2858;
        if (!_2860)
        {
            float _2862 = rsqrt(_2844);
            float _2864 = _2862 * _2824;
            float _2866 = _2862 * _2826;
            float _2868 = _2862 * _2828;
            float _2870 = _2850 * _2864;
            float _2872 = fma(_2848, _2866, _2870);
            float _2874 = fma(_2852, _2868, _2872);
            float _2876 = _2874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2878 = fma(_2830, _2876, _2602);
            float _2880 = fma(_2832, _2876, _2600);
            float _2882 = fma(_2834, _2876, _2604);
            _2630 = _2882;
            _2644 = _2878;
            _2632 = _2880;
        }
    }
    float _2884 = _2630;
    float _2886 = _2644;
    float _2888 = _2632;
    float _2890 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2894 = isnan(0.5);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2890);
    bool _2904 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2906 = isnan(0.5);
    bool _2908 = _2904 || _2906;
    bool _2910 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2912 = _2908 || _2910;
    float _2914 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2902);
    float _2916 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2918 = _2914 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2920 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2916);
    float _2922 = 1.0 / _2918;
    float _2924 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2920);
    float _2926 = _2884;
    if (_2912)
    {
        _2634 = 1.0;
    }
    float _2928 = _2634;
    float _2930 = _2924 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2932 = _2930 + _2918;
    float _2934 = -_2306;
    float _2936 = _2934 + _2884;
    float _2938 = _2932 * _2922;
    float _2940 = _2938 * 0.5;
    float _2942 = -_2298;
    float _2944 = _2942 + _2886;
    float _2946 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2948 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2946);
    float _2950 = -_2300;
    float _2952 = _2950 + _2888;
    float _2954 = 1.0 / _2948;
    float _2956 = _2952;
    float _2958 = _2944;
    float _2960 = _2936;
    float _2962 = _2928;
    if (!_2900)
    {
        float _2964 = _2316 * _2316;
        float _2966 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2968 = -_1576;
        float _2970 = _2968 + _2884;
        float _2972 = -_1536;
        float _2974 = _2972 + _2888;
        float _2976 = fma(_2324, _2324, _2964);
        float _2978 = fma(_2332, _2332, _2976);
        float _2980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2982 = sqrt(_2978);
        float _2984 = _2966 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2986 = 1.0 / _2426;
        float _2988 = precise::min(_2982, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2990 = _2988 * _2980;
        float _2992 = _2990 * _2986;
        float _2994 = -_1550;
        float _2996 = _2994 + _2886;
        float _2998 = _2984 * _2992;
        float _3000 = _2970 * _2992;
        float _3002 = fma(_2996, _2998, _2310);
        float _3004 = fma(_2974, _2998, _2304);
        float _3006 = fma(_2984, _3000, _2320);
        _2956 = _3004;
        _2958 = _3002;
        _2960 = _3006;
        _2392 = _2982;
        _2926 = _3000;
    }
    float _3008 = _2956;
    float _3010 = _2958;
    float _3012 = _2960;
    float _3014 = _2392;
    float _3016 = _2926;
    float _3018 = _3016;
    float _3020 = _3014;
    if (_2912)
    {
        _3018 = 1.0;
    }
    float _3022 = _3018;
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3026 = _2954 * _3024;
    float _3028 = _3022;
    if (!_2912)
    {
        float _3030 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3032 = _3030 * 0.15915493667125701904296875;
        float _3034 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3038 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3036;
        float _3040 = _3032 * 6.283185482025146484375;
        float _3042 = cos(_3040);
        float _3044 = _3034 * 0.15915493667125701904296875;
        float _3046 = _3032 * 6.283185482025146484375;
        float _3048 = sin(_3046);
        float _3050 = 1.0 / _3042;
        float _3052 = _3044 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        float _3056 = _3048 * _3050;
        float _3058 = _3044 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = _3054 * _3056;
        float _3064 = 1.0 / _3038;
        float _3066 = 1.0 / _3062;
        float _3068 = _3060 * _3066;
        float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3072 = fma(_3026, _3068, _3070);
        float _3074 = _3072 * _3064;
        float _3076 = precise::clamp(_3074, 0.0, 1.0);
        _2394 = _3044;
        _2396 = _3032;
        _2962 = _3076;
    }
    float _3078 = _2394;
    float _3080 = _2396;
    float _3082 = _2962;
    float _3084 = _3078;
    float _3086 = _3080;
    if (!_2912)
    {
        float _3088 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3090 = _3088 * 0.15915493667125701904296875;
        float _3092 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3094 = _3090 * 6.283185482025146484375;
        float _3096 = cos(_3094);
        float _3098 = _3092 * 0.15915493667125701904296875;
        float _3100 = _3090 * 6.283185482025146484375;
        float _3102 = sin(_3100);
        float _3104 = 1.0 / _3096;
        float _3106 = _3098 * 6.283185482025146484375;
        float _3108 = cos(_3106);
        float _3110 = _3102 * _3104;
        float _3112 = _3098 * 6.283185482025146484375;
        float _3114 = sin(_3112);
        float _3116 = _3108 * _3110;
        float _3118 = 1.0 / _3116;
        float _3120 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3122 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3120;
        float _3124 = 1.0 / _3122;
        float _3126 = _3114 * _3118;
        float _3128 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3130 = fma(_3026, _3126, _3128);
        float _3132 = _3130 * _3124;
        float _3134 = precise::clamp(_3132, 0.0, 1.0);
        float _3136 = -_3134;
        float _3138 = _3136 + 1.0;
        _3084 = _3096;
        _3028 = _3138;
    }
    float _3140 = _3084;
    float _3142 = _3028;
    float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3146 = _3008 + _3144;
    float _3148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3150 = _3010 + _3148;
    float _3152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3154 = _3012 + _3152;
    float _3156 = _3146 * _3146;
    float _3158 = fma(_3150, _3150, _3156);
    float _3160 = fma(_3154, _3154, _3158);
    float _3162 = rsqrt(_3160);
    float _3164 = sqrt(_3160);
    float _3166 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3168 = _3150 * _3166;
    float _3170 = _3154 * _3166;
    float _3172 = _3168 * _3168;
    float _3174 = _3170 * _3170;
    float _3176 = _3172 + _3174;
    float _3178 = sqrt(_3176);
    bool _3180 = _3178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3184 = _3178 + _3182;
    float _3186 = _3154;
    float _3188 = _3162;
    float _3190 = _3184;
    float _3192 = _3166;
    if (_3180)
    {
        float _3194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3186 = _3194;
    }
    float _3196 = _3186;
    if (_3180)
    {
        float _3198 = rsqrt(_3176);
        _3188 = _3198;
    }
    float _3200 = _3188;
    float _3202 = _3200;
    if (_3180)
    {
        float _3204 = _3184 * _3196;
        _3190 = _3204;
    }
    float _3206 = _3190;
    if (_3180)
    {
        float _3208 = _3206 * 0.15915493667125701904296875;
        _3086 = _3208;
    }
    float _3210 = _3086;
    float _3212 = _3196;
    if (_3180)
    {
        float _3214 = _3210 * 6.283185482025146484375;
        float _3216 = sin(_3214);
        _3212 = _3216;
    }
    float _3218 = _3212;
    float _3220 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3222 = precise::max(0.0, _3220);
    float _3224 = _3140;
    float _3226 = _3222;
    if (_3180)
    {
        float _3228 = _3210 * 6.283185482025146484375;
        float _3230 = cos(_3228);
        _3224 = _3230;
    }
    float _3232 = _3224;
    float _3234 = -_3166;
    float _3236 = -_3222;
    float _3238 = fma(_3146, _3234, _3236);
    float _3240 = _3238;
    if (_3180)
    {
        float _3242 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3226 = _3242;
    }
    float _3244 = _3226;
    float _3246 = _3218;
    float _3248 = _3244;
    if (_3180)
    {
        float _3250 = fma(_3218, _3244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3192 = _3250;
    }
    float _3252 = _3192;
    float _3254 = _3252;
    if (!_3180)
    {
        _3246 = _3238;
    }
    float _3256 = _3246;
    float _3258 = _3256;
    if (_3180)
    {
        float _3260 = _3232 + (-1.0);
        _3248 = _3260;
    }
    float _3262 = _3248;
    float _3264 = _3262;
    if (_3180)
    {
        float _3266 = _3200 * _3252;
        _2636 = _3266;
    }
    float _3268 = _2636;
    if (!_3180)
    {
        _3202 = _3168;
    }
    float _3270 = _3202;
    float _3272 = _3270;
    if (_3180)
    {
        float _3274 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3020 = _3274;
    }
    float _3276 = _3020;
    if (_3180)
    {
        float _3278 = _3168 * _3268;
        _3272 = _3278;
    }
    float _3280 = _3272;
    if (!_3180)
    {
        _3264 = _3170;
    }
    float _3282 = _3264;
    float _3284 = _3282;
    if (_3180)
    {
        float _3286 = _3170 * _3268;
        _3284 = _3286;
    }
    float _3288 = _3284;
    if (!_3180)
    {
        _3254 = _3172;
    }
    float _3290 = _3254;
    float _3292 = _3290;
    if (_3180)
    {
        float _3294 = fma(_3238, _3232, _3276);
        _3258 = _3294;
    }
    float _3296 = _3258;
    if (_3180)
    {
        float _3298 = _3280 * _3280;
        _3292 = _3298;
    }
    float _3300 = _3292;
    if (!_3180)
    {
        _3240 = _3174;
    }
    float _3302 = _3240;
    float _3304 = _3302;
    if (_3180)
    {
        float _3306 = _3288 * _3288;
        _3304 = _3306;
    }
    float _3308 = _3304;
    float _3310 = fma(_3296, _3296, _3300);
    float _3312 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3314 = _3310 + _3308;
    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3318 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3316);
    float _3320 = precise::clamp(_3318, 0.0, 1.0);
    float _3322 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3312);
    float _3324 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3326 = rsqrt(_3314);
    float _3328 = -_3320;
    float _3330 = _3328 + 1.0;
    float _3332 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3334 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3322);
    float _3336 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3338 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3324);
    float _3340 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3342 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3344 = abs(_3330);
    float _3346 = log2(_3344);
    float _3348 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3336);
    float _3350 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3338);
    float _3352 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3340);
    float _3354 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3356 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3348);
    float _3358 = _3350 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3360 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3352);
    float _3362 = _3326 * _3280;
    float _3364 = -_3354;
    float _3366 = fma(_3364, _3332, 1.0);
    float _3368 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3370 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3372 = _3326 * _3296;
    float _3374 = _3362 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3376 = _3360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3378 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3370);
    float _3380 = _3326 * _3288;
    float _3382 = -_3374;
    float _3384 = fma(_3372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3382);
    float _3386 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3388 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3378);
    float _3390 = log2(_3366);
    float _3392 = -_3380;
    float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3384);
    float _3396 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3398 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3388);
    float _3400 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3402 = fma(_3394, -0.5, 0.5);
    float _3404 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3396);
    float _3406 = fma(_3394, 0.5, 0.5);
    float _3408 = exp2(_3386);
    float _3410 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3400);
    float _3412 = _3372 + 1.0;
    float _3414 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3404);
    float _3416 = fma(_3406, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3418 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3410);
    float _3420 = 1.0 / _3398;
    float _3422 = fma(_3406, _3416, -0.212114393711090087890625);
    float _3424 = _3390 * 0.693147182464599609375;
    float _3426 = fma(_3406, _3422, 1.570728778839111328125);
    float _3428 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3430 = sqrt(_3402);
    float _3432 = -_3372;
    float _3434 = fma(_3408, _3412, _3432);
    float _3436 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3414);
    float _3438 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3418);
    float _3440 = _3436 * _3420;
    float _3442 = _3438 * _3420;
    float _3444 = fma(_3440, 0.5, 0.5);
    float _3446 = fma(_3442, -0.5, 0.5);
    float _3448 = fma(_3434, 0.5, 0.5);
    float _3450 = _3430 * 0.636619746685028076171875;
    float _3452 = -_3426;
    float _3454 = fma(_3450, _3452, 1.0);
    float3 _8785 = float3(_3444, _3446, _3428);
    float _3456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8785, float3(0.0), isnan(_8785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8785, float3(0.0), isnan(_8785)), level(0.0)).x;
    float3 _8796 = float3(_3444, _3446, _3428);
    float4 _3459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8796, float3(0.0), isnan(_8796)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8796, float3(0.0), isnan(_8796)), level(0.0)).xyzw;
    float _3461 = _3459.x;
    float _3463 = _3459.y;
    float _3465 = _3459.z;
    float _3467 = _3459.w;
    float2 _8813 = float2(_3454, _3448);
    float3 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8813, float2(0.0), isnan(_8813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8813, float2(0.0), isnan(_8813)), level(0.0)).xyz;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3481 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3483 = _3082 > 0.0;
    bool _3485 = isnan(_3082);
    bool _3487 = _3483 || _3485;
    bool _3489 = isnan(0.0);
    bool _3491 = _3487 || _3489;
    float _3493 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3481);
    float _3495 = exp2(_3479);
    bool _3497 = _3142 <= 0.0;
    bool _3499 = !_3491;
    bool _3501 = _3497 || _3499;
    float _3503 = _3398 * 0.5;
    float _3505 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3493);
    float _3507 = _3436 + _3398;
    float _3509 = fma(_3438, -0.5, _3503);
    float _3511 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3513 = _3507 * 0.5;
    float _3515 = _3082 * _3142;
    float _3517 = _3511 + _3398;
    out.gl_Position.x = _3436;
    out.gl_Position.y = _3438;
    out.gl_Position.z = _3511;
    out.gl_Position.w = _3398;
    float _3519 = _3515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3521 = _3517 * 0.5;
    float _3523 = -_3495;
    float _3525 = _3523 + 1.0;
    float _3527 = _3519 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3529 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3513;
    out.m_68.y = _3509;
    out.m_68.z = _3521;
    out.m_68.w = _3398;
    out.m_45.x = _3527;
    float _3531 = _3529 * _3456;
    float _3533 = -_3529;
    float _3535 = _3533 + 1.0;
    float _3537 = _3467 * _3531;
    float _3539 = _3477 * _3531;
    float _3541 = _3467 * _3535;
    float _3543 = fma(_3473, _3537, _3461);
    float _3545 = fma(_3475, _3537, _3463);
    float _3547 = fma(_3467, _3539, _3465);
    out.m_70.x = _3543;
    out.m_70.y = _3545;
    out.m_70.z = _3547;
    out.m_70.w = _3541;
    if (!_3501)
    {
        return out;
    }
    float _3549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3549;
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
    bool _859 = false;
    bool _745 = false;
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
        float _3606 = as_type<float>(_105);
        out.gl_Position.z = _3606;
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
        float _3676 = as_type<float>(_143);
        out.gl_Position.z = _3676;
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
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _505 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = 1.0 / _517;
    bool _533 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _535 = 1.0 / _525;
    float _537 = 1.0 / _521;
    float _539 = _509 * _531;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = _505 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _505 + _545;
    bool _549 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _551 = isnan(_505);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _529;
    float _563 = _543 * _535;
    bool _565 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _567 = isnan(_505);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _577;
    float _581 = _513 * _537;
    bool _583 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _585 = isnan(_505);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_579, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = -_593;
    float _603 = _601 + 1.0;
    float _605 = _547 * _561;
    float _607 = -_575;
    float _609 = _607 + 1.0;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _611;
    float _615 = _559 * _603;
    bool _617 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_505);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _593 * _609;
    bool _631 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _633 = isnan(_505);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _647 = -_559;
    float _649 = _647 + 1.0;
    float _651 = fma(_613, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _653 = fma(_599, _581, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _655 = fma(_645, _581, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _657 = _641 * _649;
    float _659 = -_641;
    float _661 = _659 + 1.0;
    float _663 = -_627;
    float _665 = _663 + 1.0;
    float _667 = in.m_52.x;
    float _669 = in.m_52.y;
    float _671 = _627 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _677;
    float _681 = _595 * _671;
    float _683 = _651 * _671;
    float _685 = fma(_675, _563, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _687 = fma(_679, _563, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _689 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _681);
    float _691 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _683);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _701 = fma(_653, _657, _689);
    float _703 = fma(_655, _657, _691);
    float _705 = fma(_695, _605, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _707 = fma(_699, _605, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _709 = fma(_685, _615, _701);
    float _711 = fma(_687, _615, _703);
    float _713 = fma(_705, _629, _709);
    float _715 = fma(_707, _629, _711);
    float _717 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[147].x, _713);
    float _719 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[147].y, _715);
    float _721 = _717 * _667;
    float _723 = _719 * _669;
    bool _725 = !_533;
    float _743;
    if (!_725)
    {
        float _727 = in.m_54.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_89);
        float _749 = 1.0 / _747;
        float _751 = _123 * _749;
        _743 = _751;
    }
    _745 = false;
    float _753 = _743;
    bool _755 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _757 = isnan(_753);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _771 = _753 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _773 = isnan(_753);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _789 = _753 + _787;
    float _791 = -_765;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _769;
    float _797 = _781 * _793;
    float _799 = -_781;
    float _801 = _799 + 1.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _785 * _795;
    float _819 = fma(_817, _789, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _821 = _819 * _797;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[115].x, _821);
    float _825 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[116].x, _823);
    float _827 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _811;
    out.m_56.y = _813;
    out.m_56.z = _815;
    out.m_56.w = _827;
    bool _829 = !_807;
    float _853;
    float _855;
    float _857;
    if (!_829)
    {
        float _831 = in.m_54.x;
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _835 = float(_89);
        float _837 = 1.0 / _835;
        float _839 = _831 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _841 = _123 * _837;
        float _843 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _845 = _843 * _833;
        float _847 = floor(_845);
        float _849 = -_847;
        float _851 = _845 + _849;
        _853 = _841;
        _855 = _851;
        _857 = _835;
        _859 = true;
    }
    else
    {
        float _861 = float(_89);
        float _863 = 1.0 / _861;
        float _865 = _123 * _863;
        _853 = _865;
        _855 = _865;
        _857 = _861;
    }
    _859 = false;
    float _867 = _853;
    float _869 = _855;
    float _871 = _857;
    float _873 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _875 = int(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _879 = _867 + _877;
    float _881 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _883;
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _889 = int(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _903 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _905 = isnan(_869);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = 1.0 / _885;
    float _917 = float(_875);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _919;
    bool _923 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _925 = isnan(_867);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    bool _935 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _937 = isnan(_867);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = 1.0 / _917;
    float _949 = float(uint(_889));
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _953 = ~_889;
    int _955 = _953 + 1;
    float _957 = float(_889);
    bool _959 = _889 == 0;
    float _961 = 1.0 / _949;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _965 = _123 * _947;
    int _967 = ~_889;
    int _969 = _967 + 1;
    float _971 = 1.0 / _893;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _977 = _975 != 0;
    int _979 = as_type<int>(_961) + (-2);
    float _981 = trunc(_965);
    int _983 = int(_981);
    float _985 = 1.0 / _897;
    float _987 = float(uint(_983));
    float _989 = 1.0 / _901;
    float _991 = as_type<float>(_979) * _987;
    float _993 = in.m_54.x;
    float _995 = in.m_54.y;
    float _997 = in.m_54.z;
    float _999 = in.m_54.w;
    float _1001 = trunc(_991);
    float _1003 = precise::max(_1001, 0.0);
    uint _1006 = uint(_1003);
    float _1008 = float(_983);
    int _1010 = _969 * int(_1006);
    int _1012 = _1010 + _983;
    float _1014 = float(uint(_1012));
    float _1016 = _995 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1018 = !_977;
    float _1020 = _1018 ? _995 : _993;
    float _1022 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[79].z, _951);
    float _1024 = 0.0;
    if (!_977)
    {
        _1024 = _997;
    }
    float _1026 = _1024;
    float _1028 = as_type<float>(_979) * _1014;
    float _1030 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1022);
    float _1032 = _1026;
    if (_977)
    {
        _1032 = _995;
    }
    float _1034 = _1032;
    float _1036 = -_933;
    float _1038 = _1036 + 1.0;
    bool _1040 = !_977;
    float _1042 = _1040 ? 1.2345600128173828125 : 1.0;
    float _1044 = trunc(_1028);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    float _1050 = _1030 * (-0.15915493667125701904296875);
    float _1052 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1054 = _1042 * _1020;
    float _1056 = floor(_1054);
    int _1058 = int(_1006) + int(_1048);
    bool _1060 = _1008 >= _957;
    bool _1062 = isnan(_1008);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan(_957);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    int _1072 = _955 * _1058;
    int _1074 = _1072 + _983;
    float _1076 = 1.0 / _871;
    float _1078 = -_1056;
    float _1080 = _1054 + _1078;
    bool _1082 = uint(_1074) >= uint(_889);
    float _1084 = trunc(_1070);
    int _1086 = int(_1084);
    bool _1088 = !_1082;
    int _1090 = _1088 ? 0 : (-1);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1106 = _1104 != 0;
    int _1108 = ~_1058;
    int _1110 = _1108 + _1090;
    int _1112 = _1110 + 1;
    float _1114 = _1080 * _957;
    float _1116 = _123 * _957;
    bool _1118 = !_1098;
    int _1120 = _1118 ? 0 : 1;
    int _1122 = _889 * _1112;
    int _1124 = _1122 + _983;
    float _1126 = _1116 * _1076;
    float _1128 = trunc(_1114);
    int _1130 = int(_1128);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1134 = _1132 != 0;
    bool _1136 = !_959;
    int _1138 = _1136 ? _1124 : (-1);
    int _1140 = ~_1086;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    int _1146 = _889 + (-1);
    float _1148 = trunc(_1126);
    int _1150 = int(_1148);
    bool _1152 = !_1134;
    int _1154 = _1152 ? 0 : 1;
    int _1156 = _1138 * _1144;
    int _1158 = abs(_1120);
    bool _1160 = !_1102;
    int _1162 = _1160 ? 0 : 1;
    int _1164 = _1086 * _1146;
    int _1166 = _1164 + _1156;
    bool _1168 = !_1094;
    int _1170 = _1168 ? 0 : 1;
    int _1172 = abs(_1154);
    int _1174 = abs(_1170);
    int _1176 = _1130 * _1172;
    int _1178 = _1176 + _983;
    bool _1180 = !_1106;
    int _1182 = _1180 ? 0 : 1;
    int _1184 = abs(_1162);
    int _1186 = _1166 * _1158;
    int _1188 = abs(_1182);
    int _1190 = _1150 * _1174;
    int _1192 = _1190 + _1186;
    float _1194 = _993 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1196 = _1178 * _1184;
    int _1198 = _1196 + _1192;
    int _1200 = ~_889;
    int _1202 = _1200 + 1;
    int _1204 = _1130 * _1188;
    int _1206 = _1204 + _1198;
    float _1208 = as_type<float>(_1130);
    if (!_977)
    {
        _1208 = _995;
    }
    float _1210 = _1208;
    float _1212 = _1210;
    if (_977)
    {
        _1212 = _993;
    }
    float _1214 = _1212;
    float _1216 = float(uint(_1206));
    float _1218 = as_type<float>(_979) * _1216;
    float _1220 = trunc(_1218);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    int _1226 = _1202 * int(_1224);
    int _1228 = _1226 + _1206;
    float _1230 = float(uint(_1228));
    float _1232 = as_type<float>(_979) * _1230;
    int _1234 = ~_889;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1232);
    float _1240 = precise::max(_1238, 0.0);
    uint _1242 = uint(_1240);
    int _1244 = int(_1224) + int(_1242);
    int _1246 = _1236 * _1244;
    int _1248 = _1246 + _1206;
    float _1250 = _993 * 2.0;
    bool _1252 = uint(_1248) >= uint(_889);
    float _1254 = floor(_1250);
    bool _1256 = !_1252;
    int _1258 = _1256 ? 0 : (-1);
    int _1260 = ~_1244;
    int _1262 = _1260 + _1258;
    int _1264 = _1262 + 1;
    float _1266 = _995 * 2.0;
    int _1268 = _889 * _1264;
    int _1270 = _1268 + _1206;
    float _1272 = floor(_1266);
    bool _1274 = !_959;
    int _1276 = _1274 ? _1270 : (-1);
    bool _1278 = _1254 > 0.0;
    int _1280 = _1276 & 3;
    bool _1282 = _1280 != 0;
    int _1284 = _1276 & 3;
    bool _1286 = _1284 != 0;
    int _1288 = _1282 ? 0 : 1;
    bool _1290 = uint(_1284) > 1u;
    bool _1292 = _1254 >= 0.0;
    bool _1294 = isnan(_1254);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    int _1302 = ~_1288;
    int _1304 = _1302 + 1;
    int _1306 = _1304 + 1;
    float _1308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1310 = log2(_1308);
    int _1312 = _1300 ? 0 : 1;
    bool _1314 = _999 > 0.5;
    int _1316 = ~_1312;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    int _1322 = _1320;
    int _1324 = _1306;
    if (!_1278)
    {
        int _1326 = ~_1312;
        int _1328 = _1326 + 1;
        _1322 = _1328;
    }
    int _1330 = _1322;
    float _1332 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_1290)
    {
        int _1334 = ~_1288;
        int _1336 = _1334 + 1;
        _1324 = _1336;
    }
    int _1338 = _1324;
    bool _1340 = _993 > 0.5;
    float _1342 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1332);
    bool _1344 = _995 > 0.5;
    float _1346 = -_225;
    int _1348 = _1314 ? as_type<int>(_1346) : as_type<int>(_225);
    bool _1350 = _1272 >= 0.0;
    bool _1352 = isnan(_1272);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    float _1360 = -_221;
    int _1362 = _1340 ? as_type<int>(_1360) : as_type<int>(_221);
    float _1364 = -_225;
    int _1366 = _1344 ? as_type<int>(_1364) : as_type<int>(_225);
    bool _1368 = _997 > 0.5;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1372 = _1370 != 0;
    int _1374 = _1358 ? 0 : 1;
    bool _1376 = _1272 > 0.0;
    float _1378 = -_221;
    int _1380 = _1368 ? as_type<int>(_1378) : as_type<int>(_221);
    bool _1382 = !_1372;
    float _1384 = _1382 ? _225 : as_type<float>(_1348);
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    bool _1394 = !_1388;
    float _1396 = _1394 ? _221 : as_type<float>(_1362);
    float _1398 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1400 = !_1392;
    float _1402 = _1400 ? _225 : as_type<float>(_1366);
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1406 = _1404 != 0;
    float _1408 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1398);
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1412 = _1410 != 0;
    float _1414 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1416 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1408);
    int _1418 = ~_1374;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1414);
    int _1426 = _1422;
    float _1428 = _1398;
    if (!_1376)
    {
        int _1430 = ~_1374;
        int _1432 = _1430 + 1;
        _1426 = _1432;
    }
    int _1434 = _1426;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1440 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1424);
    float _1442 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1342);
    if (!_977)
    {
        _1428 = _997;
    }
    float _1444 = _1428;
    float _1446 = 1.0 / _1438;
    float _1448 = _1444;
    if (_977)
    {
        _1448 = _995;
    }
    float _1450 = _1448;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1460 = _1458 != 0;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1464 = _1462 != 0;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1468 = -_1452;
    float _1470 = fma(_1194, 2.0, _1468);
    float _1472 = fma(_1016, -2.0, _1466);
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1480 = _869 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1486;
    float _1490 = _1480 * _915;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1496 = _997 * 2.0;
    float _1498 = 1.0 / _1484;
    float _1500 = _1494 * _971;
    float _1502 = _1488 * _985;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1504;
    bool _1508 = !_1412;
    float _1510 = _1508 ? _221 : as_type<float>(_1380);
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1514 = _1512 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1516 = fma(_921, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1518 = 1.0 / _1476;
    float _1520 = _1506 * _989;
    float _1522 = fma(_1500, _879, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1524 = _869 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1526 = isnan(_869);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = _1440 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1538 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1540 = isnan(_867);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1552 = floor(_1496);
    float _1554 = _123 * _1310;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1564 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1566 = isnan(_867);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = _1442 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1578 = _1558 * _1446;
    float _1580 = _995 + _993;
    float _1582 = exp2(_1554);
    float _1584 = _1580 + (-1.0);
    int _1586 = abs(_1338);
    bool _1588 = _889 == 0;
    float _1590 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1592 = 1.0 / _1514;
    bool _1594 = _1552 >= 0.0;
    bool _1596 = isnan(_1552);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan(0.0);
    bool _1602 = _1598 || _1600;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = -_1582;
    float _1618 = _1616 + 1.0;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1620;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1628;
    int _1632 = ~_1586;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    float _1638 = _1622 * _1498;
    float _1640 = _995 + _997;
    float _1642 = _1626 * _1518;
    float _1644 = fma(_1630, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1646 = _1640 + (-1.0);
    float _1648 = _1614 ? _1618 : 0.0;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1652 = _867 + _1650;
    bool _1654 = _1552 > 0.0;
    float _1656 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1660 = _867 + _1658;
    float _1662 = fma(_1638, _1652, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1666 = _867 + _1664;
    float _1668 = _1562 * _1592;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1670;
    float _1674 = fma(_1520, _1660, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1678 = _867 + _1676;
    float _1680 = fma(_1642, _1666, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1682 = fma(_1672, _1490, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1686 = _867 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1690 = _867 + _1688;
    bool _1692 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1694 = isnan(_867);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1700 = _1696 || _1698;
    float _1702 = float(_1700);
    float _1704 = fma(_1668, _1678, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1706 = fma(_1578, _1686, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1708 = fma(_1502, _1690, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1710 = -_1534;
    float _1712 = _1710 + 1.0;
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    bool _1718 = !_1460;
    int _1720 = _1718 ? 0 : 1;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1724 = _913 * _1712;
    float _1726 = _1548 * _1716;
    float _1728 = -_1548;
    float _1730 = _1728 + 1.0;
    float _1732 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1722);
    bool _1734 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1736 = isnan(_867);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1644 * _1724;
    float _1748 = _1516 * _1724;
    float _1750 = _1682 * _1724;
    bool _1752 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1754 = isnan(_867);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = _1744 * _1730;
    float _1766 = -_1744;
    float _1768 = _1766 + 1.0;
    float _1770 = -_1762;
    float _1772 = _1770 + 1.0;
    bool _1774 = _867 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1776 = isnan(_867);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = _1762 * _1768;
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1790 = 1.0 + _1788;
    float _1792 = _1574 * _1772;
    float _1794 = -_1574;
    float _1796 = _1794 + 1.0;
    float _1798 = _1784 * _1038;
    float _1800 = 1.0 / _1790;
    float _1802 = -_1784;
    float _1804 = _1802 + 1.0;
    float _1806 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[83].z, _963);
    float _1808 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1812 = _945 * _1804;
    float _1814 = -_945;
    float _1816 = _1814 + 1.0;
    float _1818 = -_973;
    float _1820 = fma(_1808, 2.0, _1818);
    float _1822 = _933 * _1796;
    float _1824 = _1708 * _1812;
    float _1826 = -_913;
    float _1828 = _1826 + 1.0;
    float _1830 = fma(_1052, -2.0, _1810);
    float _1832 = _1050 * 6.283185482025146484375;
    float _1834 = sin(_1832);
    float _1836 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1824);
    float _1838 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1748);
    int _1840 = ~_1604;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    float _1846 = _1648 * _1800;
    float _1848 = fma(_1522, _1798, _1836);
    float _1850 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1746);
    float _1852 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1750);
    float _1854 = _1050 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1838);
    float _1860 = fma(_1674, _1822, _1848);
    float _1862 = float(uint(_1178));
    float _1864 = _1510 + 0.5;
    bool _1866 = !_1456;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = -_123;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1820);
    int _1874 = _1844;
    if (!_1654)
    {
        int _1876 = ~_1604;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    float _1882 = as_type<float>(_979) * _1862;
    float _1884 = _1402 * _1834;
    int _1886 = abs(_1868);
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1890 = _1536 + _1888;
    float _1892 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1830);
    int _1894 = abs(_1720);
    float _1896 = trunc(_1882);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    bool _1902 = uint(_1284) >= 2u;
    float _1904 = _1402 * _1856;
    float _1906 = -_1884;
    float _1908 = fma(_1396, _1856, _1906);
    float _1910 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1852);
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1914 = fma(_1396, _1834, _1904);
    float _1916 = _1384 + (-0.5);
    float _1918 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1850);
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1922 = _1550 + _1920;
    float _1924 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1872);
    float _1926 = -_1916;
    float _1928 = -_1892;
    float _1930 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1928);
    float _1932 = float(_1894);
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1912);
    int _1936 = _1902 ? 0 : 1;
    float _1938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1940 = float(_1330);
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1944 = _1576 + _1942;
    int _1946 = ~_889;
    int _1948 = _1946 + 1;
    bool _1950 = _1284 != 3;
    float _1952 = _1932 * _1940;
    float _1954 = float(_1886);
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1958 = float(_1880);
    int _1960 = _1948 * int(_1900);
    int _1962 = _1960 + _1178;
    int _1964 = ~_1936;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    float _1970 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1934);
    float _1972 = _1952 * (-2.0);
    float _1974 = _1954 * _1958;
    int _1976 = _1276 >> 31;
    float _1978 = float(uint(_1962));
    float _1980 = _1974 * (-2.0);
    int _1982 = _1976 & 3;
    float _1984 = fma(_1656, _1972, _1656);
    int _1986 = _1968;
    if (_1950)
    {
        int _1988 = ~_1936;
        int _1990 = _1988 + 1;
        _1986 = _1990;
    }
    int _1992 = _1986;
    float _1994 = fma(_1706, _1792, _1860);
    int _1996 = _1276 + _1982;
    float _1998 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2000 = as_type<float>(_979) * _1978;
    float _2002 = -_123;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1470);
    int _2006 = _1996 >> 2;
    float _2008 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1472);
    float _2010 = _1918 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2012 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2014 = _1910 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2016 = _1908 + 0.5;
    float _2018 = _1858 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2020 = _1914 + (-0.5);
    float _2022 = trunc(_2000);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    int _2028 = _2006 << 4;
    int _2030 = _2028 + 512;
    float _2032 = fma(_2012, _2016, _2004);
    float _2034 = -_1998;
    float _2036 = -_2008;
    float _2038 = fma(_2034, _2020, _2036);
    uint _2040 = uint(int(uint(_2030) >> uint(2)));
    uint _2042 = uint(int(uint(int(_2040)) >> uint(2)));
    int _2044 = int(_2040) & 3;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[int(_2042)][_2044];
    int _2048 = int(_2040) + 1;
    uint _2050 = uint(int(uint(_2048) >> uint(2)));
    int _2052 = _2048 & 3;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[int(_2050)][_2052];
    float _2056 = fma(_1662, _1786, _1994);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2060 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2064 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2068 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2070 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1732);
    int _2072 = int(_1900) + int(_2026);
    float _2074 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1806);
    float _2076 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2058);
    out.m_58.x = _2060;
    out.m_58.y = _2064;
    out.m_58.z = _2068;
    out.m_58.w = _2066;
    int _2078 = _2030 + 8;
    uint _2080 = uint(int(uint(_2078) >> uint(2)));
    uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
    int _2084 = int(_2080) & 3;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[int(_2082)][_2084];
    int _2088 = int(_2080) + 1;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    int _2092 = _2088 & 3;
    float _2094 = (*spvDescriptorSet0.vp_c9)._m0[int(_2090)][_2092];
    float _2096 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2062);
    float _2098 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2076);
    float _2100 = in.m_60.x;
    float _2102 = in.m_60.y;
    float _2104 = in.m_60.z;
    float _2106 = fma(_1704, _1764, _2056);
    float _2108 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2096);
    int _2110 = abs(_1992);
    float _2112 = fma(_1590, _1980, _1590);
    bool _2114 = _1970 >= 0.0;
    float _2116 = fma(_1680, _1726, _2106);
    float _2118 = -_2074;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2070;
    float _2124 = _2122 + 1.0;
    float _2126 = -_2098;
    float _2128 = _2126 + 1.0;
    float _2130 = -_2108;
    float _2132 = _2130 + 1.0;
    float _2134 = -_2120;
    float _2136 = fma(_1510, _2134, _1924);
    int _2138 = ~_889;
    int _2140 = _2138 + 1;
    float _2142 = fma(_1384, _2124, _1930);
    bool _2144 = !_1286;
    int _2146 = _2144 ? 0 : 1;
    float _2148 = -_2128;
    float _2150 = fma(_1908, _2148, _2032);
    float _2152 = fma(_1914, _2132, _2038);
    int _2154 = _2140 * _2072;
    int _2156 = _2154 + _1178;
    int _2158 = abs(_2146);
    float _2160 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2116);
    if (_2114)
    {
        out.m_45.x = 0.0;
    }
    float _2162 = fma(_1980, _2100, _2100);
    bool _2164 = uint(_2156) >= uint(_889);
    float _2166 = fma(_1972, _2102, _2102);
    out.m_62.x = _2150;
    out.m_62.y = _2152;
    out.m_62.z = _2136;
    out.m_62.w = _2142;
    bool _2168 = !_2164;
    int _2170 = _2168 ? 0 : (-1);
    int _2172 = _1636 * as_type<int>(_2054);
    bool _2174 = _1284 != 3;
    out.m_64.x = _2160;
    int _2176 = ~_2072;
    int _2178 = _2176 + _2170;
    int _2180 = _2178 + 1;
    bool _2182 = !_2174;
    int _2184 = _2182 ? 0 : (-1);
    int _2186 = ~_2158;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = abs(_2184);
    int _2194 = _2190 * as_type<int>(_2046);
    int _2196 = _2194 + _2172;
    bool _2198 = !_1406;
    int _2200 = _2198 ? 0 : 1;
    int _2202 = ~_2110;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = _1890 * _1890;
    int _2210 = abs(_2200);
    float _2212 = fma(_1922, _1922, _2208);
    float _2214 = _993 + (-0.5);
    int _2216 = _2206 * as_type<int>(_2086);
    int _2218 = _2216 + _2196;
    int _2220 = ~_2192;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = fma(_1944, _1944, _2212);
    float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2162);
    int _2230 = _889 * _2180;
    int _2232 = _2230 + _1178;
    int _2234 = ~_2210;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = _2224 * as_type<int>(_2094);
    int _2242 = _2240 + _2218;
    float _2244 = _2212;
    float _2246 = _2104;
    if (_2114)
    {
        _2244 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2248 = _2244;
    float _2250 = rsqrt(_2226);
    bool _2252 = !_1588;
    int _2254 = _2252 ? _2232 : (-1);
    int _2256 = _2242 * _2238;
    bool _2258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2260 = isnan(1.0);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2266 = _2262 || _2264;
    int _2268 = as_type<int>(_2248);
    if (_2114)
    {
        float _2270 = _2248 * 5.0;
        _2268 = as_type<int>(_2270);
    }
    int _2272 = _2268;
    int _2274 = _2254 * _2210;
    int _2276 = _2274 + _2256;
    float _2278 = _881 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2280 = !_2266;
    float _2282 = _2280 ? _123 : _1846;
    float _2284 = _995 + (-0.5);
    bool _2286 = !_1464;
    int _2288 = _2286 ? 0 : 1;
    if (_2114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6962 = as_type<float>(_2272);
        out.gl_Position.z = _6962;
    }
    float _2290 = float(_2276);
    float _2292 = fma(_2282, _2112, _2228);
    int _2294 = abs(_2288);
    float _2296 = _2278 * _2250;
    out.m_66.y = _2290;
    float _2298 = _1922 * _2296;
    float _2300 = _1890 * _2296;
    if (_2114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2302 = -_2300;
    float _2304 = _1536 + _2302;
    float _2306 = _1944 * _2296;
    float _2308 = -_2298;
    float _2310 = _1550 + _2308;
    float _2312 = float(_2294);
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2316 = _2304 + _2314;
    float _2318 = -_2306;
    float _2320 = _1576 + _2318;
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2324 = _2310 + _2322;
    float _2326 = float(_1434);
    float _2328 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2320 + _2330;
    float _2334 = _997 + _993;
    float _2336 = -_2300;
    float _2338 = _1890 + _2336;
    float _2340 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2328);
    float _2342 = _2312 * _2326;
    float _2344 = _2334 + (-1.0);
    float _2346 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2166);
    float _2348 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2340);
    float _2350 = -_2298;
    float _2352 = _1922 + _2350;
    float _2354 = _2338 * _2338;
    float _2356 = _2342 * (-2.0);
    float _2358 = fma(_2282, _1984, _2346);
    bool _2360 = _2348 >= 0.0;
    float _2362 = fma(_2352, _2352, _2354);
    float _2364 = -_2306;
    float _2366 = _1944 + _2364;
    float _2368 = _997 + (-0.5);
    float _2370 = _2358 * 0.15915493667125701904296875;
    float _2372 = _2292 * 0.15915493667125701904296875;
    float _2374 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2376 = fma(_2356, _2104, _2104);
    float _2378 = fma(_2366, _2366, _2362);
    float _2380 = _2372 * 6.283185482025146484375;
    float _2382 = sin(_2380);
    float _2384 = fma(_2374, _2356, _2374);
    float _2386 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2376);
    int _2388 = as_type<int>(_2368);
    float _2390 = _2370;
    float _2392 = _2324;
    float _2394 = _2310;
    float _2396 = _2320;
    if (_2360)
    {
        _2246 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2398 = _2246;
    if (_2360)
    {
        out.m_45.x = 0.0;
    }
    float _2400 = fma(_2282, _2384, _2386);
    float _2402 = _2372 * 6.283185482025146484375;
    float _2404 = cos(_2402);
    if (_2360)
    {
        float _2406 = _2398 * 5.0;
        _2388 = as_type<int>(_2406);
    }
    int _2408 = _2388;
    float _2410 = _2400 * 0.15915493667125701904296875;
    if (_2360)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7157 = as_type<float>(_2408);
        out.gl_Position.z = _7157;
    }
    float _2412 = _2370 * 6.283185482025146484375;
    float _2414 = sin(_2412);
    float _2416 = sqrt(_2378);
    float _2418 = _2370 * 6.283185482025146484375;
    float _2420 = cos(_2418);
    if (_2360)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2422 = _2410 * 6.283185482025146484375;
    float _2424 = cos(_2422);
    float _2426 = _2250 * _2416;
    float _2428 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2430 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2432 = _2404 * _2420;
    float _2434 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2436 = _2426 * _2428;
    float _2438 = _881 * _2426;
    float _2440 = _2410 * 6.283185482025146484375;
    float _2442 = sin(_2440);
    float _2444 = _2430 * _2436;
    float _2446 = _2382 * _2414;
    float _2448 = _2424 * _2444;
    float _2450 = _2434 * _2438;
    float _2452 = _2404 * _2414;
    float _2454 = _2382 * _2420;
    float _2456 = _2404 * _2448;
    float _2458 = _2414 * _2424;
    float _2460 = _2420 * _2424;
    float _2462 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2464 = _2462 * 0.5;
    float _2466 = fma(_2442, _2432, _2446);
    float _2468 = -_2444;
    float _2470 = _2442 * _2468;
    float _2472 = _2382 * _2448;
    float _2474 = fma(_2442, _2446, _2432);
    float _2476 = fma(_2466, _2450, _2456);
    float _2478 = -_2454;
    float _2480 = fma(_2442, _2452, _2478);
    float _2482 = -_2452;
    float _2484 = fma(_2442, _2454, _2482);
    float _2486 = fma(_2460, _2450, _2470);
    float _2488 = fma(_2480, _2464, _2476);
    float _2490 = fma(_2484, _2450, _2472);
    float _2492 = fma(_2458, _2464, _2486);
    float _2494 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2496 = fma(_2474, _2464, _2490);
    float _2498 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2500 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2494);
    float _2502 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2498);
    float _2504 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2500);
    float _2506 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2502);
    float _2508 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2510 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2512 = _1576 + _2508;
    float _2514 = _1550 + _2510;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2518 = _2512 + _2516;
    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2522 = _2514 + _2520;
    float _2524 = _2518 * _2518;
    float _2526 = fma(_2522, _2522, _2524);
    float _2528 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2530 = sqrt(_2526);
    float _2532 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2528);
    float _2534 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2532);
    float _2536 = _2534 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2538 = _1536 + _2536;
    bool _2540 = _2530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2542 = _2536;
    float _2544 = _2514;
    float _2546 = _2454;
    float _2548 = _2518;
    if (!_2540)
    {
        _2542 = _2514;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (!_2540)
    {
        _2544 = _2512;
    }
    float _2554 = _2544;
    float _2556 = _2554;
    if (!_2540)
    {
        _2546 = _2538;
    }
    float _2558 = _2546;
    bool _2560 = !_2540;
    float _2562 = _2558;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2530 + _2566;
        float _2570 = rsqrt(_2526);
        float _2572 = _2568 * _2564;
        float _2574 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = cos(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = sin(_2582);
        float _2586 = _2580 + (-1.0);
        float _2588 = fma(_2584, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2590 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2592 = _2570 * _2588;
        float _2594 = fma(_2538, _2580, _2590);
        float _2596 = fma(_2522, _2592, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2598 = fma(_2518, _2592, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2562 = _2594;
        _2552 = _2596;
        _2556 = _2598;
    }
    float _2600 = _2562;
    float _2602 = _2552;
    float _2604 = _2556;
    float _2606 = -_1536;
    float _2608 = _2606 + _2600;
    float _2610 = -_1550;
    float _2612 = _2610 + _2602;
    float _2614 = -_1576;
    float _2616 = _2614 + _2604;
    float _2618 = _2608 * _2608;
    float _2620 = fma(_2612, _2612, _2618);
    float _2622 = fma(_2616, _2616, _2620);
    float _2624 = sqrt(_2622);
    bool _2626 = _2624 > 0.0;
    float _2628 = _2624;
    float _2630 = _2604;
    float _2632 = _2600;
    float _2634 = _2608;
    float _2636 = _2622;
    if (!_2626)
    {
        _2628 = _2602;
    }
    float _2638 = _2628;
    bool _2640 = !_2626;
    float _2642 = _2638;
    float _2644 = _2638;
    if (!_2640)
    {
        bool _2646 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2648 = _2522;
        if (_2646)
        {
            float _2650 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2648 = _2650;
        }
        float _2652 = _2648;
        float _2654 = _2652;
        if (_2646)
        {
            float _2656 = _465 * _2652;
            _2390 = _2656;
        }
        float _2658 = _2390;
        float _2660 = _2658;
        if (_2646)
        {
            float _2662 = _467 * _2652;
            _2548 = _2662;
        }
        float _2664 = _2548;
        float _2666 = _2664;
        if (_2646)
        {
            float _2668 = _469 * _2652;
            _2654 = _2668;
        }
        float _2670 = _2654;
        float _2672 = _2670;
        if (!_2646)
        {
            bool _2674 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2676 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan(1.0);
            bool _2682 = _2678 || _2680;
            float _2684 = _123 + 1.0;
            if (!_2682)
            {
                float _2686 = _2684 * _2684;
                float _2688 = _2686 * 0.5;
                _125 = _2688;
            }
            float _2690 = _125;
            float _2692 = _2690;
            if (!_2682)
            {
                float _2694 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2692 = _2694;
            }
            float _2696 = _2692;
            bool _2698 = !_2682;
            float _2700 = _2696;
            if (!_2698)
            {
                float _2702 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2704 = log2(_2702);
                float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2708 = 1.0 + _2706;
                float _2710 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2712 = _2704 * _2684;
                float _2714 = 1.0 / _2708;
                float _2716 = _2710 * 0.693147182464599609375;
                float _2718 = exp2(_2712);
                float _2720 = 1.0 / _2716;
                float _2722 = _2718 + (-1.0);
                float _2724 = -_2722;
                float _2726 = fma(_2724, _2720, _2684);
                float _2728 = _2726 * _2714;
                float _2730 = _2728 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2700 = _2730;
            }
            float _2732 = _2700;
            float _2734 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2736 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2738 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2740 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2742 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2744 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2746 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2740);
            float _2748 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2742);
            float _2750 = _2742;
            _2642 = _2738;
            if (!_2682)
            {
                _2750 = _2684;
            }
            float _2752 = _2750;
            float _2754 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2746);
            bool _2756 = !_2682;
            float _2758 = _2752;
            if (!_2756)
            {
                float _2760 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2762 = log2(_2760);
                float _2764 = _2762 * _2684;
                float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2768 = 1.0 + _2766;
                float _2770 = exp2(_2764);
                float _2772 = 1.0 / _2768;
                float _2774 = -_2770;
                float _2776 = _2774 + 1.0;
                float _2778 = _2776 * _2772;
                _2758 = _2778;
            }
            float _2780 = _2758;
            float _2782 = fma(_2736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2744);
            float _2784 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2748);
            float _2786 = fma(_2780, _163, _2754);
            float _2788 = fma(_2738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2782);
            float _2790 = fma(_2780, _161, _2784);
            float _2792 = -_427;
            float _2794 = _2792 + _2786;
            float _2796 = fma(_2780, _165, _2788);
            float _2798 = -_433;
            float _2800 = _2798 + _2790;
            float _2802 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2804 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2806 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2808 = -_439;
            float _2810 = _2808 + _2796;
            float _2812 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2802);
            float _2814 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2804);
            float _2816 = fma(_2800, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2806);
            float _2818 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2812);
            float _2820 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2814);
            float _2822 = fma(_2810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2816);
            _473 = _2820;
            _475 = _2818;
            _477 = _2822;
            _2660 = _2818;
            _2666 = _2820;
            _2672 = _2822;
        }
        float _2824 = _473;
        float _2826 = _475;
        float _2828 = _477;
        float _2830 = _2660;
        float _2832 = _2666;
        float _2834 = _2672;
        float _2836 = _2642;
        float _2838 = _2824 * _2824;
        float _2840 = rsqrt(_2622);
        float _2842 = fma(_2826, _2826, _2838);
        float _2844 = fma(_2828, _2828, _2842);
        float _2846 = sqrt(_2844);
        float _2848 = _2612 * _2840;
        float _2850 = _2608 * _2840;
        float _2852 = _2616 * _2840;
        bool _2854 = _2846 > 0.0;
        float _2856 = _2836;
        if (!_2854)
        {
            _2856 = _2602;
        }
        float _2858 = _2856;
        bool _2860 = !_2854;
        _2644 = _2858;
        if (!_2860)
        {
            float _2862 = rsqrt(_2844);
            float _2864 = _2862 * _2824;
            float _2866 = _2862 * _2826;
            float _2868 = _2862 * _2828;
            float _2870 = _2850 * _2864;
            float _2872 = fma(_2848, _2866, _2870);
            float _2874 = fma(_2852, _2868, _2872);
            float _2876 = _2874 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2878 = fma(_2830, _2876, _2602);
            float _2880 = fma(_2832, _2876, _2600);
            float _2882 = fma(_2834, _2876, _2604);
            _2630 = _2882;
            _2644 = _2878;
            _2632 = _2880;
        }
    }
    float _2884 = _2630;
    float _2886 = _2644;
    float _2888 = _2632;
    float _2890 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2894 = isnan(0.5);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2890);
    bool _2904 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2906 = isnan(0.5);
    bool _2908 = _2904 || _2906;
    bool _2910 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2912 = _2908 || _2910;
    float _2914 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2902);
    float _2916 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2918 = _2914 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2920 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2916);
    float _2922 = 1.0 / _2918;
    float _2924 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2920);
    float _2926 = _2884;
    if (_2912)
    {
        _2634 = 1.0;
    }
    float _2928 = _2634;
    float _2930 = _2924 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2932 = _2930 + _2918;
    float _2934 = -_2306;
    float _2936 = _2934 + _2884;
    float _2938 = _2932 * _2922;
    float _2940 = _2938 * 0.5;
    float _2942 = -_2298;
    float _2944 = _2942 + _2886;
    float _2946 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2948 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2946);
    float _2950 = -_2300;
    float _2952 = _2950 + _2888;
    float _2954 = 1.0 / _2948;
    float _2956 = _2952;
    float _2958 = _2944;
    float _2960 = _2936;
    float _2962 = _2928;
    if (!_2900)
    {
        float _2964 = _2316 * _2316;
        float _2966 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2968 = -_1576;
        float _2970 = _2968 + _2884;
        float _2972 = -_1536;
        float _2974 = _2972 + _2888;
        float _2976 = fma(_2324, _2324, _2964);
        float _2978 = fma(_2332, _2332, _2976);
        float _2980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2982 = sqrt(_2978);
        float _2984 = _2966 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2986 = 1.0 / _2426;
        float _2988 = precise::min(_2982, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2990 = _2988 * _2980;
        float _2992 = _2990 * _2986;
        float _2994 = -_1550;
        float _2996 = _2994 + _2886;
        float _2998 = _2984 * _2992;
        float _3000 = _2970 * _2992;
        float _3002 = fma(_2996, _2998, _2310);
        float _3004 = fma(_2974, _2998, _2304);
        float _3006 = fma(_2984, _3000, _2320);
        _2956 = _3004;
        _2958 = _3002;
        _2960 = _3006;
        _2392 = _2982;
        _2926 = _3000;
    }
    float _3008 = _2956;
    float _3010 = _2958;
    float _3012 = _2960;
    float _3014 = _2392;
    float _3016 = _2926;
    float _3018 = _3016;
    float _3020 = _3014;
    if (_2912)
    {
        _3018 = 1.0;
    }
    float _3022 = _3018;
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3026 = _2954 * _3024;
    float _3028 = _3022;
    if (!_2912)
    {
        float _3030 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3032 = _3030 * 0.15915493667125701904296875;
        float _3034 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3038 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3036;
        float _3040 = _3032 * 6.283185482025146484375;
        float _3042 = cos(_3040);
        float _3044 = _3034 * 0.15915493667125701904296875;
        float _3046 = _3032 * 6.283185482025146484375;
        float _3048 = sin(_3046);
        float _3050 = 1.0 / _3042;
        float _3052 = _3044 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        float _3056 = _3048 * _3050;
        float _3058 = _3044 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = _3054 * _3056;
        float _3064 = 1.0 / _3038;
        float _3066 = 1.0 / _3062;
        float _3068 = _3060 * _3066;
        float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3072 = fma(_3026, _3068, _3070);
        float _3074 = _3072 * _3064;
        float _3076 = precise::clamp(_3074, 0.0, 1.0);
        _2394 = _3044;
        _2396 = _3032;
        _2962 = _3076;
    }
    float _3078 = _2394;
    float _3080 = _2396;
    float _3082 = _2962;
    float _3084 = _3078;
    float _3086 = _3080;
    if (!_2912)
    {
        float _3088 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3090 = _3088 * 0.15915493667125701904296875;
        float _3092 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3094 = _3090 * 6.283185482025146484375;
        float _3096 = cos(_3094);
        float _3098 = _3092 * 0.15915493667125701904296875;
        float _3100 = _3090 * 6.283185482025146484375;
        float _3102 = sin(_3100);
        float _3104 = 1.0 / _3096;
        float _3106 = _3098 * 6.283185482025146484375;
        float _3108 = cos(_3106);
        float _3110 = _3102 * _3104;
        float _3112 = _3098 * 6.283185482025146484375;
        float _3114 = sin(_3112);
        float _3116 = _3108 * _3110;
        float _3118 = 1.0 / _3116;
        float _3120 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3122 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3120;
        float _3124 = 1.0 / _3122;
        float _3126 = _3114 * _3118;
        float _3128 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3130 = fma(_3026, _3126, _3128);
        float _3132 = _3130 * _3124;
        float _3134 = precise::clamp(_3132, 0.0, 1.0);
        float _3136 = -_3134;
        float _3138 = _3136 + 1.0;
        _3084 = _3096;
        _3028 = _3138;
    }
    float _3140 = _3084;
    float _3142 = _3028;
    float _3144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3146 = _3008 + _3144;
    float _3148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3150 = _3010 + _3148;
    float _3152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3154 = _3012 + _3152;
    float _3156 = _3146 * _3146;
    float _3158 = fma(_3150, _3150, _3156);
    float _3160 = fma(_3154, _3154, _3158);
    float _3162 = rsqrt(_3160);
    float _3164 = sqrt(_3160);
    float _3166 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3168 = _3150 * _3166;
    float _3170 = _3154 * _3166;
    float _3172 = _3168 * _3168;
    float _3174 = _3170 * _3170;
    float _3176 = _3172 + _3174;
    float _3178 = sqrt(_3176);
    bool _3180 = _3178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3184 = _3178 + _3182;
    float _3186 = _3154;
    float _3188 = _3162;
    float _3190 = _3184;
    float _3192 = _3166;
    if (_3180)
    {
        float _3194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3186 = _3194;
    }
    float _3196 = _3186;
    if (_3180)
    {
        float _3198 = rsqrt(_3176);
        _3188 = _3198;
    }
    float _3200 = _3188;
    float _3202 = _3200;
    if (_3180)
    {
        float _3204 = _3184 * _3196;
        _3190 = _3204;
    }
    float _3206 = _3190;
    if (_3180)
    {
        float _3208 = _3206 * 0.15915493667125701904296875;
        _3086 = _3208;
    }
    float _3210 = _3086;
    float _3212 = _3196;
    if (_3180)
    {
        float _3214 = _3210 * 6.283185482025146484375;
        float _3216 = sin(_3214);
        _3212 = _3216;
    }
    float _3218 = _3212;
    float _3220 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3222 = precise::max(0.0, _3220);
    float _3224 = _3140;
    float _3226 = _3222;
    if (_3180)
    {
        float _3228 = _3210 * 6.283185482025146484375;
        float _3230 = cos(_3228);
        _3224 = _3230;
    }
    float _3232 = _3224;
    float _3234 = -_3166;
    float _3236 = -_3222;
    float _3238 = fma(_3146, _3234, _3236);
    float _3240 = _3238;
    if (_3180)
    {
        float _3242 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3226 = _3242;
    }
    float _3244 = _3226;
    float _3246 = _3218;
    float _3248 = _3244;
    if (_3180)
    {
        float _3250 = fma(_3218, _3244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3192 = _3250;
    }
    float _3252 = _3192;
    float _3254 = _3252;
    if (!_3180)
    {
        _3246 = _3238;
    }
    float _3256 = _3246;
    float _3258 = _3256;
    if (_3180)
    {
        float _3260 = _3232 + (-1.0);
        _3248 = _3260;
    }
    float _3262 = _3248;
    float _3264 = _3262;
    if (_3180)
    {
        float _3266 = _3200 * _3252;
        _2636 = _3266;
    }
    float _3268 = _2636;
    if (!_3180)
    {
        _3202 = _3168;
    }
    float _3270 = _3202;
    float _3272 = _3270;
    if (_3180)
    {
        float _3274 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3020 = _3274;
    }
    float _3276 = _3020;
    if (_3180)
    {
        float _3278 = _3168 * _3268;
        _3272 = _3278;
    }
    float _3280 = _3272;
    if (!_3180)
    {
        _3264 = _3170;
    }
    float _3282 = _3264;
    float _3284 = _3282;
    if (_3180)
    {
        float _3286 = _3170 * _3268;
        _3284 = _3286;
    }
    float _3288 = _3284;
    if (!_3180)
    {
        _3254 = _3172;
    }
    float _3290 = _3254;
    float _3292 = _3290;
    if (_3180)
    {
        float _3294 = fma(_3238, _3232, _3276);
        _3258 = _3294;
    }
    float _3296 = _3258;
    if (_3180)
    {
        float _3298 = _3280 * _3280;
        _3292 = _3298;
    }
    float _3300 = _3292;
    if (!_3180)
    {
        _3240 = _3174;
    }
    float _3302 = _3240;
    float _3304 = _3302;
    if (_3180)
    {
        float _3306 = _3288 * _3288;
        _3304 = _3306;
    }
    float _3308 = _3304;
    float _3310 = fma(_3296, _3296, _3300);
    float _3312 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3314 = _3310 + _3308;
    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3318 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3316);
    float _3320 = precise::clamp(_3318, 0.0, 1.0);
    float _3322 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3312);
    float _3324 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3326 = rsqrt(_3314);
    float _3328 = -_3320;
    float _3330 = _3328 + 1.0;
    float _3332 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3334 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3322);
    float _3336 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3338 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3324);
    float _3340 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3342 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3344 = abs(_3330);
    float _3346 = log2(_3344);
    float _3348 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3336);
    float _3350 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3338);
    float _3352 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3340);
    float _3354 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3356 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3348);
    float _3358 = _3350 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3360 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3352);
    float _3362 = _3326 * _3280;
    float _3364 = -_3354;
    float _3366 = fma(_3364, _3332, 1.0);
    float _3368 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3370 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3372 = _3326 * _3296;
    float _3374 = _3362 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3376 = _3360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3378 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3370);
    float _3380 = _3326 * _3288;
    float _3382 = -_3374;
    float _3384 = fma(_3372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3382);
    float _3386 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3388 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3378);
    float _3390 = log2(_3366);
    float _3392 = -_3380;
    float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3384);
    float _3396 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3398 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3388);
    float _3400 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3402 = fma(_3394, -0.5, 0.5);
    float _3404 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3396);
    float _3406 = fma(_3394, 0.5, 0.5);
    float _3408 = exp2(_3386);
    float _3410 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3400);
    float _3412 = _3372 + 1.0;
    float _3414 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3404);
    float _3416 = fma(_3406, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3418 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3410);
    float _3420 = 1.0 / _3398;
    float _3422 = fma(_3406, _3416, -0.212114393711090087890625);
    float _3424 = _3390 * 0.693147182464599609375;
    float _3426 = fma(_3406, _3422, 1.570728778839111328125);
    float _3428 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3430 = sqrt(_3402);
    float _3432 = -_3372;
    float _3434 = fma(_3408, _3412, _3432);
    float _3436 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3414);
    float _3438 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3418);
    float _3440 = _3436 * _3420;
    float _3442 = _3438 * _3420;
    float _3444 = fma(_3440, 0.5, 0.5);
    float _3446 = fma(_3442, -0.5, 0.5);
    float _3448 = fma(_3434, 0.5, 0.5);
    float _3450 = _3430 * 0.636619746685028076171875;
    float _3452 = -_3426;
    float _3454 = fma(_3450, _3452, 1.0);
    float3 _8785 = float3(_3444, _3446, _3428);
    float _3456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8785, float3(0.0), isnan(_8785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8785, float3(0.0), isnan(_8785)), level(0.0)).x;
    float3 _8796 = float3(_3444, _3446, _3428);
    float4 _3459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8796, float3(0.0), isnan(_8796)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8796, float3(0.0), isnan(_8796)), level(0.0)).xyzw;
    float _3461 = _3459.x;
    float _3463 = _3459.y;
    float _3465 = _3459.z;
    float _3467 = _3459.w;
    float2 _8813 = float2(_3454, _3448);
    float3 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8813, float2(0.0), isnan(_8813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8813, float2(0.0), isnan(_8813)), level(0.0)).xyz;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3346 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3481 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3483 = _3082 > 0.0;
    bool _3485 = isnan(_3082);
    bool _3487 = _3483 || _3485;
    bool _3489 = isnan(0.0);
    bool _3491 = _3487 || _3489;
    float _3493 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3481);
    float _3495 = exp2(_3479);
    bool _3497 = _3142 <= 0.0;
    bool _3499 = !_3491;
    bool _3501 = _3497 || _3499;
    float _3503 = _3398 * 0.5;
    float _3505 = fma(_3342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3493);
    float _3507 = _3436 + _3398;
    float _3509 = fma(_3438, -0.5, _3503);
    float _3511 = fma(_3376, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3513 = _3507 * 0.5;
    float _3515 = _3082 * _3142;
    float _3517 = _3511 + _3398;
    out.gl_Position.x = _3436;
    out.gl_Position.y = _3438;
    out.gl_Position.z = _3511;
    out.gl_Position.w = _3398;
    float _3519 = _3515 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3521 = _3517 * 0.5;
    float _3523 = -_3495;
    float _3525 = _3523 + 1.0;
    float _3527 = _3519 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3529 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3513;
    out.m_68.y = _3509;
    out.m_68.z = _3521;
    out.m_68.w = _3398;
    out.m_45.x = _3527;
    float _3531 = _3529 * _3456;
    float _3533 = -_3529;
    float _3535 = _3533 + 1.0;
    float _3537 = _3467 * _3531;
    float _3539 = _3477 * _3531;
    float _3541 = _3467 * _3535;
    float _3543 = fma(_3473, _3537, _3461);
    float _3545 = fma(_3475, _3537, _3463);
    float _3547 = fma(_3467, _3539, _3465);
    out.m_70.x = _3543;
    out.m_70.y = _3545;
    out.m_70.z = _3547;
    out.m_70.w = _3541;
    if (!_3501)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3549;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

