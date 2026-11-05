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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2364 = false;
    bool _669 = false;
    bool _527 = false;
    bool _405 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2663 = as_type<float>(_123);
        out.gl_Position.z = _2663;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2733 = as_type<float>(_161);
        out.gl_Position.z = _2733;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _185;
    float _209;
    if (!_189)
    {
        float _193 = in.m_55.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_107);
        float _215 = 1.0 / _213;
        float _217 = _141 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _219 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = 1.0 / _235;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _261 = 1.0 / _243;
    bool _263 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_219);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _239;
    float _277 = _223 * _257;
    bool _279 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_219);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _227 * _261;
    float _293 = -_273;
    float _295 = _293 + 1.0;
    float _297 = _289 * _295;
    float _299 = -_289;
    float _301 = _299 + 1.0;
    float _303 = _231 * _275;
    float _305 = -_255;
    float _307 = _305 + 1.0;
    bool _309 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_219);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _273 * _307;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = fma(_323, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = _319 * _301;
    float _343 = fma(_333, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = fma(_327, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_337, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = -_319;
    float _351 = _349 + 1.0;
    float _353 = _339 * _341;
    float _355 = _343 * _341;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _357;
    float _361 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _353);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _371 = fma(_345, _297, _361);
    float _373 = fma(_365, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_347, _297, _367);
    float _377 = fma(_369, _329, _371);
    float _379 = fma(_373, _329, _375);
    float _381 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _377);
    float _383 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _379);
    bool _385 = !_259;
    float _403;
    if (!_385)
    {
        float _387 = in.m_55.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_107);
        float _409 = 1.0 / _407;
        float _411 = _141 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_57.x;
    float _417 = in.m_57.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _425;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _431;
    float _435 = _383 * _417;
    float _437 = _421 * _429;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = _381 * _415;
    float _453 = fma(_433, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _455 = -_449;
    float _457 = _455 + 1.0;
    bool _459 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _461 = isnan(_413);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _475;
    float _479 = _469 * _457;
    float _481 = fma(_473, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _483 = fma(_477, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _485 = -_469;
    float _487 = _485 + 1.0;
    float _489 = _453 * _479;
    float _491 = _481 * _479;
    float _493 = _483 * _479;
    float _495 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].z, _493);
    float _501 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    float _503 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].x, _497);
    float _505 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].z, _499);
    bool _507 = !_427;
    float _525;
    if (!_507)
    {
        float _509 = in.m_55.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_107);
        float _531 = 1.0 / _529;
        float _533 = _141 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _541 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = isnan(_535);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _557 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_535);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _539;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    float _575 = -_551;
    float _577 = _575 + 1.0;
    bool _579 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_535);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _593 = 1.0 / _555;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _599 = _573 * _569;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _535 + _601;
    float _605 = -_589;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _611 = _535 + _609;
    float _613 = fma(_599, _603, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _615 = _567 * _577;
    float _617 = -_567;
    float _619 = _617 + 1.0;
    float _621 = _597 * _593;
    float _623 = _551 * _607;
    float _625 = _613 * _615;
    float _627 = _505 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _629 = fma(_621, _611, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_629, _623, _633);
    float _639 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _641 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[117].x, _637);
    float _645 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _645;
    out.m_59.y = _635;
    out.m_59.z = _641;
    out.m_59.w = _647;
    bool _649 = !_591;
    float _667;
    if (!_649)
    {
        float _651 = in.m_55.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_107);
        float _673 = 1.0 / _671;
        float _675 = _141 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = in.m_55.z;
    float _681 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _683 = log2(_681);
    float _685 = in.m_55.y;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _693 = as_type<float>(int(gl_VertexIndex));
    float _695 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = _631;
    float _699 = _627;
    if (_689)
    {
        float _701 = in.m_55.x;
        float _703 = in.m_55.y;
        _697 = _701;
        _699 = _703;
    }
    float _705 = _697;
    float _707 = _699;
    float _709 = _683 * _141;
    float _711 = exp2(_709);
    float _713 = _679 * 2.0;
    float _715 = _685 * 2.0;
    float _717 = floor(_713);
    int _719 = as_type<int>(_693) & 1;
    bool _721 = _719 != 0;
    int _723 = as_type<int>(_693) & 2;
    bool _725 = _723 != 0;
    bool _727 = _685 > 0.5;
    bool _729 = !_721;
    float _731 = _729 ? (-0.5) : 0.5;
    float _733 = floor(_715);
    bool _735 = !_725;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = -_711;
    float _741 = _739 + 1.0;
    float _743 = _693;
    float _745 = _707;
    if (_689)
    {
        _743 = _705;
    }
    float _747 = _743;
    float _749 = _705;
    float _751 = _747;
    if (!_689)
    {
        float _753 = in.m_55.x;
        _749 = _753;
    }
    float _755 = _749;
    if (!_689)
    {
        _751 = _679;
    }
    float _757 = _751;
    bool _759 = _717 > 0.0;
    bool _761 = _717 >= 0.0;
    bool _763 = isnan(_717);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    float _771 = _757 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _773 = -_731;
    int _775 = _727 ? as_type<int>(_773) : as_type<int>(_731);
    int _777 = _769 ? 0 : 1;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _785 = _783 != 0;
    int _787 = ~_777;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    bool _793 = _733 > 0.0;
    int _795 = _791;
    if (!_759)
    {
        int _797 = ~_777;
        int _799 = _797 + 1;
        _795 = _799;
    }
    int _801 = _795;
    bool _803 = _679 > 0.5;
    bool _805 = _733 >= 0.0;
    bool _807 = isnan(_733);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    float _815 = -_737;
    int _817 = _803 ? as_type<int>(_815) : as_type<int>(_737);
    float _819 = _755;
    if (!_689)
    {
        _745 = _755;
    }
    float _821 = _745;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _825 = !_785;
    float _827 = _825 ? _737 : as_type<float>(_817);
    float _829 = _755 * 2.0;
    bool _831 = !_781;
    float _833 = _831 ? _731 : as_type<float>(_775);
    float _835 = -_823;
    float _837 = fma(_771, 2.0, _835);
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _841 = _839 != 0;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _845 = _843 != 0;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _849 = _847 != 0;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _853 = floor(_829);
    float _855 = _821 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _857 = _685 + _755;
    int _859 = _813 ? 0 : 1;
    float _861 = -_141;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[86].x, _837);
    float _865 = fma(_855, -2.0, _851);
    float _867 = _857 + (-1.0);
    int _869 = ~_859;
    int _871 = _869 + 1;
    int _873 = _871 + 1;
    float _875 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _865);
    int _877 = _873;
    if (!_793)
    {
        int _879 = ~_859;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _887 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _895 ? _741 : 0.0;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _901 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(1.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _913 = 1.0 + _911;
    bool _915 = _853 >= 0.0;
    bool _917 = isnan(_853);
    bool _919 = _915 || _917;
    bool _921 = isnan(0.0);
    bool _923 = _919 || _921;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _927 = !_841;
    int _929 = _927 ? 0 : 1;
    float _931 = 1.0 / _913;
    int _933 = _923 ? 0 : 1;
    float _935 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[88].z, _899);
    bool _937 = _853 > 0.0;
    float _939 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[88].w, _925);
    int _941 = abs(_929);
    float _943 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _935);
    float _945 = in.m_64.x;
    float _947 = in.m_64.y;
    float _949 = in.m_64.z;
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _939);
    float _953 = float(_801);
    float _955 = float(_941);
    bool _957 = !_845;
    int _959 = _957 ? 0 : 1;
    int _961 = ~_933;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    int _967 = _965;
    if (_909)
    {
        float _969 = _897 * _931;
        _143 = _969;
    }
    float _971 = _143;
    bool _973 = !_849;
    int _975 = _973 ? 0 : 1;
    float _977 = _955 * _953;
    int _979 = abs(_959);
    float _981 = _755 + (-0.5);
    int _983 = abs(_975);
    float _985 = _977 * (-2.0);
    float _987 = _679 + _755;
    float _989 = fma(_885, _985, _885);
    float _991 = float(_883);
    float _993 = _987 + (-1.0);
    float _995 = float(_979);
    float _997 = fma(_985, _945, _945);
    float _999 = float(_983);
    if (!_937)
    {
        int _1001 = ~_933;
        int _1003 = _1001 + 1;
        _967 = _1003;
    }
    int _1005 = _967;
    float _1007 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].x, _997);
    float _1009 = _999 * _991;
    float _1011 = float(_1005);
    float _1013 = fma(_989, _971, _1007);
    float _1015 = _685 + _679;
    float _1017 = _1009 * (-2.0);
    float _1019 = _679 + (-0.5);
    float _1021 = _995 * _1011;
    float _1023 = _1013 * 0.15915493667125701904296875;
    float _1025 = _1015 + (-1.0);
    float _1027 = fma(_1017, _949, _949);
    float _1029 = _1021 * (-2.0);
    float _1031 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1033 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1035 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1027);
    float _1037 = fma(_1029, _947, _947);
    float _1039 = _685 + (-0.5);
    float _1041 = fma(_1031, _1017, _1031);
    float _1043 = fma(_1033, _1029, _1033);
    float _1045 = _1023 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1037);
    float _1051 = fma(_1041, _971, _1035);
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _731);
    bool _1055 = _685 > 0.5;
    float _1057 = fma(_1043, _971, _1049);
    float _1059 = _1051 * 0.15915493667125701904296875;
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _737);
    float _1063 = _1023 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1057 * 0.15915493667125701904296875;
    float _1069 = _695 * _1053;
    float _1071 = in.m_46.x;
    float _1073 = in.m_46.y;
    float _1075 = in.m_46.z;
    float _1077 = _691 * _1061;
    bool _1079 = _755 > 0.5;
    float _1081 = -_731;
    int _1083 = _803 ? as_type<int>(_1081) : as_type<int>(_731);
    float _1085 = _1059 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1067 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = _1067 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1065 * _1087;
    float _1099 = _1047 * _1087;
    float _1101 = _1097 * _1077;
    float _1103 = _1059 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    float _1107 = _1065 * _1091;
    float _1109 = _1047 * _1091;
    float _1111 = _1091 * _1087;
    float _1113 = _1065 * _1095;
    float _1115 = _1047 * _1095;
    float _1117 = _1095 * _1087;
    float _1119 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1121 = _1099 * _1077;
    float _1123 = fma(_1105, _1113, _1109);
    float _1125 = -_1107;
    float _1127 = fma(_1105, _1115, _1125);
    float _1129 = -_1115;
    float _1131 = fma(_1105, _1107, _1129);
    float _1133 = -_1077;
    float _1135 = _1105 * _1133;
    float _1137 = fma(_1123, _1069, _1101);
    float _1139 = fma(_1105, _1109, _1113);
    float _1141 = fma(_1127, _1069, _1121);
    float _1143 = fma(_1117, _1069, _1135);
    float _1145 = fma(_1131, _1119, _1137);
    float _1147 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1149 = fma(_1139, _1119, _1141);
    float _1151 = fma(_1111, _1119, _1143);
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1155 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1157 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1147);
    float _1159 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1153);
    float _1163 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1155);
    float _1165 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1157);
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1159);
    float _1169 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1171 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1163);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1175 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1167);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1181 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1185 = _1173 + _1177;
    float _1187 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1189 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1181);
    float _1191 = _1179 + _1183;
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1195 = _1185 + _1193;
    float _1197 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1187);
    float _1199 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1189);
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1203 = _1191 + _1201;
    float _1205 = _1195 * _1195;
    float _1207 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1197);
    float _1209 = _1199 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1211 = -_737;
    int _1213 = _1055 ? as_type<int>(_1211) : as_type<int>(_737);
    float _1215 = fma(_1203, _1203, _1205);
    float _1217 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1219 = -_731;
    int _1221 = _1079 ? as_type<int>(_1219) : as_type<int>(_731);
    float _1223 = sqrt(_1215);
    float _1225 = _1209 + _1217;
    bool _1227 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1235 = _1233 != 0;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1239 = _1237 != 0;
    bool _1241 = !_1235;
    float _1243 = _1241 ? _737 : as_type<float>(_1213);
    bool _1245 = !_1239;
    float _1247 = _1245 ? _731 : as_type<float>(_1083);
    bool _1249 = !_1231;
    float _1251 = _1249 ? _731 : as_type<float>(_1221);
    float _1253 = _1187;
    float _1255 = _1191;
    float _1257 = _1185;
    float _1259 = _1223;
    if (!_1227)
    {
        _1253 = _1225;
    }
    float _1261 = _1253;
    bool _1263 = !_1227;
    float _1265 = _1261;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1223 + _1269;
        float _1273 = rsqrt(_1215);
        float _1275 = _1271 * _1267;
        float _1277 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1279 = _1275 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        float _1289 = _1283 + (-1.0);
        float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = fma(_1287, _1277, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1295 = fma(_1225, _1283, _1291);
        float _1297 = _1273 * _1293;
        float _1299 = fma(_1203, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1301 = fma(_1195, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1265 = _1295;
        _1255 = _1299;
        _1257 = _1301;
        _819 = _1279;
    }
    float _1303 = _1265;
    float _1305 = _1255;
    float _1307 = _1257;
    float _1309 = _819;
    float _1311 = -_1209;
    float _1313 = _1311 + _1303;
    float _1315 = -_1179;
    float _1317 = _1315 + _1305;
    float _1319 = -_1173;
    float _1321 = _1319 + _1307;
    float _1323 = _1313 * _1313;
    float _1325 = fma(_1317, _1317, _1323);
    float _1327 = fma(_1321, _1321, _1325);
    float _1329 = sqrt(_1327);
    bool _1331 = _1329 > 0.0;
    bool _1333 = !_1331;
    float _1335 = _1303;
    float _1337 = _1305;
    float _1339 = _1307;
    float _1341 = _1309;
    if (!_1333)
    {
        float _1343 = _185 * _185;
        float _1345 = fma(_183, _183, _1343);
        float _1347 = fma(_187, _187, _1345);
        float _1349 = rsqrt(_1327);
        float _1351 = sqrt(_1347);
        float _1353 = _1317 * _1349;
        float _1355 = _1313 * _1349;
        float _1357 = _1321 * _1349;
        bool _1359 = _1351 > 0.0;
        bool _1361 = !_1359;
        _1341 = _1351;
        _1259 = _1357;
        if (!_1361)
        {
            float _1363 = rsqrt(_1347);
            float _1365 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1367 = _185 * _1363;
            float _1369 = _183 * _1363;
            float _1371 = _187 * _1363;
            float _1373 = _1355 * _1367;
            float _1375 = fma(_1353, _1369, _1373);
            float _1377 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1379 = fma(_1357, _1371, _1375);
            float _1381 = _1379 * _1377;
            float _1383 = fma(_183, _1381, _1305);
            float _1385 = fma(_185, _1381, _1303);
            float _1387 = fma(_187, _1381, _1307);
            _1335 = _1385;
            _1337 = _1383;
            _1339 = _1387;
            _1341 = _1367;
        }
    }
    float _1389 = _1335;
    float _1391 = _1337;
    float _1393 = _1339;
    float _1395 = _1341;
    float _1397 = _1259;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _1389 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1405 = _1391 + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1409 = _1393 + _1407;
    float _1411 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1413 = _1401 * _1401;
    float _1415 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1417 = fma(_1405, _1405, _1413);
    float _1419 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1421 = fma(_1409, _1409, _1417);
    float _1423 = rsqrt(_1421);
    float _1425 = sqrt(_1421);
    float _1427 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1429 = _1405 * _1427;
    float _1431 = _1409 * _1427;
    float _1433 = _1429 * _1429;
    float _1435 = _1431 * _1431;
    float _1437 = _1433 + _1435;
    float _1439 = sqrt(_1437);
    bool _1441 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1445 = _1439 + _1443;
    float _1447 = _1423;
    float _1449 = _1437;
    float _1451 = _1445;
    float _1453 = _1401;
    float _1455 = _1395;
    float _1457 = _1397;
    if (_1441)
    {
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1447 = _1459;
    }
    float _1461 = _1447;
    if (_1441)
    {
        float _1463 = rsqrt(_1437);
        _1449 = _1463;
    }
    float _1465 = _1449;
    float _1467 = _1465;
    if (_1441)
    {
        float _1469 = _1445 * _1461;
        _1451 = _1469;
    }
    float _1471 = _1451;
    if (_1441)
    {
        float _1473 = _1471 * 0.15915493667125701904296875;
        _191 = _1473;
    }
    float _1475 = _191;
    float _1477 = _1409;
    if (_1441)
    {
        float _1479 = _1475 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        _1477 = _1481;
    }
    float _1483 = _1477;
    float _1485 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1487 = precise::max(0.0, _1485);
    float _1489 = _1461;
    if (_1441)
    {
        float _1491 = _1475 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = -_1427;
    float _1499 = -_1487;
    float _1501 = fma(_1401, _1497, _1499);
    float _1503 = _1501;
    if (_1441)
    {
        float _1505 = _1501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1505;
    }
    float _1507 = _1453;
    float _1509 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1511 = _1483;
    float _1513 = _1507;
    if (_1441)
    {
        float _1515 = fma(_1483, _1507, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = _1517;
    if (!_1441)
    {
        _1513 = _1433;
    }
    float _1521 = _1513;
    float _1523 = _1521;
    if (_1441)
    {
        float _1525 = _1495 + (-1.0);
        _1455 = _1525;
    }
    float _1527 = _1455;
    float _1529 = _1527;
    if (_1441)
    {
        float _1531 = _1465 * _1517;
        _1457 = _1531;
    }
    float _1533 = _1457;
    if (!_1441)
    {
        _1519 = _1429;
    }
    float _1535 = _1519;
    float _1537 = _1535;
    if (_1441)
    {
        float _1539 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1539;
    }
    float _1541 = _1529;
    float _1543 = _1541;
    if (_1441)
    {
        float _1545 = _1429 * _1533;
        _1537 = _1545;
    }
    float _1547 = _1537;
    if (!_1441)
    {
        _1467 = _1435;
    }
    float _1549 = _1467;
    float _1551 = _1549;
    if (_1441)
    {
        float _1553 = fma(_1501, _1495, _1541);
        _1503 = _1553;
    }
    float _1555 = _1503;
    if (!_1441)
    {
        _1543 = _1431;
    }
    float _1557 = _1543;
    float _1559 = _1557;
    if (_1441)
    {
        float _1561 = _1431 * _1533;
        _1559 = _1561;
    }
    float _1563 = _1559;
    if (_1441)
    {
        float _1565 = _1547 * _1547;
        _1523 = _1565;
    }
    float _1567 = _1523;
    float _1569 = floor(_1419);
    if (_1441)
    {
        float _1571 = _1563 * _1563;
        _1551 = _1571;
    }
    float _1573 = _1551;
    float _1575 = fma(_1555, _1555, _1567);
    float _1577 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1509);
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1581 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1579);
    float _1583 = precise::clamp(_1581, 0.0, 1.0);
    float _1585 = _1575 + _1573;
    float _1587 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1577);
    float _1589 = -_1583;
    float _1591 = _1589 + 1.0;
    float _1593 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1595 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1597 = rsqrt(_1585);
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1601 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1411);
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1415);
    float _1607 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1609 = -_1603;
    float _1611 = fma(_1609, _1599, 1.0);
    float _1613 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = abs(_1591);
    float _1617 = log2(_1615);
    float _1619 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1621 = _1597 * _1547;
    float _1623 = _1597 * _1555;
    float _1625 = _1597 * _1563;
    float _1627 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1629 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1631 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1633 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1605);
    float _1635 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1627);
    float _1637 = -_1629;
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1637);
    float _1641 = floor(_1593);
    float _1643 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1645 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = -_1625;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1639);
    float _1651 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1653 = -_1569;
    float _1655 = _1419 + _1653;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1631);
    float _1659 = fma(_1649, -0.5, 0.5);
    float _1661 = exp2(_1643);
    float _1663 = fma(_1649, 0.5, 0.5);
    float _1665 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1657);
    float _1667 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1669 = fma(_1663, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1671 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1665);
    float _1673 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1667);
    float _1675 = log2(_1611);
    float _1677 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = -_1641;
    float _1681 = _1593 + _1679;
    float _1683 = _1623 + 1.0;
    float _1685 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1673);
    float _1687 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1689 = fma(_1663, _1669, -0.212114393711090087890625);
    float _1691 = sqrt(_1659);
    float _1693 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1687);
    float _1695 = -_1623;
    float _1697 = fma(_1661, _1683, _1695);
    float _1699 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1685);
    float _1701 = 1.0 / _1671;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1705 = _1675 * 0.693147182464599609375;
    float2 _5183 = float2(_1655, _1681);
    float _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5183, float2(0.0), isnan(_5183)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5183, float2(0.0), isnan(_5183)), level(0.0)).x;
    float _1709 = fma(_1663, _1689, 1.570728778839111328125);
    float _1711 = fma(_1697, 0.5, 0.5);
    float _1713 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1715 = _1691 * 0.636619746685028076171875;
    float _1717 = -_1709;
    float _1719 = fma(_1715, _1717, 1.0);
    float _1721 = _1699 * _1701;
    float _1723 = _1703 * _1701;
    float _1725 = fma(_1721, 0.5, 0.5);
    float _1727 = fma(_1723, -0.5, 0.5);
    float3 _5222 = float3(_1725, _1727, _1713);
    float _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5222, float3(0.0), isnan(_5222)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5222, float3(0.0), isnan(_5222)), level(0.0)).x;
    float3 _5233 = float3(_1725, _1727, _1713);
    float4 _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5233, float3(0.0), isnan(_5233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5233, float3(0.0), isnan(_5233)), level(0.0)).xyzw;
    float _1734 = _1732.x;
    float _1736 = _1732.y;
    float _1738 = _1732.z;
    float _1740 = _1732.w;
    float2 _5249 = float2(_1719, _1711);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5249, float2(0.0), isnan(_5249)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5249, float2(0.0), isnan(_5249)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1754 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1758 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1752);
    float _1760 = -_951;
    float _1762 = _1760 + 1.0;
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1766 = _1764 != 0;
    float _1768 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1758);
    float _1770 = _1247 + 0.5;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1778 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1754);
    float _1782 = in.m_55.w;
    float _1784 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1780);
    float _1786 = -_1243;
    float _1788 = _1786 + 0.5;
    float _1790 = 1.0 / _1778;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1796 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1806 = _1251 + 0.5;
    float _1808 = _1796 + _1778;
    float _1810 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1812 = 1.0 / _1774;
    bool _1814 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1816 = isnan(_677);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1828 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1830 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1832 = 1.0 / _1794;
    float _1834 = _1808 * _1790;
    float _1836 = _1834 * 0.5;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1840 = _677 + _1838;
    float _1842 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1830);
    bool _1844 = _1782 > 0.5;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1846);
    bool _1850 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1852 = isnan(_677);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = _1800 * _1812;
    bool _1864 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1866 = isnan(_677);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = 1.0 / _1848;
    float _1878 = -_1860;
    float _1880 = _1878 + 1.0;
    float _1882 = fma(_1862, _1840, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1884 = -_737;
    int _1886 = _1844 ? as_type<int>(_1884) : as_type<int>(_737);
    float _1888 = -_1874;
    float _1890 = _1888 + 1.0;
    bool _1892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1894 = isnan(0.5);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1900 = _1896 || _1898;
    float _1902 = _1804 * _1832;
    bool _1904 = !_1766;
    float _1906 = _1904 ? _737 : as_type<float>(_1886);
    float _1908 = _1824 * _1890;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1912 = _677 + _1910;
    float _1914 = -_1824;
    float _1916 = _1914 + 1.0;
    float _1918 = _1874 * _1880;
    float _1920 = _1882 * _1908;
    float _1922 = fma(_1902, _1912, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1926 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1928 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1920);
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1932 = _1876 * _1930;
    float _1934 = _833 + 0.5;
    float _1936 = -_1906;
    float _1938 = _1936 + 0.5;
    float _1940 = fma(_1922, _1918, _1928);
    float _1942 = _827 + (-0.5);
    float _1944 = abs(_1932);
    float _1946 = log2(_1944);
    float _1948 = fma(_1926, _1934, _863);
    float _1950 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1940);
    float _1952 = -_943;
    float _1954 = _1952 + 1.0;
    float _1956 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1958 = -_1826;
    float _1960 = -_875;
    float _1962 = fma(_1958, _1942, _1960);
    float _1964 = -_1954;
    float _1966 = fma(_833, _1964, _1948);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1970 = _1956 * _1924;
    float _1972 = fma(_827, _1762, _1962);
    float _1974 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1978 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1980 = _1950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1982 = _1950;
    float _1984 = _1954;
    float _1986 = _1762;
    float _1988 = _1980;
    float _1990 = _1671;
    float _1992 = _1703;
    if (!_1900)
    {
        _1982 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1994 = _1982;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2000 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1900)
    {
        float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2004 = _1994 + _2002;
        _1984 = _2004;
    }
    float _2006 = _1984;
    float _2008 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2010 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = exp2(_1978);
    float _2016 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_1900)
    {
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2020 = _1932 + _2018;
        _1986 = _2020;
    }
    float _2022 = _1986;
    out.m_66.x = _1966;
    out.m_66.y = _1972;
    out.m_68.x = _2008;
    out.m_68.y = _2010;
    out.m_68.z = _2012;
    out.m_68.w = _1980;
    float _2024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_70.w = _1970;
    float _2026 = fma(_2016, _2016, 1.0);
    float _2028 = _1948;
    if (!_1900)
    {
        float _2030 = 1.0 / _2006;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2036 = precise::clamp(_2034, 0.0, 1.0);
    float _2038 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2040 = fma(_2036, -2.0, 3.0);
    float _2042 = _2036 * _2036;
    float _2044 = _1810 * _1996;
    float _2046 = _2000 * _2024;
    float _2048 = _1828 * _1968;
    if (_1900)
    {
        _1988 = 1.0;
    }
    float _2050 = _1988;
    float _2052 = _2042 * _2040;
    float _2054 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2056 = rsqrt(_2026);
    out.m_70.x = _2048;
    out.m_70.y = _2044;
    out.m_70.z = _2046;
    float _2058 = -_1105;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    float _2062 = _2050;
    if (!_1900)
    {
        float _2064 = _2022 * _2032;
        float _2066 = precise::clamp(_2064, 0.0, 1.0);
        _2062 = _2066;
    }
    float _2068 = _2062;
    float _2070 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2072 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2074 = isnan(_1425);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2080 = _2076 || _2078;
    float _2082 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2060);
    float _2084 = -_1105;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2070);
    float _2088 = -_1105;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2092 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2086);
    float _2094 = -_2052;
    float _2096 = _2094 + 1.0;
    float _2098 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2100 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2102 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2104 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2052);
    float _2106 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2108 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2098);
    float _2110 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2112 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2114 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2106);
    float _2116 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2100);
    float _2118 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2102);
    float _2120 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2122 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2114);
    float _2124 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2108);
    float _2126 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    float _2128 = _731 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2130 = _2016 * _2056;
    float _2132 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2134 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2120);
    float _2136 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    float _2138 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    float _2140 = -_2132;
    float _2142 = _2130 * _2140;
    float _2144 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    float _2146 = _2016 * _2092;
    float _2148 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1842);
    float _2150 = fma(_2056, _2092, _2142);
    float _2152 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = -_2136;
    float _2156 = _2130 * _2154;
    float _2158 = fma(_2128, _2122, _2146);
    float _2160 = -_2138;
    float _2162 = _2130 * _2160;
    bool _2164 = _1932 <= 8000.0;
    bool _2166 = isnan(_1932);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan(8000.0);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = fma(_2056, _2082, _2156);
    float _2178 = exp2(_2152);
    float _2180 = _2016 * _2082;
    float _2182 = _2016 * _2110;
    float _2184 = fma(_2056, _2110, _2162);
    float _2186 = _2174 * _2104;
    float _2188 = in.m_72.x;
    float _2190 = fma(_2128, _2124, _2180);
    float _2192 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2148);
    float _2194 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_74.x = _2122;
    out.m_74.y = _2124;
    out.m_74.z = _2144;
    float _2196 = _1699 + _1671;
    float _2198 = fma(_2128, _2144, _2182);
    float _2200 = _2192 + _1671;
    out.gl_Position.x = _1699;
    out.gl_Position.y = _1703;
    out.gl_Position.z = _2192;
    out.gl_Position.w = _1671;
    float _2202 = _2196 * 0.5;
    float _2204 = -_2178;
    float _2206 = _2204 + 1.0;
    float _2208 = _2200 * 0.5;
    out.m_76.x = _2150;
    out.m_76.y = _2176;
    out.m_76.z = _2184;
    float _2210 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2212 = _2136 + _2190;
    float _2214 = _1671 * 0.5;
    float _2216 = _2138 + _2198;
    float _2218 = fma(_1703, -0.5, _2214);
    float _2220 = _2132 + _2158;
    float _2222 = _2192;
    if (!_2080)
    {
        _1990 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _1990;
    float _2226 = _2224;
    float _2228 = _2224;
    if (!_2080)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2230 = _2222;
    out.m_78.x = _2202;
    out.m_78.y = _2218;
    out.m_78.z = _2208;
    out.m_78.w = _1671;
    float _2232 = _2230;
    float _2234 = _2230;
    if (!_2080)
    {
        _1992 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2236 = _1992;
    out.m_80.x = _2220;
    out.m_80.y = _2212;
    out.m_80.z = _2216;
    float _2238 = -_1707;
    float _2240 = _2238 + 1.0;
    float _2242 = _2240 * _2194;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = -_2244;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2250 = _2248 * _2188;
    float _2252 = _2250 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2252;
    float _2254 = _2210 * _1729;
    float _2256 = -_2210;
    float _2258 = _2256 + 1.0;
    float _2260 = _1740 * _2254;
    float _2262 = _1750 * _2254;
    float _2264 = _1740 * _2258;
    float _2266 = fma(_1746, _2260, _1734);
    float _2268 = fma(_1748, _2260, _1736);
    float _2270 = fma(_1740, _2262, _1738);
    float _2272 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2274 = _1736;
    float _2276 = _1734;
    float _2278 = _2260;
    float _2280 = _2236;
    float _2282 = _2236;
    if (!_2080)
    {
        _2274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2284 = _2274;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2080)
    {
        _2276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2290 = _2276;
    out.m_84.x = _2266;
    out.m_84.y = _2268;
    out.m_84.z = _2270;
    out.m_84.w = _2264;
    float _2292 = _2290;
    float _2294 = _2290;
    if (!_2080)
    {
        _2278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2296 = _2278;
    bool _2298 = !_2080;
    float _2300 = _2296;
    float _2302 = _2296;
    if (!_2298)
    {
        bool _2304 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2306 = isnan(_1425);
        bool _2308 = _2304 || _2306;
        bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2312 = _2308 || _2310;
        if (!_2312)
        {
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2316 = _1425 + _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2318;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2326 = 1.0 / _2320;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2344 = _2316 * _2326;
            float _2346 = precise::clamp(_2344, 0.0, 1.0);
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2352 = fma(_2346, _2324, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2354 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2356 = fma(_2346, _2330, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2358 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2294 = _2356;
            _2282 = _2360;
            _2288 = _2352;
            _2234 = _2358;
            _2228 = _2354;
            _2302 = _2362;
            _2364 = true;
        }
        else
        {
            bool _2366 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2368 = isnan(_1425);
            bool _2370 = _2366 || _2368;
            bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2374 = _2370 || _2372;
            if (!_2374)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2376 = _2286;
            _2288 = _2376;
            if (!_2374)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2378 = _2292;
            _2294 = _2378;
            if (!_2374)
            {
                _2226 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2380 = _2226;
            _2228 = _2380;
            if (!_2374)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2382 = _2232;
            _2234 = _2382;
            if (!_2374)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2384 = _2280;
            _2282 = _2384;
            if (!_2374)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2386 = _2300;
            bool _2388 = !_2374;
            _2302 = _2386;
            if (!_2388)
            {
                bool _2390 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2392 = isnan(_1425);
                bool _2394 = _2390 || _2392;
                bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2398 = _2394 || _2396;
                if (!_2398)
                {
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2402 = _1425 + _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2404;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2412 = 1.0 / _2406;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2430 = _2402 * _2412;
                    float _2432 = precise::clamp(_2430, 0.0, 1.0);
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2438 = fma(_2432, _2410, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2440 = fma(_2432, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2442 = fma(_2432, _2416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2444 = fma(_2432, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2446 = fma(_2432, _2424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2448 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2294 = _2442;
                    _2282 = _2446;
                    _2288 = _2438;
                    _2234 = _2444;
                    _2228 = _2440;
                    _2302 = _2448;
                    _2364 = true;
                }
                else
                {
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2228 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2364 = false;
    float _2450 = _2294;
    float _2452 = _2282;
    float _2454 = _2288;
    float _2456 = _2234;
    float _2458 = _2228;
    float _2460 = _2302;
    float _2462 = _2272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2464 = fma(_2212, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = -_2454;
    float _2474 = _2472 + _2456;
    out.m_86.x = 0.0;
    float _2476 = fma(_2466, _2470, _2450);
    float _2478 = -_2458;
    float _2480 = _2478 + _2460;
    float _2482 = fma(_2466, _2474, _2454);
    float _2484 = _2476 * 0.586610972881317138671875;
    bool _2486 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2488 = fma(_2466, _2480, _2458);
    out.m_49.x = _2462;
    float _2490 = fma(_2482, 0.298911988735198974609375, _2484);
    bool _2492 = _2068 > 0.0;
    bool _2494 = isnan(_2068);
    bool _2496 = _2492 || _2494;
    bool _2498 = isnan(0.0);
    bool _2500 = _2496 || _2498;
    float _2502 = fma(_2488, 0.114477999508380889892578125, _2490);
    float _2504 = -_2502;
    float _2506 = _2482 + _2504;
    float _2508 = -_2502;
    float _2510 = _2476 + _2508;
    float _2512 = -_2502;
    float _2514 = _2488 + _2512;
    float _2516 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    float _2518 = fma(_2510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    float _2520 = fma(_2514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    bool _2522 = !_2486;
    if (!_2522)
    {
        float _2524 = -_1389;
        float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2528 = -_1391;
        float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2532 = -_1393;
        float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2536 = _2526 * _2526;
        float _2538 = fma(_2530, _2530, _2536);
        float _2540 = fma(_2534, _2534, _2538);
        float _2542 = sqrt(_2540);
        float _2544 = rsqrt(_2540);
        float _2546 = -_2542;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2552 = precise::clamp(_2550, 0.0, 1.0);
        float _2554 = _2530 * _2544;
        float _2556 = _2526 * _2544;
        float _2558 = abs(_2552);
        float _2560 = log2(_2558);
        float _2562 = _2534 * _2544;
        float _2564 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2566 = _2212 * _2556;
        float _2568 = -_2556;
        float _2570 = -_2564;
        float _2572 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2570);
        float _2574 = fma(_2220, _2554, _2566);
        float _2576 = -_2562;
        float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2572);
        float _2580 = fma(_2216, _2562, _2574);
        float _2582 = precise::clamp(_2580, 0.0, 1.0);
        float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2586 = _2578 + _2584;
        float _2588 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2590 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2592 = precise::clamp(_2590, 0.0, 1.0);
        float _2594 = exp2(_2588);
        float _2596 = _2594 * _2592;
        float _2598 = _2582 * _2596;
        float _2600 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2602 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2604 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2600;
        out.m_86.y = _2602;
        out.m_86.z = _2604;
    }
    out.m_88.x = _2516;
    out.m_88.y = _2518;
    out.m_88.z = _2520;
    if (_2500)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2606;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2364 = false;
    bool _669 = false;
    bool _527 = false;
    bool _405 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2663 = as_type<float>(_123);
        out.gl_Position.z = _2663;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2733 = as_type<float>(_161);
        out.gl_Position.z = _2733;
    }
    if (_153)
    {
        return out;
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _185;
    float _209;
    if (!_189)
    {
        float _193 = in.m_55.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_107);
        float _215 = 1.0 / _213;
        float _217 = _141 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _219 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = 1.0 / _235;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _261 = 1.0 / _243;
    bool _263 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_219);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _239;
    float _277 = _223 * _257;
    bool _279 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_219);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _227 * _261;
    float _293 = -_273;
    float _295 = _293 + 1.0;
    float _297 = _289 * _295;
    float _299 = -_289;
    float _301 = _299 + 1.0;
    float _303 = _231 * _275;
    float _305 = -_255;
    float _307 = _305 + 1.0;
    bool _309 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_219);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _273 * _307;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = fma(_323, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = _319 * _301;
    float _343 = fma(_333, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = fma(_327, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_337, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = -_319;
    float _351 = _349 + 1.0;
    float _353 = _339 * _341;
    float _355 = _343 * _341;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _357;
    float _361 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _353);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _371 = fma(_345, _297, _361);
    float _373 = fma(_365, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_347, _297, _367);
    float _377 = fma(_369, _329, _371);
    float _379 = fma(_373, _329, _375);
    float _381 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _377);
    float _383 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _379);
    bool _385 = !_259;
    float _403;
    if (!_385)
    {
        float _387 = in.m_55.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_107);
        float _409 = 1.0 / _407;
        float _411 = _141 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_57.x;
    float _417 = in.m_57.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _425;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _431;
    float _435 = _383 * _417;
    float _437 = _421 * _429;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = _381 * _415;
    float _453 = fma(_433, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _455 = -_449;
    float _457 = _455 + 1.0;
    bool _459 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _461 = isnan(_413);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _475;
    float _479 = _469 * _457;
    float _481 = fma(_473, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _483 = fma(_477, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _485 = -_469;
    float _487 = _485 + 1.0;
    float _489 = _453 * _479;
    float _491 = _481 * _479;
    float _493 = _483 * _479;
    float _495 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].z, _493);
    float _501 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    float _503 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].x, _497);
    float _505 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].z, _499);
    bool _507 = !_427;
    float _525;
    if (!_507)
    {
        float _509 = in.m_55.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_107);
        float _531 = 1.0 / _529;
        float _533 = _141 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _541 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = isnan(_535);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _557 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_535);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _539;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    float _575 = -_551;
    float _577 = _575 + 1.0;
    bool _579 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_535);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _593 = 1.0 / _555;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _599 = _573 * _569;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _535 + _601;
    float _605 = -_589;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _611 = _535 + _609;
    float _613 = fma(_599, _603, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _615 = _567 * _577;
    float _617 = -_567;
    float _619 = _617 + 1.0;
    float _621 = _597 * _593;
    float _623 = _551 * _607;
    float _625 = _613 * _615;
    float _627 = _505 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _629 = fma(_621, _611, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_629, _623, _633);
    float _639 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _641 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[117].x, _637);
    float _645 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _645;
    out.m_59.y = _635;
    out.m_59.z = _641;
    out.m_59.w = _647;
    bool _649 = !_591;
    float _667;
    if (!_649)
    {
        float _651 = in.m_55.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_107);
        float _673 = 1.0 / _671;
        float _675 = _141 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = in.m_55.z;
    float _681 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _683 = log2(_681);
    float _685 = in.m_55.y;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _693 = as_type<float>(int(gl_VertexIndex));
    float _695 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = _631;
    float _699 = _627;
    if (_689)
    {
        float _701 = in.m_55.x;
        float _703 = in.m_55.y;
        _697 = _701;
        _699 = _703;
    }
    float _705 = _697;
    float _707 = _699;
    float _709 = _683 * _141;
    float _711 = exp2(_709);
    float _713 = _679 * 2.0;
    float _715 = _685 * 2.0;
    float _717 = floor(_713);
    int _719 = as_type<int>(_693) & 1;
    bool _721 = _719 != 0;
    int _723 = as_type<int>(_693) & 2;
    bool _725 = _723 != 0;
    bool _727 = _685 > 0.5;
    bool _729 = !_721;
    float _731 = _729 ? (-0.5) : 0.5;
    float _733 = floor(_715);
    bool _735 = !_725;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = -_711;
    float _741 = _739 + 1.0;
    float _743 = _693;
    float _745 = _707;
    if (_689)
    {
        _743 = _705;
    }
    float _747 = _743;
    float _749 = _705;
    float _751 = _747;
    if (!_689)
    {
        float _753 = in.m_55.x;
        _749 = _753;
    }
    float _755 = _749;
    if (!_689)
    {
        _751 = _679;
    }
    float _757 = _751;
    bool _759 = _717 > 0.0;
    bool _761 = _717 >= 0.0;
    bool _763 = isnan(_717);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    float _771 = _757 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _773 = -_731;
    int _775 = _727 ? as_type<int>(_773) : as_type<int>(_731);
    int _777 = _769 ? 0 : 1;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _785 = _783 != 0;
    int _787 = ~_777;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    bool _793 = _733 > 0.0;
    int _795 = _791;
    if (!_759)
    {
        int _797 = ~_777;
        int _799 = _797 + 1;
        _795 = _799;
    }
    int _801 = _795;
    bool _803 = _679 > 0.5;
    bool _805 = _733 >= 0.0;
    bool _807 = isnan(_733);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    float _815 = -_737;
    int _817 = _803 ? as_type<int>(_815) : as_type<int>(_737);
    float _819 = _755;
    if (!_689)
    {
        _745 = _755;
    }
    float _821 = _745;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _825 = !_785;
    float _827 = _825 ? _737 : as_type<float>(_817);
    float _829 = _755 * 2.0;
    bool _831 = !_781;
    float _833 = _831 ? _731 : as_type<float>(_775);
    float _835 = -_823;
    float _837 = fma(_771, 2.0, _835);
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _841 = _839 != 0;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _845 = _843 != 0;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _849 = _847 != 0;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _853 = floor(_829);
    float _855 = _821 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _857 = _685 + _755;
    int _859 = _813 ? 0 : 1;
    float _861 = -_141;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[86].x, _837);
    float _865 = fma(_855, -2.0, _851);
    float _867 = _857 + (-1.0);
    int _869 = ~_859;
    int _871 = _869 + 1;
    int _873 = _871 + 1;
    float _875 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _865);
    int _877 = _873;
    if (!_793)
    {
        int _879 = ~_859;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _887 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _895 ? _741 : 0.0;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _901 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(1.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _913 = 1.0 + _911;
    bool _915 = _853 >= 0.0;
    bool _917 = isnan(_853);
    bool _919 = _915 || _917;
    bool _921 = isnan(0.0);
    bool _923 = _919 || _921;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _927 = !_841;
    int _929 = _927 ? 0 : 1;
    float _931 = 1.0 / _913;
    int _933 = _923 ? 0 : 1;
    float _935 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[88].z, _899);
    bool _937 = _853 > 0.0;
    float _939 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[88].w, _925);
    int _941 = abs(_929);
    float _943 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _935);
    float _945 = in.m_64.x;
    float _947 = in.m_64.y;
    float _949 = in.m_64.z;
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _939);
    float _953 = float(_801);
    float _955 = float(_941);
    bool _957 = !_845;
    int _959 = _957 ? 0 : 1;
    int _961 = ~_933;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    int _967 = _965;
    if (_909)
    {
        float _969 = _897 * _931;
        _143 = _969;
    }
    float _971 = _143;
    bool _973 = !_849;
    int _975 = _973 ? 0 : 1;
    float _977 = _955 * _953;
    int _979 = abs(_959);
    float _981 = _755 + (-0.5);
    int _983 = abs(_975);
    float _985 = _977 * (-2.0);
    float _987 = _679 + _755;
    float _989 = fma(_885, _985, _885);
    float _991 = float(_883);
    float _993 = _987 + (-1.0);
    float _995 = float(_979);
    float _997 = fma(_985, _945, _945);
    float _999 = float(_983);
    if (!_937)
    {
        int _1001 = ~_933;
        int _1003 = _1001 + 1;
        _967 = _1003;
    }
    int _1005 = _967;
    float _1007 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].x, _997);
    float _1009 = _999 * _991;
    float _1011 = float(_1005);
    float _1013 = fma(_989, _971, _1007);
    float _1015 = _685 + _679;
    float _1017 = _1009 * (-2.0);
    float _1019 = _679 + (-0.5);
    float _1021 = _995 * _1011;
    float _1023 = _1013 * 0.15915493667125701904296875;
    float _1025 = _1015 + (-1.0);
    float _1027 = fma(_1017, _949, _949);
    float _1029 = _1021 * (-2.0);
    float _1031 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1033 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1035 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1027);
    float _1037 = fma(_1029, _947, _947);
    float _1039 = _685 + (-0.5);
    float _1041 = fma(_1031, _1017, _1031);
    float _1043 = fma(_1033, _1029, _1033);
    float _1045 = _1023 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1037);
    float _1051 = fma(_1041, _971, _1035);
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _731);
    bool _1055 = _685 > 0.5;
    float _1057 = fma(_1043, _971, _1049);
    float _1059 = _1051 * 0.15915493667125701904296875;
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _737);
    float _1063 = _1023 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1057 * 0.15915493667125701904296875;
    float _1069 = _695 * _1053;
    float _1071 = in.m_46.x;
    float _1073 = in.m_46.y;
    float _1075 = in.m_46.z;
    float _1077 = _691 * _1061;
    bool _1079 = _755 > 0.5;
    float _1081 = -_731;
    int _1083 = _803 ? as_type<int>(_1081) : as_type<int>(_731);
    float _1085 = _1059 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1067 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = _1067 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1065 * _1087;
    float _1099 = _1047 * _1087;
    float _1101 = _1097 * _1077;
    float _1103 = _1059 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    float _1107 = _1065 * _1091;
    float _1109 = _1047 * _1091;
    float _1111 = _1091 * _1087;
    float _1113 = _1065 * _1095;
    float _1115 = _1047 * _1095;
    float _1117 = _1095 * _1087;
    float _1119 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1121 = _1099 * _1077;
    float _1123 = fma(_1105, _1113, _1109);
    float _1125 = -_1107;
    float _1127 = fma(_1105, _1115, _1125);
    float _1129 = -_1115;
    float _1131 = fma(_1105, _1107, _1129);
    float _1133 = -_1077;
    float _1135 = _1105 * _1133;
    float _1137 = fma(_1123, _1069, _1101);
    float _1139 = fma(_1105, _1109, _1113);
    float _1141 = fma(_1127, _1069, _1121);
    float _1143 = fma(_1117, _1069, _1135);
    float _1145 = fma(_1131, _1119, _1137);
    float _1147 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1149 = fma(_1139, _1119, _1141);
    float _1151 = fma(_1111, _1119, _1143);
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1155 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1157 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1147);
    float _1159 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1153);
    float _1163 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1155);
    float _1165 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1157);
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1159);
    float _1169 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1171 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1163);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1175 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1167);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1181 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1185 = _1173 + _1177;
    float _1187 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1189 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1181);
    float _1191 = _1179 + _1183;
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1195 = _1185 + _1193;
    float _1197 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1187);
    float _1199 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1189);
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1203 = _1191 + _1201;
    float _1205 = _1195 * _1195;
    float _1207 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1197);
    float _1209 = _1199 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1211 = -_737;
    int _1213 = _1055 ? as_type<int>(_1211) : as_type<int>(_737);
    float _1215 = fma(_1203, _1203, _1205);
    float _1217 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1219 = -_731;
    int _1221 = _1079 ? as_type<int>(_1219) : as_type<int>(_731);
    float _1223 = sqrt(_1215);
    float _1225 = _1209 + _1217;
    bool _1227 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1235 = _1233 != 0;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1239 = _1237 != 0;
    bool _1241 = !_1235;
    float _1243 = _1241 ? _737 : as_type<float>(_1213);
    bool _1245 = !_1239;
    float _1247 = _1245 ? _731 : as_type<float>(_1083);
    bool _1249 = !_1231;
    float _1251 = _1249 ? _731 : as_type<float>(_1221);
    float _1253 = _1187;
    float _1255 = _1191;
    float _1257 = _1185;
    float _1259 = _1223;
    if (!_1227)
    {
        _1253 = _1225;
    }
    float _1261 = _1253;
    bool _1263 = !_1227;
    float _1265 = _1261;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1223 + _1269;
        float _1273 = rsqrt(_1215);
        float _1275 = _1271 * _1267;
        float _1277 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1279 = _1275 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        float _1289 = _1283 + (-1.0);
        float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = fma(_1287, _1277, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1295 = fma(_1225, _1283, _1291);
        float _1297 = _1273 * _1293;
        float _1299 = fma(_1203, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1301 = fma(_1195, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1265 = _1295;
        _1255 = _1299;
        _1257 = _1301;
        _819 = _1279;
    }
    float _1303 = _1265;
    float _1305 = _1255;
    float _1307 = _1257;
    float _1309 = _819;
    float _1311 = -_1209;
    float _1313 = _1311 + _1303;
    float _1315 = -_1179;
    float _1317 = _1315 + _1305;
    float _1319 = -_1173;
    float _1321 = _1319 + _1307;
    float _1323 = _1313 * _1313;
    float _1325 = fma(_1317, _1317, _1323);
    float _1327 = fma(_1321, _1321, _1325);
    float _1329 = sqrt(_1327);
    bool _1331 = _1329 > 0.0;
    bool _1333 = !_1331;
    float _1335 = _1303;
    float _1337 = _1305;
    float _1339 = _1307;
    float _1341 = _1309;
    if (!_1333)
    {
        float _1343 = _185 * _185;
        float _1345 = fma(_183, _183, _1343);
        float _1347 = fma(_187, _187, _1345);
        float _1349 = rsqrt(_1327);
        float _1351 = sqrt(_1347);
        float _1353 = _1317 * _1349;
        float _1355 = _1313 * _1349;
        float _1357 = _1321 * _1349;
        bool _1359 = _1351 > 0.0;
        bool _1361 = !_1359;
        _1341 = _1351;
        _1259 = _1357;
        if (!_1361)
        {
            float _1363 = rsqrt(_1347);
            float _1365 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1367 = _185 * _1363;
            float _1369 = _183 * _1363;
            float _1371 = _187 * _1363;
            float _1373 = _1355 * _1367;
            float _1375 = fma(_1353, _1369, _1373);
            float _1377 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1379 = fma(_1357, _1371, _1375);
            float _1381 = _1379 * _1377;
            float _1383 = fma(_183, _1381, _1305);
            float _1385 = fma(_185, _1381, _1303);
            float _1387 = fma(_187, _1381, _1307);
            _1335 = _1385;
            _1337 = _1383;
            _1339 = _1387;
            _1341 = _1367;
        }
    }
    float _1389 = _1335;
    float _1391 = _1337;
    float _1393 = _1339;
    float _1395 = _1341;
    float _1397 = _1259;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _1389 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1405 = _1391 + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1409 = _1393 + _1407;
    float _1411 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1413 = _1401 * _1401;
    float _1415 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1417 = fma(_1405, _1405, _1413);
    float _1419 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1421 = fma(_1409, _1409, _1417);
    float _1423 = rsqrt(_1421);
    float _1425 = sqrt(_1421);
    float _1427 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1429 = _1405 * _1427;
    float _1431 = _1409 * _1427;
    float _1433 = _1429 * _1429;
    float _1435 = _1431 * _1431;
    float _1437 = _1433 + _1435;
    float _1439 = sqrt(_1437);
    bool _1441 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1445 = _1439 + _1443;
    float _1447 = _1423;
    float _1449 = _1437;
    float _1451 = _1445;
    float _1453 = _1401;
    float _1455 = _1395;
    float _1457 = _1397;
    if (_1441)
    {
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1447 = _1459;
    }
    float _1461 = _1447;
    if (_1441)
    {
        float _1463 = rsqrt(_1437);
        _1449 = _1463;
    }
    float _1465 = _1449;
    float _1467 = _1465;
    if (_1441)
    {
        float _1469 = _1445 * _1461;
        _1451 = _1469;
    }
    float _1471 = _1451;
    if (_1441)
    {
        float _1473 = _1471 * 0.15915493667125701904296875;
        _191 = _1473;
    }
    float _1475 = _191;
    float _1477 = _1409;
    if (_1441)
    {
        float _1479 = _1475 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        _1477 = _1481;
    }
    float _1483 = _1477;
    float _1485 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1487 = precise::max(0.0, _1485);
    float _1489 = _1461;
    if (_1441)
    {
        float _1491 = _1475 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = -_1427;
    float _1499 = -_1487;
    float _1501 = fma(_1401, _1497, _1499);
    float _1503 = _1501;
    if (_1441)
    {
        float _1505 = _1501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1505;
    }
    float _1507 = _1453;
    float _1509 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1511 = _1483;
    float _1513 = _1507;
    if (_1441)
    {
        float _1515 = fma(_1483, _1507, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = _1517;
    if (!_1441)
    {
        _1513 = _1433;
    }
    float _1521 = _1513;
    float _1523 = _1521;
    if (_1441)
    {
        float _1525 = _1495 + (-1.0);
        _1455 = _1525;
    }
    float _1527 = _1455;
    float _1529 = _1527;
    if (_1441)
    {
        float _1531 = _1465 * _1517;
        _1457 = _1531;
    }
    float _1533 = _1457;
    if (!_1441)
    {
        _1519 = _1429;
    }
    float _1535 = _1519;
    float _1537 = _1535;
    if (_1441)
    {
        float _1539 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1539;
    }
    float _1541 = _1529;
    float _1543 = _1541;
    if (_1441)
    {
        float _1545 = _1429 * _1533;
        _1537 = _1545;
    }
    float _1547 = _1537;
    if (!_1441)
    {
        _1467 = _1435;
    }
    float _1549 = _1467;
    float _1551 = _1549;
    if (_1441)
    {
        float _1553 = fma(_1501, _1495, _1541);
        _1503 = _1553;
    }
    float _1555 = _1503;
    if (!_1441)
    {
        _1543 = _1431;
    }
    float _1557 = _1543;
    float _1559 = _1557;
    if (_1441)
    {
        float _1561 = _1431 * _1533;
        _1559 = _1561;
    }
    float _1563 = _1559;
    if (_1441)
    {
        float _1565 = _1547 * _1547;
        _1523 = _1565;
    }
    float _1567 = _1523;
    float _1569 = floor(_1419);
    if (_1441)
    {
        float _1571 = _1563 * _1563;
        _1551 = _1571;
    }
    float _1573 = _1551;
    float _1575 = fma(_1555, _1555, _1567);
    float _1577 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1509);
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1581 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1579);
    float _1583 = precise::clamp(_1581, 0.0, 1.0);
    float _1585 = _1575 + _1573;
    float _1587 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1577);
    float _1589 = -_1583;
    float _1591 = _1589 + 1.0;
    float _1593 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1595 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1597 = rsqrt(_1585);
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1601 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1411);
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1415);
    float _1607 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1609 = -_1603;
    float _1611 = fma(_1609, _1599, 1.0);
    float _1613 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = abs(_1591);
    float _1617 = log2(_1615);
    float _1619 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1621 = _1597 * _1547;
    float _1623 = _1597 * _1555;
    float _1625 = _1597 * _1563;
    float _1627 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1629 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1631 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1633 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1605);
    float _1635 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1627);
    float _1637 = -_1629;
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1637);
    float _1641 = floor(_1593);
    float _1643 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1645 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = -_1625;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1639);
    float _1651 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1653 = -_1569;
    float _1655 = _1419 + _1653;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1631);
    float _1659 = fma(_1649, -0.5, 0.5);
    float _1661 = exp2(_1643);
    float _1663 = fma(_1649, 0.5, 0.5);
    float _1665 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1657);
    float _1667 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1669 = fma(_1663, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1671 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1665);
    float _1673 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1667);
    float _1675 = log2(_1611);
    float _1677 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = -_1641;
    float _1681 = _1593 + _1679;
    float _1683 = _1623 + 1.0;
    float _1685 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1673);
    float _1687 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1689 = fma(_1663, _1669, -0.212114393711090087890625);
    float _1691 = sqrt(_1659);
    float _1693 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1687);
    float _1695 = -_1623;
    float _1697 = fma(_1661, _1683, _1695);
    float _1699 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1685);
    float _1701 = 1.0 / _1671;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1705 = _1675 * 0.693147182464599609375;
    float2 _5183 = float2(_1655, _1681);
    float _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5183, float2(0.0), isnan(_5183)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5183, float2(0.0), isnan(_5183)), level(0.0)).x;
    float _1709 = fma(_1663, _1689, 1.570728778839111328125);
    float _1711 = fma(_1697, 0.5, 0.5);
    float _1713 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1715 = _1691 * 0.636619746685028076171875;
    float _1717 = -_1709;
    float _1719 = fma(_1715, _1717, 1.0);
    float _1721 = _1699 * _1701;
    float _1723 = _1703 * _1701;
    float _1725 = fma(_1721, 0.5, 0.5);
    float _1727 = fma(_1723, -0.5, 0.5);
    float3 _5222 = float3(_1725, _1727, _1713);
    float _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5222, float3(0.0), isnan(_5222)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5222, float3(0.0), isnan(_5222)), level(0.0)).x;
    float3 _5233 = float3(_1725, _1727, _1713);
    float4 _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5233, float3(0.0), isnan(_5233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5233, float3(0.0), isnan(_5233)), level(0.0)).xyzw;
    float _1734 = _1732.x;
    float _1736 = _1732.y;
    float _1738 = _1732.z;
    float _1740 = _1732.w;
    float2 _5249 = float2(_1719, _1711);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5249, float2(0.0), isnan(_5249)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5249, float2(0.0), isnan(_5249)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1754 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1758 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1752);
    float _1760 = -_951;
    float _1762 = _1760 + 1.0;
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1766 = _1764 != 0;
    float _1768 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1758);
    float _1770 = _1247 + 0.5;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1778 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1754);
    float _1782 = in.m_55.w;
    float _1784 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1780);
    float _1786 = -_1243;
    float _1788 = _1786 + 0.5;
    float _1790 = 1.0 / _1778;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1796 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1806 = _1251 + 0.5;
    float _1808 = _1796 + _1778;
    float _1810 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1812 = 1.0 / _1774;
    bool _1814 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1816 = isnan(_677);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1828 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1830 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1832 = 1.0 / _1794;
    float _1834 = _1808 * _1790;
    float _1836 = _1834 * 0.5;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1840 = _677 + _1838;
    float _1842 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1830);
    bool _1844 = _1782 > 0.5;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1846);
    bool _1850 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1852 = isnan(_677);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = _1800 * _1812;
    bool _1864 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1866 = isnan(_677);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = 1.0 / _1848;
    float _1878 = -_1860;
    float _1880 = _1878 + 1.0;
    float _1882 = fma(_1862, _1840, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1884 = -_737;
    int _1886 = _1844 ? as_type<int>(_1884) : as_type<int>(_737);
    float _1888 = -_1874;
    float _1890 = _1888 + 1.0;
    bool _1892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1894 = isnan(0.5);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1900 = _1896 || _1898;
    float _1902 = _1804 * _1832;
    bool _1904 = !_1766;
    float _1906 = _1904 ? _737 : as_type<float>(_1886);
    float _1908 = _1824 * _1890;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1912 = _677 + _1910;
    float _1914 = -_1824;
    float _1916 = _1914 + 1.0;
    float _1918 = _1874 * _1880;
    float _1920 = _1882 * _1908;
    float _1922 = fma(_1902, _1912, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1926 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1928 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1920);
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1932 = _1876 * _1930;
    float _1934 = _833 + 0.5;
    float _1936 = -_1906;
    float _1938 = _1936 + 0.5;
    float _1940 = fma(_1922, _1918, _1928);
    float _1942 = _827 + (-0.5);
    float _1944 = abs(_1932);
    float _1946 = log2(_1944);
    float _1948 = fma(_1926, _1934, _863);
    float _1950 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1940);
    float _1952 = -_943;
    float _1954 = _1952 + 1.0;
    float _1956 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1958 = -_1826;
    float _1960 = -_875;
    float _1962 = fma(_1958, _1942, _1960);
    float _1964 = -_1954;
    float _1966 = fma(_833, _1964, _1948);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1970 = _1956 * _1924;
    float _1972 = fma(_827, _1762, _1962);
    float _1974 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1978 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1980 = _1950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1982 = _1950;
    float _1984 = _1954;
    float _1986 = _1762;
    float _1988 = _1980;
    float _1990 = _1671;
    float _1992 = _1703;
    if (!_1900)
    {
        _1982 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1994 = _1982;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2000 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1900)
    {
        float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2004 = _1994 + _2002;
        _1984 = _2004;
    }
    float _2006 = _1984;
    float _2008 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2010 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = exp2(_1978);
    float _2016 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_1900)
    {
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2020 = _1932 + _2018;
        _1986 = _2020;
    }
    float _2022 = _1986;
    out.m_66.x = _1966;
    out.m_66.y = _1972;
    out.m_68.x = _2008;
    out.m_68.y = _2010;
    out.m_68.z = _2012;
    out.m_68.w = _1980;
    float _2024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_70.w = _1970;
    float _2026 = fma(_2016, _2016, 1.0);
    float _2028 = _1948;
    if (!_1900)
    {
        float _2030 = 1.0 / _2006;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2036 = precise::clamp(_2034, 0.0, 1.0);
    float _2038 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2040 = fma(_2036, -2.0, 3.0);
    float _2042 = _2036 * _2036;
    float _2044 = _1810 * _1996;
    float _2046 = _2000 * _2024;
    float _2048 = _1828 * _1968;
    if (_1900)
    {
        _1988 = 1.0;
    }
    float _2050 = _1988;
    float _2052 = _2042 * _2040;
    float _2054 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2056 = rsqrt(_2026);
    out.m_70.x = _2048;
    out.m_70.y = _2044;
    out.m_70.z = _2046;
    float _2058 = -_1105;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    float _2062 = _2050;
    if (!_1900)
    {
        float _2064 = _2022 * _2032;
        float _2066 = precise::clamp(_2064, 0.0, 1.0);
        _2062 = _2066;
    }
    float _2068 = _2062;
    float _2070 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2072 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2074 = isnan(_1425);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2080 = _2076 || _2078;
    float _2082 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2060);
    float _2084 = -_1105;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2070);
    float _2088 = -_1105;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2092 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2086);
    float _2094 = -_2052;
    float _2096 = _2094 + 1.0;
    float _2098 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2100 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2102 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2104 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2052);
    float _2106 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2108 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2098);
    float _2110 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2112 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2114 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2106);
    float _2116 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2100);
    float _2118 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2102);
    float _2120 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2122 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2114);
    float _2124 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2108);
    float _2126 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    float _2128 = _731 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2130 = _2016 * _2056;
    float _2132 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2134 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2120);
    float _2136 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    float _2138 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    float _2140 = -_2132;
    float _2142 = _2130 * _2140;
    float _2144 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    float _2146 = _2016 * _2092;
    float _2148 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1842);
    float _2150 = fma(_2056, _2092, _2142);
    float _2152 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = -_2136;
    float _2156 = _2130 * _2154;
    float _2158 = fma(_2128, _2122, _2146);
    float _2160 = -_2138;
    float _2162 = _2130 * _2160;
    bool _2164 = _1932 <= 8000.0;
    bool _2166 = isnan(_1932);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan(8000.0);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = fma(_2056, _2082, _2156);
    float _2178 = exp2(_2152);
    float _2180 = _2016 * _2082;
    float _2182 = _2016 * _2110;
    float _2184 = fma(_2056, _2110, _2162);
    float _2186 = _2174 * _2104;
    float _2188 = in.m_72.x;
    float _2190 = fma(_2128, _2124, _2180);
    float _2192 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2148);
    float _2194 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_74.x = _2122;
    out.m_74.y = _2124;
    out.m_74.z = _2144;
    float _2196 = _1699 + _1671;
    float _2198 = fma(_2128, _2144, _2182);
    float _2200 = _2192 + _1671;
    out.gl_Position.x = _1699;
    out.gl_Position.y = _1703;
    out.gl_Position.z = _2192;
    out.gl_Position.w = _1671;
    float _2202 = _2196 * 0.5;
    float _2204 = -_2178;
    float _2206 = _2204 + 1.0;
    float _2208 = _2200 * 0.5;
    out.m_76.x = _2150;
    out.m_76.y = _2176;
    out.m_76.z = _2184;
    float _2210 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2212 = _2136 + _2190;
    float _2214 = _1671 * 0.5;
    float _2216 = _2138 + _2198;
    float _2218 = fma(_1703, -0.5, _2214);
    float _2220 = _2132 + _2158;
    float _2222 = _2192;
    if (!_2080)
    {
        _1990 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _1990;
    float _2226 = _2224;
    float _2228 = _2224;
    if (!_2080)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2230 = _2222;
    out.m_78.x = _2202;
    out.m_78.y = _2218;
    out.m_78.z = _2208;
    out.m_78.w = _1671;
    float _2232 = _2230;
    float _2234 = _2230;
    if (!_2080)
    {
        _1992 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2236 = _1992;
    out.m_80.x = _2220;
    out.m_80.y = _2212;
    out.m_80.z = _2216;
    float _2238 = -_1707;
    float _2240 = _2238 + 1.0;
    float _2242 = _2240 * _2194;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = -_2244;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2250 = _2248 * _2188;
    float _2252 = _2250 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2252;
    float _2254 = _2210 * _1729;
    float _2256 = -_2210;
    float _2258 = _2256 + 1.0;
    float _2260 = _1740 * _2254;
    float _2262 = _1750 * _2254;
    float _2264 = _1740 * _2258;
    float _2266 = fma(_1746, _2260, _1734);
    float _2268 = fma(_1748, _2260, _1736);
    float _2270 = fma(_1740, _2262, _1738);
    float _2272 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2274 = _1736;
    float _2276 = _1734;
    float _2278 = _2260;
    float _2280 = _2236;
    float _2282 = _2236;
    if (!_2080)
    {
        _2274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2284 = _2274;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2080)
    {
        _2276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2290 = _2276;
    out.m_84.x = _2266;
    out.m_84.y = _2268;
    out.m_84.z = _2270;
    out.m_84.w = _2264;
    float _2292 = _2290;
    float _2294 = _2290;
    if (!_2080)
    {
        _2278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2296 = _2278;
    bool _2298 = !_2080;
    float _2300 = _2296;
    float _2302 = _2296;
    if (!_2298)
    {
        bool _2304 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2306 = isnan(_1425);
        bool _2308 = _2304 || _2306;
        bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2312 = _2308 || _2310;
        if (!_2312)
        {
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2316 = _1425 + _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2318;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2326 = 1.0 / _2320;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2344 = _2316 * _2326;
            float _2346 = precise::clamp(_2344, 0.0, 1.0);
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2352 = fma(_2346, _2324, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2354 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2356 = fma(_2346, _2330, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2358 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2294 = _2356;
            _2282 = _2360;
            _2288 = _2352;
            _2234 = _2358;
            _2228 = _2354;
            _2302 = _2362;
            _2364 = true;
        }
        else
        {
            bool _2366 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2368 = isnan(_1425);
            bool _2370 = _2366 || _2368;
            bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2374 = _2370 || _2372;
            if (!_2374)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2376 = _2286;
            _2288 = _2376;
            if (!_2374)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2378 = _2292;
            _2294 = _2378;
            if (!_2374)
            {
                _2226 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2380 = _2226;
            _2228 = _2380;
            if (!_2374)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2382 = _2232;
            _2234 = _2382;
            if (!_2374)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2384 = _2280;
            _2282 = _2384;
            if (!_2374)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2386 = _2300;
            bool _2388 = !_2374;
            _2302 = _2386;
            if (!_2388)
            {
                bool _2390 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2392 = isnan(_1425);
                bool _2394 = _2390 || _2392;
                bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2398 = _2394 || _2396;
                if (!_2398)
                {
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2402 = _1425 + _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2404;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2412 = 1.0 / _2406;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2430 = _2402 * _2412;
                    float _2432 = precise::clamp(_2430, 0.0, 1.0);
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2438 = fma(_2432, _2410, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2440 = fma(_2432, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2442 = fma(_2432, _2416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2444 = fma(_2432, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2446 = fma(_2432, _2424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2448 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2294 = _2442;
                    _2282 = _2446;
                    _2288 = _2438;
                    _2234 = _2444;
                    _2228 = _2440;
                    _2302 = _2448;
                    _2364 = true;
                }
                else
                {
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2228 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2364 = false;
    float _2450 = _2294;
    float _2452 = _2282;
    float _2454 = _2288;
    float _2456 = _2234;
    float _2458 = _2228;
    float _2460 = _2302;
    float _2462 = _2272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2464 = fma(_2212, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = -_2454;
    float _2474 = _2472 + _2456;
    out.m_86.x = 0.0;
    float _2476 = fma(_2466, _2470, _2450);
    float _2478 = -_2458;
    float _2480 = _2478 + _2460;
    float _2482 = fma(_2466, _2474, _2454);
    float _2484 = _2476 * 0.586610972881317138671875;
    bool _2486 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2488 = fma(_2466, _2480, _2458);
    out.m_49.x = _2462;
    float _2490 = fma(_2482, 0.298911988735198974609375, _2484);
    bool _2492 = _2068 > 0.0;
    bool _2494 = isnan(_2068);
    bool _2496 = _2492 || _2494;
    bool _2498 = isnan(0.0);
    bool _2500 = _2496 || _2498;
    float _2502 = fma(_2488, 0.114477999508380889892578125, _2490);
    float _2504 = -_2502;
    float _2506 = _2482 + _2504;
    float _2508 = -_2502;
    float _2510 = _2476 + _2508;
    float _2512 = -_2502;
    float _2514 = _2488 + _2512;
    float _2516 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    float _2518 = fma(_2510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    float _2520 = fma(_2514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    bool _2522 = !_2486;
    if (!_2522)
    {
        float _2524 = -_1389;
        float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2528 = -_1391;
        float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2532 = -_1393;
        float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2536 = _2526 * _2526;
        float _2538 = fma(_2530, _2530, _2536);
        float _2540 = fma(_2534, _2534, _2538);
        float _2542 = sqrt(_2540);
        float _2544 = rsqrt(_2540);
        float _2546 = -_2542;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2552 = precise::clamp(_2550, 0.0, 1.0);
        float _2554 = _2530 * _2544;
        float _2556 = _2526 * _2544;
        float _2558 = abs(_2552);
        float _2560 = log2(_2558);
        float _2562 = _2534 * _2544;
        float _2564 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2566 = _2212 * _2556;
        float _2568 = -_2556;
        float _2570 = -_2564;
        float _2572 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2570);
        float _2574 = fma(_2220, _2554, _2566);
        float _2576 = -_2562;
        float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2572);
        float _2580 = fma(_2216, _2562, _2574);
        float _2582 = precise::clamp(_2580, 0.0, 1.0);
        float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2586 = _2578 + _2584;
        float _2588 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2590 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2592 = precise::clamp(_2590, 0.0, 1.0);
        float _2594 = exp2(_2588);
        float _2596 = _2594 * _2592;
        float _2598 = _2582 * _2596;
        float _2600 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2602 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2604 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2600;
        out.m_86.y = _2602;
        out.m_86.z = _2604;
    }
    out.m_88.x = _2516;
    out.m_88.y = _2518;
    out.m_88.z = _2520;
    if (_2500)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2606;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2364 = false;
    bool _669 = false;
    bool _527 = false;
    bool _405 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2663 = as_type<float>(_123);
        out.gl_Position.z = _2663;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2733 = as_type<float>(_161);
        out.gl_Position.z = _2733;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_53.x;
    float _165 = in.m_53.y;
    float _167 = in.m_53.z;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_169;
    float _191 = _185;
    float _209;
    if (!_189)
    {
        float _193 = in.m_55.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        float _213 = float(_107);
        float _215 = 1.0 / _213;
        float _217 = _141 * _215;
        _209 = _217;
    }
    _211 = false;
    float _219 = _209;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _219 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _219 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _237 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = 1.0 / _235;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _261 = 1.0 / _243;
    bool _263 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_219);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = 1.0 / _239;
    float _277 = _223 * _257;
    bool _279 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_219);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _227 * _261;
    float _293 = -_273;
    float _295 = _293 + 1.0;
    float _297 = _289 * _295;
    float _299 = -_289;
    float _301 = _299 + 1.0;
    float _303 = _231 * _275;
    float _305 = -_255;
    float _307 = _305 + 1.0;
    bool _309 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_219);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _273 * _307;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = fma(_323, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = _319 * _301;
    float _343 = fma(_333, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = fma(_327, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_337, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _349 = -_319;
    float _351 = _349 + 1.0;
    float _353 = _339 * _341;
    float _355 = _343 * _341;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _357;
    float _361 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].x, _353);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[143].y, _355);
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _371 = fma(_345, _297, _361);
    float _373 = fma(_365, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_347, _297, _367);
    float _377 = fma(_369, _329, _371);
    float _379 = fma(_373, _329, _375);
    float _381 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].x, _377);
    float _383 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[146].y, _379);
    bool _385 = !_259;
    float _403;
    if (!_385)
    {
        float _387 = in.m_55.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_107);
        float _409 = 1.0 / _407;
        float _411 = _141 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_57.x;
    float _417 = in.m_57.y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _423;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _425;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _431;
    float _435 = _383 * _417;
    float _437 = _421 * _429;
    bool _439 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _441 = isnan(_413);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = _381 * _415;
    float _453 = fma(_433, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _455 = -_449;
    float _457 = _455 + 1.0;
    bool _459 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _461 = isnan(_413);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _475;
    float _479 = _469 * _457;
    float _481 = fma(_473, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _483 = fma(_477, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _485 = -_469;
    float _487 = _485 + 1.0;
    float _489 = _453 * _479;
    float _491 = _481 * _479;
    float _493 = _483 * _479;
    float _495 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].y, _489);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[107].z, _493);
    float _501 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    float _503 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].x, _497);
    float _505 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[108].z, _499);
    bool _507 = !_427;
    float _525;
    if (!_507)
    {
        float _509 = in.m_55.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_107);
        float _531 = 1.0 / _529;
        float _533 = _141 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _541 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = isnan(_535);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _557 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_535);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = 1.0 / _539;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _571;
    float _575 = -_551;
    float _577 = _575 + 1.0;
    bool _579 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_535);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _593 = 1.0 / _555;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _599 = _573 * _569;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _603 = _535 + _601;
    float _605 = -_589;
    float _607 = _605 + 1.0;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _611 = _535 + _609;
    float _613 = fma(_599, _603, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _615 = _567 * _577;
    float _617 = -_567;
    float _619 = _617 + 1.0;
    float _621 = _597 * _593;
    float _623 = _551 * _607;
    float _625 = _613 * _615;
    float _627 = _505 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _629 = fma(_621, _611, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _631 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _633 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_629, _623, _633);
    float _639 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _641 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[117].x, _637);
    float _645 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _645;
    out.m_59.y = _635;
    out.m_59.z = _641;
    out.m_59.w = _647;
    bool _649 = !_591;
    float _667;
    if (!_649)
    {
        float _651 = in.m_55.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_107);
        float _673 = 1.0 / _671;
        float _675 = _141 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = in.m_55.z;
    float _681 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _683 = log2(_681);
    float _685 = in.m_55.y;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _693 = as_type<float>(int(gl_VertexIndex));
    float _695 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = _631;
    float _699 = _627;
    if (_689)
    {
        float _701 = in.m_55.x;
        float _703 = in.m_55.y;
        _697 = _701;
        _699 = _703;
    }
    float _705 = _697;
    float _707 = _699;
    float _709 = _683 * _141;
    float _711 = exp2(_709);
    float _713 = _679 * 2.0;
    float _715 = _685 * 2.0;
    float _717 = floor(_713);
    int _719 = as_type<int>(_693) & 1;
    bool _721 = _719 != 0;
    int _723 = as_type<int>(_693) & 2;
    bool _725 = _723 != 0;
    bool _727 = _685 > 0.5;
    bool _729 = !_721;
    float _731 = _729 ? (-0.5) : 0.5;
    float _733 = floor(_715);
    bool _735 = !_725;
    float _737 = _735 ? (-0.5) : 0.5;
    float _739 = -_711;
    float _741 = _739 + 1.0;
    float _743 = _693;
    float _745 = _707;
    if (_689)
    {
        _743 = _705;
    }
    float _747 = _743;
    float _749 = _705;
    float _751 = _747;
    if (!_689)
    {
        float _753 = in.m_55.x;
        _749 = _753;
    }
    float _755 = _749;
    if (!_689)
    {
        _751 = _679;
    }
    float _757 = _751;
    bool _759 = _717 > 0.0;
    bool _761 = _717 >= 0.0;
    bool _763 = isnan(_717);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    float _771 = _757 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _773 = -_731;
    int _775 = _727 ? as_type<int>(_773) : as_type<int>(_731);
    int _777 = _769 ? 0 : 1;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _785 = _783 != 0;
    int _787 = ~_777;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    bool _793 = _733 > 0.0;
    int _795 = _791;
    if (!_759)
    {
        int _797 = ~_777;
        int _799 = _797 + 1;
        _795 = _799;
    }
    int _801 = _795;
    bool _803 = _679 > 0.5;
    bool _805 = _733 >= 0.0;
    bool _807 = isnan(_733);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    float _815 = -_737;
    int _817 = _803 ? as_type<int>(_815) : as_type<int>(_737);
    float _819 = _755;
    if (!_689)
    {
        _745 = _755;
    }
    float _821 = _745;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _825 = !_785;
    float _827 = _825 ? _737 : as_type<float>(_817);
    float _829 = _755 * 2.0;
    bool _831 = !_781;
    float _833 = _831 ? _731 : as_type<float>(_775);
    float _835 = -_823;
    float _837 = fma(_771, 2.0, _835);
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _841 = _839 != 0;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _845 = _843 != 0;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _849 = _847 != 0;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _853 = floor(_829);
    float _855 = _821 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _857 = _685 + _755;
    int _859 = _813 ? 0 : 1;
    float _861 = -_141;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[86].x, _837);
    float _865 = fma(_855, -2.0, _851);
    float _867 = _857 + (-1.0);
    int _869 = ~_859;
    int _871 = _869 + 1;
    int _873 = _871 + 1;
    float _875 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _865);
    int _877 = _873;
    if (!_793)
    {
        int _879 = ~_859;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _887 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _895 ? _741 : 0.0;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _901 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(1.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _913 = 1.0 + _911;
    bool _915 = _853 >= 0.0;
    bool _917 = isnan(_853);
    bool _919 = _915 || _917;
    bool _921 = isnan(0.0);
    bool _923 = _919 || _921;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _927 = !_841;
    int _929 = _927 ? 0 : 1;
    float _931 = 1.0 / _913;
    int _933 = _923 ? 0 : 1;
    float _935 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[88].z, _899);
    bool _937 = _853 > 0.0;
    float _939 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[88].w, _925);
    int _941 = abs(_929);
    float _943 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _935);
    float _945 = in.m_64.x;
    float _947 = in.m_64.y;
    float _949 = in.m_64.z;
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _939);
    float _953 = float(_801);
    float _955 = float(_941);
    bool _957 = !_845;
    int _959 = _957 ? 0 : 1;
    int _961 = ~_933;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    int _967 = _965;
    if (_909)
    {
        float _969 = _897 * _931;
        _143 = _969;
    }
    float _971 = _143;
    bool _973 = !_849;
    int _975 = _973 ? 0 : 1;
    float _977 = _955 * _953;
    int _979 = abs(_959);
    float _981 = _755 + (-0.5);
    int _983 = abs(_975);
    float _985 = _977 * (-2.0);
    float _987 = _679 + _755;
    float _989 = fma(_885, _985, _885);
    float _991 = float(_883);
    float _993 = _987 + (-1.0);
    float _995 = float(_979);
    float _997 = fma(_985, _945, _945);
    float _999 = float(_983);
    if (!_937)
    {
        int _1001 = ~_933;
        int _1003 = _1001 + 1;
        _967 = _1003;
    }
    int _1005 = _967;
    float _1007 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].x, _997);
    float _1009 = _999 * _991;
    float _1011 = float(_1005);
    float _1013 = fma(_989, _971, _1007);
    float _1015 = _685 + _679;
    float _1017 = _1009 * (-2.0);
    float _1019 = _679 + (-0.5);
    float _1021 = _995 * _1011;
    float _1023 = _1013 * 0.15915493667125701904296875;
    float _1025 = _1015 + (-1.0);
    float _1027 = fma(_1017, _949, _949);
    float _1029 = _1021 * (-2.0);
    float _1031 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1033 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1035 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1027);
    float _1037 = fma(_1029, _947, _947);
    float _1039 = _685 + (-0.5);
    float _1041 = fma(_1031, _1017, _1031);
    float _1043 = fma(_1033, _1029, _1033);
    float _1045 = _1023 * 6.283185482025146484375;
    float _1047 = sin(_1045);
    float _1049 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1037);
    float _1051 = fma(_1041, _971, _1035);
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _731);
    bool _1055 = _685 > 0.5;
    float _1057 = fma(_1043, _971, _1049);
    float _1059 = _1051 * 0.15915493667125701904296875;
    float _1061 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _737);
    float _1063 = _1023 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1057 * 0.15915493667125701904296875;
    float _1069 = _695 * _1053;
    float _1071 = in.m_46.x;
    float _1073 = in.m_46.y;
    float _1075 = in.m_46.z;
    float _1077 = _691 * _1061;
    bool _1079 = _755 > 0.5;
    float _1081 = -_731;
    int _1083 = _803 ? as_type<int>(_1081) : as_type<int>(_731);
    float _1085 = _1059 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1067 * 6.283185482025146484375;
    float _1091 = sin(_1089);
    float _1093 = _1067 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1065 * _1087;
    float _1099 = _1047 * _1087;
    float _1101 = _1097 * _1077;
    float _1103 = _1059 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    float _1107 = _1065 * _1091;
    float _1109 = _1047 * _1091;
    float _1111 = _1091 * _1087;
    float _1113 = _1065 * _1095;
    float _1115 = _1047 * _1095;
    float _1117 = _1095 * _1087;
    float _1119 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1121 = _1099 * _1077;
    float _1123 = fma(_1105, _1113, _1109);
    float _1125 = -_1107;
    float _1127 = fma(_1105, _1115, _1125);
    float _1129 = -_1115;
    float _1131 = fma(_1105, _1107, _1129);
    float _1133 = -_1077;
    float _1135 = _1105 * _1133;
    float _1137 = fma(_1123, _1069, _1101);
    float _1139 = fma(_1105, _1109, _1113);
    float _1141 = fma(_1127, _1069, _1121);
    float _1143 = fma(_1117, _1069, _1135);
    float _1145 = fma(_1131, _1119, _1137);
    float _1147 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1149 = fma(_1139, _1119, _1141);
    float _1151 = fma(_1111, _1119, _1143);
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1155 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1157 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1147);
    float _1159 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1153);
    float _1163 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1155);
    float _1165 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1157);
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1159);
    float _1169 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1171 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1163);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1175 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1167);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1181 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1183 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1185 = _1173 + _1177;
    float _1187 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1189 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1181);
    float _1191 = _1179 + _1183;
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1195 = _1185 + _1193;
    float _1197 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1187);
    float _1199 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1189);
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1203 = _1191 + _1201;
    float _1205 = _1195 * _1195;
    float _1207 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1197);
    float _1209 = _1199 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1211 = -_737;
    int _1213 = _1055 ? as_type<int>(_1211) : as_type<int>(_737);
    float _1215 = fma(_1203, _1203, _1205);
    float _1217 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1219 = -_731;
    int _1221 = _1079 ? as_type<int>(_1219) : as_type<int>(_731);
    float _1223 = sqrt(_1215);
    float _1225 = _1209 + _1217;
    bool _1227 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1231 = _1229 != 0;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1235 = _1233 != 0;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1239 = _1237 != 0;
    bool _1241 = !_1235;
    float _1243 = _1241 ? _737 : as_type<float>(_1213);
    bool _1245 = !_1239;
    float _1247 = _1245 ? _731 : as_type<float>(_1083);
    bool _1249 = !_1231;
    float _1251 = _1249 ? _731 : as_type<float>(_1221);
    float _1253 = _1187;
    float _1255 = _1191;
    float _1257 = _1185;
    float _1259 = _1223;
    if (!_1227)
    {
        _1253 = _1225;
    }
    float _1261 = _1253;
    bool _1263 = !_1227;
    float _1265 = _1261;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1223 + _1269;
        float _1273 = rsqrt(_1215);
        float _1275 = _1271 * _1267;
        float _1277 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1279 = _1275 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        float _1289 = _1283 + (-1.0);
        float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = fma(_1287, _1277, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1295 = fma(_1225, _1283, _1291);
        float _1297 = _1273 * _1293;
        float _1299 = fma(_1203, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1301 = fma(_1195, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1265 = _1295;
        _1255 = _1299;
        _1257 = _1301;
        _819 = _1279;
    }
    float _1303 = _1265;
    float _1305 = _1255;
    float _1307 = _1257;
    float _1309 = _819;
    float _1311 = -_1209;
    float _1313 = _1311 + _1303;
    float _1315 = -_1179;
    float _1317 = _1315 + _1305;
    float _1319 = -_1173;
    float _1321 = _1319 + _1307;
    float _1323 = _1313 * _1313;
    float _1325 = fma(_1317, _1317, _1323);
    float _1327 = fma(_1321, _1321, _1325);
    float _1329 = sqrt(_1327);
    bool _1331 = _1329 > 0.0;
    bool _1333 = !_1331;
    float _1335 = _1303;
    float _1337 = _1305;
    float _1339 = _1307;
    float _1341 = _1309;
    if (!_1333)
    {
        float _1343 = _185 * _185;
        float _1345 = fma(_183, _183, _1343);
        float _1347 = fma(_187, _187, _1345);
        float _1349 = rsqrt(_1327);
        float _1351 = sqrt(_1347);
        float _1353 = _1317 * _1349;
        float _1355 = _1313 * _1349;
        float _1357 = _1321 * _1349;
        bool _1359 = _1351 > 0.0;
        bool _1361 = !_1359;
        _1341 = _1351;
        _1259 = _1357;
        if (!_1361)
        {
            float _1363 = rsqrt(_1347);
            float _1365 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1367 = _185 * _1363;
            float _1369 = _183 * _1363;
            float _1371 = _187 * _1363;
            float _1373 = _1355 * _1367;
            float _1375 = fma(_1353, _1369, _1373);
            float _1377 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1379 = fma(_1357, _1371, _1375);
            float _1381 = _1379 * _1377;
            float _1383 = fma(_183, _1381, _1305);
            float _1385 = fma(_185, _1381, _1303);
            float _1387 = fma(_187, _1381, _1307);
            _1335 = _1385;
            _1337 = _1383;
            _1339 = _1387;
            _1341 = _1367;
        }
    }
    float _1389 = _1335;
    float _1391 = _1337;
    float _1393 = _1339;
    float _1395 = _1341;
    float _1397 = _1259;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1401 = _1389 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1405 = _1391 + _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1409 = _1393 + _1407;
    float _1411 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1413 = _1401 * _1401;
    float _1415 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1417 = fma(_1405, _1405, _1413);
    float _1419 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1421 = fma(_1409, _1409, _1417);
    float _1423 = rsqrt(_1421);
    float _1425 = sqrt(_1421);
    float _1427 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1429 = _1405 * _1427;
    float _1431 = _1409 * _1427;
    float _1433 = _1429 * _1429;
    float _1435 = _1431 * _1431;
    float _1437 = _1433 + _1435;
    float _1439 = sqrt(_1437);
    bool _1441 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1445 = _1439 + _1443;
    float _1447 = _1423;
    float _1449 = _1437;
    float _1451 = _1445;
    float _1453 = _1401;
    float _1455 = _1395;
    float _1457 = _1397;
    if (_1441)
    {
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1447 = _1459;
    }
    float _1461 = _1447;
    if (_1441)
    {
        float _1463 = rsqrt(_1437);
        _1449 = _1463;
    }
    float _1465 = _1449;
    float _1467 = _1465;
    if (_1441)
    {
        float _1469 = _1445 * _1461;
        _1451 = _1469;
    }
    float _1471 = _1451;
    if (_1441)
    {
        float _1473 = _1471 * 0.15915493667125701904296875;
        _191 = _1473;
    }
    float _1475 = _191;
    float _1477 = _1409;
    if (_1441)
    {
        float _1479 = _1475 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        _1477 = _1481;
    }
    float _1483 = _1477;
    float _1485 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1487 = precise::max(0.0, _1485);
    float _1489 = _1461;
    if (_1441)
    {
        float _1491 = _1475 * 6.283185482025146484375;
        float _1493 = cos(_1491);
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = -_1427;
    float _1499 = -_1487;
    float _1501 = fma(_1401, _1497, _1499);
    float _1503 = _1501;
    if (_1441)
    {
        float _1505 = _1501 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1505;
    }
    float _1507 = _1453;
    float _1509 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1511 = _1483;
    float _1513 = _1507;
    if (_1441)
    {
        float _1515 = fma(_1483, _1507, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = _1517;
    if (!_1441)
    {
        _1513 = _1433;
    }
    float _1521 = _1513;
    float _1523 = _1521;
    if (_1441)
    {
        float _1525 = _1495 + (-1.0);
        _1455 = _1525;
    }
    float _1527 = _1455;
    float _1529 = _1527;
    if (_1441)
    {
        float _1531 = _1465 * _1517;
        _1457 = _1531;
    }
    float _1533 = _1457;
    if (!_1441)
    {
        _1519 = _1429;
    }
    float _1535 = _1519;
    float _1537 = _1535;
    if (_1441)
    {
        float _1539 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1529 = _1539;
    }
    float _1541 = _1529;
    float _1543 = _1541;
    if (_1441)
    {
        float _1545 = _1429 * _1533;
        _1537 = _1545;
    }
    float _1547 = _1537;
    if (!_1441)
    {
        _1467 = _1435;
    }
    float _1549 = _1467;
    float _1551 = _1549;
    if (_1441)
    {
        float _1553 = fma(_1501, _1495, _1541);
        _1503 = _1553;
    }
    float _1555 = _1503;
    if (!_1441)
    {
        _1543 = _1431;
    }
    float _1557 = _1543;
    float _1559 = _1557;
    if (_1441)
    {
        float _1561 = _1431 * _1533;
        _1559 = _1561;
    }
    float _1563 = _1559;
    if (_1441)
    {
        float _1565 = _1547 * _1547;
        _1523 = _1565;
    }
    float _1567 = _1523;
    float _1569 = floor(_1419);
    if (_1441)
    {
        float _1571 = _1563 * _1563;
        _1551 = _1571;
    }
    float _1573 = _1551;
    float _1575 = fma(_1555, _1555, _1567);
    float _1577 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1509);
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1581 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1579);
    float _1583 = precise::clamp(_1581, 0.0, 1.0);
    float _1585 = _1575 + _1573;
    float _1587 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1577);
    float _1589 = -_1583;
    float _1591 = _1589 + 1.0;
    float _1593 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1595 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1597 = rsqrt(_1585);
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1601 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1411);
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1415);
    float _1607 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1609 = -_1603;
    float _1611 = fma(_1609, _1599, 1.0);
    float _1613 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = abs(_1591);
    float _1617 = log2(_1615);
    float _1619 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1621 = _1597 * _1547;
    float _1623 = _1597 * _1555;
    float _1625 = _1597 * _1563;
    float _1627 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1629 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1631 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1633 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1605);
    float _1635 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1627);
    float _1637 = -_1629;
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1637);
    float _1641 = floor(_1593);
    float _1643 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1645 = _1635 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = -_1625;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1639);
    float _1651 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1653 = -_1569;
    float _1655 = _1419 + _1653;
    float _1657 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1631);
    float _1659 = fma(_1649, -0.5, 0.5);
    float _1661 = exp2(_1643);
    float _1663 = fma(_1649, 0.5, 0.5);
    float _1665 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1657);
    float _1667 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1669 = fma(_1663, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1671 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1665);
    float _1673 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1667);
    float _1675 = log2(_1611);
    float _1677 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = -_1641;
    float _1681 = _1593 + _1679;
    float _1683 = _1623 + 1.0;
    float _1685 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1673);
    float _1687 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1689 = fma(_1663, _1669, -0.212114393711090087890625);
    float _1691 = sqrt(_1659);
    float _1693 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1687);
    float _1695 = -_1623;
    float _1697 = fma(_1661, _1683, _1695);
    float _1699 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1685);
    float _1701 = 1.0 / _1671;
    float _1703 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1693);
    float _1705 = _1675 * 0.693147182464599609375;
    float2 _5183 = float2(_1655, _1681);
    float _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5183, float2(0.0), isnan(_5183)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5183, float2(0.0), isnan(_5183)), level(0.0)).x;
    float _1709 = fma(_1663, _1689, 1.570728778839111328125);
    float _1711 = fma(_1697, 0.5, 0.5);
    float _1713 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1715 = _1691 * 0.636619746685028076171875;
    float _1717 = -_1709;
    float _1719 = fma(_1715, _1717, 1.0);
    float _1721 = _1699 * _1701;
    float _1723 = _1703 * _1701;
    float _1725 = fma(_1721, 0.5, 0.5);
    float _1727 = fma(_1723, -0.5, 0.5);
    float3 _5222 = float3(_1725, _1727, _1713);
    float _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5222, float3(0.0), isnan(_5222)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5222, float3(0.0), isnan(_5222)), level(0.0)).x;
    float3 _5233 = float3(_1725, _1727, _1713);
    float4 _1732 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5233, float3(0.0), isnan(_5233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5233, float3(0.0), isnan(_5233)), level(0.0)).xyzw;
    float _1734 = _1732.x;
    float _1736 = _1732.y;
    float _1738 = _1732.z;
    float _1740 = _1732.w;
    float2 _5249 = float2(_1719, _1711);
    float3 _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5249, float2(0.0), isnan(_5249)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5249, float2(0.0), isnan(_5249)), level(0.0)).xyz;
    float _1746 = _1744.x;
    float _1748 = _1744.y;
    float _1750 = _1744.z;
    float _1752 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1754 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1758 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1752);
    float _1760 = -_951;
    float _1762 = _1760 + 1.0;
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1766 = _1764 != 0;
    float _1768 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1758);
    float _1770 = _1247 + 0.5;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1778 = _1768 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1754);
    float _1782 = in.m_55.w;
    float _1784 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1780);
    float _1786 = -_1243;
    float _1788 = _1786 + 0.5;
    float _1790 = 1.0 / _1778;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1796 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1806 = _1251 + 0.5;
    float _1808 = _1796 + _1778;
    float _1810 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1812 = 1.0 / _1774;
    bool _1814 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1816 = isnan(_677);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1828 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1830 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1832 = 1.0 / _1794;
    float _1834 = _1808 * _1790;
    float _1836 = _1834 * 0.5;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1840 = _677 + _1838;
    float _1842 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1830);
    bool _1844 = _1782 > 0.5;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1846);
    bool _1850 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1852 = isnan(_677);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = _1800 * _1812;
    bool _1864 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1866 = isnan(_677);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = 1.0 / _1848;
    float _1878 = -_1860;
    float _1880 = _1878 + 1.0;
    float _1882 = fma(_1862, _1840, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1884 = -_737;
    int _1886 = _1844 ? as_type<int>(_1884) : as_type<int>(_737);
    float _1888 = -_1874;
    float _1890 = _1888 + 1.0;
    bool _1892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1894 = isnan(0.5);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1900 = _1896 || _1898;
    float _1902 = _1804 * _1832;
    bool _1904 = !_1766;
    float _1906 = _1904 ? _737 : as_type<float>(_1886);
    float _1908 = _1824 * _1890;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1912 = _677 + _1910;
    float _1914 = -_1824;
    float _1916 = _1914 + 1.0;
    float _1918 = _1874 * _1880;
    float _1920 = _1882 * _1908;
    float _1922 = fma(_1902, _1912, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1926 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1928 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1920);
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1932 = _1876 * _1930;
    float _1934 = _833 + 0.5;
    float _1936 = -_1906;
    float _1938 = _1936 + 0.5;
    float _1940 = fma(_1922, _1918, _1928);
    float _1942 = _827 + (-0.5);
    float _1944 = abs(_1932);
    float _1946 = log2(_1944);
    float _1948 = fma(_1926, _1934, _863);
    float _1950 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1940);
    float _1952 = -_943;
    float _1954 = _1952 + 1.0;
    float _1956 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1958 = -_1826;
    float _1960 = -_875;
    float _1962 = fma(_1958, _1942, _1960);
    float _1964 = -_1954;
    float _1966 = fma(_833, _1964, _1948);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1970 = _1956 * _1924;
    float _1972 = fma(_827, _1762, _1962);
    float _1974 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1978 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1980 = _1950 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1982 = _1950;
    float _1984 = _1954;
    float _1986 = _1762;
    float _1988 = _1980;
    float _1990 = _1671;
    float _1992 = _1703;
    if (!_1900)
    {
        _1982 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1994 = _1982;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2000 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1900)
    {
        float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2004 = _1994 + _2002;
        _1984 = _2004;
    }
    float _2006 = _1984;
    float _2008 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2010 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2014 = exp2(_1978);
    float _2016 = _737 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_1900)
    {
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2020 = _1932 + _2018;
        _1986 = _2020;
    }
    float _2022 = _1986;
    out.m_66.x = _1966;
    out.m_66.y = _1972;
    out.m_68.x = _2008;
    out.m_68.y = _2010;
    out.m_68.z = _2012;
    out.m_68.w = _1980;
    float _2024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_70.w = _1970;
    float _2026 = fma(_2016, _2016, 1.0);
    float _2028 = _1948;
    if (!_1900)
    {
        float _2030 = 1.0 / _2006;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2036 = precise::clamp(_2034, 0.0, 1.0);
    float _2038 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2040 = fma(_2036, -2.0, 3.0);
    float _2042 = _2036 * _2036;
    float _2044 = _1810 * _1996;
    float _2046 = _2000 * _2024;
    float _2048 = _1828 * _1968;
    if (_1900)
    {
        _1988 = 1.0;
    }
    float _2050 = _1988;
    float _2052 = _2042 * _2040;
    float _2054 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2056 = rsqrt(_2026);
    out.m_70.x = _2048;
    out.m_70.y = _2044;
    out.m_70.z = _2046;
    float _2058 = -_1105;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    float _2062 = _2050;
    if (!_1900)
    {
        float _2064 = _2022 * _2032;
        float _2066 = precise::clamp(_2064, 0.0, 1.0);
        _2062 = _2066;
    }
    float _2068 = _2062;
    float _2070 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2072 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2074 = isnan(_1425);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2080 = _2076 || _2078;
    float _2082 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2060);
    float _2084 = -_1105;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2070);
    float _2088 = -_1105;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2092 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2086);
    float _2094 = -_2052;
    float _2096 = _2094 + 1.0;
    float _2098 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2100 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2102 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2104 = fma(_2096, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2052);
    float _2106 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2108 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2098);
    float _2110 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2112 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2114 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2106);
    float _2116 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2100);
    float _2118 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2102);
    float _2120 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2122 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2114);
    float _2124 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2108);
    float _2126 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    float _2128 = _731 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2130 = _2016 * _2056;
    float _2132 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2134 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2120);
    float _2136 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    float _2138 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    float _2140 = -_2132;
    float _2142 = _2130 * _2140;
    float _2144 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    float _2146 = _2016 * _2092;
    float _2148 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1842);
    float _2150 = fma(_2056, _2092, _2142);
    float _2152 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = -_2136;
    float _2156 = _2130 * _2154;
    float _2158 = fma(_2128, _2122, _2146);
    float _2160 = -_2138;
    float _2162 = _2130 * _2160;
    bool _2164 = _1932 <= 8000.0;
    bool _2166 = isnan(_1932);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan(8000.0);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = fma(_2056, _2082, _2156);
    float _2178 = exp2(_2152);
    float _2180 = _2016 * _2082;
    float _2182 = _2016 * _2110;
    float _2184 = fma(_2056, _2110, _2162);
    float _2186 = _2174 * _2104;
    float _2188 = in.m_72.x;
    float _2190 = fma(_2128, _2124, _2180);
    float _2192 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2148);
    float _2194 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_74.x = _2122;
    out.m_74.y = _2124;
    out.m_74.z = _2144;
    float _2196 = _1699 + _1671;
    float _2198 = fma(_2128, _2144, _2182);
    float _2200 = _2192 + _1671;
    out.gl_Position.x = _1699;
    out.gl_Position.y = _1703;
    out.gl_Position.z = _2192;
    out.gl_Position.w = _1671;
    float _2202 = _2196 * 0.5;
    float _2204 = -_2178;
    float _2206 = _2204 + 1.0;
    float _2208 = _2200 * 0.5;
    out.m_76.x = _2150;
    out.m_76.y = _2176;
    out.m_76.z = _2184;
    float _2210 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2212 = _2136 + _2190;
    float _2214 = _1671 * 0.5;
    float _2216 = _2138 + _2198;
    float _2218 = fma(_1703, -0.5, _2214);
    float _2220 = _2132 + _2158;
    float _2222 = _2192;
    if (!_2080)
    {
        _1990 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _1990;
    float _2226 = _2224;
    float _2228 = _2224;
    if (!_2080)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2230 = _2222;
    out.m_78.x = _2202;
    out.m_78.y = _2218;
    out.m_78.z = _2208;
    out.m_78.w = _1671;
    float _2232 = _2230;
    float _2234 = _2230;
    if (!_2080)
    {
        _1992 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2236 = _1992;
    out.m_80.x = _2220;
    out.m_80.y = _2212;
    out.m_80.z = _2216;
    float _2238 = -_1707;
    float _2240 = _2238 + 1.0;
    float _2242 = _2240 * _2194;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = -_2244;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2250 = _2248 * _2188;
    float _2252 = _2250 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_82.x = _2252;
    float _2254 = _2210 * _1729;
    float _2256 = -_2210;
    float _2258 = _2256 + 1.0;
    float _2260 = _1740 * _2254;
    float _2262 = _1750 * _2254;
    float _2264 = _1740 * _2258;
    float _2266 = fma(_1746, _2260, _1734);
    float _2268 = fma(_1748, _2260, _1736);
    float _2270 = fma(_1740, _2262, _1738);
    float _2272 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2274 = _1736;
    float _2276 = _1734;
    float _2278 = _2260;
    float _2280 = _2236;
    float _2282 = _2236;
    if (!_2080)
    {
        _2274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2284 = _2274;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2080)
    {
        _2276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2290 = _2276;
    out.m_84.x = _2266;
    out.m_84.y = _2268;
    out.m_84.z = _2270;
    out.m_84.w = _2264;
    float _2292 = _2290;
    float _2294 = _2290;
    if (!_2080)
    {
        _2278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2296 = _2278;
    bool _2298 = !_2080;
    float _2300 = _2296;
    float _2302 = _2296;
    if (!_2298)
    {
        bool _2304 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2306 = isnan(_1425);
        bool _2308 = _2304 || _2306;
        bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2312 = _2308 || _2310;
        if (!_2312)
        {
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2316 = _1425 + _2314;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2318;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2326 = 1.0 / _2320;
            float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2344 = _2316 * _2326;
            float _2346 = precise::clamp(_2344, 0.0, 1.0);
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2352 = fma(_2346, _2324, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2354 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2356 = fma(_2346, _2330, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2358 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2294 = _2356;
            _2282 = _2360;
            _2288 = _2352;
            _2234 = _2358;
            _2228 = _2354;
            _2302 = _2362;
            _2364 = true;
        }
        else
        {
            bool _2366 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2368 = isnan(_1425);
            bool _2370 = _2366 || _2368;
            bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2374 = _2370 || _2372;
            if (!_2374)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2376 = _2286;
            _2288 = _2376;
            if (!_2374)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2378 = _2292;
            _2294 = _2378;
            if (!_2374)
            {
                _2226 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2380 = _2226;
            _2228 = _2380;
            if (!_2374)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2382 = _2232;
            _2234 = _2382;
            if (!_2374)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2384 = _2280;
            _2282 = _2384;
            if (!_2374)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2386 = _2300;
            bool _2388 = !_2374;
            _2302 = _2386;
            if (!_2388)
            {
                bool _2390 = _1425 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2392 = isnan(_1425);
                bool _2394 = _2390 || _2392;
                bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2398 = _2394 || _2396;
                if (!_2398)
                {
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2402 = _1425 + _2400;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2404;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2412 = 1.0 / _2406;
                    float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2430 = _2402 * _2412;
                    float _2432 = precise::clamp(_2430, 0.0, 1.0);
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2438 = fma(_2432, _2410, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2440 = fma(_2432, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2442 = fma(_2432, _2416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2444 = fma(_2432, _2420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2446 = fma(_2432, _2424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2448 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2294 = _2442;
                    _2282 = _2446;
                    _2288 = _2438;
                    _2234 = _2444;
                    _2228 = _2440;
                    _2302 = _2448;
                    _2364 = true;
                }
                else
                {
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2228 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2364 = false;
    float _2450 = _2294;
    float _2452 = _2282;
    float _2454 = _2288;
    float _2456 = _2234;
    float _2458 = _2228;
    float _2460 = _2302;
    float _2462 = _2272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2464 = fma(_2212, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2450;
    float _2470 = _2468 + _2452;
    float _2472 = -_2454;
    float _2474 = _2472 + _2456;
    out.m_86.x = 0.0;
    float _2476 = fma(_2466, _2470, _2450);
    float _2478 = -_2458;
    float _2480 = _2478 + _2460;
    float _2482 = fma(_2466, _2474, _2454);
    float _2484 = _2476 * 0.586610972881317138671875;
    bool _2486 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2488 = fma(_2466, _2480, _2458);
    out.m_49.x = _2462;
    float _2490 = fma(_2482, 0.298911988735198974609375, _2484);
    bool _2492 = _2068 > 0.0;
    bool _2494 = isnan(_2068);
    bool _2496 = _2492 || _2494;
    bool _2498 = isnan(0.0);
    bool _2500 = _2496 || _2498;
    float _2502 = fma(_2488, 0.114477999508380889892578125, _2490);
    float _2504 = -_2502;
    float _2506 = _2482 + _2504;
    float _2508 = -_2502;
    float _2510 = _2476 + _2508;
    float _2512 = -_2502;
    float _2514 = _2488 + _2512;
    float _2516 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    float _2518 = fma(_2510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    float _2520 = fma(_2514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2502);
    bool _2522 = !_2486;
    if (!_2522)
    {
        float _2524 = -_1389;
        float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2528 = -_1391;
        float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2532 = -_1393;
        float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2536 = _2526 * _2526;
        float _2538 = fma(_2530, _2530, _2536);
        float _2540 = fma(_2534, _2534, _2538);
        float _2542 = sqrt(_2540);
        float _2544 = rsqrt(_2540);
        float _2546 = -_2542;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2552 = precise::clamp(_2550, 0.0, 1.0);
        float _2554 = _2530 * _2544;
        float _2556 = _2526 * _2544;
        float _2558 = abs(_2552);
        float _2560 = log2(_2558);
        float _2562 = _2534 * _2544;
        float _2564 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2566 = _2212 * _2556;
        float _2568 = -_2556;
        float _2570 = -_2564;
        float _2572 = fma(_2568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2570);
        float _2574 = fma(_2220, _2554, _2566);
        float _2576 = -_2562;
        float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2572);
        float _2580 = fma(_2216, _2562, _2574);
        float _2582 = precise::clamp(_2580, 0.0, 1.0);
        float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2586 = _2578 + _2584;
        float _2588 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2590 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2592 = precise::clamp(_2590, 0.0, 1.0);
        float _2594 = exp2(_2588);
        float _2596 = _2594 * _2592;
        float _2598 = _2582 * _2596;
        float _2600 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2602 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2604 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2600;
        out.m_86.y = _2602;
        out.m_86.z = _2604;
    }
    out.m_88.x = _2516;
    out.m_88.y = _2518;
    out.m_88.z = _2520;
    if (_2500)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2606;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

