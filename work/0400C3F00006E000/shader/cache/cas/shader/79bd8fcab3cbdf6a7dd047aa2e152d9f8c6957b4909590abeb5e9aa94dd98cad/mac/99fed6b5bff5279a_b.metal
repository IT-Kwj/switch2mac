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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1804 = false;
    bool _957 = false;
    bool _527 = false;
    bool _391 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _105 = 0;
    if (!_99)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2102 = as_type<float>(_109);
        out.gl_Position.z = _2102;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_95);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2171 = as_type<float>(_147);
        out.gl_Position.z = _2171;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_53.x;
    float _151 = in.m_53.y;
    float _153 = in.m_53.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _177 = _171;
    float _195;
    if (!_175)
    {
        float _179 = in.m_55.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_95);
        float _201 = 1.0 / _199;
        float _203 = _127 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _205 + _211;
    bool _215 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _217 = isnan(_205);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _205 + _239;
    float _243 = 1.0 / _229;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _237;
    float _249 = 1.0 / _233;
    float _251 = _209 * _243;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -_225;
    float _267 = _265 + 1.0;
    float _269 = _263 * _267;
    float _271 = _213 * _247;
    bool _273 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_205);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _241 * _249;
    bool _295 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_205);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = _283 * _287;
    float _313 = -_283;
    float _315 = _313 + 1.0;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = fma(_309, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = _305 * _315;
    float _329 = fma(_319, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = fma(_291, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_323, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = -_305;
    float _337 = _335 + 1.0;
    float _339 = _325 * _327;
    float _341 = _329 * _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _353 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _355 = fma(_345, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_349, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_331, _311, _351);
    float _361 = fma(_333, _311, _353);
    float _363 = fma(_355, _269, _359);
    float _365 = fma(_357, _269, _361);
    float _367 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[146].x, _363);
    float _369 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[146].y, _365);
    bool _371 = !_245;
    float _389;
    if (!_371)
    {
        float _373 = in.m_55.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_95);
        float _395 = 1.0 / _393;
        float _397 = _127 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -_415;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _437;
    float _441 = 1.0 / _419;
    bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _445 = _431 * _435;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = _403 * _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _453;
    float _457 = fma(_439, _451, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _459;
    float _463 = fma(_455, _451, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _465 = fma(_461, _451, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _467 = _457 * _445;
    float _469 = _463 * _445;
    float _471 = _465 * _445;
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].x, _467);
    float _475 = in.m_57.x;
    float _477 = in.m_57.y;
    float _479 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].y, _471);
    float _481 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].x, _473);
    float _485 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].y, _479);
    float _487 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].z, _481);
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _497;
    out.m_59.y = _499;
    out.m_59.z = _501;
    out.m_59.w = _495;
    float _503 = _369 * _477;
    float _505 = _367 * _475;
    bool _507 = !_443;
    float _525;
    if (!_507)
    {
        float _509 = in.m_55.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_95);
        float _531 = 1.0 / _529;
        float _533 = _127 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = as_type<float>(int(gl_VertexIndex));
    float _539 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = in.m_55.x;
    float _543 = in.m_55.y;
    float _545 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _547 = in.m_46.x;
    float _549 = in.m_46.y;
    float _551 = in.m_46.z;
    int _553 = as_type<int>(_537) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_537) & 2;
    bool _559 = _557 != 0;
    float _561 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _563 = _543 > 0.5;
    bool _565 = !_559;
    float _567 = _565 ? (-0.5) : 0.5;
    bool _569 = !_555;
    float _571 = _569 ? (-0.5) : 0.5;
    bool _573 = _541 > 0.5;
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _567);
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    float _581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _571);
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _585 = _583 != 0;
    float _587 = _561 * _575;
    float _589 = _549 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _591 = _539 * _581;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _593;
    float _597 = _549 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _599 = _587 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _601 = _549 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _603 = _587 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].x, _589);
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[24].x, _599);
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _611 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _613 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _615 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _617 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].z, _609);
    float _619 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[26].z, _611);
    float _621 = 1.0 / _595;
    float _623 = _615 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _625 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].x, _597);
    float _627 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _629 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _631 = isnan(_535);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _587 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _643 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[5].z, _625);
    float _645 = _613 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _647 = _617 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _651 = _535 + _649;
    float _653 = -_639;
    float _655 = _653 + 1.0;
    float _657 = _645 + _623;
    float _659 = _647 + _627;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _661;
    float _665 = _651 * _621;
    float _667 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _669 = _657 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _673 = _659 + _671;
    float _675 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[25].x, _641);
    float _677 = _669 * _669;
    float _679 = _673 * _673;
    bool _681 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _683 = isnan(_535);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _693;
    float _697 = _677 + _679;
    float _699 = fma(_663, _665, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _701 = _691 * _655;
    float _703 = fma(_695, _665, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _705 = sqrt(_697);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _707;
    float _711 = _699 * _701;
    float _713 = _703 * _701;
    float _715 = -_567;
    int _717 = _563 ? as_type<int>(_715) : as_type<int>(_567);
    float _719 = fma(_709, _665, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _721 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[25].z, _675);
    bool _723 = !_585;
    float _725 = _723 ? _567 : as_type<float>(_717);
    float _727 = _719 * _701;
    float _729 = -_571;
    int _731 = _573 ? as_type<int>(_729) : as_type<int>(_571);
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _735 = _567 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _737 = _571 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _739 = !_579;
    float _741 = _739 ? _571 : as_type<float>(_731);
    float _743 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _745 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _747 = _721 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _749 = _735 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _735 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _755 = _743 + _747;
    float _757 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].x, _749);
    float _759 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].x, _753);
    float _763 = _753;
    float _765 = _751;
    float _767 = _643;
    float _769 = _659;
    float _771 = _657;
    float _773 = _761;
    if (!_745)
    {
        _763 = _659;
    }
    float _775 = _763;
    float _777 = _775;
    if (!_745)
    {
        _765 = _679;
    }
    float _779 = _765;
    float _781 = _779;
    if (!_745)
    {
        _767 = _677;
    }
    float _783 = _767;
    float _785 = _783;
    if (!_745)
    {
        _769 = _755;
    }
    float _787 = _769;
    bool _789 = !_745;
    float _791 = _787;
    if (!_789)
    {
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _797 = _705 + _795;
        float _799 = _755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _801 = rsqrt(_697);
        float _803 = _797 * _793;
        float _805 = _803 * 0.15915493667125701904296875;
        float _807 = _805 * 6.283185482025146484375;
        float _809 = sin(_807);
        float _811 = _805 * 6.283185482025146484375;
        float _813 = cos(_811);
        float _815 = fma(_809, _799, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _817 = _801 * _815;
        float _819 = _813 + (-1.0);
        float _821 = fma(_669, _817, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _823 = fma(_673, _817, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _825 = _819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _829 = _821 + _827;
        float _831 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _833 = _823 + _831;
        float _835 = fma(_755, _813, _825);
        float _837 = _829 * _829;
        float _839 = _833 * _833;
        _791 = _835;
        _785 = _837;
        _781 = _839;
        _771 = _821;
        _777 = _823;
    }
    float _841 = _791;
    float _843 = _785;
    float _845 = _781;
    float _847 = _771;
    float _849 = _777;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _853 = _841 + _851;
    float _855 = -_691;
    float _857 = _855 + 1.0;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _861 = _741 + 0.5;
    float _863 = fma(_853, _853, _843);
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].y, _727);
    float _867 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].x, _711);
    float _869 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].z, _713);
    float _871 = _863 + _845;
    float _873 = _861 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _875 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].y, _865);
    float _877 = -_725;
    float _879 = _877 + 0.5;
    float _881 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].x, _867);
    float _883 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].z, _869);
    float _885 = _873 * _733;
    float _887 = sqrt(_871);
    float _889 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _897 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _899 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _891 * _859;
    float _903 = _757 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _761 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_64.x = _885;
    out.m_64.y = _901;
    out.m_66.x = _905;
    out.m_66.y = _899;
    out.m_66.z = _907;
    bool _911 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _913 = isnan(_887);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _919 = _915 || _917;
    out.m_68.x = _903;
    out.m_68.y = _897;
    out.m_68.z = _909;
    float _921 = _907;
    if (!_919)
    {
        _773 = 1.0;
    }
    float _923 = _773;
    bool _925 = !_919;
    float _927 = _923;
    if (!_925)
    {
        bool _929 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _931 = isnan(_887);
        bool _933 = _929 || _931;
        bool _935 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _937 = _933 || _935;
        if (!_937)
        {
            float _939 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _941 = _887 + _939;
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _945 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _943;
            float _947 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _949 = _947 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _951 = 1.0 / _945;
            float _953 = _941 * _951;
            float _955 = fma(_953, _949, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _927 = _955;
            _957 = true;
        }
        else
        {
            bool _959 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _961 = isnan(_887);
            bool _963 = _959 || _961;
            bool _965 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _967 = _963 || _965;
            if (!_967)
            {
                float _969 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _971 = _887 + _969;
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _975 = _973 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _977 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _979 = _977 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _981 = 1.0 / _975;
                float _983 = _971 * _981;
                float _985 = fma(_983, _979, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _927 = _985;
                _957 = true;
            }
            else
            {
                _927 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _957 = false;
    float _987 = _927;
    float _989 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _991 = _841 + _989;
    float _993 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _995 = _847 + _993;
    float _997 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _999 = _849 + _997;
    float _1001 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1003 = fma(_995, _987, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1005 = fma(_999, _987, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1007 = _743 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1009 = -_743;
    float _1011 = _1009 + _1001;
    float _1013 = -_645;
    float _1015 = _1013 + _1003;
    float _1017 = -_647;
    float _1019 = _1017 + _1005;
    float _1021 = _1011 * _1011;
    float _1023 = fma(_1015, _1015, _1021);
    float _1025 = fma(_1019, _1019, _1023);
    float _1027 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1007);
    float _1029 = _743 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1031 = sqrt(_1025);
    float _1033 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1027);
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1037 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1029);
    float _1039 = 1.0 / _1035;
    float _1041 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1037);
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1055 = _1031 > 0.0;
    float _1057 = _1053 + _1035;
    bool _1059 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    float _1069 = _1057 * _1039;
    float _1071 = _1069 * 0.5;
    float _1073 = _1057;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1079 = _1035;
    float _1081 = _1071;
    if (!_1055)
    {
        _1073 = _1003;
    }
    float _1083 = _1073;
    float _1085 = _1083;
    if (!_1055)
    {
        _1075 = _1001;
    }
    float _1087 = _1075;
    float _1089 = _1087;
    if (!_1055)
    {
        _1077 = _1005;
    }
    float _1091 = _1077;
    bool _1093 = !_1055;
    float _1095 = _1091;
    float _1097 = _1091;
    if (!_1093)
    {
        float _1099 = _169 * _169;
        float _1101 = fma(_171, _171, _1099);
        float _1103 = fma(_173, _173, _1101);
        float _1105 = rsqrt(_1025);
        float _1107 = sqrt(_1103);
        float _1109 = _1015 * _1105;
        float _1111 = _1011 * _1105;
        float _1113 = _1019 * _1105;
        bool _1115 = _1107 > 0.0;
        float _1117 = _1105;
        float _1119 = _1107;
        _921 = _1103;
        if (!_1115)
        {
            _1117 = _1003;
        }
        float _1121 = _1117;
        _1085 = _1121;
        if (!_1115)
        {
            _1119 = _1001;
        }
        float _1123 = _1119;
        _1089 = _1123;
        if (!_1115)
        {
            _1095 = _1005;
        }
        float _1125 = _1095;
        bool _1127 = !_1115;
        _1097 = _1125;
        if (!_1127)
        {
            float _1129 = rsqrt(_1103);
            float _1131 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1133 = _169 * _1129;
            float _1135 = _171 * _1129;
            float _1137 = _1111 * _1133;
            float _1139 = _173 * _1129;
            float _1141 = fma(_1109, _1135, _1137);
            float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1145 = fma(_1113, _1139, _1141);
            float _1147 = _1145 * _1143;
            float _1149 = fma(_171, _1147, _1003);
            float _1151 = fma(_169, _1147, _1001);
            float _1153 = fma(_173, _1147, _1005);
            _921 = _1129;
            _1097 = _1153;
            _1085 = _1149;
            _1089 = _1151;
            _1079 = _1147;
        }
    }
    float _1155 = _921;
    float _1157 = _1097;
    float _1159 = _1085;
    float _1161 = _1089;
    float _1163 = _1079;
    float _1165 = _1161;
    float _1167 = _1159;
    float _1169 = _1157;
    float _1171 = _1163;
    float _1173 = _1155;
    if (_1067)
    {
        _177 = 1.0;
    }
    float _1175 = _177;
    float _1177 = _1175;
    if (!_1051)
    {
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1181 = _743 + _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1185 = _645 + _1183;
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1189 = -_647;
        float _1191 = _1189 + _1157;
        float _1193 = _1181 * _1181;
        float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1197 = _647 + _1195;
        float _1199 = fma(_1185, _1185, _1193);
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1203 = fma(_1197, _1197, _1199);
        float _1205 = sqrt(_1203);
        float _1207 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1209 = precise::min(_1205, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1211 = _1209 * _1201;
        float _1213 = -_645;
        float _1215 = _1213 + _1159;
        float _1217 = _1207 * _1211;
        float _1219 = -_743;
        float _1221 = _1219 + _1161;
        float _1223 = fma(_1215, _1217, _645);
        float _1225 = fma(_1221, _1217, _743);
        float _1227 = fma(_1191, _1217, _647);
        _1165 = _1225;
        _1167 = _1223;
        _1169 = _1227;
        _1171 = _1217;
        _1173 = _1221;
    }
    float _1229 = _1165;
    float _1231 = _1167;
    float _1233 = _1169;
    float _1235 = _1171;
    float _1237 = _1173;
    float _1239 = _1237;
    float _1241 = _1235;
    if (!_1067)
    {
        float _1243 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1247 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1245);
        float _1249 = _1243 * 0.15915493667125701904296875;
        float _1251 = _1249 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1257 = _1255 * 0.15915493667125701904296875;
        float _1259 = _1249 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = 1.0 / _1253;
        float _1265 = _1257 * 6.283185482025146484375;
        float _1267 = cos(_1265);
        float _1269 = _1261 * _1263;
        float _1271 = 1.0 / _1247;
        float _1273 = _1267 * _1269;
        float _1275 = _1257 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1281 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1279;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1285 = _1271 * _1283;
        float _1287 = 1.0 / _1273;
        float _1289 = 1.0 / _1281;
        float _1291 = _1277 * _1287;
        float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1295 = fma(_1291, _1285, _1293);
        float _1297 = _1295 * _1289;
        float _1299 = precise::clamp(_1297, 0.0, 1.0);
        _1081 = _1271;
        _1239 = _1289;
        _1177 = _1299;
    }
    float _1301 = _1081;
    float _1303 = _1239;
    float _1305 = _1177;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1229 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1313 = _1231 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1317 = _1233 + _1315;
    float _1319 = _1309 * _1309;
    float _1321 = fma(_1313, _1313, _1319);
    float _1323 = fma(_1317, _1317, _1321);
    float _1325 = rsqrt(_1323);
    float _1327 = sqrt(_1323);
    float _1329 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1331 = _1313 * _1329;
    float _1333 = _1317 * _1329;
    float _1335 = _1331 * _1331;
    float _1337 = _1333 * _1333;
    float _1339 = _1335 + _1337;
    float _1341 = sqrt(_1339);
    bool _1343 = _1341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1341 + _1345;
    float _1349 = _1325;
    float _1351 = _1301;
    float _1353 = _1347;
    float _1355 = _1309;
    float _1357 = _1303;
    float _1359 = _1331;
    if (_1343)
    {
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1361;
    }
    float _1363 = _1349;
    if (_1343)
    {
        float _1365 = rsqrt(_1339);
        _1351 = _1365;
    }
    float _1367 = _1351;
    float _1369 = _1367;
    if (_1343)
    {
        float _1371 = _1347 * _1363;
        _1353 = _1371;
    }
    float _1373 = _1353;
    if (_1343)
    {
        float _1375 = _1373 * 0.15915493667125701904296875;
        _1241 = _1375;
    }
    float _1377 = _1241;
    float _1379 = _1363;
    if (_1343)
    {
        float _1381 = _1377 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        _1379 = _1383;
    }
    float _1385 = _1379;
    float _1387 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1389 = precise::max(0.0, _1387);
    float _1391 = _1317;
    float _1393 = _1389;
    if (_1343)
    {
        float _1395 = _1377 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        _1391 = _1397;
    }
    float _1399 = _1391;
    float _1401 = -_1329;
    float _1403 = -_1389;
    float _1405 = fma(_1309, _1401, _1403);
    if (!_1343)
    {
        _1355 = _1333;
    }
    float _1407 = _1355;
    float _1409 = _1407;
    if (_1343)
    {
        float _1411 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1393 = _1411;
    }
    float _1413 = _1393;
    float _1415 = _1385;
    float _1417 = _1413;
    if (_1343)
    {
        float _1419 = fma(_1385, _1413, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1357 = _1419;
    }
    float _1421 = _1357;
    float _1423 = _1421;
    if (!_1343)
    {
        _1415 = _1405;
    }
    float _1425 = _1415;
    float _1427 = _1425;
    float _1429 = _1399;
    if (_1343)
    {
        float _1431 = _1399 + (-1.0);
        _1417 = _1431;
    }
    float _1433 = _1417;
    float _1435 = _1433;
    if (_1343)
    {
        float _1437 = _1367 * _1421;
        _1423 = _1437;
    }
    float _1439 = _1423;
    if (_1343)
    {
        float _1441 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1441;
    }
    float _1443 = _1369;
    if (_1343)
    {
        float _1445 = _1331 * _1439;
        _1359 = _1445;
    }
    float _1447 = _1359;
    if (!_1343)
    {
        _1435 = _1335;
    }
    float _1449 = _1435;
    float _1451 = _1449;
    if (_1343)
    {
        float _1453 = _1333 * _1439;
        _1409 = _1453;
    }
    float _1455 = _1409;
    if (_1343)
    {
        float _1457 = fma(_1405, _1399, _1443);
        _1427 = _1457;
    }
    float _1459 = _1427;
    if (_1343)
    {
        float _1461 = _1447 * _1447;
        _1451 = _1461;
    }
    float _1463 = _1451;
    if (!_1343)
    {
        _1429 = _1337;
    }
    float _1465 = _1429;
    float _1467 = _1465;
    if (_1343)
    {
        float _1469 = _1455 * _1455;
        _1467 = _1469;
    }
    float _1471 = _1467;
    float _1473 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1475 = fma(_1459, _1459, _1463);
    float _1477 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1479 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1473);
    float _1481 = _1475 + _1471;
    float _1483 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1487 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1485);
    float _1489 = precise::clamp(_1487, 0.0, 1.0);
    float _1491 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1479);
    float _1493 = rsqrt(_1481);
    float _1495 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1483);
    float _1503 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1505 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1507 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1477);
    float _1509 = abs(_1499);
    float _1511 = log2(_1509);
    float _1513 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1501);
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1517 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1519 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1505);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1523 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1525 = -_1517;
    float _1527 = fma(_1525, _1515, 1.0);
    float _1529 = _1493 * _1447;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1533 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1535 = _1493 * _1459;
    float _1537 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1539 = _1493 * _1455;
    float _1541 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1533);
    float _1543 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1545 = -_1537;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1545);
    float _1549 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1551 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1541);
    float _1553 = log2(_1527);
    float _1555 = -_1539;
    float _1557 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1547);
    float _1559 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1561 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1551);
    float _1563 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1565 = fma(_1557, -0.5, 0.5);
    float _1567 = fma(_1557, 0.5, 0.5);
    float _1569 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1559);
    float _1571 = exp2(_1549);
    float _1573 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1563);
    float _1575 = _1535 + 1.0;
    float _1577 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1569);
    float _1579 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1581 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1583 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1577);
    float _1585 = 1.0 / _1561;
    float _1587 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1581);
    float _1589 = fma(_1567, _1579, -0.212114393711090087890625);
    float _1591 = fma(_1567, _1589, 1.570728778839111328125);
    float _1593 = sqrt(_1565);
    float _1595 = -_1535;
    float _1597 = fma(_1571, _1575, _1595);
    float _1599 = _1553 * 0.693147182464599609375;
    float _1601 = fma(_1597, 0.5, 0.5);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1583 * _1585;
    float _1607 = _1587 * _1585;
    float _1609 = fma(_1605, 0.5, 0.5);
    float _1611 = fma(_1607, -0.5, 0.5);
    float _1613 = _1593 * 0.636619746685028076171875;
    float3 _4592 = float3(_1609, _1611, _1603);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4592, float3(0.0), isnan(_4592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4592, float3(0.0), isnan(_4592)), level(0.0)).x;
    float3 _4603 = float3(_1609, _1611, _1603);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4603, float3(0.0), isnan(_4603)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4603, float3(0.0), isnan(_4603)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float _1628 = -_1591;
    float _1630 = fma(_1613, _1628, 1.0);
    float2 _4625 = float2(_1630, _1601);
    float3 _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4625, float2(0.0), isnan(_4625)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4625, float2(0.0), isnan(_4625)), level(0.0)).xyz;
    float _1636 = _1634.x;
    float _1638 = _1634.y;
    float _1640 = _1634.z;
    float _1642 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1644 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1646 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1648 = isnan(_1327);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1654 = _1650 || _1652;
    float _1656 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1644);
    float _1658 = exp2(_1642);
    float _1660 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1656);
    float _1662 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1664 = _1662 + _1561;
    out.gl_Position.x = _1583;
    out.gl_Position.y = _1587;
    out.gl_Position.z = _1662;
    out.gl_Position.w = _1561;
    float _1666 = _1664 * 0.5;
    float _1668 = -_1658;
    float _1670 = _1668 + 1.0;
    float _1672 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1666;
    out.m_70.w = _1561;
    float _1674 = _1561;
    float _1676 = _1662;
    float _1678 = _1587;
    float _1680 = _1666;
    float _1682 = _1583;
    if (!_1654)
    {
        _1674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1684 = _1674;
    float _1686 = _1684;
    float _1688 = _1684;
    if (!_1654)
    {
        _1676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1690 = _1676;
    float _1692 = _1690;
    float _1694 = _1690;
    if (!_1654)
    {
        _1678 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1696 = _1678;
    float _1698 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1700 = _1696;
    float _1702 = _1696;
    if (!_1654)
    {
        _1680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1704 = _1680;
    float _1706 = _1704;
    float _1708 = _1704;
    if (!_1654)
    {
        _1682 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1710 = _1682;
    float _1712 = _1672 * _1615;
    float _1714 = -_1672;
    float _1716 = _1714 + 1.0;
    float _1718 = _1626 * _1712;
    float _1720 = _1626 * _1716;
    float _1722 = _1640 * _1712;
    float _1724 = fma(_1636, _1718, _1620);
    float _1726 = fma(_1638, _1718, _1622);
    float _1728 = _1718;
    float _1730 = _1710;
    float _1732 = _1710;
    if (!_1654)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1734 = _1728;
    float _1736 = fma(_1626, _1722, _1624);
    out.m_72.x = _1724;
    out.m_72.y = _1726;
    out.m_72.z = _1736;
    out.m_72.w = _1720;
    bool _1738 = !_1654;
    float _1740 = _1734;
    float _1742 = _1734;
    if (!_1738)
    {
        bool _1744 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1746 = isnan(_1327);
        bool _1748 = _1744 || _1746;
        bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1752 = _1748 || _1750;
        if (!_1752)
        {
            float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1756 = _1327 + _1754;
            float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1760 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1766 = 1.0 / _1760;
            float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1778 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1784 = _1756 * _1766;
            float _1786 = precise::clamp(_1784, 0.0, 1.0);
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1792 = fma(_1786, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1794 = fma(_1786, _1790, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1796 = fma(_1786, _1770, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1798 = fma(_1786, _1774, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1800 = fma(_1786, _1778, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1802 = fma(_1786, _1782, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1708 = _1796;
            _1702 = _1800;
            _1742 = _1792;
            _1694 = _1798;
            _1688 = _1794;
            _1732 = _1802;
            _1804 = true;
        }
        else
        {
            bool _1806 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1808 = isnan(_1327);
            bool _1810 = _1806 || _1808;
            bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1814 = _1810 || _1812;
            if (!_1814)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1816 = _1740;
            _1742 = _1816;
            if (!_1814)
            {
                _1706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1818 = _1706;
            _1708 = _1818;
            if (!_1814)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1820 = _1686;
            _1688 = _1820;
            if (!_1814)
            {
                _1692 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1822 = _1692;
            _1694 = _1822;
            if (!_1814)
            {
                _1700 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1824 = _1700;
            _1702 = _1824;
            if (!_1814)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1826 = _1730;
            bool _1828 = !_1814;
            _1732 = _1826;
            if (!_1828)
            {
                bool _1830 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1832 = isnan(_1327);
                bool _1834 = _1830 || _1832;
                bool _1836 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1838 = _1834 || _1836;
                if (!_1838)
                {
                    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1842 = _1327 + _1840;
                    float _1844 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1846 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1844;
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1850 = _1848 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1852 = 1.0 / _1846;
                    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1870 = _1842 * _1852;
                    float _1872 = precise::clamp(_1870, 0.0, 1.0);
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1878 = fma(_1872, _1850, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1880 = fma(_1872, _1876, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1882 = fma(_1872, _1856, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1884 = fma(_1872, _1860, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1886 = fma(_1872, _1864, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1888 = fma(_1872, _1868, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1708 = _1882;
                    _1702 = _1886;
                    _1742 = _1878;
                    _1694 = _1884;
                    _1688 = _1880;
                    _1732 = _1888;
                    _1804 = true;
                }
                else
                {
                    _1708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1702 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1694 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1804 = false;
    float _1890 = _1708;
    float _1892 = _1702;
    float _1894 = _1742;
    float _1896 = _1694;
    float _1898 = _1688;
    float _1900 = _1732;
    float _1902 = fma(_897, -0.5, 0.5);
    float _1904 = precise::clamp(_1902, 0.0, 1.0);
    float _1906 = -_1890;
    float _1908 = _1906 + _1892;
    float _1910 = _1698 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1912 = -_1894;
    float _1914 = _1912 + _1896;
    float _1916 = fma(_1904, _1908, _1890);
    out.m_74.x = 0.0;
    float _1918 = -_1898;
    float _1920 = _1918 + _1900;
    float _1922 = fma(_1904, _1914, _1894);
    float _1924 = _1916 * 0.586610972881317138671875;
    out.m_49.x = _1910;
    bool _1926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1928 = fma(_1904, _1920, _1898);
    float _1930 = fma(_1922, 0.298911988735198974609375, _1924);
    bool _1932 = _1305 > 0.0;
    bool _1934 = isnan(_1305);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan(0.0);
    bool _1940 = _1936 || _1938;
    float _1942 = fma(_1928, 0.114477999508380889892578125, _1930);
    float _1944 = -_1942;
    float _1946 = _1922 + _1944;
    float _1948 = -_1942;
    float _1950 = _1916 + _1948;
    float _1952 = -_1942;
    float _1954 = _1928 + _1952;
    float _1956 = fma(_1946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    float _1958 = fma(_1950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    float _1960 = fma(_1954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    bool _1962 = !_1926;
    if (!_1962)
    {
        float _1964 = -_1229;
        float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1968 = -_1231;
        float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1972 = -_1233;
        float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1976 = _1966 * _1966;
        float _1978 = fma(_1970, _1970, _1976);
        float _1980 = fma(_1974, _1974, _1978);
        float _1982 = sqrt(_1980);
        float _1984 = rsqrt(_1980);
        float _1986 = -_1982;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1992 = precise::clamp(_1990, 0.0, 1.0);
        float _1994 = _1970 * _1984;
        float _1996 = _1966 * _1984;
        float _1998 = abs(_1992);
        float _2000 = log2(_1998);
        float _2002 = _1974 * _1984;
        float _2004 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2006 = _897 * _1996;
        float _2008 = -_1996;
        float _2010 = -_2004;
        float _2012 = fma(_2008, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2010);
        float _2014 = fma(_903, _1994, _2006);
        float _2016 = -_2002;
        float _2018 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2012);
        float _2020 = fma(_909, _2002, _2014);
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2026 = _2018 + _2024;
        float _2028 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        float _2034 = exp2(_2028);
        float _2036 = _2034 * _2032;
        float _2038 = _2022 * _2036;
        float _2040 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2044 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _2040;
        out.m_74.y = _2042;
        out.m_74.z = _2044;
    }
    out.m_76.x = _1956;
    out.m_76.y = _1958;
    out.m_76.z = _1960;
    if (_1940)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2046;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1804 = false;
    bool _957 = false;
    bool _527 = false;
    bool _391 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _105 = 0;
    if (!_99)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2102 = as_type<float>(_109);
        out.gl_Position.z = _2102;
    }
    if (!_99)
    {
        return out;
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_95);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2171 = as_type<float>(_147);
        out.gl_Position.z = _2171;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_53.x;
    float _151 = in.m_53.y;
    float _153 = in.m_53.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _177 = _171;
    float _195;
    if (!_175)
    {
        float _179 = in.m_55.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_95);
        float _201 = 1.0 / _199;
        float _203 = _127 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _205 + _211;
    bool _215 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _217 = isnan(_205);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _205 + _239;
    float _243 = 1.0 / _229;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _237;
    float _249 = 1.0 / _233;
    float _251 = _209 * _243;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -_225;
    float _267 = _265 + 1.0;
    float _269 = _263 * _267;
    float _271 = _213 * _247;
    bool _273 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_205);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _241 * _249;
    bool _295 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_205);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = _283 * _287;
    float _313 = -_283;
    float _315 = _313 + 1.0;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = fma(_309, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = _305 * _315;
    float _329 = fma(_319, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = fma(_291, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_323, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = -_305;
    float _337 = _335 + 1.0;
    float _339 = _325 * _327;
    float _341 = _329 * _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _353 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _355 = fma(_345, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_349, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_331, _311, _351);
    float _361 = fma(_333, _311, _353);
    float _363 = fma(_355, _269, _359);
    float _365 = fma(_357, _269, _361);
    float _367 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[146].x, _363);
    float _369 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[146].y, _365);
    bool _371 = !_245;
    float _389;
    if (!_371)
    {
        float _373 = in.m_55.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_95);
        float _395 = 1.0 / _393;
        float _397 = _127 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -_415;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _437;
    float _441 = 1.0 / _419;
    bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _445 = _431 * _435;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = _403 * _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _453;
    float _457 = fma(_439, _451, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _459;
    float _463 = fma(_455, _451, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _465 = fma(_461, _451, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _467 = _457 * _445;
    float _469 = _463 * _445;
    float _471 = _465 * _445;
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].x, _467);
    float _475 = in.m_57.x;
    float _477 = in.m_57.y;
    float _479 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].y, _471);
    float _481 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].x, _473);
    float _485 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].y, _479);
    float _487 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].z, _481);
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _497;
    out.m_59.y = _499;
    out.m_59.z = _501;
    out.m_59.w = _495;
    float _503 = _369 * _477;
    float _505 = _367 * _475;
    bool _507 = !_443;
    float _525;
    if (!_507)
    {
        float _509 = in.m_55.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_95);
        float _531 = 1.0 / _529;
        float _533 = _127 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = as_type<float>(int(gl_VertexIndex));
    float _539 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = in.m_55.x;
    float _543 = in.m_55.y;
    float _545 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _547 = in.m_46.x;
    float _549 = in.m_46.y;
    float _551 = in.m_46.z;
    int _553 = as_type<int>(_537) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_537) & 2;
    bool _559 = _557 != 0;
    float _561 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _563 = _543 > 0.5;
    bool _565 = !_559;
    float _567 = _565 ? (-0.5) : 0.5;
    bool _569 = !_555;
    float _571 = _569 ? (-0.5) : 0.5;
    bool _573 = _541 > 0.5;
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _567);
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    float _581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _571);
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _585 = _583 != 0;
    float _587 = _561 * _575;
    float _589 = _549 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _591 = _539 * _581;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _593;
    float _597 = _549 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _599 = _587 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _601 = _549 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _603 = _587 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].x, _589);
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[24].x, _599);
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _611 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _613 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _615 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _617 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].z, _609);
    float _619 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[26].z, _611);
    float _621 = 1.0 / _595;
    float _623 = _615 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _625 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].x, _597);
    float _627 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _629 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _631 = isnan(_535);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _587 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _643 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[5].z, _625);
    float _645 = _613 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _647 = _617 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _651 = _535 + _649;
    float _653 = -_639;
    float _655 = _653 + 1.0;
    float _657 = _645 + _623;
    float _659 = _647 + _627;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _661;
    float _665 = _651 * _621;
    float _667 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _669 = _657 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _673 = _659 + _671;
    float _675 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[25].x, _641);
    float _677 = _669 * _669;
    float _679 = _673 * _673;
    bool _681 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _683 = isnan(_535);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _693;
    float _697 = _677 + _679;
    float _699 = fma(_663, _665, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _701 = _691 * _655;
    float _703 = fma(_695, _665, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _705 = sqrt(_697);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _707;
    float _711 = _699 * _701;
    float _713 = _703 * _701;
    float _715 = -_567;
    int _717 = _563 ? as_type<int>(_715) : as_type<int>(_567);
    float _719 = fma(_709, _665, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _721 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[25].z, _675);
    bool _723 = !_585;
    float _725 = _723 ? _567 : as_type<float>(_717);
    float _727 = _719 * _701;
    float _729 = -_571;
    int _731 = _573 ? as_type<int>(_729) : as_type<int>(_571);
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _735 = _567 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _737 = _571 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _739 = !_579;
    float _741 = _739 ? _571 : as_type<float>(_731);
    float _743 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _745 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _747 = _721 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _749 = _735 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _735 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _755 = _743 + _747;
    float _757 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].x, _749);
    float _759 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].x, _753);
    float _763 = _753;
    float _765 = _751;
    float _767 = _643;
    float _769 = _659;
    float _771 = _657;
    float _773 = _761;
    if (!_745)
    {
        _763 = _659;
    }
    float _775 = _763;
    float _777 = _775;
    if (!_745)
    {
        _765 = _679;
    }
    float _779 = _765;
    float _781 = _779;
    if (!_745)
    {
        _767 = _677;
    }
    float _783 = _767;
    float _785 = _783;
    if (!_745)
    {
        _769 = _755;
    }
    float _787 = _769;
    bool _789 = !_745;
    float _791 = _787;
    if (!_789)
    {
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _797 = _705 + _795;
        float _799 = _755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _801 = rsqrt(_697);
        float _803 = _797 * _793;
        float _805 = _803 * 0.15915493667125701904296875;
        float _807 = _805 * 6.283185482025146484375;
        float _809 = sin(_807);
        float _811 = _805 * 6.283185482025146484375;
        float _813 = cos(_811);
        float _815 = fma(_809, _799, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _817 = _801 * _815;
        float _819 = _813 + (-1.0);
        float _821 = fma(_669, _817, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _823 = fma(_673, _817, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _825 = _819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _829 = _821 + _827;
        float _831 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _833 = _823 + _831;
        float _835 = fma(_755, _813, _825);
        float _837 = _829 * _829;
        float _839 = _833 * _833;
        _791 = _835;
        _785 = _837;
        _781 = _839;
        _771 = _821;
        _777 = _823;
    }
    float _841 = _791;
    float _843 = _785;
    float _845 = _781;
    float _847 = _771;
    float _849 = _777;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _853 = _841 + _851;
    float _855 = -_691;
    float _857 = _855 + 1.0;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _861 = _741 + 0.5;
    float _863 = fma(_853, _853, _843);
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].y, _727);
    float _867 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].x, _711);
    float _869 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].z, _713);
    float _871 = _863 + _845;
    float _873 = _861 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _875 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].y, _865);
    float _877 = -_725;
    float _879 = _877 + 0.5;
    float _881 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].x, _867);
    float _883 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].z, _869);
    float _885 = _873 * _733;
    float _887 = sqrt(_871);
    float _889 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _897 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _899 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _891 * _859;
    float _903 = _757 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _761 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_64.x = _885;
    out.m_64.y = _901;
    out.m_66.x = _905;
    out.m_66.y = _899;
    out.m_66.z = _907;
    bool _911 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _913 = isnan(_887);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _919 = _915 || _917;
    out.m_68.x = _903;
    out.m_68.y = _897;
    out.m_68.z = _909;
    float _921 = _907;
    if (!_919)
    {
        _773 = 1.0;
    }
    float _923 = _773;
    bool _925 = !_919;
    float _927 = _923;
    if (!_925)
    {
        bool _929 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _931 = isnan(_887);
        bool _933 = _929 || _931;
        bool _935 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _937 = _933 || _935;
        if (!_937)
        {
            float _939 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _941 = _887 + _939;
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _945 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _943;
            float _947 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _949 = _947 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _951 = 1.0 / _945;
            float _953 = _941 * _951;
            float _955 = fma(_953, _949, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _927 = _955;
            _957 = true;
        }
        else
        {
            bool _959 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _961 = isnan(_887);
            bool _963 = _959 || _961;
            bool _965 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _967 = _963 || _965;
            if (!_967)
            {
                float _969 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _971 = _887 + _969;
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _975 = _973 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _977 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _979 = _977 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _981 = 1.0 / _975;
                float _983 = _971 * _981;
                float _985 = fma(_983, _979, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _927 = _985;
                _957 = true;
            }
            else
            {
                _927 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _957 = false;
    float _987 = _927;
    float _989 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _991 = _841 + _989;
    float _993 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _995 = _847 + _993;
    float _997 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _999 = _849 + _997;
    float _1001 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1003 = fma(_995, _987, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1005 = fma(_999, _987, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1007 = _743 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1009 = -_743;
    float _1011 = _1009 + _1001;
    float _1013 = -_645;
    float _1015 = _1013 + _1003;
    float _1017 = -_647;
    float _1019 = _1017 + _1005;
    float _1021 = _1011 * _1011;
    float _1023 = fma(_1015, _1015, _1021);
    float _1025 = fma(_1019, _1019, _1023);
    float _1027 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1007);
    float _1029 = _743 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1031 = sqrt(_1025);
    float _1033 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1027);
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1037 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1029);
    float _1039 = 1.0 / _1035;
    float _1041 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1037);
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1055 = _1031 > 0.0;
    float _1057 = _1053 + _1035;
    bool _1059 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    float _1069 = _1057 * _1039;
    float _1071 = _1069 * 0.5;
    float _1073 = _1057;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1079 = _1035;
    float _1081 = _1071;
    if (!_1055)
    {
        _1073 = _1003;
    }
    float _1083 = _1073;
    float _1085 = _1083;
    if (!_1055)
    {
        _1075 = _1001;
    }
    float _1087 = _1075;
    float _1089 = _1087;
    if (!_1055)
    {
        _1077 = _1005;
    }
    float _1091 = _1077;
    bool _1093 = !_1055;
    float _1095 = _1091;
    float _1097 = _1091;
    if (!_1093)
    {
        float _1099 = _169 * _169;
        float _1101 = fma(_171, _171, _1099);
        float _1103 = fma(_173, _173, _1101);
        float _1105 = rsqrt(_1025);
        float _1107 = sqrt(_1103);
        float _1109 = _1015 * _1105;
        float _1111 = _1011 * _1105;
        float _1113 = _1019 * _1105;
        bool _1115 = _1107 > 0.0;
        float _1117 = _1105;
        float _1119 = _1107;
        _921 = _1103;
        if (!_1115)
        {
            _1117 = _1003;
        }
        float _1121 = _1117;
        _1085 = _1121;
        if (!_1115)
        {
            _1119 = _1001;
        }
        float _1123 = _1119;
        _1089 = _1123;
        if (!_1115)
        {
            _1095 = _1005;
        }
        float _1125 = _1095;
        bool _1127 = !_1115;
        _1097 = _1125;
        if (!_1127)
        {
            float _1129 = rsqrt(_1103);
            float _1131 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1133 = _169 * _1129;
            float _1135 = _171 * _1129;
            float _1137 = _1111 * _1133;
            float _1139 = _173 * _1129;
            float _1141 = fma(_1109, _1135, _1137);
            float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1145 = fma(_1113, _1139, _1141);
            float _1147 = _1145 * _1143;
            float _1149 = fma(_171, _1147, _1003);
            float _1151 = fma(_169, _1147, _1001);
            float _1153 = fma(_173, _1147, _1005);
            _921 = _1129;
            _1097 = _1153;
            _1085 = _1149;
            _1089 = _1151;
            _1079 = _1147;
        }
    }
    float _1155 = _921;
    float _1157 = _1097;
    float _1159 = _1085;
    float _1161 = _1089;
    float _1163 = _1079;
    float _1165 = _1161;
    float _1167 = _1159;
    float _1169 = _1157;
    float _1171 = _1163;
    float _1173 = _1155;
    if (_1067)
    {
        _177 = 1.0;
    }
    float _1175 = _177;
    float _1177 = _1175;
    if (!_1051)
    {
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1181 = _743 + _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1185 = _645 + _1183;
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1189 = -_647;
        float _1191 = _1189 + _1157;
        float _1193 = _1181 * _1181;
        float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1197 = _647 + _1195;
        float _1199 = fma(_1185, _1185, _1193);
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1203 = fma(_1197, _1197, _1199);
        float _1205 = sqrt(_1203);
        float _1207 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1209 = precise::min(_1205, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1211 = _1209 * _1201;
        float _1213 = -_645;
        float _1215 = _1213 + _1159;
        float _1217 = _1207 * _1211;
        float _1219 = -_743;
        float _1221 = _1219 + _1161;
        float _1223 = fma(_1215, _1217, _645);
        float _1225 = fma(_1221, _1217, _743);
        float _1227 = fma(_1191, _1217, _647);
        _1165 = _1225;
        _1167 = _1223;
        _1169 = _1227;
        _1171 = _1217;
        _1173 = _1221;
    }
    float _1229 = _1165;
    float _1231 = _1167;
    float _1233 = _1169;
    float _1235 = _1171;
    float _1237 = _1173;
    float _1239 = _1237;
    float _1241 = _1235;
    if (!_1067)
    {
        float _1243 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1247 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1245);
        float _1249 = _1243 * 0.15915493667125701904296875;
        float _1251 = _1249 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1257 = _1255 * 0.15915493667125701904296875;
        float _1259 = _1249 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = 1.0 / _1253;
        float _1265 = _1257 * 6.283185482025146484375;
        float _1267 = cos(_1265);
        float _1269 = _1261 * _1263;
        float _1271 = 1.0 / _1247;
        float _1273 = _1267 * _1269;
        float _1275 = _1257 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1281 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1279;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1285 = _1271 * _1283;
        float _1287 = 1.0 / _1273;
        float _1289 = 1.0 / _1281;
        float _1291 = _1277 * _1287;
        float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1295 = fma(_1291, _1285, _1293);
        float _1297 = _1295 * _1289;
        float _1299 = precise::clamp(_1297, 0.0, 1.0);
        _1081 = _1271;
        _1239 = _1289;
        _1177 = _1299;
    }
    float _1301 = _1081;
    float _1303 = _1239;
    float _1305 = _1177;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1229 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1313 = _1231 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1317 = _1233 + _1315;
    float _1319 = _1309 * _1309;
    float _1321 = fma(_1313, _1313, _1319);
    float _1323 = fma(_1317, _1317, _1321);
    float _1325 = rsqrt(_1323);
    float _1327 = sqrt(_1323);
    float _1329 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1331 = _1313 * _1329;
    float _1333 = _1317 * _1329;
    float _1335 = _1331 * _1331;
    float _1337 = _1333 * _1333;
    float _1339 = _1335 + _1337;
    float _1341 = sqrt(_1339);
    bool _1343 = _1341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1341 + _1345;
    float _1349 = _1325;
    float _1351 = _1301;
    float _1353 = _1347;
    float _1355 = _1309;
    float _1357 = _1303;
    float _1359 = _1331;
    if (_1343)
    {
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1361;
    }
    float _1363 = _1349;
    if (_1343)
    {
        float _1365 = rsqrt(_1339);
        _1351 = _1365;
    }
    float _1367 = _1351;
    float _1369 = _1367;
    if (_1343)
    {
        float _1371 = _1347 * _1363;
        _1353 = _1371;
    }
    float _1373 = _1353;
    if (_1343)
    {
        float _1375 = _1373 * 0.15915493667125701904296875;
        _1241 = _1375;
    }
    float _1377 = _1241;
    float _1379 = _1363;
    if (_1343)
    {
        float _1381 = _1377 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        _1379 = _1383;
    }
    float _1385 = _1379;
    float _1387 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1389 = precise::max(0.0, _1387);
    float _1391 = _1317;
    float _1393 = _1389;
    if (_1343)
    {
        float _1395 = _1377 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        _1391 = _1397;
    }
    float _1399 = _1391;
    float _1401 = -_1329;
    float _1403 = -_1389;
    float _1405 = fma(_1309, _1401, _1403);
    if (!_1343)
    {
        _1355 = _1333;
    }
    float _1407 = _1355;
    float _1409 = _1407;
    if (_1343)
    {
        float _1411 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1393 = _1411;
    }
    float _1413 = _1393;
    float _1415 = _1385;
    float _1417 = _1413;
    if (_1343)
    {
        float _1419 = fma(_1385, _1413, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1357 = _1419;
    }
    float _1421 = _1357;
    float _1423 = _1421;
    if (!_1343)
    {
        _1415 = _1405;
    }
    float _1425 = _1415;
    float _1427 = _1425;
    float _1429 = _1399;
    if (_1343)
    {
        float _1431 = _1399 + (-1.0);
        _1417 = _1431;
    }
    float _1433 = _1417;
    float _1435 = _1433;
    if (_1343)
    {
        float _1437 = _1367 * _1421;
        _1423 = _1437;
    }
    float _1439 = _1423;
    if (_1343)
    {
        float _1441 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1441;
    }
    float _1443 = _1369;
    if (_1343)
    {
        float _1445 = _1331 * _1439;
        _1359 = _1445;
    }
    float _1447 = _1359;
    if (!_1343)
    {
        _1435 = _1335;
    }
    float _1449 = _1435;
    float _1451 = _1449;
    if (_1343)
    {
        float _1453 = _1333 * _1439;
        _1409 = _1453;
    }
    float _1455 = _1409;
    if (_1343)
    {
        float _1457 = fma(_1405, _1399, _1443);
        _1427 = _1457;
    }
    float _1459 = _1427;
    if (_1343)
    {
        float _1461 = _1447 * _1447;
        _1451 = _1461;
    }
    float _1463 = _1451;
    if (!_1343)
    {
        _1429 = _1337;
    }
    float _1465 = _1429;
    float _1467 = _1465;
    if (_1343)
    {
        float _1469 = _1455 * _1455;
        _1467 = _1469;
    }
    float _1471 = _1467;
    float _1473 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1475 = fma(_1459, _1459, _1463);
    float _1477 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1479 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1473);
    float _1481 = _1475 + _1471;
    float _1483 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1487 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1485);
    float _1489 = precise::clamp(_1487, 0.0, 1.0);
    float _1491 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1479);
    float _1493 = rsqrt(_1481);
    float _1495 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1483);
    float _1503 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1505 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1507 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1477);
    float _1509 = abs(_1499);
    float _1511 = log2(_1509);
    float _1513 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1501);
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1517 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1519 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1505);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1523 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1525 = -_1517;
    float _1527 = fma(_1525, _1515, 1.0);
    float _1529 = _1493 * _1447;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1533 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1535 = _1493 * _1459;
    float _1537 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1539 = _1493 * _1455;
    float _1541 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1533);
    float _1543 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1545 = -_1537;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1545);
    float _1549 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1551 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1541);
    float _1553 = log2(_1527);
    float _1555 = -_1539;
    float _1557 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1547);
    float _1559 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1561 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1551);
    float _1563 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1565 = fma(_1557, -0.5, 0.5);
    float _1567 = fma(_1557, 0.5, 0.5);
    float _1569 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1559);
    float _1571 = exp2(_1549);
    float _1573 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1563);
    float _1575 = _1535 + 1.0;
    float _1577 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1569);
    float _1579 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1581 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1583 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1577);
    float _1585 = 1.0 / _1561;
    float _1587 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1581);
    float _1589 = fma(_1567, _1579, -0.212114393711090087890625);
    float _1591 = fma(_1567, _1589, 1.570728778839111328125);
    float _1593 = sqrt(_1565);
    float _1595 = -_1535;
    float _1597 = fma(_1571, _1575, _1595);
    float _1599 = _1553 * 0.693147182464599609375;
    float _1601 = fma(_1597, 0.5, 0.5);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1583 * _1585;
    float _1607 = _1587 * _1585;
    float _1609 = fma(_1605, 0.5, 0.5);
    float _1611 = fma(_1607, -0.5, 0.5);
    float _1613 = _1593 * 0.636619746685028076171875;
    float3 _4592 = float3(_1609, _1611, _1603);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4592, float3(0.0), isnan(_4592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4592, float3(0.0), isnan(_4592)), level(0.0)).x;
    float3 _4603 = float3(_1609, _1611, _1603);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4603, float3(0.0), isnan(_4603)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4603, float3(0.0), isnan(_4603)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float _1628 = -_1591;
    float _1630 = fma(_1613, _1628, 1.0);
    float2 _4625 = float2(_1630, _1601);
    float3 _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4625, float2(0.0), isnan(_4625)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4625, float2(0.0), isnan(_4625)), level(0.0)).xyz;
    float _1636 = _1634.x;
    float _1638 = _1634.y;
    float _1640 = _1634.z;
    float _1642 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1644 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1646 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1648 = isnan(_1327);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1654 = _1650 || _1652;
    float _1656 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1644);
    float _1658 = exp2(_1642);
    float _1660 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1656);
    float _1662 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1664 = _1662 + _1561;
    out.gl_Position.x = _1583;
    out.gl_Position.y = _1587;
    out.gl_Position.z = _1662;
    out.gl_Position.w = _1561;
    float _1666 = _1664 * 0.5;
    float _1668 = -_1658;
    float _1670 = _1668 + 1.0;
    float _1672 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1666;
    out.m_70.w = _1561;
    float _1674 = _1561;
    float _1676 = _1662;
    float _1678 = _1587;
    float _1680 = _1666;
    float _1682 = _1583;
    if (!_1654)
    {
        _1674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1684 = _1674;
    float _1686 = _1684;
    float _1688 = _1684;
    if (!_1654)
    {
        _1676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1690 = _1676;
    float _1692 = _1690;
    float _1694 = _1690;
    if (!_1654)
    {
        _1678 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1696 = _1678;
    float _1698 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1700 = _1696;
    float _1702 = _1696;
    if (!_1654)
    {
        _1680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1704 = _1680;
    float _1706 = _1704;
    float _1708 = _1704;
    if (!_1654)
    {
        _1682 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1710 = _1682;
    float _1712 = _1672 * _1615;
    float _1714 = -_1672;
    float _1716 = _1714 + 1.0;
    float _1718 = _1626 * _1712;
    float _1720 = _1626 * _1716;
    float _1722 = _1640 * _1712;
    float _1724 = fma(_1636, _1718, _1620);
    float _1726 = fma(_1638, _1718, _1622);
    float _1728 = _1718;
    float _1730 = _1710;
    float _1732 = _1710;
    if (!_1654)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1734 = _1728;
    float _1736 = fma(_1626, _1722, _1624);
    out.m_72.x = _1724;
    out.m_72.y = _1726;
    out.m_72.z = _1736;
    out.m_72.w = _1720;
    bool _1738 = !_1654;
    float _1740 = _1734;
    float _1742 = _1734;
    if (!_1738)
    {
        bool _1744 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1746 = isnan(_1327);
        bool _1748 = _1744 || _1746;
        bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1752 = _1748 || _1750;
        if (!_1752)
        {
            float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1756 = _1327 + _1754;
            float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1760 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1766 = 1.0 / _1760;
            float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1778 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1784 = _1756 * _1766;
            float _1786 = precise::clamp(_1784, 0.0, 1.0);
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1792 = fma(_1786, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1794 = fma(_1786, _1790, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1796 = fma(_1786, _1770, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1798 = fma(_1786, _1774, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1800 = fma(_1786, _1778, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1802 = fma(_1786, _1782, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1708 = _1796;
            _1702 = _1800;
            _1742 = _1792;
            _1694 = _1798;
            _1688 = _1794;
            _1732 = _1802;
            _1804 = true;
        }
        else
        {
            bool _1806 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1808 = isnan(_1327);
            bool _1810 = _1806 || _1808;
            bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1814 = _1810 || _1812;
            if (!_1814)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1816 = _1740;
            _1742 = _1816;
            if (!_1814)
            {
                _1706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1818 = _1706;
            _1708 = _1818;
            if (!_1814)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1820 = _1686;
            _1688 = _1820;
            if (!_1814)
            {
                _1692 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1822 = _1692;
            _1694 = _1822;
            if (!_1814)
            {
                _1700 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1824 = _1700;
            _1702 = _1824;
            if (!_1814)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1826 = _1730;
            bool _1828 = !_1814;
            _1732 = _1826;
            if (!_1828)
            {
                bool _1830 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1832 = isnan(_1327);
                bool _1834 = _1830 || _1832;
                bool _1836 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1838 = _1834 || _1836;
                if (!_1838)
                {
                    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1842 = _1327 + _1840;
                    float _1844 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1846 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1844;
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1850 = _1848 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1852 = 1.0 / _1846;
                    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1870 = _1842 * _1852;
                    float _1872 = precise::clamp(_1870, 0.0, 1.0);
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1878 = fma(_1872, _1850, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1880 = fma(_1872, _1876, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1882 = fma(_1872, _1856, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1884 = fma(_1872, _1860, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1886 = fma(_1872, _1864, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1888 = fma(_1872, _1868, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1708 = _1882;
                    _1702 = _1886;
                    _1742 = _1878;
                    _1694 = _1884;
                    _1688 = _1880;
                    _1732 = _1888;
                    _1804 = true;
                }
                else
                {
                    _1708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1702 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1694 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1804 = false;
    float _1890 = _1708;
    float _1892 = _1702;
    float _1894 = _1742;
    float _1896 = _1694;
    float _1898 = _1688;
    float _1900 = _1732;
    float _1902 = fma(_897, -0.5, 0.5);
    float _1904 = precise::clamp(_1902, 0.0, 1.0);
    float _1906 = -_1890;
    float _1908 = _1906 + _1892;
    float _1910 = _1698 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1912 = -_1894;
    float _1914 = _1912 + _1896;
    float _1916 = fma(_1904, _1908, _1890);
    out.m_74.x = 0.0;
    float _1918 = -_1898;
    float _1920 = _1918 + _1900;
    float _1922 = fma(_1904, _1914, _1894);
    float _1924 = _1916 * 0.586610972881317138671875;
    out.m_49.x = _1910;
    bool _1926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1928 = fma(_1904, _1920, _1898);
    float _1930 = fma(_1922, 0.298911988735198974609375, _1924);
    bool _1932 = _1305 > 0.0;
    bool _1934 = isnan(_1305);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan(0.0);
    bool _1940 = _1936 || _1938;
    float _1942 = fma(_1928, 0.114477999508380889892578125, _1930);
    float _1944 = -_1942;
    float _1946 = _1922 + _1944;
    float _1948 = -_1942;
    float _1950 = _1916 + _1948;
    float _1952 = -_1942;
    float _1954 = _1928 + _1952;
    float _1956 = fma(_1946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    float _1958 = fma(_1950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    float _1960 = fma(_1954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    bool _1962 = !_1926;
    if (!_1962)
    {
        float _1964 = -_1229;
        float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1968 = -_1231;
        float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1972 = -_1233;
        float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1976 = _1966 * _1966;
        float _1978 = fma(_1970, _1970, _1976);
        float _1980 = fma(_1974, _1974, _1978);
        float _1982 = sqrt(_1980);
        float _1984 = rsqrt(_1980);
        float _1986 = -_1982;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1992 = precise::clamp(_1990, 0.0, 1.0);
        float _1994 = _1970 * _1984;
        float _1996 = _1966 * _1984;
        float _1998 = abs(_1992);
        float _2000 = log2(_1998);
        float _2002 = _1974 * _1984;
        float _2004 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2006 = _897 * _1996;
        float _2008 = -_1996;
        float _2010 = -_2004;
        float _2012 = fma(_2008, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2010);
        float _2014 = fma(_903, _1994, _2006);
        float _2016 = -_2002;
        float _2018 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2012);
        float _2020 = fma(_909, _2002, _2014);
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2026 = _2018 + _2024;
        float _2028 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        float _2034 = exp2(_2028);
        float _2036 = _2034 * _2032;
        float _2038 = _2022 * _2036;
        float _2040 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2044 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _2040;
        out.m_74.y = _2042;
        out.m_74.z = _2044;
    }
    out.m_76.x = _1956;
    out.m_76.y = _1958;
    out.m_76.z = _1960;
    if (_1940)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2046;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1804 = false;
    bool _957 = false;
    bool _527 = false;
    bool _391 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _105 = 0;
    if (!_99)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2102 = as_type<float>(_109);
        out.gl_Position.z = _2102;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_95);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2171 = as_type<float>(_147);
        out.gl_Position.z = _2171;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_53.x;
    float _151 = in.m_53.y;
    float _153 = in.m_53.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _177 = _171;
    float _195;
    if (!_175)
    {
        float _179 = in.m_55.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_95);
        float _201 = 1.0 / _199;
        float _203 = _127 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _205 + _211;
    bool _215 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _217 = isnan(_205);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _205 + _239;
    float _243 = 1.0 / _229;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _247 = 1.0 / _237;
    float _249 = 1.0 / _233;
    float _251 = _209 * _243;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -_225;
    float _267 = _265 + 1.0;
    float _269 = _263 * _267;
    float _271 = _213 * _247;
    bool _273 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_205);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _241 * _249;
    bool _295 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_205);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = _283 * _287;
    float _313 = -_283;
    float _315 = _313 + 1.0;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = fma(_309, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = _305 * _315;
    float _329 = fma(_319, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = fma(_291, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _333 = fma(_323, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = -_305;
    float _337 = _335 + 1.0;
    float _339 = _325 * _327;
    float _341 = _329 * _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _353 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _355 = fma(_345, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_349, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_331, _311, _351);
    float _361 = fma(_333, _311, _353);
    float _363 = fma(_355, _269, _359);
    float _365 = fma(_357, _269, _361);
    float _367 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[146].x, _363);
    float _369 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[146].y, _365);
    bool _371 = !_245;
    float _389;
    if (!_371)
    {
        float _373 = in.m_55.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_95);
        float _395 = 1.0 / _393;
        float _397 = _127 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -_415;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _437;
    float _441 = 1.0 / _419;
    bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _445 = _431 * _435;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = _403 * _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _453;
    float _457 = fma(_439, _451, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _459;
    float _463 = fma(_455, _451, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _465 = fma(_461, _451, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _467 = _457 * _445;
    float _469 = _463 * _445;
    float _471 = _465 * _445;
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].x, _467);
    float _475 = in.m_57.x;
    float _477 = in.m_57.y;
    float _479 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].y, _471);
    float _481 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].x, _473);
    float _485 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].y, _479);
    float _487 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[108].z, _481);
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _497;
    out.m_59.y = _499;
    out.m_59.z = _501;
    out.m_59.w = _495;
    float _503 = _369 * _477;
    float _505 = _367 * _475;
    bool _507 = !_443;
    float _525;
    if (!_507)
    {
        float _509 = in.m_55.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_95);
        float _531 = 1.0 / _529;
        float _533 = _127 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = as_type<float>(int(gl_VertexIndex));
    float _539 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _541 = in.m_55.x;
    float _543 = in.m_55.y;
    float _545 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _547 = in.m_46.x;
    float _549 = in.m_46.y;
    float _551 = in.m_46.z;
    int _553 = as_type<int>(_537) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_537) & 2;
    bool _559 = _557 != 0;
    float _561 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _563 = _543 > 0.5;
    bool _565 = !_559;
    float _567 = _565 ? (-0.5) : 0.5;
    bool _569 = !_555;
    float _571 = _569 ? (-0.5) : 0.5;
    bool _573 = _541 > 0.5;
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _567);
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    float _581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _571);
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _585 = _583 != 0;
    float _587 = _561 * _575;
    float _589 = _549 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _591 = _539 * _581;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _593;
    float _597 = _549 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _599 = _587 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _601 = _549 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _603 = _587 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].x, _589);
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[24].x, _599);
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].x, _601);
    float _611 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _613 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _615 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _617 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].z, _609);
    float _619 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[26].z, _611);
    float _621 = 1.0 / _595;
    float _623 = _615 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _625 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].x, _597);
    float _627 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _629 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _631 = isnan(_535);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _587 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _643 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[5].z, _625);
    float _645 = _613 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _647 = _617 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _651 = _535 + _649;
    float _653 = -_639;
    float _655 = _653 + 1.0;
    float _657 = _645 + _623;
    float _659 = _647 + _627;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _661;
    float _665 = _651 * _621;
    float _667 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _669 = _657 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _673 = _659 + _671;
    float _675 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[25].x, _641);
    float _677 = _669 * _669;
    float _679 = _673 * _673;
    bool _681 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _683 = isnan(_535);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _693;
    float _697 = _677 + _679;
    float _699 = fma(_663, _665, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _701 = _691 * _655;
    float _703 = fma(_695, _665, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _705 = sqrt(_697);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _707;
    float _711 = _699 * _701;
    float _713 = _703 * _701;
    float _715 = -_567;
    int _717 = _563 ? as_type<int>(_715) : as_type<int>(_567);
    float _719 = fma(_709, _665, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _721 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[25].z, _675);
    bool _723 = !_585;
    float _725 = _723 ? _567 : as_type<float>(_717);
    float _727 = _719 * _701;
    float _729 = -_571;
    int _731 = _573 ? as_type<int>(_729) : as_type<int>(_571);
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _735 = _567 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _737 = _571 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _739 = !_579;
    float _741 = _739 ? _571 : as_type<float>(_731);
    float _743 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _745 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _747 = _721 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _749 = _735 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _735 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _755 = _743 + _747;
    float _757 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[24].x, _749);
    float _759 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c8)._m0[26].x, _753);
    float _763 = _753;
    float _765 = _751;
    float _767 = _643;
    float _769 = _659;
    float _771 = _657;
    float _773 = _761;
    if (!_745)
    {
        _763 = _659;
    }
    float _775 = _763;
    float _777 = _775;
    if (!_745)
    {
        _765 = _679;
    }
    float _779 = _765;
    float _781 = _779;
    if (!_745)
    {
        _767 = _677;
    }
    float _783 = _767;
    float _785 = _783;
    if (!_745)
    {
        _769 = _755;
    }
    float _787 = _769;
    bool _789 = !_745;
    float _791 = _787;
    if (!_789)
    {
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _797 = _705 + _795;
        float _799 = _755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _801 = rsqrt(_697);
        float _803 = _797 * _793;
        float _805 = _803 * 0.15915493667125701904296875;
        float _807 = _805 * 6.283185482025146484375;
        float _809 = sin(_807);
        float _811 = _805 * 6.283185482025146484375;
        float _813 = cos(_811);
        float _815 = fma(_809, _799, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _817 = _801 * _815;
        float _819 = _813 + (-1.0);
        float _821 = fma(_669, _817, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _823 = fma(_673, _817, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _825 = _819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _829 = _821 + _827;
        float _831 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _833 = _823 + _831;
        float _835 = fma(_755, _813, _825);
        float _837 = _829 * _829;
        float _839 = _833 * _833;
        _791 = _835;
        _785 = _837;
        _781 = _839;
        _771 = _821;
        _777 = _823;
    }
    float _841 = _791;
    float _843 = _785;
    float _845 = _781;
    float _847 = _771;
    float _849 = _777;
    float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _853 = _841 + _851;
    float _855 = -_691;
    float _857 = _855 + 1.0;
    float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _861 = _741 + 0.5;
    float _863 = fma(_853, _853, _843);
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].y, _727);
    float _867 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].x, _711);
    float _869 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[123].z, _713);
    float _871 = _863 + _845;
    float _873 = _861 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _875 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].y, _865);
    float _877 = -_725;
    float _879 = _877 + 0.5;
    float _881 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].x, _867);
    float _883 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[124].z, _869);
    float _885 = _873 * _733;
    float _887 = sqrt(_871);
    float _889 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _895 = _883 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _897 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _899 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _891 * _859;
    float _903 = _757 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _761 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_64.x = _885;
    out.m_64.y = _901;
    out.m_66.x = _905;
    out.m_66.y = _899;
    out.m_66.z = _907;
    bool _911 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _913 = isnan(_887);
    bool _915 = _911 || _913;
    bool _917 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _919 = _915 || _917;
    out.m_68.x = _903;
    out.m_68.y = _897;
    out.m_68.z = _909;
    float _921 = _907;
    if (!_919)
    {
        _773 = 1.0;
    }
    float _923 = _773;
    bool _925 = !_919;
    float _927 = _923;
    if (!_925)
    {
        bool _929 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _931 = isnan(_887);
        bool _933 = _929 || _931;
        bool _935 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _937 = _933 || _935;
        if (!_937)
        {
            float _939 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _941 = _887 + _939;
            float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _945 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _943;
            float _947 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _949 = _947 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _951 = 1.0 / _945;
            float _953 = _941 * _951;
            float _955 = fma(_953, _949, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _927 = _955;
            _957 = true;
        }
        else
        {
            bool _959 = _887 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _961 = isnan(_887);
            bool _963 = _959 || _961;
            bool _965 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _967 = _963 || _965;
            if (!_967)
            {
                float _969 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _971 = _887 + _969;
                float _973 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _975 = _973 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _977 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _979 = _977 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _981 = 1.0 / _975;
                float _983 = _971 * _981;
                float _985 = fma(_983, _979, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _927 = _985;
                _957 = true;
            }
            else
            {
                _927 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _957 = false;
    float _987 = _927;
    float _989 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _991 = _841 + _989;
    float _993 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _995 = _847 + _993;
    float _997 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _999 = _849 + _997;
    float _1001 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1003 = fma(_995, _987, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1005 = fma(_999, _987, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1007 = _743 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1009 = -_743;
    float _1011 = _1009 + _1001;
    float _1013 = -_645;
    float _1015 = _1013 + _1003;
    float _1017 = -_647;
    float _1019 = _1017 + _1005;
    float _1021 = _1011 * _1011;
    float _1023 = fma(_1015, _1015, _1021);
    float _1025 = fma(_1019, _1019, _1023);
    float _1027 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1007);
    float _1029 = _743 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1031 = sqrt(_1025);
    float _1033 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1027);
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1037 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1029);
    float _1039 = 1.0 / _1035;
    float _1041 = fma(_647, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1037);
    bool _1043 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.5);
    bool _1051 = _1047 || _1049;
    float _1053 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1055 = _1031 > 0.0;
    float _1057 = _1053 + _1035;
    bool _1059 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    float _1069 = _1057 * _1039;
    float _1071 = _1069 * 0.5;
    float _1073 = _1057;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1079 = _1035;
    float _1081 = _1071;
    if (!_1055)
    {
        _1073 = _1003;
    }
    float _1083 = _1073;
    float _1085 = _1083;
    if (!_1055)
    {
        _1075 = _1001;
    }
    float _1087 = _1075;
    float _1089 = _1087;
    if (!_1055)
    {
        _1077 = _1005;
    }
    float _1091 = _1077;
    bool _1093 = !_1055;
    float _1095 = _1091;
    float _1097 = _1091;
    if (!_1093)
    {
        float _1099 = _169 * _169;
        float _1101 = fma(_171, _171, _1099);
        float _1103 = fma(_173, _173, _1101);
        float _1105 = rsqrt(_1025);
        float _1107 = sqrt(_1103);
        float _1109 = _1015 * _1105;
        float _1111 = _1011 * _1105;
        float _1113 = _1019 * _1105;
        bool _1115 = _1107 > 0.0;
        float _1117 = _1105;
        float _1119 = _1107;
        _921 = _1103;
        if (!_1115)
        {
            _1117 = _1003;
        }
        float _1121 = _1117;
        _1085 = _1121;
        if (!_1115)
        {
            _1119 = _1001;
        }
        float _1123 = _1119;
        _1089 = _1123;
        if (!_1115)
        {
            _1095 = _1005;
        }
        float _1125 = _1095;
        bool _1127 = !_1115;
        _1097 = _1125;
        if (!_1127)
        {
            float _1129 = rsqrt(_1103);
            float _1131 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1133 = _169 * _1129;
            float _1135 = _171 * _1129;
            float _1137 = _1111 * _1133;
            float _1139 = _173 * _1129;
            float _1141 = fma(_1109, _1135, _1137);
            float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1145 = fma(_1113, _1139, _1141);
            float _1147 = _1145 * _1143;
            float _1149 = fma(_171, _1147, _1003);
            float _1151 = fma(_169, _1147, _1001);
            float _1153 = fma(_173, _1147, _1005);
            _921 = _1129;
            _1097 = _1153;
            _1085 = _1149;
            _1089 = _1151;
            _1079 = _1147;
        }
    }
    float _1155 = _921;
    float _1157 = _1097;
    float _1159 = _1085;
    float _1161 = _1089;
    float _1163 = _1079;
    float _1165 = _1161;
    float _1167 = _1159;
    float _1169 = _1157;
    float _1171 = _1163;
    float _1173 = _1155;
    if (_1067)
    {
        _177 = 1.0;
    }
    float _1175 = _177;
    float _1177 = _1175;
    if (!_1051)
    {
        float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1181 = _743 + _1179;
        float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1185 = _645 + _1183;
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1189 = -_647;
        float _1191 = _1189 + _1157;
        float _1193 = _1181 * _1181;
        float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1197 = _647 + _1195;
        float _1199 = fma(_1185, _1185, _1193);
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1203 = fma(_1197, _1197, _1199);
        float _1205 = sqrt(_1203);
        float _1207 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1209 = precise::min(_1205, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1211 = _1209 * _1201;
        float _1213 = -_645;
        float _1215 = _1213 + _1159;
        float _1217 = _1207 * _1211;
        float _1219 = -_743;
        float _1221 = _1219 + _1161;
        float _1223 = fma(_1215, _1217, _645);
        float _1225 = fma(_1221, _1217, _743);
        float _1227 = fma(_1191, _1217, _647);
        _1165 = _1225;
        _1167 = _1223;
        _1169 = _1227;
        _1171 = _1217;
        _1173 = _1221;
    }
    float _1229 = _1165;
    float _1231 = _1167;
    float _1233 = _1169;
    float _1235 = _1171;
    float _1237 = _1173;
    float _1239 = _1237;
    float _1241 = _1235;
    if (!_1067)
    {
        float _1243 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1247 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1245);
        float _1249 = _1243 * 0.15915493667125701904296875;
        float _1251 = _1249 * 6.283185482025146484375;
        float _1253 = cos(_1251);
        float _1255 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1257 = _1255 * 0.15915493667125701904296875;
        float _1259 = _1249 * 6.283185482025146484375;
        float _1261 = sin(_1259);
        float _1263 = 1.0 / _1253;
        float _1265 = _1257 * 6.283185482025146484375;
        float _1267 = cos(_1265);
        float _1269 = _1261 * _1263;
        float _1271 = 1.0 / _1247;
        float _1273 = _1267 * _1269;
        float _1275 = _1257 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1281 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1279;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1285 = _1271 * _1283;
        float _1287 = 1.0 / _1273;
        float _1289 = 1.0 / _1281;
        float _1291 = _1277 * _1287;
        float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1295 = fma(_1291, _1285, _1293);
        float _1297 = _1295 * _1289;
        float _1299 = precise::clamp(_1297, 0.0, 1.0);
        _1081 = _1271;
        _1239 = _1289;
        _1177 = _1299;
    }
    float _1301 = _1081;
    float _1303 = _1239;
    float _1305 = _1177;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1229 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1313 = _1231 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1317 = _1233 + _1315;
    float _1319 = _1309 * _1309;
    float _1321 = fma(_1313, _1313, _1319);
    float _1323 = fma(_1317, _1317, _1321);
    float _1325 = rsqrt(_1323);
    float _1327 = sqrt(_1323);
    float _1329 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1331 = _1313 * _1329;
    float _1333 = _1317 * _1329;
    float _1335 = _1331 * _1331;
    float _1337 = _1333 * _1333;
    float _1339 = _1335 + _1337;
    float _1341 = sqrt(_1339);
    bool _1343 = _1341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1341 + _1345;
    float _1349 = _1325;
    float _1351 = _1301;
    float _1353 = _1347;
    float _1355 = _1309;
    float _1357 = _1303;
    float _1359 = _1331;
    if (_1343)
    {
        float _1361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1361;
    }
    float _1363 = _1349;
    if (_1343)
    {
        float _1365 = rsqrt(_1339);
        _1351 = _1365;
    }
    float _1367 = _1351;
    float _1369 = _1367;
    if (_1343)
    {
        float _1371 = _1347 * _1363;
        _1353 = _1371;
    }
    float _1373 = _1353;
    if (_1343)
    {
        float _1375 = _1373 * 0.15915493667125701904296875;
        _1241 = _1375;
    }
    float _1377 = _1241;
    float _1379 = _1363;
    if (_1343)
    {
        float _1381 = _1377 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        _1379 = _1383;
    }
    float _1385 = _1379;
    float _1387 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1389 = precise::max(0.0, _1387);
    float _1391 = _1317;
    float _1393 = _1389;
    if (_1343)
    {
        float _1395 = _1377 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        _1391 = _1397;
    }
    float _1399 = _1391;
    float _1401 = -_1329;
    float _1403 = -_1389;
    float _1405 = fma(_1309, _1401, _1403);
    if (!_1343)
    {
        _1355 = _1333;
    }
    float _1407 = _1355;
    float _1409 = _1407;
    if (_1343)
    {
        float _1411 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1393 = _1411;
    }
    float _1413 = _1393;
    float _1415 = _1385;
    float _1417 = _1413;
    if (_1343)
    {
        float _1419 = fma(_1385, _1413, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1357 = _1419;
    }
    float _1421 = _1357;
    float _1423 = _1421;
    if (!_1343)
    {
        _1415 = _1405;
    }
    float _1425 = _1415;
    float _1427 = _1425;
    float _1429 = _1399;
    if (_1343)
    {
        float _1431 = _1399 + (-1.0);
        _1417 = _1431;
    }
    float _1433 = _1417;
    float _1435 = _1433;
    if (_1343)
    {
        float _1437 = _1367 * _1421;
        _1423 = _1437;
    }
    float _1439 = _1423;
    if (_1343)
    {
        float _1441 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1441;
    }
    float _1443 = _1369;
    if (_1343)
    {
        float _1445 = _1331 * _1439;
        _1359 = _1445;
    }
    float _1447 = _1359;
    if (!_1343)
    {
        _1435 = _1335;
    }
    float _1449 = _1435;
    float _1451 = _1449;
    if (_1343)
    {
        float _1453 = _1333 * _1439;
        _1409 = _1453;
    }
    float _1455 = _1409;
    if (_1343)
    {
        float _1457 = fma(_1405, _1399, _1443);
        _1427 = _1457;
    }
    float _1459 = _1427;
    if (_1343)
    {
        float _1461 = _1447 * _1447;
        _1451 = _1461;
    }
    float _1463 = _1451;
    if (!_1343)
    {
        _1429 = _1337;
    }
    float _1465 = _1429;
    float _1467 = _1465;
    if (_1343)
    {
        float _1469 = _1455 * _1455;
        _1467 = _1469;
    }
    float _1471 = _1467;
    float _1473 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1475 = fma(_1459, _1459, _1463);
    float _1477 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1479 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1473);
    float _1481 = _1475 + _1471;
    float _1483 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1487 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1485);
    float _1489 = precise::clamp(_1487, 0.0, 1.0);
    float _1491 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1479);
    float _1493 = rsqrt(_1481);
    float _1495 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1483);
    float _1503 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1505 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1495);
    float _1507 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1477);
    float _1509 = abs(_1499);
    float _1511 = log2(_1509);
    float _1513 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1501);
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1517 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1519 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1505);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1523 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1525 = -_1517;
    float _1527 = fma(_1525, _1515, 1.0);
    float _1529 = _1493 * _1447;
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1533 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1535 = _1493 * _1459;
    float _1537 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1539 = _1493 * _1455;
    float _1541 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1533);
    float _1543 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1545 = -_1537;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1545);
    float _1549 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1551 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1541);
    float _1553 = log2(_1527);
    float _1555 = -_1539;
    float _1557 = fma(_1555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1547);
    float _1559 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1561 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1551);
    float _1563 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1565 = fma(_1557, -0.5, 0.5);
    float _1567 = fma(_1557, 0.5, 0.5);
    float _1569 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1559);
    float _1571 = exp2(_1549);
    float _1573 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1563);
    float _1575 = _1535 + 1.0;
    float _1577 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1569);
    float _1579 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1581 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1573);
    float _1583 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1577);
    float _1585 = 1.0 / _1561;
    float _1587 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1581);
    float _1589 = fma(_1567, _1579, -0.212114393711090087890625);
    float _1591 = fma(_1567, _1589, 1.570728778839111328125);
    float _1593 = sqrt(_1565);
    float _1595 = -_1535;
    float _1597 = fma(_1571, _1575, _1595);
    float _1599 = _1553 * 0.693147182464599609375;
    float _1601 = fma(_1597, 0.5, 0.5);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1583 * _1585;
    float _1607 = _1587 * _1585;
    float _1609 = fma(_1605, 0.5, 0.5);
    float _1611 = fma(_1607, -0.5, 0.5);
    float _1613 = _1593 * 0.636619746685028076171875;
    float3 _4592 = float3(_1609, _1611, _1603);
    float _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4592, float3(0.0), isnan(_4592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4592, float3(0.0), isnan(_4592)), level(0.0)).x;
    float3 _4603 = float3(_1609, _1611, _1603);
    float4 _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4603, float3(0.0), isnan(_4603)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4603, float3(0.0), isnan(_4603)), level(0.0)).xyzw;
    float _1620 = _1618.x;
    float _1622 = _1618.y;
    float _1624 = _1618.z;
    float _1626 = _1618.w;
    float _1628 = -_1591;
    float _1630 = fma(_1613, _1628, 1.0);
    float2 _4625 = float2(_1630, _1601);
    float3 _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4625, float2(0.0), isnan(_4625)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4625, float2(0.0), isnan(_4625)), level(0.0)).xyz;
    float _1636 = _1634.x;
    float _1638 = _1634.y;
    float _1640 = _1634.z;
    float _1642 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1644 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1646 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1648 = isnan(_1327);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1654 = _1650 || _1652;
    float _1656 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1644);
    float _1658 = exp2(_1642);
    float _1660 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1656);
    float _1662 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1664 = _1662 + _1561;
    out.gl_Position.x = _1583;
    out.gl_Position.y = _1587;
    out.gl_Position.z = _1662;
    out.gl_Position.w = _1561;
    float _1666 = _1664 * 0.5;
    float _1668 = -_1658;
    float _1670 = _1668 + 1.0;
    float _1672 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1666;
    out.m_70.w = _1561;
    float _1674 = _1561;
    float _1676 = _1662;
    float _1678 = _1587;
    float _1680 = _1666;
    float _1682 = _1583;
    if (!_1654)
    {
        _1674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1684 = _1674;
    float _1686 = _1684;
    float _1688 = _1684;
    if (!_1654)
    {
        _1676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1690 = _1676;
    float _1692 = _1690;
    float _1694 = _1690;
    if (!_1654)
    {
        _1678 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1696 = _1678;
    float _1698 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1700 = _1696;
    float _1702 = _1696;
    if (!_1654)
    {
        _1680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1704 = _1680;
    float _1706 = _1704;
    float _1708 = _1704;
    if (!_1654)
    {
        _1682 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1710 = _1682;
    float _1712 = _1672 * _1615;
    float _1714 = -_1672;
    float _1716 = _1714 + 1.0;
    float _1718 = _1626 * _1712;
    float _1720 = _1626 * _1716;
    float _1722 = _1640 * _1712;
    float _1724 = fma(_1636, _1718, _1620);
    float _1726 = fma(_1638, _1718, _1622);
    float _1728 = _1718;
    float _1730 = _1710;
    float _1732 = _1710;
    if (!_1654)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1734 = _1728;
    float _1736 = fma(_1626, _1722, _1624);
    out.m_72.x = _1724;
    out.m_72.y = _1726;
    out.m_72.z = _1736;
    out.m_72.w = _1720;
    bool _1738 = !_1654;
    float _1740 = _1734;
    float _1742 = _1734;
    if (!_1738)
    {
        bool _1744 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1746 = isnan(_1327);
        bool _1748 = _1744 || _1746;
        bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1752 = _1748 || _1750;
        if (!_1752)
        {
            float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1756 = _1327 + _1754;
            float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1760 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1766 = 1.0 / _1760;
            float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1778 = _1776 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1782 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1784 = _1756 * _1766;
            float _1786 = precise::clamp(_1784, 0.0, 1.0);
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1792 = fma(_1786, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1794 = fma(_1786, _1790, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1796 = fma(_1786, _1770, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1798 = fma(_1786, _1774, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1800 = fma(_1786, _1778, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1802 = fma(_1786, _1782, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1708 = _1796;
            _1702 = _1800;
            _1742 = _1792;
            _1694 = _1798;
            _1688 = _1794;
            _1732 = _1802;
            _1804 = true;
        }
        else
        {
            bool _1806 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1808 = isnan(_1327);
            bool _1810 = _1806 || _1808;
            bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1814 = _1810 || _1812;
            if (!_1814)
            {
                _1740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1816 = _1740;
            _1742 = _1816;
            if (!_1814)
            {
                _1706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1818 = _1706;
            _1708 = _1818;
            if (!_1814)
            {
                _1686 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1820 = _1686;
            _1688 = _1820;
            if (!_1814)
            {
                _1692 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1822 = _1692;
            _1694 = _1822;
            if (!_1814)
            {
                _1700 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1824 = _1700;
            _1702 = _1824;
            if (!_1814)
            {
                _1730 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1826 = _1730;
            bool _1828 = !_1814;
            _1732 = _1826;
            if (!_1828)
            {
                bool _1830 = _1327 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1832 = isnan(_1327);
                bool _1834 = _1830 || _1832;
                bool _1836 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1838 = _1834 || _1836;
                if (!_1838)
                {
                    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1842 = _1327 + _1840;
                    float _1844 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1846 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1844;
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1850 = _1848 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1852 = 1.0 / _1846;
                    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1870 = _1842 * _1852;
                    float _1872 = precise::clamp(_1870, 0.0, 1.0);
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1878 = fma(_1872, _1850, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1880 = fma(_1872, _1876, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1882 = fma(_1872, _1856, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1884 = fma(_1872, _1860, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1886 = fma(_1872, _1864, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1888 = fma(_1872, _1868, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1708 = _1882;
                    _1702 = _1886;
                    _1742 = _1878;
                    _1694 = _1884;
                    _1688 = _1880;
                    _1732 = _1888;
                    _1804 = true;
                }
                else
                {
                    _1708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1702 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1694 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1688 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1732 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1804 = false;
    float _1890 = _1708;
    float _1892 = _1702;
    float _1894 = _1742;
    float _1896 = _1694;
    float _1898 = _1688;
    float _1900 = _1732;
    float _1902 = fma(_897, -0.5, 0.5);
    float _1904 = precise::clamp(_1902, 0.0, 1.0);
    float _1906 = -_1890;
    float _1908 = _1906 + _1892;
    float _1910 = _1698 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1912 = -_1894;
    float _1914 = _1912 + _1896;
    float _1916 = fma(_1904, _1908, _1890);
    out.m_74.x = 0.0;
    float _1918 = -_1898;
    float _1920 = _1918 + _1900;
    float _1922 = fma(_1904, _1914, _1894);
    float _1924 = _1916 * 0.586610972881317138671875;
    out.m_49.x = _1910;
    bool _1926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1928 = fma(_1904, _1920, _1898);
    float _1930 = fma(_1922, 0.298911988735198974609375, _1924);
    bool _1932 = _1305 > 0.0;
    bool _1934 = isnan(_1305);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan(0.0);
    bool _1940 = _1936 || _1938;
    float _1942 = fma(_1928, 0.114477999508380889892578125, _1930);
    float _1944 = -_1942;
    float _1946 = _1922 + _1944;
    float _1948 = -_1942;
    float _1950 = _1916 + _1948;
    float _1952 = -_1942;
    float _1954 = _1928 + _1952;
    float _1956 = fma(_1946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    float _1958 = fma(_1950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    float _1960 = fma(_1954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1942);
    bool _1962 = !_1926;
    if (!_1962)
    {
        float _1964 = -_1229;
        float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1968 = -_1231;
        float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1972 = -_1233;
        float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1976 = _1966 * _1966;
        float _1978 = fma(_1970, _1970, _1976);
        float _1980 = fma(_1974, _1974, _1978);
        float _1982 = sqrt(_1980);
        float _1984 = rsqrt(_1980);
        float _1986 = -_1982;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1992 = precise::clamp(_1990, 0.0, 1.0);
        float _1994 = _1970 * _1984;
        float _1996 = _1966 * _1984;
        float _1998 = abs(_1992);
        float _2000 = log2(_1998);
        float _2002 = _1974 * _1984;
        float _2004 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2006 = _897 * _1996;
        float _2008 = -_1996;
        float _2010 = -_2004;
        float _2012 = fma(_2008, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2010);
        float _2014 = fma(_903, _1994, _2006);
        float _2016 = -_2002;
        float _2018 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2012);
        float _2020 = fma(_909, _2002, _2014);
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2026 = _2018 + _2024;
        float _2028 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        float _2034 = exp2(_2028);
        float _2036 = _2034 * _2032;
        float _2038 = _2022 * _2036;
        float _2040 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2044 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _2040;
        out.m_74.y = _2042;
        out.m_74.z = _2044;
    }
    out.m_76.x = _1956;
    out.m_76.y = _1958;
    out.m_76.z = _1960;
    if (_1940)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2046;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

