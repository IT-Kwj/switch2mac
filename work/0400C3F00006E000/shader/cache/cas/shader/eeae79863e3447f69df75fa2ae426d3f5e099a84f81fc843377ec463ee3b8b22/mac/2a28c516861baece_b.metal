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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2209 = false;
    bool _529 = false;
    bool _389 = false;
    bool _195 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2508 = as_type<float>(_111);
        out.gl_Position.z = _2508;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2576 = as_type<float>(_147);
        out.gl_Position.z = _2576;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _193;
    if (!_175)
    {
        float _177 = in.m_53.x;
        float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _183 = fma(_181, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _185 = _183 * _179;
        float _187 = floor(_185);
        float _189 = -_187;
        float _191 = _185 + _189;
        _193 = _191;
        _195 = true;
    }
    else
    {
        float _197 = float(_95);
        float _199 = 1.0 / _197;
        float _201 = _129 * _199;
        _193 = _201;
    }
    _195 = false;
    float _203 = _193;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = _203 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _203 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _221 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _225;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _219;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _227;
    float _247 = 1.0 / _223;
    float _249 = _207 * _241;
    bool _251 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _253 = isnan(_203);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -_239;
    float _265 = _263 + 1.0;
    float _267 = _261 * _265;
    float _269 = _211 * _245;
    bool _271 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_203);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_261;
    float _285 = _283 + 1.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _291 = _281 * _285;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _215 * _247;
    bool _299 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_203);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_289, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = fma(_313, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = _309 * _295;
    float _329 = fma(_319, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = fma(_323, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _325 * _327;
    float _339 = _329 * _327;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _341;
    float _345 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _337);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _339);
    float _353 = fma(_343, _269, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _355 = fma(_315, _291, _345);
    float _357 = fma(_349, _269, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_331, _291, _351);
    float _361 = fma(_353, _267, _355);
    float _363 = fma(_357, _267, _359);
    float _365 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].x, _361);
    float _367 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].y, _363);
    bool _369 = !_243;
    float _387;
    if (!_369)
    {
        float _371 = in.m_53.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_95);
        float _393 = 1.0 / _391;
        float _395 = _129 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _401 = _397 + _399;
    bool _403 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _415;
    bool _419 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _421 = isnan(_397);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -_413;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = 1.0 / _417;
    bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _443 = _429 * _433;
    float _445 = -_429;
    float _447 = _445 + 1.0;
    float _449 = _401 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _451;
    float _455 = fma(_437, _449, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = fma(_453, _449, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _463 = _455 * _443;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = fma(_459, _449, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _469 = _461 * _443;
    float _471 = in.m_55.x;
    float _473 = in.m_55.y;
    float _475 = _467 * _443;
    float _477 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].x, _463);
    float _479 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].y, _475);
    float _481 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].x, _477);
    float _485 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].y, _479);
    float _487 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].z, _481);
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _495;
    out.m_57.y = _497;
    out.m_57.z = _499;
    out.m_57.w = _465;
    float _501 = _367 * _473;
    float _503 = _365 * _471;
    bool _505 = !_441;
    float _525;
    float _527;
    if (!_505)
    {
        float _507 = in.m_53.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _511 = float(_95);
        float _513 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _517 = _515 * _509;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _511;
        _527 = _523;
        _529 = true;
    }
    else
    {
        float _531 = float(_95);
        float _533 = 1.0 / _531;
        float _535 = _129 * _533;
        _525 = _531;
        _527 = _535;
    }
    _529 = false;
    float _537 = _525;
    float _539 = _527;
    float _541 = as_type<float>(int(gl_VertexIndex));
    float _543 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _545 = in.m_44.x;
    float _547 = in.m_44.y;
    float _549 = in.m_44.z;
    float _551 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _553 = as_type<int>(_541) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_541) & 2;
    bool _559 = _557 != 0;
    float _561 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _563 = !_559;
    float _565 = _563 ? (-0.5) : 0.5;
    bool _567 = !_555;
    float _569 = _567 ? (-0.5) : 0.5;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _565);
    float _573 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _569);
    float _575 = _543 * _571;
    float _577 = _547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = _561 * _573;
    float _581 = _547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _585 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _587 = _575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _589 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _583);
    float _593 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _585);
    float _595 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _587);
    float _597 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _591);
    float _601 = _593 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _603 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _595);
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = _599 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _609 = _547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _611 = _603 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _613 = _575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _615 = _601 + _607;
    float _617 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
    float _619 = _605 + _611;
    float _621 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _613);
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _625 = _615 + _623;
    float _627 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _617);
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _619 + _629;
    float _633 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
    float _635 = _625 * _625;
    float _637 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _639 = _633 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _641 = fma(_631, _631, _635);
    float _643 = _637 + _639;
    float _645 = sqrt(_641);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _659 = _657 != 0;
    bool _661 = !_655;
    int _663 = _661 ? 0 : 1;
    bool _665 = !_651;
    int _667 = _665 ? 0 : 1;
    bool _669 = !_659;
    int _671 = _669 ? 0 : 1;
    float _673 = _551;
    float _675 = _607;
    float _677 = _615;
    float _679 = _637;
    if (!_647)
    {
        _673 = _619;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_647)
    {
        _675 = _643;
    }
    float _685 = _675;
    bool _687 = !_647;
    float _689 = _685;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _645 + _693;
        float _697 = _643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_641);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _717 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _719 = _699 * _715;
        float _721 = fma(_643, _707, _717);
        float _723 = fma(_631, _719, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_625, _719, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _721;
        _683 = _723;
        _677 = _725;
    }
    float _727 = _689;
    float _729 = _683;
    float _731 = _677;
    float _733 = -_637;
    float _735 = _733 + _727;
    float _737 = -_605;
    float _739 = _737 + _729;
    float _741 = -_601;
    float _743 = _741 + _731;
    float _745 = _637 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _747 = _735 * _735;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    float _761 = fma(_739, _739, _747);
    bool _763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _765 = isnan(0.5);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _771 = _767 || _769;
    float _773 = fma(_743, _743, _761);
    float _775 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[11].z, _759);
    float _777 = _637 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = sqrt(_773);
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _783 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _785 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[10].z, _783);
    float _787 = 1.0 / _781;
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _791 = _789 + _781;
    bool _793 = _779 > 0.0;
    float _795 = _791 * _787;
    float _797 = _795 * 0.5;
    bool _799 = !_793;
    float _801 = _729;
    float _803 = _789;
    float _805 = _727;
    float _807 = _731;
    float _809 = _735;
    float _811 = _773;
    float _813 = _743;
    float _815 = _797;
    if (!_799)
    {
        float _817 = _171 * _171;
        float _819 = rsqrt(_773);
        float _821 = fma(_169, _169, _817);
        float _823 = fma(_173, _173, _821);
        float _825 = sqrt(_823);
        float _827 = _739 * _819;
        float _829 = _735 * _819;
        float _831 = _743 * _819;
        bool _833 = _825 > 0.0;
        bool _835 = !_833;
        _803 = _819;
        _809 = _829;
        _813 = _831;
        if (!_835)
        {
            float _837 = rsqrt(_823);
            float _839 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _841 = _171 * _837;
            float _843 = _169 * _837;
            float _845 = _829 * _841;
            float _847 = _173 * _837;
            float _849 = fma(_827, _843, _845);
            float _851 = _839 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _853 = fma(_831, _847, _849);
            float _855 = _853 * _851;
            float _857 = fma(_169, _855, _729);
            float _859 = fma(_171, _855, _727);
            float _861 = fma(_173, _855, _731);
            _801 = _857;
            _803 = _843;
            _805 = _859;
            _807 = _861;
            _809 = _849;
            _811 = _851;
        }
    }
    float _863 = _801;
    float _865 = _803;
    float _867 = _805;
    float _869 = _807;
    float _871 = _809;
    float _873 = _811;
    float _875 = _813;
    float _877 = _871;
    float _879 = _873;
    float _881 = _867;
    float _883 = _869;
    float _885 = _865;
    float _887 = _875;
    if (_771)
    {
        _877 = 1.0;
    }
    float _889 = _877;
    float _891 = _889;
    if (_757)
    {
        _879 = _863;
    }
    float _893 = _879;
    float _895 = _893;
    if (!_757)
    {
        float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _899 = _637 + _897;
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _903 = _605 + _901;
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _907 = _899 * _899;
        float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _911 = _601 + _909;
        float _913 = fma(_903, _903, _907);
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _917 = fma(_911, _911, _913);
        float _919 = sqrt(_917);
        float _921 = _905 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _923 = precise::min(_919, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _925 = _923 * _915;
        float _927 = -_605;
        float _929 = _927 + _863;
        float _931 = _921 * _925;
        float _933 = -_637;
        float _935 = _933 + _867;
        float _937 = -_601;
        float _939 = _937 + _869;
        float _941 = fma(_929, _931, _605);
        float _943 = fma(_935, _931, _637);
        float _945 = fma(_939, _931, _601);
        _881 = _943;
        _895 = _941;
        _883 = _945;
        _885 = _939;
    }
    float _947 = _881;
    float _949 = _895;
    float _951 = _883;
    float _953 = _885;
    float _955 = _953;
    if (!_771)
    {
        float _957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _959 = _957 * 0.15915493667125701904296875;
        float _961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _963 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _965 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _963);
        float _967 = _959 * 6.283185482025146484375;
        float _969 = cos(_967);
        float _971 = _961 * 0.15915493667125701904296875;
        float _973 = _959 * 6.283185482025146484375;
        float _975 = sin(_973);
        float _977 = 1.0 / _969;
        float _979 = _971 * 6.283185482025146484375;
        float _981 = cos(_979);
        float _983 = _975 * _977;
        float _985 = _971 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _981 * _983;
        float _991 = 1.0 / _965;
        float _993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _995 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _993;
        float _997 = 1.0 / _989;
        float _999 = 1.0 / _995;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1003 = _991 * _1001;
        float _1005 = _987 * _997;
        float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1009 = fma(_1005, _1003, _1007);
        float _1011 = _1009 * _999;
        float _1013 = precise::clamp(_1011, 0.0, 1.0);
        _815 = _991;
        _955 = _959;
        _679 = _971;
        _891 = _1013;
    }
    float _1015 = _815;
    float _1017 = _955;
    float _1019 = _679;
    float _1021 = _891;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _947 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _949 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _951 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = rsqrt(_1039);
    float _1043 = sqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1029 * _1045;
    float _1049 = _1033 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1015;
    float _1067 = _1063;
    float _1069 = _1017;
    float _1071 = _1025;
    float _1073 = _1047;
    if (_1059)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1075;
    }
    float _1077 = _1065;
    float _1079 = _1077;
    if (_1059)
    {
        float _1081 = _1063 * _1077;
        _1067 = _1081;
    }
    float _1083 = _1067;
    if (_1059)
    {
        float _1085 = rsqrt(_1055);
        _1079 = _1085;
    }
    float _1087 = _1079;
    float _1089 = _1087;
    if (_1059)
    {
        float _1091 = _1083 * 0.15915493667125701904296875;
        _1069 = _1091;
    }
    float _1093 = _1069;
    float _1095 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1097 = _1033;
    if (_1059)
    {
        float _1099 = _1093 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        _1097 = _1101;
    }
    float _1103 = _1097;
    float _1105 = precise::max(0.0, _1095);
    float _1107 = _1019;
    float _1109 = _1105;
    if (_1059)
    {
        float _1111 = _1093 * 6.283185482025146484375;
        float _1113 = cos(_1111);
        _1107 = _1113;
    }
    float _1115 = _1107;
    float _1117 = -_1045;
    float _1119 = -_1105;
    float _1121 = fma(_1025, _1117, _1119);
    if (_1059)
    {
        float _1123 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1123;
    }
    float _1125 = _1071;
    float _1127 = _1103;
    float _1129 = _1125;
    if (_1059)
    {
        float _1131 = fma(_1103, _1125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1127 = _1131;
    }
    float _1133 = _1127;
    float _1135 = _1133;
    if (!_1059)
    {
        _1129 = _1121;
    }
    float _1137 = _1129;
    float _1139 = _947 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1141 = _1137;
    if (_1059)
    {
        float _1143 = _1087 * _1133;
        _887 = _1143;
    }
    float _1145 = _887;
    if (!_1059)
    {
        _1135 = _1051;
    }
    float _1147 = _1135;
    float _1149 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1139);
    float _1151 = _1147;
    float _1153 = _1115;
    if (_1059)
    {
        float _1155 = _1115 + (-1.0);
        _1109 = _1155;
    }
    float _1157 = _1109;
    float _1159 = _1157;
    if (_1059)
    {
        float _1161 = _1047 * _1145;
        _1073 = _1161;
    }
    float _1163 = _1073;
    float _1165 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1149);
    if (_1059)
    {
        float _1167 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1167;
    }
    float _1169 = _1089;
    if (!_1059)
    {
        _1159 = _1049;
    }
    float _1171 = _1159;
    float _1173 = _1171;
    if (_1059)
    {
        float _1175 = _1049 * _1145;
        _1173 = _1175;
    }
    float _1177 = _1173;
    if (_1059)
    {
        float _1179 = _1163 * _1163;
        _1151 = _1179;
    }
    float _1181 = _1151;
    if (_1059)
    {
        float _1183 = fma(_1121, _1115, _1169);
        _1141 = _1183;
    }
    float _1185 = _1141;
    if (!_1059)
    {
        _1153 = _1053;
    }
    float _1187 = _1153;
    float _1189 = _1187;
    if (_1059)
    {
        float _1191 = _1177 * _1177;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = fma(_1185, _1185, _1181);
    float _1197 = _947 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1199 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1201 = _947 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1203 = _1195 + _1193;
    float _1205 = _947 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1207 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1197);
    float _1209 = rsqrt(_1203);
    float _1211 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1213 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1205);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1217 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1215);
    float _1219 = precise::clamp(_1217, 0.0, 1.0);
    float _1221 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1207);
    float _1223 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1225 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1213);
    float _1227 = -_1219;
    float _1229 = _1227 + 1.0;
    float _1231 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1233 = -_1223;
    float _1235 = fma(_1233, _1211, 1.0);
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1201);
    float _1241 = abs(_1229);
    float _1243 = log2(_1241);
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1247 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1249 = _1209 * _1185;
    float _1251 = _1209 * _1177;
    float _1253 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1245);
    float _1255 = _1209 * _1163;
    float _1257 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = log2(_1235);
    float _1261 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1253);
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1265 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1261);
    float _1267 = -_1263;
    float _1269 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1267);
    float _1271 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1273 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = 1.0 / _1265;
    float _1277 = -_1251;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1269);
    float _1281 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1283 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1271);
    float _1285 = fma(_1279, -0.5, 0.5);
    float _1287 = fma(_1279, 0.5, 0.5);
    float _1289 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1281);
    float _1291 = exp2(_1273);
    float _1293 = _1249 + 1.0;
    float _1295 = fma(_1287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1297 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1289);
    float _1299 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1283);
    float _1301 = _1259 * 0.693147182464599609375;
    float _1303 = fma(_1287, _1295, -0.212114393711090087890625);
    float _1305 = sqrt(_1285);
    float _1307 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1309 = fma(_1287, _1303, 1.570728778839111328125);
    float _1311 = -_1249;
    float _1313 = fma(_1291, _1293, _1311);
    float _1315 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1317 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1299);
    float _1319 = fma(_1313, 0.5, 0.5);
    float _1321 = _1315 * _1275;
    float _1323 = _1317 * _1275;
    float _1325 = _1305 * 0.636619746685028076171875;
    float _1327 = fma(_1321, 0.5, 0.5);
    float _1329 = fma(_1323, -0.5, 0.5);
    float _1331 = -_1309;
    float _1333 = fma(_1325, _1331, 1.0);
    float3 _4480 = float3(_1327, _1329, _1307);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4480, float3(0.0), isnan(_4480)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4480, float3(0.0), isnan(_4480)), level(0.0)).x;
    float3 _4491 = float3(_1327, _1329, _1307);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4491, float3(0.0), isnan(_4491)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4491, float3(0.0), isnan(_4491)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float2 _4508 = float2(_1333, _1319);
    float3 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4508, float2(0.0), isnan(_4508)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4508, float2(0.0), isnan(_4508)), level(0.0)).xyz;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1360 = int(_1358);
    int _1362 = abs(_667);
    float _1364 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1366 = abs(_671);
    float _1368 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1370 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1364);
    float _1372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1374 = int(_1372);
    float _1376 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1370);
    float _1378 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1380 = float(_1360);
    float _1382 = 1.0 / _537;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1317;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1265;
    float _1384 = float(uint(_1374));
    float _1386 = 1.0 / _1380;
    int _1388 = ~_1374;
    int _1390 = _1388 + 1;
    int _1392 = ~_1374;
    int _1394 = _1392 + 1;
    int _1396 = ~_1374;
    int _1398 = _1396 + 1;
    float _1400 = 1.0 / _1384;
    float _1402 = _129 * _1386;
    float _1404 = exp2(_1368);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>(_1400) + (-2);
    float _1412 = trunc(_1402);
    int _1414 = int(_1412);
    bool _1416 = !_1408;
    float _1418 = _1416 ? 7.345489978790283203125 : 1.0;
    float _1420 = _1378 + _1265;
    float _1422 = -_1404;
    float _1424 = _1422 + 1.0;
    float _1426 = float(uint(_1414));
    float _1428 = as_type<float>(_1410) * _1426;
    float _1430 = in.m_53.x;
    float _1432 = in.m_53.y;
    float _1434 = trunc(_1428);
    float _1436 = precise::max(_1434, 0.0);
    uint _1439 = uint(_1436);
    int _1441 = _1390 * int(_1439);
    int _1443 = _1441 + _1414;
    float _1445 = float(_1414);
    float _1447 = _1418 * _1430;
    float _1449 = float(uint(_1443));
    bool _1451 = _1430 > 0.5;
    float _1453 = as_type<float>(_1410) * _1449;
    float _1455 = floor(_1447);
    float _1457 = trunc(_1453);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    float _1463 = -_1455;
    float _1465 = _1447 + _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1469 = _1467 != 0;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    int _1475 = int(_1439) + int(_1461);
    float _1477 = float(_1374);
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1481 = _1479 != 0;
    int _1483 = _1394 * _1475;
    int _1485 = _1483 + _1414;
    bool _1487 = _1445 >= _1477;
    bool _1489 = isnan(_1445);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan(_1477);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _129 * _1477;
    float _1501 = _1465 * _1477;
    bool _1503 = uint(_1485) >= uint(_1374);
    float _1505 = _1499 * _1382;
    float _1507 = trunc(_1497);
    int _1509 = int(_1507);
    int _1511 = _1374 + (-1);
    bool _1513 = !_1503;
    int _1515 = _1513 ? 0 : (-1);
    bool _1517 = _1374 == 0;
    int _1519 = ~_1475;
    int _1521 = _1519 + _1515;
    int _1523 = _1521 + 1;
    float _1525 = trunc(_1501);
    int _1527 = int(_1525);
    bool _1529 = !_1469;
    int _1531 = _1529 ? 0 : 1;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1535 = _1533 != 0;
    int _1537 = _1374 * _1523;
    int _1539 = _1537 + _1414;
    int _1541 = abs(_663);
    int _1543 = abs(_1531);
    float _1545 = trunc(_1505);
    int _1547 = int(_1545);
    int _1549 = ~_1509;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    bool _1555 = !_1517;
    int _1557 = _1555 ? _1539 : (-1);
    int _1559 = _1557 * _1553;
    int _1561 = ~_1374;
    int _1563 = _1561 + 1;
    int _1565 = _1527 * _1543;
    int _1567 = _1565 + _1414;
    int _1569 = _1509 * _1511;
    int _1571 = _1569 + _1559;
    bool _1573 = !_1535;
    int _1575 = _1573 ? 0 : 1;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1579 = _1577 != 0;
    int _1581 = _1571 * _1541;
    int _1583 = abs(_1575);
    float _1585 = float(uint(_1567));
    int _1587 = _1547 * _1362;
    int _1589 = _1587 + _1581;
    int _1591 = ~_1374;
    int _1593 = _1591 + 1;
    int _1595 = ~_1374;
    int _1597 = _1595 + 1;
    int _1599 = _1567 * _1366;
    int _1601 = _1599 + _1589;
    float _1603 = as_type<float>(_1410) * _1585;
    int _1605 = _1527 * _1583;
    int _1607 = _1605 + _1601;
    float _1609 = trunc(_1603);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    float _1615 = float(uint(_1607));
    float _1617 = as_type<float>(_1410) * _1615;
    float _1619 = trunc(_1617);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1563 * int(_1613);
    int _1627 = _1625 + _1567;
    float _1629 = float(uint(_1627));
    float _1631 = as_type<float>(_1410) * _1629;
    int _1633 = _1593 * int(_1623);
    int _1635 = _1633 + _1607;
    float _1637 = trunc(_1631);
    float _1639 = precise::max(_1637, 0.0);
    uint _1641 = uint(_1639);
    float _1643 = float(uint(_1635));
    float _1645 = as_type<float>(_1410) * _1643;
    float _1647 = _565 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1649 = trunc(_1645);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1657 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1661 = int(_1623) + int(_1653);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1663;
    int _1667 = _1597 * _1661;
    int _1669 = _1667 + _1607;
    float _1671 = 1.0 / _1665;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1675 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1677 = uint(_1669) >= uint(_1374);
    float _1679 = -_1673;
    float _1681 = fma(_1675, 2.0, _1679);
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1685 = !_1677;
    int _1687 = _1685 ? 0 : (-1);
    float _1689 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1683);
    int _1691 = ~_1661;
    int _1693 = _1691 + _1687;
    int _1695 = _1693 + 1;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1699 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1703 = _1432 > 0.5;
    int _1705 = _1374 * _1695;
    int _1707 = _1705 + _1607;
    float _1709 = fma(_1699, -2.0, _1697);
    float _1711 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1701);
    float _1713 = -_129;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1681);
    float _1717 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1689);
    float _1719 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1709);
    bool _1721 = !_1517;
    int _1723 = _1721 ? _1707 : (-1);
    float _1725 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1711);
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1729 = _539 + _1727;
    bool _1731 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1733 = isnan(_539);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1739 = _1735 || _1737;
    float _1741 = float(_1739);
    float _1743 = -_1717;
    float _1745 = _1743 + 1.0;
    bool _1747 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1749 = isnan(_539);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = _1729 * _1671;
    int _1761 = _1723 >> 31;
    float _1763 = -_1741;
    float _1765 = _1763 + 1.0;
    int _1767 = _1761 & 3;
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1769;
    int _1773 = _1723 + _1767;
    float _1775 = -_1757;
    float _1777 = _1775 + 1.0;
    float _1779 = fma(_1771, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1781 = _1773 >> 2;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1783;
    float _1787 = _1741 * _1777;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1789;
    int _1793 = _1781 << 4;
    int _1795 = _1793 + 368;
    float _1797 = fma(_1785, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1799 = _1779 * _1787;
    float _1801 = fma(_1791, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1803 = -_565;
    int _1805 = _1703 ? as_type<int>(_1803) : as_type<int>(_565);
    uint _1807 = uint(int(uint(_1795) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[int(_1817)][_1819];
    float _1823 = _1797 * _1787;
    float _1825 = _1801 * _1787;
    float _1827 = -_569;
    int _1829 = _1451 ? as_type<int>(_1827) : as_type<int>(_569);
    float _1831 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1799);
    bool _1833 = !_1481;
    float _1835 = _1833 ? _565 : as_type<float>(_1805);
    float _1837 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1839 = !_1473;
    float _1841 = _1839 ? _569 : as_type<float>(_1829);
    float _1843 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1823);
    int _1845 = _1723 & 3;
    bool _1847 = _1845 != 0;
    int _1849 = _1795 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = _1723 & 3;
    bool _1869 = _1867 != 0;
    float _1871 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1655);
    bool _1873 = uint(_1845) > 1u;
    float _1875 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1657);
    int _1877 = _1869 ? 0 : 1;
    float _1879 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1825);
    int _1881 = int(_1613) + int(_1641);
    float _1883 = _1841 + 0.5;
    int _1885 = ~_1877;
    int _1887 = _1885 + 1;
    int _1889 = _1887 + 1;
    float _1891 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1831);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1715);
    bool _1895 = uint(_1845) >= 2u;
    float _1897 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1843);
    bool _1899 = !_1847;
    int _1901 = _1899 ? 0 : 1;
    int _1903 = _1398 * _1881;
    int _1905 = _1903 + _1567;
    int _1907 = _1889;
    float _1909 = _1265;
    if (!_1873)
    {
        int _1911 = ~_1877;
        int _1913 = _1911 + 1;
        _1907 = _1913;
    }
    int _1915 = _1907;
    float _1917 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1879);
    bool _1919 = _1845 != 3;
    float _1921 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1659);
    int _1923 = abs(_1915);
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1927 = _1895 ? 0 : 1;
    float _1929 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1931 = _1925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1933 = uint(_1905) >= uint(_1374);
    float _1935 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    int _1937 = ~_1927;
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    float _1943 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    bool _1945 = _1845 != 3;
    int _1947 = _1941;
    if (_1919)
    {
        int _1949 = ~_1927;
        int _1951 = _1949 + 1;
        _1947 = _1951;
    }
    int _1953 = _1947;
    int _1955 = ~_1923;
    int _1957 = _1955 + 1;
    int _1959 = _1957 + 1;
    out.m_62.x = _1929;
    out.m_62.y = _1935;
    out.m_62.z = _1943;
    bool _1961 = !_1933;
    int _1963 = _1961 ? 0 : (-1);
    int _1965 = abs(_1901);
    int _1967 = _1959 * as_type<int>(_1821);
    bool _1969 = !_1945;
    int _1971 = _1969 ? 0 : (-1);
    int _1973 = abs(_1953);
    int _1975 = ~_1881;
    int _1977 = _1975 + _1963;
    int _1979 = _1977 + 1;
    float _1981 = _1835 + (-0.5);
    bool _1983 = !_1579;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = abs(_1971);
    float _1989 = -_1981;
    float _1991 = -_1719;
    float _1993 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1991);
    int _1995 = ~_1965;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    int _2001 = _1374 * _1979;
    int _2003 = _2001 + _1567;
    int _2005 = abs(_1985);
    int _2007 = _1999 * as_type<int>(_1813);
    int _2009 = _2007 + _1967;
    int _2011 = ~_1973;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    int _2017 = ~_1987;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    int _2023 = _2015 * as_type<int>(_1857);
    int _2025 = _2023 + _2009;
    int _2027 = ~_2005;
    int _2029 = _2027 + 1;
    int _2031 = _2029 + 1;
    float _2033 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2035 = _2021 * as_type<int>(_1865);
    int _2037 = _2035 + _2025;
    float _2039 = -_1725;
    float _2041 = _2039 + 1.0;
    bool _2043 = !_1517;
    int _2045 = _2043 ? _2003 : (-1);
    float _2047 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2049 = _2037 * _2031;
    float _2051 = -_1745;
    float _2053 = fma(_1841, _2051, _1893);
    float _2055 = fma(_1835, _2041, _1993);
    bool _2057 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2059 = isnan(_1043);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2065 = _2061 || _2063;
    int _2067 = _2045 * _2005;
    int _2069 = _2067 + _2049;
    float _2071 = _1897 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_64.x = _2053;
    out.m_64.y = _2055;
    float _2073 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = float(_2069);
    out.m_66.x = _2047;
    out.m_66.y = _2073;
    out.m_66.z = _1931;
    float _2077 = _1420 * 0.5;
    float _2079 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2075;
    float _2081 = _2079 * _1335;
    float _2083 = -_2079;
    float _2085 = _2083 + 1.0;
    float _2087 = _1352;
    float _2089 = _1342;
    float _2091 = _1340;
    float _2093 = _1346;
    float _2095 = _1344;
    if (!_2065)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2097 = _1909;
    out.m_70.z = _2077;
    out.m_70.w = _1265;
    float _2099 = _1346 * _2081;
    float _2101 = _1356 * _2081;
    float _2103 = _1346 * _2085;
    float _2105 = fma(_1352, _2099, _1340);
    float _2107 = fma(_1354, _2099, _1342);
    float _2109 = fma(_1346, _2101, _1344);
    float _2111 = _2097;
    float _2113 = _2097;
    if (!_2065)
    {
        _2087 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2115 = _2087;
    float _2117 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2119 = _2115;
    float _2121 = _2115;
    if (!_2065)
    {
        _2089 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2123 = _2089;
    out.m_72.x = _2105;
    out.m_72.y = _2107;
    out.m_72.z = _2109;
    out.m_72.w = _2103;
    float _2125 = _2123;
    float _2127 = _2123;
    if (!_2065)
    {
        _2091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2129 = _2091;
    float _2131 = _2129;
    float _2133 = _2129;
    if (!_2065)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2135 = _2093;
    float _2137 = _2135;
    float _2139 = _2135;
    if (!_2065)
    {
        _2095 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2141 = _2095;
    bool _2143 = !_2065;
    float _2145 = _2141;
    float _2147 = _2141;
    if (!_2143)
    {
        bool _2149 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2151 = isnan(_1043);
        bool _2153 = _2149 || _2151;
        bool _2155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2157 = _2153 || _2155;
        if (!_2157)
        {
            float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2161 = _1043 + _2159;
            float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2165 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2163;
            float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2171 = 1.0 / _2165;
            float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2189 = _2161 * _2171;
            float _2191 = precise::clamp(_2189, 0.0, 1.0);
            float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2197 = fma(_2191, _2169, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2199 = fma(_2191, _2195, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2201 = fma(_2191, _2175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2203 = fma(_2191, _2179, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2205 = fma(_2191, _2183, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2207 = fma(_2191, _2187, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2127 = _2201;
            _2147 = _2205;
            _2121 = _2197;
            _2139 = _2203;
            _2133 = _2199;
            _2113 = _2207;
            _2209 = true;
        }
        else
        {
            bool _2211 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2213 = isnan(_1043);
            bool _2215 = _2211 || _2213;
            bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2219 = _2215 || _2217;
            if (!_2219)
            {
                _2119 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2221 = _2119;
            _2121 = _2221;
            if (!_2219)
            {
                _2125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2223 = _2125;
            _2127 = _2223;
            if (!_2219)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2225 = _2131;
            _2133 = _2225;
            if (!_2219)
            {
                _2137 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2227 = _2137;
            _2139 = _2227;
            if (!_2219)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2229 = _2145;
            _2147 = _2229;
            if (!_2219)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2231 = _2111;
            bool _2233 = !_2219;
            _2113 = _2231;
            if (!_2233)
            {
                bool _2235 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2237 = isnan(_1043);
                bool _2239 = _2235 || _2237;
                bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2243 = _2239 || _2241;
                if (!_2243)
                {
                    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2247 = _1043 + _2245;
                    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2251 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2249;
                    float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2257 = 1.0 / _2251;
                    float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2275 = _2247 * _2257;
                    float _2277 = precise::clamp(_2275, 0.0, 1.0);
                    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2283 = fma(_2277, _2255, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2285 = fma(_2277, _2281, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2287 = fma(_2277, _2261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2289 = fma(_2277, _2265, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2291 = fma(_2277, _2269, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2293 = fma(_2277, _2273, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2127 = _2287;
                    _2147 = _2291;
                    _2121 = _2283;
                    _2139 = _2289;
                    _2133 = _2285;
                    _2113 = _2293;
                    _2209 = true;
                }
                else
                {
                    _2127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2121 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2139 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2209 = false;
    float _2295 = _2127;
    float _2297 = _2147;
    float _2299 = _2121;
    float _2301 = _2139;
    float _2303 = _2133;
    float _2305 = _2113;
    float _2307 = fma(_1935, -0.5, 0.5);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = -_2295;
    float _2313 = _2311 + _2297;
    float _2315 = _2117 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2317 = -_2299;
    float _2319 = _2317 + _2301;
    float _2321 = fma(_2309, _2313, _2295);
    out.m_74.x = 0.0;
    float _2323 = -_2303;
    float _2325 = _2323 + _2305;
    float _2327 = fma(_2309, _2319, _2299);
    float _2329 = _2321 * 0.586610972881317138671875;
    out.m_47.x = _2315;
    bool _2331 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2333 = fma(_2309, _2325, _2303);
    float _2335 = fma(_2327, 0.298911988735198974609375, _2329);
    bool _2337 = _1021 > 0.0;
    bool _2339 = isnan(_1021);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = fma(_2333, 0.114477999508380889892578125, _2335);
    float _2349 = -_2347;
    float _2351 = _2327 + _2349;
    float _2353 = -_2347;
    float _2355 = _2321 + _2353;
    float _2357 = -_2347;
    float _2359 = _2333 + _2357;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    float _2363 = fma(_2355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    float _2365 = fma(_2359, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    bool _2367 = !_2331;
    if (!_2367)
    {
        float _2369 = -_947;
        float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2373 = -_949;
        float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2377 = -_951;
        float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2381 = _2371 * _2371;
        float _2383 = fma(_2375, _2375, _2381);
        float _2385 = fma(_2379, _2379, _2383);
        float _2387 = sqrt(_2385);
        float _2389 = rsqrt(_2385);
        float _2391 = -_2387;
        float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2397 = precise::clamp(_2395, 0.0, 1.0);
        float _2399 = _2375 * _2389;
        float _2401 = _2371 * _2389;
        float _2403 = abs(_2397);
        float _2405 = log2(_2403);
        float _2407 = _2379 * _2389;
        float _2409 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2411 = _1935 * _2401;
        float _2413 = -_2401;
        float _2415 = -_2409;
        float _2417 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2415);
        float _2419 = fma(_1929, _2399, _2411);
        float _2421 = -_2407;
        float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2417);
        float _2425 = fma(_1943, _2407, _2419);
        float _2427 = precise::clamp(_2425, 0.0, 1.0);
        float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2431 = _2423 + _2429;
        float _2433 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2435 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2437 = precise::clamp(_2435, 0.0, 1.0);
        float _2439 = exp2(_2433);
        float _2441 = _2439 * _2437;
        float _2443 = _2427 * _2441;
        float _2445 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2447 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2449 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _2445;
        out.m_74.y = _2447;
        out.m_74.z = _2449;
    }
    out.m_76.x = _2361;
    out.m_76.y = _2363;
    out.m_76.z = _2365;
    if (_2345)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2451 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2451;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2209 = false;
    bool _529 = false;
    bool _389 = false;
    bool _195 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2508 = as_type<float>(_111);
        out.gl_Position.z = _2508;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2576 = as_type<float>(_147);
        out.gl_Position.z = _2576;
    }
    if (_141)
    {
        return out;
    }
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _193;
    if (!_175)
    {
        float _177 = in.m_53.x;
        float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _183 = fma(_181, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _185 = _183 * _179;
        float _187 = floor(_185);
        float _189 = -_187;
        float _191 = _185 + _189;
        _193 = _191;
        _195 = true;
    }
    else
    {
        float _197 = float(_95);
        float _199 = 1.0 / _197;
        float _201 = _129 * _199;
        _193 = _201;
    }
    _195 = false;
    float _203 = _193;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = _203 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _203 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _221 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _225;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _219;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _227;
    float _247 = 1.0 / _223;
    float _249 = _207 * _241;
    bool _251 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _253 = isnan(_203);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -_239;
    float _265 = _263 + 1.0;
    float _267 = _261 * _265;
    float _269 = _211 * _245;
    bool _271 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_203);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_261;
    float _285 = _283 + 1.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _291 = _281 * _285;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _215 * _247;
    bool _299 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_203);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_289, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = fma(_313, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = _309 * _295;
    float _329 = fma(_319, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = fma(_323, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _325 * _327;
    float _339 = _329 * _327;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _341;
    float _345 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _337);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _339);
    float _353 = fma(_343, _269, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _355 = fma(_315, _291, _345);
    float _357 = fma(_349, _269, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_331, _291, _351);
    float _361 = fma(_353, _267, _355);
    float _363 = fma(_357, _267, _359);
    float _365 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].x, _361);
    float _367 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].y, _363);
    bool _369 = !_243;
    float _387;
    if (!_369)
    {
        float _371 = in.m_53.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_95);
        float _393 = 1.0 / _391;
        float _395 = _129 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _401 = _397 + _399;
    bool _403 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _415;
    bool _419 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _421 = isnan(_397);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -_413;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = 1.0 / _417;
    bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _443 = _429 * _433;
    float _445 = -_429;
    float _447 = _445 + 1.0;
    float _449 = _401 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _451;
    float _455 = fma(_437, _449, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = fma(_453, _449, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _463 = _455 * _443;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = fma(_459, _449, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _469 = _461 * _443;
    float _471 = in.m_55.x;
    float _473 = in.m_55.y;
    float _475 = _467 * _443;
    float _477 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].x, _463);
    float _479 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].y, _475);
    float _481 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].x, _477);
    float _485 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].y, _479);
    float _487 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].z, _481);
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _495;
    out.m_57.y = _497;
    out.m_57.z = _499;
    out.m_57.w = _465;
    float _501 = _367 * _473;
    float _503 = _365 * _471;
    bool _505 = !_441;
    float _525;
    float _527;
    if (!_505)
    {
        float _507 = in.m_53.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _511 = float(_95);
        float _513 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _517 = _515 * _509;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _511;
        _527 = _523;
        _529 = true;
    }
    else
    {
        float _531 = float(_95);
        float _533 = 1.0 / _531;
        float _535 = _129 * _533;
        _525 = _531;
        _527 = _535;
    }
    _529 = false;
    float _537 = _525;
    float _539 = _527;
    float _541 = as_type<float>(int(gl_VertexIndex));
    float _543 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _545 = in.m_44.x;
    float _547 = in.m_44.y;
    float _549 = in.m_44.z;
    float _551 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _553 = as_type<int>(_541) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_541) & 2;
    bool _559 = _557 != 0;
    float _561 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _563 = !_559;
    float _565 = _563 ? (-0.5) : 0.5;
    bool _567 = !_555;
    float _569 = _567 ? (-0.5) : 0.5;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _565);
    float _573 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _569);
    float _575 = _543 * _571;
    float _577 = _547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = _561 * _573;
    float _581 = _547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _585 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _587 = _575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _589 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _583);
    float _593 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _585);
    float _595 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _587);
    float _597 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _591);
    float _601 = _593 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _603 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _595);
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = _599 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _609 = _547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _611 = _603 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _613 = _575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _615 = _601 + _607;
    float _617 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
    float _619 = _605 + _611;
    float _621 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _613);
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _625 = _615 + _623;
    float _627 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _617);
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _619 + _629;
    float _633 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
    float _635 = _625 * _625;
    float _637 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _639 = _633 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _641 = fma(_631, _631, _635);
    float _643 = _637 + _639;
    float _645 = sqrt(_641);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _659 = _657 != 0;
    bool _661 = !_655;
    int _663 = _661 ? 0 : 1;
    bool _665 = !_651;
    int _667 = _665 ? 0 : 1;
    bool _669 = !_659;
    int _671 = _669 ? 0 : 1;
    float _673 = _551;
    float _675 = _607;
    float _677 = _615;
    float _679 = _637;
    if (!_647)
    {
        _673 = _619;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_647)
    {
        _675 = _643;
    }
    float _685 = _675;
    bool _687 = !_647;
    float _689 = _685;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _645 + _693;
        float _697 = _643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_641);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _717 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _719 = _699 * _715;
        float _721 = fma(_643, _707, _717);
        float _723 = fma(_631, _719, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_625, _719, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _721;
        _683 = _723;
        _677 = _725;
    }
    float _727 = _689;
    float _729 = _683;
    float _731 = _677;
    float _733 = -_637;
    float _735 = _733 + _727;
    float _737 = -_605;
    float _739 = _737 + _729;
    float _741 = -_601;
    float _743 = _741 + _731;
    float _745 = _637 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _747 = _735 * _735;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    float _761 = fma(_739, _739, _747);
    bool _763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _765 = isnan(0.5);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _771 = _767 || _769;
    float _773 = fma(_743, _743, _761);
    float _775 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[11].z, _759);
    float _777 = _637 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = sqrt(_773);
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _783 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _785 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[10].z, _783);
    float _787 = 1.0 / _781;
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _791 = _789 + _781;
    bool _793 = _779 > 0.0;
    float _795 = _791 * _787;
    float _797 = _795 * 0.5;
    bool _799 = !_793;
    float _801 = _729;
    float _803 = _789;
    float _805 = _727;
    float _807 = _731;
    float _809 = _735;
    float _811 = _773;
    float _813 = _743;
    float _815 = _797;
    if (!_799)
    {
        float _817 = _171 * _171;
        float _819 = rsqrt(_773);
        float _821 = fma(_169, _169, _817);
        float _823 = fma(_173, _173, _821);
        float _825 = sqrt(_823);
        float _827 = _739 * _819;
        float _829 = _735 * _819;
        float _831 = _743 * _819;
        bool _833 = _825 > 0.0;
        bool _835 = !_833;
        _803 = _819;
        _809 = _829;
        _813 = _831;
        if (!_835)
        {
            float _837 = rsqrt(_823);
            float _839 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _841 = _171 * _837;
            float _843 = _169 * _837;
            float _845 = _829 * _841;
            float _847 = _173 * _837;
            float _849 = fma(_827, _843, _845);
            float _851 = _839 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _853 = fma(_831, _847, _849);
            float _855 = _853 * _851;
            float _857 = fma(_169, _855, _729);
            float _859 = fma(_171, _855, _727);
            float _861 = fma(_173, _855, _731);
            _801 = _857;
            _803 = _843;
            _805 = _859;
            _807 = _861;
            _809 = _849;
            _811 = _851;
        }
    }
    float _863 = _801;
    float _865 = _803;
    float _867 = _805;
    float _869 = _807;
    float _871 = _809;
    float _873 = _811;
    float _875 = _813;
    float _877 = _871;
    float _879 = _873;
    float _881 = _867;
    float _883 = _869;
    float _885 = _865;
    float _887 = _875;
    if (_771)
    {
        _877 = 1.0;
    }
    float _889 = _877;
    float _891 = _889;
    if (_757)
    {
        _879 = _863;
    }
    float _893 = _879;
    float _895 = _893;
    if (!_757)
    {
        float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _899 = _637 + _897;
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _903 = _605 + _901;
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _907 = _899 * _899;
        float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _911 = _601 + _909;
        float _913 = fma(_903, _903, _907);
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _917 = fma(_911, _911, _913);
        float _919 = sqrt(_917);
        float _921 = _905 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _923 = precise::min(_919, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _925 = _923 * _915;
        float _927 = -_605;
        float _929 = _927 + _863;
        float _931 = _921 * _925;
        float _933 = -_637;
        float _935 = _933 + _867;
        float _937 = -_601;
        float _939 = _937 + _869;
        float _941 = fma(_929, _931, _605);
        float _943 = fma(_935, _931, _637);
        float _945 = fma(_939, _931, _601);
        _881 = _943;
        _895 = _941;
        _883 = _945;
        _885 = _939;
    }
    float _947 = _881;
    float _949 = _895;
    float _951 = _883;
    float _953 = _885;
    float _955 = _953;
    if (!_771)
    {
        float _957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _959 = _957 * 0.15915493667125701904296875;
        float _961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _963 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _965 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _963);
        float _967 = _959 * 6.283185482025146484375;
        float _969 = cos(_967);
        float _971 = _961 * 0.15915493667125701904296875;
        float _973 = _959 * 6.283185482025146484375;
        float _975 = sin(_973);
        float _977 = 1.0 / _969;
        float _979 = _971 * 6.283185482025146484375;
        float _981 = cos(_979);
        float _983 = _975 * _977;
        float _985 = _971 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _981 * _983;
        float _991 = 1.0 / _965;
        float _993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _995 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _993;
        float _997 = 1.0 / _989;
        float _999 = 1.0 / _995;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1003 = _991 * _1001;
        float _1005 = _987 * _997;
        float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1009 = fma(_1005, _1003, _1007);
        float _1011 = _1009 * _999;
        float _1013 = precise::clamp(_1011, 0.0, 1.0);
        _815 = _991;
        _955 = _959;
        _679 = _971;
        _891 = _1013;
    }
    float _1015 = _815;
    float _1017 = _955;
    float _1019 = _679;
    float _1021 = _891;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _947 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _949 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _951 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = rsqrt(_1039);
    float _1043 = sqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1029 * _1045;
    float _1049 = _1033 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1015;
    float _1067 = _1063;
    float _1069 = _1017;
    float _1071 = _1025;
    float _1073 = _1047;
    if (_1059)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1075;
    }
    float _1077 = _1065;
    float _1079 = _1077;
    if (_1059)
    {
        float _1081 = _1063 * _1077;
        _1067 = _1081;
    }
    float _1083 = _1067;
    if (_1059)
    {
        float _1085 = rsqrt(_1055);
        _1079 = _1085;
    }
    float _1087 = _1079;
    float _1089 = _1087;
    if (_1059)
    {
        float _1091 = _1083 * 0.15915493667125701904296875;
        _1069 = _1091;
    }
    float _1093 = _1069;
    float _1095 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1097 = _1033;
    if (_1059)
    {
        float _1099 = _1093 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        _1097 = _1101;
    }
    float _1103 = _1097;
    float _1105 = precise::max(0.0, _1095);
    float _1107 = _1019;
    float _1109 = _1105;
    if (_1059)
    {
        float _1111 = _1093 * 6.283185482025146484375;
        float _1113 = cos(_1111);
        _1107 = _1113;
    }
    float _1115 = _1107;
    float _1117 = -_1045;
    float _1119 = -_1105;
    float _1121 = fma(_1025, _1117, _1119);
    if (_1059)
    {
        float _1123 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1123;
    }
    float _1125 = _1071;
    float _1127 = _1103;
    float _1129 = _1125;
    if (_1059)
    {
        float _1131 = fma(_1103, _1125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1127 = _1131;
    }
    float _1133 = _1127;
    float _1135 = _1133;
    if (!_1059)
    {
        _1129 = _1121;
    }
    float _1137 = _1129;
    float _1139 = _947 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1141 = _1137;
    if (_1059)
    {
        float _1143 = _1087 * _1133;
        _887 = _1143;
    }
    float _1145 = _887;
    if (!_1059)
    {
        _1135 = _1051;
    }
    float _1147 = _1135;
    float _1149 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1139);
    float _1151 = _1147;
    float _1153 = _1115;
    if (_1059)
    {
        float _1155 = _1115 + (-1.0);
        _1109 = _1155;
    }
    float _1157 = _1109;
    float _1159 = _1157;
    if (_1059)
    {
        float _1161 = _1047 * _1145;
        _1073 = _1161;
    }
    float _1163 = _1073;
    float _1165 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1149);
    if (_1059)
    {
        float _1167 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1167;
    }
    float _1169 = _1089;
    if (!_1059)
    {
        _1159 = _1049;
    }
    float _1171 = _1159;
    float _1173 = _1171;
    if (_1059)
    {
        float _1175 = _1049 * _1145;
        _1173 = _1175;
    }
    float _1177 = _1173;
    if (_1059)
    {
        float _1179 = _1163 * _1163;
        _1151 = _1179;
    }
    float _1181 = _1151;
    if (_1059)
    {
        float _1183 = fma(_1121, _1115, _1169);
        _1141 = _1183;
    }
    float _1185 = _1141;
    if (!_1059)
    {
        _1153 = _1053;
    }
    float _1187 = _1153;
    float _1189 = _1187;
    if (_1059)
    {
        float _1191 = _1177 * _1177;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = fma(_1185, _1185, _1181);
    float _1197 = _947 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1199 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1201 = _947 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1203 = _1195 + _1193;
    float _1205 = _947 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1207 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1197);
    float _1209 = rsqrt(_1203);
    float _1211 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1213 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1205);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1217 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1215);
    float _1219 = precise::clamp(_1217, 0.0, 1.0);
    float _1221 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1207);
    float _1223 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1225 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1213);
    float _1227 = -_1219;
    float _1229 = _1227 + 1.0;
    float _1231 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1233 = -_1223;
    float _1235 = fma(_1233, _1211, 1.0);
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1201);
    float _1241 = abs(_1229);
    float _1243 = log2(_1241);
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1247 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1249 = _1209 * _1185;
    float _1251 = _1209 * _1177;
    float _1253 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1245);
    float _1255 = _1209 * _1163;
    float _1257 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = log2(_1235);
    float _1261 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1253);
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1265 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1261);
    float _1267 = -_1263;
    float _1269 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1267);
    float _1271 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1273 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = 1.0 / _1265;
    float _1277 = -_1251;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1269);
    float _1281 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1283 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1271);
    float _1285 = fma(_1279, -0.5, 0.5);
    float _1287 = fma(_1279, 0.5, 0.5);
    float _1289 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1281);
    float _1291 = exp2(_1273);
    float _1293 = _1249 + 1.0;
    float _1295 = fma(_1287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1297 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1289);
    float _1299 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1283);
    float _1301 = _1259 * 0.693147182464599609375;
    float _1303 = fma(_1287, _1295, -0.212114393711090087890625);
    float _1305 = sqrt(_1285);
    float _1307 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1309 = fma(_1287, _1303, 1.570728778839111328125);
    float _1311 = -_1249;
    float _1313 = fma(_1291, _1293, _1311);
    float _1315 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1317 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1299);
    float _1319 = fma(_1313, 0.5, 0.5);
    float _1321 = _1315 * _1275;
    float _1323 = _1317 * _1275;
    float _1325 = _1305 * 0.636619746685028076171875;
    float _1327 = fma(_1321, 0.5, 0.5);
    float _1329 = fma(_1323, -0.5, 0.5);
    float _1331 = -_1309;
    float _1333 = fma(_1325, _1331, 1.0);
    float3 _4480 = float3(_1327, _1329, _1307);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4480, float3(0.0), isnan(_4480)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4480, float3(0.0), isnan(_4480)), level(0.0)).x;
    float3 _4491 = float3(_1327, _1329, _1307);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4491, float3(0.0), isnan(_4491)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4491, float3(0.0), isnan(_4491)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float2 _4508 = float2(_1333, _1319);
    float3 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4508, float2(0.0), isnan(_4508)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4508, float2(0.0), isnan(_4508)), level(0.0)).xyz;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1360 = int(_1358);
    int _1362 = abs(_667);
    float _1364 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1366 = abs(_671);
    float _1368 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1370 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1364);
    float _1372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1374 = int(_1372);
    float _1376 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1370);
    float _1378 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1380 = float(_1360);
    float _1382 = 1.0 / _537;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1317;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1265;
    float _1384 = float(uint(_1374));
    float _1386 = 1.0 / _1380;
    int _1388 = ~_1374;
    int _1390 = _1388 + 1;
    int _1392 = ~_1374;
    int _1394 = _1392 + 1;
    int _1396 = ~_1374;
    int _1398 = _1396 + 1;
    float _1400 = 1.0 / _1384;
    float _1402 = _129 * _1386;
    float _1404 = exp2(_1368);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>(_1400) + (-2);
    float _1412 = trunc(_1402);
    int _1414 = int(_1412);
    bool _1416 = !_1408;
    float _1418 = _1416 ? 7.345489978790283203125 : 1.0;
    float _1420 = _1378 + _1265;
    float _1422 = -_1404;
    float _1424 = _1422 + 1.0;
    float _1426 = float(uint(_1414));
    float _1428 = as_type<float>(_1410) * _1426;
    float _1430 = in.m_53.x;
    float _1432 = in.m_53.y;
    float _1434 = trunc(_1428);
    float _1436 = precise::max(_1434, 0.0);
    uint _1439 = uint(_1436);
    int _1441 = _1390 * int(_1439);
    int _1443 = _1441 + _1414;
    float _1445 = float(_1414);
    float _1447 = _1418 * _1430;
    float _1449 = float(uint(_1443));
    bool _1451 = _1430 > 0.5;
    float _1453 = as_type<float>(_1410) * _1449;
    float _1455 = floor(_1447);
    float _1457 = trunc(_1453);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    float _1463 = -_1455;
    float _1465 = _1447 + _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1469 = _1467 != 0;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    int _1475 = int(_1439) + int(_1461);
    float _1477 = float(_1374);
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1481 = _1479 != 0;
    int _1483 = _1394 * _1475;
    int _1485 = _1483 + _1414;
    bool _1487 = _1445 >= _1477;
    bool _1489 = isnan(_1445);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan(_1477);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _129 * _1477;
    float _1501 = _1465 * _1477;
    bool _1503 = uint(_1485) >= uint(_1374);
    float _1505 = _1499 * _1382;
    float _1507 = trunc(_1497);
    int _1509 = int(_1507);
    int _1511 = _1374 + (-1);
    bool _1513 = !_1503;
    int _1515 = _1513 ? 0 : (-1);
    bool _1517 = _1374 == 0;
    int _1519 = ~_1475;
    int _1521 = _1519 + _1515;
    int _1523 = _1521 + 1;
    float _1525 = trunc(_1501);
    int _1527 = int(_1525);
    bool _1529 = !_1469;
    int _1531 = _1529 ? 0 : 1;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1535 = _1533 != 0;
    int _1537 = _1374 * _1523;
    int _1539 = _1537 + _1414;
    int _1541 = abs(_663);
    int _1543 = abs(_1531);
    float _1545 = trunc(_1505);
    int _1547 = int(_1545);
    int _1549 = ~_1509;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    bool _1555 = !_1517;
    int _1557 = _1555 ? _1539 : (-1);
    int _1559 = _1557 * _1553;
    int _1561 = ~_1374;
    int _1563 = _1561 + 1;
    int _1565 = _1527 * _1543;
    int _1567 = _1565 + _1414;
    int _1569 = _1509 * _1511;
    int _1571 = _1569 + _1559;
    bool _1573 = !_1535;
    int _1575 = _1573 ? 0 : 1;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1579 = _1577 != 0;
    int _1581 = _1571 * _1541;
    int _1583 = abs(_1575);
    float _1585 = float(uint(_1567));
    int _1587 = _1547 * _1362;
    int _1589 = _1587 + _1581;
    int _1591 = ~_1374;
    int _1593 = _1591 + 1;
    int _1595 = ~_1374;
    int _1597 = _1595 + 1;
    int _1599 = _1567 * _1366;
    int _1601 = _1599 + _1589;
    float _1603 = as_type<float>(_1410) * _1585;
    int _1605 = _1527 * _1583;
    int _1607 = _1605 + _1601;
    float _1609 = trunc(_1603);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    float _1615 = float(uint(_1607));
    float _1617 = as_type<float>(_1410) * _1615;
    float _1619 = trunc(_1617);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1563 * int(_1613);
    int _1627 = _1625 + _1567;
    float _1629 = float(uint(_1627));
    float _1631 = as_type<float>(_1410) * _1629;
    int _1633 = _1593 * int(_1623);
    int _1635 = _1633 + _1607;
    float _1637 = trunc(_1631);
    float _1639 = precise::max(_1637, 0.0);
    uint _1641 = uint(_1639);
    float _1643 = float(uint(_1635));
    float _1645 = as_type<float>(_1410) * _1643;
    float _1647 = _565 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1649 = trunc(_1645);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1657 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1661 = int(_1623) + int(_1653);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1663;
    int _1667 = _1597 * _1661;
    int _1669 = _1667 + _1607;
    float _1671 = 1.0 / _1665;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1675 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1677 = uint(_1669) >= uint(_1374);
    float _1679 = -_1673;
    float _1681 = fma(_1675, 2.0, _1679);
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1685 = !_1677;
    int _1687 = _1685 ? 0 : (-1);
    float _1689 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1683);
    int _1691 = ~_1661;
    int _1693 = _1691 + _1687;
    int _1695 = _1693 + 1;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1699 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1703 = _1432 > 0.5;
    int _1705 = _1374 * _1695;
    int _1707 = _1705 + _1607;
    float _1709 = fma(_1699, -2.0, _1697);
    float _1711 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1701);
    float _1713 = -_129;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1681);
    float _1717 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1689);
    float _1719 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1709);
    bool _1721 = !_1517;
    int _1723 = _1721 ? _1707 : (-1);
    float _1725 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1711);
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1729 = _539 + _1727;
    bool _1731 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1733 = isnan(_539);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1739 = _1735 || _1737;
    float _1741 = float(_1739);
    float _1743 = -_1717;
    float _1745 = _1743 + 1.0;
    bool _1747 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1749 = isnan(_539);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = _1729 * _1671;
    int _1761 = _1723 >> 31;
    float _1763 = -_1741;
    float _1765 = _1763 + 1.0;
    int _1767 = _1761 & 3;
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1769;
    int _1773 = _1723 + _1767;
    float _1775 = -_1757;
    float _1777 = _1775 + 1.0;
    float _1779 = fma(_1771, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1781 = _1773 >> 2;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1783;
    float _1787 = _1741 * _1777;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1789;
    int _1793 = _1781 << 4;
    int _1795 = _1793 + 368;
    float _1797 = fma(_1785, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1799 = _1779 * _1787;
    float _1801 = fma(_1791, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1803 = -_565;
    int _1805 = _1703 ? as_type<int>(_1803) : as_type<int>(_565);
    uint _1807 = uint(int(uint(_1795) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[int(_1817)][_1819];
    float _1823 = _1797 * _1787;
    float _1825 = _1801 * _1787;
    float _1827 = -_569;
    int _1829 = _1451 ? as_type<int>(_1827) : as_type<int>(_569);
    float _1831 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1799);
    bool _1833 = !_1481;
    float _1835 = _1833 ? _565 : as_type<float>(_1805);
    float _1837 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1839 = !_1473;
    float _1841 = _1839 ? _569 : as_type<float>(_1829);
    float _1843 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1823);
    int _1845 = _1723 & 3;
    bool _1847 = _1845 != 0;
    int _1849 = _1795 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = _1723 & 3;
    bool _1869 = _1867 != 0;
    float _1871 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1655);
    bool _1873 = uint(_1845) > 1u;
    float _1875 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1657);
    int _1877 = _1869 ? 0 : 1;
    float _1879 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1825);
    int _1881 = int(_1613) + int(_1641);
    float _1883 = _1841 + 0.5;
    int _1885 = ~_1877;
    int _1887 = _1885 + 1;
    int _1889 = _1887 + 1;
    float _1891 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1831);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1715);
    bool _1895 = uint(_1845) >= 2u;
    float _1897 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1843);
    bool _1899 = !_1847;
    int _1901 = _1899 ? 0 : 1;
    int _1903 = _1398 * _1881;
    int _1905 = _1903 + _1567;
    int _1907 = _1889;
    float _1909 = _1265;
    if (!_1873)
    {
        int _1911 = ~_1877;
        int _1913 = _1911 + 1;
        _1907 = _1913;
    }
    int _1915 = _1907;
    float _1917 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1879);
    bool _1919 = _1845 != 3;
    float _1921 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1659);
    int _1923 = abs(_1915);
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1927 = _1895 ? 0 : 1;
    float _1929 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1931 = _1925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1933 = uint(_1905) >= uint(_1374);
    float _1935 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    int _1937 = ~_1927;
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    float _1943 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    bool _1945 = _1845 != 3;
    int _1947 = _1941;
    if (_1919)
    {
        int _1949 = ~_1927;
        int _1951 = _1949 + 1;
        _1947 = _1951;
    }
    int _1953 = _1947;
    int _1955 = ~_1923;
    int _1957 = _1955 + 1;
    int _1959 = _1957 + 1;
    out.m_62.x = _1929;
    out.m_62.y = _1935;
    out.m_62.z = _1943;
    bool _1961 = !_1933;
    int _1963 = _1961 ? 0 : (-1);
    int _1965 = abs(_1901);
    int _1967 = _1959 * as_type<int>(_1821);
    bool _1969 = !_1945;
    int _1971 = _1969 ? 0 : (-1);
    int _1973 = abs(_1953);
    int _1975 = ~_1881;
    int _1977 = _1975 + _1963;
    int _1979 = _1977 + 1;
    float _1981 = _1835 + (-0.5);
    bool _1983 = !_1579;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = abs(_1971);
    float _1989 = -_1981;
    float _1991 = -_1719;
    float _1993 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1991);
    int _1995 = ~_1965;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    int _2001 = _1374 * _1979;
    int _2003 = _2001 + _1567;
    int _2005 = abs(_1985);
    int _2007 = _1999 * as_type<int>(_1813);
    int _2009 = _2007 + _1967;
    int _2011 = ~_1973;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    int _2017 = ~_1987;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    int _2023 = _2015 * as_type<int>(_1857);
    int _2025 = _2023 + _2009;
    int _2027 = ~_2005;
    int _2029 = _2027 + 1;
    int _2031 = _2029 + 1;
    float _2033 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2035 = _2021 * as_type<int>(_1865);
    int _2037 = _2035 + _2025;
    float _2039 = -_1725;
    float _2041 = _2039 + 1.0;
    bool _2043 = !_1517;
    int _2045 = _2043 ? _2003 : (-1);
    float _2047 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2049 = _2037 * _2031;
    float _2051 = -_1745;
    float _2053 = fma(_1841, _2051, _1893);
    float _2055 = fma(_1835, _2041, _1993);
    bool _2057 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2059 = isnan(_1043);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2065 = _2061 || _2063;
    int _2067 = _2045 * _2005;
    int _2069 = _2067 + _2049;
    float _2071 = _1897 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_64.x = _2053;
    out.m_64.y = _2055;
    float _2073 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = float(_2069);
    out.m_66.x = _2047;
    out.m_66.y = _2073;
    out.m_66.z = _1931;
    float _2077 = _1420 * 0.5;
    float _2079 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2075;
    float _2081 = _2079 * _1335;
    float _2083 = -_2079;
    float _2085 = _2083 + 1.0;
    float _2087 = _1352;
    float _2089 = _1342;
    float _2091 = _1340;
    float _2093 = _1346;
    float _2095 = _1344;
    if (!_2065)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2097 = _1909;
    out.m_70.z = _2077;
    out.m_70.w = _1265;
    float _2099 = _1346 * _2081;
    float _2101 = _1356 * _2081;
    float _2103 = _1346 * _2085;
    float _2105 = fma(_1352, _2099, _1340);
    float _2107 = fma(_1354, _2099, _1342);
    float _2109 = fma(_1346, _2101, _1344);
    float _2111 = _2097;
    float _2113 = _2097;
    if (!_2065)
    {
        _2087 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2115 = _2087;
    float _2117 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2119 = _2115;
    float _2121 = _2115;
    if (!_2065)
    {
        _2089 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2123 = _2089;
    out.m_72.x = _2105;
    out.m_72.y = _2107;
    out.m_72.z = _2109;
    out.m_72.w = _2103;
    float _2125 = _2123;
    float _2127 = _2123;
    if (!_2065)
    {
        _2091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2129 = _2091;
    float _2131 = _2129;
    float _2133 = _2129;
    if (!_2065)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2135 = _2093;
    float _2137 = _2135;
    float _2139 = _2135;
    if (!_2065)
    {
        _2095 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2141 = _2095;
    bool _2143 = !_2065;
    float _2145 = _2141;
    float _2147 = _2141;
    if (!_2143)
    {
        bool _2149 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2151 = isnan(_1043);
        bool _2153 = _2149 || _2151;
        bool _2155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2157 = _2153 || _2155;
        if (!_2157)
        {
            float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2161 = _1043 + _2159;
            float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2165 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2163;
            float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2171 = 1.0 / _2165;
            float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2189 = _2161 * _2171;
            float _2191 = precise::clamp(_2189, 0.0, 1.0);
            float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2197 = fma(_2191, _2169, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2199 = fma(_2191, _2195, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2201 = fma(_2191, _2175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2203 = fma(_2191, _2179, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2205 = fma(_2191, _2183, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2207 = fma(_2191, _2187, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2127 = _2201;
            _2147 = _2205;
            _2121 = _2197;
            _2139 = _2203;
            _2133 = _2199;
            _2113 = _2207;
            _2209 = true;
        }
        else
        {
            bool _2211 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2213 = isnan(_1043);
            bool _2215 = _2211 || _2213;
            bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2219 = _2215 || _2217;
            if (!_2219)
            {
                _2119 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2221 = _2119;
            _2121 = _2221;
            if (!_2219)
            {
                _2125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2223 = _2125;
            _2127 = _2223;
            if (!_2219)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2225 = _2131;
            _2133 = _2225;
            if (!_2219)
            {
                _2137 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2227 = _2137;
            _2139 = _2227;
            if (!_2219)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2229 = _2145;
            _2147 = _2229;
            if (!_2219)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2231 = _2111;
            bool _2233 = !_2219;
            _2113 = _2231;
            if (!_2233)
            {
                bool _2235 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2237 = isnan(_1043);
                bool _2239 = _2235 || _2237;
                bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2243 = _2239 || _2241;
                if (!_2243)
                {
                    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2247 = _1043 + _2245;
                    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2251 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2249;
                    float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2257 = 1.0 / _2251;
                    float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2275 = _2247 * _2257;
                    float _2277 = precise::clamp(_2275, 0.0, 1.0);
                    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2283 = fma(_2277, _2255, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2285 = fma(_2277, _2281, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2287 = fma(_2277, _2261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2289 = fma(_2277, _2265, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2291 = fma(_2277, _2269, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2293 = fma(_2277, _2273, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2127 = _2287;
                    _2147 = _2291;
                    _2121 = _2283;
                    _2139 = _2289;
                    _2133 = _2285;
                    _2113 = _2293;
                    _2209 = true;
                }
                else
                {
                    _2127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2121 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2139 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2209 = false;
    float _2295 = _2127;
    float _2297 = _2147;
    float _2299 = _2121;
    float _2301 = _2139;
    float _2303 = _2133;
    float _2305 = _2113;
    float _2307 = fma(_1935, -0.5, 0.5);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = -_2295;
    float _2313 = _2311 + _2297;
    float _2315 = _2117 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2317 = -_2299;
    float _2319 = _2317 + _2301;
    float _2321 = fma(_2309, _2313, _2295);
    out.m_74.x = 0.0;
    float _2323 = -_2303;
    float _2325 = _2323 + _2305;
    float _2327 = fma(_2309, _2319, _2299);
    float _2329 = _2321 * 0.586610972881317138671875;
    out.m_47.x = _2315;
    bool _2331 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2333 = fma(_2309, _2325, _2303);
    float _2335 = fma(_2327, 0.298911988735198974609375, _2329);
    bool _2337 = _1021 > 0.0;
    bool _2339 = isnan(_1021);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = fma(_2333, 0.114477999508380889892578125, _2335);
    float _2349 = -_2347;
    float _2351 = _2327 + _2349;
    float _2353 = -_2347;
    float _2355 = _2321 + _2353;
    float _2357 = -_2347;
    float _2359 = _2333 + _2357;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    float _2363 = fma(_2355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    float _2365 = fma(_2359, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    bool _2367 = !_2331;
    if (!_2367)
    {
        float _2369 = -_947;
        float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2373 = -_949;
        float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2377 = -_951;
        float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2381 = _2371 * _2371;
        float _2383 = fma(_2375, _2375, _2381);
        float _2385 = fma(_2379, _2379, _2383);
        float _2387 = sqrt(_2385);
        float _2389 = rsqrt(_2385);
        float _2391 = -_2387;
        float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2397 = precise::clamp(_2395, 0.0, 1.0);
        float _2399 = _2375 * _2389;
        float _2401 = _2371 * _2389;
        float _2403 = abs(_2397);
        float _2405 = log2(_2403);
        float _2407 = _2379 * _2389;
        float _2409 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2411 = _1935 * _2401;
        float _2413 = -_2401;
        float _2415 = -_2409;
        float _2417 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2415);
        float _2419 = fma(_1929, _2399, _2411);
        float _2421 = -_2407;
        float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2417);
        float _2425 = fma(_1943, _2407, _2419);
        float _2427 = precise::clamp(_2425, 0.0, 1.0);
        float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2431 = _2423 + _2429;
        float _2433 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2435 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2437 = precise::clamp(_2435, 0.0, 1.0);
        float _2439 = exp2(_2433);
        float _2441 = _2439 * _2437;
        float _2443 = _2427 * _2441;
        float _2445 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2447 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2449 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _2445;
        out.m_74.y = _2447;
        out.m_74.z = _2449;
    }
    out.m_76.x = _2361;
    out.m_76.y = _2363;
    out.m_76.z = _2365;
    if (_2345)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2451 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2451;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2209 = false;
    bool _529 = false;
    bool _389 = false;
    bool _195 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2508 = as_type<float>(_111);
        out.gl_Position.z = _2508;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2576 = as_type<float>(_147);
        out.gl_Position.z = _2576;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _193;
    if (!_175)
    {
        float _177 = in.m_53.x;
        float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _183 = fma(_181, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _185 = _183 * _179;
        float _187 = floor(_185);
        float _189 = -_187;
        float _191 = _185 + _189;
        _193 = _191;
        _195 = true;
    }
    else
    {
        float _197 = float(_95);
        float _199 = 1.0 / _197;
        float _201 = _129 * _199;
        _193 = _201;
    }
    _195 = false;
    float _203 = _193;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = _203 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = _203 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _203 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _221 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _225;
    bool _229 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _231 = isnan(_203);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _219;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _227;
    float _247 = 1.0 / _223;
    float _249 = _207 * _241;
    bool _251 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _253 = isnan(_203);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -_239;
    float _265 = _263 + 1.0;
    float _267 = _261 * _265;
    float _269 = _211 * _245;
    bool _271 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_203);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_261;
    float _285 = _283 + 1.0;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _291 = _281 * _285;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _215 * _247;
    bool _299 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_203);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_289, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _325 = fma(_313, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _327 = _309 * _295;
    float _329 = fma(_319, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = fma(_323, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _325 * _327;
    float _339 = _329 * _327;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _341;
    float _345 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _337);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _339);
    float _353 = fma(_343, _269, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _355 = fma(_315, _291, _345);
    float _357 = fma(_349, _269, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_331, _291, _351);
    float _361 = fma(_353, _267, _355);
    float _363 = fma(_357, _267, _359);
    float _365 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].x, _361);
    float _367 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].y, _363);
    bool _369 = !_243;
    float _387;
    if (!_369)
    {
        float _371 = in.m_53.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_95);
        float _393 = 1.0 / _391;
        float _395 = _129 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _401 = _397 + _399;
    bool _403 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _415;
    bool _419 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _421 = isnan(_397);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -_413;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = 1.0 / _417;
    bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _443 = _429 * _433;
    float _445 = -_429;
    float _447 = _445 + 1.0;
    float _449 = _401 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _451;
    float _455 = fma(_437, _449, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = fma(_453, _449, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _463 = _455 * _443;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = fma(_459, _449, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _469 = _461 * _443;
    float _471 = in.m_55.x;
    float _473 = in.m_55.y;
    float _475 = _467 * _443;
    float _477 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].x, _463);
    float _479 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].y, _475);
    float _481 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].x, _477);
    float _485 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].y, _479);
    float _487 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[108].z, _481);
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _495;
    out.m_57.y = _497;
    out.m_57.z = _499;
    out.m_57.w = _465;
    float _501 = _367 * _473;
    float _503 = _365 * _471;
    bool _505 = !_441;
    float _525;
    float _527;
    if (!_505)
    {
        float _507 = in.m_53.x;
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _511 = float(_95);
        float _513 = _507 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _517 = _515 * _509;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _511;
        _527 = _523;
        _529 = true;
    }
    else
    {
        float _531 = float(_95);
        float _533 = 1.0 / _531;
        float _535 = _129 * _533;
        _525 = _531;
        _527 = _535;
    }
    _529 = false;
    float _537 = _525;
    float _539 = _527;
    float _541 = as_type<float>(int(gl_VertexIndex));
    float _543 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _545 = in.m_44.x;
    float _547 = in.m_44.y;
    float _549 = in.m_44.z;
    float _551 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _553 = as_type<int>(_541) & 1;
    bool _555 = _553 != 0;
    int _557 = as_type<int>(_541) & 2;
    bool _559 = _557 != 0;
    float _561 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _563 = !_559;
    float _565 = _563 ? (-0.5) : 0.5;
    bool _567 = !_555;
    float _569 = _567 ? (-0.5) : 0.5;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _565);
    float _573 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _569);
    float _575 = _543 * _571;
    float _577 = _547 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = _561 * _573;
    float _581 = _547 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _585 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _587 = _575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _589 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _583);
    float _593 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].z, _585);
    float _595 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _587);
    float _597 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _591);
    float _601 = _593 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _603 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _595);
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = _599 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _609 = _547 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _611 = _603 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _613 = _575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _615 = _601 + _607;
    float _617 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
    float _619 = _605 + _611;
    float _621 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _613);
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _625 = _615 + _623;
    float _627 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].z, _617);
    float _629 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _631 = _619 + _629;
    float _633 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
    float _635 = _625 * _625;
    float _637 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _639 = _633 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _641 = fma(_631, _631, _635);
    float _643 = _637 + _639;
    float _645 = sqrt(_641);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _659 = _657 != 0;
    bool _661 = !_655;
    int _663 = _661 ? 0 : 1;
    bool _665 = !_651;
    int _667 = _665 ? 0 : 1;
    bool _669 = !_659;
    int _671 = _669 ? 0 : 1;
    float _673 = _551;
    float _675 = _607;
    float _677 = _615;
    float _679 = _637;
    if (!_647)
    {
        _673 = _619;
    }
    float _681 = _673;
    float _683 = _681;
    if (!_647)
    {
        _675 = _643;
    }
    float _685 = _675;
    bool _687 = !_647;
    float _689 = _685;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _645 + _693;
        float _697 = _643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_641);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _717 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _719 = _699 * _715;
        float _721 = fma(_643, _707, _717);
        float _723 = fma(_631, _719, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_625, _719, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _721;
        _683 = _723;
        _677 = _725;
    }
    float _727 = _689;
    float _729 = _683;
    float _731 = _677;
    float _733 = -_637;
    float _735 = _733 + _727;
    float _737 = -_605;
    float _739 = _737 + _729;
    float _741 = -_601;
    float _743 = _741 + _731;
    float _745 = _637 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _747 = _735 * _735;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    float _761 = fma(_739, _739, _747);
    bool _763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _765 = isnan(0.5);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _771 = _767 || _769;
    float _773 = fma(_743, _743, _761);
    float _775 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[11].z, _759);
    float _777 = _637 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _779 = sqrt(_773);
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _783 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _777);
    float _785 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[10].z, _783);
    float _787 = 1.0 / _781;
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _791 = _789 + _781;
    bool _793 = _779 > 0.0;
    float _795 = _791 * _787;
    float _797 = _795 * 0.5;
    bool _799 = !_793;
    float _801 = _729;
    float _803 = _789;
    float _805 = _727;
    float _807 = _731;
    float _809 = _735;
    float _811 = _773;
    float _813 = _743;
    float _815 = _797;
    if (!_799)
    {
        float _817 = _171 * _171;
        float _819 = rsqrt(_773);
        float _821 = fma(_169, _169, _817);
        float _823 = fma(_173, _173, _821);
        float _825 = sqrt(_823);
        float _827 = _739 * _819;
        float _829 = _735 * _819;
        float _831 = _743 * _819;
        bool _833 = _825 > 0.0;
        bool _835 = !_833;
        _803 = _819;
        _809 = _829;
        _813 = _831;
        if (!_835)
        {
            float _837 = rsqrt(_823);
            float _839 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _841 = _171 * _837;
            float _843 = _169 * _837;
            float _845 = _829 * _841;
            float _847 = _173 * _837;
            float _849 = fma(_827, _843, _845);
            float _851 = _839 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _853 = fma(_831, _847, _849);
            float _855 = _853 * _851;
            float _857 = fma(_169, _855, _729);
            float _859 = fma(_171, _855, _727);
            float _861 = fma(_173, _855, _731);
            _801 = _857;
            _803 = _843;
            _805 = _859;
            _807 = _861;
            _809 = _849;
            _811 = _851;
        }
    }
    float _863 = _801;
    float _865 = _803;
    float _867 = _805;
    float _869 = _807;
    float _871 = _809;
    float _873 = _811;
    float _875 = _813;
    float _877 = _871;
    float _879 = _873;
    float _881 = _867;
    float _883 = _869;
    float _885 = _865;
    float _887 = _875;
    if (_771)
    {
        _877 = 1.0;
    }
    float _889 = _877;
    float _891 = _889;
    if (_757)
    {
        _879 = _863;
    }
    float _893 = _879;
    float _895 = _893;
    if (!_757)
    {
        float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _899 = _637 + _897;
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _903 = _605 + _901;
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _907 = _899 * _899;
        float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _911 = _601 + _909;
        float _913 = fma(_903, _903, _907);
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _917 = fma(_911, _911, _913);
        float _919 = sqrt(_917);
        float _921 = _905 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _923 = precise::min(_919, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _925 = _923 * _915;
        float _927 = -_605;
        float _929 = _927 + _863;
        float _931 = _921 * _925;
        float _933 = -_637;
        float _935 = _933 + _867;
        float _937 = -_601;
        float _939 = _937 + _869;
        float _941 = fma(_929, _931, _605);
        float _943 = fma(_935, _931, _637);
        float _945 = fma(_939, _931, _601);
        _881 = _943;
        _895 = _941;
        _883 = _945;
        _885 = _939;
    }
    float _947 = _881;
    float _949 = _895;
    float _951 = _883;
    float _953 = _885;
    float _955 = _953;
    if (!_771)
    {
        float _957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _959 = _957 * 0.15915493667125701904296875;
        float _961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _963 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _965 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _963);
        float _967 = _959 * 6.283185482025146484375;
        float _969 = cos(_967);
        float _971 = _961 * 0.15915493667125701904296875;
        float _973 = _959 * 6.283185482025146484375;
        float _975 = sin(_973);
        float _977 = 1.0 / _969;
        float _979 = _971 * 6.283185482025146484375;
        float _981 = cos(_979);
        float _983 = _975 * _977;
        float _985 = _971 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _981 * _983;
        float _991 = 1.0 / _965;
        float _993 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _995 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _993;
        float _997 = 1.0 / _989;
        float _999 = 1.0 / _995;
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1003 = _991 * _1001;
        float _1005 = _987 * _997;
        float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1009 = fma(_1005, _1003, _1007);
        float _1011 = _1009 * _999;
        float _1013 = precise::clamp(_1011, 0.0, 1.0);
        _815 = _991;
        _955 = _959;
        _679 = _971;
        _891 = _1013;
    }
    float _1015 = _815;
    float _1017 = _955;
    float _1019 = _679;
    float _1021 = _891;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = _947 + _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _949 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _951 + _1031;
    float _1035 = _1025 * _1025;
    float _1037 = fma(_1029, _1029, _1035);
    float _1039 = fma(_1033, _1033, _1037);
    float _1041 = rsqrt(_1039);
    float _1043 = sqrt(_1039);
    float _1045 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1047 = _1029 * _1045;
    float _1049 = _1033 * _1045;
    float _1051 = _1047 * _1047;
    float _1053 = _1049 * _1049;
    float _1055 = _1051 + _1053;
    float _1057 = sqrt(_1055);
    bool _1059 = _1057 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1057 + _1061;
    float _1065 = _1015;
    float _1067 = _1063;
    float _1069 = _1017;
    float _1071 = _1025;
    float _1073 = _1047;
    if (_1059)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1065 = _1075;
    }
    float _1077 = _1065;
    float _1079 = _1077;
    if (_1059)
    {
        float _1081 = _1063 * _1077;
        _1067 = _1081;
    }
    float _1083 = _1067;
    if (_1059)
    {
        float _1085 = rsqrt(_1055);
        _1079 = _1085;
    }
    float _1087 = _1079;
    float _1089 = _1087;
    if (_1059)
    {
        float _1091 = _1083 * 0.15915493667125701904296875;
        _1069 = _1091;
    }
    float _1093 = _1069;
    float _1095 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1097 = _1033;
    if (_1059)
    {
        float _1099 = _1093 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        _1097 = _1101;
    }
    float _1103 = _1097;
    float _1105 = precise::max(0.0, _1095);
    float _1107 = _1019;
    float _1109 = _1105;
    if (_1059)
    {
        float _1111 = _1093 * 6.283185482025146484375;
        float _1113 = cos(_1111);
        _1107 = _1113;
    }
    float _1115 = _1107;
    float _1117 = -_1045;
    float _1119 = -_1105;
    float _1121 = fma(_1025, _1117, _1119);
    if (_1059)
    {
        float _1123 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1123;
    }
    float _1125 = _1071;
    float _1127 = _1103;
    float _1129 = _1125;
    if (_1059)
    {
        float _1131 = fma(_1103, _1125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1127 = _1131;
    }
    float _1133 = _1127;
    float _1135 = _1133;
    if (!_1059)
    {
        _1129 = _1121;
    }
    float _1137 = _1129;
    float _1139 = _947 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1141 = _1137;
    if (_1059)
    {
        float _1143 = _1087 * _1133;
        _887 = _1143;
    }
    float _1145 = _887;
    if (!_1059)
    {
        _1135 = _1051;
    }
    float _1147 = _1135;
    float _1149 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1139);
    float _1151 = _1147;
    float _1153 = _1115;
    if (_1059)
    {
        float _1155 = _1115 + (-1.0);
        _1109 = _1155;
    }
    float _1157 = _1109;
    float _1159 = _1157;
    if (_1059)
    {
        float _1161 = _1047 * _1145;
        _1073 = _1161;
    }
    float _1163 = _1073;
    float _1165 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1149);
    if (_1059)
    {
        float _1167 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1167;
    }
    float _1169 = _1089;
    if (!_1059)
    {
        _1159 = _1049;
    }
    float _1171 = _1159;
    float _1173 = _1171;
    if (_1059)
    {
        float _1175 = _1049 * _1145;
        _1173 = _1175;
    }
    float _1177 = _1173;
    if (_1059)
    {
        float _1179 = _1163 * _1163;
        _1151 = _1179;
    }
    float _1181 = _1151;
    if (_1059)
    {
        float _1183 = fma(_1121, _1115, _1169);
        _1141 = _1183;
    }
    float _1185 = _1141;
    if (!_1059)
    {
        _1153 = _1053;
    }
    float _1187 = _1153;
    float _1189 = _1187;
    if (_1059)
    {
        float _1191 = _1177 * _1177;
        _1189 = _1191;
    }
    float _1193 = _1189;
    float _1195 = fma(_1185, _1185, _1181);
    float _1197 = _947 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1199 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1201 = _947 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1203 = _1195 + _1193;
    float _1205 = _947 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1207 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1197);
    float _1209 = rsqrt(_1203);
    float _1211 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1213 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1205);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1217 = fma(_1043, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1215);
    float _1219 = precise::clamp(_1217, 0.0, 1.0);
    float _1221 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1207);
    float _1223 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1225 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1213);
    float _1227 = -_1219;
    float _1229 = _1227 + 1.0;
    float _1231 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1233 = -_1223;
    float _1235 = fma(_1233, _1211, 1.0);
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1239 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1201);
    float _1241 = abs(_1229);
    float _1243 = log2(_1241);
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1247 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1249 = _1209 * _1185;
    float _1251 = _1209 * _1177;
    float _1253 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1245);
    float _1255 = _1209 * _1163;
    float _1257 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = log2(_1235);
    float _1261 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1253);
    float _1263 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1265 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1261);
    float _1267 = -_1263;
    float _1269 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1267);
    float _1271 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1273 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1275 = 1.0 / _1265;
    float _1277 = -_1251;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1269);
    float _1281 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1283 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1271);
    float _1285 = fma(_1279, -0.5, 0.5);
    float _1287 = fma(_1279, 0.5, 0.5);
    float _1289 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1281);
    float _1291 = exp2(_1273);
    float _1293 = _1249 + 1.0;
    float _1295 = fma(_1287, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1297 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1289);
    float _1299 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1283);
    float _1301 = _1259 * 0.693147182464599609375;
    float _1303 = fma(_1287, _1295, -0.212114393711090087890625);
    float _1305 = sqrt(_1285);
    float _1307 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1309 = fma(_1287, _1303, 1.570728778839111328125);
    float _1311 = -_1249;
    float _1313 = fma(_1291, _1293, _1311);
    float _1315 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1317 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1299);
    float _1319 = fma(_1313, 0.5, 0.5);
    float _1321 = _1315 * _1275;
    float _1323 = _1317 * _1275;
    float _1325 = _1305 * 0.636619746685028076171875;
    float _1327 = fma(_1321, 0.5, 0.5);
    float _1329 = fma(_1323, -0.5, 0.5);
    float _1331 = -_1309;
    float _1333 = fma(_1325, _1331, 1.0);
    float3 _4480 = float3(_1327, _1329, _1307);
    float _1335 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4480, float3(0.0), isnan(_4480)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4480, float3(0.0), isnan(_4480)), level(0.0)).x;
    float3 _4491 = float3(_1327, _1329, _1307);
    float4 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4491, float3(0.0), isnan(_4491)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4491, float3(0.0), isnan(_4491)), level(0.0)).xyzw;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = _1338.w;
    float2 _4508 = float2(_1333, _1319);
    float3 _1350 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4508, float2(0.0), isnan(_4508)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4508, float2(0.0), isnan(_4508)), level(0.0)).xyz;
    float _1352 = _1350.x;
    float _1354 = _1350.y;
    float _1356 = _1350.z;
    float _1358 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1360 = int(_1358);
    int _1362 = abs(_667);
    float _1364 = _1237 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1366 = abs(_671);
    float _1368 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1370 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1364);
    float _1372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1374 = int(_1372);
    float _1376 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1370);
    float _1378 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1380 = float(_1360);
    float _1382 = 1.0 / _537;
    out.gl_Position.x = _1315;
    out.gl_Position.y = _1317;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1265;
    float _1384 = float(uint(_1374));
    float _1386 = 1.0 / _1380;
    int _1388 = ~_1374;
    int _1390 = _1388 + 1;
    int _1392 = ~_1374;
    int _1394 = _1392 + 1;
    int _1396 = ~_1374;
    int _1398 = _1396 + 1;
    float _1400 = 1.0 / _1384;
    float _1402 = _129 * _1386;
    float _1404 = exp2(_1368);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>(_1400) + (-2);
    float _1412 = trunc(_1402);
    int _1414 = int(_1412);
    bool _1416 = !_1408;
    float _1418 = _1416 ? 7.345489978790283203125 : 1.0;
    float _1420 = _1378 + _1265;
    float _1422 = -_1404;
    float _1424 = _1422 + 1.0;
    float _1426 = float(uint(_1414));
    float _1428 = as_type<float>(_1410) * _1426;
    float _1430 = in.m_53.x;
    float _1432 = in.m_53.y;
    float _1434 = trunc(_1428);
    float _1436 = precise::max(_1434, 0.0);
    uint _1439 = uint(_1436);
    int _1441 = _1390 * int(_1439);
    int _1443 = _1441 + _1414;
    float _1445 = float(_1414);
    float _1447 = _1418 * _1430;
    float _1449 = float(uint(_1443));
    bool _1451 = _1430 > 0.5;
    float _1453 = as_type<float>(_1410) * _1449;
    float _1455 = floor(_1447);
    float _1457 = trunc(_1453);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    float _1463 = -_1455;
    float _1465 = _1447 + _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1469 = _1467 != 0;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    int _1475 = int(_1439) + int(_1461);
    float _1477 = float(_1374);
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1481 = _1479 != 0;
    int _1483 = _1394 * _1475;
    int _1485 = _1483 + _1414;
    bool _1487 = _1445 >= _1477;
    bool _1489 = isnan(_1445);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan(_1477);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _129 * _1477;
    float _1501 = _1465 * _1477;
    bool _1503 = uint(_1485) >= uint(_1374);
    float _1505 = _1499 * _1382;
    float _1507 = trunc(_1497);
    int _1509 = int(_1507);
    int _1511 = _1374 + (-1);
    bool _1513 = !_1503;
    int _1515 = _1513 ? 0 : (-1);
    bool _1517 = _1374 == 0;
    int _1519 = ~_1475;
    int _1521 = _1519 + _1515;
    int _1523 = _1521 + 1;
    float _1525 = trunc(_1501);
    int _1527 = int(_1525);
    bool _1529 = !_1469;
    int _1531 = _1529 ? 0 : 1;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1535 = _1533 != 0;
    int _1537 = _1374 * _1523;
    int _1539 = _1537 + _1414;
    int _1541 = abs(_663);
    int _1543 = abs(_1531);
    float _1545 = trunc(_1505);
    int _1547 = int(_1545);
    int _1549 = ~_1509;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    bool _1555 = !_1517;
    int _1557 = _1555 ? _1539 : (-1);
    int _1559 = _1557 * _1553;
    int _1561 = ~_1374;
    int _1563 = _1561 + 1;
    int _1565 = _1527 * _1543;
    int _1567 = _1565 + _1414;
    int _1569 = _1509 * _1511;
    int _1571 = _1569 + _1559;
    bool _1573 = !_1535;
    int _1575 = _1573 ? 0 : 1;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1579 = _1577 != 0;
    int _1581 = _1571 * _1541;
    int _1583 = abs(_1575);
    float _1585 = float(uint(_1567));
    int _1587 = _1547 * _1362;
    int _1589 = _1587 + _1581;
    int _1591 = ~_1374;
    int _1593 = _1591 + 1;
    int _1595 = ~_1374;
    int _1597 = _1595 + 1;
    int _1599 = _1567 * _1366;
    int _1601 = _1599 + _1589;
    float _1603 = as_type<float>(_1410) * _1585;
    int _1605 = _1527 * _1583;
    int _1607 = _1605 + _1601;
    float _1609 = trunc(_1603);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    float _1615 = float(uint(_1607));
    float _1617 = as_type<float>(_1410) * _1615;
    float _1619 = trunc(_1617);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1563 * int(_1613);
    int _1627 = _1625 + _1567;
    float _1629 = float(uint(_1627));
    float _1631 = as_type<float>(_1410) * _1629;
    int _1633 = _1593 * int(_1623);
    int _1635 = _1633 + _1607;
    float _1637 = trunc(_1631);
    float _1639 = precise::max(_1637, 0.0);
    uint _1641 = uint(_1639);
    float _1643 = float(uint(_1635));
    float _1645 = as_type<float>(_1410) * _1643;
    float _1647 = _565 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1649 = trunc(_1645);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1657 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1661 = int(_1623) + int(_1653);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1663;
    int _1667 = _1597 * _1661;
    int _1669 = _1667 + _1607;
    float _1671 = 1.0 / _1665;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1675 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1677 = uint(_1669) >= uint(_1374);
    float _1679 = -_1673;
    float _1681 = fma(_1675, 2.0, _1679);
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1685 = !_1677;
    int _1687 = _1685 ? 0 : (-1);
    float _1689 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1683);
    int _1691 = ~_1661;
    int _1693 = _1691 + _1687;
    int _1695 = _1693 + 1;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1699 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1703 = _1432 > 0.5;
    int _1705 = _1374 * _1695;
    int _1707 = _1705 + _1607;
    float _1709 = fma(_1699, -2.0, _1697);
    float _1711 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1701);
    float _1713 = -_129;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1681);
    float _1717 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1689);
    float _1719 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1709);
    bool _1721 = !_1517;
    int _1723 = _1721 ? _1707 : (-1);
    float _1725 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1711);
    float _1727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1729 = _539 + _1727;
    bool _1731 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1733 = isnan(_539);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1739 = _1735 || _1737;
    float _1741 = float(_1739);
    float _1743 = -_1717;
    float _1745 = _1743 + 1.0;
    bool _1747 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1749 = isnan(_539);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1755 = _1751 || _1753;
    float _1757 = float(_1755);
    float _1759 = _1729 * _1671;
    int _1761 = _1723 >> 31;
    float _1763 = -_1741;
    float _1765 = _1763 + 1.0;
    int _1767 = _1761 & 3;
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1769;
    int _1773 = _1723 + _1767;
    float _1775 = -_1757;
    float _1777 = _1775 + 1.0;
    float _1779 = fma(_1771, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1781 = _1773 >> 2;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1783;
    float _1787 = _1741 * _1777;
    float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1789;
    int _1793 = _1781 << 4;
    int _1795 = _1793 + 368;
    float _1797 = fma(_1785, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1799 = _1779 * _1787;
    float _1801 = fma(_1791, _1759, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1803 = -_565;
    int _1805 = _1703 ? as_type<int>(_1803) : as_type<int>(_565);
    uint _1807 = uint(int(uint(_1795) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[int(_1817)][_1819];
    float _1823 = _1797 * _1787;
    float _1825 = _1801 * _1787;
    float _1827 = -_569;
    int _1829 = _1451 ? as_type<int>(_1827) : as_type<int>(_569);
    float _1831 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1799);
    bool _1833 = !_1481;
    float _1835 = _1833 ? _565 : as_type<float>(_1805);
    float _1837 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1839 = !_1473;
    float _1841 = _1839 ? _569 : as_type<float>(_1829);
    float _1843 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1823);
    int _1845 = _1723 & 3;
    bool _1847 = _1845 != 0;
    int _1849 = _1795 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = _1723 & 3;
    bool _1869 = _1867 != 0;
    float _1871 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1655);
    bool _1873 = uint(_1845) > 1u;
    float _1875 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1657);
    int _1877 = _1869 ? 0 : 1;
    float _1879 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1825);
    int _1881 = int(_1613) + int(_1641);
    float _1883 = _1841 + 0.5;
    int _1885 = ~_1877;
    int _1887 = _1885 + 1;
    int _1889 = _1887 + 1;
    float _1891 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1831);
    float _1893 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1715);
    bool _1895 = uint(_1845) >= 2u;
    float _1897 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1843);
    bool _1899 = !_1847;
    int _1901 = _1899 ? 0 : 1;
    int _1903 = _1398 * _1881;
    int _1905 = _1903 + _1567;
    int _1907 = _1889;
    float _1909 = _1265;
    if (!_1873)
    {
        int _1911 = ~_1877;
        int _1913 = _1911 + 1;
        _1907 = _1913;
    }
    int _1915 = _1907;
    float _1917 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1879);
    bool _1919 = _1845 != 3;
    float _1921 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1659);
    int _1923 = abs(_1915);
    float _1925 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1927 = _1895 ? 0 : 1;
    float _1929 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1931 = _1925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1933 = uint(_1905) >= uint(_1374);
    float _1935 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    int _1937 = ~_1927;
    int _1939 = _1937 + 1;
    int _1941 = _1939 + 1;
    float _1943 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    bool _1945 = _1845 != 3;
    int _1947 = _1941;
    if (_1919)
    {
        int _1949 = ~_1927;
        int _1951 = _1949 + 1;
        _1947 = _1951;
    }
    int _1953 = _1947;
    int _1955 = ~_1923;
    int _1957 = _1955 + 1;
    int _1959 = _1957 + 1;
    out.m_62.x = _1929;
    out.m_62.y = _1935;
    out.m_62.z = _1943;
    bool _1961 = !_1933;
    int _1963 = _1961 ? 0 : (-1);
    int _1965 = abs(_1901);
    int _1967 = _1959 * as_type<int>(_1821);
    bool _1969 = !_1945;
    int _1971 = _1969 ? 0 : (-1);
    int _1973 = abs(_1953);
    int _1975 = ~_1881;
    int _1977 = _1975 + _1963;
    int _1979 = _1977 + 1;
    float _1981 = _1835 + (-0.5);
    bool _1983 = !_1579;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = abs(_1971);
    float _1989 = -_1981;
    float _1991 = -_1719;
    float _1993 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1991);
    int _1995 = ~_1965;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    int _2001 = _1374 * _1979;
    int _2003 = _2001 + _1567;
    int _2005 = abs(_1985);
    int _2007 = _1999 * as_type<int>(_1813);
    int _2009 = _2007 + _1967;
    int _2011 = ~_1973;
    int _2013 = _2011 + 1;
    int _2015 = _2013 + 1;
    int _2017 = ~_1987;
    int _2019 = _2017 + 1;
    int _2021 = _2019 + 1;
    int _2023 = _2015 * as_type<int>(_1857);
    int _2025 = _2023 + _2009;
    int _2027 = ~_2005;
    int _2029 = _2027 + 1;
    int _2031 = _2029 + 1;
    float _2033 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2035 = _2021 * as_type<int>(_1865);
    int _2037 = _2035 + _2025;
    float _2039 = -_1725;
    float _2041 = _2039 + 1.0;
    bool _2043 = !_1517;
    int _2045 = _2043 ? _2003 : (-1);
    float _2047 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2049 = _2037 * _2031;
    float _2051 = -_1745;
    float _2053 = fma(_1841, _2051, _1893);
    float _2055 = fma(_1835, _2041, _1993);
    bool _2057 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2059 = isnan(_1043);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2065 = _2061 || _2063;
    int _2067 = _2045 * _2005;
    int _2069 = _2067 + _2049;
    float _2071 = _1897 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_64.x = _2053;
    out.m_64.y = _2055;
    float _2073 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = float(_2069);
    out.m_66.x = _2047;
    out.m_66.y = _2073;
    out.m_66.z = _1931;
    float _2077 = _1420 * 0.5;
    float _2079 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2075;
    float _2081 = _2079 * _1335;
    float _2083 = -_2079;
    float _2085 = _2083 + 1.0;
    float _2087 = _1352;
    float _2089 = _1342;
    float _2091 = _1340;
    float _2093 = _1346;
    float _2095 = _1344;
    if (!_2065)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2097 = _1909;
    out.m_70.z = _2077;
    out.m_70.w = _1265;
    float _2099 = _1346 * _2081;
    float _2101 = _1356 * _2081;
    float _2103 = _1346 * _2085;
    float _2105 = fma(_1352, _2099, _1340);
    float _2107 = fma(_1354, _2099, _1342);
    float _2109 = fma(_1346, _2101, _1344);
    float _2111 = _2097;
    float _2113 = _2097;
    if (!_2065)
    {
        _2087 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2115 = _2087;
    float _2117 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2119 = _2115;
    float _2121 = _2115;
    if (!_2065)
    {
        _2089 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2123 = _2089;
    out.m_72.x = _2105;
    out.m_72.y = _2107;
    out.m_72.z = _2109;
    out.m_72.w = _2103;
    float _2125 = _2123;
    float _2127 = _2123;
    if (!_2065)
    {
        _2091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2129 = _2091;
    float _2131 = _2129;
    float _2133 = _2129;
    if (!_2065)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2135 = _2093;
    float _2137 = _2135;
    float _2139 = _2135;
    if (!_2065)
    {
        _2095 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2141 = _2095;
    bool _2143 = !_2065;
    float _2145 = _2141;
    float _2147 = _2141;
    if (!_2143)
    {
        bool _2149 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2151 = isnan(_1043);
        bool _2153 = _2149 || _2151;
        bool _2155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2157 = _2153 || _2155;
        if (!_2157)
        {
            float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2161 = _1043 + _2159;
            float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2165 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2163;
            float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2171 = 1.0 / _2165;
            float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2189 = _2161 * _2171;
            float _2191 = precise::clamp(_2189, 0.0, 1.0);
            float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2197 = fma(_2191, _2169, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2199 = fma(_2191, _2195, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2201 = fma(_2191, _2175, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2203 = fma(_2191, _2179, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2205 = fma(_2191, _2183, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2207 = fma(_2191, _2187, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2127 = _2201;
            _2147 = _2205;
            _2121 = _2197;
            _2139 = _2203;
            _2133 = _2199;
            _2113 = _2207;
            _2209 = true;
        }
        else
        {
            bool _2211 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2213 = isnan(_1043);
            bool _2215 = _2211 || _2213;
            bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2219 = _2215 || _2217;
            if (!_2219)
            {
                _2119 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2221 = _2119;
            _2121 = _2221;
            if (!_2219)
            {
                _2125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2223 = _2125;
            _2127 = _2223;
            if (!_2219)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2225 = _2131;
            _2133 = _2225;
            if (!_2219)
            {
                _2137 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2227 = _2137;
            _2139 = _2227;
            if (!_2219)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2229 = _2145;
            _2147 = _2229;
            if (!_2219)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2231 = _2111;
            bool _2233 = !_2219;
            _2113 = _2231;
            if (!_2233)
            {
                bool _2235 = _1043 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2237 = isnan(_1043);
                bool _2239 = _2235 || _2237;
                bool _2241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2243 = _2239 || _2241;
                if (!_2243)
                {
                    float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2247 = _1043 + _2245;
                    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2251 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2249;
                    float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2257 = 1.0 / _2251;
                    float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2275 = _2247 * _2257;
                    float _2277 = precise::clamp(_2275, 0.0, 1.0);
                    float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2281 = _2279 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2283 = fma(_2277, _2255, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2285 = fma(_2277, _2281, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2287 = fma(_2277, _2261, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2289 = fma(_2277, _2265, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2291 = fma(_2277, _2269, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2293 = fma(_2277, _2273, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2127 = _2287;
                    _2147 = _2291;
                    _2121 = _2283;
                    _2139 = _2289;
                    _2133 = _2285;
                    _2113 = _2293;
                    _2209 = true;
                }
                else
                {
                    _2127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2121 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2139 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2209 = false;
    float _2295 = _2127;
    float _2297 = _2147;
    float _2299 = _2121;
    float _2301 = _2139;
    float _2303 = _2133;
    float _2305 = _2113;
    float _2307 = fma(_1935, -0.5, 0.5);
    float _2309 = precise::clamp(_2307, 0.0, 1.0);
    float _2311 = -_2295;
    float _2313 = _2311 + _2297;
    float _2315 = _2117 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2317 = -_2299;
    float _2319 = _2317 + _2301;
    float _2321 = fma(_2309, _2313, _2295);
    out.m_74.x = 0.0;
    float _2323 = -_2303;
    float _2325 = _2323 + _2305;
    float _2327 = fma(_2309, _2319, _2299);
    float _2329 = _2321 * 0.586610972881317138671875;
    out.m_47.x = _2315;
    bool _2331 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2333 = fma(_2309, _2325, _2303);
    float _2335 = fma(_2327, 0.298911988735198974609375, _2329);
    bool _2337 = _1021 > 0.0;
    bool _2339 = isnan(_1021);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = fma(_2333, 0.114477999508380889892578125, _2335);
    float _2349 = -_2347;
    float _2351 = _2327 + _2349;
    float _2353 = -_2347;
    float _2355 = _2321 + _2353;
    float _2357 = -_2347;
    float _2359 = _2333 + _2357;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    float _2363 = fma(_2355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    float _2365 = fma(_2359, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2347);
    bool _2367 = !_2331;
    if (!_2367)
    {
        float _2369 = -_947;
        float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2373 = -_949;
        float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2377 = -_951;
        float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2381 = _2371 * _2371;
        float _2383 = fma(_2375, _2375, _2381);
        float _2385 = fma(_2379, _2379, _2383);
        float _2387 = sqrt(_2385);
        float _2389 = rsqrt(_2385);
        float _2391 = -_2387;
        float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2395 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2397 = precise::clamp(_2395, 0.0, 1.0);
        float _2399 = _2375 * _2389;
        float _2401 = _2371 * _2389;
        float _2403 = abs(_2397);
        float _2405 = log2(_2403);
        float _2407 = _2379 * _2389;
        float _2409 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2411 = _1935 * _2401;
        float _2413 = -_2401;
        float _2415 = -_2409;
        float _2417 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2415);
        float _2419 = fma(_1929, _2399, _2411);
        float _2421 = -_2407;
        float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2417);
        float _2425 = fma(_1943, _2407, _2419);
        float _2427 = precise::clamp(_2425, 0.0, 1.0);
        float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2431 = _2423 + _2429;
        float _2433 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2435 = _2431 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2437 = precise::clamp(_2435, 0.0, 1.0);
        float _2439 = exp2(_2433);
        float _2441 = _2439 * _2437;
        float _2443 = _2427 * _2441;
        float _2445 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2447 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2449 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_74.x = _2445;
        out.m_74.y = _2447;
        out.m_74.z = _2449;
    }
    out.m_76.x = _2361;
    out.m_76.y = _2363;
    out.m_76.z = _2365;
    if (_2345)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2451 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2451;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

