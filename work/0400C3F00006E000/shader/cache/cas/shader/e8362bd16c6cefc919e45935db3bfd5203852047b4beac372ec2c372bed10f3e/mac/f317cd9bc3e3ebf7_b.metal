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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_54 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1063 = false;
    bool _785 = false;
    bool _489 = false;
    bool _297 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3389 = as_type<float>(_103);
        out.gl_Position.z = _3389;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_87);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3458 = as_type<float>(_141);
        out.gl_Position.z = _3458;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = _147 * _145;
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    int _161 = as_type<int>(_149) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_149) & 2;
    bool _167 = _165 != 0;
    float _169 = _159 * 6.283185482025146484375;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = floor(_159);
    float _177 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _169 * 0.15915493667125701904296875;
    bool _181 = !_167;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _189 = _187 != 0;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _193 = _191 != 0;
    float _195 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _199 = _179 * 6.283185482025146484375;
    float _201 = cos(_199);
    float _203 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    bool _205 = !_189;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _211 = !_173;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    int _217 = abs(_207);
    float _219 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _221 = -_175;
    float _223 = _159 + _221;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = -_223;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _231 = abs(_213);
    float _233 = float(_217);
    float _235 = fma(_201, 0.5, 0.5);
    bool _237 = !_193;
    int _239 = _237 ? 0 : 1;
    bool _241 = _223 < 0.5;
    float _243 = float(_241);
    float _245 = abs(_229);
    float _247 = _233 * _245;
    int _249 = abs(_239);
    float _251 = -_235;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = float(_231);
    float _257 = -_243;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _261 = float(_249);
    float _263 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _209);
    bool _265 = !_163;
    float _267 = _265 ? (-0.5) : 0.5;
    float _269 = fma(_255, _253, _247);
    float _271 = abs(_259);
    float _273 = fma(_261, _271, _269);
    bool _275 = !_225;
    float _277 = _219;
    float _279 = _215;
    float _295;
    if (!_275)
    {
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_87);
        float _301 = 1.0 / _299;
        float _303 = _119 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _305 + _311;
    bool _315 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _317 = isnan(_305);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _305 + _339;
    float _343 = 1.0 / _329;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = 1.0 / _337;
    float _349 = 1.0 / _333;
    float _351 = _309 * _343;
    bool _353 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _355 = isnan(_305);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -_325;
    float _367 = _365 + 1.0;
    float _369 = _363 * _367;
    float _371 = _313 * _347;
    bool _373 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_305);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _341 * _349;
    bool _395 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _397 = isnan(_305);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _407;
    float _411 = _383 * _387;
    float _413 = -_383;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = fma(_409, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = _405 * _415;
    float _429 = fma(_419, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = fma(_391, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_423, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = -_405;
    float _437 = _435 + 1.0;
    float _439 = _425 * _427;
    float _441 = _429 * _427;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _447;
    float _451 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].x, _439);
    float _453 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].y, _441);
    float _455 = fma(_445, _371, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_449, _371, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = fma(_431, _411, _451);
    float _461 = fma(_433, _411, _453);
    float _463 = fma(_455, _369, _459);
    float _465 = fma(_457, _369, _461);
    float _467 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[146].x, _463);
    float _469 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[146].y, _465);
    bool _471 = !_345;
    float _487;
    if (!_471)
    {
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _475 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        float _491 = float(_87);
        float _493 = 1.0 / _491;
        float _495 = _119 * _493;
        _487 = _495;
    }
    _489 = false;
    float _497 = _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _497 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _505 = _497 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _509 = _497 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _527 = 1.0 / _517;
    float _529 = 1.0 / _525;
    bool _531 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _533 = isnan(_497);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _545 = -_541;
    float _547 = _545 + 1.0;
    float _549 = 1.0 / _521;
    float _551 = 1.0 / _513;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _555 = _497 + _553;
    float _557 = _501 * _529;
    bool _559 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _561 = isnan(_497);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _571;
    float _575 = _555 * _527;
    bool _577 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _579 = isnan(_497);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _505 * _549;
    bool _591 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _593 = isnan(_497);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_587;
    float _605 = _603 + 1.0;
    float _607 = fma(_573, _589, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _609 = _569 * _605;
    float _611 = _509 * _551;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _617;
    float _621 = -_569;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _629 = fma(_615, _589, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _631 = fma(_619, _589, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _633 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _635 = isnan(_497);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _601 * _547;
    float _647 = -_601;
    float _649 = _647 + 1.0;
    float _651 = _541 * _623;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = _643 * _649;
    float _663 = fma(_627, _557, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _665 = fma(_655, _557, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _667 = fma(_659, _557, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _669 = _607 * _661;
    float _671 = -_643;
    float _673 = _671 + 1.0;
    float _675 = _629 * _661;
    float _677 = _631 * _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _679;
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].x, _669);
    float _685 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _691;
    float _695 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].z, _677);
    float _697 = fma(_681, _611, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _699 = fma(_665, _645, _683);
    float _701 = fma(_663, _645, _685);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _711 = fma(_689, _611, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _713 = fma(_693, _611, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _719 = fma(_667, _645, _695);
    float _721 = fma(_705, _575, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _723 = fma(_709, _575, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _725 = fma(_717, _575, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _727 = fma(_711, _651, _699);
    float _729 = fma(_697, _651, _701);
    float _731 = fma(_713, _651, _719);
    float _733 = fma(_721, _609, _727);
    float _735 = fma(_723, _609, _729);
    float _737 = fma(_725, _609, _731);
    float _739 = in.m_56.x;
    float _741 = in.m_56.y;
    float _743 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].x, _733);
    float _745 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].y, _735);
    float _747 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].z, _737);
    float _749 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _751 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _753 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _757;
    out.m_58.y = _759;
    out.m_58.z = _761;
    out.m_58.w = _755;
    float _763 = _469 * _741;
    float _765 = _467 * _739;
    bool _767 = !_543;
    float _783;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_87);
        float _789 = 1.0 / _787;
        float _791 = _119 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _797 = _793 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _801 = _793 + _799;
    bool _803 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _805 = isnan(_793);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _831 = 1.0 / _817;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _835 = _793 + _833;
    float _837 = 1.0 / _829;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _841 = _793 + _839;
    bool _843 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _845 = isnan(_793);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = 1.0 / _821;
    float _857 = _797 * _831;
    bool _859 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _861 = isnan(_793);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    bool _871 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _873 = isnan(_793);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _825;
    float _891 = _841 * _837;
    float _893 = -_813;
    float _895 = _893 + 1.0;
    float _897 = _881 * _895;
    float _899 = -_881;
    float _901 = _899 + 1.0;
    float _903 = _801 * _855;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = fma(_907, _857, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _915 = fma(_911, _903, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _917 = _835 * _889;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _919;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _923;
    float _927 = _853 * _887;
    float _929 = -_853;
    float _931 = _929 + 1.0;
    float _933 = fma(_921, _857, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _935 = fma(_925, _857, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _937 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _939 = isnan(_793);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _869 * _901;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _959 = _947 * _931;
    float _961 = fma(_953, _903, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _963 = fma(_957, _903, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _965 = -_947;
    float _967 = _965 + 1.0;
    float _969 = _913 * _959;
    float _971 = _933 * _959;
    float _973 = _935 * _959;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _983;
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].x, _969);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].y, _971);
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].z, _973);
    float _993 = fma(_977, _917, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _995 = fma(_981, _917, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _997 = fma(_985, _917, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _999 = fma(_961, _927, _987);
    float _1001 = fma(_915, _927, _989);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1011 = fma(_963, _927, _991);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1017 = fma(_993, _949, _999);
    float _1019 = fma(_1005, _891, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1021 = fma(_1009, _891, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1023 = fma(_995, _949, _1001);
    float _1025 = fma(_1015, _891, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1027 = fma(_997, _949, _1011);
    float _1029 = fma(_1019, _897, _1017);
    float _1031 = fma(_1021, _897, _1023);
    float _1033 = fma(_1025, _897, _1027);
    float _1035 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1029);
    float _1037 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1031);
    float _1039 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1033);
    bool _1041 = !_883;
    float _1059;
    float _1061;
    if (!_1041)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1045 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1047 = float(_87);
        float _1049 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1051 = _1049 * _1043;
        float _1053 = floor(_1051);
        float _1055 = -_1053;
        float _1057 = _1051 + _1055;
        _1059 = _1047;
        _1061 = _1057;
        _1063 = true;
    }
    else
    {
        float _1065 = float(_87);
        float _1067 = 1.0 / _1065;
        float _1069 = _119 * _1067;
        _1059 = _1065;
        _1061 = _1069;
    }
    _1063 = false;
    float _1071 = _1059;
    float _1073 = _1061;
    float _1075 = in.m_49.z;
    float _1077 = _143 * 2.0;
    float _1079 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1081 = in.m_49.y;
    float _1083 = floor(_1077);
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1087 = _1085 != 0;
    float _1089 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1091 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1097 = -_1093;
    float _1099 = fma(_1079, 2.0, _1097);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1105 = _1083 > 0.0;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1109 = _1075 * 2.0;
    bool _1111 = _1083 >= 0.0;
    bool _1113 = isnan(_1083);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    float _1121 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1123 = int(_1121);
    float _1125 = _1081 + _1075;
    float _1127 = _1081 * 2.0;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1131 = _1129 != 0;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1139 = _1137 != 0;
    float _1141 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1143 = _1125 + (-1.0);
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1147 = floor(_1109);
    float _1149 = fma(_1141, -2.0, _1095);
    bool _1151 = !_1135;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1145);
    bool _1157 = !_1131;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1081 + (-0.5);
    float _1163 = _1119 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1165 = floor(_1127);
    float _1167 = float(_1123);
    int _1169 = ~as_type<int>(_1163);
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    int _1175 = _1173;
    float _1177 = _1163;
    float _1179 = _1143;
    if (!_1105)
    {
        int _1181 = ~as_type<int>(_1163);
        int _1183 = _1181 + 1;
        _1175 = _1183;
    }
    int _1185 = _1175;
    float _1187 = _1167 * _119;
    if (!_1087)
    {
        _1177 = _1075;
    }
    float _1189 = _1177;
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1193 = int(_1191);
    float _1195 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1197 = !_1139;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1207 = _1205 != 0;
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1211 = _1209 != 0;
    bool _1213 = _1147 > 0.0;
    float _1215 = _1189;
    if (!_1087)
    {
        _1179 = _1081;
    }
    float _1217 = _1179;
    bool _1219 = !_1207;
    int _1221 = _1219 ? 0 : 1;
    bool _1223 = _1147 >= 0.0;
    bool _1225 = isnan(_1147);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan(0.0);
    bool _1231 = _1227 || _1229;
    float _1233 = _1217;
    if (_1087)
    {
        _1233 = _143;
    }
    float _1235 = _1233;
    if (_1087)
    {
        _1215 = _1081;
    }
    float _1237 = _1215;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1241 = _1165 > 0.0;
    bool _1243 = _1165 >= 0.0;
    bool _1245 = isnan(_1165);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1239);
    float _1255 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1101);
    float _1259 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1261 = log2(_1259);
    float _1263 = _1237;
    if (!_1087)
    {
        _1263 = _1075;
    }
    float _1265 = _1263;
    float _1267 = -_1103;
    float _1269 = fma(_1255, 2.0, _1267);
    float _1271 = _1265;
    if (_1087)
    {
        _1271 = _1081;
    }
    float _1273 = _1271;
    float _1275 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1253);
    float _1277 = float(_1193);
    int _1279 = _1231 ? 0 : 1;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1283 = abs(_1221);
    float _1285 = 1.0 / _1277;
    int _1287 = _1251 ? 0 : 1;
    float _1289 = fma(_1281, -2.0, _1107);
    int _1291 = ~_1279;
    int _1293 = _1291 + 1;
    int _1295 = _1293 + 1;
    float _1297 = float(_1185);
    float _1299 = _1261 * _119;
    float _1301 = float(_1283);
    int _1303 = _1295;
    if (!_1213)
    {
        int _1305 = ~_1279;
        int _1307 = _1305 + 1;
        _1303 = _1307;
    }
    int _1309 = _1303;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1313 = in.m_60.x;
    float _1315 = in.m_60.y;
    float _1317 = in.m_60.z;
    int _1319 = ~_1287;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = _1301 * _1297;
    int _1327 = _1323;
    if (!_1241)
    {
        int _1329 = ~_1287;
        int _1331 = _1329 + 1;
        _1327 = _1331;
    }
    int _1333 = _1327;
    float _1335 = exp2(_1299);
    float _1337 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1311);
    bool _1339 = !_1203;
    int _1341 = _1339 ? 0 : 1;
    float _1343 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1155);
    bool _1345 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1347 = isnan(1.0);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1353 = _1349 || _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1357 = 1.0 + _1355;
    float _1359 = _1325 * (-2.0);
    int _1361 = abs(_1341);
    float _1363 = -_119;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1269);
    bool _1367 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1369 = isnan(0.0);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1375 = _1371 || _1373;
    float _1377 = -_119;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1099);
    float _1381 = 1.0 / _1357;
    float _1383 = float(_1361);
    float _1385 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1337);
    float _1387 = float(_1309);
    float _1389 = -_1335;
    float _1391 = _1389 + 1.0;
    float _1393 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1149);
    bool _1395 = !_1211;
    int _1397 = _1395 ? 0 : 1;
    float _1399 = _1285 * _119;
    float _1401 = fma(_1359, _1315, _1315);
    float _1403 = _1375 ? _1391 : 0.0;
    float _1405 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1257);
    float _1407 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1289);
    float _1409 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1401);
    float _1411 = _143 + _1081;
    float _1413 = _1383 * _1387;
    float _1415 = fma(_1195, _1359, _1195);
    if (_1353)
    {
        float _1417 = _1403 * _1381;
        _123 = _1417;
    }
    float _1419 = _123;
    int _1421 = abs(_1397);
    float _1423 = _1411 + (-1.0);
    float _1425 = _1413 * (-2.0);
    float _1427 = fma(_1415, _1419, _1409);
    float _1429 = float(_1421);
    float _1431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1433 = float(_1333);
    float _1435 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1437 = _143 + (-0.5);
    float _1439 = fma(_1425, _1313, _1313);
    float _1441 = _143 + _1075;
    float _1443 = _1429 * _1433;
    float _1445 = fma(_1435, _1425, _1435);
    float _1447 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    float _1449 = _1441 + (-1.0);
    float _1451 = _1443 * (-2.0);
    float _1453 = fma(_1445, _1419, _1447);
    float _1455 = _1427 * 0.15915493667125701904296875;
    float _1457 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1459 = fma(_1451, _1317, _1317);
    float _1461 = _1075 + (-0.5);
    float _1463 = _1453 * 0.15915493667125701904296875;
    float _1465 = fma(_1457, _1451, _1457);
    float _1467 = _1455 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1459);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _267);
    float _1475 = _1089 * _1431;
    float _1477 = fma(_1465, _1419, _1471);
    float _1479 = _1091 * _1473;
    float _1481 = _1455 * 6.283185482025146484375;
    float _1483 = cos(_1481);
    float _1485 = _1477 * 0.15915493667125701904296875;
    float _1487 = in.m_42.x;
    float _1489 = in.m_42.y;
    float _1491 = in.m_42.z;
    float _1493 = _1463 * 6.283185482025146484375;
    float _1495 = sin(_1493);
    float _1497 = _1463 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = _1485 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1495 * _1469;
    float _1507 = _1495 * _1483;
    float _1509 = _1485 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = _1499 * _1469;
    float _1515 = _1469 * _1503;
    float _1517 = _1503 * _1475;
    float _1519 = _1499 * _1483;
    float _1521 = _1483 * _1503;
    float _1523 = _1499 * _1517;
    float _1525 = _1495 * _1517;
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = fma(_1511, _1519, _1505);
    float _1531 = -_1475;
    float _1533 = _1511 * _1531;
    float _1535 = -_1513;
    float _1537 = fma(_1511, _1507, _1535);
    float _1539 = -_1507;
    float _1541 = fma(_1511, _1513, _1539);
    float _1543 = fma(_1529, _1479, _1523);
    float _1545 = fma(_1521, _1479, _1533);
    float _1547 = fma(_1511, _1505, _1519);
    float _1549 = fma(_1537, _1479, _1525);
    float _1551 = fma(_1541, _1527, _1543);
    float _1553 = fma(_1515, _1527, _1545);
    float _1555 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1557 = fma(_1547, _1527, _1549);
    float _1559 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1561 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1563 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1555);
    float _1565 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1567 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1559);
    float _1569 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1561);
    float _1571 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1563);
    float _1573 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1565);
    float _1575 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1567);
    float _1577 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1569);
    float _1579 = _1571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1581 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1573);
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1587 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1589 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1591 = _1579 + _1583;
    float _1593 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1595 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1587);
    float _1597 = _1585 + _1589;
    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1601 = _1591 + _1599;
    float _1603 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1593);
    float _1605 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1595);
    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1609 = _1597 + _1607;
    float _1611 = _1601 * _1601;
    float _1613 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1603);
    float _1615 = _1605 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1617 = fma(_1609, _1609, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1621 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1623 = sqrt(_1617);
    float _1625 = _1615 + _1619;
    float _1627 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1621);
    float _1629 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1627);
    bool _1631 = _1623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = _1621;
    float _1635 = _1613;
    float _1637 = _1597;
    if (!_1631)
    {
        _1633 = _1597;
    }
    float _1639 = _1633;
    float _1641 = _1639;
    if (!_1631)
    {
        _1635 = _1591;
    }
    float _1643 = _1635;
    float _1645 = _1643;
    if (!_1631)
    {
        _1637 = _1625;
    }
    float _1647 = _1637;
    bool _1649 = !_1631;
    float _1651 = _1647;
    if (!_1649)
    {
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1657 = _1623 + _1655;
        float _1659 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1661 = rsqrt(_1617);
        float _1663 = _1657 * _1653;
        float _1665 = _1663 * 0.15915493667125701904296875;
        float _1667 = _1665 * 6.283185482025146484375;
        float _1669 = cos(_1667);
        float _1671 = _1665 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        float _1675 = _1669 + (-1.0);
        float _1677 = fma(_1673, _1659, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1679 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = _1661 * _1677;
        float _1683 = fma(_1625, _1669, _1679);
        float _1685 = fma(_1609, _1681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1687 = fma(_1601, _1681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1651 = _1683;
        _1641 = _1685;
        _1645 = _1687;
    }
    float _1689 = _1651;
    float _1691 = _1641;
    float _1693 = _1645;
    float _1695 = -_1615;
    float _1697 = _1695 + _1689;
    float _1699 = -_1585;
    float _1701 = _1699 + _1691;
    float _1703 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1705 = -_1579;
    float _1707 = _1705 + _1693;
    float _1709 = _1697 * _1697;
    float _1711 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1713 = 1.0 / _1703;
    float _1715 = fma(_1701, _1701, _1709);
    float _1717 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1711);
    bool _1719 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    float _1729 = fma(_1707, _1707, _1715);
    float _1731 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1717);
    float _1733 = sqrt(_1729);
    float _1735 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1737 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1739 = isnan(0.5);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1745 = _1741 || _1743;
    float _1747 = _1735 + _1703;
    float _1749 = _1747 * _1713;
    float _1751 = _1749 * 0.5;
    bool _1753 = _1733 > 0.0;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1757 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1755);
    float _1759 = 1.0 / _1757;
    bool _1761 = !_1753;
    float _1763 = _1689;
    float _1765 = _1693;
    float _1767 = _1691;
    float _1769 = _1697;
    float _1771 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1773 = _1701;
    float _1775 = _1711;
    float _1777 = _1751;
    float _1779 = _1707;
    if (!_1761)
    {
        float _1781 = _219 * _219;
        float _1783 = fma(_215, _215, _1781);
        float _1785 = fma(_263, _263, _1783);
        float _1787 = rsqrt(_1729);
        float _1789 = sqrt(_1785);
        float _1791 = _1701 * _1787;
        float _1793 = _1707 * _1787;
        bool _1795 = _1789 > 0.0;
        float _1797 = _1697 * _1787;
        bool _1799 = !_1795;
        _1771 = _1787;
        _1775 = _1797;
        _1777 = _1785;
        if (!_1799)
        {
            float _1801 = rsqrt(_1785);
            float _1803 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1805 = _219 * _1801;
            float _1807 = _215 * _1801;
            float _1809 = _263 * _1801;
            float _1811 = _1797 * _1805;
            float _1813 = fma(_1791, _1807, _1811);
            float _1815 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1817 = fma(_1793, _1809, _1813);
            float _1819 = _1817 * _1815;
            float _1821 = fma(_215, _1819, _1691);
            float _1823 = fma(_219, _1819, _1689);
            float _1825 = fma(_263, _1819, _1693);
            _1763 = _1823;
            _1765 = _1825;
            _1767 = _1821;
            _1769 = _1819;
            _1771 = _1809;
            _1773 = _1803;
            _1775 = _1815;
            _1779 = _1805;
        }
    }
    float _1827 = _1763;
    float _1829 = _1765;
    float _1831 = _1767;
    float _1833 = _1769;
    float _1835 = _1771;
    float _1837 = _1773;
    float _1839 = _1775;
    float _1841 = _1777;
    float _1843 = _1779;
    float _1845 = _1843;
    float _1847 = _1831;
    float _1849 = _1835;
    float _1851 = _1839;
    float _1853 = _1827;
    float _1855 = _1833;
    float _1857 = _1837;
    float _1859 = _1841;
    if (_1745)
    {
        _1845 = 1.0;
    }
    float _1861 = _1845;
    float _1863 = _1861;
    if (_1727)
    {
        _277 = _1827;
    }
    float _1865 = _277;
    float _1867 = _1865;
    if (_1727)
    {
        _279 = _1829;
    }
    float _1869 = _279;
    float _1871 = _1869;
    if (!_1727)
    {
        float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1875 = _1615 + _1873;
        float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1879 = _1585 + _1877;
        float _1881 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1883 = -_1585;
        float _1885 = _1883 + _1831;
        float _1887 = _1875 * _1875;
        float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1891 = _1579 + _1889;
        float _1893 = fma(_1879, _1879, _1887);
        float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1897 = fma(_1891, _1891, _1893);
        float _1899 = sqrt(_1897);
        float _1901 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1903 = precise::min(_1899, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1905 = _1903 * _1895;
        float _1907 = -_1615;
        float _1909 = _1907 + _1827;
        float _1911 = _1901 * _1905;
        float _1913 = -_1579;
        float _1915 = _1913 + _1829;
        float _1917 = fma(_1885, _1911, _1585);
        float _1919 = fma(_1909, _1911, _1615);
        float _1921 = fma(_1915, _1911, _1579);
        _1867 = _1919;
        _1847 = _1917;
        _1871 = _1921;
        _1849 = _1899;
        _1851 = _1911;
    }
    float _1923 = _1867;
    float _1925 = _1847;
    float _1927 = _1871;
    float _1929 = _1849;
    float _1931 = _1851;
    float _1933 = _1931;
    if (_1745)
    {
        _1853 = 1.0;
    }
    float _1935 = _1853;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1759 * _1937;
    float _1941 = _1935;
    if (!_1745)
    {
        float _1943 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1945 = _1943 * 0.15915493667125701904296875;
        float _1947 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1949 = _1945 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = _1947 * 0.15915493667125701904296875;
        float _1955 = _1945 * 6.283185482025146484375;
        float _1957 = sin(_1955);
        float _1959 = 1.0 / _1951;
        float _1961 = _1953 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1957 * _1959;
        float _1967 = _1953 * 6.283185482025146484375;
        float _1969 = sin(_1967);
        float _1971 = _1963 * _1965;
        float _1973 = 1.0 / _1971;
        float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1975;
        float _1979 = 1.0 / _1977;
        float _1981 = _1969 * _1973;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1985 = fma(_1939, _1981, _1983);
        float _1987 = _1985 * _1979;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1855 = _1973;
        _1857 = _1953;
        _1863 = _1989;
    }
    float _1991 = _1855;
    float _1993 = _1857;
    float _1995 = _1863;
    float _1997 = _1993;
    float _1999 = _1991;
    if (!_1745)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2005 * 0.15915493667125701904296875;
        float _2013 = _2003 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = 1.0 / _2009;
        float _2019 = _2011 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = _2011 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = _2021 * _2023;
        float _2031 = 1.0 / _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2035 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2033;
        float _2037 = 1.0 / _2035;
        float _2039 = _2027 * _2031;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2043 = fma(_1939, _2039, _2041);
        float _2045 = _2043 * _2037;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        float _2049 = -_2047;
        float _2051 = _2049 + 1.0;
        _1997 = _2029;
        _1999 = _2017;
        _1941 = _2051;
    }
    float _2053 = _1997;
    float _2055 = _1999;
    float _2057 = _1941;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2061 = _1923 + _2059;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2065 = _1925 + _2063;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2069 = _1927 + _2067;
    float _2071 = _2061 * _2061;
    float _2073 = fma(_2065, _2065, _2071);
    float _2075 = fma(_2069, _2069, _2073);
    float _2077 = rsqrt(_2075);
    float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2081 = _2065 * _2079;
    float _2083 = _2069 * _2079;
    float _2085 = _2081 * _2081;
    float _2087 = _2083 * _2083;
    float _2089 = _2085 + _2087;
    float _2091 = sqrt(_2089);
    bool _2093 = _2091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2097 = _2091 + _2095;
    float _2099 = _1929;
    float _2101 = _2097;
    float _2103 = _2061;
    float _2105 = _2081;
    float _2107 = _2083;
    float _2109 = _2085;
    float _2111 = _2087;
    if (_2093)
    {
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2113;
    }
    float _2115 = _2099;
    float _2117 = _2115;
    if (_2093)
    {
        float _2119 = _2097 * _2115;
        _2101 = _2119;
    }
    float _2121 = _2101;
    if (_2093)
    {
        float _2123 = rsqrt(_2089);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = _2125;
    if (_2093)
    {
        float _2129 = _2121 * 0.15915493667125701904296875;
        _1933 = _2129;
    }
    float _2131 = _1933;
    float _2133 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2135 = _2053;
    if (_2093)
    {
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = sin(_2137);
        _2135 = _2139;
    }
    float _2141 = _2135;
    float _2143 = precise::max(0.0, _2133);
    float _2145 = _2055;
    float _2147 = _2143;
    if (_2093)
    {
        float _2149 = _2131 * 6.283185482025146484375;
        float _2151 = cos(_2149);
        _2145 = _2151;
    }
    float _2153 = _2145;
    float _2155 = -_2079;
    float _2157 = -_2143;
    float _2159 = fma(_2061, _2155, _2157);
    if (_2093)
    {
        float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2161;
    }
    float _2163 = _2103;
    float _2165 = _2163;
    if (_2093)
    {
        float _2167 = fma(_2141, _2163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1859 = _2167;
    }
    float _2169 = _1859;
    float _2171 = _2169;
    if (!_2093)
    {
        _2165 = _2159;
    }
    float _2173 = _2165;
    float _2175 = sqrt(_2075);
    float _2177 = _2173;
    if (_2093)
    {
        float _2179 = _2125 * _2169;
        _2171 = _2179;
    }
    float _2181 = _2171;
    if (_2093)
    {
        float _2183 = _2153 + (-1.0);
        _2147 = _2183;
    }
    float _2185 = _2147;
    if (_2093)
    {
        float _2187 = _2081 * _2181;
        _2105 = _2187;
    }
    float _2189 = _2105;
    if (_2093)
    {
        float _2191 = _2083 * _2181;
        _2107 = _2191;
    }
    float _2193 = _2107;
    if (_2093)
    {
        float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2195;
    }
    float _2197 = _2127;
    if (_2093)
    {
        float _2199 = _2189 * _2189;
        _2109 = _2199;
    }
    float _2201 = _2109;
    if (_2093)
    {
        float _2203 = _2193 * _2193;
        _2111 = _2203;
    }
    float _2205 = _2111;
    float _2207 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2093)
    {
        float _2209 = fma(_2159, _2153, _2197);
        _2177 = _2209;
    }
    float _2211 = _2177;
    float _2213 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = fma(_2211, _2211, _2201);
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2219 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2217);
    float _2221 = precise::clamp(_2219, 0.0, 1.0);
    float _2223 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2225 = _2215 + _2205;
    float _2227 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2207);
    float _2229 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2231 = -_2221;
    float _2233 = _2231 + 1.0;
    float _2235 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2237 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2227);
    float _2239 = rsqrt(_2225);
    float _2241 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2229);
    float _2243 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2245 = _2237 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2247 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2235);
    float _2249 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2241);
    float _2251 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2243);
    float _2253 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2255 = abs(_2233);
    float _2257 = log2(_2255);
    float _2259 = _2249 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2261 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2263 = -_2253;
    float _2265 = fma(_2263, _2223, 1.0);
    float _2267 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2247);
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2271 = _2239 * _2189;
    float _2273 = _2239 * _2211;
    float _2275 = _2239 * _2193;
    float _2277 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2269);
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2281 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2283 = log2(_2265);
    float _2285 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2277);
    float _2287 = -_2279;
    float _2289 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2287);
    float _2291 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2293 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2295 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2285);
    float _2297 = -_2275;
    float _2299 = fma(_2297, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2289);
    float _2301 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2303 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2293);
    float _2305 = exp2(_2291);
    float _2307 = fma(_2299, -0.5, 0.5);
    float _2309 = fma(_2299, 0.5, 0.5);
    float _2311 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2301);
    float _2313 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2303);
    float _2315 = _2273 + 1.0;
    float _2317 = fma(_2309, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2319 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2311);
    float _2321 = 1.0 / _2295;
    float _2323 = _2283 * 0.693147182464599609375;
    float _2325 = fma(_2309, _2317, -0.212114393711090087890625);
    float _2327 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2319);
    float _2329 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2313);
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2333 = fma(_2309, _2325, 1.570728778839111328125);
    float _2335 = sqrt(_2307);
    float _2337 = -_2273;
    float _2339 = fma(_2305, _2315, _2337);
    float _2341 = fma(_2339, 0.5, 0.5);
    float _2343 = _2327 * _2321;
    float _2345 = _2329 * _2321;
    float _2347 = fma(_2343, 0.5, 0.5);
    float _2349 = fma(_2345, -0.5, 0.5);
    float _2351 = _2335 * 0.636619746685028076171875;
    float _2353 = -_2333;
    float _2355 = fma(_2351, _2353, 1.0);
    float3 _6934 = float3(_2347, _2349, _2331);
    float _2357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).x;
    float3 _6945 = float3(_2347, _2349, _2331);
    float4 _2360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6945, float3(0.0), isnan(_6945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6945, float3(0.0), isnan(_6945)), level(0.0)).xyzw;
    float _2362 = _2360.x;
    float _2364 = _2360.y;
    float _2366 = _2360.z;
    float _2368 = _2360.w;
    float2 _6962 = float2(_2355, _2341);
    float3 _2372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6962, float2(0.0), isnan(_6962)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6962, float2(0.0), isnan(_6962)), level(0.0)).xyz;
    float _2374 = _2372.x;
    float _2376 = _2372.y;
    float _2378 = _2372.z;
    float _2380 = float(uint(_1123));
    float _2382 = trunc(_1399);
    int _2384 = int(_2382);
    int _2386 = ~_1123;
    int _2388 = _2386 + 1;
    float _2390 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2392 = _143 > 0.5;
    float _2394 = -_1275;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1075 > 0.5;
    float _2400 = 1.0 / _2380;
    float _2402 = float(uint(_2384));
    float _2404 = exp2(_2390);
    int _2406 = as_type<int>(_2400) + (-2);
    float _2408 = as_type<float>(_2406) * _2402;
    float _2410 = -_2404;
    float _2412 = _2410 + 1.0;
    float _2414 = trunc(_2408);
    float _2416 = precise::max(_2414, 0.0);
    uint _2419 = uint(_2416);
    int _2421 = _2388 * int(_2419);
    int _2423 = _2421 + _2384;
    float _2425 = float(uint(_2423));
    float _2427 = as_type<float>(_2406) * _2425;
    bool _2429 = !_1087;
    float _2431 = _2429 ? 7.345489978790283203125 : 1.0;
    float _2433 = trunc(_2427);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _2431 * _143;
    float _2441 = float(_2384);
    float _2443 = floor(_2439);
    bool _2445 = _2441 >= _1167;
    bool _2447 = isnan(_2441);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(_1167);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    int _2457 = int(_2419) + int(_2437);
    float _2459 = trunc(_2455);
    int _2461 = int(_2459);
    int _2463 = _2388 * _2457;
    int _2465 = _2463 + _2384;
    float _2467 = -_2443;
    float _2469 = _2439 + _2467;
    float _2471 = 1.0 / _1071;
    bool _2473 = uint(_2465) >= uint(_1123);
    float _2475 = _2469 * _1167;
    bool _2477 = !_2473;
    int _2479 = _2477 ? 0 : (-1);
    bool _2481 = _1123 == 0;
    float _2483 = trunc(_2475);
    int _2485 = int(_2483);
    int _2487 = ~_2457;
    int _2489 = _2487 + _2479;
    int _2491 = _2489 + 1;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2495 = _2493 != 0;
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2499 = _2497 != 0;
    int _2501 = _1123 * _2491;
    int _2503 = _2501 + _2384;
    float _2505 = _1187 * _2471;
    int _2507 = ~_2461;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _1123 + (-1);
    bool _2515 = !_2481;
    int _2517 = _2515 ? _2503 : (-1);
    float _2519 = trunc(_2505);
    int _2521 = int(_2519);
    bool _2523 = !_2495;
    int _2525 = _2523 ? 0 : 1;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2529 = _2527 != 0;
    int _2531 = _2517 * _2511;
    int _2533 = abs(_1153);
    int _2535 = abs(_2525);
    int _2537 = _2461 * _2513;
    int _2539 = _2537 + _2531;
    int _2541 = abs(_1159);
    int _2543 = _2485 * _2535;
    int _2545 = _2543 + _2384;
    bool _2547 = !_2529;
    int _2549 = _2547 ? 0 : 1;
    int _2551 = abs(_1199);
    int _2553 = _2539 * _2533;
    int _2555 = abs(_2549);
    int _2557 = _2521 * _2541;
    int _2559 = _2557 + _2553;
    int _2561 = ~_1123;
    int _2563 = _2561 + 1;
    int _2565 = ~_1123;
    int _2567 = _2565 + 1;
    int _2569 = _2545 * _2551;
    int _2571 = _2569 + _2559;
    int _2573 = ~_1123;
    int _2575 = _2573 + 1;
    int _2577 = _2485 * _2555;
    int _2579 = _2577 + _2571;
    float _2581 = float(uint(_2579));
    float _2583 = as_type<float>(_2406) * _2581;
    float _2585 = trunc(_2583);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    int _2591 = _2575 * int(_2589);
    int _2593 = _2591 + _2579;
    float _2595 = float(uint(_2593));
    float _2597 = as_type<float>(_2406) * _2595;
    float _2599 = trunc(_2597);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    int _2605 = int(_2589) + int(_2603);
    float _2607 = float(uint(_2545));
    int _2609 = _2563 * _2605;
    int _2611 = _2609 + _2579;
    float _2613 = as_type<float>(_2406) * _2607;
    bool _2615 = uint(_2611) >= uint(_1123);
    float _2617 = trunc(_2613);
    float _2619 = precise::max(_2617, 0.0);
    uint _2621 = uint(_2619);
    bool _2623 = !_2615;
    int _2625 = _2623 ? 0 : (-1);
    int _2627 = ~_2605;
    int _2629 = _2627 + _2625;
    int _2631 = _2629 + 1;
    int _2633 = _1123 * _2631;
    int _2635 = _2633 + _2579;
    int _2637 = ~_1123;
    int _2639 = _2637 + 1;
    bool _2641 = !_2481;
    int _2643 = _2641 ? _2635 : (-1);
    int _2645 = _2639 * int(_2621);
    int _2647 = _2645 + _2545;
    int _2649 = _2643 >> 31;
    float _2651 = float(uint(_2647));
    int _2653 = _2649 & 3;
    int _2655 = _2643 & 3;
    bool _2657 = _2655 != 0;
    float _2659 = as_type<float>(_2406) * _2651;
    int _2661 = _2643 + _2653;
    int _2663 = _2643 & 3;
    bool _2665 = _2663 != 0;
    float _2667 = trunc(_2659);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    int _2673 = _2661 >> 2;
    bool _2675 = uint(_2663) > 1u;
    int _2677 = _2673 << 4;
    int _2679 = _2677 + 368;
    int _2681 = _2657 ? 0 : 1;
    uint _2683 = uint(int(uint(_2679) >> uint(2)));
    uint _2685 = uint(int(uint(int(_2683)) >> uint(2)));
    int _2687 = int(_2683) & 3;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[int(_2685)][_2687];
    int _2691 = int(_2683) + 1;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    int _2695 = _2691 & 3;
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[int(_2693)][_2695];
    int _2699 = ~_2681;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    int _2705 = int(_2621) + int(_2671);
    int _2707 = _2679 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = _2703;
    if (!_2675)
    {
        int _2727 = ~_2681;
        int _2729 = _2727 + 1;
        _2725 = _2729;
    }
    int _2731 = _2725;
    int _2733 = _2567 * _2705;
    int _2735 = _2733 + _2545;
    bool _2737 = !_2665;
    int _2739 = _2737 ? 0 : 1;
    float _2741 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2743 = int(_2741);
    int _2745 = abs(_2731);
    bool _2747 = _2663 != 3;
    bool _2749 = uint(_2735) >= uint(_1123);
    int _2751 = abs(_2739);
    bool _2753 = uint(_2663) >= 2u;
    bool _2755 = !_2749;
    int _2757 = _2755 ? 0 : (-1);
    int _2759 = ~_2745;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = _2753 ? 0 : 1;
    int _2767 = ~_2705;
    int _2769 = _2767 + _2757;
    int _2771 = _2769 + 1;
    int _2773 = ~_2751;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = ~_2765;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = _1123 * _2771;
    int _2787 = _2785 + _2545;
    bool _2789 = _2663 != 3;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2793 = _1073 + _2791;
    int _2795 = _2783;
    if (_2747)
    {
        int _2797 = ~_2765;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2805 = _2803 != 0;
    int _2807 = abs(_2801);
    float _2809 = float(uint(_2743));
    int _2811 = _2763 * as_type<int>(_2697);
    bool _2813 = !_2481;
    int _2815 = _2813 ? _2787 : (-1);
    int _2817 = _2777 * as_type<int>(_2689);
    int _2819 = _2817 + _2811;
    bool _2821 = !_2789;
    int _2823 = _2821 ? 0 : (-1);
    float _2825 = 1.0 / _2809;
    bool _2827 = !_2805;
    int _2829 = _2827 ? 0 : 1;
    float _2831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2833 = _2831 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2835 = abs(_2823);
    int _2837 = abs(_2829);
    int _2839 = ~_2807;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = abs(_2743);
    int _2847 = ~_2835;
    int _2849 = _2847 + 1;
    int _2851 = _2849 + 1;
    int _2853 = _2843 * as_type<int>(_2715);
    int _2855 = _2853 + _2819;
    float _2857 = 1.0 / _2833;
    int _2859 = ~_2837;
    int _2861 = _2859 + 1;
    int _2863 = _2861 + 1;
    int _2865 = _2851 * as_type<int>(_2723);
    int _2867 = _2865 + _2855;
    float _2869 = float(uint(_2845));
    int _2871 = _2867 * _2863;
    int _2873 = as_type<int>(_2825) + (-2);
    float _2875 = 1.0 / _2869;
    int _2877 = _2815 * _2837;
    int _2879 = _2877 + _2871;
    float _2881 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2883 = _2881 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2885 = in.m_49.w;
    float _2887 = float(uint(_2879));
    int _2889 = abs(_2879);
    float _2891 = 1.0 / _2883;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2895 = _2893 != 0;
    float _2897 = as_type<float>(_2873) * _2887;
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2901 = _2899 != 0;
    int _2903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2905 = _2903 != 0;
    float _2907 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2909 = _2907 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2911 = as_type<int>(_2875) + (-2);
    float _2913 = trunc(_2897);
    float _2915 = precise::max(_2913, 0.0);
    uint _2917 = uint(_2915);
    float _2919 = float(uint(_2889));
    bool _2921 = _1081 > 0.5;
    int _2923 = ~_2743;
    int _2925 = _2923 + 1;
    float _2927 = as_type<float>(_2911) * _2919;
    float _2929 = 1.0 / _2909;
    float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2931;
    float _2935 = -_267;
    int _2937 = _2392 ? as_type<int>(_2935) : as_type<int>(_267);
    bool _2939 = _2885 > 0.5;
    float _2941 = trunc(_2927);
    float _2943 = precise::max(_2941, 0.0);
    uint _2945 = uint(_2943);
    int _2947 = _2925 * int(_2917);
    int _2949 = _2947 + _2879;
    float _2951 = _2933 * _2857;
    float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2953;
    float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2959 = _2957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2961 = ~_2845;
    int _2963 = _2961 + 1;
    float _2965 = fma(_2951, _2793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2967 = float(uint(_2949));
    float _2969 = _2959 * _2891;
    bool _2971 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2973 = isnan(_1073);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2979 = _2975 || _2977;
    float _2981 = float(_2979);
    float _2983 = _2955 * _2929;
    bool _2985 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2987 = isnan(_1073);
    bool _2989 = _2985 || _2987;
    bool _2991 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2993 = _2989 || _2991;
    float _2995 = float(_2993);
    float _2997 = as_type<float>(_2873) * _2967;
    bool _2999 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3001 = isnan(_1073);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3007 = _3003 || _3005;
    float _3009 = float(_3007);
    float _3011 = -_2981;
    float _3013 = _3011 + 1.0;
    float _3015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3017 = _2963 * int(_2945);
    int _3019 = _3017 + _2889;
    float _3021 = -_2995;
    float _3023 = _3021 + 1.0;
    float _3025 = _3009 * _3013;
    float _3027 = -_3009;
    float _3029 = _3027 + 1.0;
    bool _3031 = !_2499;
    float _3033 = _3031 ? _267 : as_type<float>(_2937);
    float _3035 = float(uint(_3019));
    float _3037 = trunc(_2997);
    float _3039 = precise::max(_3037, 0.0);
    uint _3041 = uint(_3039);
    bool _3043 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3045 = isnan(_1073);
    bool _3047 = _3043 || _3045;
    bool _3049 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3051 = _3047 || _3049;
    float _3053 = float(_3051);
    float _3055 = _2995 * _3029;
    float _3057 = as_type<float>(_2911) * _3035;
    float _3059 = -_267;
    int _3061 = _2398 ? as_type<int>(_3059) : as_type<int>(_267);
    float _3063 = _3053 * _3023;
    float _3065 = -_3053;
    float _3067 = _3065 + 1.0;
    float _3069 = trunc(_3057);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    bool _3075 = !_2901;
    float _3077 = _3075 ? _267 : as_type<float>(_3061);
    float _3079 = _2965 * _3063;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3083 = _1073 + _3081;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3087 = _1073 + _3085;
    float _3089 = -_183;
    int _3091 = _2921 ? as_type<int>(_3089) : as_type<int>(_183);
    float _3093 = fma(_3067, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3079);
    float _3095 = -_183;
    int _3097 = _2939 ? as_type<int>(_3095) : as_type<int>(_183);
    float _3099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3101 = ~_2845;
    int _3103 = _3101 + 1;
    float _3105 = fma(_2969, _3083, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3107 = !_2895;
    float _3109 = _3107 ? _183 : as_type<float>(_3091);
    float _3111 = fma(_2983, _3087, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _3113 = !_2905;
    float _3115 = _3113 ? _183 : as_type<float>(_3097);
    float _3117 = fma(_3105, _3055, _3093);
    int _3119 = int(_2917) + int(_3041);
    float _3121 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3123 = ~_2743;
    int _3125 = _3123 + 1;
    float _3127 = fma(_3111, _3025, _3117);
    int _3129 = int(_2945) + int(_3073);
    float _3131 = _3077 + 0.5;
    float _3133 = _3099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3135 = _3103 * _3129;
    int _3137 = _3135 + _2889;
    float _3139 = _3115 + (-0.5);
    float _3141 = fma(_3121, _3131, _1365);
    int _3143 = _3125 * _3119;
    int _3145 = _3143 + _2879;
    float _3147 = -_3133;
    float _3149 = -_1407;
    float _3151 = fma(_3147, _3139, _3149);
    float _3153 = fma(_2981, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3127);
    float _3155 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3157 = uint(_3137) >= uint(_2845);
    float _3159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3161 = _2879 ^ _2743;
    float _3163 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3165 = uint(_3145) >= uint(_2743);
    float _3167 = _3153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3169 = !_3157;
    int _3171 = _3169 ? 0 : (-1);
    uint _3173 = uint(int(uint(_3161) >> uint(31)));
    float _3175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3177 = !_3165;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = ~_3171;
    int _3183 = _3129 + _3181;
    int _3185 = _3183 + 1;
    int _3187 = ~int(_3173);
    int _3189 = _3187 + 1;
    int _3191 = ~_3119;
    int _3193 = _3191 + _3179;
    int _3195 = _3193 + 1;
    float _3197 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3199 = _3185 ^ _3189;
    float _3201 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3203 = _2743 == 0;
    int _3205 = _2743 * _3195;
    int _3207 = _3205 + _2879;
    int _3209 = ~_3189;
    int _3211 = _3209 + _3199;
    int _3213 = _3211 + 1;
    float _3215 = _1995 * _2057;
    bool _3217 = _2743 == 0;
    float _3219 = _3197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3221 = _3201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3223 = !_3203;
    int _3225 = _3223 ? _3213 : (-1);
    float _3227 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3229 = _3215 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3231 = !_3217;
    int _3233 = _3231 ? _3207 : (-1);
    out.m_62.x = _3163;
    out.m_62.y = _3219;
    out.m_62.z = _3221;
    out.m_62.w = _3167;
    float _3235 = float(_3225);
    float _3237 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3227);
    float _3239 = float(_3233);
    float _3241 = _3175 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3243 = _1995 > 0.0;
    bool _3245 = isnan(_1995);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan(0.0);
    bool _3251 = _3247 || _3249;
    float _3253 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3237);
    float _3255 = _273 * _3229;
    float _3257 = fma(_3241, _3239, _1379);
    bool _3259 = _2057 <= 0.0;
    bool _3261 = !_3251;
    bool _3263 = _3259 || _3261;
    float _3265 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3253);
    float _3267 = _3255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3269 = _3159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3271 = _3109 + (-0.5);
    float _3273 = _3033 + 0.5;
    float _3275 = -_1405;
    float _3277 = _3275 + 1.0;
    float _3279 = -_1393;
    float _3281 = fma(_3269, _3235, _3279);
    out.gl_Position.x = _2327;
    out.gl_Position.y = _2329;
    out.gl_Position.z = _3265;
    out.gl_Position.w = _2295;
    float _3283 = fma(_3241, _3273, _3257);
    float _3285 = -_1385;
    float _3287 = _3285 + 1.0;
    float _3289 = -_3269;
    float _3291 = fma(_3289, _3271, _3281);
    float _3293 = -_1343;
    float _3295 = _3293 + 1.0;
    float _3297 = _2412 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3299 = _3265 + _2295;
    float _3301 = -_3287;
    float _3303 = fma(_3033, _3301, _3283);
    float _3305 = _3297 * _2357;
    float _3307 = _3299 * 0.5;
    float _3309 = -_3297;
    float _3311 = _3309 + 1.0;
    float _3313 = -_2396;
    float _3315 = fma(_3077, _3313, _3141);
    float _3317 = _2368 * _3305;
    float _3319 = _2378 * _3305;
    out.m_64.z = _3307;
    out.m_64.w = _2295;
    float _3321 = fma(_3115, _3277, _3151);
    float _3323 = fma(_3109, _3295, _3291);
    float _3325 = fma(_2374, _3317, _2362);
    float _3327 = fma(_2376, _3317, _2364);
    out.m_45.x = _3267;
    float _3329 = _2368 * _3311;
    float _3331 = fma(_2368, _3319, _2366);
    out.m_66.x = _3303;
    out.m_66.y = _3323;
    out.m_66.z = _3315;
    out.m_66.w = _3321;
    out.m_68.x = _3325;
    out.m_68.y = _3327;
    out.m_68.z = _3331;
    out.m_68.w = _3329;
    if (!_3263)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3333;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1063 = false;
    bool _785 = false;
    bool _489 = false;
    bool _297 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3389 = as_type<float>(_103);
        out.gl_Position.z = _3389;
    }
    if (!_91)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_87);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3458 = as_type<float>(_141);
        out.gl_Position.z = _3458;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = _147 * _145;
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    int _161 = as_type<int>(_149) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_149) & 2;
    bool _167 = _165 != 0;
    float _169 = _159 * 6.283185482025146484375;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = floor(_159);
    float _177 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _169 * 0.15915493667125701904296875;
    bool _181 = !_167;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _189 = _187 != 0;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _193 = _191 != 0;
    float _195 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _199 = _179 * 6.283185482025146484375;
    float _201 = cos(_199);
    float _203 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    bool _205 = !_189;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _211 = !_173;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    int _217 = abs(_207);
    float _219 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _221 = -_175;
    float _223 = _159 + _221;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = -_223;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _231 = abs(_213);
    float _233 = float(_217);
    float _235 = fma(_201, 0.5, 0.5);
    bool _237 = !_193;
    int _239 = _237 ? 0 : 1;
    bool _241 = _223 < 0.5;
    float _243 = float(_241);
    float _245 = abs(_229);
    float _247 = _233 * _245;
    int _249 = abs(_239);
    float _251 = -_235;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = float(_231);
    float _257 = -_243;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _261 = float(_249);
    float _263 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _209);
    bool _265 = !_163;
    float _267 = _265 ? (-0.5) : 0.5;
    float _269 = fma(_255, _253, _247);
    float _271 = abs(_259);
    float _273 = fma(_261, _271, _269);
    bool _275 = !_225;
    float _277 = _219;
    float _279 = _215;
    float _295;
    if (!_275)
    {
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_87);
        float _301 = 1.0 / _299;
        float _303 = _119 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _305 + _311;
    bool _315 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _317 = isnan(_305);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _305 + _339;
    float _343 = 1.0 / _329;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = 1.0 / _337;
    float _349 = 1.0 / _333;
    float _351 = _309 * _343;
    bool _353 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _355 = isnan(_305);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -_325;
    float _367 = _365 + 1.0;
    float _369 = _363 * _367;
    float _371 = _313 * _347;
    bool _373 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_305);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _341 * _349;
    bool _395 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _397 = isnan(_305);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _407;
    float _411 = _383 * _387;
    float _413 = -_383;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = fma(_409, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = _405 * _415;
    float _429 = fma(_419, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = fma(_391, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_423, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = -_405;
    float _437 = _435 + 1.0;
    float _439 = _425 * _427;
    float _441 = _429 * _427;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _447;
    float _451 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].x, _439);
    float _453 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].y, _441);
    float _455 = fma(_445, _371, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_449, _371, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = fma(_431, _411, _451);
    float _461 = fma(_433, _411, _453);
    float _463 = fma(_455, _369, _459);
    float _465 = fma(_457, _369, _461);
    float _467 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[146].x, _463);
    float _469 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[146].y, _465);
    bool _471 = !_345;
    float _487;
    if (!_471)
    {
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _475 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        float _491 = float(_87);
        float _493 = 1.0 / _491;
        float _495 = _119 * _493;
        _487 = _495;
    }
    _489 = false;
    float _497 = _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _497 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _505 = _497 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _509 = _497 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _527 = 1.0 / _517;
    float _529 = 1.0 / _525;
    bool _531 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _533 = isnan(_497);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _545 = -_541;
    float _547 = _545 + 1.0;
    float _549 = 1.0 / _521;
    float _551 = 1.0 / _513;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _555 = _497 + _553;
    float _557 = _501 * _529;
    bool _559 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _561 = isnan(_497);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _571;
    float _575 = _555 * _527;
    bool _577 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _579 = isnan(_497);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _505 * _549;
    bool _591 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _593 = isnan(_497);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_587;
    float _605 = _603 + 1.0;
    float _607 = fma(_573, _589, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _609 = _569 * _605;
    float _611 = _509 * _551;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _617;
    float _621 = -_569;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _629 = fma(_615, _589, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _631 = fma(_619, _589, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _633 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _635 = isnan(_497);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _601 * _547;
    float _647 = -_601;
    float _649 = _647 + 1.0;
    float _651 = _541 * _623;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = _643 * _649;
    float _663 = fma(_627, _557, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _665 = fma(_655, _557, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _667 = fma(_659, _557, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _669 = _607 * _661;
    float _671 = -_643;
    float _673 = _671 + 1.0;
    float _675 = _629 * _661;
    float _677 = _631 * _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _679;
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].x, _669);
    float _685 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _691;
    float _695 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].z, _677);
    float _697 = fma(_681, _611, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _699 = fma(_665, _645, _683);
    float _701 = fma(_663, _645, _685);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _711 = fma(_689, _611, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _713 = fma(_693, _611, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _719 = fma(_667, _645, _695);
    float _721 = fma(_705, _575, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _723 = fma(_709, _575, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _725 = fma(_717, _575, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _727 = fma(_711, _651, _699);
    float _729 = fma(_697, _651, _701);
    float _731 = fma(_713, _651, _719);
    float _733 = fma(_721, _609, _727);
    float _735 = fma(_723, _609, _729);
    float _737 = fma(_725, _609, _731);
    float _739 = in.m_56.x;
    float _741 = in.m_56.y;
    float _743 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].x, _733);
    float _745 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].y, _735);
    float _747 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].z, _737);
    float _749 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _751 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _753 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _757;
    out.m_58.y = _759;
    out.m_58.z = _761;
    out.m_58.w = _755;
    float _763 = _469 * _741;
    float _765 = _467 * _739;
    bool _767 = !_543;
    float _783;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_87);
        float _789 = 1.0 / _787;
        float _791 = _119 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _797 = _793 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _801 = _793 + _799;
    bool _803 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _805 = isnan(_793);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _831 = 1.0 / _817;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _835 = _793 + _833;
    float _837 = 1.0 / _829;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _841 = _793 + _839;
    bool _843 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _845 = isnan(_793);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = 1.0 / _821;
    float _857 = _797 * _831;
    bool _859 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _861 = isnan(_793);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    bool _871 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _873 = isnan(_793);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _825;
    float _891 = _841 * _837;
    float _893 = -_813;
    float _895 = _893 + 1.0;
    float _897 = _881 * _895;
    float _899 = -_881;
    float _901 = _899 + 1.0;
    float _903 = _801 * _855;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = fma(_907, _857, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _915 = fma(_911, _903, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _917 = _835 * _889;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _919;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _923;
    float _927 = _853 * _887;
    float _929 = -_853;
    float _931 = _929 + 1.0;
    float _933 = fma(_921, _857, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _935 = fma(_925, _857, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _937 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _939 = isnan(_793);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _869 * _901;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _959 = _947 * _931;
    float _961 = fma(_953, _903, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _963 = fma(_957, _903, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _965 = -_947;
    float _967 = _965 + 1.0;
    float _969 = _913 * _959;
    float _971 = _933 * _959;
    float _973 = _935 * _959;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _983;
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].x, _969);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].y, _971);
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].z, _973);
    float _993 = fma(_977, _917, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _995 = fma(_981, _917, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _997 = fma(_985, _917, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _999 = fma(_961, _927, _987);
    float _1001 = fma(_915, _927, _989);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1011 = fma(_963, _927, _991);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1017 = fma(_993, _949, _999);
    float _1019 = fma(_1005, _891, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1021 = fma(_1009, _891, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1023 = fma(_995, _949, _1001);
    float _1025 = fma(_1015, _891, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1027 = fma(_997, _949, _1011);
    float _1029 = fma(_1019, _897, _1017);
    float _1031 = fma(_1021, _897, _1023);
    float _1033 = fma(_1025, _897, _1027);
    float _1035 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1029);
    float _1037 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1031);
    float _1039 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1033);
    bool _1041 = !_883;
    float _1059;
    float _1061;
    if (!_1041)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1045 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1047 = float(_87);
        float _1049 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1051 = _1049 * _1043;
        float _1053 = floor(_1051);
        float _1055 = -_1053;
        float _1057 = _1051 + _1055;
        _1059 = _1047;
        _1061 = _1057;
        _1063 = true;
    }
    else
    {
        float _1065 = float(_87);
        float _1067 = 1.0 / _1065;
        float _1069 = _119 * _1067;
        _1059 = _1065;
        _1061 = _1069;
    }
    _1063 = false;
    float _1071 = _1059;
    float _1073 = _1061;
    float _1075 = in.m_49.z;
    float _1077 = _143 * 2.0;
    float _1079 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1081 = in.m_49.y;
    float _1083 = floor(_1077);
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1087 = _1085 != 0;
    float _1089 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1091 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1097 = -_1093;
    float _1099 = fma(_1079, 2.0, _1097);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1105 = _1083 > 0.0;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1109 = _1075 * 2.0;
    bool _1111 = _1083 >= 0.0;
    bool _1113 = isnan(_1083);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    float _1121 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1123 = int(_1121);
    float _1125 = _1081 + _1075;
    float _1127 = _1081 * 2.0;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1131 = _1129 != 0;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1139 = _1137 != 0;
    float _1141 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1143 = _1125 + (-1.0);
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1147 = floor(_1109);
    float _1149 = fma(_1141, -2.0, _1095);
    bool _1151 = !_1135;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1145);
    bool _1157 = !_1131;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1081 + (-0.5);
    float _1163 = _1119 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1165 = floor(_1127);
    float _1167 = float(_1123);
    int _1169 = ~as_type<int>(_1163);
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    int _1175 = _1173;
    float _1177 = _1163;
    float _1179 = _1143;
    if (!_1105)
    {
        int _1181 = ~as_type<int>(_1163);
        int _1183 = _1181 + 1;
        _1175 = _1183;
    }
    int _1185 = _1175;
    float _1187 = _1167 * _119;
    if (!_1087)
    {
        _1177 = _1075;
    }
    float _1189 = _1177;
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1193 = int(_1191);
    float _1195 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1197 = !_1139;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1207 = _1205 != 0;
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1211 = _1209 != 0;
    bool _1213 = _1147 > 0.0;
    float _1215 = _1189;
    if (!_1087)
    {
        _1179 = _1081;
    }
    float _1217 = _1179;
    bool _1219 = !_1207;
    int _1221 = _1219 ? 0 : 1;
    bool _1223 = _1147 >= 0.0;
    bool _1225 = isnan(_1147);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan(0.0);
    bool _1231 = _1227 || _1229;
    float _1233 = _1217;
    if (_1087)
    {
        _1233 = _143;
    }
    float _1235 = _1233;
    if (_1087)
    {
        _1215 = _1081;
    }
    float _1237 = _1215;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1241 = _1165 > 0.0;
    bool _1243 = _1165 >= 0.0;
    bool _1245 = isnan(_1165);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1239);
    float _1255 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1101);
    float _1259 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1261 = log2(_1259);
    float _1263 = _1237;
    if (!_1087)
    {
        _1263 = _1075;
    }
    float _1265 = _1263;
    float _1267 = -_1103;
    float _1269 = fma(_1255, 2.0, _1267);
    float _1271 = _1265;
    if (_1087)
    {
        _1271 = _1081;
    }
    float _1273 = _1271;
    float _1275 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1253);
    float _1277 = float(_1193);
    int _1279 = _1231 ? 0 : 1;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1283 = abs(_1221);
    float _1285 = 1.0 / _1277;
    int _1287 = _1251 ? 0 : 1;
    float _1289 = fma(_1281, -2.0, _1107);
    int _1291 = ~_1279;
    int _1293 = _1291 + 1;
    int _1295 = _1293 + 1;
    float _1297 = float(_1185);
    float _1299 = _1261 * _119;
    float _1301 = float(_1283);
    int _1303 = _1295;
    if (!_1213)
    {
        int _1305 = ~_1279;
        int _1307 = _1305 + 1;
        _1303 = _1307;
    }
    int _1309 = _1303;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1313 = in.m_60.x;
    float _1315 = in.m_60.y;
    float _1317 = in.m_60.z;
    int _1319 = ~_1287;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = _1301 * _1297;
    int _1327 = _1323;
    if (!_1241)
    {
        int _1329 = ~_1287;
        int _1331 = _1329 + 1;
        _1327 = _1331;
    }
    int _1333 = _1327;
    float _1335 = exp2(_1299);
    float _1337 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1311);
    bool _1339 = !_1203;
    int _1341 = _1339 ? 0 : 1;
    float _1343 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1155);
    bool _1345 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1347 = isnan(1.0);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1353 = _1349 || _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1357 = 1.0 + _1355;
    float _1359 = _1325 * (-2.0);
    int _1361 = abs(_1341);
    float _1363 = -_119;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1269);
    bool _1367 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1369 = isnan(0.0);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1375 = _1371 || _1373;
    float _1377 = -_119;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1099);
    float _1381 = 1.0 / _1357;
    float _1383 = float(_1361);
    float _1385 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1337);
    float _1387 = float(_1309);
    float _1389 = -_1335;
    float _1391 = _1389 + 1.0;
    float _1393 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1149);
    bool _1395 = !_1211;
    int _1397 = _1395 ? 0 : 1;
    float _1399 = _1285 * _119;
    float _1401 = fma(_1359, _1315, _1315);
    float _1403 = _1375 ? _1391 : 0.0;
    float _1405 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1257);
    float _1407 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1289);
    float _1409 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1401);
    float _1411 = _143 + _1081;
    float _1413 = _1383 * _1387;
    float _1415 = fma(_1195, _1359, _1195);
    if (_1353)
    {
        float _1417 = _1403 * _1381;
        _123 = _1417;
    }
    float _1419 = _123;
    int _1421 = abs(_1397);
    float _1423 = _1411 + (-1.0);
    float _1425 = _1413 * (-2.0);
    float _1427 = fma(_1415, _1419, _1409);
    float _1429 = float(_1421);
    float _1431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1433 = float(_1333);
    float _1435 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1437 = _143 + (-0.5);
    float _1439 = fma(_1425, _1313, _1313);
    float _1441 = _143 + _1075;
    float _1443 = _1429 * _1433;
    float _1445 = fma(_1435, _1425, _1435);
    float _1447 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    float _1449 = _1441 + (-1.0);
    float _1451 = _1443 * (-2.0);
    float _1453 = fma(_1445, _1419, _1447);
    float _1455 = _1427 * 0.15915493667125701904296875;
    float _1457 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1459 = fma(_1451, _1317, _1317);
    float _1461 = _1075 + (-0.5);
    float _1463 = _1453 * 0.15915493667125701904296875;
    float _1465 = fma(_1457, _1451, _1457);
    float _1467 = _1455 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1459);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _267);
    float _1475 = _1089 * _1431;
    float _1477 = fma(_1465, _1419, _1471);
    float _1479 = _1091 * _1473;
    float _1481 = _1455 * 6.283185482025146484375;
    float _1483 = cos(_1481);
    float _1485 = _1477 * 0.15915493667125701904296875;
    float _1487 = in.m_42.x;
    float _1489 = in.m_42.y;
    float _1491 = in.m_42.z;
    float _1493 = _1463 * 6.283185482025146484375;
    float _1495 = sin(_1493);
    float _1497 = _1463 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = _1485 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1495 * _1469;
    float _1507 = _1495 * _1483;
    float _1509 = _1485 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = _1499 * _1469;
    float _1515 = _1469 * _1503;
    float _1517 = _1503 * _1475;
    float _1519 = _1499 * _1483;
    float _1521 = _1483 * _1503;
    float _1523 = _1499 * _1517;
    float _1525 = _1495 * _1517;
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = fma(_1511, _1519, _1505);
    float _1531 = -_1475;
    float _1533 = _1511 * _1531;
    float _1535 = -_1513;
    float _1537 = fma(_1511, _1507, _1535);
    float _1539 = -_1507;
    float _1541 = fma(_1511, _1513, _1539);
    float _1543 = fma(_1529, _1479, _1523);
    float _1545 = fma(_1521, _1479, _1533);
    float _1547 = fma(_1511, _1505, _1519);
    float _1549 = fma(_1537, _1479, _1525);
    float _1551 = fma(_1541, _1527, _1543);
    float _1553 = fma(_1515, _1527, _1545);
    float _1555 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1557 = fma(_1547, _1527, _1549);
    float _1559 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1561 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1563 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1555);
    float _1565 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1567 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1559);
    float _1569 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1561);
    float _1571 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1563);
    float _1573 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1565);
    float _1575 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1567);
    float _1577 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1569);
    float _1579 = _1571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1581 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1573);
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1587 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1589 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1591 = _1579 + _1583;
    float _1593 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1595 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1587);
    float _1597 = _1585 + _1589;
    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1601 = _1591 + _1599;
    float _1603 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1593);
    float _1605 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1595);
    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1609 = _1597 + _1607;
    float _1611 = _1601 * _1601;
    float _1613 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1603);
    float _1615 = _1605 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1617 = fma(_1609, _1609, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1621 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1623 = sqrt(_1617);
    float _1625 = _1615 + _1619;
    float _1627 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1621);
    float _1629 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1627);
    bool _1631 = _1623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = _1621;
    float _1635 = _1613;
    float _1637 = _1597;
    if (!_1631)
    {
        _1633 = _1597;
    }
    float _1639 = _1633;
    float _1641 = _1639;
    if (!_1631)
    {
        _1635 = _1591;
    }
    float _1643 = _1635;
    float _1645 = _1643;
    if (!_1631)
    {
        _1637 = _1625;
    }
    float _1647 = _1637;
    bool _1649 = !_1631;
    float _1651 = _1647;
    if (!_1649)
    {
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1657 = _1623 + _1655;
        float _1659 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1661 = rsqrt(_1617);
        float _1663 = _1657 * _1653;
        float _1665 = _1663 * 0.15915493667125701904296875;
        float _1667 = _1665 * 6.283185482025146484375;
        float _1669 = cos(_1667);
        float _1671 = _1665 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        float _1675 = _1669 + (-1.0);
        float _1677 = fma(_1673, _1659, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1679 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = _1661 * _1677;
        float _1683 = fma(_1625, _1669, _1679);
        float _1685 = fma(_1609, _1681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1687 = fma(_1601, _1681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1651 = _1683;
        _1641 = _1685;
        _1645 = _1687;
    }
    float _1689 = _1651;
    float _1691 = _1641;
    float _1693 = _1645;
    float _1695 = -_1615;
    float _1697 = _1695 + _1689;
    float _1699 = -_1585;
    float _1701 = _1699 + _1691;
    float _1703 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1705 = -_1579;
    float _1707 = _1705 + _1693;
    float _1709 = _1697 * _1697;
    float _1711 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1713 = 1.0 / _1703;
    float _1715 = fma(_1701, _1701, _1709);
    float _1717 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1711);
    bool _1719 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    float _1729 = fma(_1707, _1707, _1715);
    float _1731 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1717);
    float _1733 = sqrt(_1729);
    float _1735 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1737 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1739 = isnan(0.5);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1745 = _1741 || _1743;
    float _1747 = _1735 + _1703;
    float _1749 = _1747 * _1713;
    float _1751 = _1749 * 0.5;
    bool _1753 = _1733 > 0.0;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1757 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1755);
    float _1759 = 1.0 / _1757;
    bool _1761 = !_1753;
    float _1763 = _1689;
    float _1765 = _1693;
    float _1767 = _1691;
    float _1769 = _1697;
    float _1771 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1773 = _1701;
    float _1775 = _1711;
    float _1777 = _1751;
    float _1779 = _1707;
    if (!_1761)
    {
        float _1781 = _219 * _219;
        float _1783 = fma(_215, _215, _1781);
        float _1785 = fma(_263, _263, _1783);
        float _1787 = rsqrt(_1729);
        float _1789 = sqrt(_1785);
        float _1791 = _1701 * _1787;
        float _1793 = _1707 * _1787;
        bool _1795 = _1789 > 0.0;
        float _1797 = _1697 * _1787;
        bool _1799 = !_1795;
        _1771 = _1787;
        _1775 = _1797;
        _1777 = _1785;
        if (!_1799)
        {
            float _1801 = rsqrt(_1785);
            float _1803 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1805 = _219 * _1801;
            float _1807 = _215 * _1801;
            float _1809 = _263 * _1801;
            float _1811 = _1797 * _1805;
            float _1813 = fma(_1791, _1807, _1811);
            float _1815 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1817 = fma(_1793, _1809, _1813);
            float _1819 = _1817 * _1815;
            float _1821 = fma(_215, _1819, _1691);
            float _1823 = fma(_219, _1819, _1689);
            float _1825 = fma(_263, _1819, _1693);
            _1763 = _1823;
            _1765 = _1825;
            _1767 = _1821;
            _1769 = _1819;
            _1771 = _1809;
            _1773 = _1803;
            _1775 = _1815;
            _1779 = _1805;
        }
    }
    float _1827 = _1763;
    float _1829 = _1765;
    float _1831 = _1767;
    float _1833 = _1769;
    float _1835 = _1771;
    float _1837 = _1773;
    float _1839 = _1775;
    float _1841 = _1777;
    float _1843 = _1779;
    float _1845 = _1843;
    float _1847 = _1831;
    float _1849 = _1835;
    float _1851 = _1839;
    float _1853 = _1827;
    float _1855 = _1833;
    float _1857 = _1837;
    float _1859 = _1841;
    if (_1745)
    {
        _1845 = 1.0;
    }
    float _1861 = _1845;
    float _1863 = _1861;
    if (_1727)
    {
        _277 = _1827;
    }
    float _1865 = _277;
    float _1867 = _1865;
    if (_1727)
    {
        _279 = _1829;
    }
    float _1869 = _279;
    float _1871 = _1869;
    if (!_1727)
    {
        float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1875 = _1615 + _1873;
        float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1879 = _1585 + _1877;
        float _1881 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1883 = -_1585;
        float _1885 = _1883 + _1831;
        float _1887 = _1875 * _1875;
        float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1891 = _1579 + _1889;
        float _1893 = fma(_1879, _1879, _1887);
        float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1897 = fma(_1891, _1891, _1893);
        float _1899 = sqrt(_1897);
        float _1901 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1903 = precise::min(_1899, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1905 = _1903 * _1895;
        float _1907 = -_1615;
        float _1909 = _1907 + _1827;
        float _1911 = _1901 * _1905;
        float _1913 = -_1579;
        float _1915 = _1913 + _1829;
        float _1917 = fma(_1885, _1911, _1585);
        float _1919 = fma(_1909, _1911, _1615);
        float _1921 = fma(_1915, _1911, _1579);
        _1867 = _1919;
        _1847 = _1917;
        _1871 = _1921;
        _1849 = _1899;
        _1851 = _1911;
    }
    float _1923 = _1867;
    float _1925 = _1847;
    float _1927 = _1871;
    float _1929 = _1849;
    float _1931 = _1851;
    float _1933 = _1931;
    if (_1745)
    {
        _1853 = 1.0;
    }
    float _1935 = _1853;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1759 * _1937;
    float _1941 = _1935;
    if (!_1745)
    {
        float _1943 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1945 = _1943 * 0.15915493667125701904296875;
        float _1947 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1949 = _1945 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = _1947 * 0.15915493667125701904296875;
        float _1955 = _1945 * 6.283185482025146484375;
        float _1957 = sin(_1955);
        float _1959 = 1.0 / _1951;
        float _1961 = _1953 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1957 * _1959;
        float _1967 = _1953 * 6.283185482025146484375;
        float _1969 = sin(_1967);
        float _1971 = _1963 * _1965;
        float _1973 = 1.0 / _1971;
        float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1975;
        float _1979 = 1.0 / _1977;
        float _1981 = _1969 * _1973;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1985 = fma(_1939, _1981, _1983);
        float _1987 = _1985 * _1979;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1855 = _1973;
        _1857 = _1953;
        _1863 = _1989;
    }
    float _1991 = _1855;
    float _1993 = _1857;
    float _1995 = _1863;
    float _1997 = _1993;
    float _1999 = _1991;
    if (!_1745)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2005 * 0.15915493667125701904296875;
        float _2013 = _2003 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = 1.0 / _2009;
        float _2019 = _2011 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = _2011 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = _2021 * _2023;
        float _2031 = 1.0 / _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2035 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2033;
        float _2037 = 1.0 / _2035;
        float _2039 = _2027 * _2031;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2043 = fma(_1939, _2039, _2041);
        float _2045 = _2043 * _2037;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        float _2049 = -_2047;
        float _2051 = _2049 + 1.0;
        _1997 = _2029;
        _1999 = _2017;
        _1941 = _2051;
    }
    float _2053 = _1997;
    float _2055 = _1999;
    float _2057 = _1941;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2061 = _1923 + _2059;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2065 = _1925 + _2063;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2069 = _1927 + _2067;
    float _2071 = _2061 * _2061;
    float _2073 = fma(_2065, _2065, _2071);
    float _2075 = fma(_2069, _2069, _2073);
    float _2077 = rsqrt(_2075);
    float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2081 = _2065 * _2079;
    float _2083 = _2069 * _2079;
    float _2085 = _2081 * _2081;
    float _2087 = _2083 * _2083;
    float _2089 = _2085 + _2087;
    float _2091 = sqrt(_2089);
    bool _2093 = _2091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2097 = _2091 + _2095;
    float _2099 = _1929;
    float _2101 = _2097;
    float _2103 = _2061;
    float _2105 = _2081;
    float _2107 = _2083;
    float _2109 = _2085;
    float _2111 = _2087;
    if (_2093)
    {
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2113;
    }
    float _2115 = _2099;
    float _2117 = _2115;
    if (_2093)
    {
        float _2119 = _2097 * _2115;
        _2101 = _2119;
    }
    float _2121 = _2101;
    if (_2093)
    {
        float _2123 = rsqrt(_2089);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = _2125;
    if (_2093)
    {
        float _2129 = _2121 * 0.15915493667125701904296875;
        _1933 = _2129;
    }
    float _2131 = _1933;
    float _2133 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2135 = _2053;
    if (_2093)
    {
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = sin(_2137);
        _2135 = _2139;
    }
    float _2141 = _2135;
    float _2143 = precise::max(0.0, _2133);
    float _2145 = _2055;
    float _2147 = _2143;
    if (_2093)
    {
        float _2149 = _2131 * 6.283185482025146484375;
        float _2151 = cos(_2149);
        _2145 = _2151;
    }
    float _2153 = _2145;
    float _2155 = -_2079;
    float _2157 = -_2143;
    float _2159 = fma(_2061, _2155, _2157);
    if (_2093)
    {
        float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2161;
    }
    float _2163 = _2103;
    float _2165 = _2163;
    if (_2093)
    {
        float _2167 = fma(_2141, _2163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1859 = _2167;
    }
    float _2169 = _1859;
    float _2171 = _2169;
    if (!_2093)
    {
        _2165 = _2159;
    }
    float _2173 = _2165;
    float _2175 = sqrt(_2075);
    float _2177 = _2173;
    if (_2093)
    {
        float _2179 = _2125 * _2169;
        _2171 = _2179;
    }
    float _2181 = _2171;
    if (_2093)
    {
        float _2183 = _2153 + (-1.0);
        _2147 = _2183;
    }
    float _2185 = _2147;
    if (_2093)
    {
        float _2187 = _2081 * _2181;
        _2105 = _2187;
    }
    float _2189 = _2105;
    if (_2093)
    {
        float _2191 = _2083 * _2181;
        _2107 = _2191;
    }
    float _2193 = _2107;
    if (_2093)
    {
        float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2195;
    }
    float _2197 = _2127;
    if (_2093)
    {
        float _2199 = _2189 * _2189;
        _2109 = _2199;
    }
    float _2201 = _2109;
    if (_2093)
    {
        float _2203 = _2193 * _2193;
        _2111 = _2203;
    }
    float _2205 = _2111;
    float _2207 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2093)
    {
        float _2209 = fma(_2159, _2153, _2197);
        _2177 = _2209;
    }
    float _2211 = _2177;
    float _2213 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = fma(_2211, _2211, _2201);
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2219 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2217);
    float _2221 = precise::clamp(_2219, 0.0, 1.0);
    float _2223 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2225 = _2215 + _2205;
    float _2227 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2207);
    float _2229 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2231 = -_2221;
    float _2233 = _2231 + 1.0;
    float _2235 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2237 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2227);
    float _2239 = rsqrt(_2225);
    float _2241 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2229);
    float _2243 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2245 = _2237 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2247 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2235);
    float _2249 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2241);
    float _2251 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2243);
    float _2253 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2255 = abs(_2233);
    float _2257 = log2(_2255);
    float _2259 = _2249 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2261 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2263 = -_2253;
    float _2265 = fma(_2263, _2223, 1.0);
    float _2267 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2247);
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2271 = _2239 * _2189;
    float _2273 = _2239 * _2211;
    float _2275 = _2239 * _2193;
    float _2277 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2269);
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2281 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2283 = log2(_2265);
    float _2285 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2277);
    float _2287 = -_2279;
    float _2289 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2287);
    float _2291 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2293 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2295 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2285);
    float _2297 = -_2275;
    float _2299 = fma(_2297, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2289);
    float _2301 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2303 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2293);
    float _2305 = exp2(_2291);
    float _2307 = fma(_2299, -0.5, 0.5);
    float _2309 = fma(_2299, 0.5, 0.5);
    float _2311 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2301);
    float _2313 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2303);
    float _2315 = _2273 + 1.0;
    float _2317 = fma(_2309, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2319 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2311);
    float _2321 = 1.0 / _2295;
    float _2323 = _2283 * 0.693147182464599609375;
    float _2325 = fma(_2309, _2317, -0.212114393711090087890625);
    float _2327 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2319);
    float _2329 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2313);
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2333 = fma(_2309, _2325, 1.570728778839111328125);
    float _2335 = sqrt(_2307);
    float _2337 = -_2273;
    float _2339 = fma(_2305, _2315, _2337);
    float _2341 = fma(_2339, 0.5, 0.5);
    float _2343 = _2327 * _2321;
    float _2345 = _2329 * _2321;
    float _2347 = fma(_2343, 0.5, 0.5);
    float _2349 = fma(_2345, -0.5, 0.5);
    float _2351 = _2335 * 0.636619746685028076171875;
    float _2353 = -_2333;
    float _2355 = fma(_2351, _2353, 1.0);
    float3 _6934 = float3(_2347, _2349, _2331);
    float _2357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).x;
    float3 _6945 = float3(_2347, _2349, _2331);
    float4 _2360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6945, float3(0.0), isnan(_6945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6945, float3(0.0), isnan(_6945)), level(0.0)).xyzw;
    float _2362 = _2360.x;
    float _2364 = _2360.y;
    float _2366 = _2360.z;
    float _2368 = _2360.w;
    float2 _6962 = float2(_2355, _2341);
    float3 _2372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6962, float2(0.0), isnan(_6962)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6962, float2(0.0), isnan(_6962)), level(0.0)).xyz;
    float _2374 = _2372.x;
    float _2376 = _2372.y;
    float _2378 = _2372.z;
    float _2380 = float(uint(_1123));
    float _2382 = trunc(_1399);
    int _2384 = int(_2382);
    int _2386 = ~_1123;
    int _2388 = _2386 + 1;
    float _2390 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2392 = _143 > 0.5;
    float _2394 = -_1275;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1075 > 0.5;
    float _2400 = 1.0 / _2380;
    float _2402 = float(uint(_2384));
    float _2404 = exp2(_2390);
    int _2406 = as_type<int>(_2400) + (-2);
    float _2408 = as_type<float>(_2406) * _2402;
    float _2410 = -_2404;
    float _2412 = _2410 + 1.0;
    float _2414 = trunc(_2408);
    float _2416 = precise::max(_2414, 0.0);
    uint _2419 = uint(_2416);
    int _2421 = _2388 * int(_2419);
    int _2423 = _2421 + _2384;
    float _2425 = float(uint(_2423));
    float _2427 = as_type<float>(_2406) * _2425;
    bool _2429 = !_1087;
    float _2431 = _2429 ? 7.345489978790283203125 : 1.0;
    float _2433 = trunc(_2427);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _2431 * _143;
    float _2441 = float(_2384);
    float _2443 = floor(_2439);
    bool _2445 = _2441 >= _1167;
    bool _2447 = isnan(_2441);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(_1167);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    int _2457 = int(_2419) + int(_2437);
    float _2459 = trunc(_2455);
    int _2461 = int(_2459);
    int _2463 = _2388 * _2457;
    int _2465 = _2463 + _2384;
    float _2467 = -_2443;
    float _2469 = _2439 + _2467;
    float _2471 = 1.0 / _1071;
    bool _2473 = uint(_2465) >= uint(_1123);
    float _2475 = _2469 * _1167;
    bool _2477 = !_2473;
    int _2479 = _2477 ? 0 : (-1);
    bool _2481 = _1123 == 0;
    float _2483 = trunc(_2475);
    int _2485 = int(_2483);
    int _2487 = ~_2457;
    int _2489 = _2487 + _2479;
    int _2491 = _2489 + 1;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2495 = _2493 != 0;
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2499 = _2497 != 0;
    int _2501 = _1123 * _2491;
    int _2503 = _2501 + _2384;
    float _2505 = _1187 * _2471;
    int _2507 = ~_2461;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _1123 + (-1);
    bool _2515 = !_2481;
    int _2517 = _2515 ? _2503 : (-1);
    float _2519 = trunc(_2505);
    int _2521 = int(_2519);
    bool _2523 = !_2495;
    int _2525 = _2523 ? 0 : 1;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2529 = _2527 != 0;
    int _2531 = _2517 * _2511;
    int _2533 = abs(_1153);
    int _2535 = abs(_2525);
    int _2537 = _2461 * _2513;
    int _2539 = _2537 + _2531;
    int _2541 = abs(_1159);
    int _2543 = _2485 * _2535;
    int _2545 = _2543 + _2384;
    bool _2547 = !_2529;
    int _2549 = _2547 ? 0 : 1;
    int _2551 = abs(_1199);
    int _2553 = _2539 * _2533;
    int _2555 = abs(_2549);
    int _2557 = _2521 * _2541;
    int _2559 = _2557 + _2553;
    int _2561 = ~_1123;
    int _2563 = _2561 + 1;
    int _2565 = ~_1123;
    int _2567 = _2565 + 1;
    int _2569 = _2545 * _2551;
    int _2571 = _2569 + _2559;
    int _2573 = ~_1123;
    int _2575 = _2573 + 1;
    int _2577 = _2485 * _2555;
    int _2579 = _2577 + _2571;
    float _2581 = float(uint(_2579));
    float _2583 = as_type<float>(_2406) * _2581;
    float _2585 = trunc(_2583);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    int _2591 = _2575 * int(_2589);
    int _2593 = _2591 + _2579;
    float _2595 = float(uint(_2593));
    float _2597 = as_type<float>(_2406) * _2595;
    float _2599 = trunc(_2597);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    int _2605 = int(_2589) + int(_2603);
    float _2607 = float(uint(_2545));
    int _2609 = _2563 * _2605;
    int _2611 = _2609 + _2579;
    float _2613 = as_type<float>(_2406) * _2607;
    bool _2615 = uint(_2611) >= uint(_1123);
    float _2617 = trunc(_2613);
    float _2619 = precise::max(_2617, 0.0);
    uint _2621 = uint(_2619);
    bool _2623 = !_2615;
    int _2625 = _2623 ? 0 : (-1);
    int _2627 = ~_2605;
    int _2629 = _2627 + _2625;
    int _2631 = _2629 + 1;
    int _2633 = _1123 * _2631;
    int _2635 = _2633 + _2579;
    int _2637 = ~_1123;
    int _2639 = _2637 + 1;
    bool _2641 = !_2481;
    int _2643 = _2641 ? _2635 : (-1);
    int _2645 = _2639 * int(_2621);
    int _2647 = _2645 + _2545;
    int _2649 = _2643 >> 31;
    float _2651 = float(uint(_2647));
    int _2653 = _2649 & 3;
    int _2655 = _2643 & 3;
    bool _2657 = _2655 != 0;
    float _2659 = as_type<float>(_2406) * _2651;
    int _2661 = _2643 + _2653;
    int _2663 = _2643 & 3;
    bool _2665 = _2663 != 0;
    float _2667 = trunc(_2659);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    int _2673 = _2661 >> 2;
    bool _2675 = uint(_2663) > 1u;
    int _2677 = _2673 << 4;
    int _2679 = _2677 + 368;
    int _2681 = _2657 ? 0 : 1;
    uint _2683 = uint(int(uint(_2679) >> uint(2)));
    uint _2685 = uint(int(uint(int(_2683)) >> uint(2)));
    int _2687 = int(_2683) & 3;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[int(_2685)][_2687];
    int _2691 = int(_2683) + 1;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    int _2695 = _2691 & 3;
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[int(_2693)][_2695];
    int _2699 = ~_2681;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    int _2705 = int(_2621) + int(_2671);
    int _2707 = _2679 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = _2703;
    if (!_2675)
    {
        int _2727 = ~_2681;
        int _2729 = _2727 + 1;
        _2725 = _2729;
    }
    int _2731 = _2725;
    int _2733 = _2567 * _2705;
    int _2735 = _2733 + _2545;
    bool _2737 = !_2665;
    int _2739 = _2737 ? 0 : 1;
    float _2741 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2743 = int(_2741);
    int _2745 = abs(_2731);
    bool _2747 = _2663 != 3;
    bool _2749 = uint(_2735) >= uint(_1123);
    int _2751 = abs(_2739);
    bool _2753 = uint(_2663) >= 2u;
    bool _2755 = !_2749;
    int _2757 = _2755 ? 0 : (-1);
    int _2759 = ~_2745;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = _2753 ? 0 : 1;
    int _2767 = ~_2705;
    int _2769 = _2767 + _2757;
    int _2771 = _2769 + 1;
    int _2773 = ~_2751;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = ~_2765;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = _1123 * _2771;
    int _2787 = _2785 + _2545;
    bool _2789 = _2663 != 3;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2793 = _1073 + _2791;
    int _2795 = _2783;
    if (_2747)
    {
        int _2797 = ~_2765;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2805 = _2803 != 0;
    int _2807 = abs(_2801);
    float _2809 = float(uint(_2743));
    int _2811 = _2763 * as_type<int>(_2697);
    bool _2813 = !_2481;
    int _2815 = _2813 ? _2787 : (-1);
    int _2817 = _2777 * as_type<int>(_2689);
    int _2819 = _2817 + _2811;
    bool _2821 = !_2789;
    int _2823 = _2821 ? 0 : (-1);
    float _2825 = 1.0 / _2809;
    bool _2827 = !_2805;
    int _2829 = _2827 ? 0 : 1;
    float _2831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2833 = _2831 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2835 = abs(_2823);
    int _2837 = abs(_2829);
    int _2839 = ~_2807;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = abs(_2743);
    int _2847 = ~_2835;
    int _2849 = _2847 + 1;
    int _2851 = _2849 + 1;
    int _2853 = _2843 * as_type<int>(_2715);
    int _2855 = _2853 + _2819;
    float _2857 = 1.0 / _2833;
    int _2859 = ~_2837;
    int _2861 = _2859 + 1;
    int _2863 = _2861 + 1;
    int _2865 = _2851 * as_type<int>(_2723);
    int _2867 = _2865 + _2855;
    float _2869 = float(uint(_2845));
    int _2871 = _2867 * _2863;
    int _2873 = as_type<int>(_2825) + (-2);
    float _2875 = 1.0 / _2869;
    int _2877 = _2815 * _2837;
    int _2879 = _2877 + _2871;
    float _2881 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2883 = _2881 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2885 = in.m_49.w;
    float _2887 = float(uint(_2879));
    int _2889 = abs(_2879);
    float _2891 = 1.0 / _2883;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2895 = _2893 != 0;
    float _2897 = as_type<float>(_2873) * _2887;
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2901 = _2899 != 0;
    int _2903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2905 = _2903 != 0;
    float _2907 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2909 = _2907 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2911 = as_type<int>(_2875) + (-2);
    float _2913 = trunc(_2897);
    float _2915 = precise::max(_2913, 0.0);
    uint _2917 = uint(_2915);
    float _2919 = float(uint(_2889));
    bool _2921 = _1081 > 0.5;
    int _2923 = ~_2743;
    int _2925 = _2923 + 1;
    float _2927 = as_type<float>(_2911) * _2919;
    float _2929 = 1.0 / _2909;
    float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2931;
    float _2935 = -_267;
    int _2937 = _2392 ? as_type<int>(_2935) : as_type<int>(_267);
    bool _2939 = _2885 > 0.5;
    float _2941 = trunc(_2927);
    float _2943 = precise::max(_2941, 0.0);
    uint _2945 = uint(_2943);
    int _2947 = _2925 * int(_2917);
    int _2949 = _2947 + _2879;
    float _2951 = _2933 * _2857;
    float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2953;
    float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2959 = _2957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2961 = ~_2845;
    int _2963 = _2961 + 1;
    float _2965 = fma(_2951, _2793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2967 = float(uint(_2949));
    float _2969 = _2959 * _2891;
    bool _2971 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2973 = isnan(_1073);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2979 = _2975 || _2977;
    float _2981 = float(_2979);
    float _2983 = _2955 * _2929;
    bool _2985 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2987 = isnan(_1073);
    bool _2989 = _2985 || _2987;
    bool _2991 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2993 = _2989 || _2991;
    float _2995 = float(_2993);
    float _2997 = as_type<float>(_2873) * _2967;
    bool _2999 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3001 = isnan(_1073);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3007 = _3003 || _3005;
    float _3009 = float(_3007);
    float _3011 = -_2981;
    float _3013 = _3011 + 1.0;
    float _3015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3017 = _2963 * int(_2945);
    int _3019 = _3017 + _2889;
    float _3021 = -_2995;
    float _3023 = _3021 + 1.0;
    float _3025 = _3009 * _3013;
    float _3027 = -_3009;
    float _3029 = _3027 + 1.0;
    bool _3031 = !_2499;
    float _3033 = _3031 ? _267 : as_type<float>(_2937);
    float _3035 = float(uint(_3019));
    float _3037 = trunc(_2997);
    float _3039 = precise::max(_3037, 0.0);
    uint _3041 = uint(_3039);
    bool _3043 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3045 = isnan(_1073);
    bool _3047 = _3043 || _3045;
    bool _3049 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3051 = _3047 || _3049;
    float _3053 = float(_3051);
    float _3055 = _2995 * _3029;
    float _3057 = as_type<float>(_2911) * _3035;
    float _3059 = -_267;
    int _3061 = _2398 ? as_type<int>(_3059) : as_type<int>(_267);
    float _3063 = _3053 * _3023;
    float _3065 = -_3053;
    float _3067 = _3065 + 1.0;
    float _3069 = trunc(_3057);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    bool _3075 = !_2901;
    float _3077 = _3075 ? _267 : as_type<float>(_3061);
    float _3079 = _2965 * _3063;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3083 = _1073 + _3081;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3087 = _1073 + _3085;
    float _3089 = -_183;
    int _3091 = _2921 ? as_type<int>(_3089) : as_type<int>(_183);
    float _3093 = fma(_3067, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3079);
    float _3095 = -_183;
    int _3097 = _2939 ? as_type<int>(_3095) : as_type<int>(_183);
    float _3099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3101 = ~_2845;
    int _3103 = _3101 + 1;
    float _3105 = fma(_2969, _3083, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3107 = !_2895;
    float _3109 = _3107 ? _183 : as_type<float>(_3091);
    float _3111 = fma(_2983, _3087, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _3113 = !_2905;
    float _3115 = _3113 ? _183 : as_type<float>(_3097);
    float _3117 = fma(_3105, _3055, _3093);
    int _3119 = int(_2917) + int(_3041);
    float _3121 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3123 = ~_2743;
    int _3125 = _3123 + 1;
    float _3127 = fma(_3111, _3025, _3117);
    int _3129 = int(_2945) + int(_3073);
    float _3131 = _3077 + 0.5;
    float _3133 = _3099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3135 = _3103 * _3129;
    int _3137 = _3135 + _2889;
    float _3139 = _3115 + (-0.5);
    float _3141 = fma(_3121, _3131, _1365);
    int _3143 = _3125 * _3119;
    int _3145 = _3143 + _2879;
    float _3147 = -_3133;
    float _3149 = -_1407;
    float _3151 = fma(_3147, _3139, _3149);
    float _3153 = fma(_2981, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3127);
    float _3155 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3157 = uint(_3137) >= uint(_2845);
    float _3159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3161 = _2879 ^ _2743;
    float _3163 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3165 = uint(_3145) >= uint(_2743);
    float _3167 = _3153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3169 = !_3157;
    int _3171 = _3169 ? 0 : (-1);
    uint _3173 = uint(int(uint(_3161) >> uint(31)));
    float _3175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3177 = !_3165;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = ~_3171;
    int _3183 = _3129 + _3181;
    int _3185 = _3183 + 1;
    int _3187 = ~int(_3173);
    int _3189 = _3187 + 1;
    int _3191 = ~_3119;
    int _3193 = _3191 + _3179;
    int _3195 = _3193 + 1;
    float _3197 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3199 = _3185 ^ _3189;
    float _3201 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3203 = _2743 == 0;
    int _3205 = _2743 * _3195;
    int _3207 = _3205 + _2879;
    int _3209 = ~_3189;
    int _3211 = _3209 + _3199;
    int _3213 = _3211 + 1;
    float _3215 = _1995 * _2057;
    bool _3217 = _2743 == 0;
    float _3219 = _3197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3221 = _3201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3223 = !_3203;
    int _3225 = _3223 ? _3213 : (-1);
    float _3227 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3229 = _3215 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3231 = !_3217;
    int _3233 = _3231 ? _3207 : (-1);
    out.m_62.x = _3163;
    out.m_62.y = _3219;
    out.m_62.z = _3221;
    out.m_62.w = _3167;
    float _3235 = float(_3225);
    float _3237 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3227);
    float _3239 = float(_3233);
    float _3241 = _3175 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3243 = _1995 > 0.0;
    bool _3245 = isnan(_1995);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan(0.0);
    bool _3251 = _3247 || _3249;
    float _3253 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3237);
    float _3255 = _273 * _3229;
    float _3257 = fma(_3241, _3239, _1379);
    bool _3259 = _2057 <= 0.0;
    bool _3261 = !_3251;
    bool _3263 = _3259 || _3261;
    float _3265 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3253);
    float _3267 = _3255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3269 = _3159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3271 = _3109 + (-0.5);
    float _3273 = _3033 + 0.5;
    float _3275 = -_1405;
    float _3277 = _3275 + 1.0;
    float _3279 = -_1393;
    float _3281 = fma(_3269, _3235, _3279);
    out.gl_Position.x = _2327;
    out.gl_Position.y = _2329;
    out.gl_Position.z = _3265;
    out.gl_Position.w = _2295;
    float _3283 = fma(_3241, _3273, _3257);
    float _3285 = -_1385;
    float _3287 = _3285 + 1.0;
    float _3289 = -_3269;
    float _3291 = fma(_3289, _3271, _3281);
    float _3293 = -_1343;
    float _3295 = _3293 + 1.0;
    float _3297 = _2412 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3299 = _3265 + _2295;
    float _3301 = -_3287;
    float _3303 = fma(_3033, _3301, _3283);
    float _3305 = _3297 * _2357;
    float _3307 = _3299 * 0.5;
    float _3309 = -_3297;
    float _3311 = _3309 + 1.0;
    float _3313 = -_2396;
    float _3315 = fma(_3077, _3313, _3141);
    float _3317 = _2368 * _3305;
    float _3319 = _2378 * _3305;
    out.m_64.z = _3307;
    out.m_64.w = _2295;
    float _3321 = fma(_3115, _3277, _3151);
    float _3323 = fma(_3109, _3295, _3291);
    float _3325 = fma(_2374, _3317, _2362);
    float _3327 = fma(_2376, _3317, _2364);
    out.m_45.x = _3267;
    float _3329 = _2368 * _3311;
    float _3331 = fma(_2368, _3319, _2366);
    out.m_66.x = _3303;
    out.m_66.y = _3323;
    out.m_66.z = _3315;
    out.m_66.w = _3321;
    out.m_68.x = _3325;
    out.m_68.y = _3327;
    out.m_68.z = _3331;
    out.m_68.w = _3329;
    if (!_3263)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3333;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1063 = false;
    bool _785 = false;
    bool _489 = false;
    bool _297 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3389 = as_type<float>(_103);
        out.gl_Position.z = _3389;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_87);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3458 = as_type<float>(_141);
        out.gl_Position.z = _3458;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = _147 * _145;
    float _159 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    int _161 = as_type<int>(_149) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_149) & 2;
    bool _167 = _165 != 0;
    float _169 = _159 * 6.283185482025146484375;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = floor(_159);
    float _177 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _169 * 0.15915493667125701904296875;
    bool _181 = !_167;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _189 = _187 != 0;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _193 = _191 != 0;
    float _195 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _199 = _179 * 6.283185482025146484375;
    float _201 = cos(_199);
    float _203 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    bool _205 = !_189;
    int _207 = _205 ? 0 : 1;
    float _209 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _211 = !_173;
    int _213 = _211 ? 0 : 1;
    float _215 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    int _217 = abs(_207);
    float _219 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _221 = -_175;
    float _223 = _159 + _221;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = -_223;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _231 = abs(_213);
    float _233 = float(_217);
    float _235 = fma(_201, 0.5, 0.5);
    bool _237 = !_193;
    int _239 = _237 ? 0 : 1;
    bool _241 = _223 < 0.5;
    float _243 = float(_241);
    float _245 = abs(_229);
    float _247 = _233 * _245;
    int _249 = abs(_239);
    float _251 = -_235;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = float(_231);
    float _257 = -_243;
    float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _261 = float(_249);
    float _263 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _209);
    bool _265 = !_163;
    float _267 = _265 ? (-0.5) : 0.5;
    float _269 = fma(_255, _253, _247);
    float _271 = abs(_259);
    float _273 = fma(_261, _271, _269);
    bool _275 = !_225;
    float _277 = _219;
    float _279 = _215;
    float _295;
    if (!_275)
    {
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_87);
        float _301 = 1.0 / _299;
        float _303 = _119 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _305 + _311;
    bool _315 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _317 = isnan(_305);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _305 + _339;
    float _343 = 1.0 / _329;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _347 = 1.0 / _337;
    float _349 = 1.0 / _333;
    float _351 = _309 * _343;
    bool _353 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _355 = isnan(_305);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -_325;
    float _367 = _365 + 1.0;
    float _369 = _363 * _367;
    float _371 = _313 * _347;
    bool _373 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _375 = isnan(_305);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -_363;
    float _387 = _385 + 1.0;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _341 * _349;
    bool _395 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _397 = isnan(_305);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _407;
    float _411 = _383 * _387;
    float _413 = -_383;
    float _415 = _413 + 1.0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = fma(_409, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _427 = _405 * _415;
    float _429 = fma(_419, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _431 = fma(_391, _393, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = fma(_423, _393, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _435 = -_405;
    float _437 = _435 + 1.0;
    float _439 = _425 * _427;
    float _441 = _429 * _427;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _447;
    float _451 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].x, _439);
    float _453 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[143].y, _441);
    float _455 = fma(_445, _371, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_449, _371, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = fma(_431, _411, _451);
    float _461 = fma(_433, _411, _453);
    float _463 = fma(_455, _369, _459);
    float _465 = fma(_457, _369, _461);
    float _467 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[146].x, _463);
    float _469 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[146].y, _465);
    bool _471 = !_345;
    float _487;
    if (!_471)
    {
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _475 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        float _491 = float(_87);
        float _493 = 1.0 / _491;
        float _495 = _119 * _493;
        _487 = _495;
    }
    _489 = false;
    float _497 = _487;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _497 + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _505 = _497 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _509 = _497 + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _527 = 1.0 / _517;
    float _529 = 1.0 / _525;
    bool _531 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _533 = isnan(_497);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _545 = -_541;
    float _547 = _545 + 1.0;
    float _549 = 1.0 / _521;
    float _551 = 1.0 / _513;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _555 = _497 + _553;
    float _557 = _501 * _529;
    bool _559 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _561 = isnan(_497);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _571;
    float _575 = _555 * _527;
    bool _577 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _579 = isnan(_497);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = _505 * _549;
    bool _591 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _593 = isnan(_497);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_587;
    float _605 = _603 + 1.0;
    float _607 = fma(_573, _589, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _609 = _569 * _605;
    float _611 = _509 * _551;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _613;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _617;
    float _621 = -_569;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _629 = fma(_615, _589, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _631 = fma(_619, _589, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _633 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _635 = isnan(_497);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _601 * _547;
    float _647 = -_601;
    float _649 = _647 + 1.0;
    float _651 = _541 * _623;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = _643 * _649;
    float _663 = fma(_627, _557, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _665 = fma(_655, _557, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _667 = fma(_659, _557, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _669 = _607 * _661;
    float _671 = -_643;
    float _673 = _671 + 1.0;
    float _675 = _629 * _661;
    float _677 = _631 * _661;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _679;
    float _683 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].x, _669);
    float _685 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _691;
    float _695 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[107].z, _677);
    float _697 = fma(_681, _611, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _699 = fma(_665, _645, _683);
    float _701 = fma(_663, _645, _685);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _711 = fma(_689, _611, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _713 = fma(_693, _611, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _719 = fma(_667, _645, _695);
    float _721 = fma(_705, _575, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _723 = fma(_709, _575, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _725 = fma(_717, _575, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _727 = fma(_711, _651, _699);
    float _729 = fma(_697, _651, _701);
    float _731 = fma(_713, _651, _719);
    float _733 = fma(_721, _609, _727);
    float _735 = fma(_723, _609, _729);
    float _737 = fma(_725, _609, _731);
    float _739 = in.m_56.x;
    float _741 = in.m_56.y;
    float _743 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].x, _733);
    float _745 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].y, _735);
    float _747 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[111].z, _737);
    float _749 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _751 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _753 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _757;
    out.m_58.y = _759;
    out.m_58.z = _761;
    out.m_58.w = _755;
    float _763 = _469 * _741;
    float _765 = _467 * _739;
    bool _767 = !_543;
    float _783;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_87);
        float _789 = 1.0 / _787;
        float _791 = _119 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _797 = _793 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _801 = _793 + _799;
    bool _803 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _805 = isnan(_793);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _831 = 1.0 / _817;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _835 = _793 + _833;
    float _837 = 1.0 / _829;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _841 = _793 + _839;
    bool _843 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _845 = isnan(_793);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = 1.0 / _821;
    float _857 = _797 * _831;
    bool _859 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _861 = isnan(_793);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    bool _871 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _873 = isnan(_793);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _825;
    float _891 = _841 * _837;
    float _893 = -_813;
    float _895 = _893 + 1.0;
    float _897 = _881 * _895;
    float _899 = -_881;
    float _901 = _899 + 1.0;
    float _903 = _801 * _855;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = fma(_907, _857, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _915 = fma(_911, _903, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _917 = _835 * _889;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _919;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _923;
    float _927 = _853 * _887;
    float _929 = -_853;
    float _931 = _929 + 1.0;
    float _933 = fma(_921, _857, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _935 = fma(_925, _857, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _937 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _939 = isnan(_793);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _869 * _901;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _959 = _947 * _931;
    float _961 = fma(_953, _903, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _963 = fma(_957, _903, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _965 = -_947;
    float _967 = _965 + 1.0;
    float _969 = _913 * _959;
    float _971 = _933 * _959;
    float _973 = _935 * _959;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _979;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _983;
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].x, _969);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].y, _971);
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[123].z, _973);
    float _993 = fma(_977, _917, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _995 = fma(_981, _917, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _997 = fma(_985, _917, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _999 = fma(_961, _927, _987);
    float _1001 = fma(_915, _927, _989);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1011 = fma(_963, _927, _991);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1017 = fma(_993, _949, _999);
    float _1019 = fma(_1005, _891, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1021 = fma(_1009, _891, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1023 = fma(_995, _949, _1001);
    float _1025 = fma(_1015, _891, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1027 = fma(_997, _949, _1011);
    float _1029 = fma(_1019, _897, _1017);
    float _1031 = fma(_1021, _897, _1023);
    float _1033 = fma(_1025, _897, _1027);
    float _1035 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1029);
    float _1037 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1031);
    float _1039 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1033);
    bool _1041 = !_883;
    float _1059;
    float _1061;
    if (!_1041)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1045 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1047 = float(_87);
        float _1049 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1051 = _1049 * _1043;
        float _1053 = floor(_1051);
        float _1055 = -_1053;
        float _1057 = _1051 + _1055;
        _1059 = _1047;
        _1061 = _1057;
        _1063 = true;
    }
    else
    {
        float _1065 = float(_87);
        float _1067 = 1.0 / _1065;
        float _1069 = _119 * _1067;
        _1059 = _1065;
        _1061 = _1069;
    }
    _1063 = false;
    float _1071 = _1059;
    float _1073 = _1061;
    float _1075 = in.m_49.z;
    float _1077 = _143 * 2.0;
    float _1079 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1081 = in.m_49.y;
    float _1083 = floor(_1077);
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1087 = _1085 != 0;
    float _1089 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1091 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1097 = -_1093;
    float _1099 = fma(_1079, 2.0, _1097);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1105 = _1083 > 0.0;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1109 = _1075 * 2.0;
    bool _1111 = _1083 >= 0.0;
    bool _1113 = isnan(_1083);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan(0.0);
    bool _1119 = _1115 || _1117;
    float _1121 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1123 = int(_1121);
    float _1125 = _1081 + _1075;
    float _1127 = _1081 * 2.0;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1131 = _1129 != 0;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1139 = _1137 != 0;
    float _1141 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1143 = _1125 + (-1.0);
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1147 = floor(_1109);
    float _1149 = fma(_1141, -2.0, _1095);
    bool _1151 = !_1135;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1145);
    bool _1157 = !_1131;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1081 + (-0.5);
    float _1163 = _1119 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1165 = floor(_1127);
    float _1167 = float(_1123);
    int _1169 = ~as_type<int>(_1163);
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    int _1175 = _1173;
    float _1177 = _1163;
    float _1179 = _1143;
    if (!_1105)
    {
        int _1181 = ~as_type<int>(_1163);
        int _1183 = _1181 + 1;
        _1175 = _1183;
    }
    int _1185 = _1175;
    float _1187 = _1167 * _119;
    if (!_1087)
    {
        _1177 = _1075;
    }
    float _1189 = _1177;
    float _1191 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1193 = int(_1191);
    float _1195 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1197 = !_1139;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1203 = _1201 != 0;
    int _1205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1207 = _1205 != 0;
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1211 = _1209 != 0;
    bool _1213 = _1147 > 0.0;
    float _1215 = _1189;
    if (!_1087)
    {
        _1179 = _1081;
    }
    float _1217 = _1179;
    bool _1219 = !_1207;
    int _1221 = _1219 ? 0 : 1;
    bool _1223 = _1147 >= 0.0;
    bool _1225 = isnan(_1147);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan(0.0);
    bool _1231 = _1227 || _1229;
    float _1233 = _1217;
    if (_1087)
    {
        _1233 = _143;
    }
    float _1235 = _1233;
    if (_1087)
    {
        _1215 = _1081;
    }
    float _1237 = _1215;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1241 = _1165 > 0.0;
    bool _1243 = _1165 >= 0.0;
    bool _1245 = isnan(_1165);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1239);
    float _1255 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1101);
    float _1259 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1261 = log2(_1259);
    float _1263 = _1237;
    if (!_1087)
    {
        _1263 = _1075;
    }
    float _1265 = _1263;
    float _1267 = -_1103;
    float _1269 = fma(_1255, 2.0, _1267);
    float _1271 = _1265;
    if (_1087)
    {
        _1271 = _1081;
    }
    float _1273 = _1271;
    float _1275 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1253);
    float _1277 = float(_1193);
    int _1279 = _1231 ? 0 : 1;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1283 = abs(_1221);
    float _1285 = 1.0 / _1277;
    int _1287 = _1251 ? 0 : 1;
    float _1289 = fma(_1281, -2.0, _1107);
    int _1291 = ~_1279;
    int _1293 = _1291 + 1;
    int _1295 = _1293 + 1;
    float _1297 = float(_1185);
    float _1299 = _1261 * _119;
    float _1301 = float(_1283);
    int _1303 = _1295;
    if (!_1213)
    {
        int _1305 = ~_1279;
        int _1307 = _1305 + 1;
        _1303 = _1307;
    }
    int _1309 = _1303;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1313 = in.m_60.x;
    float _1315 = in.m_60.y;
    float _1317 = in.m_60.z;
    int _1319 = ~_1287;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = _1301 * _1297;
    int _1327 = _1323;
    if (!_1241)
    {
        int _1329 = ~_1287;
        int _1331 = _1329 + 1;
        _1327 = _1331;
    }
    int _1333 = _1327;
    float _1335 = exp2(_1299);
    float _1337 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1311);
    bool _1339 = !_1203;
    int _1341 = _1339 ? 0 : 1;
    float _1343 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1155);
    bool _1345 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1347 = isnan(1.0);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1353 = _1349 || _1351;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1357 = 1.0 + _1355;
    float _1359 = _1325 * (-2.0);
    int _1361 = abs(_1341);
    float _1363 = -_119;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1269);
    bool _1367 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1369 = isnan(0.0);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1375 = _1371 || _1373;
    float _1377 = -_119;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1099);
    float _1381 = 1.0 / _1357;
    float _1383 = float(_1361);
    float _1385 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1337);
    float _1387 = float(_1309);
    float _1389 = -_1335;
    float _1391 = _1389 + 1.0;
    float _1393 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1149);
    bool _1395 = !_1211;
    int _1397 = _1395 ? 0 : 1;
    float _1399 = _1285 * _119;
    float _1401 = fma(_1359, _1315, _1315);
    float _1403 = _1375 ? _1391 : 0.0;
    float _1405 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1257);
    float _1407 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1289);
    float _1409 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1401);
    float _1411 = _143 + _1081;
    float _1413 = _1383 * _1387;
    float _1415 = fma(_1195, _1359, _1195);
    if (_1353)
    {
        float _1417 = _1403 * _1381;
        _123 = _1417;
    }
    float _1419 = _123;
    int _1421 = abs(_1397);
    float _1423 = _1411 + (-1.0);
    float _1425 = _1413 * (-2.0);
    float _1427 = fma(_1415, _1419, _1409);
    float _1429 = float(_1421);
    float _1431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1433 = float(_1333);
    float _1435 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1437 = _143 + (-0.5);
    float _1439 = fma(_1425, _1313, _1313);
    float _1441 = _143 + _1075;
    float _1443 = _1429 * _1433;
    float _1445 = fma(_1435, _1425, _1435);
    float _1447 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1439);
    float _1449 = _1441 + (-1.0);
    float _1451 = _1443 * (-2.0);
    float _1453 = fma(_1445, _1419, _1447);
    float _1455 = _1427 * 0.15915493667125701904296875;
    float _1457 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1459 = fma(_1451, _1317, _1317);
    float _1461 = _1075 + (-0.5);
    float _1463 = _1453 * 0.15915493667125701904296875;
    float _1465 = fma(_1457, _1451, _1457);
    float _1467 = _1455 * 6.283185482025146484375;
    float _1469 = sin(_1467);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1459);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _267);
    float _1475 = _1089 * _1431;
    float _1477 = fma(_1465, _1419, _1471);
    float _1479 = _1091 * _1473;
    float _1481 = _1455 * 6.283185482025146484375;
    float _1483 = cos(_1481);
    float _1485 = _1477 * 0.15915493667125701904296875;
    float _1487 = in.m_42.x;
    float _1489 = in.m_42.y;
    float _1491 = in.m_42.z;
    float _1493 = _1463 * 6.283185482025146484375;
    float _1495 = sin(_1493);
    float _1497 = _1463 * 6.283185482025146484375;
    float _1499 = cos(_1497);
    float _1501 = _1485 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1495 * _1469;
    float _1507 = _1495 * _1483;
    float _1509 = _1485 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = _1499 * _1469;
    float _1515 = _1469 * _1503;
    float _1517 = _1503 * _1475;
    float _1519 = _1499 * _1483;
    float _1521 = _1483 * _1503;
    float _1523 = _1499 * _1517;
    float _1525 = _1495 * _1517;
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = fma(_1511, _1519, _1505);
    float _1531 = -_1475;
    float _1533 = _1511 * _1531;
    float _1535 = -_1513;
    float _1537 = fma(_1511, _1507, _1535);
    float _1539 = -_1507;
    float _1541 = fma(_1511, _1513, _1539);
    float _1543 = fma(_1529, _1479, _1523);
    float _1545 = fma(_1521, _1479, _1533);
    float _1547 = fma(_1511, _1505, _1519);
    float _1549 = fma(_1537, _1479, _1525);
    float _1551 = fma(_1541, _1527, _1543);
    float _1553 = fma(_1515, _1527, _1545);
    float _1555 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1557 = fma(_1547, _1527, _1549);
    float _1559 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1561 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1563 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1555);
    float _1565 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1567 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1559);
    float _1569 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1561);
    float _1571 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1563);
    float _1573 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1565);
    float _1575 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1567);
    float _1577 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1569);
    float _1579 = _1571 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1581 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1573);
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1587 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1589 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1591 = _1579 + _1583;
    float _1593 = _1551 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1595 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1587);
    float _1597 = _1585 + _1589;
    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1601 = _1591 + _1599;
    float _1603 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1593);
    float _1605 = fma(_1491, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1595);
    float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1609 = _1597 + _1607;
    float _1611 = _1601 * _1601;
    float _1613 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1603);
    float _1615 = _1605 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1617 = fma(_1609, _1609, _1611);
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1621 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1623 = sqrt(_1617);
    float _1625 = _1615 + _1619;
    float _1627 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1621);
    float _1629 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1627);
    bool _1631 = _1623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1633 = _1621;
    float _1635 = _1613;
    float _1637 = _1597;
    if (!_1631)
    {
        _1633 = _1597;
    }
    float _1639 = _1633;
    float _1641 = _1639;
    if (!_1631)
    {
        _1635 = _1591;
    }
    float _1643 = _1635;
    float _1645 = _1643;
    if (!_1631)
    {
        _1637 = _1625;
    }
    float _1647 = _1637;
    bool _1649 = !_1631;
    float _1651 = _1647;
    if (!_1649)
    {
        float _1653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1657 = _1623 + _1655;
        float _1659 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1661 = rsqrt(_1617);
        float _1663 = _1657 * _1653;
        float _1665 = _1663 * 0.15915493667125701904296875;
        float _1667 = _1665 * 6.283185482025146484375;
        float _1669 = cos(_1667);
        float _1671 = _1665 * 6.283185482025146484375;
        float _1673 = sin(_1671);
        float _1675 = _1669 + (-1.0);
        float _1677 = fma(_1673, _1659, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1679 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = _1661 * _1677;
        float _1683 = fma(_1625, _1669, _1679);
        float _1685 = fma(_1609, _1681, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1687 = fma(_1601, _1681, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1651 = _1683;
        _1641 = _1685;
        _1645 = _1687;
    }
    float _1689 = _1651;
    float _1691 = _1641;
    float _1693 = _1645;
    float _1695 = -_1615;
    float _1697 = _1695 + _1689;
    float _1699 = -_1585;
    float _1701 = _1699 + _1691;
    float _1703 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1705 = -_1579;
    float _1707 = _1705 + _1693;
    float _1709 = _1697 * _1697;
    float _1711 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1713 = 1.0 / _1703;
    float _1715 = fma(_1701, _1701, _1709);
    float _1717 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1711);
    bool _1719 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1721 = isnan(0.5);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    float _1729 = fma(_1707, _1707, _1715);
    float _1731 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1717);
    float _1733 = sqrt(_1729);
    float _1735 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1737 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1739 = isnan(0.5);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1745 = _1741 || _1743;
    float _1747 = _1735 + _1703;
    float _1749 = _1747 * _1713;
    float _1751 = _1749 * 0.5;
    bool _1753 = _1733 > 0.0;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1757 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1755);
    float _1759 = 1.0 / _1757;
    bool _1761 = !_1753;
    float _1763 = _1689;
    float _1765 = _1693;
    float _1767 = _1691;
    float _1769 = _1697;
    float _1771 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1773 = _1701;
    float _1775 = _1711;
    float _1777 = _1751;
    float _1779 = _1707;
    if (!_1761)
    {
        float _1781 = _219 * _219;
        float _1783 = fma(_215, _215, _1781);
        float _1785 = fma(_263, _263, _1783);
        float _1787 = rsqrt(_1729);
        float _1789 = sqrt(_1785);
        float _1791 = _1701 * _1787;
        float _1793 = _1707 * _1787;
        bool _1795 = _1789 > 0.0;
        float _1797 = _1697 * _1787;
        bool _1799 = !_1795;
        _1771 = _1787;
        _1775 = _1797;
        _1777 = _1785;
        if (!_1799)
        {
            float _1801 = rsqrt(_1785);
            float _1803 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1805 = _219 * _1801;
            float _1807 = _215 * _1801;
            float _1809 = _263 * _1801;
            float _1811 = _1797 * _1805;
            float _1813 = fma(_1791, _1807, _1811);
            float _1815 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1817 = fma(_1793, _1809, _1813);
            float _1819 = _1817 * _1815;
            float _1821 = fma(_215, _1819, _1691);
            float _1823 = fma(_219, _1819, _1689);
            float _1825 = fma(_263, _1819, _1693);
            _1763 = _1823;
            _1765 = _1825;
            _1767 = _1821;
            _1769 = _1819;
            _1771 = _1809;
            _1773 = _1803;
            _1775 = _1815;
            _1779 = _1805;
        }
    }
    float _1827 = _1763;
    float _1829 = _1765;
    float _1831 = _1767;
    float _1833 = _1769;
    float _1835 = _1771;
    float _1837 = _1773;
    float _1839 = _1775;
    float _1841 = _1777;
    float _1843 = _1779;
    float _1845 = _1843;
    float _1847 = _1831;
    float _1849 = _1835;
    float _1851 = _1839;
    float _1853 = _1827;
    float _1855 = _1833;
    float _1857 = _1837;
    float _1859 = _1841;
    if (_1745)
    {
        _1845 = 1.0;
    }
    float _1861 = _1845;
    float _1863 = _1861;
    if (_1727)
    {
        _277 = _1827;
    }
    float _1865 = _277;
    float _1867 = _1865;
    if (_1727)
    {
        _279 = _1829;
    }
    float _1869 = _279;
    float _1871 = _1869;
    if (!_1727)
    {
        float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1875 = _1615 + _1873;
        float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1879 = _1585 + _1877;
        float _1881 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1883 = -_1585;
        float _1885 = _1883 + _1831;
        float _1887 = _1875 * _1875;
        float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1891 = _1579 + _1889;
        float _1893 = fma(_1879, _1879, _1887);
        float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1897 = fma(_1891, _1891, _1893);
        float _1899 = sqrt(_1897);
        float _1901 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1903 = precise::min(_1899, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1905 = _1903 * _1895;
        float _1907 = -_1615;
        float _1909 = _1907 + _1827;
        float _1911 = _1901 * _1905;
        float _1913 = -_1579;
        float _1915 = _1913 + _1829;
        float _1917 = fma(_1885, _1911, _1585);
        float _1919 = fma(_1909, _1911, _1615);
        float _1921 = fma(_1915, _1911, _1579);
        _1867 = _1919;
        _1847 = _1917;
        _1871 = _1921;
        _1849 = _1899;
        _1851 = _1911;
    }
    float _1923 = _1867;
    float _1925 = _1847;
    float _1927 = _1871;
    float _1929 = _1849;
    float _1931 = _1851;
    float _1933 = _1931;
    if (_1745)
    {
        _1853 = 1.0;
    }
    float _1935 = _1853;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = _1759 * _1937;
    float _1941 = _1935;
    if (!_1745)
    {
        float _1943 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1945 = _1943 * 0.15915493667125701904296875;
        float _1947 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1949 = _1945 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        float _1953 = _1947 * 0.15915493667125701904296875;
        float _1955 = _1945 * 6.283185482025146484375;
        float _1957 = sin(_1955);
        float _1959 = 1.0 / _1951;
        float _1961 = _1953 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1957 * _1959;
        float _1967 = _1953 * 6.283185482025146484375;
        float _1969 = sin(_1967);
        float _1971 = _1963 * _1965;
        float _1973 = 1.0 / _1971;
        float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1975;
        float _1979 = 1.0 / _1977;
        float _1981 = _1969 * _1973;
        float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1985 = fma(_1939, _1981, _1983);
        float _1987 = _1985 * _1979;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1855 = _1973;
        _1857 = _1953;
        _1863 = _1989;
    }
    float _1991 = _1855;
    float _1993 = _1857;
    float _1995 = _1863;
    float _1997 = _1993;
    float _1999 = _1991;
    if (!_1745)
    {
        float _2001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2003 = _2001 * 0.15915493667125701904296875;
        float _2005 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2007 = _2003 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2005 * 0.15915493667125701904296875;
        float _2013 = _2003 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = 1.0 / _2009;
        float _2019 = _2011 * 6.283185482025146484375;
        float _2021 = cos(_2019);
        float _2023 = _2015 * _2017;
        float _2025 = _2011 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = _2021 * _2023;
        float _2031 = 1.0 / _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2035 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2033;
        float _2037 = 1.0 / _2035;
        float _2039 = _2027 * _2031;
        float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2043 = fma(_1939, _2039, _2041);
        float _2045 = _2043 * _2037;
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        float _2049 = -_2047;
        float _2051 = _2049 + 1.0;
        _1997 = _2029;
        _1999 = _2017;
        _1941 = _2051;
    }
    float _2053 = _1997;
    float _2055 = _1999;
    float _2057 = _1941;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2061 = _1923 + _2059;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2065 = _1925 + _2063;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2069 = _1927 + _2067;
    float _2071 = _2061 * _2061;
    float _2073 = fma(_2065, _2065, _2071);
    float _2075 = fma(_2069, _2069, _2073);
    float _2077 = rsqrt(_2075);
    float _2079 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2081 = _2065 * _2079;
    float _2083 = _2069 * _2079;
    float _2085 = _2081 * _2081;
    float _2087 = _2083 * _2083;
    float _2089 = _2085 + _2087;
    float _2091 = sqrt(_2089);
    bool _2093 = _2091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2097 = _2091 + _2095;
    float _2099 = _1929;
    float _2101 = _2097;
    float _2103 = _2061;
    float _2105 = _2081;
    float _2107 = _2083;
    float _2109 = _2085;
    float _2111 = _2087;
    if (_2093)
    {
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2099 = _2113;
    }
    float _2115 = _2099;
    float _2117 = _2115;
    if (_2093)
    {
        float _2119 = _2097 * _2115;
        _2101 = _2119;
    }
    float _2121 = _2101;
    if (_2093)
    {
        float _2123 = rsqrt(_2089);
        _2117 = _2123;
    }
    float _2125 = _2117;
    float _2127 = _2125;
    if (_2093)
    {
        float _2129 = _2121 * 0.15915493667125701904296875;
        _1933 = _2129;
    }
    float _2131 = _1933;
    float _2133 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2135 = _2053;
    if (_2093)
    {
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = sin(_2137);
        _2135 = _2139;
    }
    float _2141 = _2135;
    float _2143 = precise::max(0.0, _2133);
    float _2145 = _2055;
    float _2147 = _2143;
    if (_2093)
    {
        float _2149 = _2131 * 6.283185482025146484375;
        float _2151 = cos(_2149);
        _2145 = _2151;
    }
    float _2153 = _2145;
    float _2155 = -_2079;
    float _2157 = -_2143;
    float _2159 = fma(_2061, _2155, _2157);
    if (_2093)
    {
        float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2103 = _2161;
    }
    float _2163 = _2103;
    float _2165 = _2163;
    if (_2093)
    {
        float _2167 = fma(_2141, _2163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1859 = _2167;
    }
    float _2169 = _1859;
    float _2171 = _2169;
    if (!_2093)
    {
        _2165 = _2159;
    }
    float _2173 = _2165;
    float _2175 = sqrt(_2075);
    float _2177 = _2173;
    if (_2093)
    {
        float _2179 = _2125 * _2169;
        _2171 = _2179;
    }
    float _2181 = _2171;
    if (_2093)
    {
        float _2183 = _2153 + (-1.0);
        _2147 = _2183;
    }
    float _2185 = _2147;
    if (_2093)
    {
        float _2187 = _2081 * _2181;
        _2105 = _2187;
    }
    float _2189 = _2105;
    if (_2093)
    {
        float _2191 = _2083 * _2181;
        _2107 = _2191;
    }
    float _2193 = _2107;
    if (_2093)
    {
        float _2195 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2195;
    }
    float _2197 = _2127;
    if (_2093)
    {
        float _2199 = _2189 * _2189;
        _2109 = _2199;
    }
    float _2201 = _2109;
    if (_2093)
    {
        float _2203 = _2193 * _2193;
        _2111 = _2203;
    }
    float _2205 = _2111;
    float _2207 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2093)
    {
        float _2209 = fma(_2159, _2153, _2197);
        _2177 = _2209;
    }
    float _2211 = _2177;
    float _2213 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2215 = fma(_2211, _2211, _2201);
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2219 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2217);
    float _2221 = precise::clamp(_2219, 0.0, 1.0);
    float _2223 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2225 = _2215 + _2205;
    float _2227 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2207);
    float _2229 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2231 = -_2221;
    float _2233 = _2231 + 1.0;
    float _2235 = _1923 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2237 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2227);
    float _2239 = rsqrt(_2225);
    float _2241 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2229);
    float _2243 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2213);
    float _2245 = _2237 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2247 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2235);
    float _2249 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2241);
    float _2251 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2243);
    float _2253 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2255 = abs(_2233);
    float _2257 = log2(_2255);
    float _2259 = _2249 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2261 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2263 = -_2253;
    float _2265 = fma(_2263, _2223, 1.0);
    float _2267 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2247);
    float _2269 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2271 = _2239 * _2189;
    float _2273 = _2239 * _2211;
    float _2275 = _2239 * _2193;
    float _2277 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2269);
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2281 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2283 = log2(_2265);
    float _2285 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2277);
    float _2287 = -_2279;
    float _2289 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2287);
    float _2291 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2293 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2295 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2285);
    float _2297 = -_2275;
    float _2299 = fma(_2297, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2289);
    float _2301 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2303 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2293);
    float _2305 = exp2(_2291);
    float _2307 = fma(_2299, -0.5, 0.5);
    float _2309 = fma(_2299, 0.5, 0.5);
    float _2311 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2301);
    float _2313 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2303);
    float _2315 = _2273 + 1.0;
    float _2317 = fma(_2309, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2319 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2311);
    float _2321 = 1.0 / _2295;
    float _2323 = _2283 * 0.693147182464599609375;
    float _2325 = fma(_2309, _2317, -0.212114393711090087890625);
    float _2327 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2319);
    float _2329 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2313);
    float _2331 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2333 = fma(_2309, _2325, 1.570728778839111328125);
    float _2335 = sqrt(_2307);
    float _2337 = -_2273;
    float _2339 = fma(_2305, _2315, _2337);
    float _2341 = fma(_2339, 0.5, 0.5);
    float _2343 = _2327 * _2321;
    float _2345 = _2329 * _2321;
    float _2347 = fma(_2343, 0.5, 0.5);
    float _2349 = fma(_2345, -0.5, 0.5);
    float _2351 = _2335 * 0.636619746685028076171875;
    float _2353 = -_2333;
    float _2355 = fma(_2351, _2353, 1.0);
    float3 _6934 = float3(_2347, _2349, _2331);
    float _2357 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).x;
    float3 _6945 = float3(_2347, _2349, _2331);
    float4 _2360 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6945, float3(0.0), isnan(_6945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6945, float3(0.0), isnan(_6945)), level(0.0)).xyzw;
    float _2362 = _2360.x;
    float _2364 = _2360.y;
    float _2366 = _2360.z;
    float _2368 = _2360.w;
    float2 _6962 = float2(_2355, _2341);
    float3 _2372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6962, float2(0.0), isnan(_6962)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6962, float2(0.0), isnan(_6962)), level(0.0)).xyz;
    float _2374 = _2372.x;
    float _2376 = _2372.y;
    float _2378 = _2372.z;
    float _2380 = float(uint(_1123));
    float _2382 = trunc(_1399);
    int _2384 = int(_2382);
    int _2386 = ~_1123;
    int _2388 = _2386 + 1;
    float _2390 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2392 = _143 > 0.5;
    float _2394 = -_1275;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1075 > 0.5;
    float _2400 = 1.0 / _2380;
    float _2402 = float(uint(_2384));
    float _2404 = exp2(_2390);
    int _2406 = as_type<int>(_2400) + (-2);
    float _2408 = as_type<float>(_2406) * _2402;
    float _2410 = -_2404;
    float _2412 = _2410 + 1.0;
    float _2414 = trunc(_2408);
    float _2416 = precise::max(_2414, 0.0);
    uint _2419 = uint(_2416);
    int _2421 = _2388 * int(_2419);
    int _2423 = _2421 + _2384;
    float _2425 = float(uint(_2423));
    float _2427 = as_type<float>(_2406) * _2425;
    bool _2429 = !_1087;
    float _2431 = _2429 ? 7.345489978790283203125 : 1.0;
    float _2433 = trunc(_2427);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _2431 * _143;
    float _2441 = float(_2384);
    float _2443 = floor(_2439);
    bool _2445 = _2441 >= _1167;
    bool _2447 = isnan(_2441);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan(_1167);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    int _2457 = int(_2419) + int(_2437);
    float _2459 = trunc(_2455);
    int _2461 = int(_2459);
    int _2463 = _2388 * _2457;
    int _2465 = _2463 + _2384;
    float _2467 = -_2443;
    float _2469 = _2439 + _2467;
    float _2471 = 1.0 / _1071;
    bool _2473 = uint(_2465) >= uint(_1123);
    float _2475 = _2469 * _1167;
    bool _2477 = !_2473;
    int _2479 = _2477 ? 0 : (-1);
    bool _2481 = _1123 == 0;
    float _2483 = trunc(_2475);
    int _2485 = int(_2483);
    int _2487 = ~_2457;
    int _2489 = _2487 + _2479;
    int _2491 = _2489 + 1;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2495 = _2493 != 0;
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2499 = _2497 != 0;
    int _2501 = _1123 * _2491;
    int _2503 = _2501 + _2384;
    float _2505 = _1187 * _2471;
    int _2507 = ~_2461;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _1123 + (-1);
    bool _2515 = !_2481;
    int _2517 = _2515 ? _2503 : (-1);
    float _2519 = trunc(_2505);
    int _2521 = int(_2519);
    bool _2523 = !_2495;
    int _2525 = _2523 ? 0 : 1;
    int _2527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2529 = _2527 != 0;
    int _2531 = _2517 * _2511;
    int _2533 = abs(_1153);
    int _2535 = abs(_2525);
    int _2537 = _2461 * _2513;
    int _2539 = _2537 + _2531;
    int _2541 = abs(_1159);
    int _2543 = _2485 * _2535;
    int _2545 = _2543 + _2384;
    bool _2547 = !_2529;
    int _2549 = _2547 ? 0 : 1;
    int _2551 = abs(_1199);
    int _2553 = _2539 * _2533;
    int _2555 = abs(_2549);
    int _2557 = _2521 * _2541;
    int _2559 = _2557 + _2553;
    int _2561 = ~_1123;
    int _2563 = _2561 + 1;
    int _2565 = ~_1123;
    int _2567 = _2565 + 1;
    int _2569 = _2545 * _2551;
    int _2571 = _2569 + _2559;
    int _2573 = ~_1123;
    int _2575 = _2573 + 1;
    int _2577 = _2485 * _2555;
    int _2579 = _2577 + _2571;
    float _2581 = float(uint(_2579));
    float _2583 = as_type<float>(_2406) * _2581;
    float _2585 = trunc(_2583);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    int _2591 = _2575 * int(_2589);
    int _2593 = _2591 + _2579;
    float _2595 = float(uint(_2593));
    float _2597 = as_type<float>(_2406) * _2595;
    float _2599 = trunc(_2597);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    int _2605 = int(_2589) + int(_2603);
    float _2607 = float(uint(_2545));
    int _2609 = _2563 * _2605;
    int _2611 = _2609 + _2579;
    float _2613 = as_type<float>(_2406) * _2607;
    bool _2615 = uint(_2611) >= uint(_1123);
    float _2617 = trunc(_2613);
    float _2619 = precise::max(_2617, 0.0);
    uint _2621 = uint(_2619);
    bool _2623 = !_2615;
    int _2625 = _2623 ? 0 : (-1);
    int _2627 = ~_2605;
    int _2629 = _2627 + _2625;
    int _2631 = _2629 + 1;
    int _2633 = _1123 * _2631;
    int _2635 = _2633 + _2579;
    int _2637 = ~_1123;
    int _2639 = _2637 + 1;
    bool _2641 = !_2481;
    int _2643 = _2641 ? _2635 : (-1);
    int _2645 = _2639 * int(_2621);
    int _2647 = _2645 + _2545;
    int _2649 = _2643 >> 31;
    float _2651 = float(uint(_2647));
    int _2653 = _2649 & 3;
    int _2655 = _2643 & 3;
    bool _2657 = _2655 != 0;
    float _2659 = as_type<float>(_2406) * _2651;
    int _2661 = _2643 + _2653;
    int _2663 = _2643 & 3;
    bool _2665 = _2663 != 0;
    float _2667 = trunc(_2659);
    float _2669 = precise::max(_2667, 0.0);
    uint _2671 = uint(_2669);
    int _2673 = _2661 >> 2;
    bool _2675 = uint(_2663) > 1u;
    int _2677 = _2673 << 4;
    int _2679 = _2677 + 368;
    int _2681 = _2657 ? 0 : 1;
    uint _2683 = uint(int(uint(_2679) >> uint(2)));
    uint _2685 = uint(int(uint(int(_2683)) >> uint(2)));
    int _2687 = int(_2683) & 3;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[int(_2685)][_2687];
    int _2691 = int(_2683) + 1;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    int _2695 = _2691 & 3;
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[int(_2693)][_2695];
    int _2699 = ~_2681;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    int _2705 = int(_2621) + int(_2671);
    int _2707 = _2679 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = _2703;
    if (!_2675)
    {
        int _2727 = ~_2681;
        int _2729 = _2727 + 1;
        _2725 = _2729;
    }
    int _2731 = _2725;
    int _2733 = _2567 * _2705;
    int _2735 = _2733 + _2545;
    bool _2737 = !_2665;
    int _2739 = _2737 ? 0 : 1;
    float _2741 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2743 = int(_2741);
    int _2745 = abs(_2731);
    bool _2747 = _2663 != 3;
    bool _2749 = uint(_2735) >= uint(_1123);
    int _2751 = abs(_2739);
    bool _2753 = uint(_2663) >= 2u;
    bool _2755 = !_2749;
    int _2757 = _2755 ? 0 : (-1);
    int _2759 = ~_2745;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = _2753 ? 0 : 1;
    int _2767 = ~_2705;
    int _2769 = _2767 + _2757;
    int _2771 = _2769 + 1;
    int _2773 = ~_2751;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = ~_2765;
    int _2781 = _2779 + 1;
    int _2783 = _2781 + 1;
    int _2785 = _1123 * _2771;
    int _2787 = _2785 + _2545;
    bool _2789 = _2663 != 3;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2793 = _1073 + _2791;
    int _2795 = _2783;
    if (_2747)
    {
        int _2797 = ~_2765;
        int _2799 = _2797 + 1;
        _2795 = _2799;
    }
    int _2801 = _2795;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2805 = _2803 != 0;
    int _2807 = abs(_2801);
    float _2809 = float(uint(_2743));
    int _2811 = _2763 * as_type<int>(_2697);
    bool _2813 = !_2481;
    int _2815 = _2813 ? _2787 : (-1);
    int _2817 = _2777 * as_type<int>(_2689);
    int _2819 = _2817 + _2811;
    bool _2821 = !_2789;
    int _2823 = _2821 ? 0 : (-1);
    float _2825 = 1.0 / _2809;
    bool _2827 = !_2805;
    int _2829 = _2827 ? 0 : 1;
    float _2831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2833 = _2831 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2835 = abs(_2823);
    int _2837 = abs(_2829);
    int _2839 = ~_2807;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    int _2845 = abs(_2743);
    int _2847 = ~_2835;
    int _2849 = _2847 + 1;
    int _2851 = _2849 + 1;
    int _2853 = _2843 * as_type<int>(_2715);
    int _2855 = _2853 + _2819;
    float _2857 = 1.0 / _2833;
    int _2859 = ~_2837;
    int _2861 = _2859 + 1;
    int _2863 = _2861 + 1;
    int _2865 = _2851 * as_type<int>(_2723);
    int _2867 = _2865 + _2855;
    float _2869 = float(uint(_2845));
    int _2871 = _2867 * _2863;
    int _2873 = as_type<int>(_2825) + (-2);
    float _2875 = 1.0 / _2869;
    int _2877 = _2815 * _2837;
    int _2879 = _2877 + _2871;
    float _2881 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2883 = _2881 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2885 = in.m_49.w;
    float _2887 = float(uint(_2879));
    int _2889 = abs(_2879);
    float _2891 = 1.0 / _2883;
    int _2893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2895 = _2893 != 0;
    float _2897 = as_type<float>(_2873) * _2887;
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2901 = _2899 != 0;
    int _2903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2905 = _2903 != 0;
    float _2907 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2909 = _2907 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2911 = as_type<int>(_2875) + (-2);
    float _2913 = trunc(_2897);
    float _2915 = precise::max(_2913, 0.0);
    uint _2917 = uint(_2915);
    float _2919 = float(uint(_2889));
    bool _2921 = _1081 > 0.5;
    int _2923 = ~_2743;
    int _2925 = _2923 + 1;
    float _2927 = as_type<float>(_2911) * _2919;
    float _2929 = 1.0 / _2909;
    float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2931;
    float _2935 = -_267;
    int _2937 = _2392 ? as_type<int>(_2935) : as_type<int>(_267);
    bool _2939 = _2885 > 0.5;
    float _2941 = trunc(_2927);
    float _2943 = precise::max(_2941, 0.0);
    uint _2945 = uint(_2943);
    int _2947 = _2925 * int(_2917);
    int _2949 = _2947 + _2879;
    float _2951 = _2933 * _2857;
    float _2953 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2953;
    float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2959 = _2957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2961 = ~_2845;
    int _2963 = _2961 + 1;
    float _2965 = fma(_2951, _2793, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2967 = float(uint(_2949));
    float _2969 = _2959 * _2891;
    bool _2971 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2973 = isnan(_1073);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2979 = _2975 || _2977;
    float _2981 = float(_2979);
    float _2983 = _2955 * _2929;
    bool _2985 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2987 = isnan(_1073);
    bool _2989 = _2985 || _2987;
    bool _2991 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2993 = _2989 || _2991;
    float _2995 = float(_2993);
    float _2997 = as_type<float>(_2873) * _2967;
    bool _2999 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3001 = isnan(_1073);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3007 = _3003 || _3005;
    float _3009 = float(_3007);
    float _3011 = -_2981;
    float _3013 = _3011 + 1.0;
    float _3015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3017 = _2963 * int(_2945);
    int _3019 = _3017 + _2889;
    float _3021 = -_2995;
    float _3023 = _3021 + 1.0;
    float _3025 = _3009 * _3013;
    float _3027 = -_3009;
    float _3029 = _3027 + 1.0;
    bool _3031 = !_2499;
    float _3033 = _3031 ? _267 : as_type<float>(_2937);
    float _3035 = float(uint(_3019));
    float _3037 = trunc(_2997);
    float _3039 = precise::max(_3037, 0.0);
    uint _3041 = uint(_3039);
    bool _3043 = _1073 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3045 = isnan(_1073);
    bool _3047 = _3043 || _3045;
    bool _3049 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3051 = _3047 || _3049;
    float _3053 = float(_3051);
    float _3055 = _2995 * _3029;
    float _3057 = as_type<float>(_2911) * _3035;
    float _3059 = -_267;
    int _3061 = _2398 ? as_type<int>(_3059) : as_type<int>(_267);
    float _3063 = _3053 * _3023;
    float _3065 = -_3053;
    float _3067 = _3065 + 1.0;
    float _3069 = trunc(_3057);
    float _3071 = precise::max(_3069, 0.0);
    uint _3073 = uint(_3071);
    bool _3075 = !_2901;
    float _3077 = _3075 ? _267 : as_type<float>(_3061);
    float _3079 = _2965 * _3063;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3083 = _1073 + _3081;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3087 = _1073 + _3085;
    float _3089 = -_183;
    int _3091 = _2921 ? as_type<int>(_3089) : as_type<int>(_183);
    float _3093 = fma(_3067, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3079);
    float _3095 = -_183;
    int _3097 = _2939 ? as_type<int>(_3095) : as_type<int>(_183);
    float _3099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3101 = ~_2845;
    int _3103 = _3101 + 1;
    float _3105 = fma(_2969, _3083, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3107 = !_2895;
    float _3109 = _3107 ? _183 : as_type<float>(_3091);
    float _3111 = fma(_2983, _3087, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _3113 = !_2905;
    float _3115 = _3113 ? _183 : as_type<float>(_3097);
    float _3117 = fma(_3105, _3055, _3093);
    int _3119 = int(_2917) + int(_3041);
    float _3121 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3123 = ~_2743;
    int _3125 = _3123 + 1;
    float _3127 = fma(_3111, _3025, _3117);
    int _3129 = int(_2945) + int(_3073);
    float _3131 = _3077 + 0.5;
    float _3133 = _3099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3135 = _3103 * _3129;
    int _3137 = _3135 + _2889;
    float _3139 = _3115 + (-0.5);
    float _3141 = fma(_3121, _3131, _1365);
    int _3143 = _3125 * _3119;
    int _3145 = _3143 + _2879;
    float _3147 = -_3133;
    float _3149 = -_1407;
    float _3151 = fma(_3147, _3139, _3149);
    float _3153 = fma(_2981, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3127);
    float _3155 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3157 = uint(_3137) >= uint(_2845);
    float _3159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3161 = _2879 ^ _2743;
    float _3163 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3165 = uint(_3145) >= uint(_2743);
    float _3167 = _3153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3169 = !_3157;
    int _3171 = _3169 ? 0 : (-1);
    uint _3173 = uint(int(uint(_3161) >> uint(31)));
    float _3175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3177 = !_3165;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = ~_3171;
    int _3183 = _3129 + _3181;
    int _3185 = _3183 + 1;
    int _3187 = ~int(_3173);
    int _3189 = _3187 + 1;
    int _3191 = ~_3119;
    int _3193 = _3191 + _3179;
    int _3195 = _3193 + 1;
    float _3197 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3199 = _3185 ^ _3189;
    float _3201 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3203 = _2743 == 0;
    int _3205 = _2743 * _3195;
    int _3207 = _3205 + _2879;
    int _3209 = ~_3189;
    int _3211 = _3209 + _3199;
    int _3213 = _3211 + 1;
    float _3215 = _1995 * _2057;
    bool _3217 = _2743 == 0;
    float _3219 = _3197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3221 = _3201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3223 = !_3203;
    int _3225 = _3223 ? _3213 : (-1);
    float _3227 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3229 = _3215 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3231 = !_3217;
    int _3233 = _3231 ? _3207 : (-1);
    out.m_62.x = _3163;
    out.m_62.y = _3219;
    out.m_62.z = _3221;
    out.m_62.w = _3167;
    float _3235 = float(_3225);
    float _3237 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3227);
    float _3239 = float(_3233);
    float _3241 = _3175 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3243 = _1995 > 0.0;
    bool _3245 = isnan(_1995);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan(0.0);
    bool _3251 = _3247 || _3249;
    float _3253 = fma(_2245, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3237);
    float _3255 = _273 * _3229;
    float _3257 = fma(_3241, _3239, _1379);
    bool _3259 = _2057 <= 0.0;
    bool _3261 = !_3251;
    bool _3263 = _3259 || _3261;
    float _3265 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3253);
    float _3267 = _3255 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3269 = _3159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3271 = _3109 + (-0.5);
    float _3273 = _3033 + 0.5;
    float _3275 = -_1405;
    float _3277 = _3275 + 1.0;
    float _3279 = -_1393;
    float _3281 = fma(_3269, _3235, _3279);
    out.gl_Position.x = _2327;
    out.gl_Position.y = _2329;
    out.gl_Position.z = _3265;
    out.gl_Position.w = _2295;
    float _3283 = fma(_3241, _3273, _3257);
    float _3285 = -_1385;
    float _3287 = _3285 + 1.0;
    float _3289 = -_3269;
    float _3291 = fma(_3289, _3271, _3281);
    float _3293 = -_1343;
    float _3295 = _3293 + 1.0;
    float _3297 = _2412 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3299 = _3265 + _2295;
    float _3301 = -_3287;
    float _3303 = fma(_3033, _3301, _3283);
    float _3305 = _3297 * _2357;
    float _3307 = _3299 * 0.5;
    float _3309 = -_3297;
    float _3311 = _3309 + 1.0;
    float _3313 = -_2396;
    float _3315 = fma(_3077, _3313, _3141);
    float _3317 = _2368 * _3305;
    float _3319 = _2378 * _3305;
    out.m_64.z = _3307;
    out.m_64.w = _2295;
    float _3321 = fma(_3115, _3277, _3151);
    float _3323 = fma(_3109, _3295, _3291);
    float _3325 = fma(_2374, _3317, _2362);
    float _3327 = fma(_2376, _3317, _2364);
    out.m_45.x = _3267;
    float _3329 = _2368 * _3311;
    float _3331 = fma(_2368, _3319, _2366);
    out.m_66.x = _3303;
    out.m_66.y = _3323;
    out.m_66.z = _3315;
    out.m_66.w = _3321;
    out.m_68.x = _3325;
    out.m_68.y = _3327;
    out.m_68.z = _3331;
    out.m_68.w = _3329;
    if (!_3263)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3333;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

