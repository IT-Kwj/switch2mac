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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    const device _33* vp_s0 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_104 [[user(locn5)]];
    float4 m_106 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_56 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_98 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_96 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
    float4 m_68 [[attribute(6)]];
    float4 m_62 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_76 [[attribute(9)]];
    float4 m_72 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _799 = false;
    bool _577 = false;
    bool _473 = false;
    bool _359 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_53.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_56.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4440 = as_type<float>(_141);
        out.gl_Position.z = _4440;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_58.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = _159;
    if (_155)
    {
        float _163 = float(_125);
        _135 = _163;
    }
    float _165 = _135;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    float _173 = _165;
    if (_171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _173;
    if (_171)
    {
        out.m_56.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4510 = as_type<float>(_179);
        out.gl_Position.z = _4510;
    }
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _199 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    float _201 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _205 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_187;
    float _209 = _201;
    float _211 = _203;
    float _213 = _205;
    float _231;
    if (!_207)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_125);
        float _237 = 1.0 / _235;
        float _239 = _159 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = in.m_64.x;
    float _249 = in.m_64.y;
    float _251 = in.m_64.z;
    bool _253 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_241);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_241);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _245 * _289;
    float _301 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _307;
    float _311 = fma(_305, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = fma(_309, _299, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _315 = _301 * _293;
    float _317 = _311 * _293;
    float _319 = _313 * _293;
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _315);
    float _323 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _317);
    float _325 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].z, _319);
    float _327 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _329 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    float _331 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].z, _325);
    float _333 = _327 * _247;
    float _335 = _329 * _249;
    float _337 = _331 * _251;
    bool _339 = !_291;
    float _357;
    if (!_339)
    {
        float _341 = in.m_62.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _371 = _367 + _369;
    bool _373 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _375 = isnan(_367);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _385;
    bool _389 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _391 = isnan(_367);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_383;
    float _403 = _401 + 1.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _405;
    float _409 = 1.0 / _387;
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _413 = _399 * _403;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = _371 * _409;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _421;
    float _425 = fma(_407, _419, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _427;
    float _431 = fma(_423, _419, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _433 = fma(_429, _419, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _425 * _413;
    float _437 = _431 * _413;
    float _439 = _433 * _413;
    float _441 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].x, _435);
    float _443 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _445 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].z, _437);
    float _447 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].x, _441);
    float _449 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].y, _443);
    float _451 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].z, _445);
    bool _453 = !_411;
    float _471;
    if (!_453)
    {
        float _455 = in.m_62.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        float _475 = float(_125);
        float _477 = 1.0 / _475;
        float _479 = _159 * _477;
        _471 = _479;
    }
    _473 = false;
    float _481 = _471;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _481 + _483;
    bool _487 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = isnan(_481);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _503 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_481);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _515;
    float _519 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _521 = -_497;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _527 = 1.0 / _501;
    float _529 = _513 * _523;
    float _531 = -_513;
    float _533 = _531 + 1.0;
    float _535 = _517 * _527;
    float _537 = _451 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = fma(_535, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _543 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _541 * _529;
    float _547 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[116].x, _549);
    float _555 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _539;
    out.m_66.y = _551;
    out.m_66.z = _543;
    out.m_66.w = _555;
    bool _557 = !_525;
    float _575;
    if (!_557)
    {
        float _559 = in.m_62.x;
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _563 = _559 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].z, _159);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _575 = _573;
        _577 = true;
    }
    else
    {
        float _579 = float(_125);
        float _581 = 1.0 / _579;
        float _583 = _159 * _581;
        _575 = _583;
    }
    _577 = false;
    float _585 = _575;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _589 = _585 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _593 = _585 + _591;
    bool _595 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _597 = isnan(_585);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _613 = _585 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _623 = 1.0 / _609;
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _627 = 1.0 / _621;
    float _629 = 1.0 / _617;
    float _631 = _589 * _623;
    bool _633 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _635 = isnan(_585);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -_605;
    float _647 = _645 + 1.0;
    float _649 = _643 * _647;
    float _651 = _593 * _627;
    bool _653 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _655 = isnan(_585);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _665;
    bool _669 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _671 = isnan(_585);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = _613 * _629;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _699;
    float _703 = _679 * _691;
    float _705 = fma(_667, _693, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _707 = fma(_697, _693, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _709 = fma(_701, _693, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _711 = _663 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _717 = _707 * _703;
    float _719 = _709 * _703;
    float _721 = -_679;
    float _723 = _721 + 1.0;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _729 = _705 * _703;
    float _731 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].x, _719);
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].y, _717);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _735;
    float _739 = fma(_683, _651, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _741 = fma(_715, _651, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _743 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].z, _729);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _745;
    float _749 = fma(_727, _651, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _751;
    float _755 = fma(_739, _711, _731);
    float _757 = fma(_737, _631, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _759 = fma(_747, _631, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _761 = fma(_741, _711, _733);
    float _763 = fma(_753, _631, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _765 = fma(_749, _711, _743);
    float _767 = fma(_757, _649, _755);
    float _769 = fma(_759, _649, _761);
    float _771 = fma(_763, _649, _765);
    float _773 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].x, _767);
    float _775 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].y, _769);
    float _777 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].z, _771);
    bool _779 = !_625;
    float _797;
    if (!_779)
    {
        float _781 = in.m_62.x;
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _785 = _781 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _789 = _787 * _783;
        float _791 = floor(_789);
        float _793 = -_791;
        float _795 = _789 + _793;
        _797 = _795;
        _799 = true;
    }
    else
    {
        float _801 = float(_125);
        float _803 = 1.0 / _801;
        float _805 = _159 * _803;
        _797 = _805;
    }
    _799 = false;
    float _807 = _797;
    float _809 = in.m_62.x;
    float _811 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _813 = log2(_811);
    float _815 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _817 = in.m_62.z;
    float _819 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _823 = 1.0 + _821;
    float _825 = in.m_62.y;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _837 = _835 != 0;
    float _839 = _815 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _841 = 1.0 / _823;
    float _843 = in.m_53.x;
    float _845 = in.m_53.y;
    float _847 = in.m_53.z;
    bool _849 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(1.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _861 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    float _871 = in.m_68.x;
    float _873 = in.m_68.y;
    float _875 = in.m_68.z;
    float _877 = _813 * _159;
    float _879 = exp2(_877);
    float _881 = _809 * 2.0;
    float _883 = _817 * 2.0;
    float _885 = floor(_881);
    float _887 = _825 * 2.0;
    float _889 = _825 + _817;
    float _891 = _845 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _893 = floor(_883);
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _845 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _901 = _845 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _903 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[5].x, _891);
    float _905 = _889 + (-1.0);
    float _907 = _869 ? _897 : 0.0;
    float _909 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[6].x, _899);
    float _911 = floor(_887);
    bool _913 = _885 > 0.0;
    float _915 = _809 + _817;
    if (_857)
    {
        float _917 = _907 * _841;
        _161 = _917;
    }
    float _919 = _161;
    bool _921 = _885 >= 0.0;
    bool _923 = isnan(_885);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[4].x, _901);
    float _933 = _915 + (-1.0);
    float _935 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    bool _937 = _893 >= 0.0;
    bool _939 = isnan(_893);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.0);
    bool _945 = _941 || _943;
    float _947 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _949 = _893 > 0.0;
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _953 = _929 ? 0 : 1;
    float _955 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[4].z, _931);
    int _957 = _945 ? 0 : 1;
    float _959 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[6].z, _909);
    bool _961 = _911 > 0.0;
    bool _963 = _911 >= 0.0;
    bool _965 = isnan(_911);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    float _973 = _959 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _975 = ~_953;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    bool _981 = !_829;
    int _983 = _981 ? 0 : 1;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _973 + _985;
    int _989 = _979;
    bool _991 = _961;
    if (!_913)
    {
        int _993 = ~_953;
        int _995 = _993 + 1;
        _989 = _995;
    }
    int _997 = _989;
    float _999 = _935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1001 = !_833;
    int _1003 = _1001 ? 0 : 1;
    int _1005 = abs(_983);
    float _1007 = _955 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1011 = _999 + _1009;
    int _1013 = ~_957;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    int _1019 = _1017;
    if (!_949)
    {
        int _1021 = ~_957;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1007 + _1027;
    int _1031 = abs(_1003);
    float _1033 = _1011 * _1011;
    float _1035 = in.m_70.x;
    float _1037 = in.m_70.y;
    float _1039 = in.m_70.z;
    float _1041 = float(_997);
    float _1043 = fma(_1029, _1029, _1033);
    float _1045 = float(_1031);
    int _1047 = _971 ? 0 : 1;
    float _1049 = fma(_987, _987, _1043);
    float _1051 = _1045 * _1041;
    int _1053 = ~_1047;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    float _1059 = sqrt(_1049);
    int _1061 = _1057;
    if (!_961)
    {
        int _1063 = ~_1047;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    float _1069 = _1051 * (-2.0);
    float _1071 = _825 + (-0.5);
    float _1073 = float(_1005);
    float _1075 = float(_1025);
    float _1077 = fma(_947, _1069, _947);
    float _1079 = rsqrt(_1049);
    bool _1081 = !_837;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _1073 * _1075;
    float _1087 = fma(_1069, _1037, _1037);
    int _1089 = abs(_1083);
    float _1091 = float(_1067);
    float _1093 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1087);
    float _1095 = _809 + _825;
    float _1097 = _1059 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1099 = float(_1089);
    float _1101 = fma(_1077, _919, _1093);
    float _1103 = _1095 + (-1.0);
    float _1105 = _1085 * (-2.0);
    float _1107 = precise::min(_839, _1097);
    float _1109 = _1099 * _1091;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1113 = _809 + (-0.5);
    float _1115 = fma(_1105, _1035, _1035);
    float _1117 = _1079 * _1107;
    float _1119 = fma(_1111, _1105, _1111);
    float _1121 = _1109 * (-2.0);
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1115);
    float _1125 = _1011 * _1117;
    float _1127 = _1029 * _1117;
    float _1129 = _987 * _1117;
    float _1131 = fma(_1119, _919, _1123);
    float _1133 = -_1125;
    float _1135 = _1011 + _1133;
    float _1137 = -_1127;
    float _1139 = _1029 + _1137;
    float _1141 = fma(_1121, _1039, _1039);
    float _1143 = _1131 * 0.15915493667125701904296875;
    float _1145 = _1135 * _1135;
    float _1147 = _817 + (-0.5);
    float _1149 = -_1129;
    float _1151 = _987 + _1149;
    float _1153 = fma(_951, _1121, _951);
    float _1155 = fma(_1139, _1139, _1145);
    float _1157 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1141);
    float _1159 = _1101 * 0.15915493667125701904296875;
    float _1161 = _1143 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = fma(_1151, _1151, _1155);
    float _1167 = fma(_1153, _919, _1157);
    float _1169 = -_1125;
    float _1171 = _999 + _1169;
    float _1173 = -_1127;
    float _1175 = _1007 + _1173;
    float _1177 = -_1129;
    float _1179 = _973 + _1177;
    float _1181 = _1167 * 0.15915493667125701904296875;
    float _1183 = sqrt(_1165);
    float _1185 = _1159 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = _1159 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = _1079 * _1183;
    float _1195 = _815 * _1193;
    float _1197 = _1181 * 6.283185482025146484375;
    float _1199 = cos(_1197);
    float _1201 = _1163 * _1187;
    float _1203 = _1143 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = _1163 * _1191;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = _1191 * _1199;
    float _1215 = _1163 * _1199;
    float _1217 = _1205 * _1191;
    float _1219 = _1205 * _1187;
    float _1221 = _1205 * _1199;
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _873);
    float _1225 = _819 * _1193;
    float _1227 = _859 * _1193;
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _871);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _875);
    float _1233 = _1225 * _1223;
    float _1235 = fma(_1211, _1207, _1219);
    float _1237 = _1195 * _1229;
    float _1239 = _1187 * _1199;
    float _1241 = _1215 * _1233;
    float _1243 = _1227 * _1231;
    float _1245 = -_1217;
    float _1247 = fma(_1211, _1201, _1245);
    float _1249 = -_1233;
    float _1251 = _1211 * _1249;
    float _1253 = fma(_1235, _1237, _1241);
    float _1255 = -_1201;
    float _1257 = fma(_1211, _1217, _1255);
    float _1259 = _1221 * _1233;
    float _1261 = fma(_1213, _1237, _1251);
    float _1263 = fma(_1247, _1243, _1253);
    float _1265 = fma(_1211, _1219, _1207);
    float _1267 = fma(_1257, _1237, _1259);
    float _1269 = fma(_1239, _1243, _1261);
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1275 = fma(_1265, _1243, _1267);
    float _1277 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1271);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1273);
    float _1281 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1277);
    float _1283 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1279);
    float _1285 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1287 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1289 = _973 + _1285;
    float _1291 = _1007 + _1287;
    float _1293 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1297 = _1289 + _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1301 = _1291 + _1299;
    float _1303 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1293);
    float _1305 = _1297 * _1297;
    float _1307 = fma(_1301, _1301, _1305);
    float _1309 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1311 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1303);
    float _1313 = sqrt(_1307);
    float _1315 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1309);
    float _1317 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1315);
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1321 = _999 + _1319;
    bool _1323 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1319;
    float _1327 = _1309;
    float _1329 = _1303;
    if (!_1323)
    {
        _1325 = _1291;
    }
    float _1331 = _1325;
    float _1333 = _1331;
    if (!_1323)
    {
        _1327 = _1289;
    }
    float _1335 = _1327;
    float _1337 = _1335;
    if (!_1323)
    {
        _1329 = _1321;
    }
    float _1339 = _1329;
    bool _1341 = !_1323;
    float _1343 = _1339;
    if (!_1341)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1349 = _1313 + _1347;
        float _1351 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = rsqrt(_1307);
        float _1355 = _1349 * _1345;
        float _1357 = _1355 * 0.15915493667125701904296875;
        float _1359 = _1357 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1357 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 + (-1.0);
        float _1369 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = fma(_1321, _1361, _1369);
        float _1375 = _1353 * _1371;
        float _1377 = fma(_1301, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1379 = fma(_1297, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1373;
        _1333 = _1377;
        _1337 = _1379;
    }
    float _1381 = _1343;
    float _1383 = _1333;
    float _1385 = _1337;
    float _1387 = -_999;
    float _1389 = _1387 + _1381;
    float _1391 = -_1007;
    float _1393 = _1391 + _1383;
    float _1395 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1397 = _1389 * _1389;
    float _1399 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = -_973;
    float _1403 = _1401 + _1385;
    float _1405 = 1.0 / _1395;
    float _1407 = fma(_1393, _1393, _1397);
    float _1409 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1411 = fma(_1175, 0.008000000379979610443115234375, 64.0);
    float _1413 = -_1125;
    float _1415 = _1413 + _1381;
    float _1417 = fma(_1403, _1403, _1407);
    float _1419 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1421 = -_1129;
    float _1423 = _1421 + _1385;
    float _1425 = precise::max(0.0, _1411);
    float _1427 = sqrt(_1417);
    float _1429 = fma(_1179, 0.008000000379979610443115234375, 64.0);
    float _1431 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1433 = precise::min(_1425, 127.0);
    float _1435 = -_1127;
    float _1437 = _1435 + _1383;
    float _1439 = precise::max(0.0, _1429);
    float _1441 = _1431 + _1395;
    float _1443 = trunc(_1433);
    int _1445 = int(_1443);
    float _1447 = precise::min(_1439, 127.0);
    float _1449 = _1441 * _1405;
    float _1451 = _1449 * 0.5;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1461 = _1457 || _1459;
    bool _1463 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1465 = isnan(0.5);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1475 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1473);
    bool _1477 = _1427 > 0.0;
    float _1479 = trunc(_1447);
    int _1481 = int(_1479);
    float _1483 = 1.0 / _1475;
    float _1485 = _1383;
    float _1487 = _1385;
    float _1489 = _1381;
    if (!_1477)
    {
        _1485 = _1437;
    }
    float _1491 = _1485;
    float _1493 = _1491;
    float _1495 = _1491;
    if (!_1477)
    {
        _1487 = _1415;
    }
    float _1497 = _1487;
    int _1499 = _1481 << 7;
    int _1501 = _1499 + _1445;
    float _1503 = _1497;
    if (!_1477)
    {
        _1489 = _1423;
    }
    float _1505 = _1489;
    bool _1507 = !_1477;
    float _1509 = _1505;
    if (!_1507)
    {
        float _1511 = _203 * _203;
        float _1513 = rsqrt(_1417);
        float _1515 = fma(_201, _201, _1511);
        float _1517 = fma(_205, _205, _1515);
        float _1519 = sqrt(_1517);
        float _1521 = _1393 * _1513;
        float _1523 = _1389 * _1513;
        float _1525 = _1403 * _1513;
        bool _1527 = _1519 > 0.0;
        float _1529 = _1513;
        float _1531 = _1519;
        if (!_1527)
        {
            _1493 = _1437;
        }
        float _1533 = _1493;
        _1495 = _1533;
        if (!_1527)
        {
            _1529 = _1415;
        }
        float _1535 = _1529;
        _1503 = _1535;
        if (!_1527)
        {
            _1531 = _1423;
        }
        float _1537 = _1531;
        bool _1539 = !_1527;
        _1509 = _1537;
        if (!_1539)
        {
            float _1541 = rsqrt(_1517);
            float _1543 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1545 = _203 * _1541;
            float _1547 = _201 * _1541;
            float _1549 = _205 * _1541;
            float _1551 = _1523 * _1545;
            float _1553 = fma(_1521, _1547, _1551);
            float _1555 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1557 = fma(_1525, _1549, _1553);
            float _1559 = _1557 * _1555;
            float _1561 = fma(_201, _1559, _1437);
            float _1563 = fma(_203, _1559, _1415);
            float _1565 = fma(_205, _1559, _1423);
            _1495 = _1561;
            _1503 = _1563;
            _1509 = _1565;
        }
    }
    float _1567 = _1495;
    float _1569 = _1503;
    float _1571 = _1509;
    int _1573 = _1501 << 4;
    if (_1461)
    {
        _209 = _1567;
    }
    float _1575 = _209;
    float _1577 = _1575;
    if (_1461)
    {
        _211 = _1569;
    }
    float _1579 = _211;
    float _1581 = _1579;
    if (_1461)
    {
        _213 = _1571;
    }
    float _1583 = _213;
    float _1585 = _1583;
    if (!_1461)
    {
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1589 = _1171 + _1587;
        float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1593 = _1175 + _1591;
        float _1595 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = -_1175;
        float _1599 = _1597 + _1567;
        float _1601 = _1589 * _1589;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1605 = _1179 + _1603;
        float _1607 = -_1171;
        float _1609 = _1607 + _1569;
        float _1611 = -_1179;
        float _1613 = _1611 + _1571;
        float _1615 = fma(_1593, _1593, _1601);
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1619 = fma(_1605, _1605, _1615);
        float _1621 = sqrt(_1619);
        float _1623 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1625 = precise::min(_1621, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1627 = _1625 * _1617;
        float _1629 = _1623 * _1627;
        float _1631 = fma(_1599, _1629, _1175);
        float _1633 = fma(_1609, _1629, _1171);
        float _1635 = fma(_1613, _1629, _1179);
        _1581 = _1633;
        _1577 = _1631;
        _1585 = _1635;
    }
    float _1637 = _1581;
    float _1639 = _1577;
    float _1641 = _1585;
    float _1643 = 0.0;
    if (_1471)
    {
        _1643 = 1.0;
    }
    float _1645 = _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1649 = _1483 * _1647;
    float _1651 = 0.0;
    float _1653 = _1645;
    if (_1471)
    {
        _1651 = 1.0;
    }
    float _1655 = _1651;
    int _1657 = _1573 + 8;
    float _1659 = _1655;
    if (!_1471)
    {
        float _1661 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1661 * 0.15915493667125701904296875;
        float _1665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1667;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1665 * 0.15915493667125701904296875;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = 1.0 / _1673;
        float _1683 = _1675 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = _1675 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = 1.0 / _1669;
        float _1697 = 1.0 / _1693;
        float _1699 = _1691 * _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = fma(_1649, _1699, _1701);
        float _1705 = _1703 * _1695;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        _1653 = _1707;
    }
    float _1709 = _1653;
    if (!_1471)
    {
        float _1711 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1713 = _1711 * 0.15915493667125701904296875;
        float _1715 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1717 = _1713 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1715 * 0.15915493667125701904296875;
        float _1723 = _1713 * 6.283185482025146484375;
        float _1725 = sin(_1723);
        float _1727 = 1.0 / _1719;
        float _1729 = _1721 * 6.283185482025146484375;
        float _1731 = cos(_1729);
        float _1733 = _1725 * _1727;
        float _1735 = _1721 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        float _1739 = _1731 * _1733;
        float _1741 = 1.0 / _1739;
        float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1745 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1743;
        float _1747 = 1.0 / _1745;
        float _1749 = _1737 * _1741;
        float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1753 = fma(_1649, _1749, _1751);
        float _1755 = _1753 * _1747;
        float _1757 = precise::clamp(_1755, 0.0, 1.0);
        float _1759 = -_1757;
        float _1761 = _1759 + 1.0;
        _1659 = _1761;
    }
    float _1763 = _1659;
    uint _1766 = uint(int(uint(_1657) >> uint(2)));
    float _1768 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1766)]);
    float _1770 = floor(_1433);
    int _1772 = _1573 + 12;
    uint _1774 = uint(int(uint(_1573) >> uint(2)));
    float _1776 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1774)]);
    uint _1778 = uint(int(uint(_1772) >> uint(2)));
    float _1780 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1778)]);
    float _1782 = -_1770;
    float _1784 = _1433 + _1782;
    float _1786 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1788 = _1768 + _1784;
    float _1790 = trunc(_1788);
    int _1792 = int(_1790);
    int _1794 = _1445 + _1792;
    int _1796 = _1481 << 7;
    int _1798 = _1796 + _1794;
    int _1800 = _1798 << 4;
    float _1802 = floor(_1447);
    int _1804 = _1800 + 12;
    uint _1806 = uint(int(uint(_1800) >> uint(2)));
    float _1808 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1806)]);
    uint _1810 = uint(int(uint(_1804) >> uint(2)));
    float _1812 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1810)]);
    float _1814 = -_1802;
    float _1816 = _1447 + _1814;
    float _1818 = _1768 + _1816;
    float _1820 = trunc(_1818);
    int _1822 = int(_1820);
    int _1824 = _1481 + _1822;
    int _1826 = _1824 << 7;
    int _1828 = _1826 + _1445;
    int _1830 = _1824 << 7;
    int _1832 = _1830 + _1794;
    int _1834 = _1828 << 4;
    int _1836 = _1832 << 4;
    int _1838 = _1834 + 12;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1637 + _1840;
    int _1844 = _1836 + 12;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1639 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1852 = _1641 + _1850;
    uint _1854 = uint(int(uint(_1838) >> uint(2)));
    float _1856 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1854)]);
    uint _1858 = uint(int(uint(_1844) >> uint(2)));
    float _1860 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1858)]);
    float _1862 = _1842 * _1842;
    uint _1864 = uint(int(uint(_1834) >> uint(2)));
    float _1866 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1864)]);
    float _1868 = fma(_1848, _1848, _1862);
    uint _1870 = uint(int(uint(_1836) >> uint(2)));
    float _1872 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1870)]);
    float _1874 = fma(_1852, _1852, _1868);
    float _1876 = rsqrt(_1874);
    float _1878 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1880 = _1848 * _1878;
    float _1882 = _1852 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 + _1886;
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = _1890 + _1894;
    float _1898 = _1852;
    float _1900 = _1896;
    float _1902 = as_type<float>(_1838);
    float _1904 = _1878;
    float _1906 = as_type<float>(_1834);
    if (_1892)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1898 = _1908;
    }
    float _1910 = _1898;
    if (_1892)
    {
        float _1912 = _1896 * _1910;
        _1900 = _1912;
    }
    float _1914 = _1900;
    if (_1892)
    {
        float _1916 = _1914 * 0.15915493667125701904296875;
        _1902 = _1916;
    }
    float _1918 = _1902;
    float _1920 = _1876;
    if (_1892)
    {
        float _1922 = _1918 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = _1910;
    if (_1892)
    {
        float _1932 = _1918 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = precise::max(0.0, _1928);
    float _1940 = _1888;
    float _1942 = _1938;
    if (_1892)
    {
        float _1944 = rsqrt(_1888);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = -_1878;
    float _1950 = -_1938;
    float _1952 = fma(_1842, _1948, _1950);
    float _1954 = _1952;
    float _1956 = _1926;
    if (_1892)
    {
        float _1958 = _1926 + (-1.0);
        _1904 = _1958;
    }
    float _1960 = _1904;
    float _1962 = _1960;
    if (_1892)
    {
        float _1964 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _1964;
    }
    float _1966 = _1942;
    float _1968 = _1966;
    if (_1892)
    {
        float _1970 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1962 = _1970;
    }
    float _1972 = _1962;
    float _1974 = _1936;
    if (_1892)
    {
        float _1976 = fma(_1936, _1966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1974 = _1976;
    }
    float _1978 = _1974;
    float _1980 = sqrt(_1874);
    float _1982 = _1978;
    if (_1892)
    {
        float _1984 = fma(_1952, _1926, _1972);
        _1954 = _1984;
    }
    float _1986 = _1954;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1892)
    {
        float _1990 = _1946 * _1978;
        _1906 = _1990;
    }
    float _1992 = _1906;
    if (!_1892)
    {
        _1982 = _1880;
    }
    float _1994 = _1982;
    float _1996 = _1994;
    if (_1892)
    {
        float _1998 = _1880 * _1992;
        _1996 = _1998;
    }
    float _2000 = _1996;
    if (!_1892)
    {
        _1968 = _1882;
    }
    float _2002 = _1968;
    float _2004 = _2002;
    if (_1892)
    {
        float _2006 = _1882 * _1992;
        _2004 = _2006;
    }
    float _2008 = _2004;
    if (!_1892)
    {
        _1956 = _1884;
    }
    float _2010 = _1956;
    float _2012 = _2010;
    if (_1892)
    {
        float _2014 = _2000 * _2000;
        _2012 = _2014;
    }
    float _2016 = _2012;
    float _2018 = fma(_1175, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1892)
    {
        _1988 = _1886;
    }
    float _2020 = _1988;
    float _2022 = _2020;
    if (_1892)
    {
        float _2024 = _2008 * _2008;
        _2022 = _2024;
    }
    float _2026 = _2022;
    float _2028 = fma(_1986, _1986, _2016);
    float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2032 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2030);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = _2028 + _2026;
    float _2038 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2040 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2038);
    float _2044 = rsqrt(_2036);
    float _2046 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2048 = -_2034;
    float _2050 = _2048 + 1.0;
    float _2052 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2042);
    float _2054 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2056 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2058 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2046);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2062 = abs(_2050);
    float _2064 = log2(_2062);
    float _2066 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2056);
    float _2068 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2072 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1786);
    float _2074 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2066);
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2070);
    float _2078 = floor(_2018);
    float _2080 = _2044 * _2000;
    float _2082 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2084 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2072);
    float _2086 = _2044 * _1986;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2096 = _2044 * _2008;
    float _2098 = -_2088;
    float _2100 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2098);
    float _2102 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2104 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2076);
    float _2106 = -_2092;
    float _2108 = fma(_2106, _2090, 1.0);
    float _2110 = -_2096;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2100);
    float _2114 = exp2(_2102);
    float _2116 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2104);
    float _2118 = -_2078;
    float _2120 = _2018 + _2118;
    float _2122 = fma(_2112, -0.5, 0.5);
    float _2124 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = log2(_2108);
    float _2130 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2132 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2134 = 1.0 / _2116;
    float _2136 = fma(_2112, 0.5, 0.5);
    float _2138 = _2086 + 1.0;
    float _2140 = floor(_2054);
    float _2142 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2130);
    float _2144 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2132);
    float _2146 = sqrt(_2122);
    float _2148 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = -_2086;
    float _2152 = fma(_2114, _2138, _2150);
    float _2154 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2156 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2144);
    float _2158 = fma(_2136, _2148, -0.212114393711090087890625);
    float _2160 = _2128 * 0.693147182464599609375;
    float _2162 = _2154 * _2134;
    float _2164 = -_2140;
    float _2166 = _2054 + _2164;
    float _2168 = _2156 * _2134;
    float _2170 = fma(_2136, _2158, 1.570728778839111328125);
    float _2172 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2174 = fma(_2162, 0.5, 0.5);
    float _2176 = fma(_2168, -0.5, 0.5);
    float _2178 = _2146 * 0.636619746685028076171875;
    float _2180 = fma(_2152, 0.5, 0.5);
    float2 _7629 = float2(_2120, _2166);
    float _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7629, float2(0.0), isnan(_7629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7629, float2(0.0), isnan(_7629)), level(0.0)).x;
    float3 _7640 = float3(_2174, _2176, _2172);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).x;
    float3 _7651 = float3(_2174, _2176, _2172);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7651, float3(0.0), isnan(_7651)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7651, float3(0.0), isnan(_7651)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float _2197 = -_2170;
    float _2199 = fma(_2178, _2197, 1.0);
    float2 _7672 = float2(_2199, _2180);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7672, float2(0.0), isnan(_7672)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7672, float2(0.0), isnan(_7672)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = floor(_1788);
    float _2213 = _1816 * _1812;
    float _2215 = in.m_62.w;
    float _2217 = in.m_72.y;
    float _2219 = in.m_72.x;
    bool _2221 = _825 > 0.5;
    float _2223 = -_2211;
    float _2225 = _1788 + _2223;
    bool _2227 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2229 = isnan(_807);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = _2225 * _1812;
    float _2241 = floor(_2213);
    bool _2243 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2245 = isnan(_807);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2257 = _807 + _2255;
    float _2259 = in.m_74.x;
    float _2261 = in.m_74.y;
    float _2263 = in.m_74.z;
    float _2265 = in.m_76.x;
    float _2267 = in.m_76.y;
    float _2269 = in.m_76.z;
    float _2271 = in.m_76.w;
    float _2273 = floor(_2239);
    float _2275 = fma(_1812, _2241, _2273);
    float _2277 = floor(_1818);
    float _2279 = _1816 * _1780;
    float _2281 = _1784 * _1780;
    float _2283 = _1784 * _1856;
    float _2285 = floor(_2279);
    float _2287 = -_2277;
    float _2289 = _1818 + _2287;
    float _2291 = floor(_2281);
    float _2293 = _2289 * _1856;
    float _2295 = _2225 * _1860;
    float _2297 = _2289 * _1860;
    float _2299 = floor(_2293);
    float _2301 = floor(_2283);
    float _2303 = fma(_1780, _2285, _2291);
    float _2305 = floor(_2295);
    float _2307 = floor(_2297);
    float _2309 = fma(_1856, _2299, _2301);
    float _2311 = trunc(_2275);
    int _2313 = int(_2311);
    float _2315 = trunc(_2303);
    int _2317 = int(_2315);
    float _2319 = fma(_1860, _2307, _2305);
    float _2321 = trunc(_2309);
    int _2323 = int(_2321);
    int _2325 = as_type<int>(_1808) + _2313;
    float _2327 = trunc(_2319);
    int _2329 = int(_2327);
    int _2331 = _2325 * 656;
    int _2333 = as_type<int>(_1776) + _2317;
    int _2335 = _2331 + 262160;
    int _2337 = as_type<int>(_1866) + _2323;
    int _2339 = _2333 * 656;
    int _2341 = _2331 + 262176;
    int _2343 = _2331 + 262192;
    int _2345 = _2337 * 656;
    uint _2347 = uint(int(uint(_2335) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2347)];
    float _2349 = as_type<float>(_dmw1.x);
    int _2351 = _2335 + 4;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    float _2355 = as_type<float>(_dmw1.y);
    int _2357 = _2335 + 8;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    float _2361 = as_type<float>(_dmw1.z);
    int _2363 = _2335 + 12;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    float _2367 = as_type<float>(_dmw1.w);
    int _2369 = as_type<int>(_1872) + _2329;
    int _2371 = _2331 + 262240;
    uint _2373 = uint(int(uint(_2341) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2373)];
    float _2375 = as_type<float>(_dmw2.x);
    int _2377 = _2341 + 4;
    uint _2379 = uint(int(uint(_2377) >> uint(2)));
    float _2381 = as_type<float>(_dmw2.y);
    int _2383 = _2341 + 8;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw2.z);
    int _2389 = _2341 + 12;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw2.w);
    int _2395 = _2331 + 262224;
    int _2397 = _2339 + 262192;
    uint _2399 = uint(int(uint(_2343) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2399)];
    float _2401 = as_type<float>(_dmw3.x);
    int _2403 = _2343 + 4;
    uint _2405 = uint(int(uint(_2403) >> uint(2)));
    float _2407 = as_type<float>(_dmw3.y);
    int _2409 = _2343 + 8;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    float _2413 = as_type<float>(_dmw3.z);
    int _2415 = _2343 + 12;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    float _2419 = as_type<float>(_dmw3.w);
    int _2421 = _2331 + 262144;
    int _2423 = _2369 * 656;
    int _2425 = _2331 + 262208;
    out.m_78.x = 1.0;
    out.m_78.y = 1.0;
    out.m_78.z = 1.0;
    int _2427 = _2339 + 262160;
    int _2429 = _2345 + 262192;
    uint _2431 = uint(int(uint(_2397) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2431)];
    float _2433 = as_type<float>(_dmw9.x);
    int _2435 = _2397 + 4;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    float _2439 = as_type<float>(_dmw9.y);
    int _2441 = _2397 + 8;
    uint _2443 = uint(int(uint(_2441) >> uint(2)));
    float _2445 = as_type<float>(_dmw9.z);
    int _2447 = _2397 + 12;
    uint _2449 = uint(int(uint(_2447) >> uint(2)));
    float _2451 = as_type<float>(_dmw9.w);
    int _2453 = _2339 + 262224;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2457 = _2455 != 0;
    uint _2459 = uint(int(uint(_2371) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2459)];
    float _2461 = as_type<float>(_dmw6.x);
    int _2463 = _2371 + 4;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    float _2467 = as_type<float>(_dmw6.y);
    int _2469 = _2371 + 8;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    float _2473 = as_type<float>(_dmw6.z);
    int _2475 = _2371 + 12;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    float _2479 = as_type<float>(_dmw6.w);
    int _2481 = _2331 + 262256;
    uint _2483 = uint(int(uint(_2395) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2483)];
    float _2485 = as_type<float>(_dmw5.x);
    int _2487 = _2395 + 4;
    uint _2489 = uint(int(uint(_2487) >> uint(2)));
    float _2491 = as_type<float>(_dmw5.y);
    int _2493 = _2395 + 8;
    uint _2495 = uint(int(uint(_2493) >> uint(2)));
    float _2497 = as_type<float>(_dmw5.z);
    int _2499 = _2395 + 12;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    float _2503 = as_type<float>(_dmw5.w);
    int _2505 = _2339 + 262144;
    int _2507 = _2339 + 262208;
    uint _2509 = uint(int(uint(_2421) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2509)];
    float _2511 = as_type<float>(_dmw0.x);
    int _2513 = _2421 + 4;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    float _2517 = as_type<float>(_dmw0.y);
    int _2519 = _2421 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    float _2523 = as_type<float>(_dmw0.z);
    int _2525 = _2421 + 12;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    float _2529 = as_type<float>(_dmw0.w);
    int _2531 = _2345 + 262160;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2537 = _2423 + 262192;
    uint _2539 = uint(int(uint(_2425) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2539)];
    float _2541 = as_type<float>(_dmw4.x);
    int _2543 = _2425 + 4;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    float _2547 = as_type<float>(_dmw4.y);
    int _2549 = _2425 + 8;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    float _2553 = as_type<float>(_dmw4.z);
    int _2555 = _2425 + 12;
    uint _2557 = uint(int(uint(_2555) >> uint(2)));
    float _2559 = as_type<float>(_dmw4.w);
    int _2561 = _2345 + 262224;
    uint _2563 = uint(int(uint(_2427) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2563)];
    float _2565 = as_type<float>(_dmw8.x);
    int _2567 = _2427 + 4;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    float _2571 = as_type<float>(_dmw8.y);
    int _2573 = _2427 + 8;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    float _2577 = as_type<float>(_dmw8.z);
    int _2579 = _2427 + 12;
    uint _2581 = uint(int(uint(_2579) >> uint(2)));
    float _2583 = as_type<float>(_dmw8.w);
    int _2585 = _2339 + 262176;
    int _2587 = _2339 + 262240;
    uint _2589 = uint(int(uint(_2429) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2589)];
    float _2591 = as_type<float>(_dmw13.x);
    int _2593 = _2429 + 4;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    float _2597 = as_type<float>(_dmw13.y);
    int _2599 = _2429 + 8;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    float _2603 = as_type<float>(_dmw13.z);
    int _2605 = _2429 + 12;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    float _2609 = as_type<float>(_dmw13.w);
    int _2611 = _2339 + 262256;
    int _2613 = _2345 + 262208;
    uint _2615 = uint(int(uint(_2453) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2615)];
    float _2617 = as_type<float>(_dmw11.x);
    int _2619 = _2453 + 4;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    float _2623 = as_type<float>(_dmw11.y);
    int _2625 = _2453 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    float _2629 = as_type<float>(_dmw11.z);
    int _2631 = _2453 + 12;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    float _2635 = as_type<float>(_dmw11.w);
    bool _2637 = _2215 > 0.5;
    float _2639 = 1.0 / _2535;
    int _2641 = _2423 + 262224;
    uint _2643 = uint(int(uint(_2505) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2643)];
    float _2645 = as_type<float>(_dmw7.x);
    int _2647 = _2505 + 4;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    float _2651 = as_type<float>(_dmw7.y);
    int _2653 = _2505 + 8;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    float _2657 = as_type<float>(_dmw7.z);
    int _2659 = _2505 + 12;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    float _2663 = as_type<float>(_dmw7.w);
    int _2665 = _2345 + 262144;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2669 = _2667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    uint _2671 = uint(int(uint(_2507) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2671)];
    float _2673 = as_type<float>(_dmw10.x);
    int _2675 = _2507 + 4;
    uint _2677 = uint(int(uint(_2675) >> uint(2)));
    float _2679 = as_type<float>(_dmw10.y);
    int _2681 = _2507 + 8;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    float _2685 = as_type<float>(_dmw10.z);
    int _2687 = _2507 + 12;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    float _2691 = as_type<float>(_dmw10.w);
    int _2693 = _2345 + 262176;
    int _2695 = _2345 + 262240;
    uint _2697 = uint(int(uint(_2531) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2697)];
    float _2699 = as_type<float>(_dmw12.x);
    int _2701 = _2531 + 4;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    float _2705 = as_type<float>(_dmw12.y);
    int _2707 = _2531 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    float _2711 = as_type<float>(_dmw12.z);
    int _2713 = _2531 + 12;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    float _2717 = as_type<float>(_dmw12.w);
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2723 = _2345 + 262256;
    int _2725 = _2423 + 262208;
    uint _2727 = uint(int(uint(_2537) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2727)];
    float _2729 = as_type<float>(_dmw15.x);
    int _2731 = _2537 + 4;
    uint _2733 = uint(int(uint(_2731) >> uint(2)));
    float _2735 = as_type<float>(_dmw15.y);
    int _2737 = _2537 + 8;
    uint _2739 = uint(int(uint(_2737) >> uint(2)));
    float _2741 = as_type<float>(_dmw15.z);
    int _2743 = _2537 + 12;
    uint _2745 = uint(int(uint(_2743) >> uint(2)));
    float _2747 = as_type<float>(_dmw15.w);
    float _2749 = 1.0 / _2669;
    uint _2751 = uint(int(uint(_2561) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2751)];
    float _2753 = as_type<float>(_dmw14.x);
    int _2755 = _2561 + 4;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    float _2759 = as_type<float>(_dmw14.y);
    int _2761 = _2561 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    float _2765 = as_type<float>(_dmw14.z);
    int _2767 = _2561 + 12;
    uint _2769 = uint(int(uint(_2767) >> uint(2)));
    float _2771 = as_type<float>(_dmw14.w);
    bool _2773 = _2637;
    float _2775 = _2219;
    float _2777 = _2217;
    if (_2457)
    {
        bool _2779 = _809 > 0.5;
        _991 = _2779;
    }
    bool _2781 = _991;
    uint _2783 = uint(int(uint(_2613) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2783)];
    float _2785 = as_type<float>(_dmw17.x);
    int _2787 = _2613 + 4;
    uint _2789 = uint(int(uint(_2787) >> uint(2)));
    float _2791 = as_type<float>(_dmw17.y);
    int _2793 = _2613 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    float _2797 = as_type<float>(_dmw17.z);
    int _2799 = _2613 + 12;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    float _2803 = as_type<float>(_dmw17.w);
    float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2807 = _2805 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    uint _2809 = uint(int(uint(_2641) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2809)];
    float _2811 = as_type<float>(_dmw20.x);
    int _2813 = _2641 + 4;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    float _2817 = as_type<float>(_dmw20.y);
    int _2819 = _2641 + 8;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    float _2823 = as_type<float>(_dmw20.z);
    int _2825 = _2641 + 12;
    uint _2827 = uint(int(uint(_2825) >> uint(2)));
    float _2829 = as_type<float>(_dmw20.w);
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2833 = _2831 != 0;
    int _2835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2837 = _2835 != 0;
    uint _2839 = uint(int(uint(_2725) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2839)];
    float _2841 = as_type<float>(_dmw19.x);
    int _2843 = _2725 + 4;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    float _2847 = as_type<float>(_dmw19.y);
    int _2849 = _2725 + 8;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    float _2853 = as_type<float>(_dmw19.z);
    int _2855 = _2725 + 12;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    float _2859 = as_type<float>(_dmw19.w);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    uint _2865 = uint(int(uint(_2481) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2865)];
    float _2867 = as_type<float>(_dmw21.x);
    int _2869 = _2481 + 4;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    float _2873 = as_type<float>(_dmw21.y);
    int _2875 = _2481 + 8;
    uint _2877 = uint(int(uint(_2875) >> uint(2)));
    float _2879 = as_type<float>(_dmw21.z);
    int _2881 = _2481 + 12;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    float _2885 = as_type<float>(_dmw21.w);
    uint _2887 = uint(int(uint(_2665) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2887)];
    float _2889 = as_type<float>(_dmw16.x);
    int _2891 = _2665 + 4;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    float _2895 = as_type<float>(_dmw16.y);
    int _2897 = _2665 + 8;
    uint _2899 = uint(int(uint(_2897) >> uint(2)));
    float _2901 = as_type<float>(_dmw16.z);
    int _2903 = _2665 + 12;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    float _2907 = as_type<float>(_dmw16.w);
    uint _2909 = uint(int(uint(_2611) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2909)];
    float _2911 = as_type<float>(_dmw23.x);
    int _2913 = _2611 + 4;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    float _2917 = as_type<float>(_dmw23.y);
    int _2919 = _2611 + 8;
    uint _2921 = uint(int(uint(_2919) >> uint(2)));
    float _2923 = as_type<float>(_dmw23.z);
    int _2925 = _2611 + 12;
    uint _2927 = uint(int(uint(_2925) >> uint(2)));
    float _2929 = as_type<float>(_dmw23.w);
    float _2931 = 1.0 / _2721;
    float _2933 = -_2217;
    float _2935 = _2933 + 1.0;
    float _2937 = -_2253;
    float _2939 = _2937 + 1.0;
    int _2941 = _2423 + 262176;
    uint _2943 = uint(int(uint(_2723) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2943)];
    float _2945 = as_type<float>(_dmw18.x);
    int _2947 = _2723 + 4;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    float _2951 = as_type<float>(_dmw18.y);
    int _2953 = _2723 + 8;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    float _2957 = as_type<float>(_dmw18.z);
    int _2959 = _2723 + 12;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    float _2963 = as_type<float>(_dmw18.w);
    float _2965 = 1.0 / _2807;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2967;
    int _2971 = _2637 ? as_type<int>(_2935) : as_type<int>(_2217);
    uint _2973 = uint(int(uint(_2587) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2973)];
    float _2975 = as_type<float>(_dmw22.x);
    int _2977 = _2587 + 4;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    float _2981 = as_type<float>(_dmw22.y);
    int _2983 = _2587 + 8;
    uint _2985 = uint(int(uint(_2983) >> uint(2)));
    float _2987 = as_type<float>(_dmw22.z);
    int _2989 = _2587 + 12;
    uint _2991 = uint(int(uint(_2989) >> uint(2)));
    float _2993 = as_type<float>(_dmw22.w);
    if (_2833)
    {
        bool _2995 = _817 > 0.5;
        _2773 = _2995;
    }
    bool _2997 = _2773;
    float _2999 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3001 = _2999 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3003 = _2969 * _2639;
    float _3005 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3007 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3005;
    int _3009 = _2423 + 262240;
    float _3011 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3013 = _807 + _3011;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _3017 = _3015 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _3019 = _3007 * _2931;
    float _3021 = _3001 * _2749;
    float _3023 = fma(_3003, _3013, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3025 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3027 = _807 + _3025;
    bool _3029 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3031 = isnan(_807);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = -_2237;
    float _3043 = _3041 + 1.0;
    float _3045 = _3017 * _2965;
    float _3047 = fma(_3021, _3027, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3051 = _807 + _3049;
    float _3053 = _3039 * _3043;
    float _3055 = -_3039;
    float _3057 = _3055 + 1.0;
    bool _3059 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3061 = isnan(_807);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3067 = _3063 || _3065;
    float _3069 = float(_3067);
    float _3071 = fma(_3019, _3051, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _3073 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3075 = isnan(_807);
    bool _3077 = _3073 || _3075;
    bool _3079 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3081 = _3077 || _3079;
    float _3083 = float(_3081);
    uint _3085 = uint(int(uint(_2695) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3085)];
    float _3087 = as_type<float>(_dmw25.x);
    int _3089 = _2695 + 4;
    uint _3091 = uint(int(uint(_3089) >> uint(2)));
    float _3093 = as_type<float>(_dmw25.y);
    int _3095 = _2695 + 8;
    uint _3097 = uint(int(uint(_3095) >> uint(2)));
    float _3099 = as_type<float>(_dmw25.z);
    int _3101 = _2695 + 12;
    uint _3103 = uint(int(uint(_3101) >> uint(2)));
    float _3105 = as_type<float>(_dmw25.w);
    int _3107 = _2423 + 262144;
    float _3109 = _3069 * _2939;
    int _3111 = _2423 + 262160;
    uint _3113 = uint(int(uint(_2585) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3113)];
    float _3115 = as_type<float>(_dmw26.x);
    int _3117 = _2585 + 4;
    uint _3119 = uint(int(uint(_3117) >> uint(2)));
    float _3121 = as_type<float>(_dmw26.y);
    int _3123 = _2585 + 8;
    uint _3125 = uint(int(uint(_3123) >> uint(2)));
    float _3127 = as_type<float>(_dmw26.z);
    int _3129 = _2585 + 12;
    uint _3131 = uint(int(uint(_3129) >> uint(2)));
    float _3133 = as_type<float>(_dmw26.w);
    int _3135 = _2423 + 262256;
    float _3137 = -_3083;
    float _3139 = _3137 + 1.0;
    float _3141 = _3023 * _3109;
    uint _3143 = uint(int(uint(_2693) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3143)];
    float _3145 = as_type<float>(_dmw24.x);
    int _3147 = _2693 + 4;
    uint _3149 = uint(int(uint(_3147) >> uint(2)));
    float _3151 = as_type<float>(_dmw24.y);
    int _3153 = _2693 + 8;
    uint _3155 = uint(int(uint(_3153) >> uint(2)));
    float _3157 = as_type<float>(_dmw24.z);
    int _3159 = _2693 + 12;
    uint _3161 = uint(int(uint(_3159) >> uint(2)));
    float _3163 = as_type<float>(_dmw24.w);
    uint _3165 = uint(int(uint(_3135) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3165)];
    float _3167 = as_type<float>(_dmw31.x);
    int _3169 = _3135 + 4;
    uint _3171 = uint(int(uint(_3169) >> uint(2)));
    float _3173 = as_type<float>(_dmw31.y);
    int _3175 = _3135 + 8;
    uint _3177 = uint(int(uint(_3175) >> uint(2)));
    float _3179 = as_type<float>(_dmw31.z);
    int _3181 = _3135 + 12;
    uint _3183 = uint(int(uint(_3181) >> uint(2)));
    float _3185 = as_type<float>(_dmw31.w);
    float _3187 = _2253 * _3139;
    float _3189 = _3083 * _3057;
    uint _3191 = uint(int(uint(_3111) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3191)];
    float _3193 = as_type<float>(_dmw28.x);
    int _3195 = _3111 + 4;
    uint _3197 = uint(int(uint(_3195) >> uint(2)));
    float _3199 = as_type<float>(_dmw28.y);
    int _3201 = _3111 + 8;
    uint _3203 = uint(int(uint(_3201) >> uint(2)));
    float _3205 = as_type<float>(_dmw28.z);
    int _3207 = _3111 + 12;
    uint _3209 = uint(int(uint(_3207) >> uint(2)));
    float _3211 = as_type<float>(_dmw28.w);
    float _3213 = fma(_3045, _2257, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    uint _3215 = uint(int(uint(_3107) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3215)];
    float _3217 = as_type<float>(_dmw27.x);
    int _3219 = _3107 + 4;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    float _3223 = as_type<float>(_dmw27.y);
    int _3225 = _3107 + 8;
    uint _3227 = uint(int(uint(_3225) >> uint(2)));
    float _3229 = as_type<float>(_dmw27.z);
    int _3231 = _3107 + 12;
    uint _3233 = uint(int(uint(_3231) >> uint(2)));
    float _3235 = as_type<float>(_dmw27.w);
    uint _3237 = uint(int(uint(_3009) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3237)];
    float _3239 = as_type<float>(_dmw30.x);
    int _3241 = _3009 + 4;
    uint _3243 = uint(int(uint(_3241) >> uint(2)));
    float _3245 = as_type<float>(_dmw30.y);
    int _3247 = _3009 + 8;
    uint _3249 = uint(int(uint(_3247) >> uint(2)));
    float _3251 = as_type<float>(_dmw30.z);
    int _3253 = _3009 + 12;
    uint _3255 = uint(int(uint(_3253) >> uint(2)));
    float _3257 = as_type<float>(_dmw30.w);
    float _3259 = _2837 ? as_type<float>(_2971) : _2217;
    uint _3261 = uint(int(uint(_2941) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3261)];
    float _3263 = as_type<float>(_dmw29.x);
    int _3265 = _2941 + 4;
    uint _3267 = uint(int(uint(_3265) >> uint(2)));
    float _3269 = as_type<float>(_dmw29.y);
    int _3271 = _2941 + 8;
    uint _3273 = uint(int(uint(_3271) >> uint(2)));
    float _3275 = as_type<float>(_dmw29.z);
    int _3277 = _2941 + 12;
    uint _3279 = uint(int(uint(_3277) >> uint(2)));
    float _3281 = as_type<float>(_dmw29.w);
    bool _3283 = _873 != 0.0;
    bool _3285 = isnan(_873);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    bool _3293 = _871 == 0.0;
    bool _3295 = !_3291;
    bool _3297 = _3293 && _3295;
    bool _3299 = _875 == 0.0;
    bool _3301 = _3299 && _3297;
    int _3303 = 0;
    float _3305 = _3141;
    if (_2457)
    {
        float _3307 = -_2219;
        float _3309 = _3307 + 1.0;
        _3303 = as_type<int>(_3309);
    }
    int _3311 = _3303;
    int _3313 = 0;
    float _3315 = as_type<float>(_3311);
    if (_2833)
    {
        float _3317 = -_2219;
        float _3319 = _3317 + 1.0;
        _3313 = as_type<int>(_3319);
    }
    int _3321 = _3313;
    float _3323 = -_3069;
    float _3325 = _3323 + 1.0;
    float _3327 = 0.0;
    float _3329 = _3325;
    if (!_2457)
    {
        _3327 = _2219;
    }
    float _3331 = _3327;
    float _3333 = _3331;
    if (_2457)
    {
        float _3335 = _2781 ? as_type<float>(_3311) : _2219;
        _3333 = _3335;
    }
    float _3337 = _3333;
    if (_2833)
    {
        float _3339 = _2997 ? as_type<float>(_3321) : _2219;
        _2775 = _3339;
    }
    float _3341 = _2775;
    float _3343 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3141);
    float _3345 = 0.0;
    if (_3301)
    {
        _3345 = _2259;
    }
    float _3347 = _3345;
    float _3349 = 0.0;
    float _3351 = _3347;
    if (_3301)
    {
        _3349 = _2261;
    }
    float _3353 = _3349;
    float _3355 = _3353;
    if (_3301)
    {
        _3329 = _3347;
    }
    float _3357 = _3329;
    float _3359 = _3357;
    if (!_3301)
    {
        _3351 = _2259;
    }
    float _3361 = _3351;
    float _3363 = fma(_3047, _3187, _3343);
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_3301)
    {
        _3315 = _3353;
    }
    float _3367 = _3315;
    float _3369 = _3367;
    if (!_3301)
    {
        _3355 = _2261;
    }
    float _3371 = _3355;
    float _3373 = fma(_3071, _3189, _3363);
    float _3375 = _2269 * _3361;
    if (_2863)
    {
        float _3377 = _2221 ? _2935 : _2217;
        _2777 = _3377;
    }
    float _3379 = _2777;
    if (!_3301)
    {
        float _3381 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3371);
        _3369 = _3381;
    }
    float _3383 = _3369;
    float _3385 = fma(_3213, _3053, _3373);
    float _3387 = _2267 * _2263;
    if (_3301)
    {
        _3305 = _2263;
    }
    float _3389 = _3305;
    float _3391 = _3389;
    if (!_3301)
    {
        float _3393 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2263);
        _3391 = _3393;
    }
    float _3395 = _3391;
    float _3397 = -_3375;
    float _3399 = fma(_2265, _2263, _3397);
    float _3401 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3403 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[135].x, _3385);
    float _3405 = _773 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3407 = _775 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3409 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3411 = -_3387;
    float _3413 = fma(_2269, _3371, _3411);
    float _3415 = _3379 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3417 = _3401 * _3365;
    float _3419 = _3405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3421 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3423 = _3409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3425 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _3419;
    out.m_80.y = _3421;
    out.m_80.z = _3423;
    out.m_80.w = _3425;
    float _3427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_3301)
    {
        float _3429 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3361);
        _3359 = _3429;
    }
    float _3431 = _3359;
    float _3433 = _2265 * _3371;
    float _3435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3437 = abs(_1649);
    float _3439 = log2(_3437);
    float _3441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3443 = -_3433;
    float _3445 = fma(_2267, _3361, _3443);
    float _3447 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3449 = _3337 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3451 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3453 = _3399 * _2271;
    float _3455 = _3413 * _2271;
    float _3457 = _3445 * _2271;
    float _3459 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3461 = -_1211;
    float _3463 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3447);
    float _3465 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3467 = _3415 * _3435;
    float _3469 = _3449 * _3427;
    out.m_82.x = _1175;
    out.m_82.y = _1171;
    out.m_82.z = _1179;
    float _3471 = exp2(_3459);
    float _3473 = _3451 * _3441;
    float _3475 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3465);
    float _3477 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_84.x = _3469;
    out.m_84.y = _3467;
    out.m_84.z = _3473;
    out.m_84.w = _3417;
    float _3479 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3481 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3463);
    float _3483 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3485 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3479);
    float _3487 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3489 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3475);
    float _3491 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3493 = _3481 * _3383;
    float _3495 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3497 = -_1211;
    float _3499 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3477);
    float _3501 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3487);
    float _3503 = -_1211;
    float _3505 = fma(_3503, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3483);
    float _3507 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3491);
    float _3509 = fma(_3489, _3431, _3493);
    float _3511 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3495);
    float _3513 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3499);
    float _3515 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3517 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3505);
    float _3519 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3507);
    float _3521 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3511);
    float _3523 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3501);
    float _3525 = _3481 * _2267;
    float _3527 = fma(_3471, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3529 = precise::clamp(_3527, 0.0, 1.0);
    float _3531 = _3513 * _2267;
    float _3533 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3515);
    float _3535 = _3517 * _2267;
    float _3537 = _3453 * _3481;
    float _3539 = _3453 * _3513;
    float _3541 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3485);
    float _3543 = fma(_3489, _2265, _3525);
    float _3545 = _3529 * _3529;
    float _3547 = fma(_3519, _2265, _3531);
    float _3549 = fma(_3529, -2.0, 3.0);
    float _3551 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3533);
    float _3553 = fma(_3521, _2265, _3535);
    float _3555 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3557 = fma(_3455, _3489, _3537);
    float _3559 = _3517 * _3383;
    float _3561 = fma(_3455, _3519, _3539);
    float _3563 = fma(_3541, _2269, _3543);
    float _3565 = _3453 * _3517;
    float _3567 = fma(_3523, _2269, _3547);
    float _3569 = _3545 * _3549;
    float _3571 = fma(_3551, _2269, _3553);
    float _3573 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3555);
    float _3575 = _3513 * _3383;
    float _3577 = fma(_3457, _3541, _3557);
    float _3579 = fma(_3457, _3523, _3561);
    float _3581 = _2154 + _2116;
    float _3583 = fma(_3455, _3521, _3565);
    float _3585 = -_3569;
    float _3587 = _3585 + 1.0;
    float _3589 = -_2285;
    float _3591 = _2279 + _3589;
    float _3593 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    float _3595 = fma(_3519, _3431, _3575);
    out.m_86.x = _3563;
    out.m_86.y = _3567;
    out.m_86.z = _3571;
    float _3597 = _2116 * 0.5;
    float _3599 = fma(_3457, _3551, _3583);
    float _3601 = fma(_3587, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3569);
    float _3603 = -_2291;
    float _3605 = _2281 + _3603;
    float _3607 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3593);
    float _3609 = _3581 * 0.5;
    float _3611 = -_3591;
    float _3613 = _3611 + 1.0;
    float _3615 = fma(_2156, -0.5, _3597);
    out.m_88.x = _3577;
    out.m_88.y = _3579;
    out.m_88.z = _3599;
    float _3617 = _3607 + _2116;
    float _3619 = _3605 * _3613;
    out.gl_Position.x = _2154;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _3607;
    out.gl_Position.w = _2116;
    float _3621 = _3617 * 0.5;
    bool _3623 = _1649 <= 8000.0;
    bool _3625 = isnan(_1649);
    bool _3627 = _3623 || _3625;
    bool _3629 = isnan(8000.0);
    bool _3631 = _3627 || _3629;
    float _3633 = float(_3631);
    float _3635 = -_3605;
    float _3637 = _3635 + 1.0;
    float _3639 = _3637 * _3613;
    float _3641 = _3619 * _2349;
    float _3643 = _3619 * _2367;
    float _3645 = _3619 * _2381;
    float _3647 = _3619 * _2355;
    float _3649 = _3619 * _2387;
    float _3651 = _3619 * _2401;
    float _3653 = _3619 * _2375;
    float _3655 = _3619 * _2419;
    float _3657 = _3619 * _2407;
    out.m_90.x = _3609;
    out.m_90.y = _3615;
    out.m_90.z = _3621;
    out.m_90.w = _2116;
    float _3659 = _3591 * _3637;
    float _3661 = fma(_3639, _2433, _3651);
    float _3663 = _3633 * _3601;
    float _3665 = _3619 * _2491;
    float _3667 = fma(_3639, _2451, _3655);
    float _3669 = _3619 * _2511;
    float _3671 = _3619 * _2517;
    float _3673 = fma(_3639, _2439, _3657);
    float _3675 = _3619 * _2523;
    float _3677 = fma(_3639, _2571, _3647);
    float _3679 = _3605 * _3591;
    float _3681 = _3619 * _2467;
    float _3683 = _3619 * _2541;
    float _3685 = _3619 * _2461;
    float _3687 = _3619 * _2529;
    float _3689 = _3619 * _2479;
    float _3691 = _3619 * _2547;
    float _3693 = fma(_3659, _2591, _3661);
    float _3695 = _3619 * _2361;
    float _3697 = _3619 * _2553;
    float _3699 = _3619 * _2485;
    float _3701 = fma(_3639, _2623, _3665);
    float _3703 = fma(_3659, _2609, _3667);
    float _3705 = _3619 * _2393;
    float _3707 = _3619 * _2497;
    float _3709 = fma(_3639, _2645, _3669);
    float _3711 = fma(_3639, _2673, _3683);
    float _3713 = fma(_3659, _2597, _3673);
    float _3715 = _3619 * _2413;
    float _3717 = fma(_3659, _2705, _3677);
    float _3719 = _3619 * _2503;
    float _3721 = fma(_3639, _2679, _3691);
    float _3723 = fma(_3679, _2729, _3693);
    float _3725 = _3619 * _2473;
    float _3727 = fma(_3639, _2685, _3697);
    float _3729 = fma(_3639, _2617, _3699);
    float _3731 = fma(_3659, _2759, _3701);
    float _3733 = fma(_3679, _2747, _3703);
    float _3735 = _3619 * _2559;
    float _3737 = fma(_3639, _2629, _3707);
    float _3739 = fma(_3659, _2785, _3711);
    float _3741 = fma(_3679, _2735, _3713);
    float _3743 = fma(_3639, _2635, _3719);
    float _3745 = fma(_3659, _2791, _3721);
    float _3747 = _3723 * 0.886227548122406005859375;
    float _3749 = fma(_3659, _2797, _3727);
    float _3751 = fma(_3659, _2753, _3729);
    float _3753 = fma(_3679, _2817, _3731);
    float _3755 = _3733 * 0.511664927005767822265625;
    float _3757 = fma(_3639, _2691, _3735);
    float _3759 = fma(_3659, _2765, _3737);
    float _3761 = fma(_3679, _2841, _3739);
    float _3763 = _3741 * 0.886227548122406005859375;
    float _3765 = _3619 * _2873;
    float _3767 = fma(_3659, _2889, _3709);
    float _3769 = fma(_3659, _2771, _3743);
    float _3771 = fma(_3679, _2847, _3745);
    float _3773 = fma(_3679, _2853, _3749);
    float _3775 = precise::max(_3747, 0.00999999977648258209228515625);
    float _3777 = _3753 * 0.511664927005767822265625;
    float _3779 = _3755 * _3755;
    float _3781 = fma(_3659, _2803, _3757);
    float _3783 = fma(_3679, _2823, _3759);
    float _3785 = _3761 * 0.511664927005767822265625;
    float _3787 = precise::max(_3763, 0.00999999977648258209228515625);
    float _3789 = fma(_3639, _2917, _3765);
    float _3791 = fma(_3679, _2829, _3769);
    float _3793 = _3771 * 0.511664927005767822265625;
    float _3795 = 1.0 / _3775;
    float _3797 = _3773 * 0.511664927005767822265625;
    float _3799 = fma(_3777, _3777, _3779);
    float _3801 = fma(_3679, _2859, _3781);
    float _3803 = _3783 * 0.511664927005767822265625;
    float _3805 = fma(_3679, _2811, _3751);
    float _3807 = _3791 * 0.511664927005767822265625;
    float _3809 = 1.0 / _3787;
    float _3811 = _3785 * _3785;
    float _3813 = fma(_3797, _3797, _3799);
    float _3815 = _3801 * 0.511664927005767822265625;
    float _3817 = fma(_3803, _3803, _3811);
    float _3819 = _3793 * _3793;
    float _3821 = _3805 * 0.511664927005767822265625;
    float _3823 = fma(_3815, _3815, _3817);
    float _3825 = fma(_3807, _3807, _3819);
    float _3827 = sqrt(_3813);
    float _3829 = fma(_3821, _3821, _3825);
    float _3831 = sqrt(_3823);
    float _3833 = sqrt(_3829);
    float _3835 = precise::max(_3827, 0.00999999977648258209228515625);
    float _3837 = fma(_3639, _2445, _3715);
    float _3839 = fma(_3639, _2651, _3671);
    float _3841 = 1.0 / _3835;
    float _3843 = precise::max(_3831, 0.00999999977648258209228515625);
    float _3845 = fma(_3639, _2663, _3687);
    float _3847 = fma(_3659, _2603, _3837);
    float _3849 = precise::max(_3833, 0.00999999977648258209228515625);
    float _3851 = 1.0 / _3843;
    float _3853 = fma(_3679, _2741, _3847);
    float _3855 = 1.0 / _3849;
    float _3857 = _3853 * 0.886227548122406005859375;
    float _3859 = _3755 * _3841;
    float _3861 = fma(_3523, _3395, _3595);
    float _3863 = _3843 * _3809;
    float _3865 = precise::clamp(_3863, 0.0, 1.0);
    float _3867 = _3835 * _3795;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = _3777 * _3841;
    float _3873 = _3797 * _3841;
    float _3875 = precise::max(_3857, 0.00999999977648258209228515625);
    float _3877 = _3861 * _3859;
    float _3879 = _3785 * _3851;
    float _3881 = fma(_3521, _3431, _3559);
    float _3883 = fma(_3541, _3395, _3509);
    float _3885 = _3619 * _2867;
    float _3887 = _3619 * _2879;
    float _3889 = _3619 * _2885;
    float _3891 = _3793 * _3855;
    float _3893 = 1.0 / _3875;
    float _3895 = _3803 * _3851;
    float _3897 = fma(_3659, _2951, _3789);
    float _3899 = fma(_3883, _3871, _3877);
    float _3901 = fma(_3551, _3395, _3881);
    float _3903 = _3807 * _3855;
    float _3905 = _3861 * _3891;
    float _3907 = _3861 * _3879;
    float _3909 = fma(_3639, _2657, _3675);
    float _3911 = fma(_3679, _3173, _3897);
    float _3913 = _3815 * _3851;
    float _3915 = fma(_3883, _3895, _3907);
    float _3917 = fma(_3901, _3873, _3899);
    float _3919 = _3861 * 1.02332699298858642578125;
    float _3921 = _3821 * _3855;
    float _3923 = fma(_3883, _3903, _3905);
    float _3925 = fma(_3639, _2565, _3641);
    float _3927 = fma(_3639, _2981, _3681);
    float _3929 = fma(_3659, _2901, _3909);
    float _3931 = fma(_3679, _3199, _3717);
    float _3933 = fma(_3917, 0.5, 0.5);
    float _3935 = _3911 * _3919;
    float _3937 = fma(_3901, _3913, _3915);
    float _3939 = fma(_3901, _3921, _3923);
    float _3941 = fma(_3659, _2907, _3845);
    float _3943 = fma(_3639, _2975, _3685);
    float _3945 = fma(_3639, _2911, _3885);
    float _3947 = fma(_3659, _2699, _3925);
    float _3949 = fma(_3659, _3093, _3927);
    float _3951 = fma(_3679, _3229, _3929);
    float _3953 = _3931 * _3919;
    float _3955 = fma(_3937, 0.5, 0.5);
    float _3957 = fma(_3939, 0.5, 0.5);
    float _3959 = fma(_3639, _3115, _3653);
    float _3961 = fma(_3679, _3235, _3941);
    float _3963 = fma(_3639, _2577, _3695);
    float _3965 = fma(_3639, _2583, _3643);
    float _3967 = fma(_3639, _2987, _3725);
    float _3969 = fma(_3639, _2923, _3887);
    float _3971 = fma(_3659, _2895, _3839);
    float _3973 = fma(_3659, _3087, _3943);
    float _3975 = fma(_3659, _2945, _3945);
    float _3977 = fma(_3679, _3193, _3947);
    float _3979 = fma(_3679, _3245, _3949);
    float _3981 = fma(_3951, 0.88622701168060302734375, _3953);
    float _3983 = fma(_3659, _3145, _3959);
    float _3985 = abs(_3957);
    float _3987 = log2(_3985);
    float _3989 = _3961 * _3919;
    float _3991 = fma(_3639, _2993, _3689);
    float _3993 = fma(_3659, _2711, _3963);
    float _3995 = fma(_3659, _2717, _3965);
    float _3997 = fma(_3659, _3099, _3967);
    float _3999 = fma(_3659, _2957, _3969);
    float _4001 = fma(_3679, _3217, _3767);
    float _4003 = fma(_3679, _3223, _3971);
    float _4005 = fma(_3679, _3239, _3973);
    float _4007 = fma(_3679, _3167, _3975);
    float _4009 = abs(_3933);
    float _4011 = log2(_4009);
    float _4013 = _3977 * _3919;
    float _4015 = _3979 * _3919;
    float _4017 = fma(_3679, _3263, _3983);
    float _4019 = _3901 * 1.02332699298858642578125;
    float _4021 = abs(_3955);
    float _4023 = log2(_4021);
    float _4025 = fma(_3659, _3105, _3991);
    float _4027 = fma(_3679, _3205, _3993);
    float _4029 = fma(_3679, _3211, _3995);
    float _4031 = fma(_3679, _3251, _3997);
    float _4033 = fma(_3679, _3179, _3999);
    float _4035 = fma(_4001, 0.88622701168060302734375, _3989);
    float _4037 = fma(_4003, 0.88622701168060302734375, _4013);
    float _4039 = fma(_4005, 0.88622701168060302734375, _4015);
    float _4041 = fma(_4007, 0.88622701168060302734375, _3935);
    float _4043 = fma(_3639, _3121, _3645);
    float _4045 = _3849 * _3893;
    float _4047 = precise::clamp(_4045, 0.0, 1.0);
    float _4049 = fma(_3639, _3127, _3649);
    float _4051 = fma(_3639, _3133, _3705);
    float _4053 = fma(_3639, _2929, _3889);
    float _4055 = fma(_4017, _4019, _3981);
    float _4057 = fma(_3679, _3257, _4025);
    float _4059 = fma(_4027, _4019, _4035);
    float _4061 = fma(_4029, _4019, _4037);
    float _4063 = fma(_4031, _4019, _4039);
    float _4065 = _3883 * 1.02332699298858642578125;
    float _4067 = fma(_4033, _4019, _4041);
    float _4069 = fma(_3869, 2.0, 1.0);
    float _4071 = fma(_3865, 2.0, 1.0);
    float _4073 = fma(_3659, _3151, _4043);
    float _4075 = fma(_4047, 2.0, 1.0);
    float _4077 = fma(_3659, _3157, _4049);
    float _4079 = fma(_3659, _3163, _4051);
    float _4081 = fma(_3659, _2963, _4053);
    float _4083 = fma(_4057, _4065, _4063);
    float _4085 = fma(_3679, _3269, _4073);
    float _4087 = _4075 * _3987;
    float _4089 = fma(_3679, _3275, _4077);
    float _4091 = fma(_3679, _3281, _4079);
    float _4093 = fma(_3679, _3185, _4081);
    float _4095 = _4069 * _4011;
    float _4097 = _4083 * 0.31830990314483642578125;
    float _4099 = precise::clamp(_4097, 0.0, 1.0);
    float _4101 = _4071 * _4023;
    float _4103 = _3869 + 1.0;
    float _4105 = _3865 + 1.0;
    float _4107 = fma(_4085, _4065, _4059);
    float _4109 = fma(_4089, _4065, _4061);
    float _4111 = fma(_4091, _4065, _4055);
    float _4113 = fma(_4093, _4065, _4067);
    float _4115 = _4047 + 1.0;
    float _4117 = exp2(_4095);
    float _4119 = _4099 * 0.88622701168060302734375;
    float _4121 = precise::max(0.0, _4107);
    out.m_92.w = _1107;
    float _4123 = precise::max(0.0, _4109);
    float _4125 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_94.x = _1195;
    float _4127 = exp2(_4101);
    float _4129 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _4131 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _4133 = in.m_96.x;
    float _4135 = exp2(_4087);
    float _4137 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[17].x, _4129);
    float _4139 = fma(_4123, (*spvDescriptorSet0.vp_c15)._m0[17].y, _4131);
    float _4141 = 1.0 / _4103;
    float _4143 = -_3869;
    float _4145 = _4143 + 1.0;
    float _4147 = -_3865;
    float _4149 = _4147 + 1.0;
    float _4151 = 1.0 / _4105;
    float _4153 = _4113 * 0.31830990314483642578125;
    float _4155 = precise::clamp(_4153, 0.0, 1.0);
    float _4157 = 1.0 / _4115;
    float _4159 = fma(_3869, 2.0, 2.0);
    float _4161 = fma(_3865, 2.0, 2.0);
    float _4163 = fma(_4047, 2.0, 2.0);
    float _4165 = -_4047;
    float _4167 = _4165 + 1.0;
    float _4169 = _4159 * _4117;
    float _4171 = _4161 * _4127;
    float _4173 = _4163 * _4135;
    out.m_98.x = _3883;
    out.m_98.y = _3861;
    out.m_98.z = _3901;
    float _4175 = -_4155;
    float _4177 = _4175 + 1.0;
    out.m_100.x = _1639;
    out.m_100.y = _1637;
    out.m_100.z = _1641;
    float _4179 = fma(_4177, (*spvDescriptorSet0.vp_c15)._m0[659].w, _4155);
    out.m_102.x = 0.0;
    float _4181 = _4145 * _4141;
    float _4183 = _4149 * _4151;
    float _4185 = _4167 * _4157;
    float _4187 = -_4169;
    float _4189 = _4187 + 1.0;
    float _4191 = -_4171;
    float _4193 = _4191 + 1.0;
    float _4195 = -_4173;
    float _4197 = _4195 + 1.0;
    bool _4199 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4201 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _4203 = precise::max(0.0, _4111);
    float _4205 = fma(_4181, _4189, _4169);
    float _4207 = fma(_4183, _4193, _4171);
    float _4209 = fma(_4185, _4197, _4173);
    float _4211 = exp2(_4125);
    float _4213 = fma(_4203, (*spvDescriptorSet0.vp_c15)._m0[17].z, _4201);
    float _4215 = _3747 * _4205;
    float _4217 = _3763 * _4207;
    float _4219 = _4179 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _4221 = _3857 * _4209;
    float _4223 = fma(_4215, _4219, _4137);
    float _4225 = fma(_4217, _4219, _4139);
    float _4227 = fma(_4221, _4219, _4213);
    float _4229 = _1709 * _1763;
    float _4231 = _4223 * 0.31830990314483642578125;
    float _4233 = _4225 * 0.31830990314483642578125;
    float _4235 = _4227 * 0.31830990314483642578125;
    bool _4237 = !_4199;
    if (!_4237)
    {
        float _4239 = -_1637;
        float _4241 = _4239 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4243 = -_1639;
        float _4245 = _4243 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4247 = -_1641;
        float _4249 = _4247 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4251 = _4241 * _4241;
        float _4253 = fma(_4245, _4245, _4251);
        float _4255 = fma(_4249, _4249, _4253);
        float _4257 = sqrt(_4255);
        float _4259 = rsqrt(_4255);
        float _4261 = -_4257;
        float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4265 = _4263 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4267 = precise::clamp(_4265, 0.0, 1.0);
        float _4269 = _4245 * _4259;
        float _4271 = _4241 * _4259;
        float _4273 = abs(_4267);
        float _4275 = log2(_4273);
        float _4277 = _4249 * _4259;
        float _4279 = _4269 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4281 = _3861 * _4271;
        float _4283 = -_4271;
        float _4285 = -_4279;
        float _4287 = fma(_4283, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4285);
        float _4289 = fma(_3883, _4269, _4281);
        float _4291 = -_4277;
        float _4293 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4287);
        float _4295 = fma(_3901, _4277, _4289);
        float _4297 = precise::clamp(_4295, 0.0, 1.0);
        float _4299 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4301 = _4293 + _4299;
        float _4303 = _4275 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4305 = _4301 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4307 = precise::clamp(_4305, 0.0, 1.0);
        float _4309 = exp2(_4303);
        float _4311 = _4309 * _4307;
        float _4313 = _4297 * _4311;
        float _4315 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4317 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4319 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _4315;
        out.m_102.y = _4317;
        out.m_102.z = _4319;
    }
    float _4321 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4323 = -_4211;
    float _4325 = _4323 + 1.0;
    float _4327 = -_2182;
    float _4329 = _4327 + 1.0;
    float _4331 = _4229 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4333 = _4325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4335 = _4329 * _4321;
    float _4337 = precise::clamp(_4335, 0.0, 1.0);
    bool _4339 = _1709 > 0.0;
    bool _4341 = isnan(_1709);
    bool _4343 = _4339 || _4341;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    float _4349 = _4331 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4351 = _4333 * _2184;
    float _4353 = -_4337;
    float _4355 = fma(_4353, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _4357 = _1763 <= 0.0;
    bool _4359 = !_4347;
    bool _4361 = _4357 || _4359;
    float _4363 = -_4333;
    float _4365 = _4363 + 1.0;
    float _4367 = _2195 * _4351;
    float _4369 = _4355 * _4133;
    float _4371 = _2209 * _4351;
    out.m_56.x = _4349;
    float _4373 = fma(_2205, _4367, _2189);
    float _4375 = fma(_2207, _4367, _2191);
    float _4377 = _4369 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4379 = _2195 * _4365;
    float _4381 = fma(_2195, _4371, _2193);
    out.m_92.x = _4231;
    out.m_92.y = _4233;
    out.m_92.z = _4235;
    out.m_104.x = _4377;
    out.m_106.x = _4373;
    out.m_106.y = _4375;
    out.m_106.z = _4381;
    out.m_106.w = _4379;
    if (!_4361)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _4383 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4383;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _799 = false;
    bool _577 = false;
    bool _473 = false;
    bool _359 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_53.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_56.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4440 = as_type<float>(_141);
        out.gl_Position.z = _4440;
    }
    if (!_129)
    {
        return out;
    }
    float _145 = in.m_58.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = _159;
    if (_155)
    {
        float _163 = float(_125);
        _135 = _163;
    }
    float _165 = _135;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    float _173 = _165;
    if (_171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _173;
    if (_171)
    {
        out.m_56.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4510 = as_type<float>(_179);
        out.gl_Position.z = _4510;
    }
    if (_171)
    {
        return out;
    }
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _199 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    float _201 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _205 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_187;
    float _209 = _201;
    float _211 = _203;
    float _213 = _205;
    float _231;
    if (!_207)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_125);
        float _237 = 1.0 / _235;
        float _239 = _159 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = in.m_64.x;
    float _249 = in.m_64.y;
    float _251 = in.m_64.z;
    bool _253 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_241);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_241);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _245 * _289;
    float _301 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _307;
    float _311 = fma(_305, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = fma(_309, _299, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _315 = _301 * _293;
    float _317 = _311 * _293;
    float _319 = _313 * _293;
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _315);
    float _323 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _317);
    float _325 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].z, _319);
    float _327 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _329 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    float _331 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].z, _325);
    float _333 = _327 * _247;
    float _335 = _329 * _249;
    float _337 = _331 * _251;
    bool _339 = !_291;
    float _357;
    if (!_339)
    {
        float _341 = in.m_62.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _371 = _367 + _369;
    bool _373 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _375 = isnan(_367);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _385;
    bool _389 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _391 = isnan(_367);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_383;
    float _403 = _401 + 1.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _405;
    float _409 = 1.0 / _387;
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _413 = _399 * _403;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = _371 * _409;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _421;
    float _425 = fma(_407, _419, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _427;
    float _431 = fma(_423, _419, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _433 = fma(_429, _419, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _425 * _413;
    float _437 = _431 * _413;
    float _439 = _433 * _413;
    float _441 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].x, _435);
    float _443 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _445 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].z, _437);
    float _447 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].x, _441);
    float _449 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].y, _443);
    float _451 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].z, _445);
    bool _453 = !_411;
    float _471;
    if (!_453)
    {
        float _455 = in.m_62.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        float _475 = float(_125);
        float _477 = 1.0 / _475;
        float _479 = _159 * _477;
        _471 = _479;
    }
    _473 = false;
    float _481 = _471;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _481 + _483;
    bool _487 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = isnan(_481);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _503 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_481);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _515;
    float _519 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _521 = -_497;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _527 = 1.0 / _501;
    float _529 = _513 * _523;
    float _531 = -_513;
    float _533 = _531 + 1.0;
    float _535 = _517 * _527;
    float _537 = _451 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = fma(_535, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _543 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _541 * _529;
    float _547 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[116].x, _549);
    float _555 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _539;
    out.m_66.y = _551;
    out.m_66.z = _543;
    out.m_66.w = _555;
    bool _557 = !_525;
    float _575;
    if (!_557)
    {
        float _559 = in.m_62.x;
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _563 = _559 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].z, _159);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _575 = _573;
        _577 = true;
    }
    else
    {
        float _579 = float(_125);
        float _581 = 1.0 / _579;
        float _583 = _159 * _581;
        _575 = _583;
    }
    _577 = false;
    float _585 = _575;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _589 = _585 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _593 = _585 + _591;
    bool _595 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _597 = isnan(_585);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _613 = _585 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _623 = 1.0 / _609;
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _627 = 1.0 / _621;
    float _629 = 1.0 / _617;
    float _631 = _589 * _623;
    bool _633 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _635 = isnan(_585);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -_605;
    float _647 = _645 + 1.0;
    float _649 = _643 * _647;
    float _651 = _593 * _627;
    bool _653 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _655 = isnan(_585);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _665;
    bool _669 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _671 = isnan(_585);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = _613 * _629;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _699;
    float _703 = _679 * _691;
    float _705 = fma(_667, _693, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _707 = fma(_697, _693, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _709 = fma(_701, _693, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _711 = _663 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _717 = _707 * _703;
    float _719 = _709 * _703;
    float _721 = -_679;
    float _723 = _721 + 1.0;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _729 = _705 * _703;
    float _731 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].x, _719);
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].y, _717);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _735;
    float _739 = fma(_683, _651, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _741 = fma(_715, _651, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _743 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].z, _729);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _745;
    float _749 = fma(_727, _651, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _751;
    float _755 = fma(_739, _711, _731);
    float _757 = fma(_737, _631, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _759 = fma(_747, _631, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _761 = fma(_741, _711, _733);
    float _763 = fma(_753, _631, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _765 = fma(_749, _711, _743);
    float _767 = fma(_757, _649, _755);
    float _769 = fma(_759, _649, _761);
    float _771 = fma(_763, _649, _765);
    float _773 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].x, _767);
    float _775 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].y, _769);
    float _777 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].z, _771);
    bool _779 = !_625;
    float _797;
    if (!_779)
    {
        float _781 = in.m_62.x;
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _785 = _781 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _789 = _787 * _783;
        float _791 = floor(_789);
        float _793 = -_791;
        float _795 = _789 + _793;
        _797 = _795;
        _799 = true;
    }
    else
    {
        float _801 = float(_125);
        float _803 = 1.0 / _801;
        float _805 = _159 * _803;
        _797 = _805;
    }
    _799 = false;
    float _807 = _797;
    float _809 = in.m_62.x;
    float _811 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _813 = log2(_811);
    float _815 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _817 = in.m_62.z;
    float _819 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _823 = 1.0 + _821;
    float _825 = in.m_62.y;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _837 = _835 != 0;
    float _839 = _815 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _841 = 1.0 / _823;
    float _843 = in.m_53.x;
    float _845 = in.m_53.y;
    float _847 = in.m_53.z;
    bool _849 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(1.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _861 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    float _871 = in.m_68.x;
    float _873 = in.m_68.y;
    float _875 = in.m_68.z;
    float _877 = _813 * _159;
    float _879 = exp2(_877);
    float _881 = _809 * 2.0;
    float _883 = _817 * 2.0;
    float _885 = floor(_881);
    float _887 = _825 * 2.0;
    float _889 = _825 + _817;
    float _891 = _845 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _893 = floor(_883);
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _845 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _901 = _845 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _903 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[5].x, _891);
    float _905 = _889 + (-1.0);
    float _907 = _869 ? _897 : 0.0;
    float _909 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[6].x, _899);
    float _911 = floor(_887);
    bool _913 = _885 > 0.0;
    float _915 = _809 + _817;
    if (_857)
    {
        float _917 = _907 * _841;
        _161 = _917;
    }
    float _919 = _161;
    bool _921 = _885 >= 0.0;
    bool _923 = isnan(_885);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[4].x, _901);
    float _933 = _915 + (-1.0);
    float _935 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    bool _937 = _893 >= 0.0;
    bool _939 = isnan(_893);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.0);
    bool _945 = _941 || _943;
    float _947 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _949 = _893 > 0.0;
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _953 = _929 ? 0 : 1;
    float _955 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[4].z, _931);
    int _957 = _945 ? 0 : 1;
    float _959 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[6].z, _909);
    bool _961 = _911 > 0.0;
    bool _963 = _911 >= 0.0;
    bool _965 = isnan(_911);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    float _973 = _959 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _975 = ~_953;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    bool _981 = !_829;
    int _983 = _981 ? 0 : 1;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _973 + _985;
    int _989 = _979;
    bool _991 = _961;
    if (!_913)
    {
        int _993 = ~_953;
        int _995 = _993 + 1;
        _989 = _995;
    }
    int _997 = _989;
    float _999 = _935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1001 = !_833;
    int _1003 = _1001 ? 0 : 1;
    int _1005 = abs(_983);
    float _1007 = _955 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1011 = _999 + _1009;
    int _1013 = ~_957;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    int _1019 = _1017;
    if (!_949)
    {
        int _1021 = ~_957;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1007 + _1027;
    int _1031 = abs(_1003);
    float _1033 = _1011 * _1011;
    float _1035 = in.m_70.x;
    float _1037 = in.m_70.y;
    float _1039 = in.m_70.z;
    float _1041 = float(_997);
    float _1043 = fma(_1029, _1029, _1033);
    float _1045 = float(_1031);
    int _1047 = _971 ? 0 : 1;
    float _1049 = fma(_987, _987, _1043);
    float _1051 = _1045 * _1041;
    int _1053 = ~_1047;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    float _1059 = sqrt(_1049);
    int _1061 = _1057;
    if (!_961)
    {
        int _1063 = ~_1047;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    float _1069 = _1051 * (-2.0);
    float _1071 = _825 + (-0.5);
    float _1073 = float(_1005);
    float _1075 = float(_1025);
    float _1077 = fma(_947, _1069, _947);
    float _1079 = rsqrt(_1049);
    bool _1081 = !_837;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _1073 * _1075;
    float _1087 = fma(_1069, _1037, _1037);
    int _1089 = abs(_1083);
    float _1091 = float(_1067);
    float _1093 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1087);
    float _1095 = _809 + _825;
    float _1097 = _1059 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1099 = float(_1089);
    float _1101 = fma(_1077, _919, _1093);
    float _1103 = _1095 + (-1.0);
    float _1105 = _1085 * (-2.0);
    float _1107 = precise::min(_839, _1097);
    float _1109 = _1099 * _1091;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1113 = _809 + (-0.5);
    float _1115 = fma(_1105, _1035, _1035);
    float _1117 = _1079 * _1107;
    float _1119 = fma(_1111, _1105, _1111);
    float _1121 = _1109 * (-2.0);
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1115);
    float _1125 = _1011 * _1117;
    float _1127 = _1029 * _1117;
    float _1129 = _987 * _1117;
    float _1131 = fma(_1119, _919, _1123);
    float _1133 = -_1125;
    float _1135 = _1011 + _1133;
    float _1137 = -_1127;
    float _1139 = _1029 + _1137;
    float _1141 = fma(_1121, _1039, _1039);
    float _1143 = _1131 * 0.15915493667125701904296875;
    float _1145 = _1135 * _1135;
    float _1147 = _817 + (-0.5);
    float _1149 = -_1129;
    float _1151 = _987 + _1149;
    float _1153 = fma(_951, _1121, _951);
    float _1155 = fma(_1139, _1139, _1145);
    float _1157 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1141);
    float _1159 = _1101 * 0.15915493667125701904296875;
    float _1161 = _1143 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = fma(_1151, _1151, _1155);
    float _1167 = fma(_1153, _919, _1157);
    float _1169 = -_1125;
    float _1171 = _999 + _1169;
    float _1173 = -_1127;
    float _1175 = _1007 + _1173;
    float _1177 = -_1129;
    float _1179 = _973 + _1177;
    float _1181 = _1167 * 0.15915493667125701904296875;
    float _1183 = sqrt(_1165);
    float _1185 = _1159 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = _1159 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = _1079 * _1183;
    float _1195 = _815 * _1193;
    float _1197 = _1181 * 6.283185482025146484375;
    float _1199 = cos(_1197);
    float _1201 = _1163 * _1187;
    float _1203 = _1143 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = _1163 * _1191;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = _1191 * _1199;
    float _1215 = _1163 * _1199;
    float _1217 = _1205 * _1191;
    float _1219 = _1205 * _1187;
    float _1221 = _1205 * _1199;
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _873);
    float _1225 = _819 * _1193;
    float _1227 = _859 * _1193;
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _871);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _875);
    float _1233 = _1225 * _1223;
    float _1235 = fma(_1211, _1207, _1219);
    float _1237 = _1195 * _1229;
    float _1239 = _1187 * _1199;
    float _1241 = _1215 * _1233;
    float _1243 = _1227 * _1231;
    float _1245 = -_1217;
    float _1247 = fma(_1211, _1201, _1245);
    float _1249 = -_1233;
    float _1251 = _1211 * _1249;
    float _1253 = fma(_1235, _1237, _1241);
    float _1255 = -_1201;
    float _1257 = fma(_1211, _1217, _1255);
    float _1259 = _1221 * _1233;
    float _1261 = fma(_1213, _1237, _1251);
    float _1263 = fma(_1247, _1243, _1253);
    float _1265 = fma(_1211, _1219, _1207);
    float _1267 = fma(_1257, _1237, _1259);
    float _1269 = fma(_1239, _1243, _1261);
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1275 = fma(_1265, _1243, _1267);
    float _1277 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1271);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1273);
    float _1281 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1277);
    float _1283 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1279);
    float _1285 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1287 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1289 = _973 + _1285;
    float _1291 = _1007 + _1287;
    float _1293 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1297 = _1289 + _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1301 = _1291 + _1299;
    float _1303 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1293);
    float _1305 = _1297 * _1297;
    float _1307 = fma(_1301, _1301, _1305);
    float _1309 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1311 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1303);
    float _1313 = sqrt(_1307);
    float _1315 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1309);
    float _1317 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1315);
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1321 = _999 + _1319;
    bool _1323 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1319;
    float _1327 = _1309;
    float _1329 = _1303;
    if (!_1323)
    {
        _1325 = _1291;
    }
    float _1331 = _1325;
    float _1333 = _1331;
    if (!_1323)
    {
        _1327 = _1289;
    }
    float _1335 = _1327;
    float _1337 = _1335;
    if (!_1323)
    {
        _1329 = _1321;
    }
    float _1339 = _1329;
    bool _1341 = !_1323;
    float _1343 = _1339;
    if (!_1341)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1349 = _1313 + _1347;
        float _1351 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = rsqrt(_1307);
        float _1355 = _1349 * _1345;
        float _1357 = _1355 * 0.15915493667125701904296875;
        float _1359 = _1357 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1357 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 + (-1.0);
        float _1369 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = fma(_1321, _1361, _1369);
        float _1375 = _1353 * _1371;
        float _1377 = fma(_1301, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1379 = fma(_1297, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1373;
        _1333 = _1377;
        _1337 = _1379;
    }
    float _1381 = _1343;
    float _1383 = _1333;
    float _1385 = _1337;
    float _1387 = -_999;
    float _1389 = _1387 + _1381;
    float _1391 = -_1007;
    float _1393 = _1391 + _1383;
    float _1395 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1397 = _1389 * _1389;
    float _1399 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = -_973;
    float _1403 = _1401 + _1385;
    float _1405 = 1.0 / _1395;
    float _1407 = fma(_1393, _1393, _1397);
    float _1409 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1411 = fma(_1175, 0.008000000379979610443115234375, 64.0);
    float _1413 = -_1125;
    float _1415 = _1413 + _1381;
    float _1417 = fma(_1403, _1403, _1407);
    float _1419 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1421 = -_1129;
    float _1423 = _1421 + _1385;
    float _1425 = precise::max(0.0, _1411);
    float _1427 = sqrt(_1417);
    float _1429 = fma(_1179, 0.008000000379979610443115234375, 64.0);
    float _1431 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1433 = precise::min(_1425, 127.0);
    float _1435 = -_1127;
    float _1437 = _1435 + _1383;
    float _1439 = precise::max(0.0, _1429);
    float _1441 = _1431 + _1395;
    float _1443 = trunc(_1433);
    int _1445 = int(_1443);
    float _1447 = precise::min(_1439, 127.0);
    float _1449 = _1441 * _1405;
    float _1451 = _1449 * 0.5;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1461 = _1457 || _1459;
    bool _1463 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1465 = isnan(0.5);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1475 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1473);
    bool _1477 = _1427 > 0.0;
    float _1479 = trunc(_1447);
    int _1481 = int(_1479);
    float _1483 = 1.0 / _1475;
    float _1485 = _1383;
    float _1487 = _1385;
    float _1489 = _1381;
    if (!_1477)
    {
        _1485 = _1437;
    }
    float _1491 = _1485;
    float _1493 = _1491;
    float _1495 = _1491;
    if (!_1477)
    {
        _1487 = _1415;
    }
    float _1497 = _1487;
    int _1499 = _1481 << 7;
    int _1501 = _1499 + _1445;
    float _1503 = _1497;
    if (!_1477)
    {
        _1489 = _1423;
    }
    float _1505 = _1489;
    bool _1507 = !_1477;
    float _1509 = _1505;
    if (!_1507)
    {
        float _1511 = _203 * _203;
        float _1513 = rsqrt(_1417);
        float _1515 = fma(_201, _201, _1511);
        float _1517 = fma(_205, _205, _1515);
        float _1519 = sqrt(_1517);
        float _1521 = _1393 * _1513;
        float _1523 = _1389 * _1513;
        float _1525 = _1403 * _1513;
        bool _1527 = _1519 > 0.0;
        float _1529 = _1513;
        float _1531 = _1519;
        if (!_1527)
        {
            _1493 = _1437;
        }
        float _1533 = _1493;
        _1495 = _1533;
        if (!_1527)
        {
            _1529 = _1415;
        }
        float _1535 = _1529;
        _1503 = _1535;
        if (!_1527)
        {
            _1531 = _1423;
        }
        float _1537 = _1531;
        bool _1539 = !_1527;
        _1509 = _1537;
        if (!_1539)
        {
            float _1541 = rsqrt(_1517);
            float _1543 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1545 = _203 * _1541;
            float _1547 = _201 * _1541;
            float _1549 = _205 * _1541;
            float _1551 = _1523 * _1545;
            float _1553 = fma(_1521, _1547, _1551);
            float _1555 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1557 = fma(_1525, _1549, _1553);
            float _1559 = _1557 * _1555;
            float _1561 = fma(_201, _1559, _1437);
            float _1563 = fma(_203, _1559, _1415);
            float _1565 = fma(_205, _1559, _1423);
            _1495 = _1561;
            _1503 = _1563;
            _1509 = _1565;
        }
    }
    float _1567 = _1495;
    float _1569 = _1503;
    float _1571 = _1509;
    int _1573 = _1501 << 4;
    if (_1461)
    {
        _209 = _1567;
    }
    float _1575 = _209;
    float _1577 = _1575;
    if (_1461)
    {
        _211 = _1569;
    }
    float _1579 = _211;
    float _1581 = _1579;
    if (_1461)
    {
        _213 = _1571;
    }
    float _1583 = _213;
    float _1585 = _1583;
    if (!_1461)
    {
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1589 = _1171 + _1587;
        float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1593 = _1175 + _1591;
        float _1595 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = -_1175;
        float _1599 = _1597 + _1567;
        float _1601 = _1589 * _1589;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1605 = _1179 + _1603;
        float _1607 = -_1171;
        float _1609 = _1607 + _1569;
        float _1611 = -_1179;
        float _1613 = _1611 + _1571;
        float _1615 = fma(_1593, _1593, _1601);
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1619 = fma(_1605, _1605, _1615);
        float _1621 = sqrt(_1619);
        float _1623 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1625 = precise::min(_1621, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1627 = _1625 * _1617;
        float _1629 = _1623 * _1627;
        float _1631 = fma(_1599, _1629, _1175);
        float _1633 = fma(_1609, _1629, _1171);
        float _1635 = fma(_1613, _1629, _1179);
        _1581 = _1633;
        _1577 = _1631;
        _1585 = _1635;
    }
    float _1637 = _1581;
    float _1639 = _1577;
    float _1641 = _1585;
    float _1643 = 0.0;
    if (_1471)
    {
        _1643 = 1.0;
    }
    float _1645 = _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1649 = _1483 * _1647;
    float _1651 = 0.0;
    float _1653 = _1645;
    if (_1471)
    {
        _1651 = 1.0;
    }
    float _1655 = _1651;
    int _1657 = _1573 + 8;
    float _1659 = _1655;
    if (!_1471)
    {
        float _1661 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1661 * 0.15915493667125701904296875;
        float _1665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1667;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1665 * 0.15915493667125701904296875;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = 1.0 / _1673;
        float _1683 = _1675 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = _1675 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = 1.0 / _1669;
        float _1697 = 1.0 / _1693;
        float _1699 = _1691 * _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = fma(_1649, _1699, _1701);
        float _1705 = _1703 * _1695;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        _1653 = _1707;
    }
    float _1709 = _1653;
    if (!_1471)
    {
        float _1711 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1713 = _1711 * 0.15915493667125701904296875;
        float _1715 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1717 = _1713 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1715 * 0.15915493667125701904296875;
        float _1723 = _1713 * 6.283185482025146484375;
        float _1725 = sin(_1723);
        float _1727 = 1.0 / _1719;
        float _1729 = _1721 * 6.283185482025146484375;
        float _1731 = cos(_1729);
        float _1733 = _1725 * _1727;
        float _1735 = _1721 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        float _1739 = _1731 * _1733;
        float _1741 = 1.0 / _1739;
        float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1745 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1743;
        float _1747 = 1.0 / _1745;
        float _1749 = _1737 * _1741;
        float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1753 = fma(_1649, _1749, _1751);
        float _1755 = _1753 * _1747;
        float _1757 = precise::clamp(_1755, 0.0, 1.0);
        float _1759 = -_1757;
        float _1761 = _1759 + 1.0;
        _1659 = _1761;
    }
    float _1763 = _1659;
    uint _1766 = uint(int(uint(_1657) >> uint(2)));
    float _1768 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1766)]);
    float _1770 = floor(_1433);
    int _1772 = _1573 + 12;
    uint _1774 = uint(int(uint(_1573) >> uint(2)));
    float _1776 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1774)]);
    uint _1778 = uint(int(uint(_1772) >> uint(2)));
    float _1780 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1778)]);
    float _1782 = -_1770;
    float _1784 = _1433 + _1782;
    float _1786 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1788 = _1768 + _1784;
    float _1790 = trunc(_1788);
    int _1792 = int(_1790);
    int _1794 = _1445 + _1792;
    int _1796 = _1481 << 7;
    int _1798 = _1796 + _1794;
    int _1800 = _1798 << 4;
    float _1802 = floor(_1447);
    int _1804 = _1800 + 12;
    uint _1806 = uint(int(uint(_1800) >> uint(2)));
    float _1808 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1806)]);
    uint _1810 = uint(int(uint(_1804) >> uint(2)));
    float _1812 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1810)]);
    float _1814 = -_1802;
    float _1816 = _1447 + _1814;
    float _1818 = _1768 + _1816;
    float _1820 = trunc(_1818);
    int _1822 = int(_1820);
    int _1824 = _1481 + _1822;
    int _1826 = _1824 << 7;
    int _1828 = _1826 + _1445;
    int _1830 = _1824 << 7;
    int _1832 = _1830 + _1794;
    int _1834 = _1828 << 4;
    int _1836 = _1832 << 4;
    int _1838 = _1834 + 12;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1637 + _1840;
    int _1844 = _1836 + 12;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1639 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1852 = _1641 + _1850;
    uint _1854 = uint(int(uint(_1838) >> uint(2)));
    float _1856 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1854)]);
    uint _1858 = uint(int(uint(_1844) >> uint(2)));
    float _1860 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1858)]);
    float _1862 = _1842 * _1842;
    uint _1864 = uint(int(uint(_1834) >> uint(2)));
    float _1866 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1864)]);
    float _1868 = fma(_1848, _1848, _1862);
    uint _1870 = uint(int(uint(_1836) >> uint(2)));
    float _1872 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1870)]);
    float _1874 = fma(_1852, _1852, _1868);
    float _1876 = rsqrt(_1874);
    float _1878 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1880 = _1848 * _1878;
    float _1882 = _1852 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 + _1886;
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = _1890 + _1894;
    float _1898 = _1852;
    float _1900 = _1896;
    float _1902 = as_type<float>(_1838);
    float _1904 = _1878;
    float _1906 = as_type<float>(_1834);
    if (_1892)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1898 = _1908;
    }
    float _1910 = _1898;
    if (_1892)
    {
        float _1912 = _1896 * _1910;
        _1900 = _1912;
    }
    float _1914 = _1900;
    if (_1892)
    {
        float _1916 = _1914 * 0.15915493667125701904296875;
        _1902 = _1916;
    }
    float _1918 = _1902;
    float _1920 = _1876;
    if (_1892)
    {
        float _1922 = _1918 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = _1910;
    if (_1892)
    {
        float _1932 = _1918 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = precise::max(0.0, _1928);
    float _1940 = _1888;
    float _1942 = _1938;
    if (_1892)
    {
        float _1944 = rsqrt(_1888);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = -_1878;
    float _1950 = -_1938;
    float _1952 = fma(_1842, _1948, _1950);
    float _1954 = _1952;
    float _1956 = _1926;
    if (_1892)
    {
        float _1958 = _1926 + (-1.0);
        _1904 = _1958;
    }
    float _1960 = _1904;
    float _1962 = _1960;
    if (_1892)
    {
        float _1964 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _1964;
    }
    float _1966 = _1942;
    float _1968 = _1966;
    if (_1892)
    {
        float _1970 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1962 = _1970;
    }
    float _1972 = _1962;
    float _1974 = _1936;
    if (_1892)
    {
        float _1976 = fma(_1936, _1966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1974 = _1976;
    }
    float _1978 = _1974;
    float _1980 = sqrt(_1874);
    float _1982 = _1978;
    if (_1892)
    {
        float _1984 = fma(_1952, _1926, _1972);
        _1954 = _1984;
    }
    float _1986 = _1954;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1892)
    {
        float _1990 = _1946 * _1978;
        _1906 = _1990;
    }
    float _1992 = _1906;
    if (!_1892)
    {
        _1982 = _1880;
    }
    float _1994 = _1982;
    float _1996 = _1994;
    if (_1892)
    {
        float _1998 = _1880 * _1992;
        _1996 = _1998;
    }
    float _2000 = _1996;
    if (!_1892)
    {
        _1968 = _1882;
    }
    float _2002 = _1968;
    float _2004 = _2002;
    if (_1892)
    {
        float _2006 = _1882 * _1992;
        _2004 = _2006;
    }
    float _2008 = _2004;
    if (!_1892)
    {
        _1956 = _1884;
    }
    float _2010 = _1956;
    float _2012 = _2010;
    if (_1892)
    {
        float _2014 = _2000 * _2000;
        _2012 = _2014;
    }
    float _2016 = _2012;
    float _2018 = fma(_1175, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1892)
    {
        _1988 = _1886;
    }
    float _2020 = _1988;
    float _2022 = _2020;
    if (_1892)
    {
        float _2024 = _2008 * _2008;
        _2022 = _2024;
    }
    float _2026 = _2022;
    float _2028 = fma(_1986, _1986, _2016);
    float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2032 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2030);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = _2028 + _2026;
    float _2038 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2040 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2038);
    float _2044 = rsqrt(_2036);
    float _2046 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2048 = -_2034;
    float _2050 = _2048 + 1.0;
    float _2052 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2042);
    float _2054 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2056 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2058 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2046);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2062 = abs(_2050);
    float _2064 = log2(_2062);
    float _2066 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2056);
    float _2068 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2072 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1786);
    float _2074 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2066);
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2070);
    float _2078 = floor(_2018);
    float _2080 = _2044 * _2000;
    float _2082 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2084 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2072);
    float _2086 = _2044 * _1986;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2096 = _2044 * _2008;
    float _2098 = -_2088;
    float _2100 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2098);
    float _2102 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2104 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2076);
    float _2106 = -_2092;
    float _2108 = fma(_2106, _2090, 1.0);
    float _2110 = -_2096;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2100);
    float _2114 = exp2(_2102);
    float _2116 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2104);
    float _2118 = -_2078;
    float _2120 = _2018 + _2118;
    float _2122 = fma(_2112, -0.5, 0.5);
    float _2124 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = log2(_2108);
    float _2130 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2132 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2134 = 1.0 / _2116;
    float _2136 = fma(_2112, 0.5, 0.5);
    float _2138 = _2086 + 1.0;
    float _2140 = floor(_2054);
    float _2142 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2130);
    float _2144 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2132);
    float _2146 = sqrt(_2122);
    float _2148 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = -_2086;
    float _2152 = fma(_2114, _2138, _2150);
    float _2154 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2156 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2144);
    float _2158 = fma(_2136, _2148, -0.212114393711090087890625);
    float _2160 = _2128 * 0.693147182464599609375;
    float _2162 = _2154 * _2134;
    float _2164 = -_2140;
    float _2166 = _2054 + _2164;
    float _2168 = _2156 * _2134;
    float _2170 = fma(_2136, _2158, 1.570728778839111328125);
    float _2172 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2174 = fma(_2162, 0.5, 0.5);
    float _2176 = fma(_2168, -0.5, 0.5);
    float _2178 = _2146 * 0.636619746685028076171875;
    float _2180 = fma(_2152, 0.5, 0.5);
    float2 _7629 = float2(_2120, _2166);
    float _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7629, float2(0.0), isnan(_7629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7629, float2(0.0), isnan(_7629)), level(0.0)).x;
    float3 _7640 = float3(_2174, _2176, _2172);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).x;
    float3 _7651 = float3(_2174, _2176, _2172);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7651, float3(0.0), isnan(_7651)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7651, float3(0.0), isnan(_7651)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float _2197 = -_2170;
    float _2199 = fma(_2178, _2197, 1.0);
    float2 _7672 = float2(_2199, _2180);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7672, float2(0.0), isnan(_7672)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7672, float2(0.0), isnan(_7672)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = floor(_1788);
    float _2213 = _1816 * _1812;
    float _2215 = in.m_62.w;
    float _2217 = in.m_72.y;
    float _2219 = in.m_72.x;
    bool _2221 = _825 > 0.5;
    float _2223 = -_2211;
    float _2225 = _1788 + _2223;
    bool _2227 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2229 = isnan(_807);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = _2225 * _1812;
    float _2241 = floor(_2213);
    bool _2243 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2245 = isnan(_807);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2257 = _807 + _2255;
    float _2259 = in.m_74.x;
    float _2261 = in.m_74.y;
    float _2263 = in.m_74.z;
    float _2265 = in.m_76.x;
    float _2267 = in.m_76.y;
    float _2269 = in.m_76.z;
    float _2271 = in.m_76.w;
    float _2273 = floor(_2239);
    float _2275 = fma(_1812, _2241, _2273);
    float _2277 = floor(_1818);
    float _2279 = _1816 * _1780;
    float _2281 = _1784 * _1780;
    float _2283 = _1784 * _1856;
    float _2285 = floor(_2279);
    float _2287 = -_2277;
    float _2289 = _1818 + _2287;
    float _2291 = floor(_2281);
    float _2293 = _2289 * _1856;
    float _2295 = _2225 * _1860;
    float _2297 = _2289 * _1860;
    float _2299 = floor(_2293);
    float _2301 = floor(_2283);
    float _2303 = fma(_1780, _2285, _2291);
    float _2305 = floor(_2295);
    float _2307 = floor(_2297);
    float _2309 = fma(_1856, _2299, _2301);
    float _2311 = trunc(_2275);
    int _2313 = int(_2311);
    float _2315 = trunc(_2303);
    int _2317 = int(_2315);
    float _2319 = fma(_1860, _2307, _2305);
    float _2321 = trunc(_2309);
    int _2323 = int(_2321);
    int _2325 = as_type<int>(_1808) + _2313;
    float _2327 = trunc(_2319);
    int _2329 = int(_2327);
    int _2331 = _2325 * 656;
    int _2333 = as_type<int>(_1776) + _2317;
    int _2335 = _2331 + 262160;
    int _2337 = as_type<int>(_1866) + _2323;
    int _2339 = _2333 * 656;
    int _2341 = _2331 + 262176;
    int _2343 = _2331 + 262192;
    int _2345 = _2337 * 656;
    uint _2347 = uint(int(uint(_2335) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2347)];
    float _2349 = as_type<float>(_dmw1.x);
    int _2351 = _2335 + 4;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    float _2355 = as_type<float>(_dmw1.y);
    int _2357 = _2335 + 8;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    float _2361 = as_type<float>(_dmw1.z);
    int _2363 = _2335 + 12;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    float _2367 = as_type<float>(_dmw1.w);
    int _2369 = as_type<int>(_1872) + _2329;
    int _2371 = _2331 + 262240;
    uint _2373 = uint(int(uint(_2341) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2373)];
    float _2375 = as_type<float>(_dmw2.x);
    int _2377 = _2341 + 4;
    uint _2379 = uint(int(uint(_2377) >> uint(2)));
    float _2381 = as_type<float>(_dmw2.y);
    int _2383 = _2341 + 8;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw2.z);
    int _2389 = _2341 + 12;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw2.w);
    int _2395 = _2331 + 262224;
    int _2397 = _2339 + 262192;
    uint _2399 = uint(int(uint(_2343) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2399)];
    float _2401 = as_type<float>(_dmw3.x);
    int _2403 = _2343 + 4;
    uint _2405 = uint(int(uint(_2403) >> uint(2)));
    float _2407 = as_type<float>(_dmw3.y);
    int _2409 = _2343 + 8;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    float _2413 = as_type<float>(_dmw3.z);
    int _2415 = _2343 + 12;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    float _2419 = as_type<float>(_dmw3.w);
    int _2421 = _2331 + 262144;
    int _2423 = _2369 * 656;
    int _2425 = _2331 + 262208;
    out.m_78.x = 1.0;
    out.m_78.y = 1.0;
    out.m_78.z = 1.0;
    int _2427 = _2339 + 262160;
    int _2429 = _2345 + 262192;
    uint _2431 = uint(int(uint(_2397) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2431)];
    float _2433 = as_type<float>(_dmw9.x);
    int _2435 = _2397 + 4;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    float _2439 = as_type<float>(_dmw9.y);
    int _2441 = _2397 + 8;
    uint _2443 = uint(int(uint(_2441) >> uint(2)));
    float _2445 = as_type<float>(_dmw9.z);
    int _2447 = _2397 + 12;
    uint _2449 = uint(int(uint(_2447) >> uint(2)));
    float _2451 = as_type<float>(_dmw9.w);
    int _2453 = _2339 + 262224;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2457 = _2455 != 0;
    uint _2459 = uint(int(uint(_2371) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2459)];
    float _2461 = as_type<float>(_dmw6.x);
    int _2463 = _2371 + 4;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    float _2467 = as_type<float>(_dmw6.y);
    int _2469 = _2371 + 8;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    float _2473 = as_type<float>(_dmw6.z);
    int _2475 = _2371 + 12;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    float _2479 = as_type<float>(_dmw6.w);
    int _2481 = _2331 + 262256;
    uint _2483 = uint(int(uint(_2395) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2483)];
    float _2485 = as_type<float>(_dmw5.x);
    int _2487 = _2395 + 4;
    uint _2489 = uint(int(uint(_2487) >> uint(2)));
    float _2491 = as_type<float>(_dmw5.y);
    int _2493 = _2395 + 8;
    uint _2495 = uint(int(uint(_2493) >> uint(2)));
    float _2497 = as_type<float>(_dmw5.z);
    int _2499 = _2395 + 12;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    float _2503 = as_type<float>(_dmw5.w);
    int _2505 = _2339 + 262144;
    int _2507 = _2339 + 262208;
    uint _2509 = uint(int(uint(_2421) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2509)];
    float _2511 = as_type<float>(_dmw0.x);
    int _2513 = _2421 + 4;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    float _2517 = as_type<float>(_dmw0.y);
    int _2519 = _2421 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    float _2523 = as_type<float>(_dmw0.z);
    int _2525 = _2421 + 12;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    float _2529 = as_type<float>(_dmw0.w);
    int _2531 = _2345 + 262160;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2537 = _2423 + 262192;
    uint _2539 = uint(int(uint(_2425) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2539)];
    float _2541 = as_type<float>(_dmw4.x);
    int _2543 = _2425 + 4;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    float _2547 = as_type<float>(_dmw4.y);
    int _2549 = _2425 + 8;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    float _2553 = as_type<float>(_dmw4.z);
    int _2555 = _2425 + 12;
    uint _2557 = uint(int(uint(_2555) >> uint(2)));
    float _2559 = as_type<float>(_dmw4.w);
    int _2561 = _2345 + 262224;
    uint _2563 = uint(int(uint(_2427) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2563)];
    float _2565 = as_type<float>(_dmw8.x);
    int _2567 = _2427 + 4;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    float _2571 = as_type<float>(_dmw8.y);
    int _2573 = _2427 + 8;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    float _2577 = as_type<float>(_dmw8.z);
    int _2579 = _2427 + 12;
    uint _2581 = uint(int(uint(_2579) >> uint(2)));
    float _2583 = as_type<float>(_dmw8.w);
    int _2585 = _2339 + 262176;
    int _2587 = _2339 + 262240;
    uint _2589 = uint(int(uint(_2429) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2589)];
    float _2591 = as_type<float>(_dmw13.x);
    int _2593 = _2429 + 4;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    float _2597 = as_type<float>(_dmw13.y);
    int _2599 = _2429 + 8;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    float _2603 = as_type<float>(_dmw13.z);
    int _2605 = _2429 + 12;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    float _2609 = as_type<float>(_dmw13.w);
    int _2611 = _2339 + 262256;
    int _2613 = _2345 + 262208;
    uint _2615 = uint(int(uint(_2453) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2615)];
    float _2617 = as_type<float>(_dmw11.x);
    int _2619 = _2453 + 4;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    float _2623 = as_type<float>(_dmw11.y);
    int _2625 = _2453 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    float _2629 = as_type<float>(_dmw11.z);
    int _2631 = _2453 + 12;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    float _2635 = as_type<float>(_dmw11.w);
    bool _2637 = _2215 > 0.5;
    float _2639 = 1.0 / _2535;
    int _2641 = _2423 + 262224;
    uint _2643 = uint(int(uint(_2505) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2643)];
    float _2645 = as_type<float>(_dmw7.x);
    int _2647 = _2505 + 4;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    float _2651 = as_type<float>(_dmw7.y);
    int _2653 = _2505 + 8;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    float _2657 = as_type<float>(_dmw7.z);
    int _2659 = _2505 + 12;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    float _2663 = as_type<float>(_dmw7.w);
    int _2665 = _2345 + 262144;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2669 = _2667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    uint _2671 = uint(int(uint(_2507) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2671)];
    float _2673 = as_type<float>(_dmw10.x);
    int _2675 = _2507 + 4;
    uint _2677 = uint(int(uint(_2675) >> uint(2)));
    float _2679 = as_type<float>(_dmw10.y);
    int _2681 = _2507 + 8;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    float _2685 = as_type<float>(_dmw10.z);
    int _2687 = _2507 + 12;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    float _2691 = as_type<float>(_dmw10.w);
    int _2693 = _2345 + 262176;
    int _2695 = _2345 + 262240;
    uint _2697 = uint(int(uint(_2531) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2697)];
    float _2699 = as_type<float>(_dmw12.x);
    int _2701 = _2531 + 4;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    float _2705 = as_type<float>(_dmw12.y);
    int _2707 = _2531 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    float _2711 = as_type<float>(_dmw12.z);
    int _2713 = _2531 + 12;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    float _2717 = as_type<float>(_dmw12.w);
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2723 = _2345 + 262256;
    int _2725 = _2423 + 262208;
    uint _2727 = uint(int(uint(_2537) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2727)];
    float _2729 = as_type<float>(_dmw15.x);
    int _2731 = _2537 + 4;
    uint _2733 = uint(int(uint(_2731) >> uint(2)));
    float _2735 = as_type<float>(_dmw15.y);
    int _2737 = _2537 + 8;
    uint _2739 = uint(int(uint(_2737) >> uint(2)));
    float _2741 = as_type<float>(_dmw15.z);
    int _2743 = _2537 + 12;
    uint _2745 = uint(int(uint(_2743) >> uint(2)));
    float _2747 = as_type<float>(_dmw15.w);
    float _2749 = 1.0 / _2669;
    uint _2751 = uint(int(uint(_2561) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2751)];
    float _2753 = as_type<float>(_dmw14.x);
    int _2755 = _2561 + 4;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    float _2759 = as_type<float>(_dmw14.y);
    int _2761 = _2561 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    float _2765 = as_type<float>(_dmw14.z);
    int _2767 = _2561 + 12;
    uint _2769 = uint(int(uint(_2767) >> uint(2)));
    float _2771 = as_type<float>(_dmw14.w);
    bool _2773 = _2637;
    float _2775 = _2219;
    float _2777 = _2217;
    if (_2457)
    {
        bool _2779 = _809 > 0.5;
        _991 = _2779;
    }
    bool _2781 = _991;
    uint _2783 = uint(int(uint(_2613) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2783)];
    float _2785 = as_type<float>(_dmw17.x);
    int _2787 = _2613 + 4;
    uint _2789 = uint(int(uint(_2787) >> uint(2)));
    float _2791 = as_type<float>(_dmw17.y);
    int _2793 = _2613 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    float _2797 = as_type<float>(_dmw17.z);
    int _2799 = _2613 + 12;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    float _2803 = as_type<float>(_dmw17.w);
    float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2807 = _2805 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    uint _2809 = uint(int(uint(_2641) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2809)];
    float _2811 = as_type<float>(_dmw20.x);
    int _2813 = _2641 + 4;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    float _2817 = as_type<float>(_dmw20.y);
    int _2819 = _2641 + 8;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    float _2823 = as_type<float>(_dmw20.z);
    int _2825 = _2641 + 12;
    uint _2827 = uint(int(uint(_2825) >> uint(2)));
    float _2829 = as_type<float>(_dmw20.w);
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2833 = _2831 != 0;
    int _2835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2837 = _2835 != 0;
    uint _2839 = uint(int(uint(_2725) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2839)];
    float _2841 = as_type<float>(_dmw19.x);
    int _2843 = _2725 + 4;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    float _2847 = as_type<float>(_dmw19.y);
    int _2849 = _2725 + 8;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    float _2853 = as_type<float>(_dmw19.z);
    int _2855 = _2725 + 12;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    float _2859 = as_type<float>(_dmw19.w);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    uint _2865 = uint(int(uint(_2481) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2865)];
    float _2867 = as_type<float>(_dmw21.x);
    int _2869 = _2481 + 4;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    float _2873 = as_type<float>(_dmw21.y);
    int _2875 = _2481 + 8;
    uint _2877 = uint(int(uint(_2875) >> uint(2)));
    float _2879 = as_type<float>(_dmw21.z);
    int _2881 = _2481 + 12;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    float _2885 = as_type<float>(_dmw21.w);
    uint _2887 = uint(int(uint(_2665) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2887)];
    float _2889 = as_type<float>(_dmw16.x);
    int _2891 = _2665 + 4;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    float _2895 = as_type<float>(_dmw16.y);
    int _2897 = _2665 + 8;
    uint _2899 = uint(int(uint(_2897) >> uint(2)));
    float _2901 = as_type<float>(_dmw16.z);
    int _2903 = _2665 + 12;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    float _2907 = as_type<float>(_dmw16.w);
    uint _2909 = uint(int(uint(_2611) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2909)];
    float _2911 = as_type<float>(_dmw23.x);
    int _2913 = _2611 + 4;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    float _2917 = as_type<float>(_dmw23.y);
    int _2919 = _2611 + 8;
    uint _2921 = uint(int(uint(_2919) >> uint(2)));
    float _2923 = as_type<float>(_dmw23.z);
    int _2925 = _2611 + 12;
    uint _2927 = uint(int(uint(_2925) >> uint(2)));
    float _2929 = as_type<float>(_dmw23.w);
    float _2931 = 1.0 / _2721;
    float _2933 = -_2217;
    float _2935 = _2933 + 1.0;
    float _2937 = -_2253;
    float _2939 = _2937 + 1.0;
    int _2941 = _2423 + 262176;
    uint _2943 = uint(int(uint(_2723) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2943)];
    float _2945 = as_type<float>(_dmw18.x);
    int _2947 = _2723 + 4;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    float _2951 = as_type<float>(_dmw18.y);
    int _2953 = _2723 + 8;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    float _2957 = as_type<float>(_dmw18.z);
    int _2959 = _2723 + 12;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    float _2963 = as_type<float>(_dmw18.w);
    float _2965 = 1.0 / _2807;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2967;
    int _2971 = _2637 ? as_type<int>(_2935) : as_type<int>(_2217);
    uint _2973 = uint(int(uint(_2587) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2973)];
    float _2975 = as_type<float>(_dmw22.x);
    int _2977 = _2587 + 4;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    float _2981 = as_type<float>(_dmw22.y);
    int _2983 = _2587 + 8;
    uint _2985 = uint(int(uint(_2983) >> uint(2)));
    float _2987 = as_type<float>(_dmw22.z);
    int _2989 = _2587 + 12;
    uint _2991 = uint(int(uint(_2989) >> uint(2)));
    float _2993 = as_type<float>(_dmw22.w);
    if (_2833)
    {
        bool _2995 = _817 > 0.5;
        _2773 = _2995;
    }
    bool _2997 = _2773;
    float _2999 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3001 = _2999 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3003 = _2969 * _2639;
    float _3005 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3007 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3005;
    int _3009 = _2423 + 262240;
    float _3011 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3013 = _807 + _3011;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _3017 = _3015 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _3019 = _3007 * _2931;
    float _3021 = _3001 * _2749;
    float _3023 = fma(_3003, _3013, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3025 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3027 = _807 + _3025;
    bool _3029 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3031 = isnan(_807);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = -_2237;
    float _3043 = _3041 + 1.0;
    float _3045 = _3017 * _2965;
    float _3047 = fma(_3021, _3027, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3051 = _807 + _3049;
    float _3053 = _3039 * _3043;
    float _3055 = -_3039;
    float _3057 = _3055 + 1.0;
    bool _3059 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3061 = isnan(_807);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3067 = _3063 || _3065;
    float _3069 = float(_3067);
    float _3071 = fma(_3019, _3051, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _3073 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3075 = isnan(_807);
    bool _3077 = _3073 || _3075;
    bool _3079 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3081 = _3077 || _3079;
    float _3083 = float(_3081);
    uint _3085 = uint(int(uint(_2695) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3085)];
    float _3087 = as_type<float>(_dmw25.x);
    int _3089 = _2695 + 4;
    uint _3091 = uint(int(uint(_3089) >> uint(2)));
    float _3093 = as_type<float>(_dmw25.y);
    int _3095 = _2695 + 8;
    uint _3097 = uint(int(uint(_3095) >> uint(2)));
    float _3099 = as_type<float>(_dmw25.z);
    int _3101 = _2695 + 12;
    uint _3103 = uint(int(uint(_3101) >> uint(2)));
    float _3105 = as_type<float>(_dmw25.w);
    int _3107 = _2423 + 262144;
    float _3109 = _3069 * _2939;
    int _3111 = _2423 + 262160;
    uint _3113 = uint(int(uint(_2585) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3113)];
    float _3115 = as_type<float>(_dmw26.x);
    int _3117 = _2585 + 4;
    uint _3119 = uint(int(uint(_3117) >> uint(2)));
    float _3121 = as_type<float>(_dmw26.y);
    int _3123 = _2585 + 8;
    uint _3125 = uint(int(uint(_3123) >> uint(2)));
    float _3127 = as_type<float>(_dmw26.z);
    int _3129 = _2585 + 12;
    uint _3131 = uint(int(uint(_3129) >> uint(2)));
    float _3133 = as_type<float>(_dmw26.w);
    int _3135 = _2423 + 262256;
    float _3137 = -_3083;
    float _3139 = _3137 + 1.0;
    float _3141 = _3023 * _3109;
    uint _3143 = uint(int(uint(_2693) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3143)];
    float _3145 = as_type<float>(_dmw24.x);
    int _3147 = _2693 + 4;
    uint _3149 = uint(int(uint(_3147) >> uint(2)));
    float _3151 = as_type<float>(_dmw24.y);
    int _3153 = _2693 + 8;
    uint _3155 = uint(int(uint(_3153) >> uint(2)));
    float _3157 = as_type<float>(_dmw24.z);
    int _3159 = _2693 + 12;
    uint _3161 = uint(int(uint(_3159) >> uint(2)));
    float _3163 = as_type<float>(_dmw24.w);
    uint _3165 = uint(int(uint(_3135) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3165)];
    float _3167 = as_type<float>(_dmw31.x);
    int _3169 = _3135 + 4;
    uint _3171 = uint(int(uint(_3169) >> uint(2)));
    float _3173 = as_type<float>(_dmw31.y);
    int _3175 = _3135 + 8;
    uint _3177 = uint(int(uint(_3175) >> uint(2)));
    float _3179 = as_type<float>(_dmw31.z);
    int _3181 = _3135 + 12;
    uint _3183 = uint(int(uint(_3181) >> uint(2)));
    float _3185 = as_type<float>(_dmw31.w);
    float _3187 = _2253 * _3139;
    float _3189 = _3083 * _3057;
    uint _3191 = uint(int(uint(_3111) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3191)];
    float _3193 = as_type<float>(_dmw28.x);
    int _3195 = _3111 + 4;
    uint _3197 = uint(int(uint(_3195) >> uint(2)));
    float _3199 = as_type<float>(_dmw28.y);
    int _3201 = _3111 + 8;
    uint _3203 = uint(int(uint(_3201) >> uint(2)));
    float _3205 = as_type<float>(_dmw28.z);
    int _3207 = _3111 + 12;
    uint _3209 = uint(int(uint(_3207) >> uint(2)));
    float _3211 = as_type<float>(_dmw28.w);
    float _3213 = fma(_3045, _2257, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    uint _3215 = uint(int(uint(_3107) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3215)];
    float _3217 = as_type<float>(_dmw27.x);
    int _3219 = _3107 + 4;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    float _3223 = as_type<float>(_dmw27.y);
    int _3225 = _3107 + 8;
    uint _3227 = uint(int(uint(_3225) >> uint(2)));
    float _3229 = as_type<float>(_dmw27.z);
    int _3231 = _3107 + 12;
    uint _3233 = uint(int(uint(_3231) >> uint(2)));
    float _3235 = as_type<float>(_dmw27.w);
    uint _3237 = uint(int(uint(_3009) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3237)];
    float _3239 = as_type<float>(_dmw30.x);
    int _3241 = _3009 + 4;
    uint _3243 = uint(int(uint(_3241) >> uint(2)));
    float _3245 = as_type<float>(_dmw30.y);
    int _3247 = _3009 + 8;
    uint _3249 = uint(int(uint(_3247) >> uint(2)));
    float _3251 = as_type<float>(_dmw30.z);
    int _3253 = _3009 + 12;
    uint _3255 = uint(int(uint(_3253) >> uint(2)));
    float _3257 = as_type<float>(_dmw30.w);
    float _3259 = _2837 ? as_type<float>(_2971) : _2217;
    uint _3261 = uint(int(uint(_2941) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3261)];
    float _3263 = as_type<float>(_dmw29.x);
    int _3265 = _2941 + 4;
    uint _3267 = uint(int(uint(_3265) >> uint(2)));
    float _3269 = as_type<float>(_dmw29.y);
    int _3271 = _2941 + 8;
    uint _3273 = uint(int(uint(_3271) >> uint(2)));
    float _3275 = as_type<float>(_dmw29.z);
    int _3277 = _2941 + 12;
    uint _3279 = uint(int(uint(_3277) >> uint(2)));
    float _3281 = as_type<float>(_dmw29.w);
    bool _3283 = _873 != 0.0;
    bool _3285 = isnan(_873);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    bool _3293 = _871 == 0.0;
    bool _3295 = !_3291;
    bool _3297 = _3293 && _3295;
    bool _3299 = _875 == 0.0;
    bool _3301 = _3299 && _3297;
    int _3303 = 0;
    float _3305 = _3141;
    if (_2457)
    {
        float _3307 = -_2219;
        float _3309 = _3307 + 1.0;
        _3303 = as_type<int>(_3309);
    }
    int _3311 = _3303;
    int _3313 = 0;
    float _3315 = as_type<float>(_3311);
    if (_2833)
    {
        float _3317 = -_2219;
        float _3319 = _3317 + 1.0;
        _3313 = as_type<int>(_3319);
    }
    int _3321 = _3313;
    float _3323 = -_3069;
    float _3325 = _3323 + 1.0;
    float _3327 = 0.0;
    float _3329 = _3325;
    if (!_2457)
    {
        _3327 = _2219;
    }
    float _3331 = _3327;
    float _3333 = _3331;
    if (_2457)
    {
        float _3335 = _2781 ? as_type<float>(_3311) : _2219;
        _3333 = _3335;
    }
    float _3337 = _3333;
    if (_2833)
    {
        float _3339 = _2997 ? as_type<float>(_3321) : _2219;
        _2775 = _3339;
    }
    float _3341 = _2775;
    float _3343 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3141);
    float _3345 = 0.0;
    if (_3301)
    {
        _3345 = _2259;
    }
    float _3347 = _3345;
    float _3349 = 0.0;
    float _3351 = _3347;
    if (_3301)
    {
        _3349 = _2261;
    }
    float _3353 = _3349;
    float _3355 = _3353;
    if (_3301)
    {
        _3329 = _3347;
    }
    float _3357 = _3329;
    float _3359 = _3357;
    if (!_3301)
    {
        _3351 = _2259;
    }
    float _3361 = _3351;
    float _3363 = fma(_3047, _3187, _3343);
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_3301)
    {
        _3315 = _3353;
    }
    float _3367 = _3315;
    float _3369 = _3367;
    if (!_3301)
    {
        _3355 = _2261;
    }
    float _3371 = _3355;
    float _3373 = fma(_3071, _3189, _3363);
    float _3375 = _2269 * _3361;
    if (_2863)
    {
        float _3377 = _2221 ? _2935 : _2217;
        _2777 = _3377;
    }
    float _3379 = _2777;
    if (!_3301)
    {
        float _3381 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3371);
        _3369 = _3381;
    }
    float _3383 = _3369;
    float _3385 = fma(_3213, _3053, _3373);
    float _3387 = _2267 * _2263;
    if (_3301)
    {
        _3305 = _2263;
    }
    float _3389 = _3305;
    float _3391 = _3389;
    if (!_3301)
    {
        float _3393 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2263);
        _3391 = _3393;
    }
    float _3395 = _3391;
    float _3397 = -_3375;
    float _3399 = fma(_2265, _2263, _3397);
    float _3401 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3403 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[135].x, _3385);
    float _3405 = _773 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3407 = _775 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3409 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3411 = -_3387;
    float _3413 = fma(_2269, _3371, _3411);
    float _3415 = _3379 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3417 = _3401 * _3365;
    float _3419 = _3405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3421 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3423 = _3409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3425 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _3419;
    out.m_80.y = _3421;
    out.m_80.z = _3423;
    out.m_80.w = _3425;
    float _3427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_3301)
    {
        float _3429 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3361);
        _3359 = _3429;
    }
    float _3431 = _3359;
    float _3433 = _2265 * _3371;
    float _3435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3437 = abs(_1649);
    float _3439 = log2(_3437);
    float _3441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3443 = -_3433;
    float _3445 = fma(_2267, _3361, _3443);
    float _3447 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3449 = _3337 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3451 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3453 = _3399 * _2271;
    float _3455 = _3413 * _2271;
    float _3457 = _3445 * _2271;
    float _3459 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3461 = -_1211;
    float _3463 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3447);
    float _3465 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3467 = _3415 * _3435;
    float _3469 = _3449 * _3427;
    out.m_82.x = _1175;
    out.m_82.y = _1171;
    out.m_82.z = _1179;
    float _3471 = exp2(_3459);
    float _3473 = _3451 * _3441;
    float _3475 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3465);
    float _3477 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_84.x = _3469;
    out.m_84.y = _3467;
    out.m_84.z = _3473;
    out.m_84.w = _3417;
    float _3479 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3481 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3463);
    float _3483 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3485 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3479);
    float _3487 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3489 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3475);
    float _3491 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3493 = _3481 * _3383;
    float _3495 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3497 = -_1211;
    float _3499 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3477);
    float _3501 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3487);
    float _3503 = -_1211;
    float _3505 = fma(_3503, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3483);
    float _3507 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3491);
    float _3509 = fma(_3489, _3431, _3493);
    float _3511 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3495);
    float _3513 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3499);
    float _3515 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3517 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3505);
    float _3519 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3507);
    float _3521 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3511);
    float _3523 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3501);
    float _3525 = _3481 * _2267;
    float _3527 = fma(_3471, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3529 = precise::clamp(_3527, 0.0, 1.0);
    float _3531 = _3513 * _2267;
    float _3533 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3515);
    float _3535 = _3517 * _2267;
    float _3537 = _3453 * _3481;
    float _3539 = _3453 * _3513;
    float _3541 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3485);
    float _3543 = fma(_3489, _2265, _3525);
    float _3545 = _3529 * _3529;
    float _3547 = fma(_3519, _2265, _3531);
    float _3549 = fma(_3529, -2.0, 3.0);
    float _3551 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3533);
    float _3553 = fma(_3521, _2265, _3535);
    float _3555 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3557 = fma(_3455, _3489, _3537);
    float _3559 = _3517 * _3383;
    float _3561 = fma(_3455, _3519, _3539);
    float _3563 = fma(_3541, _2269, _3543);
    float _3565 = _3453 * _3517;
    float _3567 = fma(_3523, _2269, _3547);
    float _3569 = _3545 * _3549;
    float _3571 = fma(_3551, _2269, _3553);
    float _3573 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3555);
    float _3575 = _3513 * _3383;
    float _3577 = fma(_3457, _3541, _3557);
    float _3579 = fma(_3457, _3523, _3561);
    float _3581 = _2154 + _2116;
    float _3583 = fma(_3455, _3521, _3565);
    float _3585 = -_3569;
    float _3587 = _3585 + 1.0;
    float _3589 = -_2285;
    float _3591 = _2279 + _3589;
    float _3593 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    float _3595 = fma(_3519, _3431, _3575);
    out.m_86.x = _3563;
    out.m_86.y = _3567;
    out.m_86.z = _3571;
    float _3597 = _2116 * 0.5;
    float _3599 = fma(_3457, _3551, _3583);
    float _3601 = fma(_3587, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3569);
    float _3603 = -_2291;
    float _3605 = _2281 + _3603;
    float _3607 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3593);
    float _3609 = _3581 * 0.5;
    float _3611 = -_3591;
    float _3613 = _3611 + 1.0;
    float _3615 = fma(_2156, -0.5, _3597);
    out.m_88.x = _3577;
    out.m_88.y = _3579;
    out.m_88.z = _3599;
    float _3617 = _3607 + _2116;
    float _3619 = _3605 * _3613;
    out.gl_Position.x = _2154;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _3607;
    out.gl_Position.w = _2116;
    float _3621 = _3617 * 0.5;
    bool _3623 = _1649 <= 8000.0;
    bool _3625 = isnan(_1649);
    bool _3627 = _3623 || _3625;
    bool _3629 = isnan(8000.0);
    bool _3631 = _3627 || _3629;
    float _3633 = float(_3631);
    float _3635 = -_3605;
    float _3637 = _3635 + 1.0;
    float _3639 = _3637 * _3613;
    float _3641 = _3619 * _2349;
    float _3643 = _3619 * _2367;
    float _3645 = _3619 * _2381;
    float _3647 = _3619 * _2355;
    float _3649 = _3619 * _2387;
    float _3651 = _3619 * _2401;
    float _3653 = _3619 * _2375;
    float _3655 = _3619 * _2419;
    float _3657 = _3619 * _2407;
    out.m_90.x = _3609;
    out.m_90.y = _3615;
    out.m_90.z = _3621;
    out.m_90.w = _2116;
    float _3659 = _3591 * _3637;
    float _3661 = fma(_3639, _2433, _3651);
    float _3663 = _3633 * _3601;
    float _3665 = _3619 * _2491;
    float _3667 = fma(_3639, _2451, _3655);
    float _3669 = _3619 * _2511;
    float _3671 = _3619 * _2517;
    float _3673 = fma(_3639, _2439, _3657);
    float _3675 = _3619 * _2523;
    float _3677 = fma(_3639, _2571, _3647);
    float _3679 = _3605 * _3591;
    float _3681 = _3619 * _2467;
    float _3683 = _3619 * _2541;
    float _3685 = _3619 * _2461;
    float _3687 = _3619 * _2529;
    float _3689 = _3619 * _2479;
    float _3691 = _3619 * _2547;
    float _3693 = fma(_3659, _2591, _3661);
    float _3695 = _3619 * _2361;
    float _3697 = _3619 * _2553;
    float _3699 = _3619 * _2485;
    float _3701 = fma(_3639, _2623, _3665);
    float _3703 = fma(_3659, _2609, _3667);
    float _3705 = _3619 * _2393;
    float _3707 = _3619 * _2497;
    float _3709 = fma(_3639, _2645, _3669);
    float _3711 = fma(_3639, _2673, _3683);
    float _3713 = fma(_3659, _2597, _3673);
    float _3715 = _3619 * _2413;
    float _3717 = fma(_3659, _2705, _3677);
    float _3719 = _3619 * _2503;
    float _3721 = fma(_3639, _2679, _3691);
    float _3723 = fma(_3679, _2729, _3693);
    float _3725 = _3619 * _2473;
    float _3727 = fma(_3639, _2685, _3697);
    float _3729 = fma(_3639, _2617, _3699);
    float _3731 = fma(_3659, _2759, _3701);
    float _3733 = fma(_3679, _2747, _3703);
    float _3735 = _3619 * _2559;
    float _3737 = fma(_3639, _2629, _3707);
    float _3739 = fma(_3659, _2785, _3711);
    float _3741 = fma(_3679, _2735, _3713);
    float _3743 = fma(_3639, _2635, _3719);
    float _3745 = fma(_3659, _2791, _3721);
    float _3747 = _3723 * 0.886227548122406005859375;
    float _3749 = fma(_3659, _2797, _3727);
    float _3751 = fma(_3659, _2753, _3729);
    float _3753 = fma(_3679, _2817, _3731);
    float _3755 = _3733 * 0.511664927005767822265625;
    float _3757 = fma(_3639, _2691, _3735);
    float _3759 = fma(_3659, _2765, _3737);
    float _3761 = fma(_3679, _2841, _3739);
    float _3763 = _3741 * 0.886227548122406005859375;
    float _3765 = _3619 * _2873;
    float _3767 = fma(_3659, _2889, _3709);
    float _3769 = fma(_3659, _2771, _3743);
    float _3771 = fma(_3679, _2847, _3745);
    float _3773 = fma(_3679, _2853, _3749);
    float _3775 = precise::max(_3747, 0.00999999977648258209228515625);
    float _3777 = _3753 * 0.511664927005767822265625;
    float _3779 = _3755 * _3755;
    float _3781 = fma(_3659, _2803, _3757);
    float _3783 = fma(_3679, _2823, _3759);
    float _3785 = _3761 * 0.511664927005767822265625;
    float _3787 = precise::max(_3763, 0.00999999977648258209228515625);
    float _3789 = fma(_3639, _2917, _3765);
    float _3791 = fma(_3679, _2829, _3769);
    float _3793 = _3771 * 0.511664927005767822265625;
    float _3795 = 1.0 / _3775;
    float _3797 = _3773 * 0.511664927005767822265625;
    float _3799 = fma(_3777, _3777, _3779);
    float _3801 = fma(_3679, _2859, _3781);
    float _3803 = _3783 * 0.511664927005767822265625;
    float _3805 = fma(_3679, _2811, _3751);
    float _3807 = _3791 * 0.511664927005767822265625;
    float _3809 = 1.0 / _3787;
    float _3811 = _3785 * _3785;
    float _3813 = fma(_3797, _3797, _3799);
    float _3815 = _3801 * 0.511664927005767822265625;
    float _3817 = fma(_3803, _3803, _3811);
    float _3819 = _3793 * _3793;
    float _3821 = _3805 * 0.511664927005767822265625;
    float _3823 = fma(_3815, _3815, _3817);
    float _3825 = fma(_3807, _3807, _3819);
    float _3827 = sqrt(_3813);
    float _3829 = fma(_3821, _3821, _3825);
    float _3831 = sqrt(_3823);
    float _3833 = sqrt(_3829);
    float _3835 = precise::max(_3827, 0.00999999977648258209228515625);
    float _3837 = fma(_3639, _2445, _3715);
    float _3839 = fma(_3639, _2651, _3671);
    float _3841 = 1.0 / _3835;
    float _3843 = precise::max(_3831, 0.00999999977648258209228515625);
    float _3845 = fma(_3639, _2663, _3687);
    float _3847 = fma(_3659, _2603, _3837);
    float _3849 = precise::max(_3833, 0.00999999977648258209228515625);
    float _3851 = 1.0 / _3843;
    float _3853 = fma(_3679, _2741, _3847);
    float _3855 = 1.0 / _3849;
    float _3857 = _3853 * 0.886227548122406005859375;
    float _3859 = _3755 * _3841;
    float _3861 = fma(_3523, _3395, _3595);
    float _3863 = _3843 * _3809;
    float _3865 = precise::clamp(_3863, 0.0, 1.0);
    float _3867 = _3835 * _3795;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = _3777 * _3841;
    float _3873 = _3797 * _3841;
    float _3875 = precise::max(_3857, 0.00999999977648258209228515625);
    float _3877 = _3861 * _3859;
    float _3879 = _3785 * _3851;
    float _3881 = fma(_3521, _3431, _3559);
    float _3883 = fma(_3541, _3395, _3509);
    float _3885 = _3619 * _2867;
    float _3887 = _3619 * _2879;
    float _3889 = _3619 * _2885;
    float _3891 = _3793 * _3855;
    float _3893 = 1.0 / _3875;
    float _3895 = _3803 * _3851;
    float _3897 = fma(_3659, _2951, _3789);
    float _3899 = fma(_3883, _3871, _3877);
    float _3901 = fma(_3551, _3395, _3881);
    float _3903 = _3807 * _3855;
    float _3905 = _3861 * _3891;
    float _3907 = _3861 * _3879;
    float _3909 = fma(_3639, _2657, _3675);
    float _3911 = fma(_3679, _3173, _3897);
    float _3913 = _3815 * _3851;
    float _3915 = fma(_3883, _3895, _3907);
    float _3917 = fma(_3901, _3873, _3899);
    float _3919 = _3861 * 1.02332699298858642578125;
    float _3921 = _3821 * _3855;
    float _3923 = fma(_3883, _3903, _3905);
    float _3925 = fma(_3639, _2565, _3641);
    float _3927 = fma(_3639, _2981, _3681);
    float _3929 = fma(_3659, _2901, _3909);
    float _3931 = fma(_3679, _3199, _3717);
    float _3933 = fma(_3917, 0.5, 0.5);
    float _3935 = _3911 * _3919;
    float _3937 = fma(_3901, _3913, _3915);
    float _3939 = fma(_3901, _3921, _3923);
    float _3941 = fma(_3659, _2907, _3845);
    float _3943 = fma(_3639, _2975, _3685);
    float _3945 = fma(_3639, _2911, _3885);
    float _3947 = fma(_3659, _2699, _3925);
    float _3949 = fma(_3659, _3093, _3927);
    float _3951 = fma(_3679, _3229, _3929);
    float _3953 = _3931 * _3919;
    float _3955 = fma(_3937, 0.5, 0.5);
    float _3957 = fma(_3939, 0.5, 0.5);
    float _3959 = fma(_3639, _3115, _3653);
    float _3961 = fma(_3679, _3235, _3941);
    float _3963 = fma(_3639, _2577, _3695);
    float _3965 = fma(_3639, _2583, _3643);
    float _3967 = fma(_3639, _2987, _3725);
    float _3969 = fma(_3639, _2923, _3887);
    float _3971 = fma(_3659, _2895, _3839);
    float _3973 = fma(_3659, _3087, _3943);
    float _3975 = fma(_3659, _2945, _3945);
    float _3977 = fma(_3679, _3193, _3947);
    float _3979 = fma(_3679, _3245, _3949);
    float _3981 = fma(_3951, 0.88622701168060302734375, _3953);
    float _3983 = fma(_3659, _3145, _3959);
    float _3985 = abs(_3957);
    float _3987 = log2(_3985);
    float _3989 = _3961 * _3919;
    float _3991 = fma(_3639, _2993, _3689);
    float _3993 = fma(_3659, _2711, _3963);
    float _3995 = fma(_3659, _2717, _3965);
    float _3997 = fma(_3659, _3099, _3967);
    float _3999 = fma(_3659, _2957, _3969);
    float _4001 = fma(_3679, _3217, _3767);
    float _4003 = fma(_3679, _3223, _3971);
    float _4005 = fma(_3679, _3239, _3973);
    float _4007 = fma(_3679, _3167, _3975);
    float _4009 = abs(_3933);
    float _4011 = log2(_4009);
    float _4013 = _3977 * _3919;
    float _4015 = _3979 * _3919;
    float _4017 = fma(_3679, _3263, _3983);
    float _4019 = _3901 * 1.02332699298858642578125;
    float _4021 = abs(_3955);
    float _4023 = log2(_4021);
    float _4025 = fma(_3659, _3105, _3991);
    float _4027 = fma(_3679, _3205, _3993);
    float _4029 = fma(_3679, _3211, _3995);
    float _4031 = fma(_3679, _3251, _3997);
    float _4033 = fma(_3679, _3179, _3999);
    float _4035 = fma(_4001, 0.88622701168060302734375, _3989);
    float _4037 = fma(_4003, 0.88622701168060302734375, _4013);
    float _4039 = fma(_4005, 0.88622701168060302734375, _4015);
    float _4041 = fma(_4007, 0.88622701168060302734375, _3935);
    float _4043 = fma(_3639, _3121, _3645);
    float _4045 = _3849 * _3893;
    float _4047 = precise::clamp(_4045, 0.0, 1.0);
    float _4049 = fma(_3639, _3127, _3649);
    float _4051 = fma(_3639, _3133, _3705);
    float _4053 = fma(_3639, _2929, _3889);
    float _4055 = fma(_4017, _4019, _3981);
    float _4057 = fma(_3679, _3257, _4025);
    float _4059 = fma(_4027, _4019, _4035);
    float _4061 = fma(_4029, _4019, _4037);
    float _4063 = fma(_4031, _4019, _4039);
    float _4065 = _3883 * 1.02332699298858642578125;
    float _4067 = fma(_4033, _4019, _4041);
    float _4069 = fma(_3869, 2.0, 1.0);
    float _4071 = fma(_3865, 2.0, 1.0);
    float _4073 = fma(_3659, _3151, _4043);
    float _4075 = fma(_4047, 2.0, 1.0);
    float _4077 = fma(_3659, _3157, _4049);
    float _4079 = fma(_3659, _3163, _4051);
    float _4081 = fma(_3659, _2963, _4053);
    float _4083 = fma(_4057, _4065, _4063);
    float _4085 = fma(_3679, _3269, _4073);
    float _4087 = _4075 * _3987;
    float _4089 = fma(_3679, _3275, _4077);
    float _4091 = fma(_3679, _3281, _4079);
    float _4093 = fma(_3679, _3185, _4081);
    float _4095 = _4069 * _4011;
    float _4097 = _4083 * 0.31830990314483642578125;
    float _4099 = precise::clamp(_4097, 0.0, 1.0);
    float _4101 = _4071 * _4023;
    float _4103 = _3869 + 1.0;
    float _4105 = _3865 + 1.0;
    float _4107 = fma(_4085, _4065, _4059);
    float _4109 = fma(_4089, _4065, _4061);
    float _4111 = fma(_4091, _4065, _4055);
    float _4113 = fma(_4093, _4065, _4067);
    float _4115 = _4047 + 1.0;
    float _4117 = exp2(_4095);
    float _4119 = _4099 * 0.88622701168060302734375;
    float _4121 = precise::max(0.0, _4107);
    out.m_92.w = _1107;
    float _4123 = precise::max(0.0, _4109);
    float _4125 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_94.x = _1195;
    float _4127 = exp2(_4101);
    float _4129 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _4131 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _4133 = in.m_96.x;
    float _4135 = exp2(_4087);
    float _4137 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[17].x, _4129);
    float _4139 = fma(_4123, (*spvDescriptorSet0.vp_c15)._m0[17].y, _4131);
    float _4141 = 1.0 / _4103;
    float _4143 = -_3869;
    float _4145 = _4143 + 1.0;
    float _4147 = -_3865;
    float _4149 = _4147 + 1.0;
    float _4151 = 1.0 / _4105;
    float _4153 = _4113 * 0.31830990314483642578125;
    float _4155 = precise::clamp(_4153, 0.0, 1.0);
    float _4157 = 1.0 / _4115;
    float _4159 = fma(_3869, 2.0, 2.0);
    float _4161 = fma(_3865, 2.0, 2.0);
    float _4163 = fma(_4047, 2.0, 2.0);
    float _4165 = -_4047;
    float _4167 = _4165 + 1.0;
    float _4169 = _4159 * _4117;
    float _4171 = _4161 * _4127;
    float _4173 = _4163 * _4135;
    out.m_98.x = _3883;
    out.m_98.y = _3861;
    out.m_98.z = _3901;
    float _4175 = -_4155;
    float _4177 = _4175 + 1.0;
    out.m_100.x = _1639;
    out.m_100.y = _1637;
    out.m_100.z = _1641;
    float _4179 = fma(_4177, (*spvDescriptorSet0.vp_c15)._m0[659].w, _4155);
    out.m_102.x = 0.0;
    float _4181 = _4145 * _4141;
    float _4183 = _4149 * _4151;
    float _4185 = _4167 * _4157;
    float _4187 = -_4169;
    float _4189 = _4187 + 1.0;
    float _4191 = -_4171;
    float _4193 = _4191 + 1.0;
    float _4195 = -_4173;
    float _4197 = _4195 + 1.0;
    bool _4199 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4201 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _4203 = precise::max(0.0, _4111);
    float _4205 = fma(_4181, _4189, _4169);
    float _4207 = fma(_4183, _4193, _4171);
    float _4209 = fma(_4185, _4197, _4173);
    float _4211 = exp2(_4125);
    float _4213 = fma(_4203, (*spvDescriptorSet0.vp_c15)._m0[17].z, _4201);
    float _4215 = _3747 * _4205;
    float _4217 = _3763 * _4207;
    float _4219 = _4179 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _4221 = _3857 * _4209;
    float _4223 = fma(_4215, _4219, _4137);
    float _4225 = fma(_4217, _4219, _4139);
    float _4227 = fma(_4221, _4219, _4213);
    float _4229 = _1709 * _1763;
    float _4231 = _4223 * 0.31830990314483642578125;
    float _4233 = _4225 * 0.31830990314483642578125;
    float _4235 = _4227 * 0.31830990314483642578125;
    bool _4237 = !_4199;
    if (!_4237)
    {
        float _4239 = -_1637;
        float _4241 = _4239 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4243 = -_1639;
        float _4245 = _4243 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4247 = -_1641;
        float _4249 = _4247 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4251 = _4241 * _4241;
        float _4253 = fma(_4245, _4245, _4251);
        float _4255 = fma(_4249, _4249, _4253);
        float _4257 = sqrt(_4255);
        float _4259 = rsqrt(_4255);
        float _4261 = -_4257;
        float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4265 = _4263 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4267 = precise::clamp(_4265, 0.0, 1.0);
        float _4269 = _4245 * _4259;
        float _4271 = _4241 * _4259;
        float _4273 = abs(_4267);
        float _4275 = log2(_4273);
        float _4277 = _4249 * _4259;
        float _4279 = _4269 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4281 = _3861 * _4271;
        float _4283 = -_4271;
        float _4285 = -_4279;
        float _4287 = fma(_4283, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4285);
        float _4289 = fma(_3883, _4269, _4281);
        float _4291 = -_4277;
        float _4293 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4287);
        float _4295 = fma(_3901, _4277, _4289);
        float _4297 = precise::clamp(_4295, 0.0, 1.0);
        float _4299 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4301 = _4293 + _4299;
        float _4303 = _4275 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4305 = _4301 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4307 = precise::clamp(_4305, 0.0, 1.0);
        float _4309 = exp2(_4303);
        float _4311 = _4309 * _4307;
        float _4313 = _4297 * _4311;
        float _4315 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4317 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4319 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _4315;
        out.m_102.y = _4317;
        out.m_102.z = _4319;
    }
    float _4321 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4323 = -_4211;
    float _4325 = _4323 + 1.0;
    float _4327 = -_2182;
    float _4329 = _4327 + 1.0;
    float _4331 = _4229 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4333 = _4325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4335 = _4329 * _4321;
    float _4337 = precise::clamp(_4335, 0.0, 1.0);
    bool _4339 = _1709 > 0.0;
    bool _4341 = isnan(_1709);
    bool _4343 = _4339 || _4341;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    float _4349 = _4331 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4351 = _4333 * _2184;
    float _4353 = -_4337;
    float _4355 = fma(_4353, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _4357 = _1763 <= 0.0;
    bool _4359 = !_4347;
    bool _4361 = _4357 || _4359;
    float _4363 = -_4333;
    float _4365 = _4363 + 1.0;
    float _4367 = _2195 * _4351;
    float _4369 = _4355 * _4133;
    float _4371 = _2209 * _4351;
    out.m_56.x = _4349;
    float _4373 = fma(_2205, _4367, _2189);
    float _4375 = fma(_2207, _4367, _2191);
    float _4377 = _4369 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4379 = _2195 * _4365;
    float _4381 = fma(_2195, _4371, _2193);
    out.m_92.x = _4231;
    out.m_92.y = _4233;
    out.m_92.z = _4235;
    out.m_104.x = _4377;
    out.m_106.x = _4373;
    out.m_106.y = _4375;
    out.m_106.z = _4381;
    out.m_106.w = _4379;
    if (!_4361)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _4383 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4383;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _799 = false;
    bool _577 = false;
    bool _473 = false;
    bool _359 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_53.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_56.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4440 = as_type<float>(_141);
        out.gl_Position.z = _4440;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_58.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = _159;
    if (_155)
    {
        float _163 = float(_125);
        _135 = _163;
    }
    float _165 = _135;
    bool _167 = _159 >= _165;
    bool _169 = !_155;
    bool _171 = _167 || _169;
    float _173 = _165;
    if (_171)
    {
        _173 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _173;
    if (_171)
    {
        out.m_56.x = 0.0;
    }
    if (_171)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4510 = as_type<float>(_179);
        out.gl_Position.z = _4510;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _197 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _199 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    float _201 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _203 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _205 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _207 = !_187;
    float _209 = _201;
    float _211 = _203;
    float _213 = _205;
    float _231;
    if (!_207)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_125);
        float _237 = 1.0 / _235;
        float _239 = _159 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = in.m_64.x;
    float _249 = in.m_64.y;
    float _251 = in.m_64.z;
    bool _253 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_241);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_241);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _245 * _289;
    float _301 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _307;
    float _311 = fma(_305, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = fma(_309, _299, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _315 = _301 * _293;
    float _317 = _311 * _293;
    float _319 = _313 * _293;
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _315);
    float _323 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _317);
    float _325 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].z, _319);
    float _327 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _329 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    float _331 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].z, _325);
    float _333 = _327 * _247;
    float _335 = _329 * _249;
    float _337 = _331 * _251;
    bool _339 = !_291;
    float _357;
    if (!_339)
    {
        float _341 = in.m_62.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _371 = _367 + _369;
    bool _373 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _375 = isnan(_367);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _385;
    bool _389 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _391 = isnan(_367);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_383;
    float _403 = _401 + 1.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _405;
    float _409 = 1.0 / _387;
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _413 = _399 * _403;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = _371 * _409;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _421;
    float _425 = fma(_407, _419, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _427;
    float _431 = fma(_423, _419, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _433 = fma(_429, _419, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _435 = _425 * _413;
    float _437 = _431 * _413;
    float _439 = _433 * _413;
    float _441 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].x, _435);
    float _443 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _445 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[107].z, _437);
    float _447 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].x, _441);
    float _449 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].y, _443);
    float _451 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[108].z, _445);
    bool _453 = !_411;
    float _471;
    if (!_453)
    {
        float _455 = in.m_62.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        float _475 = float(_125);
        float _477 = 1.0 / _475;
        float _479 = _159 * _477;
        _471 = _479;
    }
    _473 = false;
    float _481 = _471;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _481 + _483;
    bool _487 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = isnan(_481);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _503 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_481);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _515;
    float _519 = _447 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _521 = -_497;
    float _523 = _521 + 1.0;
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _527 = 1.0 / _501;
    float _529 = _513 * _523;
    float _531 = -_513;
    float _533 = _531 + 1.0;
    float _535 = _517 * _527;
    float _537 = _451 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = fma(_535, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _543 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = _541 * _529;
    float _547 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[115].x, _545);
    float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _553 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[116].x, _549);
    float _555 = _553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _539;
    out.m_66.y = _551;
    out.m_66.z = _543;
    out.m_66.w = _555;
    bool _557 = !_525;
    float _575;
    if (!_557)
    {
        float _559 = in.m_62.x;
        float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _563 = _559 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _565 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[11].z, _159);
        float _567 = _565 * _561;
        float _569 = floor(_567);
        float _571 = -_569;
        float _573 = _567 + _571;
        _575 = _573;
        _577 = true;
    }
    else
    {
        float _579 = float(_125);
        float _581 = 1.0 / _579;
        float _583 = _159 * _581;
        _575 = _583;
    }
    _577 = false;
    float _585 = _575;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _589 = _585 + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _593 = _585 + _591;
    bool _595 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _597 = isnan(_585);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _613 = _585 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _623 = 1.0 / _609;
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _627 = 1.0 / _621;
    float _629 = 1.0 / _617;
    float _631 = _589 * _623;
    bool _633 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _635 = isnan(_585);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -_605;
    float _647 = _645 + 1.0;
    float _649 = _643 * _647;
    float _651 = _593 * _627;
    bool _653 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _655 = isnan(_585);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _665;
    bool _669 = _585 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _671 = isnan(_585);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = _613 * _629;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _699;
    float _703 = _679 * _691;
    float _705 = fma(_667, _693, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _707 = fma(_697, _693, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _709 = fma(_701, _693, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _711 = _663 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _717 = _707 * _703;
    float _719 = _709 * _703;
    float _721 = -_679;
    float _723 = _721 + 1.0;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _729 = _705 * _703;
    float _731 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].x, _719);
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].y, _717);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _735;
    float _739 = fma(_683, _651, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _741 = fma(_715, _651, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _743 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[123].z, _729);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _745;
    float _749 = fma(_727, _651, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _751;
    float _755 = fma(_739, _711, _731);
    float _757 = fma(_737, _631, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _759 = fma(_747, _631, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _761 = fma(_741, _711, _733);
    float _763 = fma(_753, _631, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _765 = fma(_749, _711, _743);
    float _767 = fma(_757, _649, _755);
    float _769 = fma(_759, _649, _761);
    float _771 = fma(_763, _649, _765);
    float _773 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].x, _767);
    float _775 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].y, _769);
    float _777 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[126].z, _771);
    bool _779 = !_625;
    float _797;
    if (!_779)
    {
        float _781 = in.m_62.x;
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _785 = _781 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _789 = _787 * _783;
        float _791 = floor(_789);
        float _793 = -_791;
        float _795 = _789 + _793;
        _797 = _795;
        _799 = true;
    }
    else
    {
        float _801 = float(_125);
        float _803 = 1.0 / _801;
        float _805 = _159 * _803;
        _797 = _805;
    }
    _799 = false;
    float _807 = _797;
    float _809 = in.m_62.x;
    float _811 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _813 = log2(_811);
    float _815 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _817 = in.m_62.z;
    float _819 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _823 = 1.0 + _821;
    float _825 = in.m_62.y;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _837 = _835 != 0;
    float _839 = _815 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _841 = 1.0 / _823;
    float _843 = in.m_53.x;
    float _845 = in.m_53.y;
    float _847 = in.m_53.z;
    bool _849 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _851 = isnan(1.0);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _857 = _853 || _855;
    float _859 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _861 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _869 = _865 || _867;
    float _871 = in.m_68.x;
    float _873 = in.m_68.y;
    float _875 = in.m_68.z;
    float _877 = _813 * _159;
    float _879 = exp2(_877);
    float _881 = _809 * 2.0;
    float _883 = _817 * 2.0;
    float _885 = floor(_881);
    float _887 = _825 * 2.0;
    float _889 = _825 + _817;
    float _891 = _845 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _893 = floor(_883);
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _845 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _901 = _845 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _903 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[5].x, _891);
    float _905 = _889 + (-1.0);
    float _907 = _869 ? _897 : 0.0;
    float _909 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[6].x, _899);
    float _911 = floor(_887);
    bool _913 = _885 > 0.0;
    float _915 = _809 + _817;
    if (_857)
    {
        float _917 = _907 * _841;
        _161 = _917;
    }
    float _919 = _161;
    bool _921 = _885 >= 0.0;
    bool _923 = isnan(_885);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[4].x, _901);
    float _933 = _915 + (-1.0);
    float _935 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    bool _937 = _893 >= 0.0;
    bool _939 = isnan(_893);
    bool _941 = _937 || _939;
    bool _943 = isnan(0.0);
    bool _945 = _941 || _943;
    float _947 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _949 = _893 > 0.0;
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _953 = _929 ? 0 : 1;
    float _955 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[4].z, _931);
    int _957 = _945 ? 0 : 1;
    float _959 = fma(_847, (*spvDescriptorSet0.vp_c10)._m0[6].z, _909);
    bool _961 = _911 > 0.0;
    bool _963 = _911 >= 0.0;
    bool _965 = isnan(_911);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    float _973 = _959 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _975 = ~_953;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    bool _981 = !_829;
    int _983 = _981 ? 0 : 1;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _973 + _985;
    int _989 = _979;
    bool _991 = _961;
    if (!_913)
    {
        int _993 = ~_953;
        int _995 = _993 + 1;
        _989 = _995;
    }
    int _997 = _989;
    float _999 = _935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1001 = !_833;
    int _1003 = _1001 ? 0 : 1;
    int _1005 = abs(_983);
    float _1007 = _955 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1011 = _999 + _1009;
    int _1013 = ~_957;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    int _1019 = _1017;
    if (!_949)
    {
        int _1021 = ~_957;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1029 = _1007 + _1027;
    int _1031 = abs(_1003);
    float _1033 = _1011 * _1011;
    float _1035 = in.m_70.x;
    float _1037 = in.m_70.y;
    float _1039 = in.m_70.z;
    float _1041 = float(_997);
    float _1043 = fma(_1029, _1029, _1033);
    float _1045 = float(_1031);
    int _1047 = _971 ? 0 : 1;
    float _1049 = fma(_987, _987, _1043);
    float _1051 = _1045 * _1041;
    int _1053 = ~_1047;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    float _1059 = sqrt(_1049);
    int _1061 = _1057;
    if (!_961)
    {
        int _1063 = ~_1047;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    float _1069 = _1051 * (-2.0);
    float _1071 = _825 + (-0.5);
    float _1073 = float(_1005);
    float _1075 = float(_1025);
    float _1077 = fma(_947, _1069, _947);
    float _1079 = rsqrt(_1049);
    bool _1081 = !_837;
    int _1083 = _1081 ? 0 : 1;
    float _1085 = _1073 * _1075;
    float _1087 = fma(_1069, _1037, _1037);
    int _1089 = abs(_1083);
    float _1091 = float(_1067);
    float _1093 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1087);
    float _1095 = _809 + _825;
    float _1097 = _1059 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1099 = float(_1089);
    float _1101 = fma(_1077, _919, _1093);
    float _1103 = _1095 + (-1.0);
    float _1105 = _1085 * (-2.0);
    float _1107 = precise::min(_839, _1097);
    float _1109 = _1099 * _1091;
    float _1111 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1113 = _809 + (-0.5);
    float _1115 = fma(_1105, _1035, _1035);
    float _1117 = _1079 * _1107;
    float _1119 = fma(_1111, _1105, _1111);
    float _1121 = _1109 * (-2.0);
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1115);
    float _1125 = _1011 * _1117;
    float _1127 = _1029 * _1117;
    float _1129 = _987 * _1117;
    float _1131 = fma(_1119, _919, _1123);
    float _1133 = -_1125;
    float _1135 = _1011 + _1133;
    float _1137 = -_1127;
    float _1139 = _1029 + _1137;
    float _1141 = fma(_1121, _1039, _1039);
    float _1143 = _1131 * 0.15915493667125701904296875;
    float _1145 = _1135 * _1135;
    float _1147 = _817 + (-0.5);
    float _1149 = -_1129;
    float _1151 = _987 + _1149;
    float _1153 = fma(_951, _1121, _951);
    float _1155 = fma(_1139, _1139, _1145);
    float _1157 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1141);
    float _1159 = _1101 * 0.15915493667125701904296875;
    float _1161 = _1143 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = fma(_1151, _1151, _1155);
    float _1167 = fma(_1153, _919, _1157);
    float _1169 = -_1125;
    float _1171 = _999 + _1169;
    float _1173 = -_1127;
    float _1175 = _1007 + _1173;
    float _1177 = -_1129;
    float _1179 = _973 + _1177;
    float _1181 = _1167 * 0.15915493667125701904296875;
    float _1183 = sqrt(_1165);
    float _1185 = _1159 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = _1159 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = _1079 * _1183;
    float _1195 = _815 * _1193;
    float _1197 = _1181 * 6.283185482025146484375;
    float _1199 = cos(_1197);
    float _1201 = _1163 * _1187;
    float _1203 = _1143 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = _1163 * _1191;
    float _1209 = _1181 * 6.283185482025146484375;
    float _1211 = sin(_1209);
    float _1213 = _1191 * _1199;
    float _1215 = _1163 * _1199;
    float _1217 = _1205 * _1191;
    float _1219 = _1205 * _1187;
    float _1221 = _1205 * _1199;
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _873);
    float _1225 = _819 * _1193;
    float _1227 = _859 * _1193;
    float _1229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _871);
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _875);
    float _1233 = _1225 * _1223;
    float _1235 = fma(_1211, _1207, _1219);
    float _1237 = _1195 * _1229;
    float _1239 = _1187 * _1199;
    float _1241 = _1215 * _1233;
    float _1243 = _1227 * _1231;
    float _1245 = -_1217;
    float _1247 = fma(_1211, _1201, _1245);
    float _1249 = -_1233;
    float _1251 = _1211 * _1249;
    float _1253 = fma(_1235, _1237, _1241);
    float _1255 = -_1201;
    float _1257 = fma(_1211, _1217, _1255);
    float _1259 = _1221 * _1233;
    float _1261 = fma(_1213, _1237, _1251);
    float _1263 = fma(_1247, _1243, _1253);
    float _1265 = fma(_1211, _1219, _1207);
    float _1267 = fma(_1257, _1237, _1259);
    float _1269 = fma(_1239, _1243, _1261);
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1275 = fma(_1265, _1243, _1267);
    float _1277 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1271);
    float _1279 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1273);
    float _1281 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1277);
    float _1283 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1279);
    float _1285 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1287 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1289 = _973 + _1285;
    float _1291 = _1007 + _1287;
    float _1293 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1297 = _1289 + _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1301 = _1291 + _1299;
    float _1303 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1293);
    float _1305 = _1297 * _1297;
    float _1307 = fma(_1301, _1301, _1305);
    float _1309 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1311 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1303);
    float _1313 = sqrt(_1307);
    float _1315 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1309);
    float _1317 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1315);
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1321 = _999 + _1319;
    bool _1323 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1325 = _1319;
    float _1327 = _1309;
    float _1329 = _1303;
    if (!_1323)
    {
        _1325 = _1291;
    }
    float _1331 = _1325;
    float _1333 = _1331;
    if (!_1323)
    {
        _1327 = _1289;
    }
    float _1335 = _1327;
    float _1337 = _1335;
    if (!_1323)
    {
        _1329 = _1321;
    }
    float _1339 = _1329;
    bool _1341 = !_1323;
    float _1343 = _1339;
    if (!_1341)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1349 = _1313 + _1347;
        float _1351 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = rsqrt(_1307);
        float _1355 = _1349 * _1345;
        float _1357 = _1355 * 0.15915493667125701904296875;
        float _1359 = _1357 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1357 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 + (-1.0);
        float _1369 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = fma(_1321, _1361, _1369);
        float _1375 = _1353 * _1371;
        float _1377 = fma(_1301, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1379 = fma(_1297, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1373;
        _1333 = _1377;
        _1337 = _1379;
    }
    float _1381 = _1343;
    float _1383 = _1333;
    float _1385 = _1337;
    float _1387 = -_999;
    float _1389 = _1387 + _1381;
    float _1391 = -_1007;
    float _1393 = _1391 + _1383;
    float _1395 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1397 = _1389 * _1389;
    float _1399 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1401 = -_973;
    float _1403 = _1401 + _1385;
    float _1405 = 1.0 / _1395;
    float _1407 = fma(_1393, _1393, _1397);
    float _1409 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1399);
    float _1411 = fma(_1175, 0.008000000379979610443115234375, 64.0);
    float _1413 = -_1125;
    float _1415 = _1413 + _1381;
    float _1417 = fma(_1403, _1403, _1407);
    float _1419 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1421 = -_1129;
    float _1423 = _1421 + _1385;
    float _1425 = precise::max(0.0, _1411);
    float _1427 = sqrt(_1417);
    float _1429 = fma(_1179, 0.008000000379979610443115234375, 64.0);
    float _1431 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1433 = precise::min(_1425, 127.0);
    float _1435 = -_1127;
    float _1437 = _1435 + _1383;
    float _1439 = precise::max(0.0, _1429);
    float _1441 = _1431 + _1395;
    float _1443 = trunc(_1433);
    int _1445 = int(_1443);
    float _1447 = precise::min(_1439, 127.0);
    float _1449 = _1441 * _1405;
    float _1451 = _1449 * 0.5;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1461 = _1457 || _1459;
    bool _1463 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1465 = isnan(0.5);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1475 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1473);
    bool _1477 = _1427 > 0.0;
    float _1479 = trunc(_1447);
    int _1481 = int(_1479);
    float _1483 = 1.0 / _1475;
    float _1485 = _1383;
    float _1487 = _1385;
    float _1489 = _1381;
    if (!_1477)
    {
        _1485 = _1437;
    }
    float _1491 = _1485;
    float _1493 = _1491;
    float _1495 = _1491;
    if (!_1477)
    {
        _1487 = _1415;
    }
    float _1497 = _1487;
    int _1499 = _1481 << 7;
    int _1501 = _1499 + _1445;
    float _1503 = _1497;
    if (!_1477)
    {
        _1489 = _1423;
    }
    float _1505 = _1489;
    bool _1507 = !_1477;
    float _1509 = _1505;
    if (!_1507)
    {
        float _1511 = _203 * _203;
        float _1513 = rsqrt(_1417);
        float _1515 = fma(_201, _201, _1511);
        float _1517 = fma(_205, _205, _1515);
        float _1519 = sqrt(_1517);
        float _1521 = _1393 * _1513;
        float _1523 = _1389 * _1513;
        float _1525 = _1403 * _1513;
        bool _1527 = _1519 > 0.0;
        float _1529 = _1513;
        float _1531 = _1519;
        if (!_1527)
        {
            _1493 = _1437;
        }
        float _1533 = _1493;
        _1495 = _1533;
        if (!_1527)
        {
            _1529 = _1415;
        }
        float _1535 = _1529;
        _1503 = _1535;
        if (!_1527)
        {
            _1531 = _1423;
        }
        float _1537 = _1531;
        bool _1539 = !_1527;
        _1509 = _1537;
        if (!_1539)
        {
            float _1541 = rsqrt(_1517);
            float _1543 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1545 = _203 * _1541;
            float _1547 = _201 * _1541;
            float _1549 = _205 * _1541;
            float _1551 = _1523 * _1545;
            float _1553 = fma(_1521, _1547, _1551);
            float _1555 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1557 = fma(_1525, _1549, _1553);
            float _1559 = _1557 * _1555;
            float _1561 = fma(_201, _1559, _1437);
            float _1563 = fma(_203, _1559, _1415);
            float _1565 = fma(_205, _1559, _1423);
            _1495 = _1561;
            _1503 = _1563;
            _1509 = _1565;
        }
    }
    float _1567 = _1495;
    float _1569 = _1503;
    float _1571 = _1509;
    int _1573 = _1501 << 4;
    if (_1461)
    {
        _209 = _1567;
    }
    float _1575 = _209;
    float _1577 = _1575;
    if (_1461)
    {
        _211 = _1569;
    }
    float _1579 = _211;
    float _1581 = _1579;
    if (_1461)
    {
        _213 = _1571;
    }
    float _1583 = _213;
    float _1585 = _1583;
    if (!_1461)
    {
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1589 = _1171 + _1587;
        float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1593 = _1175 + _1591;
        float _1595 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = -_1175;
        float _1599 = _1597 + _1567;
        float _1601 = _1589 * _1589;
        float _1603 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1605 = _1179 + _1603;
        float _1607 = -_1171;
        float _1609 = _1607 + _1569;
        float _1611 = -_1179;
        float _1613 = _1611 + _1571;
        float _1615 = fma(_1593, _1593, _1601);
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1619 = fma(_1605, _1605, _1615);
        float _1621 = sqrt(_1619);
        float _1623 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1625 = precise::min(_1621, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1627 = _1625 * _1617;
        float _1629 = _1623 * _1627;
        float _1631 = fma(_1599, _1629, _1175);
        float _1633 = fma(_1609, _1629, _1171);
        float _1635 = fma(_1613, _1629, _1179);
        _1581 = _1633;
        _1577 = _1631;
        _1585 = _1635;
    }
    float _1637 = _1581;
    float _1639 = _1577;
    float _1641 = _1585;
    float _1643 = 0.0;
    if (_1471)
    {
        _1643 = 1.0;
    }
    float _1645 = _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1649 = _1483 * _1647;
    float _1651 = 0.0;
    float _1653 = _1645;
    if (_1471)
    {
        _1651 = 1.0;
    }
    float _1655 = _1651;
    int _1657 = _1573 + 8;
    float _1659 = _1655;
    if (!_1471)
    {
        float _1661 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1663 = _1661 * 0.15915493667125701904296875;
        float _1665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1667;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1665 * 0.15915493667125701904296875;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = 1.0 / _1673;
        float _1683 = _1675 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = _1679 * _1681;
        float _1689 = _1675 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = 1.0 / _1669;
        float _1697 = 1.0 / _1693;
        float _1699 = _1691 * _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1703 = fma(_1649, _1699, _1701);
        float _1705 = _1703 * _1695;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        _1653 = _1707;
    }
    float _1709 = _1653;
    if (!_1471)
    {
        float _1711 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1713 = _1711 * 0.15915493667125701904296875;
        float _1715 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1717 = _1713 * 6.283185482025146484375;
        float _1719 = cos(_1717);
        float _1721 = _1715 * 0.15915493667125701904296875;
        float _1723 = _1713 * 6.283185482025146484375;
        float _1725 = sin(_1723);
        float _1727 = 1.0 / _1719;
        float _1729 = _1721 * 6.283185482025146484375;
        float _1731 = cos(_1729);
        float _1733 = _1725 * _1727;
        float _1735 = _1721 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        float _1739 = _1731 * _1733;
        float _1741 = 1.0 / _1739;
        float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1745 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1743;
        float _1747 = 1.0 / _1745;
        float _1749 = _1737 * _1741;
        float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1753 = fma(_1649, _1749, _1751);
        float _1755 = _1753 * _1747;
        float _1757 = precise::clamp(_1755, 0.0, 1.0);
        float _1759 = -_1757;
        float _1761 = _1759 + 1.0;
        _1659 = _1761;
    }
    float _1763 = _1659;
    uint _1766 = uint(int(uint(_1657) >> uint(2)));
    float _1768 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1766)]);
    float _1770 = floor(_1433);
    int _1772 = _1573 + 12;
    uint _1774 = uint(int(uint(_1573) >> uint(2)));
    float _1776 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1774)]);
    uint _1778 = uint(int(uint(_1772) >> uint(2)));
    float _1780 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1778)]);
    float _1782 = -_1770;
    float _1784 = _1433 + _1782;
    float _1786 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1788 = _1768 + _1784;
    float _1790 = trunc(_1788);
    int _1792 = int(_1790);
    int _1794 = _1445 + _1792;
    int _1796 = _1481 << 7;
    int _1798 = _1796 + _1794;
    int _1800 = _1798 << 4;
    float _1802 = floor(_1447);
    int _1804 = _1800 + 12;
    uint _1806 = uint(int(uint(_1800) >> uint(2)));
    float _1808 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1806)]);
    uint _1810 = uint(int(uint(_1804) >> uint(2)));
    float _1812 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1810)]);
    float _1814 = -_1802;
    float _1816 = _1447 + _1814;
    float _1818 = _1768 + _1816;
    float _1820 = trunc(_1818);
    int _1822 = int(_1820);
    int _1824 = _1481 + _1822;
    int _1826 = _1824 << 7;
    int _1828 = _1826 + _1445;
    int _1830 = _1824 << 7;
    int _1832 = _1830 + _1794;
    int _1834 = _1828 << 4;
    int _1836 = _1832 << 4;
    int _1838 = _1834 + 12;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1637 + _1840;
    int _1844 = _1836 + 12;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1639 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1852 = _1641 + _1850;
    uint _1854 = uint(int(uint(_1838) >> uint(2)));
    float _1856 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1854)]);
    uint _1858 = uint(int(uint(_1844) >> uint(2)));
    float _1860 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1858)]);
    float _1862 = _1842 * _1842;
    uint _1864 = uint(int(uint(_1834) >> uint(2)));
    float _1866 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1864)]);
    float _1868 = fma(_1848, _1848, _1862);
    uint _1870 = uint(int(uint(_1836) >> uint(2)));
    float _1872 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1870)]);
    float _1874 = fma(_1852, _1852, _1868);
    float _1876 = rsqrt(_1874);
    float _1878 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1880 = _1848 * _1878;
    float _1882 = _1852 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 + _1886;
    float _1890 = sqrt(_1888);
    bool _1892 = _1890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = _1890 + _1894;
    float _1898 = _1852;
    float _1900 = _1896;
    float _1902 = as_type<float>(_1838);
    float _1904 = _1878;
    float _1906 = as_type<float>(_1834);
    if (_1892)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1898 = _1908;
    }
    float _1910 = _1898;
    if (_1892)
    {
        float _1912 = _1896 * _1910;
        _1900 = _1912;
    }
    float _1914 = _1900;
    if (_1892)
    {
        float _1916 = _1914 * 0.15915493667125701904296875;
        _1902 = _1916;
    }
    float _1918 = _1902;
    float _1920 = _1876;
    if (_1892)
    {
        float _1922 = _1918 * 6.283185482025146484375;
        float _1924 = cos(_1922);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = _1910;
    if (_1892)
    {
        float _1932 = _1918 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = precise::max(0.0, _1928);
    float _1940 = _1888;
    float _1942 = _1938;
    if (_1892)
    {
        float _1944 = rsqrt(_1888);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = -_1878;
    float _1950 = -_1938;
    float _1952 = fma(_1842, _1948, _1950);
    float _1954 = _1952;
    float _1956 = _1926;
    if (_1892)
    {
        float _1958 = _1926 + (-1.0);
        _1904 = _1958;
    }
    float _1960 = _1904;
    float _1962 = _1960;
    if (_1892)
    {
        float _1964 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _1964;
    }
    float _1966 = _1942;
    float _1968 = _1966;
    if (_1892)
    {
        float _1970 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1962 = _1970;
    }
    float _1972 = _1962;
    float _1974 = _1936;
    if (_1892)
    {
        float _1976 = fma(_1936, _1966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1974 = _1976;
    }
    float _1978 = _1974;
    float _1980 = sqrt(_1874);
    float _1982 = _1978;
    if (_1892)
    {
        float _1984 = fma(_1952, _1926, _1972);
        _1954 = _1984;
    }
    float _1986 = _1954;
    float _1988 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1892)
    {
        float _1990 = _1946 * _1978;
        _1906 = _1990;
    }
    float _1992 = _1906;
    if (!_1892)
    {
        _1982 = _1880;
    }
    float _1994 = _1982;
    float _1996 = _1994;
    if (_1892)
    {
        float _1998 = _1880 * _1992;
        _1996 = _1998;
    }
    float _2000 = _1996;
    if (!_1892)
    {
        _1968 = _1882;
    }
    float _2002 = _1968;
    float _2004 = _2002;
    if (_1892)
    {
        float _2006 = _1882 * _1992;
        _2004 = _2006;
    }
    float _2008 = _2004;
    if (!_1892)
    {
        _1956 = _1884;
    }
    float _2010 = _1956;
    float _2012 = _2010;
    if (_1892)
    {
        float _2014 = _2000 * _2000;
        _2012 = _2014;
    }
    float _2016 = _2012;
    float _2018 = fma(_1175, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1892)
    {
        _1988 = _1886;
    }
    float _2020 = _1988;
    float _2022 = _2020;
    if (_1892)
    {
        float _2024 = _2008 * _2008;
        _2022 = _2024;
    }
    float _2026 = _2022;
    float _2028 = fma(_1986, _1986, _2016);
    float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2032 = fma(_1980, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2030);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = _2028 + _2026;
    float _2038 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2040 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2038);
    float _2044 = rsqrt(_2036);
    float _2046 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2048 = -_2034;
    float _2050 = _2048 + 1.0;
    float _2052 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2042);
    float _2054 = fma(_1179, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2056 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2058 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2046);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2062 = abs(_2050);
    float _2064 = log2(_2062);
    float _2066 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2056);
    float _2068 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2072 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1786);
    float _2074 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2066);
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2070);
    float _2078 = floor(_2018);
    float _2080 = _2044 * _2000;
    float _2082 = _2074 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2084 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2072);
    float _2086 = _2044 * _1986;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2096 = _2044 * _2008;
    float _2098 = -_2088;
    float _2100 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2098);
    float _2102 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2104 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2076);
    float _2106 = -_2092;
    float _2108 = fma(_2106, _2090, 1.0);
    float _2110 = -_2096;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2100);
    float _2114 = exp2(_2102);
    float _2116 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2104);
    float _2118 = -_2078;
    float _2120 = _2018 + _2118;
    float _2122 = fma(_2112, -0.5, 0.5);
    float _2124 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = log2(_2108);
    float _2130 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2132 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2134 = 1.0 / _2116;
    float _2136 = fma(_2112, 0.5, 0.5);
    float _2138 = _2086 + 1.0;
    float _2140 = floor(_2054);
    float _2142 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2130);
    float _2144 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2132);
    float _2146 = sqrt(_2122);
    float _2148 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = -_2086;
    float _2152 = fma(_2114, _2138, _2150);
    float _2154 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2156 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2144);
    float _2158 = fma(_2136, _2148, -0.212114393711090087890625);
    float _2160 = _2128 * 0.693147182464599609375;
    float _2162 = _2154 * _2134;
    float _2164 = -_2140;
    float _2166 = _2054 + _2164;
    float _2168 = _2156 * _2134;
    float _2170 = fma(_2136, _2158, 1.570728778839111328125);
    float _2172 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2174 = fma(_2162, 0.5, 0.5);
    float _2176 = fma(_2168, -0.5, 0.5);
    float _2178 = _2146 * 0.636619746685028076171875;
    float _2180 = fma(_2152, 0.5, 0.5);
    float2 _7629 = float2(_2120, _2166);
    float _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7629, float2(0.0), isnan(_7629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7629, float2(0.0), isnan(_7629)), level(0.0)).x;
    float3 _7640 = float3(_2174, _2176, _2172);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7640, float3(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7640, float3(0.0), isnan(_7640)), level(0.0)).x;
    float3 _7651 = float3(_2174, _2176, _2172);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7651, float3(0.0), isnan(_7651)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7651, float3(0.0), isnan(_7651)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float _2197 = -_2170;
    float _2199 = fma(_2178, _2197, 1.0);
    float2 _7672 = float2(_2199, _2180);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7672, float2(0.0), isnan(_7672)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7672, float2(0.0), isnan(_7672)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = floor(_1788);
    float _2213 = _1816 * _1812;
    float _2215 = in.m_62.w;
    float _2217 = in.m_72.y;
    float _2219 = in.m_72.x;
    bool _2221 = _825 > 0.5;
    float _2223 = -_2211;
    float _2225 = _1788 + _2223;
    bool _2227 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2229 = isnan(_807);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = _2225 * _1812;
    float _2241 = floor(_2213);
    bool _2243 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2245 = isnan(_807);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2257 = _807 + _2255;
    float _2259 = in.m_74.x;
    float _2261 = in.m_74.y;
    float _2263 = in.m_74.z;
    float _2265 = in.m_76.x;
    float _2267 = in.m_76.y;
    float _2269 = in.m_76.z;
    float _2271 = in.m_76.w;
    float _2273 = floor(_2239);
    float _2275 = fma(_1812, _2241, _2273);
    float _2277 = floor(_1818);
    float _2279 = _1816 * _1780;
    float _2281 = _1784 * _1780;
    float _2283 = _1784 * _1856;
    float _2285 = floor(_2279);
    float _2287 = -_2277;
    float _2289 = _1818 + _2287;
    float _2291 = floor(_2281);
    float _2293 = _2289 * _1856;
    float _2295 = _2225 * _1860;
    float _2297 = _2289 * _1860;
    float _2299 = floor(_2293);
    float _2301 = floor(_2283);
    float _2303 = fma(_1780, _2285, _2291);
    float _2305 = floor(_2295);
    float _2307 = floor(_2297);
    float _2309 = fma(_1856, _2299, _2301);
    float _2311 = trunc(_2275);
    int _2313 = int(_2311);
    float _2315 = trunc(_2303);
    int _2317 = int(_2315);
    float _2319 = fma(_1860, _2307, _2305);
    float _2321 = trunc(_2309);
    int _2323 = int(_2321);
    int _2325 = as_type<int>(_1808) + _2313;
    float _2327 = trunc(_2319);
    int _2329 = int(_2327);
    int _2331 = _2325 * 656;
    int _2333 = as_type<int>(_1776) + _2317;
    int _2335 = _2331 + 262160;
    int _2337 = as_type<int>(_1866) + _2323;
    int _2339 = _2333 * 656;
    int _2341 = _2331 + 262176;
    int _2343 = _2331 + 262192;
    int _2345 = _2337 * 656;
    uint _2347 = uint(int(uint(_2335) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2347)];
    float _2349 = as_type<float>(_dmw1.x);
    int _2351 = _2335 + 4;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    float _2355 = as_type<float>(_dmw1.y);
    int _2357 = _2335 + 8;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    float _2361 = as_type<float>(_dmw1.z);
    int _2363 = _2335 + 12;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    float _2367 = as_type<float>(_dmw1.w);
    int _2369 = as_type<int>(_1872) + _2329;
    int _2371 = _2331 + 262240;
    uint _2373 = uint(int(uint(_2341) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2373)];
    float _2375 = as_type<float>(_dmw2.x);
    int _2377 = _2341 + 4;
    uint _2379 = uint(int(uint(_2377) >> uint(2)));
    float _2381 = as_type<float>(_dmw2.y);
    int _2383 = _2341 + 8;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw2.z);
    int _2389 = _2341 + 12;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw2.w);
    int _2395 = _2331 + 262224;
    int _2397 = _2339 + 262192;
    uint _2399 = uint(int(uint(_2343) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2399)];
    float _2401 = as_type<float>(_dmw3.x);
    int _2403 = _2343 + 4;
    uint _2405 = uint(int(uint(_2403) >> uint(2)));
    float _2407 = as_type<float>(_dmw3.y);
    int _2409 = _2343 + 8;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    float _2413 = as_type<float>(_dmw3.z);
    int _2415 = _2343 + 12;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    float _2419 = as_type<float>(_dmw3.w);
    int _2421 = _2331 + 262144;
    int _2423 = _2369 * 656;
    int _2425 = _2331 + 262208;
    out.m_78.x = 1.0;
    out.m_78.y = 1.0;
    out.m_78.z = 1.0;
    int _2427 = _2339 + 262160;
    int _2429 = _2345 + 262192;
    uint _2431 = uint(int(uint(_2397) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2431)];
    float _2433 = as_type<float>(_dmw9.x);
    int _2435 = _2397 + 4;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    float _2439 = as_type<float>(_dmw9.y);
    int _2441 = _2397 + 8;
    uint _2443 = uint(int(uint(_2441) >> uint(2)));
    float _2445 = as_type<float>(_dmw9.z);
    int _2447 = _2397 + 12;
    uint _2449 = uint(int(uint(_2447) >> uint(2)));
    float _2451 = as_type<float>(_dmw9.w);
    int _2453 = _2339 + 262224;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2457 = _2455 != 0;
    uint _2459 = uint(int(uint(_2371) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2459)];
    float _2461 = as_type<float>(_dmw6.x);
    int _2463 = _2371 + 4;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    float _2467 = as_type<float>(_dmw6.y);
    int _2469 = _2371 + 8;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    float _2473 = as_type<float>(_dmw6.z);
    int _2475 = _2371 + 12;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    float _2479 = as_type<float>(_dmw6.w);
    int _2481 = _2331 + 262256;
    uint _2483 = uint(int(uint(_2395) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2483)];
    float _2485 = as_type<float>(_dmw5.x);
    int _2487 = _2395 + 4;
    uint _2489 = uint(int(uint(_2487) >> uint(2)));
    float _2491 = as_type<float>(_dmw5.y);
    int _2493 = _2395 + 8;
    uint _2495 = uint(int(uint(_2493) >> uint(2)));
    float _2497 = as_type<float>(_dmw5.z);
    int _2499 = _2395 + 12;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    float _2503 = as_type<float>(_dmw5.w);
    int _2505 = _2339 + 262144;
    int _2507 = _2339 + 262208;
    uint _2509 = uint(int(uint(_2421) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2509)];
    float _2511 = as_type<float>(_dmw0.x);
    int _2513 = _2421 + 4;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    float _2517 = as_type<float>(_dmw0.y);
    int _2519 = _2421 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    float _2523 = as_type<float>(_dmw0.z);
    int _2525 = _2421 + 12;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    float _2529 = as_type<float>(_dmw0.w);
    int _2531 = _2345 + 262160;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2537 = _2423 + 262192;
    uint _2539 = uint(int(uint(_2425) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2539)];
    float _2541 = as_type<float>(_dmw4.x);
    int _2543 = _2425 + 4;
    uint _2545 = uint(int(uint(_2543) >> uint(2)));
    float _2547 = as_type<float>(_dmw4.y);
    int _2549 = _2425 + 8;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    float _2553 = as_type<float>(_dmw4.z);
    int _2555 = _2425 + 12;
    uint _2557 = uint(int(uint(_2555) >> uint(2)));
    float _2559 = as_type<float>(_dmw4.w);
    int _2561 = _2345 + 262224;
    uint _2563 = uint(int(uint(_2427) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2563)];
    float _2565 = as_type<float>(_dmw8.x);
    int _2567 = _2427 + 4;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    float _2571 = as_type<float>(_dmw8.y);
    int _2573 = _2427 + 8;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    float _2577 = as_type<float>(_dmw8.z);
    int _2579 = _2427 + 12;
    uint _2581 = uint(int(uint(_2579) >> uint(2)));
    float _2583 = as_type<float>(_dmw8.w);
    int _2585 = _2339 + 262176;
    int _2587 = _2339 + 262240;
    uint _2589 = uint(int(uint(_2429) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2589)];
    float _2591 = as_type<float>(_dmw13.x);
    int _2593 = _2429 + 4;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    float _2597 = as_type<float>(_dmw13.y);
    int _2599 = _2429 + 8;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    float _2603 = as_type<float>(_dmw13.z);
    int _2605 = _2429 + 12;
    uint _2607 = uint(int(uint(_2605) >> uint(2)));
    float _2609 = as_type<float>(_dmw13.w);
    int _2611 = _2339 + 262256;
    int _2613 = _2345 + 262208;
    uint _2615 = uint(int(uint(_2453) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2615)];
    float _2617 = as_type<float>(_dmw11.x);
    int _2619 = _2453 + 4;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    float _2623 = as_type<float>(_dmw11.y);
    int _2625 = _2453 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    float _2629 = as_type<float>(_dmw11.z);
    int _2631 = _2453 + 12;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    float _2635 = as_type<float>(_dmw11.w);
    bool _2637 = _2215 > 0.5;
    float _2639 = 1.0 / _2535;
    int _2641 = _2423 + 262224;
    uint _2643 = uint(int(uint(_2505) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2643)];
    float _2645 = as_type<float>(_dmw7.x);
    int _2647 = _2505 + 4;
    uint _2649 = uint(int(uint(_2647) >> uint(2)));
    float _2651 = as_type<float>(_dmw7.y);
    int _2653 = _2505 + 8;
    uint _2655 = uint(int(uint(_2653) >> uint(2)));
    float _2657 = as_type<float>(_dmw7.z);
    int _2659 = _2505 + 12;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    float _2663 = as_type<float>(_dmw7.w);
    int _2665 = _2345 + 262144;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2669 = _2667 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    uint _2671 = uint(int(uint(_2507) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2671)];
    float _2673 = as_type<float>(_dmw10.x);
    int _2675 = _2507 + 4;
    uint _2677 = uint(int(uint(_2675) >> uint(2)));
    float _2679 = as_type<float>(_dmw10.y);
    int _2681 = _2507 + 8;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    float _2685 = as_type<float>(_dmw10.z);
    int _2687 = _2507 + 12;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    float _2691 = as_type<float>(_dmw10.w);
    int _2693 = _2345 + 262176;
    int _2695 = _2345 + 262240;
    uint _2697 = uint(int(uint(_2531) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2697)];
    float _2699 = as_type<float>(_dmw12.x);
    int _2701 = _2531 + 4;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    float _2705 = as_type<float>(_dmw12.y);
    int _2707 = _2531 + 8;
    uint _2709 = uint(int(uint(_2707) >> uint(2)));
    float _2711 = as_type<float>(_dmw12.z);
    int _2713 = _2531 + 12;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    float _2717 = as_type<float>(_dmw12.w);
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2723 = _2345 + 262256;
    int _2725 = _2423 + 262208;
    uint _2727 = uint(int(uint(_2537) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2727)];
    float _2729 = as_type<float>(_dmw15.x);
    int _2731 = _2537 + 4;
    uint _2733 = uint(int(uint(_2731) >> uint(2)));
    float _2735 = as_type<float>(_dmw15.y);
    int _2737 = _2537 + 8;
    uint _2739 = uint(int(uint(_2737) >> uint(2)));
    float _2741 = as_type<float>(_dmw15.z);
    int _2743 = _2537 + 12;
    uint _2745 = uint(int(uint(_2743) >> uint(2)));
    float _2747 = as_type<float>(_dmw15.w);
    float _2749 = 1.0 / _2669;
    uint _2751 = uint(int(uint(_2561) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2751)];
    float _2753 = as_type<float>(_dmw14.x);
    int _2755 = _2561 + 4;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    float _2759 = as_type<float>(_dmw14.y);
    int _2761 = _2561 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    float _2765 = as_type<float>(_dmw14.z);
    int _2767 = _2561 + 12;
    uint _2769 = uint(int(uint(_2767) >> uint(2)));
    float _2771 = as_type<float>(_dmw14.w);
    bool _2773 = _2637;
    float _2775 = _2219;
    float _2777 = _2217;
    if (_2457)
    {
        bool _2779 = _809 > 0.5;
        _991 = _2779;
    }
    bool _2781 = _991;
    uint _2783 = uint(int(uint(_2613) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2783)];
    float _2785 = as_type<float>(_dmw17.x);
    int _2787 = _2613 + 4;
    uint _2789 = uint(int(uint(_2787) >> uint(2)));
    float _2791 = as_type<float>(_dmw17.y);
    int _2793 = _2613 + 8;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    float _2797 = as_type<float>(_dmw17.z);
    int _2799 = _2613 + 12;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    float _2803 = as_type<float>(_dmw17.w);
    float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2807 = _2805 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    uint _2809 = uint(int(uint(_2641) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2809)];
    float _2811 = as_type<float>(_dmw20.x);
    int _2813 = _2641 + 4;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    float _2817 = as_type<float>(_dmw20.y);
    int _2819 = _2641 + 8;
    uint _2821 = uint(int(uint(_2819) >> uint(2)));
    float _2823 = as_type<float>(_dmw20.z);
    int _2825 = _2641 + 12;
    uint _2827 = uint(int(uint(_2825) >> uint(2)));
    float _2829 = as_type<float>(_dmw20.w);
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2833 = _2831 != 0;
    int _2835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2837 = _2835 != 0;
    uint _2839 = uint(int(uint(_2725) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2839)];
    float _2841 = as_type<float>(_dmw19.x);
    int _2843 = _2725 + 4;
    uint _2845 = uint(int(uint(_2843) >> uint(2)));
    float _2847 = as_type<float>(_dmw19.y);
    int _2849 = _2725 + 8;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    float _2853 = as_type<float>(_dmw19.z);
    int _2855 = _2725 + 12;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    float _2859 = as_type<float>(_dmw19.w);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    uint _2865 = uint(int(uint(_2481) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2865)];
    float _2867 = as_type<float>(_dmw21.x);
    int _2869 = _2481 + 4;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    float _2873 = as_type<float>(_dmw21.y);
    int _2875 = _2481 + 8;
    uint _2877 = uint(int(uint(_2875) >> uint(2)));
    float _2879 = as_type<float>(_dmw21.z);
    int _2881 = _2481 + 12;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    float _2885 = as_type<float>(_dmw21.w);
    uint _2887 = uint(int(uint(_2665) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2887)];
    float _2889 = as_type<float>(_dmw16.x);
    int _2891 = _2665 + 4;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    float _2895 = as_type<float>(_dmw16.y);
    int _2897 = _2665 + 8;
    uint _2899 = uint(int(uint(_2897) >> uint(2)));
    float _2901 = as_type<float>(_dmw16.z);
    int _2903 = _2665 + 12;
    uint _2905 = uint(int(uint(_2903) >> uint(2)));
    float _2907 = as_type<float>(_dmw16.w);
    uint _2909 = uint(int(uint(_2611) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2909)];
    float _2911 = as_type<float>(_dmw23.x);
    int _2913 = _2611 + 4;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    float _2917 = as_type<float>(_dmw23.y);
    int _2919 = _2611 + 8;
    uint _2921 = uint(int(uint(_2919) >> uint(2)));
    float _2923 = as_type<float>(_dmw23.z);
    int _2925 = _2611 + 12;
    uint _2927 = uint(int(uint(_2925) >> uint(2)));
    float _2929 = as_type<float>(_dmw23.w);
    float _2931 = 1.0 / _2721;
    float _2933 = -_2217;
    float _2935 = _2933 + 1.0;
    float _2937 = -_2253;
    float _2939 = _2937 + 1.0;
    int _2941 = _2423 + 262176;
    uint _2943 = uint(int(uint(_2723) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2943)];
    float _2945 = as_type<float>(_dmw18.x);
    int _2947 = _2723 + 4;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    float _2951 = as_type<float>(_dmw18.y);
    int _2953 = _2723 + 8;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    float _2957 = as_type<float>(_dmw18.z);
    int _2959 = _2723 + 12;
    uint _2961 = uint(int(uint(_2959) >> uint(2)));
    float _2963 = as_type<float>(_dmw18.w);
    float _2965 = 1.0 / _2807;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2967;
    int _2971 = _2637 ? as_type<int>(_2935) : as_type<int>(_2217);
    uint _2973 = uint(int(uint(_2587) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2973)];
    float _2975 = as_type<float>(_dmw22.x);
    int _2977 = _2587 + 4;
    uint _2979 = uint(int(uint(_2977) >> uint(2)));
    float _2981 = as_type<float>(_dmw22.y);
    int _2983 = _2587 + 8;
    uint _2985 = uint(int(uint(_2983) >> uint(2)));
    float _2987 = as_type<float>(_dmw22.z);
    int _2989 = _2587 + 12;
    uint _2991 = uint(int(uint(_2989) >> uint(2)));
    float _2993 = as_type<float>(_dmw22.w);
    if (_2833)
    {
        bool _2995 = _817 > 0.5;
        _2773 = _2995;
    }
    bool _2997 = _2773;
    float _2999 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _3001 = _2999 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3003 = _2969 * _2639;
    float _3005 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3007 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3005;
    int _3009 = _2423 + 262240;
    float _3011 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3013 = _807 + _3011;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _3017 = _3015 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _3019 = _3007 * _2931;
    float _3021 = _3001 * _2749;
    float _3023 = fma(_3003, _3013, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3025 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3027 = _807 + _3025;
    bool _3029 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3031 = isnan(_807);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3037 = _3033 || _3035;
    float _3039 = float(_3037);
    float _3041 = -_2237;
    float _3043 = _3041 + 1.0;
    float _3045 = _3017 * _2965;
    float _3047 = fma(_3021, _3027, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3051 = _807 + _3049;
    float _3053 = _3039 * _3043;
    float _3055 = -_3039;
    float _3057 = _3055 + 1.0;
    bool _3059 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3061 = isnan(_807);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3067 = _3063 || _3065;
    float _3069 = float(_3067);
    float _3071 = fma(_3019, _3051, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _3073 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3075 = isnan(_807);
    bool _3077 = _3073 || _3075;
    bool _3079 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3081 = _3077 || _3079;
    float _3083 = float(_3081);
    uint _3085 = uint(int(uint(_2695) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3085)];
    float _3087 = as_type<float>(_dmw25.x);
    int _3089 = _2695 + 4;
    uint _3091 = uint(int(uint(_3089) >> uint(2)));
    float _3093 = as_type<float>(_dmw25.y);
    int _3095 = _2695 + 8;
    uint _3097 = uint(int(uint(_3095) >> uint(2)));
    float _3099 = as_type<float>(_dmw25.z);
    int _3101 = _2695 + 12;
    uint _3103 = uint(int(uint(_3101) >> uint(2)));
    float _3105 = as_type<float>(_dmw25.w);
    int _3107 = _2423 + 262144;
    float _3109 = _3069 * _2939;
    int _3111 = _2423 + 262160;
    uint _3113 = uint(int(uint(_2585) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3113)];
    float _3115 = as_type<float>(_dmw26.x);
    int _3117 = _2585 + 4;
    uint _3119 = uint(int(uint(_3117) >> uint(2)));
    float _3121 = as_type<float>(_dmw26.y);
    int _3123 = _2585 + 8;
    uint _3125 = uint(int(uint(_3123) >> uint(2)));
    float _3127 = as_type<float>(_dmw26.z);
    int _3129 = _2585 + 12;
    uint _3131 = uint(int(uint(_3129) >> uint(2)));
    float _3133 = as_type<float>(_dmw26.w);
    int _3135 = _2423 + 262256;
    float _3137 = -_3083;
    float _3139 = _3137 + 1.0;
    float _3141 = _3023 * _3109;
    uint _3143 = uint(int(uint(_2693) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3143)];
    float _3145 = as_type<float>(_dmw24.x);
    int _3147 = _2693 + 4;
    uint _3149 = uint(int(uint(_3147) >> uint(2)));
    float _3151 = as_type<float>(_dmw24.y);
    int _3153 = _2693 + 8;
    uint _3155 = uint(int(uint(_3153) >> uint(2)));
    float _3157 = as_type<float>(_dmw24.z);
    int _3159 = _2693 + 12;
    uint _3161 = uint(int(uint(_3159) >> uint(2)));
    float _3163 = as_type<float>(_dmw24.w);
    uint _3165 = uint(int(uint(_3135) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3165)];
    float _3167 = as_type<float>(_dmw31.x);
    int _3169 = _3135 + 4;
    uint _3171 = uint(int(uint(_3169) >> uint(2)));
    float _3173 = as_type<float>(_dmw31.y);
    int _3175 = _3135 + 8;
    uint _3177 = uint(int(uint(_3175) >> uint(2)));
    float _3179 = as_type<float>(_dmw31.z);
    int _3181 = _3135 + 12;
    uint _3183 = uint(int(uint(_3181) >> uint(2)));
    float _3185 = as_type<float>(_dmw31.w);
    float _3187 = _2253 * _3139;
    float _3189 = _3083 * _3057;
    uint _3191 = uint(int(uint(_3111) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3191)];
    float _3193 = as_type<float>(_dmw28.x);
    int _3195 = _3111 + 4;
    uint _3197 = uint(int(uint(_3195) >> uint(2)));
    float _3199 = as_type<float>(_dmw28.y);
    int _3201 = _3111 + 8;
    uint _3203 = uint(int(uint(_3201) >> uint(2)));
    float _3205 = as_type<float>(_dmw28.z);
    int _3207 = _3111 + 12;
    uint _3209 = uint(int(uint(_3207) >> uint(2)));
    float _3211 = as_type<float>(_dmw28.w);
    float _3213 = fma(_3045, _2257, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    uint _3215 = uint(int(uint(_3107) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3215)];
    float _3217 = as_type<float>(_dmw27.x);
    int _3219 = _3107 + 4;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    float _3223 = as_type<float>(_dmw27.y);
    int _3225 = _3107 + 8;
    uint _3227 = uint(int(uint(_3225) >> uint(2)));
    float _3229 = as_type<float>(_dmw27.z);
    int _3231 = _3107 + 12;
    uint _3233 = uint(int(uint(_3231) >> uint(2)));
    float _3235 = as_type<float>(_dmw27.w);
    uint _3237 = uint(int(uint(_3009) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3237)];
    float _3239 = as_type<float>(_dmw30.x);
    int _3241 = _3009 + 4;
    uint _3243 = uint(int(uint(_3241) >> uint(2)));
    float _3245 = as_type<float>(_dmw30.y);
    int _3247 = _3009 + 8;
    uint _3249 = uint(int(uint(_3247) >> uint(2)));
    float _3251 = as_type<float>(_dmw30.z);
    int _3253 = _3009 + 12;
    uint _3255 = uint(int(uint(_3253) >> uint(2)));
    float _3257 = as_type<float>(_dmw30.w);
    float _3259 = _2837 ? as_type<float>(_2971) : _2217;
    uint _3261 = uint(int(uint(_2941) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_3261)];
    float _3263 = as_type<float>(_dmw29.x);
    int _3265 = _2941 + 4;
    uint _3267 = uint(int(uint(_3265) >> uint(2)));
    float _3269 = as_type<float>(_dmw29.y);
    int _3271 = _2941 + 8;
    uint _3273 = uint(int(uint(_3271) >> uint(2)));
    float _3275 = as_type<float>(_dmw29.z);
    int _3277 = _2941 + 12;
    uint _3279 = uint(int(uint(_3277) >> uint(2)));
    float _3281 = as_type<float>(_dmw29.w);
    bool _3283 = _873 != 0.0;
    bool _3285 = isnan(_873);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    bool _3293 = _871 == 0.0;
    bool _3295 = !_3291;
    bool _3297 = _3293 && _3295;
    bool _3299 = _875 == 0.0;
    bool _3301 = _3299 && _3297;
    int _3303 = 0;
    float _3305 = _3141;
    if (_2457)
    {
        float _3307 = -_2219;
        float _3309 = _3307 + 1.0;
        _3303 = as_type<int>(_3309);
    }
    int _3311 = _3303;
    int _3313 = 0;
    float _3315 = as_type<float>(_3311);
    if (_2833)
    {
        float _3317 = -_2219;
        float _3319 = _3317 + 1.0;
        _3313 = as_type<int>(_3319);
    }
    int _3321 = _3313;
    float _3323 = -_3069;
    float _3325 = _3323 + 1.0;
    float _3327 = 0.0;
    float _3329 = _3325;
    if (!_2457)
    {
        _3327 = _2219;
    }
    float _3331 = _3327;
    float _3333 = _3331;
    if (_2457)
    {
        float _3335 = _2781 ? as_type<float>(_3311) : _2219;
        _3333 = _3335;
    }
    float _3337 = _3333;
    if (_2833)
    {
        float _3339 = _2997 ? as_type<float>(_3321) : _2219;
        _2775 = _3339;
    }
    float _3341 = _2775;
    float _3343 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3141);
    float _3345 = 0.0;
    if (_3301)
    {
        _3345 = _2259;
    }
    float _3347 = _3345;
    float _3349 = 0.0;
    float _3351 = _3347;
    if (_3301)
    {
        _3349 = _2261;
    }
    float _3353 = _3349;
    float _3355 = _3353;
    if (_3301)
    {
        _3329 = _3347;
    }
    float _3357 = _3329;
    float _3359 = _3357;
    if (!_3301)
    {
        _3351 = _2259;
    }
    float _3361 = _3351;
    float _3363 = fma(_3047, _3187, _3343);
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_3301)
    {
        _3315 = _3353;
    }
    float _3367 = _3315;
    float _3369 = _3367;
    if (!_3301)
    {
        _3355 = _2261;
    }
    float _3371 = _3355;
    float _3373 = fma(_3071, _3189, _3363);
    float _3375 = _2269 * _3361;
    if (_2863)
    {
        float _3377 = _2221 ? _2935 : _2217;
        _2777 = _3377;
    }
    float _3379 = _2777;
    if (!_3301)
    {
        float _3381 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3371);
        _3369 = _3381;
    }
    float _3383 = _3369;
    float _3385 = fma(_3213, _3053, _3373);
    float _3387 = _2267 * _2263;
    if (_3301)
    {
        _3305 = _2263;
    }
    float _3389 = _3305;
    float _3391 = _3389;
    if (!_3301)
    {
        float _3393 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2263);
        _3391 = _3393;
    }
    float _3395 = _3391;
    float _3397 = -_3375;
    float _3399 = fma(_2265, _2263, _3397);
    float _3401 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3403 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[135].x, _3385);
    float _3405 = _773 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3407 = _775 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3409 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3411 = -_3387;
    float _3413 = fma(_2269, _3371, _3411);
    float _3415 = _3379 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3417 = _3401 * _3365;
    float _3419 = _3405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3421 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3423 = _3409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3425 = _3403 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _3419;
    out.m_80.y = _3421;
    out.m_80.z = _3423;
    out.m_80.w = _3425;
    float _3427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_3301)
    {
        float _3429 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3361);
        _3359 = _3429;
    }
    float _3431 = _3359;
    float _3433 = _2265 * _3371;
    float _3435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3437 = abs(_1649);
    float _3439 = log2(_3437);
    float _3441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3443 = -_3433;
    float _3445 = fma(_2267, _3361, _3443);
    float _3447 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3449 = _3337 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3451 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3453 = _3399 * _2271;
    float _3455 = _3413 * _2271;
    float _3457 = _3445 * _2271;
    float _3459 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3461 = -_1211;
    float _3463 = fma(_3461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3447);
    float _3465 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3467 = _3415 * _3435;
    float _3469 = _3449 * _3427;
    out.m_82.x = _1175;
    out.m_82.y = _1171;
    out.m_82.z = _1179;
    float _3471 = exp2(_3459);
    float _3473 = _3451 * _3441;
    float _3475 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3465);
    float _3477 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_84.x = _3469;
    out.m_84.y = _3467;
    out.m_84.z = _3473;
    out.m_84.w = _3417;
    float _3479 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3481 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3463);
    float _3483 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3485 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3479);
    float _3487 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3489 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3475);
    float _3491 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3493 = _3481 * _3383;
    float _3495 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3497 = -_1211;
    float _3499 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3477);
    float _3501 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3487);
    float _3503 = -_1211;
    float _3505 = fma(_3503, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3483);
    float _3507 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3491);
    float _3509 = fma(_3489, _3431, _3493);
    float _3511 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3495);
    float _3513 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3499);
    float _3515 = _1247 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3517 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3505);
    float _3519 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3507);
    float _3521 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3511);
    float _3523 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3501);
    float _3525 = _3481 * _2267;
    float _3527 = fma(_3471, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3529 = precise::clamp(_3527, 0.0, 1.0);
    float _3531 = _3513 * _2267;
    float _3533 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3515);
    float _3535 = _3517 * _2267;
    float _3537 = _3453 * _3481;
    float _3539 = _3453 * _3513;
    float _3541 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3485);
    float _3543 = fma(_3489, _2265, _3525);
    float _3545 = _3529 * _3529;
    float _3547 = fma(_3519, _2265, _3531);
    float _3549 = fma(_3529, -2.0, 3.0);
    float _3551 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3533);
    float _3553 = fma(_3521, _2265, _3535);
    float _3555 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3557 = fma(_3455, _3489, _3537);
    float _3559 = _3517 * _3383;
    float _3561 = fma(_3455, _3519, _3539);
    float _3563 = fma(_3541, _2269, _3543);
    float _3565 = _3453 * _3517;
    float _3567 = fma(_3523, _2269, _3547);
    float _3569 = _3545 * _3549;
    float _3571 = fma(_3551, _2269, _3553);
    float _3573 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3555);
    float _3575 = _3513 * _3383;
    float _3577 = fma(_3457, _3541, _3557);
    float _3579 = fma(_3457, _3523, _3561);
    float _3581 = _2154 + _2116;
    float _3583 = fma(_3455, _3521, _3565);
    float _3585 = -_3569;
    float _3587 = _3585 + 1.0;
    float _3589 = -_2285;
    float _3591 = _2279 + _3589;
    float _3593 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    float _3595 = fma(_3519, _3431, _3575);
    out.m_86.x = _3563;
    out.m_86.y = _3567;
    out.m_86.z = _3571;
    float _3597 = _2116 * 0.5;
    float _3599 = fma(_3457, _3551, _3583);
    float _3601 = fma(_3587, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3569);
    float _3603 = -_2291;
    float _3605 = _2281 + _3603;
    float _3607 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3593);
    float _3609 = _3581 * 0.5;
    float _3611 = -_3591;
    float _3613 = _3611 + 1.0;
    float _3615 = fma(_2156, -0.5, _3597);
    out.m_88.x = _3577;
    out.m_88.y = _3579;
    out.m_88.z = _3599;
    float _3617 = _3607 + _2116;
    float _3619 = _3605 * _3613;
    out.gl_Position.x = _2154;
    out.gl_Position.y = _2156;
    out.gl_Position.z = _3607;
    out.gl_Position.w = _2116;
    float _3621 = _3617 * 0.5;
    bool _3623 = _1649 <= 8000.0;
    bool _3625 = isnan(_1649);
    bool _3627 = _3623 || _3625;
    bool _3629 = isnan(8000.0);
    bool _3631 = _3627 || _3629;
    float _3633 = float(_3631);
    float _3635 = -_3605;
    float _3637 = _3635 + 1.0;
    float _3639 = _3637 * _3613;
    float _3641 = _3619 * _2349;
    float _3643 = _3619 * _2367;
    float _3645 = _3619 * _2381;
    float _3647 = _3619 * _2355;
    float _3649 = _3619 * _2387;
    float _3651 = _3619 * _2401;
    float _3653 = _3619 * _2375;
    float _3655 = _3619 * _2419;
    float _3657 = _3619 * _2407;
    out.m_90.x = _3609;
    out.m_90.y = _3615;
    out.m_90.z = _3621;
    out.m_90.w = _2116;
    float _3659 = _3591 * _3637;
    float _3661 = fma(_3639, _2433, _3651);
    float _3663 = _3633 * _3601;
    float _3665 = _3619 * _2491;
    float _3667 = fma(_3639, _2451, _3655);
    float _3669 = _3619 * _2511;
    float _3671 = _3619 * _2517;
    float _3673 = fma(_3639, _2439, _3657);
    float _3675 = _3619 * _2523;
    float _3677 = fma(_3639, _2571, _3647);
    float _3679 = _3605 * _3591;
    float _3681 = _3619 * _2467;
    float _3683 = _3619 * _2541;
    float _3685 = _3619 * _2461;
    float _3687 = _3619 * _2529;
    float _3689 = _3619 * _2479;
    float _3691 = _3619 * _2547;
    float _3693 = fma(_3659, _2591, _3661);
    float _3695 = _3619 * _2361;
    float _3697 = _3619 * _2553;
    float _3699 = _3619 * _2485;
    float _3701 = fma(_3639, _2623, _3665);
    float _3703 = fma(_3659, _2609, _3667);
    float _3705 = _3619 * _2393;
    float _3707 = _3619 * _2497;
    float _3709 = fma(_3639, _2645, _3669);
    float _3711 = fma(_3639, _2673, _3683);
    float _3713 = fma(_3659, _2597, _3673);
    float _3715 = _3619 * _2413;
    float _3717 = fma(_3659, _2705, _3677);
    float _3719 = _3619 * _2503;
    float _3721 = fma(_3639, _2679, _3691);
    float _3723 = fma(_3679, _2729, _3693);
    float _3725 = _3619 * _2473;
    float _3727 = fma(_3639, _2685, _3697);
    float _3729 = fma(_3639, _2617, _3699);
    float _3731 = fma(_3659, _2759, _3701);
    float _3733 = fma(_3679, _2747, _3703);
    float _3735 = _3619 * _2559;
    float _3737 = fma(_3639, _2629, _3707);
    float _3739 = fma(_3659, _2785, _3711);
    float _3741 = fma(_3679, _2735, _3713);
    float _3743 = fma(_3639, _2635, _3719);
    float _3745 = fma(_3659, _2791, _3721);
    float _3747 = _3723 * 0.886227548122406005859375;
    float _3749 = fma(_3659, _2797, _3727);
    float _3751 = fma(_3659, _2753, _3729);
    float _3753 = fma(_3679, _2817, _3731);
    float _3755 = _3733 * 0.511664927005767822265625;
    float _3757 = fma(_3639, _2691, _3735);
    float _3759 = fma(_3659, _2765, _3737);
    float _3761 = fma(_3679, _2841, _3739);
    float _3763 = _3741 * 0.886227548122406005859375;
    float _3765 = _3619 * _2873;
    float _3767 = fma(_3659, _2889, _3709);
    float _3769 = fma(_3659, _2771, _3743);
    float _3771 = fma(_3679, _2847, _3745);
    float _3773 = fma(_3679, _2853, _3749);
    float _3775 = precise::max(_3747, 0.00999999977648258209228515625);
    float _3777 = _3753 * 0.511664927005767822265625;
    float _3779 = _3755 * _3755;
    float _3781 = fma(_3659, _2803, _3757);
    float _3783 = fma(_3679, _2823, _3759);
    float _3785 = _3761 * 0.511664927005767822265625;
    float _3787 = precise::max(_3763, 0.00999999977648258209228515625);
    float _3789 = fma(_3639, _2917, _3765);
    float _3791 = fma(_3679, _2829, _3769);
    float _3793 = _3771 * 0.511664927005767822265625;
    float _3795 = 1.0 / _3775;
    float _3797 = _3773 * 0.511664927005767822265625;
    float _3799 = fma(_3777, _3777, _3779);
    float _3801 = fma(_3679, _2859, _3781);
    float _3803 = _3783 * 0.511664927005767822265625;
    float _3805 = fma(_3679, _2811, _3751);
    float _3807 = _3791 * 0.511664927005767822265625;
    float _3809 = 1.0 / _3787;
    float _3811 = _3785 * _3785;
    float _3813 = fma(_3797, _3797, _3799);
    float _3815 = _3801 * 0.511664927005767822265625;
    float _3817 = fma(_3803, _3803, _3811);
    float _3819 = _3793 * _3793;
    float _3821 = _3805 * 0.511664927005767822265625;
    float _3823 = fma(_3815, _3815, _3817);
    float _3825 = fma(_3807, _3807, _3819);
    float _3827 = sqrt(_3813);
    float _3829 = fma(_3821, _3821, _3825);
    float _3831 = sqrt(_3823);
    float _3833 = sqrt(_3829);
    float _3835 = precise::max(_3827, 0.00999999977648258209228515625);
    float _3837 = fma(_3639, _2445, _3715);
    float _3839 = fma(_3639, _2651, _3671);
    float _3841 = 1.0 / _3835;
    float _3843 = precise::max(_3831, 0.00999999977648258209228515625);
    float _3845 = fma(_3639, _2663, _3687);
    float _3847 = fma(_3659, _2603, _3837);
    float _3849 = precise::max(_3833, 0.00999999977648258209228515625);
    float _3851 = 1.0 / _3843;
    float _3853 = fma(_3679, _2741, _3847);
    float _3855 = 1.0 / _3849;
    float _3857 = _3853 * 0.886227548122406005859375;
    float _3859 = _3755 * _3841;
    float _3861 = fma(_3523, _3395, _3595);
    float _3863 = _3843 * _3809;
    float _3865 = precise::clamp(_3863, 0.0, 1.0);
    float _3867 = _3835 * _3795;
    float _3869 = precise::clamp(_3867, 0.0, 1.0);
    float _3871 = _3777 * _3841;
    float _3873 = _3797 * _3841;
    float _3875 = precise::max(_3857, 0.00999999977648258209228515625);
    float _3877 = _3861 * _3859;
    float _3879 = _3785 * _3851;
    float _3881 = fma(_3521, _3431, _3559);
    float _3883 = fma(_3541, _3395, _3509);
    float _3885 = _3619 * _2867;
    float _3887 = _3619 * _2879;
    float _3889 = _3619 * _2885;
    float _3891 = _3793 * _3855;
    float _3893 = 1.0 / _3875;
    float _3895 = _3803 * _3851;
    float _3897 = fma(_3659, _2951, _3789);
    float _3899 = fma(_3883, _3871, _3877);
    float _3901 = fma(_3551, _3395, _3881);
    float _3903 = _3807 * _3855;
    float _3905 = _3861 * _3891;
    float _3907 = _3861 * _3879;
    float _3909 = fma(_3639, _2657, _3675);
    float _3911 = fma(_3679, _3173, _3897);
    float _3913 = _3815 * _3851;
    float _3915 = fma(_3883, _3895, _3907);
    float _3917 = fma(_3901, _3873, _3899);
    float _3919 = _3861 * 1.02332699298858642578125;
    float _3921 = _3821 * _3855;
    float _3923 = fma(_3883, _3903, _3905);
    float _3925 = fma(_3639, _2565, _3641);
    float _3927 = fma(_3639, _2981, _3681);
    float _3929 = fma(_3659, _2901, _3909);
    float _3931 = fma(_3679, _3199, _3717);
    float _3933 = fma(_3917, 0.5, 0.5);
    float _3935 = _3911 * _3919;
    float _3937 = fma(_3901, _3913, _3915);
    float _3939 = fma(_3901, _3921, _3923);
    float _3941 = fma(_3659, _2907, _3845);
    float _3943 = fma(_3639, _2975, _3685);
    float _3945 = fma(_3639, _2911, _3885);
    float _3947 = fma(_3659, _2699, _3925);
    float _3949 = fma(_3659, _3093, _3927);
    float _3951 = fma(_3679, _3229, _3929);
    float _3953 = _3931 * _3919;
    float _3955 = fma(_3937, 0.5, 0.5);
    float _3957 = fma(_3939, 0.5, 0.5);
    float _3959 = fma(_3639, _3115, _3653);
    float _3961 = fma(_3679, _3235, _3941);
    float _3963 = fma(_3639, _2577, _3695);
    float _3965 = fma(_3639, _2583, _3643);
    float _3967 = fma(_3639, _2987, _3725);
    float _3969 = fma(_3639, _2923, _3887);
    float _3971 = fma(_3659, _2895, _3839);
    float _3973 = fma(_3659, _3087, _3943);
    float _3975 = fma(_3659, _2945, _3945);
    float _3977 = fma(_3679, _3193, _3947);
    float _3979 = fma(_3679, _3245, _3949);
    float _3981 = fma(_3951, 0.88622701168060302734375, _3953);
    float _3983 = fma(_3659, _3145, _3959);
    float _3985 = abs(_3957);
    float _3987 = log2(_3985);
    float _3989 = _3961 * _3919;
    float _3991 = fma(_3639, _2993, _3689);
    float _3993 = fma(_3659, _2711, _3963);
    float _3995 = fma(_3659, _2717, _3965);
    float _3997 = fma(_3659, _3099, _3967);
    float _3999 = fma(_3659, _2957, _3969);
    float _4001 = fma(_3679, _3217, _3767);
    float _4003 = fma(_3679, _3223, _3971);
    float _4005 = fma(_3679, _3239, _3973);
    float _4007 = fma(_3679, _3167, _3975);
    float _4009 = abs(_3933);
    float _4011 = log2(_4009);
    float _4013 = _3977 * _3919;
    float _4015 = _3979 * _3919;
    float _4017 = fma(_3679, _3263, _3983);
    float _4019 = _3901 * 1.02332699298858642578125;
    float _4021 = abs(_3955);
    float _4023 = log2(_4021);
    float _4025 = fma(_3659, _3105, _3991);
    float _4027 = fma(_3679, _3205, _3993);
    float _4029 = fma(_3679, _3211, _3995);
    float _4031 = fma(_3679, _3251, _3997);
    float _4033 = fma(_3679, _3179, _3999);
    float _4035 = fma(_4001, 0.88622701168060302734375, _3989);
    float _4037 = fma(_4003, 0.88622701168060302734375, _4013);
    float _4039 = fma(_4005, 0.88622701168060302734375, _4015);
    float _4041 = fma(_4007, 0.88622701168060302734375, _3935);
    float _4043 = fma(_3639, _3121, _3645);
    float _4045 = _3849 * _3893;
    float _4047 = precise::clamp(_4045, 0.0, 1.0);
    float _4049 = fma(_3639, _3127, _3649);
    float _4051 = fma(_3639, _3133, _3705);
    float _4053 = fma(_3639, _2929, _3889);
    float _4055 = fma(_4017, _4019, _3981);
    float _4057 = fma(_3679, _3257, _4025);
    float _4059 = fma(_4027, _4019, _4035);
    float _4061 = fma(_4029, _4019, _4037);
    float _4063 = fma(_4031, _4019, _4039);
    float _4065 = _3883 * 1.02332699298858642578125;
    float _4067 = fma(_4033, _4019, _4041);
    float _4069 = fma(_3869, 2.0, 1.0);
    float _4071 = fma(_3865, 2.0, 1.0);
    float _4073 = fma(_3659, _3151, _4043);
    float _4075 = fma(_4047, 2.0, 1.0);
    float _4077 = fma(_3659, _3157, _4049);
    float _4079 = fma(_3659, _3163, _4051);
    float _4081 = fma(_3659, _2963, _4053);
    float _4083 = fma(_4057, _4065, _4063);
    float _4085 = fma(_3679, _3269, _4073);
    float _4087 = _4075 * _3987;
    float _4089 = fma(_3679, _3275, _4077);
    float _4091 = fma(_3679, _3281, _4079);
    float _4093 = fma(_3679, _3185, _4081);
    float _4095 = _4069 * _4011;
    float _4097 = _4083 * 0.31830990314483642578125;
    float _4099 = precise::clamp(_4097, 0.0, 1.0);
    float _4101 = _4071 * _4023;
    float _4103 = _3869 + 1.0;
    float _4105 = _3865 + 1.0;
    float _4107 = fma(_4085, _4065, _4059);
    float _4109 = fma(_4089, _4065, _4061);
    float _4111 = fma(_4091, _4065, _4055);
    float _4113 = fma(_4093, _4065, _4067);
    float _4115 = _4047 + 1.0;
    float _4117 = exp2(_4095);
    float _4119 = _4099 * 0.88622701168060302734375;
    float _4121 = precise::max(0.0, _4107);
    out.m_92.w = _1107;
    float _4123 = precise::max(0.0, _4109);
    float _4125 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_94.x = _1195;
    float _4127 = exp2(_4101);
    float _4129 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _4131 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _4133 = in.m_96.x;
    float _4135 = exp2(_4087);
    float _4137 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[17].x, _4129);
    float _4139 = fma(_4123, (*spvDescriptorSet0.vp_c15)._m0[17].y, _4131);
    float _4141 = 1.0 / _4103;
    float _4143 = -_3869;
    float _4145 = _4143 + 1.0;
    float _4147 = -_3865;
    float _4149 = _4147 + 1.0;
    float _4151 = 1.0 / _4105;
    float _4153 = _4113 * 0.31830990314483642578125;
    float _4155 = precise::clamp(_4153, 0.0, 1.0);
    float _4157 = 1.0 / _4115;
    float _4159 = fma(_3869, 2.0, 2.0);
    float _4161 = fma(_3865, 2.0, 2.0);
    float _4163 = fma(_4047, 2.0, 2.0);
    float _4165 = -_4047;
    float _4167 = _4165 + 1.0;
    float _4169 = _4159 * _4117;
    float _4171 = _4161 * _4127;
    float _4173 = _4163 * _4135;
    out.m_98.x = _3883;
    out.m_98.y = _3861;
    out.m_98.z = _3901;
    float _4175 = -_4155;
    float _4177 = _4175 + 1.0;
    out.m_100.x = _1639;
    out.m_100.y = _1637;
    out.m_100.z = _1641;
    float _4179 = fma(_4177, (*spvDescriptorSet0.vp_c15)._m0[659].w, _4155);
    out.m_102.x = 0.0;
    float _4181 = _4145 * _4141;
    float _4183 = _4149 * _4151;
    float _4185 = _4167 * _4157;
    float _4187 = -_4169;
    float _4189 = _4187 + 1.0;
    float _4191 = -_4171;
    float _4193 = _4191 + 1.0;
    float _4195 = -_4173;
    float _4197 = _4195 + 1.0;
    bool _4199 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4201 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _4203 = precise::max(0.0, _4111);
    float _4205 = fma(_4181, _4189, _4169);
    float _4207 = fma(_4183, _4193, _4171);
    float _4209 = fma(_4185, _4197, _4173);
    float _4211 = exp2(_4125);
    float _4213 = fma(_4203, (*spvDescriptorSet0.vp_c15)._m0[17].z, _4201);
    float _4215 = _3747 * _4205;
    float _4217 = _3763 * _4207;
    float _4219 = _4179 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _4221 = _3857 * _4209;
    float _4223 = fma(_4215, _4219, _4137);
    float _4225 = fma(_4217, _4219, _4139);
    float _4227 = fma(_4221, _4219, _4213);
    float _4229 = _1709 * _1763;
    float _4231 = _4223 * 0.31830990314483642578125;
    float _4233 = _4225 * 0.31830990314483642578125;
    float _4235 = _4227 * 0.31830990314483642578125;
    bool _4237 = !_4199;
    if (!_4237)
    {
        float _4239 = -_1637;
        float _4241 = _4239 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4243 = -_1639;
        float _4245 = _4243 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4247 = -_1641;
        float _4249 = _4247 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4251 = _4241 * _4241;
        float _4253 = fma(_4245, _4245, _4251);
        float _4255 = fma(_4249, _4249, _4253);
        float _4257 = sqrt(_4255);
        float _4259 = rsqrt(_4255);
        float _4261 = -_4257;
        float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4265 = _4263 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4267 = precise::clamp(_4265, 0.0, 1.0);
        float _4269 = _4245 * _4259;
        float _4271 = _4241 * _4259;
        float _4273 = abs(_4267);
        float _4275 = log2(_4273);
        float _4277 = _4249 * _4259;
        float _4279 = _4269 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4281 = _3861 * _4271;
        float _4283 = -_4271;
        float _4285 = -_4279;
        float _4287 = fma(_4283, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4285);
        float _4289 = fma(_3883, _4269, _4281);
        float _4291 = -_4277;
        float _4293 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4287);
        float _4295 = fma(_3901, _4277, _4289);
        float _4297 = precise::clamp(_4295, 0.0, 1.0);
        float _4299 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4301 = _4293 + _4299;
        float _4303 = _4275 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4305 = _4301 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4307 = precise::clamp(_4305, 0.0, 1.0);
        float _4309 = exp2(_4303);
        float _4311 = _4309 * _4307;
        float _4313 = _4297 * _4311;
        float _4315 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4317 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4319 = _4313 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _4315;
        out.m_102.y = _4317;
        out.m_102.z = _4319;
    }
    float _4321 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4323 = -_4211;
    float _4325 = _4323 + 1.0;
    float _4327 = -_2182;
    float _4329 = _4327 + 1.0;
    float _4331 = _4229 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4333 = _4325 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4335 = _4329 * _4321;
    float _4337 = precise::clamp(_4335, 0.0, 1.0);
    bool _4339 = _1709 > 0.0;
    bool _4341 = isnan(_1709);
    bool _4343 = _4339 || _4341;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    float _4349 = _4331 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4351 = _4333 * _2184;
    float _4353 = -_4337;
    float _4355 = fma(_4353, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _4357 = _1763 <= 0.0;
    bool _4359 = !_4347;
    bool _4361 = _4357 || _4359;
    float _4363 = -_4333;
    float _4365 = _4363 + 1.0;
    float _4367 = _2195 * _4351;
    float _4369 = _4355 * _4133;
    float _4371 = _2209 * _4351;
    out.m_56.x = _4349;
    float _4373 = fma(_2205, _4367, _2189);
    float _4375 = fma(_2207, _4367, _2191);
    float _4377 = _4369 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4379 = _2195 * _4365;
    float _4381 = fma(_2195, _4371, _2193);
    out.m_92.x = _4231;
    out.m_92.y = _4233;
    out.m_92.z = _4235;
    out.m_104.x = _4377;
    out.m_106.x = _4373;
    out.m_106.y = _4375;
    out.m_106.z = _4381;
    out.m_106.w = _4379;
    if (!_4361)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _4383 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4383;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

