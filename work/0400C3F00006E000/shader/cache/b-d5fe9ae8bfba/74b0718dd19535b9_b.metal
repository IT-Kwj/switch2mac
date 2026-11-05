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
    float4 m_78 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_104 [[user(locn5)]];
    float4 m_106 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_56 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 m_98 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_96 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_76 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
    float4 m_62 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_80 [[attribute(9)]];
    float4 m_72 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _463 = false;
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
        float _4074 = as_type<float>(_141);
        out.gl_Position.z = _4074;
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
        float _4144 = as_type<float>(_179);
        out.gl_Position.z = _4144;
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
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
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
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _367 + _369;
    bool _373 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_367);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _389 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_367);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    float _405 = -_383;
    float _407 = _405 + 1.0;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _411 = 1.0 / _387;
    float _413 = _399 * _407;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _421 = _403 * _411;
    float _423 = fma(_421, _371, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _427 = _423 * _413;
    float _429 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[115].x, _427);
    float _431 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _435 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[116].x, _429);
    float _437 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _431;
    out.m_66.y = _439;
    out.m_66.z = _437;
    out.m_66.w = _441;
    bool _443 = !_409;
    float _461;
    if (!_443)
    {
        float _445 = in.m_62.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_125);
        float _467 = 1.0 / _465;
        float _469 = _159 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = in.m_53.x;
    float _475 = in.m_53.y;
    float _477 = in.m_53.z;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _485 = in.m_62.z;
    float _487 = _483 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _489 = in.m_62.y;
    float _491 = in.m_62.x;
    float _493 = _481 * _159;
    float _495 = _475 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _497 = _475 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _499 = _475 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _501 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].x, _495);
    float _503 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].x, _497);
    float _505 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].x, _499);
    float _507 = _485 * 2.0;
    float _509 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[5].z, _501);
    float _511 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[4].z, _503);
    float _513 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[6].z, _505);
    float _515 = _489 * 2.0;
    float _517 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _519 = _511 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _521 = _513 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _523 = floor(_507);
    float _525 = -_517;
    float _527 = _525 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _529 = -_519;
    float _531 = _529 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _491 * 2.0;
    float _535 = _527 * _527;
    float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _539 = _521 + _537;
    float _541 = floor(_533);
    float _543 = fma(_531, _531, _535);
    float _545 = -_521;
    float _547 = _545 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _549 = _489 + _485;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    float _563 = fma(_547, _547, _543);
    float _565 = _549 + (-1.0);
    float _567 = floor(_515);
    bool _569 = _523 >= 0.0;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    float _579 = _491 + _489;
    float _581 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _583 = _523 > 0.0;
    int _585 = _577 ? 0 : 1;
    float _587 = _579 + (-1.0);
    float _589 = sqrt(_563);
    bool _591 = _541 >= 0.0;
    bool _593 = isnan(_541);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    bool _601 = _541 > 0.0;
    int _603 = _599 ? 0 : 1;
    float _605 = exp2(_493);
    bool _607 = _567 > 0.0;
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _611 = _567 >= 0.0;
    bool _613 = isnan(_567);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    int _621 = _619 ? 0 : 1;
    float _623 = abs(_589);
    float _625 = precise::max(_623, 50.0);
    bool _627 = !_561;
    int _629 = _627 ? 0 : 1;
    float _631 = precise::min(_625, 200.0);
    int _633 = ~_585;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = -_605;
    float _641 = _639 + 1.0;
    int _643 = ~_621;
    int _645 = _643 + 1;
    int _647 = _645 + 1;
    float _649 = fma(_631, 0.006666666828095912933349609375, -0.3333333432674407958984375);
    bool _651 = !_553;
    int _653 = _651 ? 0 : 1;
    int _655 = _637;
    int _657 = _647;
    bool _659 = _557;
    if (!_583)
    {
        int _661 = ~_585;
        int _663 = _661 + 1;
        _655 = _663;
    }
    int _665 = _655;
    if (!_607)
    {
        int _667 = ~_621;
        int _669 = _667 + 1;
        _657 = _669;
    }
    int _671 = _657;
    int _673 = abs(_629);
    float _675 = in.m_68.x;
    float _677 = in.m_68.y;
    float _679 = in.m_68.z;
    bool _681 = !_557;
    int _683 = _681 ? 0 : 1;
    float _685 = -_649;
    float _687 = _517 + _685;
    int _689 = ~_603;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    int _695 = _693;
    if (!_601)
    {
        int _697 = ~_603;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _705 = 1.0 + _703;
    int _707 = abs(_653);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _711 = _687 + _709;
    int _713 = abs(_683);
    float _715 = 1.0 / _705;
    float _717 = float(_707);
    float _719 = _711 * _711;
    float _721 = float(_673);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _519 + _723;
    bool _727 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(1.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    bool _737 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _745 = _741 || _743;
    float _747 = fma(_725, _725, _719);
    float _749 = float(_713);
    float _751 = float(_701);
    float _753 = fma(_539, _539, _747);
    float _755 = float(_665);
    float _757 = _745 ? _641 : 0.0;
    float _759 = _749 * _751;
    float _761 = float(_671);
    float _763 = _717 * _755;
    float _765 = _759 * (-2.0);
    if (_735)
    {
        float _767 = _757 * _715;
        _161 = _767;
    }
    float _769 = _161;
    float _771 = sqrt(_753);
    float _773 = _763 * (-2.0);
    float _775 = fma(_765, _677, _677);
    float _777 = _489 + (-0.5);
    float _779 = fma(_581, _765, _581);
    float _781 = fma(_609, _773, _609);
    float _783 = fma(_773, _675, _675);
    float _785 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].y, _775);
    float _787 = _491 + (-0.5);
    float _789 = rsqrt(_753);
    float _791 = _721 * _761;
    float _793 = fma(_779, _769, _785);
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[196].x, _783);
    float _797 = _491 + _485;
    float _799 = _791 * (-2.0);
    float _801 = _771 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _803 = _797 + (-1.0);
    float _805 = _793 * 0.15915493667125701904296875;
    float _807 = fma(_799, _679, _679);
    float _809 = in.m_70.x;
    float _811 = in.m_70.y;
    float _813 = in.m_70.z;
    float _815 = precise::min(_487, _801);
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _819 = _485 + (-0.5);
    float _821 = fma(_781, _769, _795);
    float _823 = _805 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = _789 * _815;
    float _829 = fma(_817, _799, _817);
    float _831 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _807);
    float _833 = _821 * 0.15915493667125701904296875;
    float _835 = _711 * _827;
    float _837 = _725 * _827;
    float _839 = _539 * _827;
    float _841 = fma(_829, _769, _831);
    float _843 = -_835;
    float _845 = _711 + _843;
    float _847 = -_837;
    float _849 = _725 + _847;
    float _851 = -_839;
    float _853 = _539 + _851;
    float _855 = _841 * 0.15915493667125701904296875;
    float _857 = _845 * _845;
    float _859 = _805 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = fma(_849, _849, _857);
    float _867 = fma(_649, 0.2999999523162841796875, 1.0);
    float _869 = fma(_853, _853, _865);
    float _871 = _855 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _867 * _811;
    float _877 = _867 * _809;
    float _879 = _867 * _813;
    float _881 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _883 = sqrt(_869);
    float _885 = _833 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _833 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _789 * _883;
    float _895 = _483 * _893;
    float _897 = _855 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = _887 * _861;
    float _903 = _887 * _825;
    float _905 = _887 * _873;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _875);
    float _909 = _863 * _893;
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _877);
    float _913 = _881 * _893;
    float _915 = _891 * _861;
    float _917 = _891 * _825;
    float _919 = _891 * _873;
    float _921 = _909 * _907;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _879);
    float _925 = _895 * _911;
    float _927 = _861 * _873;
    float _929 = _919 * _921;
    float _931 = fma(_899, _915, _903);
    float _933 = _913 * _923;
    float _935 = -_901;
    float _937 = fma(_899, _917, _935);
    float _939 = -_921;
    float _941 = _899 * _939;
    float _943 = fma(_931, _925, _929);
    float _945 = -_917;
    float _947 = fma(_899, _901, _945);
    float _949 = _825 * _873;
    float _951 = _905 * _921;
    float _953 = fma(_927, _925, _941);
    float _955 = fma(_937, _933, _943);
    float _957 = fma(_899, _903, _915);
    float _959 = fma(_947, _925, _951);
    float _961 = fma(_949, _933, _953);
    float _963 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _965 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = fma(_957, _933, _959);
    float _969 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _963);
    float _973 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _975 = -_839;
    float _977 = _521 + _975;
    float _979 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _969);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _971);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _973);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _979);
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _991 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _993 = _521 + _987;
    float _995 = _519 + _989;
    float _997 = -_835;
    float _999 = _687 + _997;
    float _1001 = _687 + _991;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _993 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _995 + _1007;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1013 = _1005 * _1005;
    float _1015 = fma(_1009, _1009, _1013);
    float _1017 = -_837;
    float _1019 = _519 + _1017;
    float _1021 = sqrt(_1015);
    float _1023 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1011);
    float _1025 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    bool _1027 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1023;
    float _1031 = _991;
    float _1033 = _995;
    float _1035 = _905;
    if (!_1027)
    {
        _1029 = _993;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1027)
    {
        _1031 = _1001;
    }
    float _1041 = _1031;
    bool _1043 = !_1027;
    float _1045 = _1041;
    if (!_1043)
    {
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1051 = _1021 + _1049;
        float _1053 = _1001 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = rsqrt(_1015);
        float _1057 = _1051 * _1047;
        float _1059 = _1057 * 0.15915493667125701904296875;
        float _1061 = _1059 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1059 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 + (-1.0);
        float _1071 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = fma(_1067, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = fma(_1001, _1063, _1071);
        float _1077 = _1055 * _1073;
        float _1079 = fma(_1009, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1081 = fma(_1005, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1075;
        _1033 = _1079;
        _1039 = _1081;
    }
    float _1083 = _1045;
    float _1085 = _1033;
    float _1087 = _1039;
    float _1089 = -_687;
    float _1091 = _1089 + _1083;
    float _1093 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1095 = -_519;
    float _1097 = _1095 + _1085;
    float _1099 = _1091 * _1091;
    float _1101 = _999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1103 = -_521;
    float _1105 = _1103 + _1087;
    float _1107 = fma(_1019, 0.008000000379979610443115234375, 64.0);
    float _1109 = fma(_1097, _1097, _1099);
    float _1111 = 1.0 / _1093;
    float _1113 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1101);
    float _1115 = -_837;
    float _1117 = _1115 + _1085;
    float _1119 = fma(_1105, _1105, _1109);
    float _1121 = precise::max(0.0, _1107);
    float _1123 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1125 = fma(_977, 0.008000000379979610443115234375, 64.0);
    float _1127 = -_835;
    float _1129 = _1127 + _1083;
    float _1131 = sqrt(_1119);
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1135 = precise::min(_1121, 127.0);
    float _1137 = -_839;
    float _1139 = _1137 + _1087;
    float _1141 = precise::max(0.0, _1125);
    float _1143 = _1133 + _1093;
    bool _1145 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1147 = isnan(0.5);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    float _1155 = trunc(_1135);
    int _1157 = int(_1155);
    float _1159 = precise::min(_1141, 127.0);
    float _1161 = _1143 * _1111;
    float _1163 = _1161 * 0.5;
    bool _1165 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1167 = isnan(0.5);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1173 = _1169 || _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1177 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1175);
    float _1179 = trunc(_1159);
    int _1181 = int(_1179);
    bool _1183 = _1131 > 0.0;
    float _1185 = 1.0 / _1177;
    float _1187 = _1085;
    float _1189 = _1083;
    float _1191 = _1087;
    float _1193 = _1159;
    if (!_1183)
    {
        _1187 = _1117;
    }
    float _1195 = _1187;
    int _1197 = _1181 << 7;
    int _1199 = _1197 + _1157;
    float _1201 = _1195;
    float _1203 = _1195;
    if (!_1183)
    {
        _1189 = _1129;
    }
    float _1205 = _1189;
    float _1207 = _1205;
    if (!_1183)
    {
        _1191 = _1139;
    }
    float _1209 = _1191;
    bool _1211 = !_1183;
    float _1213 = _1209;
    if (!_1211)
    {
        float _1215 = _203 * _203;
        float _1217 = fma(_201, _201, _1215);
        float _1219 = fma(_205, _205, _1217);
        float _1221 = rsqrt(_1119);
        float _1223 = sqrt(_1219);
        float _1225 = _1097 * _1221;
        float _1227 = _1091 * _1221;
        float _1229 = _1105 * _1221;
        bool _1231 = _1223 > 0.0;
        float _1233 = _1223;
        float _1235 = _1221;
        if (!_1231)
        {
            _1201 = _1117;
        }
        float _1237 = _1201;
        _1203 = _1237;
        if (!_1231)
        {
            _1233 = _1129;
        }
        float _1239 = _1233;
        _1207 = _1239;
        if (!_1231)
        {
            _1235 = _1139;
        }
        float _1241 = _1235;
        bool _1243 = !_1231;
        _1213 = _1241;
        if (!_1243)
        {
            float _1245 = rsqrt(_1219);
            float _1247 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1249 = _203 * _1245;
            float _1251 = _201 * _1245;
            float _1253 = _1227 * _1249;
            float _1255 = _205 * _1245;
            float _1257 = fma(_1225, _1251, _1253);
            float _1259 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1261 = fma(_1229, _1255, _1257);
            float _1263 = _1261 * _1259;
            float _1265 = fma(_201, _1263, _1117);
            float _1267 = fma(_203, _1263, _1129);
            float _1269 = fma(_205, _1263, _1139);
            _1203 = _1265;
            _1207 = _1267;
            _1213 = _1269;
        }
    }
    float _1271 = _1203;
    float _1273 = _1207;
    float _1275 = _1213;
    int _1277 = _1199 << 4;
    float _1279 = _1275;
    if (_1153)
    {
        _209 = _1271;
    }
    float _1281 = _209;
    float _1283 = _1281;
    if (_1153)
    {
        _211 = _1273;
    }
    float _1285 = _211;
    float _1287 = _1285;
    if (_1153)
    {
        _213 = _1275;
    }
    float _1289 = _213;
    float _1291 = _1289;
    if (!_1153)
    {
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1295 = _999 + _1293;
        float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1299 = _1019 + _1297;
        float _1301 = -_1019;
        float _1303 = _1301 + _1271;
        float _1305 = -_999;
        float _1307 = _1305 + _1273;
        float _1309 = _1295 * _1295;
        float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1313 = _977 + _1311;
        float _1315 = -_977;
        float _1317 = _1315 + _1275;
        float _1319 = fma(_1299, _1299, _1309);
        float _1321 = fma(_1313, _1313, _1319);
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1325 = sqrt(_1321);
        float _1327 = precise::min(_1325, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1329 = _1327 * _1323;
        float _1331 = fma(_1303, _1329, _1019);
        float _1333 = fma(_1307, _1329, _999);
        float _1335 = fma(_1317, _1329, _977);
        _1287 = _1333;
        _1283 = _1331;
        _1291 = _1335;
        _1279 = _1317;
    }
    float _1337 = _1287;
    float _1339 = _1283;
    float _1341 = _1291;
    float _1343 = _1279;
    float _1345 = _1343;
    if (_1173)
    {
        _1345 = 1.0;
    }
    float _1347 = _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1351 = _1185 * _1349;
    float _1353 = 0.0;
    float _1355 = _1347;
    if (_1173)
    {
        _1353 = 1.0;
    }
    float _1357 = _1353;
    int _1359 = _1277 + 8;
    float _1361 = _1357;
    if (!_1173)
    {
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = _1365 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1371;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1405 = fma(_1351, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        _1355 = _1409;
    }
    float _1411 = _1355;
    if (!_1173)
    {
        float _1413 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1419 = _1415 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        float _1423 = _1417 * 0.15915493667125701904296875;
        float _1425 = _1415 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = 1.0 / _1421;
        float _1431 = _1423 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1427 * _1429;
        float _1437 = _1423 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = 1.0 / _1441;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1445;
        float _1449 = 1.0 / _1447;
        float _1451 = _1439 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = fma(_1351, _1451, _1453);
        float _1457 = _1455 * _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + 1.0;
        _1361 = _1463;
    }
    float _1465 = _1361;
    uint _1468 = uint(int(uint(_1359) >> uint(2)));
    float _1470 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1468)]);
    float _1472 = floor(_1135);
    int _1474 = _1277 + 12;
    uint _1476 = uint(int(uint(_1277) >> uint(2)));
    float _1478 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1476)]);
    uint _1480 = uint(int(uint(_1474) >> uint(2)));
    float _1482 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1480)]);
    float _1484 = -_1472;
    float _1486 = _1135 + _1484;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = _1470 + _1486;
    float _1492 = trunc(_1490);
    int _1494 = int(_1492);
    int _1496 = _1157 + _1494;
    int _1498 = _1181 << 7;
    int _1500 = _1498 + _1496;
    int _1502 = _1500 << 4;
    float _1504 = floor(_1159);
    int _1506 = _1502 + 12;
    uint _1508 = uint(int(uint(_1502) >> uint(2)));
    float _1510 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1508)]);
    uint _1512 = uint(int(uint(_1506) >> uint(2)));
    float _1514 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1512)]);
    float _1516 = -_1504;
    float _1518 = _1159 + _1516;
    float _1520 = _1470 + _1518;
    float _1522 = trunc(_1520);
    int _1524 = int(_1522);
    int _1526 = _1181 + _1524;
    int _1528 = _1526 << 7;
    int _1530 = _1528 + _1157;
    int _1532 = _1526 << 7;
    int _1534 = _1532 + _1496;
    int _1536 = _1530 << 4;
    int _1538 = _1534 << 4;
    int _1540 = _1536 + 12;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1337 + _1542;
    int _1546 = _1538 + 12;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1339 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1554 = _1341 + _1552;
    uint _1556 = uint(int(uint(_1540) >> uint(2)));
    float _1558 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1556)]);
    uint _1560 = uint(int(uint(_1546) >> uint(2)));
    float _1562 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1560)]);
    float _1564 = _1544 * _1544;
    uint _1566 = uint(int(uint(_1536) >> uint(2)));
    float _1568 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1566)]);
    float _1570 = fma(_1550, _1550, _1564);
    uint _1572 = uint(int(uint(_1538) >> uint(2)));
    float _1574 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1572)]);
    float _1576 = fma(_1554, _1554, _1570);
    float _1578 = rsqrt(_1576);
    float _1580 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = _1550 * _1580;
    float _1584 = _1554 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 + _1588;
    float _1592 = sqrt(_1590);
    bool _1594 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1592 + _1596;
    float _1600 = _1554;
    float _1602 = _1598;
    float _1604 = _1580;
    float _1606 = as_type<float>(_1538);
    if (_1594)
    {
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1608;
    }
    float _1610 = _1600;
    if (_1594)
    {
        float _1612 = _1598 * _1610;
        _1602 = _1612;
    }
    float _1614 = _1602;
    if (_1594)
    {
        float _1616 = _1614 * 0.15915493667125701904296875;
        _1193 = _1616;
    }
    float _1618 = _1193;
    float _1620 = _1578;
    if (_1594)
    {
        float _1622 = _1618 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1620 = _1624;
    }
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1630 = _1610;
    if (_1594)
    {
        float _1632 = _1618 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = precise::max(0.0, _1628);
    float _1640 = _1590;
    float _1642 = _1638;
    if (_1594)
    {
        float _1644 = rsqrt(_1590);
        _1640 = _1644;
    }
    float _1646 = _1640;
    float _1648 = -_1580;
    float _1650 = -_1638;
    float _1652 = fma(_1544, _1648, _1650);
    float _1654 = _1652;
    if (_1594)
    {
        float _1656 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1656;
    }
    float _1658 = _1642;
    float _1660 = _1658;
    float _1662 = _1626;
    if (_1594)
    {
        float _1664 = _1626 + (-1.0);
        _1604 = _1664;
    }
    float _1666 = _1604;
    float _1668 = sqrt(_1576);
    float _1670 = _1636;
    float _1672 = _1666;
    if (_1594)
    {
        float _1674 = fma(_1636, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = _1676;
    if (_1594)
    {
        float _1680 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1680;
    }
    float _1682 = _1672;
    if (_1594)
    {
        float _1684 = _1646 * _1676;
        _1606 = _1684;
    }
    float _1686 = _1606;
    if (!_1594)
    {
        _1678 = _1582;
    }
    float _1688 = _1678;
    float _1690 = _1688;
    if (_1594)
    {
        float _1692 = fma(_1652, _1626, _1682);
        _1654 = _1692;
    }
    float _1694 = _1654;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1594)
    {
        float _1698 = _1582 * _1686;
        _1690 = _1698;
    }
    float _1700 = _1690;
    if (!_1594)
    {
        _1660 = _1584;
    }
    float _1702 = _1660;
    float _1704 = _1702;
    if (_1594)
    {
        float _1706 = _1584 * _1686;
        _1704 = _1706;
    }
    float _1708 = _1704;
    if (!_1594)
    {
        _1662 = _1586;
    }
    float _1710 = _1662;
    float _1712 = _1710;
    if (_1594)
    {
        float _1714 = _1700 * _1700;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1019, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1720 = fma(_1694, _1694, _1716);
    if (!_1594)
    {
        _1696 = _1588;
    }
    float _1722 = _1696;
    float _1724 = _1722;
    if (_1594)
    {
        float _1726 = _1708 * _1708;
        _1724 = _1726;
    }
    float _1728 = _1724;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1668, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1738 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1740 = _1720 + _1728;
    float _1742 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1744 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1736);
    float _1748 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1742);
    float _1750 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1752 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1746);
    float _1754 = rsqrt(_1740);
    float _1756 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1748);
    float _1758 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1750);
    float _1760 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1762 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1760);
    float _1770 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1772 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1774 = -_1734;
    float _1776 = _1774 + 1.0;
    float _1778 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1768);
    float _1780 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1770);
    float _1782 = -_1772;
    float _1784 = fma(_1782, _1488, 1.0);
    float _1786 = abs(_1776);
    float _1788 = log2(_1786);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1780);
    float _1794 = _1754 * _1700;
    float _1796 = _1754 * _1694;
    float _1798 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1802 = _1754 * _1708;
    float _1804 = -_1800;
    float _1806 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1804);
    float _1808 = floor(_1718);
    float _1810 = -_1802;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1806);
    float _1814 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1816 = fma(_1812, -0.5, 0.5);
    float _1818 = exp2(_1814);
    float _1820 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1822 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1824 = log2(_1784);
    float _1826 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1820);
    float _1828 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1822);
    float _1830 = 1.0 / _1798;
    float _1832 = fma(_1812, 0.5, 0.5);
    float _1834 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1826);
    float _1836 = sqrt(_1816);
    float _1838 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = floor(_1738);
    float _1842 = -_1808;
    float _1844 = _1718 + _1842;
    float _1846 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1848 = _1796 + 1.0;
    float _1850 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1834);
    float _1852 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1854 = fma(_1832, _1846, -0.212114393711090087890625);
    float _1856 = -_1796;
    float _1858 = fma(_1818, _1848, _1856);
    float _1860 = _1824 * 0.693147182464599609375;
    float _1862 = _1850 * _1830;
    float _1864 = _1852 * _1830;
    float _1866 = fma(_1832, _1854, 1.570728778839111328125);
    float _1868 = _1836 * 0.636619746685028076171875;
    float _1870 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1872 = fma(_1862, 0.5, 0.5);
    float _1874 = fma(_1864, -0.5, 0.5);
    float _1876 = -_1840;
    float _1878 = _1738 + _1876;
    float _1880 = -_1866;
    float _1882 = fma(_1868, _1880, 1.0);
    float _1884 = fma(_1858, 0.5, 0.5);
    float2 _6769 = float2(_1844, _1878);
    float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6769, float2(0.0), isnan(_6769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6769, float2(0.0), isnan(_6769)), level(0.0)).x;
    float3 _6780 = float3(_1872, _1874, _1870);
    float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float3 _6791 = float3(_1872, _1874, _1870);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6791, float3(0.0), isnan(_6791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6791, float3(0.0), isnan(_6791)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _6807 = float2(_1882, _1884);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6807, float2(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6807, float2(0.0), isnan(_6807)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = floor(_1490);
    float _1913 = _1518 * _1514;
    float _1915 = in.m_72.y;
    float _1917 = in.m_62.w;
    float _1919 = in.m_72.x;
    float _1921 = -_1911;
    float _1923 = _1490 + _1921;
    float _1925 = _1923 * _1514;
    float _1927 = floor(_1913);
    float _1929 = floor(_1925);
    float _1931 = fma(_1514, _1927, _1929);
    float _1933 = floor(_1520);
    float _1935 = _1518 * _1482;
    float _1937 = _1486 * _1482;
    float _1939 = _1486 * _1558;
    float _1941 = _1923 * _1562;
    float _1943 = floor(_1935);
    float _1945 = -_1933;
    float _1947 = _1520 + _1945;
    float _1949 = floor(_1937);
    float _1951 = _1947 * _1558;
    float _1953 = _1947 * _1562;
    float _1955 = floor(_1951);
    float _1957 = floor(_1939);
    float _1959 = floor(_1941);
    float _1961 = floor(_1953);
    float _1963 = fma(_1482, _1943, _1949);
    float _1965 = fma(_1558, _1955, _1957);
    float _1967 = trunc(_1931);
    int _1969 = int(_1967);
    float _1971 = trunc(_1963);
    int _1973 = int(_1971);
    float _1975 = fma(_1562, _1961, _1959);
    float _1977 = trunc(_1965);
    int _1979 = int(_1977);
    int _1981 = as_type<int>(_1510) + _1969;
    float _1983 = trunc(_1975);
    int _1985 = int(_1983);
    int _1987 = _1981 * 656;
    int _1989 = as_type<int>(_1478) + _1973;
    int _1991 = _1987 + 262160;
    int _1993 = _1989 * 656;
    int _1995 = as_type<int>(_1568) + _1979;
    int _1997 = _1987 + 262176;
    int _1999 = _1987 + 262192;
    int _2001 = _1995 * 656;
    uint _2003 = uint(int(uint(_1991) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2003)];
    float _2005 = as_type<float>(_dmw1.x);
    int _2007 = _1991 + 4;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    float _2011 = as_type<float>(_dmw1.y);
    int _2013 = _1991 + 8;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    float _2017 = as_type<float>(_dmw1.z);
    int _2019 = _1991 + 12;
    uint _2021 = uint(int(uint(_2019) >> uint(2)));
    float _2023 = as_type<float>(_dmw1.w);
    int _2025 = as_type<int>(_1574) + _1985;
    int _2027 = _1993 + 262192;
    uint _2029 = uint(int(uint(_1997) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2029)];
    float _2031 = as_type<float>(_dmw2.x);
    int _2033 = _1997 + 4;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    float _2037 = as_type<float>(_dmw2.y);
    int _2039 = _1997 + 8;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    float _2043 = as_type<float>(_dmw2.z);
    int _2045 = _1997 + 12;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    float _2049 = as_type<float>(_dmw2.w);
    int _2051 = _1987 + 262240;
    int _2053 = _2025 * 656;
    int _2055 = _1987 + 262144;
    uint _2057 = uint(int(uint(_1999) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2057)];
    float _2059 = as_type<float>(_dmw3.x);
    int _2061 = _1999 + 4;
    uint _2063 = uint(int(uint(_2061) >> uint(2)));
    float _2065 = as_type<float>(_dmw3.y);
    int _2067 = _1999 + 8;
    uint _2069 = uint(int(uint(_2067) >> uint(2)));
    float _2071 = as_type<float>(_dmw3.z);
    int _2073 = _1999 + 12;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    float _2077 = as_type<float>(_dmw3.w);
    int _2079 = _1987 + 262208;
    int _2081 = _1987 + 262224;
    uint _2083 = uint(int(uint(_2027) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2083)];
    float _2085 = as_type<float>(_dmw11.x);
    int _2087 = _2027 + 4;
    uint _2089 = uint(int(uint(_2087) >> uint(2)));
    float _2091 = as_type<float>(_dmw11.y);
    int _2093 = _2027 + 8;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    float _2097 = as_type<float>(_dmw11.z);
    int _2099 = _2027 + 12;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    float _2103 = as_type<float>(_dmw11.w);
    int _2105 = _1993 + 262160;
    int _2107 = _2001 + 262192;
    uint _2109 = uint(int(uint(_2051) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2109)];
    float _2111 = as_type<float>(_dmw6.x);
    int _2113 = _2051 + 4;
    uint _2115 = uint(int(uint(_2113) >> uint(2)));
    float _2117 = as_type<float>(_dmw6.y);
    int _2119 = _2051 + 8;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    float _2123 = as_type<float>(_dmw6.z);
    int _2125 = _2051 + 12;
    uint _2127 = uint(int(uint(_2125) >> uint(2)));
    float _2129 = as_type<float>(_dmw6.w);
    int _2131 = _1993 + 262144;
    int _2133 = _1993 + 262208;
    uint _2135 = uint(int(uint(_2055) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2135)];
    float _2137 = as_type<float>(_dmw0.x);
    int _2139 = _2055 + 4;
    uint _2141 = uint(int(uint(_2139) >> uint(2)));
    float _2143 = as_type<float>(_dmw0.y);
    int _2145 = _2055 + 8;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    float _2149 = as_type<float>(_dmw0.z);
    int _2151 = _2055 + 12;
    uint _2153 = uint(int(uint(_2151) >> uint(2)));
    float _2155 = as_type<float>(_dmw0.w);
    int _2157 = _2001 + 262160;
    int _2159 = _1987 + 262256;
    uint _2161 = uint(int(uint(_2079) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2161)];
    float _2163 = as_type<float>(_dmw4.x);
    int _2165 = _2079 + 4;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    float _2169 = as_type<float>(_dmw4.y);
    int _2171 = _2079 + 8;
    uint _2173 = uint(int(uint(_2171) >> uint(2)));
    float _2175 = as_type<float>(_dmw4.z);
    int _2177 = _2079 + 12;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    float _2181 = as_type<float>(_dmw4.w);
    int _2183 = _1993 + 262224;
    int _2185 = _2053 + 262192;
    uint _2187 = uint(int(uint(_2081) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2187)];
    float _2189 = as_type<float>(_dmw5.x);
    int _2191 = _2081 + 4;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    float _2195 = as_type<float>(_dmw5.y);
    int _2197 = _2081 + 8;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    float _2201 = as_type<float>(_dmw5.z);
    int _2203 = _2081 + 12;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    float _2207 = as_type<float>(_dmw5.w);
    int _2209 = _2001 + 262208;
    uint _2211 = uint(int(uint(_2105) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2211)];
    float _2213 = as_type<float>(_dmw9.x);
    int _2215 = _2105 + 4;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    float _2219 = as_type<float>(_dmw9.y);
    int _2221 = _2105 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    float _2225 = as_type<float>(_dmw9.z);
    int _2227 = _2105 + 12;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    float _2231 = as_type<float>(_dmw9.w);
    int _2233 = _2001 + 262224;
    uint _2235 = uint(int(uint(_2107) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2235)];
    float _2237 = as_type<float>(_dmw17.x);
    int _2239 = _2107 + 4;
    uint _2241 = uint(int(uint(_2239) >> uint(2)));
    float _2243 = as_type<float>(_dmw17.y);
    int _2245 = _2107 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    float _2249 = as_type<float>(_dmw17.z);
    int _2251 = _2107 + 12;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    float _2255 = as_type<float>(_dmw17.w);
    int _2257 = _2053 + 262208;
    uint _2259 = uint(int(uint(_2131) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2259)];
    float _2261 = as_type<float>(_dmw8.x);
    int _2263 = _2131 + 4;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    float _2267 = as_type<float>(_dmw8.y);
    int _2269 = _2131 + 8;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    float _2273 = as_type<float>(_dmw8.z);
    int _2275 = _2131 + 12;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    float _2279 = as_type<float>(_dmw8.w);
    int _2281 = _2053 + 262224;
    uint _2283 = uint(int(uint(_2133) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2283)];
    float _2285 = as_type<float>(_dmw12.x);
    int _2287 = _2133 + 4;
    uint _2289 = uint(int(uint(_2287) >> uint(2)));
    float _2291 = as_type<float>(_dmw12.y);
    int _2293 = _2133 + 8;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    float _2297 = as_type<float>(_dmw12.z);
    int _2299 = _2133 + 12;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    float _2303 = as_type<float>(_dmw12.w);
    int _2305 = _2001 + 262144;
    uint _2307 = uint(int(uint(_2183) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2307)];
    float _2309 = as_type<float>(_dmw13.x);
    int _2311 = _2183 + 4;
    uint _2313 = uint(int(uint(_2311) >> uint(2)));
    float _2315 = as_type<float>(_dmw13.y);
    int _2317 = _2183 + 8;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    float _2321 = as_type<float>(_dmw13.z);
    int _2323 = _2183 + 12;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    float _2327 = as_type<float>(_dmw13.w);
    int _2329 = _2001 + 262176;
    uint _2331 = uint(int(uint(_2157) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2331)];
    float _2333 = as_type<float>(_dmw16.x);
    int _2335 = _2157 + 4;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    float _2339 = as_type<float>(_dmw16.y);
    int _2341 = _2157 + 8;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    float _2345 = as_type<float>(_dmw16.z);
    int _2347 = _2157 + 12;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    float _2351 = as_type<float>(_dmw16.w);
    int _2353 = _2001 + 262240;
    uint _2355 = uint(int(uint(_2185) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2355)];
    float _2357 = as_type<float>(_dmw20.x);
    int _2359 = _2185 + 4;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    float _2363 = as_type<float>(_dmw20.y);
    int _2365 = _2185 + 8;
    uint _2367 = uint(int(uint(_2365) >> uint(2)));
    float _2369 = as_type<float>(_dmw20.z);
    int _2371 = _2185 + 12;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    float _2375 = as_type<float>(_dmw20.w);
    int _2377 = _2001 + 262256;
    uint _2379 = uint(int(uint(_2209) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2379)];
    float _2381 = as_type<float>(_dmw18.x);
    int _2383 = _2209 + 4;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw18.y);
    int _2389 = _2209 + 8;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw18.z);
    int _2395 = _2209 + 12;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    float _2399 = as_type<float>(_dmw18.w);
    int _2401 = _1993 + 262176;
    uint _2403 = uint(int(uint(_2233) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2403)];
    float _2405 = as_type<float>(_dmw19.x);
    int _2407 = _2233 + 4;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    float _2411 = as_type<float>(_dmw19.y);
    int _2413 = _2233 + 8;
    uint _2415 = uint(int(uint(_2413) >> uint(2)));
    float _2417 = as_type<float>(_dmw19.z);
    int _2419 = _2233 + 12;
    uint _2421 = uint(int(uint(_2419) >> uint(2)));
    float _2423 = as_type<float>(_dmw19.w);
    int _2425 = _1993 + 262240;
    int _2427 = _1993 + 262256;
    uint _2429 = uint(int(uint(_2257) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2429)];
    float _2431 = as_type<float>(_dmw21.x);
    int _2433 = _2257 + 4;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    float _2437 = as_type<float>(_dmw21.y);
    int _2439 = _2257 + 8;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    float _2443 = as_type<float>(_dmw21.z);
    int _2445 = _2257 + 12;
    uint _2447 = uint(int(uint(_2445) >> uint(2)));
    float _2449 = as_type<float>(_dmw21.w);
    uint _2451 = uint(int(uint(_2159) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2451)];
    float _2453 = as_type<float>(_dmw7.x);
    int _2455 = _2159 + 4;
    uint _2457 = uint(int(uint(_2455) >> uint(2)));
    float _2459 = as_type<float>(_dmw7.y);
    int _2461 = _2159 + 8;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    float _2465 = as_type<float>(_dmw7.z);
    int _2467 = _2159 + 12;
    uint _2469 = uint(int(uint(_2467) >> uint(2)));
    float _2471 = as_type<float>(_dmw7.w);
    uint _2473 = uint(int(uint(_2281) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2473)];
    float _2475 = as_type<float>(_dmw22.x);
    int _2477 = _2281 + 4;
    uint _2479 = uint(int(uint(_2477) >> uint(2)));
    float _2481 = as_type<float>(_dmw22.y);
    int _2483 = _2281 + 8;
    uint _2485 = uint(int(uint(_2483) >> uint(2)));
    float _2487 = as_type<float>(_dmw22.z);
    int _2489 = _2281 + 12;
    uint _2491 = uint(int(uint(_2489) >> uint(2)));
    float _2493 = as_type<float>(_dmw22.w);
    uint _2495 = uint(int(uint(_2305) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2495)];
    float _2497 = as_type<float>(_dmw15.x);
    int _2499 = _2305 + 4;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    float _2503 = as_type<float>(_dmw15.y);
    int _2505 = _2305 + 8;
    uint _2507 = uint(int(uint(_2505) >> uint(2)));
    float _2509 = as_type<float>(_dmw15.z);
    int _2511 = _2305 + 12;
    uint _2513 = uint(int(uint(_2511) >> uint(2)));
    float _2515 = as_type<float>(_dmw15.w);
    uint _2517 = uint(int(uint(_2427) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2517)];
    float _2519 = as_type<float>(_dmw14.x);
    int _2521 = _2427 + 4;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    float _2525 = as_type<float>(_dmw14.y);
    int _2527 = _2427 + 8;
    uint _2529 = uint(int(uint(_2527) >> uint(2)));
    float _2531 = as_type<float>(_dmw14.z);
    int _2533 = _2427 + 12;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    float _2537 = as_type<float>(_dmw14.w);
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2545 = _2543 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2549 = _2547 != 0;
    float _2551 = 1.0 / _2541;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2555 = _2553 != 0;
    float _2557 = -_1915;
    float _2559 = _2557 + 1.0;
    bool _2561 = _1917 > 0.5;
    uint _2563 = uint(int(uint(_2401) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2563)];
    float _2565 = as_type<float>(_dmw10.x);
    int _2567 = _2401 + 4;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    float _2571 = as_type<float>(_dmw10.y);
    int _2573 = _2401 + 8;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    float _2577 = as_type<float>(_dmw10.z);
    int _2579 = _2401 + 12;
    uint _2581 = uint(int(uint(_2579) >> uint(2)));
    float _2583 = as_type<float>(_dmw10.w);
    float _2585 = 1.0 / _2545;
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2587;
    bool _2591 = _2561;
    float _2593 = _1915;
    if (_2549)
    {
        bool _2595 = _491 > 0.5;
        _659 = _2595;
    }
    bool _2597 = _659;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2601 = _471 + _2599;
    bool _2603 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2605 = isnan(_471);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2611 = _2607 || _2609;
    float _2613 = float(_2611);
    uint _2615 = uint(int(uint(_2425) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2615)];
    float _2617 = as_type<float>(_dmw23.x);
    int _2619 = _2425 + 4;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    float _2623 = as_type<float>(_dmw23.y);
    int _2625 = _2425 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    float _2629 = as_type<float>(_dmw23.z);
    int _2631 = _2425 + 12;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    float _2635 = as_type<float>(_dmw23.w);
    bool _2637 = _489 > 0.5;
    float _2639 = _2589 * _2551;
    int _2641 = _2561 ? as_type<int>(_2559) : as_type<int>(_1915);
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2645 = _2643 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_2555)
    {
        bool _2647 = _485 > 0.5;
        _2591 = _2647;
    }
    bool _2649 = _2591;
    float _2651 = fma(_2639, _2601, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2653 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2655 = isnan(_471);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = -_2613;
    float _2667 = _2665 + 1.0;
    int _2669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2671 = _2669 != 0;
    float _2673 = _2645 * _2585;
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2677 = _471 + _2675;
    bool _2679 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2681 = isnan(_471);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2687 = _2683 || _2685;
    float _2689 = float(_2687);
    float _2691 = _2663 * _2667;
    float _2693 = -_2663;
    float _2695 = _2693 + 1.0;
    float _2697 = fma(_2673, _2677, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2699 = _2053 + 262176;
    uint _2701 = uint(int(uint(_2329) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2701)];
    float _2703 = as_type<float>(_dmw24.x);
    int _2705 = _2329 + 4;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    float _2709 = as_type<float>(_dmw24.y);
    int _2711 = _2329 + 8;
    uint _2713 = uint(int(uint(_2711) >> uint(2)));
    float _2715 = as_type<float>(_dmw24.z);
    int _2717 = _2329 + 12;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    float _2721 = as_type<float>(_dmw24.w);
    float _2723 = _2689 * _2695;
    int _2725 = _2053 + 262144;
    int _2727 = 0;
    float _2729 = _2695;
    if (_2549)
    {
        float _2731 = -_1919;
        float _2733 = _2731 + 1.0;
        _2727 = as_type<int>(_2733);
    }
    int _2735 = _2727;
    int _2737 = _2053 + 262160;
    float _2739 = _2651 * _2723;
    int _2741 = _2053 + 262240;
    float _2743 = -_2689;
    float _2745 = _2743 + 1.0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2749 = _2747 != 0;
    uint _2751 = uint(int(uint(_2353) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2751)];
    float _2753 = as_type<float>(_dmw25.x);
    int _2755 = _2353 + 4;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    float _2759 = as_type<float>(_dmw25.y);
    int _2761 = _2353 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    float _2765 = as_type<float>(_dmw25.z);
    int _2767 = _2353 + 12;
    uint _2769 = uint(int(uint(_2767) >> uint(2)));
    float _2771 = as_type<float>(_dmw25.w);
    int _2773 = _2053 + 262256;
    uint _2775 = uint(int(uint(_2377) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
    float _2777 = as_type<float>(_dmw26.x);
    int _2779 = _2377 + 4;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    float _2783 = as_type<float>(_dmw26.y);
    int _2785 = _2377 + 8;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    float _2789 = as_type<float>(_dmw26.z);
    int _2791 = _2377 + 12;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    float _2795 = as_type<float>(_dmw26.w);
    float _2797 = _2745;
    if (!_2549)
    {
        _2729 = _1919;
    }
    float _2799 = _2729;
    float _2801 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2739);
    float _2803 = _2749 ? as_type<float>(_2641) : _1915;
    uint _2805 = uint(int(uint(_2725) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2805)];
    float _2807 = as_type<float>(_dmw27.x);
    int _2809 = _2725 + 4;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    float _2813 = as_type<float>(_dmw27.y);
    int _2815 = _2725 + 8;
    uint _2817 = uint(int(uint(_2815) >> uint(2)));
    float _2819 = as_type<float>(_dmw27.z);
    int _2821 = _2725 + 12;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    float _2825 = as_type<float>(_dmw27.w);
    float _2827 = _2799;
    if (_2671)
    {
        float _2829 = _2637 ? _2559 : _1915;
        _2593 = _2829;
    }
    float _2831 = _2593;
    if (_2549)
    {
        float _2833 = _2597 ? as_type<float>(_2735) : _1919;
        _2827 = _2833;
    }
    float _2835 = _2827;
    uint _2837 = uint(int(uint(_2737) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2837)];
    float _2839 = as_type<float>(_dmw28.x);
    int _2841 = _2737 + 4;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    float _2845 = as_type<float>(_dmw28.y);
    int _2847 = _2737 + 8;
    uint _2849 = uint(int(uint(_2847) >> uint(2)));
    float _2851 = as_type<float>(_dmw28.z);
    int _2853 = _2737 + 12;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    float _2857 = as_type<float>(_dmw28.w);
    uint _2859 = uint(int(uint(_2699) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2859)];
    float _2861 = as_type<float>(_dmw29.x);
    int _2863 = _2699 + 4;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    float _2867 = as_type<float>(_dmw29.y);
    int _2869 = _2699 + 8;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    float _2873 = as_type<float>(_dmw29.z);
    int _2875 = _2699 + 12;
    uint _2877 = uint(int(uint(_2875) >> uint(2)));
    float _2879 = as_type<float>(_dmw29.w);
    uint _2881 = uint(int(uint(_2741) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2881)];
    float _2883 = as_type<float>(_dmw30.x);
    int _2885 = _2741 + 4;
    uint _2887 = uint(int(uint(_2885) >> uint(2)));
    float _2889 = as_type<float>(_dmw30.y);
    int _2891 = _2741 + 8;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    float _2895 = as_type<float>(_dmw30.z);
    int _2897 = _2741 + 12;
    uint _2899 = uint(int(uint(_2897) >> uint(2)));
    float _2901 = as_type<float>(_dmw30.w);
    uint _2903 = uint(int(uint(_2773) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2903)];
    float _2905 = as_type<float>(_dmw31.x);
    int _2907 = _2773 + 4;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    float _2911 = as_type<float>(_dmw31.y);
    int _2913 = _2773 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    float _2917 = as_type<float>(_dmw31.z);
    int _2919 = _2773 + 12;
    uint _2921 = uint(int(uint(_2919) >> uint(2)));
    float _2923 = as_type<float>(_dmw31.w);
    float _2925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2927 = 0;
    if (_2555)
    {
        float _2929 = -_1919;
        float _2931 = _2929 + 1.0;
        _2927 = as_type<int>(_2931);
    }
    int _2933 = _2927;
    float _2935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_2555)
    {
        _2797 = _1919;
    }
    float _2937 = _2797;
    float _2939 = fma(_2697, _2691, _2801);
    float _2941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2943 = _2937;
    if (_2555)
    {
        float _2945 = _2649 ? as_type<float>(_2933) : _1919;
        _2943 = _2945;
    }
    float _2947 = _2943;
    float _2949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2951 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2953 = fma(_2613, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2939);
    float _2955 = _2803 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2957 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2959 = _2951 * _2925;
    float _2961 = _2947 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2963 = _2957 * _2935;
    float _2965 = _2955 * _2941;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2971 = _2961 * _2949;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2979 = _2953 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2981 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _2959;
    out.m_74.y = _2963;
    out.m_74.z = _2971;
    out.m_74.w = _2965;
    float _2983 = _919 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2985 = _919 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2987 = _919 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2989 = in.m_76.x;
    float _2991 = in.m_76.y;
    float _2993 = in.m_76.z;
    bool _2995 = _875 != 0.0;
    bool _2997 = isnan(_875);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    out.m_78.x = _2975;
    out.m_78.y = _2977;
    out.m_78.z = _2981;
    out.m_78.w = _2979;
    float _3005 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3007 = _877 == 0.0;
    bool _3009 = !_3003;
    bool _3011 = _3007 && _3009;
    float _3013 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3005);
    float _3015 = in.m_80.x;
    float _3017 = in.m_80.y;
    float _3019 = in.m_80.z;
    float _3021 = in.m_80.w;
    float _3023 = abs(_1351);
    float _3025 = log2(_3023);
    bool _3027 = _879 == 0.0;
    bool _3029 = _3027 && _3011;
    float _3031 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3033 = -_899;
    float _3035 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2983);
    out.m_82.x = 1.0;
    out.m_82.y = 1.0;
    out.m_82.z = 1.0;
    float _3037 = -_899;
    float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2985);
    float _3041 = -_899;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2987);
    out.m_84.w = _815;
    float _3045 = 0.0;
    float _3047 = _2989;
    if (_3029)
    {
        _3045 = _2989;
    }
    float _3049 = _3045;
    float _3051 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3031);
    float _3053 = 0.0;
    float _3055 = _3049;
    if (_3029)
    {
        _3053 = _2993;
    }
    float _3057 = _3053;
    float _3059 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3061 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3063 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3065 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3059);
    float _3067 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3069 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3039);
    float _3071 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3073 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3075 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3035);
    float _3077 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3079 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3081 = 0.0;
    float _3083 = _3065;
    float _3085 = _3057;
    if (_3029)
    {
        _3081 = _2991;
    }
    float _3087 = _3081;
    float _3089 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3051);
    float _3091 = _3087;
    if (_3029)
    {
        _1035 = _3049;
    }
    float _3093 = _1035;
    float _3095 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3067);
    float _3097 = _3093;
    if (!_3029)
    {
        _3055 = _2989;
    }
    float _3099 = _3055;
    float _3101 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3013);
    if (_3029)
    {
        _3083 = _3057;
    }
    float _3103 = _3083;
    float _3105 = _3069 * _3017;
    float _3107 = _3103;
    if (!_3029)
    {
        _3085 = _2993;
    }
    float _3109 = _3085;
    float _3111 = exp2(_3063);
    float _3113 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3073);
    float _3115 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3117 = _3075 * _3017;
    float _3119 = _3077 * _3017;
    if (_3029)
    {
        _3047 = _3087;
    }
    float _3121 = _3047;
    float _3123 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3095);
    float _3125 = _3121;
    if (!_3029)
    {
        _3091 = _2991;
    }
    float _3127 = _3091;
    if (!_3029)
    {
        float _3129 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3099);
        _3097 = _3129;
    }
    float _3131 = _3097;
    float _3133 = fma(_3101, _3015, _3105);
    float _3135 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3113);
    float _3137 = fma(_3079, _3015, _3117);
    float _3139 = fma(_3115, _3015, _3119);
    float _3141 = _3019 * _3099;
    float _3143 = _3015 * _3127;
    float _3145 = fma(_3123, _3019, _3133);
    float _3147 = _3017 * _3109;
    float _3149 = fma(_3089, _3019, _3137);
    float _3151 = fma(_3135, _3019, _3139);
    float _3153 = -_3141;
    float _3155 = fma(_3015, _3109, _3153);
    if (!_3029)
    {
        float _3157 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3127);
        _3125 = _3157;
    }
    float _3159 = _3125;
    float _3161 = -_3147;
    float _3163 = fma(_3019, _3127, _3161);
    float _3165 = _3155 * _3021;
    out.m_86.x = _3149;
    out.m_86.y = _3145;
    out.m_86.z = _3151;
    if (!_3029)
    {
        float _3167 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3109);
        _3107 = _3167;
    }
    float _3169 = _3107;
    float _3171 = _3069 * _3159;
    float _3173 = _3075 * _3159;
    float _3175 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3177 = precise::clamp(_3175, 0.0, 1.0);
    float _3179 = -_3143;
    float _3181 = fma(_3017, _3099, _3179);
    float _3183 = _3163 * _3021;
    float _3185 = _3165 * _3075;
    float _3187 = _3165 * _3069;
    float _3189 = _3077 * _3159;
    float _3191 = _3165 * _3077;
    float _3193 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3195 = fma(_3101, _3131, _3171);
    float _3197 = fma(_3079, _3131, _3173);
    float _3199 = _3177 * _3177;
    float _3201 = fma(_3177, -2.0, 3.0);
    float _3203 = _3181 * _3021;
    float _3205 = fma(_3183, _3079, _3185);
    float _3207 = fma(_3183, _3101, _3187);
    float _3209 = fma(_3183, _3115, _3191);
    float _3211 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3193);
    float _3213 = _3199 * _3201;
    float _3215 = fma(_3203, _3123, _3207);
    float _3217 = fma(_3203, _3089, _3205);
    float _3219 = fma(_3203, _3135, _3209);
    float _3221 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3211);
    out.m_88.x = _1019;
    out.m_88.y = _999;
    out.m_88.z = _977;
    float _3223 = -_1943;
    float _3225 = _1935 + _3223;
    float _3227 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3221);
    out.m_90.x = _3217;
    out.m_90.y = _3215;
    out.m_90.z = _3219;
    float _3229 = -_1949;
    float _3231 = _1937 + _3229;
    float _3233 = -_3213;
    float _3235 = _3233 + 1.0;
    float _3237 = _1798 * 0.5;
    float _3239 = _3227 + _1798;
    float _3241 = fma(_1852, -0.5, _3237);
    float _3243 = -_3225;
    float _3245 = _3243 + 1.0;
    out.m_92.x = _895;
    bool _3247 = _1351 <= 8000.0;
    bool _3249 = isnan(_1351);
    bool _3251 = _3247 || _3249;
    bool _3253 = isnan(8000.0);
    bool _3255 = _3251 || _3253;
    float _3257 = float(_3255);
    float _3259 = _1850 + _1798;
    float _3261 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3213);
    float _3263 = _3239 * 0.5;
    float _3265 = -_3231;
    float _3267 = _3265 + 1.0;
    float _3269 = _3231 * _3245;
    out.gl_Position.x = _1850;
    out.gl_Position.y = _1852;
    out.gl_Position.z = _3227;
    out.gl_Position.w = _1798;
    float _3271 = _3259 * 0.5;
    float _3273 = _3257 * _3261;
    float _3275 = _3267 * _3245;
    float _3277 = _3225 * _3267;
    out.m_94.x = _3271;
    out.m_94.y = _3241;
    out.m_94.z = _3263;
    out.m_94.w = _1798;
    float _3279 = _3269 * _2005;
    float _3281 = _3269 * _2037;
    float _3283 = _3269 * _2011;
    float _3285 = _3269 * _2059;
    float _3287 = _3269 * _2023;
    float _3289 = _3269 * _2031;
    float _3291 = _3269 * _2043;
    float _3293 = _3269 * _2065;
    float _3295 = _3269 * _2077;
    float _3297 = fma(_3275, _2085, _3285);
    float _3299 = _3269 * _2117;
    float _3301 = _3269 * _2137;
    float _3303 = _3269 * _2143;
    float _3305 = _3269 * _2163;
    float _3307 = fma(_3275, _2091, _3293);
    float _3309 = _3269 * _2149;
    float _3311 = _3269 * _2111;
    float _3313 = _3269 * _2195;
    float _3315 = fma(_3275, _2219, _3283);
    float _3317 = fma(_3275, _2103, _3295);
    float _3319 = _3231 * _3225;
    float _3321 = _3269 * _2155;
    float _3323 = _3269 * _2169;
    float _3325 = fma(_3277, _2237, _3297);
    float _3327 = _3269 * _2017;
    float _3329 = _3269 * _2049;
    float _3331 = _3269 * _2129;
    float _3333 = _3269 * _2201;
    float _3335 = fma(_3275, _2261, _3301);
    float _3337 = fma(_3275, _2285, _3305);
    float _3339 = fma(_3277, _2243, _3307);
    float _3341 = _3269 * _2071;
    float _3343 = _3269 * _2175;
    float _3345 = fma(_3275, _2315, _3313);
    float _3347 = fma(_3277, _2339, _3315);
    float _3349 = fma(_3277, _2255, _3317);
    float _3351 = _3269 * _2189;
    float _3353 = _3269 * _2207;
    float _3355 = fma(_3275, _2291, _3323);
    float _3357 = fma(_3319, _2357, _3325);
    float _3359 = _3269 * _2123;
    float _3361 = _3269 * _2181;
    float _3363 = fma(_3275, _2321, _3333);
    float _3365 = fma(_3277, _2381, _3337);
    float _3367 = fma(_3319, _2363, _3339);
    float _3369 = fma(_3275, _2297, _3343);
    float _3371 = fma(_3277, _2411, _3345);
    float _3373 = fma(_3319, _2375, _3349);
    float _3375 = fma(_3275, _2309, _3351);
    float _3377 = fma(_3275, _2327, _3353);
    float _3379 = fma(_3277, _2387, _3355);
    float _3381 = _3357 * 0.886227548122406005859375;
    float _3383 = fma(_3275, _2303, _3361);
    float _3385 = fma(_3277, _2417, _3363);
    float _3387 = fma(_3319, _2431, _3365);
    float _3389 = _3367 * 0.886227548122406005859375;
    float _3391 = _3269 * _2459;
    float _3393 = fma(_3277, _2393, _3369);
    float _3395 = fma(_3319, _2481, _3371);
    float _3397 = _3373 * 0.511664927005767822265625;
    float _3399 = fma(_3277, _2405, _3375);
    float _3401 = fma(_3277, _2423, _3377);
    float _3403 = fma(_3319, _2437, _3379);
    float _3405 = precise::max(_3381, 0.00999999977648258209228515625);
    float _3407 = fma(_3277, _2497, _3335);
    float _3409 = fma(_3277, _2399, _3383);
    float _3411 = fma(_3319, _2487, _3385);
    float _3413 = _3387 * 0.511664927005767822265625;
    float _3415 = fma(_3319, _2443, _3393);
    float _3417 = _3395 * 0.511664927005767822265625;
    float _3419 = _3397 * _3397;
    float _3421 = precise::max(_3389, 0.00999999977648258209228515625);
    float _3423 = fma(_3275, _2525, _3391);
    float _3425 = fma(_3319, _2493, _3401);
    float _3427 = _3403 * 0.511664927005767822265625;
    float _3429 = 1.0 / _3405;
    float _3431 = fma(_3319, _2449, _3409);
    float _3433 = _3411 * 0.511664927005767822265625;
    float _3435 = _3415 * 0.511664927005767822265625;
    float _3437 = fma(_3417, _3417, _3419);
    float _3439 = fma(_3319, _2475, _3399);
    float _3441 = _3425 * 0.511664927005767822265625;
    float _3443 = 1.0 / _3421;
    float _3445 = _3413 * _3413;
    float _3447 = _3431 * 0.511664927005767822265625;
    float _3449 = fma(_3435, _3435, _3437);
    float _3451 = fma(_3433, _3433, _3445);
    float _3453 = _3427 * _3427;
    float _3455 = _3439 * 0.511664927005767822265625;
    float _3457 = fma(_3447, _3447, _3451);
    float _3459 = fma(_3441, _3441, _3453);
    float _3461 = sqrt(_3449);
    float _3463 = fma(_3455, _3455, _3459);
    float _3465 = sqrt(_3457);
    float _3467 = sqrt(_3463);
    float _3469 = precise::max(_3461, 0.00999999977648258209228515625);
    float _3471 = fma(_3275, _2097, _3341);
    float _3473 = _3269 * _2471;
    float _3475 = precise::max(_3465, 0.00999999977648258209228515625);
    float _3477 = 1.0 / _3469;
    float _3479 = fma(_3275, _2267, _3303);
    float _3481 = _3269 * _2453;
    float _3483 = _3269 * _2465;
    float _3485 = precise::max(_3467, 0.00999999977648258209228515625);
    float _3487 = 1.0 / _3475;
    float _3489 = fma(_3277, _2249, _3471);
    float _3491 = fma(_3275, _2273, _3309);
    float _3493 = fma(_3275, _2279, _3321);
    float _3495 = fma(_3275, _2213, _3279);
    float _3497 = 1.0 / _3485;
    float _3499 = fma(_3275, _2225, _3327);
    float _3501 = fma(_3275, _2231, _3287);
    float _3503 = fma(_3275, _2565, _3289);
    float _3505 = fma(_3275, _2571, _3281);
    float _3507 = fma(_3275, _2577, _3291);
    float _3509 = fma(_3275, _2583, _3329);
    float _3511 = fma(_3275, _2617, _3311);
    float _3513 = fma(_3275, _2623, _3299);
    float _3515 = fma(_3275, _2629, _3359);
    float _3517 = fma(_3275, _2635, _3331);
    float _3519 = fma(_3275, _2519, _3481);
    float _3521 = fma(_3275, _2531, _3483);
    float _3523 = fma(_3275, _2537, _3473);
    float _3525 = fma(_3319, _2369, _3489);
    float _3527 = fma(_3277, _2503, _3479);
    float _3529 = fma(_3277, _2509, _3491);
    float _3531 = fma(_3277, _2515, _3493);
    float _3533 = fma(_3277, _2333, _3495);
    float _3535 = fma(_3277, _2345, _3499);
    float _3537 = fma(_3277, _2351, _3501);
    float _3539 = fma(_3277, _2703, _3503);
    float _3541 = fma(_3277, _2709, _3505);
    float _3543 = fma(_3277, _2715, _3507);
    float _3545 = fma(_3277, _2721, _3509);
    float _3547 = fma(_3277, _2753, _3511);
    float _3549 = fma(_3277, _2759, _3513);
    float _3551 = fma(_3277, _2765, _3515);
    float _3553 = fma(_3277, _2771, _3517);
    float _3555 = fma(_3277, _2777, _3519);
    float _3557 = fma(_3277, _2783, _3423);
    float _3559 = fma(_3277, _2789, _3521);
    float _3561 = fma(_3277, _2795, _3523);
    float _3563 = _3525 * 0.886227548122406005859375;
    float _3565 = _3397 * _3477;
    float _3567 = fma(_3123, _3169, _3195);
    float _3569 = fma(_3319, _2807, _3407);
    float _3571 = fma(_3319, _2813, _3527);
    float _3573 = fma(_3319, _2819, _3529);
    float _3575 = fma(_3319, _2825, _3531);
    float _3577 = fma(_3319, _2839, _3533);
    float _3579 = fma(_3319, _2845, _3347);
    float _3581 = fma(_3319, _2851, _3535);
    float _3583 = fma(_3319, _2857, _3537);
    float _3585 = fma(_3319, _2861, _3539);
    float _3587 = fma(_3319, _2867, _3541);
    float _3589 = fma(_3319, _2873, _3543);
    float _3591 = fma(_3319, _2879, _3545);
    float _3593 = fma(_3319, _2883, _3547);
    float _3595 = fma(_3319, _2889, _3549);
    float _3597 = fma(_3319, _2895, _3551);
    float _3599 = fma(_3319, _2901, _3553);
    float _3601 = fma(_3319, _2905, _3555);
    float _3603 = fma(_3319, _2911, _3557);
    float _3605 = fma(_3319, _2917, _3559);
    float _3607 = fma(_3319, _2923, _3561);
    float _3609 = precise::max(_3563, 0.00999999977648258209228515625);
    float _3611 = _3469 * _3429;
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = _3475 * _3443;
    float _3617 = precise::clamp(_3615, 0.0, 1.0);
    float _3619 = _3413 * _3487;
    float _3621 = _3417 * _3477;
    float _3623 = fma(_3089, _3169, _3197);
    float _3625 = _3567 * _3565;
    float _3627 = _3427 * _3497;
    float _3629 = _3435 * _3477;
    float _3631 = 1.0 / _3609;
    float _3633 = fma(_3115, _3131, _3189);
    float _3635 = _3433 * _3487;
    float _3637 = fma(_3623, _3621, _3625);
    float _3639 = _3441 * _3497;
    float _3641 = _3567 * _3627;
    float _3643 = _3567 * _3619;
    float _3645 = fma(_3135, _3169, _3633);
    float _3647 = _3613 + 1.0;
    float _3649 = _3447 * _3487;
    float _3651 = fma(_3623, _3635, _3643);
    float _3653 = _3567 * 1.02332699298858642578125;
    float _3655 = _3455 * _3497;
    float _3657 = fma(_3623, _3639, _3641);
    float _3659 = fma(_3645, _3629, _3637);
    float _3661 = 1.0 / _3647;
    float _3663 = _3575 * _3653;
    float _3665 = fma(_3645, _3655, _3657);
    float _3667 = fma(_3659, 0.5, 0.5);
    float _3669 = fma(_3645, _3649, _3651);
    float _3671 = fma(_3665, 0.5, 0.5);
    float _3673 = fma(_3669, 0.5, 0.5);
    float _3675 = _3577 * _3653;
    float _3677 = abs(_3671);
    float _3679 = log2(_3677);
    float _3681 = _3579 * _3653;
    float _3683 = _3595 * _3653;
    float _3685 = _3603 * _3653;
    float _3687 = fma(_3569, 0.88622701168060302734375, _3663);
    float _3689 = abs(_3667);
    float _3691 = log2(_3689);
    float _3693 = fma(_3571, 0.88622701168060302734375, _3675);
    float _3695 = fma(_3573, 0.88622701168060302734375, _3681);
    float _3697 = fma(_3593, 0.88622701168060302734375, _3683);
    float _3699 = _3645 * 1.02332699298858642578125;
    float _3701 = abs(_3673);
    float _3703 = log2(_3701);
    float _3705 = fma(_3601, 0.88622701168060302734375, _3685);
    float _3707 = _3485 * _3631;
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = fma(_3581, _3699, _3687);
    float _3713 = fma(_3583, _3699, _3693);
    float _3715 = fma(_3585, _3699, _3695);
    float _3717 = fma(_3597, _3699, _3697);
    float _3719 = fma(_3605, _3699, _3705);
    float _3721 = _3623 * 1.02332699298858642578125;
    float _3723 = fma(_3613, 2.0, 1.0);
    float _3725 = fma(_3617, 2.0, 1.0);
    float _3727 = fma(_3709, 2.0, 1.0);
    float _3729 = fma(_3599, _3721, _3717);
    float _3731 = _3723 * _3691;
    float _3733 = _3727 * _3679;
    float _3735 = _3725 * _3703;
    float _3737 = _3729 * 0.31830990314483642578125;
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = fma(_3587, _3721, _3711);
    float _3743 = _3617 + 1.0;
    float _3745 = _3709 + 1.0;
    float _3747 = exp2(_3731);
    float _3749 = _3739 * 0.88622701168060302734375;
    float _3751 = fma(_3589, _3721, _3713);
    float _3753 = fma(_3591, _3721, _3715);
    float _3755 = fma(_3607, _3721, _3719);
    float _3757 = exp2(_3735);
    float _3759 = precise::max(0.0, _3741);
    float _3761 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _3763 = exp2(_3733);
    float _3765 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[17].x, _3761);
    float _3767 = -_3613;
    float _3769 = _3767 + 1.0;
    float _3771 = 1.0 / _3743;
    float _3773 = -_3617;
    float _3775 = _3773 + 1.0;
    float _3777 = 1.0 / _3745;
    float _3779 = _3755 * 0.31830990314483642578125;
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = fma(_3613, 2.0, 2.0);
    float _3785 = fma(_3617, 2.0, 2.0);
    float _3787 = fma(_3709, 2.0, 2.0);
    float _3789 = precise::max(0.0, _3751);
    float _3791 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _3793 = -_3709;
    float _3795 = _3793 + 1.0;
    float _3797 = _3783 * _3747;
    float _3799 = -_3781;
    float _3801 = _3799 + 1.0;
    float _3803 = _3785 * _3757;
    float _3805 = _3787 * _3763;
    float _3807 = in.m_96.x;
    float _3809 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_98.x = _3623;
    out.m_98.y = _3567;
    out.m_98.z = _3645;
    float _3811 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[659].w, _3781);
    out.m_100.x = _1339;
    out.m_100.y = _1337;
    out.m_100.z = _1341;
    float _3813 = fma(_3789, (*spvDescriptorSet0.vp_c15)._m0[17].y, _3791);
    out.m_102.x = 0.0;
    float _3815 = _3769 * _3661;
    float _3817 = _3775 * _3771;
    float _3819 = _3795 * _3777;
    float _3821 = -_3797;
    float _3823 = _3821 + 1.0;
    float _3825 = -_3803;
    float _3827 = _3825 + 1.0;
    float _3829 = -_3805;
    float _3831 = _3829 + 1.0;
    bool _3833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3835 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _3837 = precise::max(0.0, _3753);
    float _3839 = fma(_3815, _3823, _3797);
    float _3841 = fma(_3817, _3827, _3803);
    float _3843 = fma(_3819, _3831, _3805);
    float _3845 = exp2(_3809);
    float _3847 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[17].z, _3835);
    float _3849 = _3381 * _3839;
    float _3851 = _3389 * _3841;
    float _3853 = _3811 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _3855 = _3563 * _3843;
    float _3857 = fma(_3849, _3853, _3765);
    float _3859 = fma(_3851, _3853, _3813);
    float _3861 = fma(_3855, _3853, _3847);
    float _3863 = _1411 * _1465;
    float _3865 = _3857 * 0.31830990314483642578125;
    float _3867 = _3859 * 0.31830990314483642578125;
    float _3869 = _3861 * 0.31830990314483642578125;
    bool _3871 = !_3833;
    if (!_3871)
    {
        float _3873 = -_1337;
        float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3877 = -_1339;
        float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3881 = -_1341;
        float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3885 = _3875 * _3875;
        float _3887 = fma(_3879, _3879, _3885);
        float _3889 = fma(_3883, _3883, _3887);
        float _3891 = sqrt(_3889);
        float _3893 = rsqrt(_3889);
        float _3895 = -_3891;
        float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3899 = _3897 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3901 = precise::clamp(_3899, 0.0, 1.0);
        float _3903 = _3879 * _3893;
        float _3905 = _3875 * _3893;
        float _3907 = abs(_3901);
        float _3909 = log2(_3907);
        float _3911 = _3883 * _3893;
        float _3913 = _3903 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3915 = _3567 * _3905;
        float _3917 = -_3905;
        float _3919 = -_3913;
        float _3921 = fma(_3917, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3919);
        float _3923 = fma(_3623, _3903, _3915);
        float _3925 = -_3911;
        float _3927 = fma(_3925, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3921);
        float _3929 = fma(_3645, _3911, _3923);
        float _3931 = precise::clamp(_3929, 0.0, 1.0);
        float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3935 = _3927 + _3933;
        float _3937 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3939 = _3935 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3941 = precise::clamp(_3939, 0.0, 1.0);
        float _3943 = exp2(_3937);
        float _3945 = _3943 * _3941;
        float _3947 = _3931 * _3945;
        float _3949 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3951 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3953 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3949;
        out.m_102.y = _3951;
        out.m_102.z = _3953;
    }
    float _3955 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3957 = -_3845;
    float _3959 = _3957 + 1.0;
    float _3961 = -_1886;
    float _3963 = _3961 + 1.0;
    float _3965 = _3863 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3967 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3969 = _3963 * _3955;
    float _3971 = precise::clamp(_3969, 0.0, 1.0);
    bool _3973 = _1411 > 0.0;
    bool _3975 = isnan(_1411);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan(0.0);
    bool _3981 = _3977 || _3979;
    float _3983 = _3965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3985 = _3967 * _1888;
    float _3987 = -_3971;
    float _3989 = fma(_3987, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _3991 = _1465 <= 0.0;
    bool _3993 = !_3981;
    bool _3995 = _3991 || _3993;
    float _3997 = -_3967;
    float _3999 = _3997 + 1.0;
    float _4001 = _1899 * _3985;
    float _4003 = _3989 * _3807;
    float _4005 = _1909 * _3985;
    out.m_56.x = _3983;
    float _4007 = fma(_1905, _4001, _1893);
    float _4009 = fma(_1907, _4001, _1895);
    float _4011 = _4003 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4013 = _1899 * _3999;
    float _4015 = fma(_1899, _4005, _1897);
    out.m_84.x = _3865;
    out.m_84.y = _3867;
    out.m_84.z = _3869;
    out.m_104.x = _4011;
    out.m_106.x = _4007;
    out.m_106.y = _4009;
    out.m_106.z = _4015;
    out.m_106.w = _4013;
    if (!_3995)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _4017 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4017;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _463 = false;
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
        float _4074 = as_type<float>(_141);
        out.gl_Position.z = _4074;
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
        float _4144 = as_type<float>(_179);
        out.gl_Position.z = _4144;
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
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
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
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _367 + _369;
    bool _373 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_367);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _389 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_367);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    float _405 = -_383;
    float _407 = _405 + 1.0;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _411 = 1.0 / _387;
    float _413 = _399 * _407;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _421 = _403 * _411;
    float _423 = fma(_421, _371, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _427 = _423 * _413;
    float _429 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[115].x, _427);
    float _431 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _435 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[116].x, _429);
    float _437 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _431;
    out.m_66.y = _439;
    out.m_66.z = _437;
    out.m_66.w = _441;
    bool _443 = !_409;
    float _461;
    if (!_443)
    {
        float _445 = in.m_62.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_125);
        float _467 = 1.0 / _465;
        float _469 = _159 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = in.m_53.x;
    float _475 = in.m_53.y;
    float _477 = in.m_53.z;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _485 = in.m_62.z;
    float _487 = _483 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _489 = in.m_62.y;
    float _491 = in.m_62.x;
    float _493 = _481 * _159;
    float _495 = _475 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _497 = _475 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _499 = _475 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _501 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].x, _495);
    float _503 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].x, _497);
    float _505 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].x, _499);
    float _507 = _485 * 2.0;
    float _509 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[5].z, _501);
    float _511 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[4].z, _503);
    float _513 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[6].z, _505);
    float _515 = _489 * 2.0;
    float _517 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _519 = _511 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _521 = _513 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _523 = floor(_507);
    float _525 = -_517;
    float _527 = _525 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _529 = -_519;
    float _531 = _529 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _491 * 2.0;
    float _535 = _527 * _527;
    float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _539 = _521 + _537;
    float _541 = floor(_533);
    float _543 = fma(_531, _531, _535);
    float _545 = -_521;
    float _547 = _545 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _549 = _489 + _485;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    float _563 = fma(_547, _547, _543);
    float _565 = _549 + (-1.0);
    float _567 = floor(_515);
    bool _569 = _523 >= 0.0;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    float _579 = _491 + _489;
    float _581 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _583 = _523 > 0.0;
    int _585 = _577 ? 0 : 1;
    float _587 = _579 + (-1.0);
    float _589 = sqrt(_563);
    bool _591 = _541 >= 0.0;
    bool _593 = isnan(_541);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    bool _601 = _541 > 0.0;
    int _603 = _599 ? 0 : 1;
    float _605 = exp2(_493);
    bool _607 = _567 > 0.0;
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _611 = _567 >= 0.0;
    bool _613 = isnan(_567);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    int _621 = _619 ? 0 : 1;
    float _623 = abs(_589);
    float _625 = precise::max(_623, 50.0);
    bool _627 = !_561;
    int _629 = _627 ? 0 : 1;
    float _631 = precise::min(_625, 200.0);
    int _633 = ~_585;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = -_605;
    float _641 = _639 + 1.0;
    int _643 = ~_621;
    int _645 = _643 + 1;
    int _647 = _645 + 1;
    float _649 = fma(_631, 0.006666666828095912933349609375, -0.3333333432674407958984375);
    bool _651 = !_553;
    int _653 = _651 ? 0 : 1;
    int _655 = _637;
    int _657 = _647;
    bool _659 = _557;
    if (!_583)
    {
        int _661 = ~_585;
        int _663 = _661 + 1;
        _655 = _663;
    }
    int _665 = _655;
    if (!_607)
    {
        int _667 = ~_621;
        int _669 = _667 + 1;
        _657 = _669;
    }
    int _671 = _657;
    int _673 = abs(_629);
    float _675 = in.m_68.x;
    float _677 = in.m_68.y;
    float _679 = in.m_68.z;
    bool _681 = !_557;
    int _683 = _681 ? 0 : 1;
    float _685 = -_649;
    float _687 = _517 + _685;
    int _689 = ~_603;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    int _695 = _693;
    if (!_601)
    {
        int _697 = ~_603;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _705 = 1.0 + _703;
    int _707 = abs(_653);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _711 = _687 + _709;
    int _713 = abs(_683);
    float _715 = 1.0 / _705;
    float _717 = float(_707);
    float _719 = _711 * _711;
    float _721 = float(_673);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _519 + _723;
    bool _727 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(1.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    bool _737 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _745 = _741 || _743;
    float _747 = fma(_725, _725, _719);
    float _749 = float(_713);
    float _751 = float(_701);
    float _753 = fma(_539, _539, _747);
    float _755 = float(_665);
    float _757 = _745 ? _641 : 0.0;
    float _759 = _749 * _751;
    float _761 = float(_671);
    float _763 = _717 * _755;
    float _765 = _759 * (-2.0);
    if (_735)
    {
        float _767 = _757 * _715;
        _161 = _767;
    }
    float _769 = _161;
    float _771 = sqrt(_753);
    float _773 = _763 * (-2.0);
    float _775 = fma(_765, _677, _677);
    float _777 = _489 + (-0.5);
    float _779 = fma(_581, _765, _581);
    float _781 = fma(_609, _773, _609);
    float _783 = fma(_773, _675, _675);
    float _785 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].y, _775);
    float _787 = _491 + (-0.5);
    float _789 = rsqrt(_753);
    float _791 = _721 * _761;
    float _793 = fma(_779, _769, _785);
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[196].x, _783);
    float _797 = _491 + _485;
    float _799 = _791 * (-2.0);
    float _801 = _771 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _803 = _797 + (-1.0);
    float _805 = _793 * 0.15915493667125701904296875;
    float _807 = fma(_799, _679, _679);
    float _809 = in.m_70.x;
    float _811 = in.m_70.y;
    float _813 = in.m_70.z;
    float _815 = precise::min(_487, _801);
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _819 = _485 + (-0.5);
    float _821 = fma(_781, _769, _795);
    float _823 = _805 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = _789 * _815;
    float _829 = fma(_817, _799, _817);
    float _831 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _807);
    float _833 = _821 * 0.15915493667125701904296875;
    float _835 = _711 * _827;
    float _837 = _725 * _827;
    float _839 = _539 * _827;
    float _841 = fma(_829, _769, _831);
    float _843 = -_835;
    float _845 = _711 + _843;
    float _847 = -_837;
    float _849 = _725 + _847;
    float _851 = -_839;
    float _853 = _539 + _851;
    float _855 = _841 * 0.15915493667125701904296875;
    float _857 = _845 * _845;
    float _859 = _805 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = fma(_849, _849, _857);
    float _867 = fma(_649, 0.2999999523162841796875, 1.0);
    float _869 = fma(_853, _853, _865);
    float _871 = _855 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _867 * _811;
    float _877 = _867 * _809;
    float _879 = _867 * _813;
    float _881 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _883 = sqrt(_869);
    float _885 = _833 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _833 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _789 * _883;
    float _895 = _483 * _893;
    float _897 = _855 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = _887 * _861;
    float _903 = _887 * _825;
    float _905 = _887 * _873;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _875);
    float _909 = _863 * _893;
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _877);
    float _913 = _881 * _893;
    float _915 = _891 * _861;
    float _917 = _891 * _825;
    float _919 = _891 * _873;
    float _921 = _909 * _907;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _879);
    float _925 = _895 * _911;
    float _927 = _861 * _873;
    float _929 = _919 * _921;
    float _931 = fma(_899, _915, _903);
    float _933 = _913 * _923;
    float _935 = -_901;
    float _937 = fma(_899, _917, _935);
    float _939 = -_921;
    float _941 = _899 * _939;
    float _943 = fma(_931, _925, _929);
    float _945 = -_917;
    float _947 = fma(_899, _901, _945);
    float _949 = _825 * _873;
    float _951 = _905 * _921;
    float _953 = fma(_927, _925, _941);
    float _955 = fma(_937, _933, _943);
    float _957 = fma(_899, _903, _915);
    float _959 = fma(_947, _925, _951);
    float _961 = fma(_949, _933, _953);
    float _963 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _965 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = fma(_957, _933, _959);
    float _969 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _963);
    float _973 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _975 = -_839;
    float _977 = _521 + _975;
    float _979 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _969);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _971);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _973);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _979);
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _991 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _993 = _521 + _987;
    float _995 = _519 + _989;
    float _997 = -_835;
    float _999 = _687 + _997;
    float _1001 = _687 + _991;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _993 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _995 + _1007;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1013 = _1005 * _1005;
    float _1015 = fma(_1009, _1009, _1013);
    float _1017 = -_837;
    float _1019 = _519 + _1017;
    float _1021 = sqrt(_1015);
    float _1023 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1011);
    float _1025 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    bool _1027 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1023;
    float _1031 = _991;
    float _1033 = _995;
    float _1035 = _905;
    if (!_1027)
    {
        _1029 = _993;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1027)
    {
        _1031 = _1001;
    }
    float _1041 = _1031;
    bool _1043 = !_1027;
    float _1045 = _1041;
    if (!_1043)
    {
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1051 = _1021 + _1049;
        float _1053 = _1001 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = rsqrt(_1015);
        float _1057 = _1051 * _1047;
        float _1059 = _1057 * 0.15915493667125701904296875;
        float _1061 = _1059 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1059 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 + (-1.0);
        float _1071 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = fma(_1067, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = fma(_1001, _1063, _1071);
        float _1077 = _1055 * _1073;
        float _1079 = fma(_1009, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1081 = fma(_1005, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1075;
        _1033 = _1079;
        _1039 = _1081;
    }
    float _1083 = _1045;
    float _1085 = _1033;
    float _1087 = _1039;
    float _1089 = -_687;
    float _1091 = _1089 + _1083;
    float _1093 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1095 = -_519;
    float _1097 = _1095 + _1085;
    float _1099 = _1091 * _1091;
    float _1101 = _999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1103 = -_521;
    float _1105 = _1103 + _1087;
    float _1107 = fma(_1019, 0.008000000379979610443115234375, 64.0);
    float _1109 = fma(_1097, _1097, _1099);
    float _1111 = 1.0 / _1093;
    float _1113 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1101);
    float _1115 = -_837;
    float _1117 = _1115 + _1085;
    float _1119 = fma(_1105, _1105, _1109);
    float _1121 = precise::max(0.0, _1107);
    float _1123 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1125 = fma(_977, 0.008000000379979610443115234375, 64.0);
    float _1127 = -_835;
    float _1129 = _1127 + _1083;
    float _1131 = sqrt(_1119);
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1135 = precise::min(_1121, 127.0);
    float _1137 = -_839;
    float _1139 = _1137 + _1087;
    float _1141 = precise::max(0.0, _1125);
    float _1143 = _1133 + _1093;
    bool _1145 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1147 = isnan(0.5);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    float _1155 = trunc(_1135);
    int _1157 = int(_1155);
    float _1159 = precise::min(_1141, 127.0);
    float _1161 = _1143 * _1111;
    float _1163 = _1161 * 0.5;
    bool _1165 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1167 = isnan(0.5);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1173 = _1169 || _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1177 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1175);
    float _1179 = trunc(_1159);
    int _1181 = int(_1179);
    bool _1183 = _1131 > 0.0;
    float _1185 = 1.0 / _1177;
    float _1187 = _1085;
    float _1189 = _1083;
    float _1191 = _1087;
    float _1193 = _1159;
    if (!_1183)
    {
        _1187 = _1117;
    }
    float _1195 = _1187;
    int _1197 = _1181 << 7;
    int _1199 = _1197 + _1157;
    float _1201 = _1195;
    float _1203 = _1195;
    if (!_1183)
    {
        _1189 = _1129;
    }
    float _1205 = _1189;
    float _1207 = _1205;
    if (!_1183)
    {
        _1191 = _1139;
    }
    float _1209 = _1191;
    bool _1211 = !_1183;
    float _1213 = _1209;
    if (!_1211)
    {
        float _1215 = _203 * _203;
        float _1217 = fma(_201, _201, _1215);
        float _1219 = fma(_205, _205, _1217);
        float _1221 = rsqrt(_1119);
        float _1223 = sqrt(_1219);
        float _1225 = _1097 * _1221;
        float _1227 = _1091 * _1221;
        float _1229 = _1105 * _1221;
        bool _1231 = _1223 > 0.0;
        float _1233 = _1223;
        float _1235 = _1221;
        if (!_1231)
        {
            _1201 = _1117;
        }
        float _1237 = _1201;
        _1203 = _1237;
        if (!_1231)
        {
            _1233 = _1129;
        }
        float _1239 = _1233;
        _1207 = _1239;
        if (!_1231)
        {
            _1235 = _1139;
        }
        float _1241 = _1235;
        bool _1243 = !_1231;
        _1213 = _1241;
        if (!_1243)
        {
            float _1245 = rsqrt(_1219);
            float _1247 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1249 = _203 * _1245;
            float _1251 = _201 * _1245;
            float _1253 = _1227 * _1249;
            float _1255 = _205 * _1245;
            float _1257 = fma(_1225, _1251, _1253);
            float _1259 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1261 = fma(_1229, _1255, _1257);
            float _1263 = _1261 * _1259;
            float _1265 = fma(_201, _1263, _1117);
            float _1267 = fma(_203, _1263, _1129);
            float _1269 = fma(_205, _1263, _1139);
            _1203 = _1265;
            _1207 = _1267;
            _1213 = _1269;
        }
    }
    float _1271 = _1203;
    float _1273 = _1207;
    float _1275 = _1213;
    int _1277 = _1199 << 4;
    float _1279 = _1275;
    if (_1153)
    {
        _209 = _1271;
    }
    float _1281 = _209;
    float _1283 = _1281;
    if (_1153)
    {
        _211 = _1273;
    }
    float _1285 = _211;
    float _1287 = _1285;
    if (_1153)
    {
        _213 = _1275;
    }
    float _1289 = _213;
    float _1291 = _1289;
    if (!_1153)
    {
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1295 = _999 + _1293;
        float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1299 = _1019 + _1297;
        float _1301 = -_1019;
        float _1303 = _1301 + _1271;
        float _1305 = -_999;
        float _1307 = _1305 + _1273;
        float _1309 = _1295 * _1295;
        float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1313 = _977 + _1311;
        float _1315 = -_977;
        float _1317 = _1315 + _1275;
        float _1319 = fma(_1299, _1299, _1309);
        float _1321 = fma(_1313, _1313, _1319);
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1325 = sqrt(_1321);
        float _1327 = precise::min(_1325, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1329 = _1327 * _1323;
        float _1331 = fma(_1303, _1329, _1019);
        float _1333 = fma(_1307, _1329, _999);
        float _1335 = fma(_1317, _1329, _977);
        _1287 = _1333;
        _1283 = _1331;
        _1291 = _1335;
        _1279 = _1317;
    }
    float _1337 = _1287;
    float _1339 = _1283;
    float _1341 = _1291;
    float _1343 = _1279;
    float _1345 = _1343;
    if (_1173)
    {
        _1345 = 1.0;
    }
    float _1347 = _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1351 = _1185 * _1349;
    float _1353 = 0.0;
    float _1355 = _1347;
    if (_1173)
    {
        _1353 = 1.0;
    }
    float _1357 = _1353;
    int _1359 = _1277 + 8;
    float _1361 = _1357;
    if (!_1173)
    {
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = _1365 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1371;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1405 = fma(_1351, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        _1355 = _1409;
    }
    float _1411 = _1355;
    if (!_1173)
    {
        float _1413 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1419 = _1415 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        float _1423 = _1417 * 0.15915493667125701904296875;
        float _1425 = _1415 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = 1.0 / _1421;
        float _1431 = _1423 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1427 * _1429;
        float _1437 = _1423 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = 1.0 / _1441;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1445;
        float _1449 = 1.0 / _1447;
        float _1451 = _1439 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = fma(_1351, _1451, _1453);
        float _1457 = _1455 * _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + 1.0;
        _1361 = _1463;
    }
    float _1465 = _1361;
    uint _1468 = uint(int(uint(_1359) >> uint(2)));
    float _1470 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1468)]);
    float _1472 = floor(_1135);
    int _1474 = _1277 + 12;
    uint _1476 = uint(int(uint(_1277) >> uint(2)));
    float _1478 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1476)]);
    uint _1480 = uint(int(uint(_1474) >> uint(2)));
    float _1482 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1480)]);
    float _1484 = -_1472;
    float _1486 = _1135 + _1484;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = _1470 + _1486;
    float _1492 = trunc(_1490);
    int _1494 = int(_1492);
    int _1496 = _1157 + _1494;
    int _1498 = _1181 << 7;
    int _1500 = _1498 + _1496;
    int _1502 = _1500 << 4;
    float _1504 = floor(_1159);
    int _1506 = _1502 + 12;
    uint _1508 = uint(int(uint(_1502) >> uint(2)));
    float _1510 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1508)]);
    uint _1512 = uint(int(uint(_1506) >> uint(2)));
    float _1514 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1512)]);
    float _1516 = -_1504;
    float _1518 = _1159 + _1516;
    float _1520 = _1470 + _1518;
    float _1522 = trunc(_1520);
    int _1524 = int(_1522);
    int _1526 = _1181 + _1524;
    int _1528 = _1526 << 7;
    int _1530 = _1528 + _1157;
    int _1532 = _1526 << 7;
    int _1534 = _1532 + _1496;
    int _1536 = _1530 << 4;
    int _1538 = _1534 << 4;
    int _1540 = _1536 + 12;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1337 + _1542;
    int _1546 = _1538 + 12;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1339 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1554 = _1341 + _1552;
    uint _1556 = uint(int(uint(_1540) >> uint(2)));
    float _1558 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1556)]);
    uint _1560 = uint(int(uint(_1546) >> uint(2)));
    float _1562 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1560)]);
    float _1564 = _1544 * _1544;
    uint _1566 = uint(int(uint(_1536) >> uint(2)));
    float _1568 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1566)]);
    float _1570 = fma(_1550, _1550, _1564);
    uint _1572 = uint(int(uint(_1538) >> uint(2)));
    float _1574 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1572)]);
    float _1576 = fma(_1554, _1554, _1570);
    float _1578 = rsqrt(_1576);
    float _1580 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = _1550 * _1580;
    float _1584 = _1554 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 + _1588;
    float _1592 = sqrt(_1590);
    bool _1594 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1592 + _1596;
    float _1600 = _1554;
    float _1602 = _1598;
    float _1604 = _1580;
    float _1606 = as_type<float>(_1538);
    if (_1594)
    {
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1608;
    }
    float _1610 = _1600;
    if (_1594)
    {
        float _1612 = _1598 * _1610;
        _1602 = _1612;
    }
    float _1614 = _1602;
    if (_1594)
    {
        float _1616 = _1614 * 0.15915493667125701904296875;
        _1193 = _1616;
    }
    float _1618 = _1193;
    float _1620 = _1578;
    if (_1594)
    {
        float _1622 = _1618 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1620 = _1624;
    }
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1630 = _1610;
    if (_1594)
    {
        float _1632 = _1618 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = precise::max(0.0, _1628);
    float _1640 = _1590;
    float _1642 = _1638;
    if (_1594)
    {
        float _1644 = rsqrt(_1590);
        _1640 = _1644;
    }
    float _1646 = _1640;
    float _1648 = -_1580;
    float _1650 = -_1638;
    float _1652 = fma(_1544, _1648, _1650);
    float _1654 = _1652;
    if (_1594)
    {
        float _1656 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1656;
    }
    float _1658 = _1642;
    float _1660 = _1658;
    float _1662 = _1626;
    if (_1594)
    {
        float _1664 = _1626 + (-1.0);
        _1604 = _1664;
    }
    float _1666 = _1604;
    float _1668 = sqrt(_1576);
    float _1670 = _1636;
    float _1672 = _1666;
    if (_1594)
    {
        float _1674 = fma(_1636, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = _1676;
    if (_1594)
    {
        float _1680 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1680;
    }
    float _1682 = _1672;
    if (_1594)
    {
        float _1684 = _1646 * _1676;
        _1606 = _1684;
    }
    float _1686 = _1606;
    if (!_1594)
    {
        _1678 = _1582;
    }
    float _1688 = _1678;
    float _1690 = _1688;
    if (_1594)
    {
        float _1692 = fma(_1652, _1626, _1682);
        _1654 = _1692;
    }
    float _1694 = _1654;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1594)
    {
        float _1698 = _1582 * _1686;
        _1690 = _1698;
    }
    float _1700 = _1690;
    if (!_1594)
    {
        _1660 = _1584;
    }
    float _1702 = _1660;
    float _1704 = _1702;
    if (_1594)
    {
        float _1706 = _1584 * _1686;
        _1704 = _1706;
    }
    float _1708 = _1704;
    if (!_1594)
    {
        _1662 = _1586;
    }
    float _1710 = _1662;
    float _1712 = _1710;
    if (_1594)
    {
        float _1714 = _1700 * _1700;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1019, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1720 = fma(_1694, _1694, _1716);
    if (!_1594)
    {
        _1696 = _1588;
    }
    float _1722 = _1696;
    float _1724 = _1722;
    if (_1594)
    {
        float _1726 = _1708 * _1708;
        _1724 = _1726;
    }
    float _1728 = _1724;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1668, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1738 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1740 = _1720 + _1728;
    float _1742 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1744 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1736);
    float _1748 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1742);
    float _1750 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1752 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1746);
    float _1754 = rsqrt(_1740);
    float _1756 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1748);
    float _1758 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1750);
    float _1760 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1762 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1760);
    float _1770 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1772 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1774 = -_1734;
    float _1776 = _1774 + 1.0;
    float _1778 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1768);
    float _1780 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1770);
    float _1782 = -_1772;
    float _1784 = fma(_1782, _1488, 1.0);
    float _1786 = abs(_1776);
    float _1788 = log2(_1786);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1780);
    float _1794 = _1754 * _1700;
    float _1796 = _1754 * _1694;
    float _1798 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1802 = _1754 * _1708;
    float _1804 = -_1800;
    float _1806 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1804);
    float _1808 = floor(_1718);
    float _1810 = -_1802;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1806);
    float _1814 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1816 = fma(_1812, -0.5, 0.5);
    float _1818 = exp2(_1814);
    float _1820 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1822 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1824 = log2(_1784);
    float _1826 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1820);
    float _1828 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1822);
    float _1830 = 1.0 / _1798;
    float _1832 = fma(_1812, 0.5, 0.5);
    float _1834 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1826);
    float _1836 = sqrt(_1816);
    float _1838 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = floor(_1738);
    float _1842 = -_1808;
    float _1844 = _1718 + _1842;
    float _1846 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1848 = _1796 + 1.0;
    float _1850 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1834);
    float _1852 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1854 = fma(_1832, _1846, -0.212114393711090087890625);
    float _1856 = -_1796;
    float _1858 = fma(_1818, _1848, _1856);
    float _1860 = _1824 * 0.693147182464599609375;
    float _1862 = _1850 * _1830;
    float _1864 = _1852 * _1830;
    float _1866 = fma(_1832, _1854, 1.570728778839111328125);
    float _1868 = _1836 * 0.636619746685028076171875;
    float _1870 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1872 = fma(_1862, 0.5, 0.5);
    float _1874 = fma(_1864, -0.5, 0.5);
    float _1876 = -_1840;
    float _1878 = _1738 + _1876;
    float _1880 = -_1866;
    float _1882 = fma(_1868, _1880, 1.0);
    float _1884 = fma(_1858, 0.5, 0.5);
    float2 _6769 = float2(_1844, _1878);
    float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6769, float2(0.0), isnan(_6769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6769, float2(0.0), isnan(_6769)), level(0.0)).x;
    float3 _6780 = float3(_1872, _1874, _1870);
    float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float3 _6791 = float3(_1872, _1874, _1870);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6791, float3(0.0), isnan(_6791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6791, float3(0.0), isnan(_6791)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _6807 = float2(_1882, _1884);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6807, float2(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6807, float2(0.0), isnan(_6807)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = floor(_1490);
    float _1913 = _1518 * _1514;
    float _1915 = in.m_72.y;
    float _1917 = in.m_62.w;
    float _1919 = in.m_72.x;
    float _1921 = -_1911;
    float _1923 = _1490 + _1921;
    float _1925 = _1923 * _1514;
    float _1927 = floor(_1913);
    float _1929 = floor(_1925);
    float _1931 = fma(_1514, _1927, _1929);
    float _1933 = floor(_1520);
    float _1935 = _1518 * _1482;
    float _1937 = _1486 * _1482;
    float _1939 = _1486 * _1558;
    float _1941 = _1923 * _1562;
    float _1943 = floor(_1935);
    float _1945 = -_1933;
    float _1947 = _1520 + _1945;
    float _1949 = floor(_1937);
    float _1951 = _1947 * _1558;
    float _1953 = _1947 * _1562;
    float _1955 = floor(_1951);
    float _1957 = floor(_1939);
    float _1959 = floor(_1941);
    float _1961 = floor(_1953);
    float _1963 = fma(_1482, _1943, _1949);
    float _1965 = fma(_1558, _1955, _1957);
    float _1967 = trunc(_1931);
    int _1969 = int(_1967);
    float _1971 = trunc(_1963);
    int _1973 = int(_1971);
    float _1975 = fma(_1562, _1961, _1959);
    float _1977 = trunc(_1965);
    int _1979 = int(_1977);
    int _1981 = as_type<int>(_1510) + _1969;
    float _1983 = trunc(_1975);
    int _1985 = int(_1983);
    int _1987 = _1981 * 656;
    int _1989 = as_type<int>(_1478) + _1973;
    int _1991 = _1987 + 262160;
    int _1993 = _1989 * 656;
    int _1995 = as_type<int>(_1568) + _1979;
    int _1997 = _1987 + 262176;
    int _1999 = _1987 + 262192;
    int _2001 = _1995 * 656;
    uint _2003 = uint(int(uint(_1991) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2003)];
    float _2005 = as_type<float>(_dmw1.x);
    int _2007 = _1991 + 4;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    float _2011 = as_type<float>(_dmw1.y);
    int _2013 = _1991 + 8;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    float _2017 = as_type<float>(_dmw1.z);
    int _2019 = _1991 + 12;
    uint _2021 = uint(int(uint(_2019) >> uint(2)));
    float _2023 = as_type<float>(_dmw1.w);
    int _2025 = as_type<int>(_1574) + _1985;
    int _2027 = _1993 + 262192;
    uint _2029 = uint(int(uint(_1997) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2029)];
    float _2031 = as_type<float>(_dmw2.x);
    int _2033 = _1997 + 4;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    float _2037 = as_type<float>(_dmw2.y);
    int _2039 = _1997 + 8;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    float _2043 = as_type<float>(_dmw2.z);
    int _2045 = _1997 + 12;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    float _2049 = as_type<float>(_dmw2.w);
    int _2051 = _1987 + 262240;
    int _2053 = _2025 * 656;
    int _2055 = _1987 + 262144;
    uint _2057 = uint(int(uint(_1999) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2057)];
    float _2059 = as_type<float>(_dmw3.x);
    int _2061 = _1999 + 4;
    uint _2063 = uint(int(uint(_2061) >> uint(2)));
    float _2065 = as_type<float>(_dmw3.y);
    int _2067 = _1999 + 8;
    uint _2069 = uint(int(uint(_2067) >> uint(2)));
    float _2071 = as_type<float>(_dmw3.z);
    int _2073 = _1999 + 12;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    float _2077 = as_type<float>(_dmw3.w);
    int _2079 = _1987 + 262208;
    int _2081 = _1987 + 262224;
    uint _2083 = uint(int(uint(_2027) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2083)];
    float _2085 = as_type<float>(_dmw11.x);
    int _2087 = _2027 + 4;
    uint _2089 = uint(int(uint(_2087) >> uint(2)));
    float _2091 = as_type<float>(_dmw11.y);
    int _2093 = _2027 + 8;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    float _2097 = as_type<float>(_dmw11.z);
    int _2099 = _2027 + 12;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    float _2103 = as_type<float>(_dmw11.w);
    int _2105 = _1993 + 262160;
    int _2107 = _2001 + 262192;
    uint _2109 = uint(int(uint(_2051) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2109)];
    float _2111 = as_type<float>(_dmw6.x);
    int _2113 = _2051 + 4;
    uint _2115 = uint(int(uint(_2113) >> uint(2)));
    float _2117 = as_type<float>(_dmw6.y);
    int _2119 = _2051 + 8;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    float _2123 = as_type<float>(_dmw6.z);
    int _2125 = _2051 + 12;
    uint _2127 = uint(int(uint(_2125) >> uint(2)));
    float _2129 = as_type<float>(_dmw6.w);
    int _2131 = _1993 + 262144;
    int _2133 = _1993 + 262208;
    uint _2135 = uint(int(uint(_2055) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2135)];
    float _2137 = as_type<float>(_dmw0.x);
    int _2139 = _2055 + 4;
    uint _2141 = uint(int(uint(_2139) >> uint(2)));
    float _2143 = as_type<float>(_dmw0.y);
    int _2145 = _2055 + 8;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    float _2149 = as_type<float>(_dmw0.z);
    int _2151 = _2055 + 12;
    uint _2153 = uint(int(uint(_2151) >> uint(2)));
    float _2155 = as_type<float>(_dmw0.w);
    int _2157 = _2001 + 262160;
    int _2159 = _1987 + 262256;
    uint _2161 = uint(int(uint(_2079) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2161)];
    float _2163 = as_type<float>(_dmw4.x);
    int _2165 = _2079 + 4;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    float _2169 = as_type<float>(_dmw4.y);
    int _2171 = _2079 + 8;
    uint _2173 = uint(int(uint(_2171) >> uint(2)));
    float _2175 = as_type<float>(_dmw4.z);
    int _2177 = _2079 + 12;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    float _2181 = as_type<float>(_dmw4.w);
    int _2183 = _1993 + 262224;
    int _2185 = _2053 + 262192;
    uint _2187 = uint(int(uint(_2081) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2187)];
    float _2189 = as_type<float>(_dmw5.x);
    int _2191 = _2081 + 4;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    float _2195 = as_type<float>(_dmw5.y);
    int _2197 = _2081 + 8;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    float _2201 = as_type<float>(_dmw5.z);
    int _2203 = _2081 + 12;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    float _2207 = as_type<float>(_dmw5.w);
    int _2209 = _2001 + 262208;
    uint _2211 = uint(int(uint(_2105) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2211)];
    float _2213 = as_type<float>(_dmw9.x);
    int _2215 = _2105 + 4;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    float _2219 = as_type<float>(_dmw9.y);
    int _2221 = _2105 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    float _2225 = as_type<float>(_dmw9.z);
    int _2227 = _2105 + 12;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    float _2231 = as_type<float>(_dmw9.w);
    int _2233 = _2001 + 262224;
    uint _2235 = uint(int(uint(_2107) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2235)];
    float _2237 = as_type<float>(_dmw17.x);
    int _2239 = _2107 + 4;
    uint _2241 = uint(int(uint(_2239) >> uint(2)));
    float _2243 = as_type<float>(_dmw17.y);
    int _2245 = _2107 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    float _2249 = as_type<float>(_dmw17.z);
    int _2251 = _2107 + 12;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    float _2255 = as_type<float>(_dmw17.w);
    int _2257 = _2053 + 262208;
    uint _2259 = uint(int(uint(_2131) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2259)];
    float _2261 = as_type<float>(_dmw8.x);
    int _2263 = _2131 + 4;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    float _2267 = as_type<float>(_dmw8.y);
    int _2269 = _2131 + 8;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    float _2273 = as_type<float>(_dmw8.z);
    int _2275 = _2131 + 12;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    float _2279 = as_type<float>(_dmw8.w);
    int _2281 = _2053 + 262224;
    uint _2283 = uint(int(uint(_2133) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2283)];
    float _2285 = as_type<float>(_dmw12.x);
    int _2287 = _2133 + 4;
    uint _2289 = uint(int(uint(_2287) >> uint(2)));
    float _2291 = as_type<float>(_dmw12.y);
    int _2293 = _2133 + 8;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    float _2297 = as_type<float>(_dmw12.z);
    int _2299 = _2133 + 12;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    float _2303 = as_type<float>(_dmw12.w);
    int _2305 = _2001 + 262144;
    uint _2307 = uint(int(uint(_2183) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2307)];
    float _2309 = as_type<float>(_dmw13.x);
    int _2311 = _2183 + 4;
    uint _2313 = uint(int(uint(_2311) >> uint(2)));
    float _2315 = as_type<float>(_dmw13.y);
    int _2317 = _2183 + 8;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    float _2321 = as_type<float>(_dmw13.z);
    int _2323 = _2183 + 12;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    float _2327 = as_type<float>(_dmw13.w);
    int _2329 = _2001 + 262176;
    uint _2331 = uint(int(uint(_2157) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2331)];
    float _2333 = as_type<float>(_dmw16.x);
    int _2335 = _2157 + 4;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    float _2339 = as_type<float>(_dmw16.y);
    int _2341 = _2157 + 8;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    float _2345 = as_type<float>(_dmw16.z);
    int _2347 = _2157 + 12;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    float _2351 = as_type<float>(_dmw16.w);
    int _2353 = _2001 + 262240;
    uint _2355 = uint(int(uint(_2185) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2355)];
    float _2357 = as_type<float>(_dmw20.x);
    int _2359 = _2185 + 4;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    float _2363 = as_type<float>(_dmw20.y);
    int _2365 = _2185 + 8;
    uint _2367 = uint(int(uint(_2365) >> uint(2)));
    float _2369 = as_type<float>(_dmw20.z);
    int _2371 = _2185 + 12;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    float _2375 = as_type<float>(_dmw20.w);
    int _2377 = _2001 + 262256;
    uint _2379 = uint(int(uint(_2209) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2379)];
    float _2381 = as_type<float>(_dmw18.x);
    int _2383 = _2209 + 4;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw18.y);
    int _2389 = _2209 + 8;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw18.z);
    int _2395 = _2209 + 12;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    float _2399 = as_type<float>(_dmw18.w);
    int _2401 = _1993 + 262176;
    uint _2403 = uint(int(uint(_2233) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2403)];
    float _2405 = as_type<float>(_dmw19.x);
    int _2407 = _2233 + 4;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    float _2411 = as_type<float>(_dmw19.y);
    int _2413 = _2233 + 8;
    uint _2415 = uint(int(uint(_2413) >> uint(2)));
    float _2417 = as_type<float>(_dmw19.z);
    int _2419 = _2233 + 12;
    uint _2421 = uint(int(uint(_2419) >> uint(2)));
    float _2423 = as_type<float>(_dmw19.w);
    int _2425 = _1993 + 262240;
    int _2427 = _1993 + 262256;
    uint _2429 = uint(int(uint(_2257) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2429)];
    float _2431 = as_type<float>(_dmw21.x);
    int _2433 = _2257 + 4;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    float _2437 = as_type<float>(_dmw21.y);
    int _2439 = _2257 + 8;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    float _2443 = as_type<float>(_dmw21.z);
    int _2445 = _2257 + 12;
    uint _2447 = uint(int(uint(_2445) >> uint(2)));
    float _2449 = as_type<float>(_dmw21.w);
    uint _2451 = uint(int(uint(_2159) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2451)];
    float _2453 = as_type<float>(_dmw7.x);
    int _2455 = _2159 + 4;
    uint _2457 = uint(int(uint(_2455) >> uint(2)));
    float _2459 = as_type<float>(_dmw7.y);
    int _2461 = _2159 + 8;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    float _2465 = as_type<float>(_dmw7.z);
    int _2467 = _2159 + 12;
    uint _2469 = uint(int(uint(_2467) >> uint(2)));
    float _2471 = as_type<float>(_dmw7.w);
    uint _2473 = uint(int(uint(_2281) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2473)];
    float _2475 = as_type<float>(_dmw22.x);
    int _2477 = _2281 + 4;
    uint _2479 = uint(int(uint(_2477) >> uint(2)));
    float _2481 = as_type<float>(_dmw22.y);
    int _2483 = _2281 + 8;
    uint _2485 = uint(int(uint(_2483) >> uint(2)));
    float _2487 = as_type<float>(_dmw22.z);
    int _2489 = _2281 + 12;
    uint _2491 = uint(int(uint(_2489) >> uint(2)));
    float _2493 = as_type<float>(_dmw22.w);
    uint _2495 = uint(int(uint(_2305) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2495)];
    float _2497 = as_type<float>(_dmw15.x);
    int _2499 = _2305 + 4;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    float _2503 = as_type<float>(_dmw15.y);
    int _2505 = _2305 + 8;
    uint _2507 = uint(int(uint(_2505) >> uint(2)));
    float _2509 = as_type<float>(_dmw15.z);
    int _2511 = _2305 + 12;
    uint _2513 = uint(int(uint(_2511) >> uint(2)));
    float _2515 = as_type<float>(_dmw15.w);
    uint _2517 = uint(int(uint(_2427) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2517)];
    float _2519 = as_type<float>(_dmw14.x);
    int _2521 = _2427 + 4;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    float _2525 = as_type<float>(_dmw14.y);
    int _2527 = _2427 + 8;
    uint _2529 = uint(int(uint(_2527) >> uint(2)));
    float _2531 = as_type<float>(_dmw14.z);
    int _2533 = _2427 + 12;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    float _2537 = as_type<float>(_dmw14.w);
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2545 = _2543 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2549 = _2547 != 0;
    float _2551 = 1.0 / _2541;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2555 = _2553 != 0;
    float _2557 = -_1915;
    float _2559 = _2557 + 1.0;
    bool _2561 = _1917 > 0.5;
    uint _2563 = uint(int(uint(_2401) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2563)];
    float _2565 = as_type<float>(_dmw10.x);
    int _2567 = _2401 + 4;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    float _2571 = as_type<float>(_dmw10.y);
    int _2573 = _2401 + 8;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    float _2577 = as_type<float>(_dmw10.z);
    int _2579 = _2401 + 12;
    uint _2581 = uint(int(uint(_2579) >> uint(2)));
    float _2583 = as_type<float>(_dmw10.w);
    float _2585 = 1.0 / _2545;
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2587;
    bool _2591 = _2561;
    float _2593 = _1915;
    if (_2549)
    {
        bool _2595 = _491 > 0.5;
        _659 = _2595;
    }
    bool _2597 = _659;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2601 = _471 + _2599;
    bool _2603 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2605 = isnan(_471);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2611 = _2607 || _2609;
    float _2613 = float(_2611);
    uint _2615 = uint(int(uint(_2425) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2615)];
    float _2617 = as_type<float>(_dmw23.x);
    int _2619 = _2425 + 4;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    float _2623 = as_type<float>(_dmw23.y);
    int _2625 = _2425 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    float _2629 = as_type<float>(_dmw23.z);
    int _2631 = _2425 + 12;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    float _2635 = as_type<float>(_dmw23.w);
    bool _2637 = _489 > 0.5;
    float _2639 = _2589 * _2551;
    int _2641 = _2561 ? as_type<int>(_2559) : as_type<int>(_1915);
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2645 = _2643 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_2555)
    {
        bool _2647 = _485 > 0.5;
        _2591 = _2647;
    }
    bool _2649 = _2591;
    float _2651 = fma(_2639, _2601, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2653 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2655 = isnan(_471);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = -_2613;
    float _2667 = _2665 + 1.0;
    int _2669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2671 = _2669 != 0;
    float _2673 = _2645 * _2585;
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2677 = _471 + _2675;
    bool _2679 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2681 = isnan(_471);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2687 = _2683 || _2685;
    float _2689 = float(_2687);
    float _2691 = _2663 * _2667;
    float _2693 = -_2663;
    float _2695 = _2693 + 1.0;
    float _2697 = fma(_2673, _2677, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2699 = _2053 + 262176;
    uint _2701 = uint(int(uint(_2329) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2701)];
    float _2703 = as_type<float>(_dmw24.x);
    int _2705 = _2329 + 4;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    float _2709 = as_type<float>(_dmw24.y);
    int _2711 = _2329 + 8;
    uint _2713 = uint(int(uint(_2711) >> uint(2)));
    float _2715 = as_type<float>(_dmw24.z);
    int _2717 = _2329 + 12;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    float _2721 = as_type<float>(_dmw24.w);
    float _2723 = _2689 * _2695;
    int _2725 = _2053 + 262144;
    int _2727 = 0;
    float _2729 = _2695;
    if (_2549)
    {
        float _2731 = -_1919;
        float _2733 = _2731 + 1.0;
        _2727 = as_type<int>(_2733);
    }
    int _2735 = _2727;
    int _2737 = _2053 + 262160;
    float _2739 = _2651 * _2723;
    int _2741 = _2053 + 262240;
    float _2743 = -_2689;
    float _2745 = _2743 + 1.0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2749 = _2747 != 0;
    uint _2751 = uint(int(uint(_2353) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2751)];
    float _2753 = as_type<float>(_dmw25.x);
    int _2755 = _2353 + 4;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    float _2759 = as_type<float>(_dmw25.y);
    int _2761 = _2353 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    float _2765 = as_type<float>(_dmw25.z);
    int _2767 = _2353 + 12;
    uint _2769 = uint(int(uint(_2767) >> uint(2)));
    float _2771 = as_type<float>(_dmw25.w);
    int _2773 = _2053 + 262256;
    uint _2775 = uint(int(uint(_2377) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
    float _2777 = as_type<float>(_dmw26.x);
    int _2779 = _2377 + 4;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    float _2783 = as_type<float>(_dmw26.y);
    int _2785 = _2377 + 8;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    float _2789 = as_type<float>(_dmw26.z);
    int _2791 = _2377 + 12;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    float _2795 = as_type<float>(_dmw26.w);
    float _2797 = _2745;
    if (!_2549)
    {
        _2729 = _1919;
    }
    float _2799 = _2729;
    float _2801 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2739);
    float _2803 = _2749 ? as_type<float>(_2641) : _1915;
    uint _2805 = uint(int(uint(_2725) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2805)];
    float _2807 = as_type<float>(_dmw27.x);
    int _2809 = _2725 + 4;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    float _2813 = as_type<float>(_dmw27.y);
    int _2815 = _2725 + 8;
    uint _2817 = uint(int(uint(_2815) >> uint(2)));
    float _2819 = as_type<float>(_dmw27.z);
    int _2821 = _2725 + 12;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    float _2825 = as_type<float>(_dmw27.w);
    float _2827 = _2799;
    if (_2671)
    {
        float _2829 = _2637 ? _2559 : _1915;
        _2593 = _2829;
    }
    float _2831 = _2593;
    if (_2549)
    {
        float _2833 = _2597 ? as_type<float>(_2735) : _1919;
        _2827 = _2833;
    }
    float _2835 = _2827;
    uint _2837 = uint(int(uint(_2737) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2837)];
    float _2839 = as_type<float>(_dmw28.x);
    int _2841 = _2737 + 4;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    float _2845 = as_type<float>(_dmw28.y);
    int _2847 = _2737 + 8;
    uint _2849 = uint(int(uint(_2847) >> uint(2)));
    float _2851 = as_type<float>(_dmw28.z);
    int _2853 = _2737 + 12;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    float _2857 = as_type<float>(_dmw28.w);
    uint _2859 = uint(int(uint(_2699) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2859)];
    float _2861 = as_type<float>(_dmw29.x);
    int _2863 = _2699 + 4;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    float _2867 = as_type<float>(_dmw29.y);
    int _2869 = _2699 + 8;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    float _2873 = as_type<float>(_dmw29.z);
    int _2875 = _2699 + 12;
    uint _2877 = uint(int(uint(_2875) >> uint(2)));
    float _2879 = as_type<float>(_dmw29.w);
    uint _2881 = uint(int(uint(_2741) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2881)];
    float _2883 = as_type<float>(_dmw30.x);
    int _2885 = _2741 + 4;
    uint _2887 = uint(int(uint(_2885) >> uint(2)));
    float _2889 = as_type<float>(_dmw30.y);
    int _2891 = _2741 + 8;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    float _2895 = as_type<float>(_dmw30.z);
    int _2897 = _2741 + 12;
    uint _2899 = uint(int(uint(_2897) >> uint(2)));
    float _2901 = as_type<float>(_dmw30.w);
    uint _2903 = uint(int(uint(_2773) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2903)];
    float _2905 = as_type<float>(_dmw31.x);
    int _2907 = _2773 + 4;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    float _2911 = as_type<float>(_dmw31.y);
    int _2913 = _2773 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    float _2917 = as_type<float>(_dmw31.z);
    int _2919 = _2773 + 12;
    uint _2921 = uint(int(uint(_2919) >> uint(2)));
    float _2923 = as_type<float>(_dmw31.w);
    float _2925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2927 = 0;
    if (_2555)
    {
        float _2929 = -_1919;
        float _2931 = _2929 + 1.0;
        _2927 = as_type<int>(_2931);
    }
    int _2933 = _2927;
    float _2935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_2555)
    {
        _2797 = _1919;
    }
    float _2937 = _2797;
    float _2939 = fma(_2697, _2691, _2801);
    float _2941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2943 = _2937;
    if (_2555)
    {
        float _2945 = _2649 ? as_type<float>(_2933) : _1919;
        _2943 = _2945;
    }
    float _2947 = _2943;
    float _2949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2951 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2953 = fma(_2613, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2939);
    float _2955 = _2803 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2957 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2959 = _2951 * _2925;
    float _2961 = _2947 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2963 = _2957 * _2935;
    float _2965 = _2955 * _2941;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2971 = _2961 * _2949;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2979 = _2953 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2981 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _2959;
    out.m_74.y = _2963;
    out.m_74.z = _2971;
    out.m_74.w = _2965;
    float _2983 = _919 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2985 = _919 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2987 = _919 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2989 = in.m_76.x;
    float _2991 = in.m_76.y;
    float _2993 = in.m_76.z;
    bool _2995 = _875 != 0.0;
    bool _2997 = isnan(_875);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    out.m_78.x = _2975;
    out.m_78.y = _2977;
    out.m_78.z = _2981;
    out.m_78.w = _2979;
    float _3005 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3007 = _877 == 0.0;
    bool _3009 = !_3003;
    bool _3011 = _3007 && _3009;
    float _3013 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3005);
    float _3015 = in.m_80.x;
    float _3017 = in.m_80.y;
    float _3019 = in.m_80.z;
    float _3021 = in.m_80.w;
    float _3023 = abs(_1351);
    float _3025 = log2(_3023);
    bool _3027 = _879 == 0.0;
    bool _3029 = _3027 && _3011;
    float _3031 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3033 = -_899;
    float _3035 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2983);
    out.m_82.x = 1.0;
    out.m_82.y = 1.0;
    out.m_82.z = 1.0;
    float _3037 = -_899;
    float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2985);
    float _3041 = -_899;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2987);
    out.m_84.w = _815;
    float _3045 = 0.0;
    float _3047 = _2989;
    if (_3029)
    {
        _3045 = _2989;
    }
    float _3049 = _3045;
    float _3051 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3031);
    float _3053 = 0.0;
    float _3055 = _3049;
    if (_3029)
    {
        _3053 = _2993;
    }
    float _3057 = _3053;
    float _3059 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3061 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3063 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3065 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3059);
    float _3067 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3069 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3039);
    float _3071 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3073 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3075 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3035);
    float _3077 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3079 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3081 = 0.0;
    float _3083 = _3065;
    float _3085 = _3057;
    if (_3029)
    {
        _3081 = _2991;
    }
    float _3087 = _3081;
    float _3089 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3051);
    float _3091 = _3087;
    if (_3029)
    {
        _1035 = _3049;
    }
    float _3093 = _1035;
    float _3095 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3067);
    float _3097 = _3093;
    if (!_3029)
    {
        _3055 = _2989;
    }
    float _3099 = _3055;
    float _3101 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3013);
    if (_3029)
    {
        _3083 = _3057;
    }
    float _3103 = _3083;
    float _3105 = _3069 * _3017;
    float _3107 = _3103;
    if (!_3029)
    {
        _3085 = _2993;
    }
    float _3109 = _3085;
    float _3111 = exp2(_3063);
    float _3113 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3073);
    float _3115 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3117 = _3075 * _3017;
    float _3119 = _3077 * _3017;
    if (_3029)
    {
        _3047 = _3087;
    }
    float _3121 = _3047;
    float _3123 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3095);
    float _3125 = _3121;
    if (!_3029)
    {
        _3091 = _2991;
    }
    float _3127 = _3091;
    if (!_3029)
    {
        float _3129 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3099);
        _3097 = _3129;
    }
    float _3131 = _3097;
    float _3133 = fma(_3101, _3015, _3105);
    float _3135 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3113);
    float _3137 = fma(_3079, _3015, _3117);
    float _3139 = fma(_3115, _3015, _3119);
    float _3141 = _3019 * _3099;
    float _3143 = _3015 * _3127;
    float _3145 = fma(_3123, _3019, _3133);
    float _3147 = _3017 * _3109;
    float _3149 = fma(_3089, _3019, _3137);
    float _3151 = fma(_3135, _3019, _3139);
    float _3153 = -_3141;
    float _3155 = fma(_3015, _3109, _3153);
    if (!_3029)
    {
        float _3157 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3127);
        _3125 = _3157;
    }
    float _3159 = _3125;
    float _3161 = -_3147;
    float _3163 = fma(_3019, _3127, _3161);
    float _3165 = _3155 * _3021;
    out.m_86.x = _3149;
    out.m_86.y = _3145;
    out.m_86.z = _3151;
    if (!_3029)
    {
        float _3167 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3109);
        _3107 = _3167;
    }
    float _3169 = _3107;
    float _3171 = _3069 * _3159;
    float _3173 = _3075 * _3159;
    float _3175 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3177 = precise::clamp(_3175, 0.0, 1.0);
    float _3179 = -_3143;
    float _3181 = fma(_3017, _3099, _3179);
    float _3183 = _3163 * _3021;
    float _3185 = _3165 * _3075;
    float _3187 = _3165 * _3069;
    float _3189 = _3077 * _3159;
    float _3191 = _3165 * _3077;
    float _3193 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3195 = fma(_3101, _3131, _3171);
    float _3197 = fma(_3079, _3131, _3173);
    float _3199 = _3177 * _3177;
    float _3201 = fma(_3177, -2.0, 3.0);
    float _3203 = _3181 * _3021;
    float _3205 = fma(_3183, _3079, _3185);
    float _3207 = fma(_3183, _3101, _3187);
    float _3209 = fma(_3183, _3115, _3191);
    float _3211 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3193);
    float _3213 = _3199 * _3201;
    float _3215 = fma(_3203, _3123, _3207);
    float _3217 = fma(_3203, _3089, _3205);
    float _3219 = fma(_3203, _3135, _3209);
    float _3221 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3211);
    out.m_88.x = _1019;
    out.m_88.y = _999;
    out.m_88.z = _977;
    float _3223 = -_1943;
    float _3225 = _1935 + _3223;
    float _3227 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3221);
    out.m_90.x = _3217;
    out.m_90.y = _3215;
    out.m_90.z = _3219;
    float _3229 = -_1949;
    float _3231 = _1937 + _3229;
    float _3233 = -_3213;
    float _3235 = _3233 + 1.0;
    float _3237 = _1798 * 0.5;
    float _3239 = _3227 + _1798;
    float _3241 = fma(_1852, -0.5, _3237);
    float _3243 = -_3225;
    float _3245 = _3243 + 1.0;
    out.m_92.x = _895;
    bool _3247 = _1351 <= 8000.0;
    bool _3249 = isnan(_1351);
    bool _3251 = _3247 || _3249;
    bool _3253 = isnan(8000.0);
    bool _3255 = _3251 || _3253;
    float _3257 = float(_3255);
    float _3259 = _1850 + _1798;
    float _3261 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3213);
    float _3263 = _3239 * 0.5;
    float _3265 = -_3231;
    float _3267 = _3265 + 1.0;
    float _3269 = _3231 * _3245;
    out.gl_Position.x = _1850;
    out.gl_Position.y = _1852;
    out.gl_Position.z = _3227;
    out.gl_Position.w = _1798;
    float _3271 = _3259 * 0.5;
    float _3273 = _3257 * _3261;
    float _3275 = _3267 * _3245;
    float _3277 = _3225 * _3267;
    out.m_94.x = _3271;
    out.m_94.y = _3241;
    out.m_94.z = _3263;
    out.m_94.w = _1798;
    float _3279 = _3269 * _2005;
    float _3281 = _3269 * _2037;
    float _3283 = _3269 * _2011;
    float _3285 = _3269 * _2059;
    float _3287 = _3269 * _2023;
    float _3289 = _3269 * _2031;
    float _3291 = _3269 * _2043;
    float _3293 = _3269 * _2065;
    float _3295 = _3269 * _2077;
    float _3297 = fma(_3275, _2085, _3285);
    float _3299 = _3269 * _2117;
    float _3301 = _3269 * _2137;
    float _3303 = _3269 * _2143;
    float _3305 = _3269 * _2163;
    float _3307 = fma(_3275, _2091, _3293);
    float _3309 = _3269 * _2149;
    float _3311 = _3269 * _2111;
    float _3313 = _3269 * _2195;
    float _3315 = fma(_3275, _2219, _3283);
    float _3317 = fma(_3275, _2103, _3295);
    float _3319 = _3231 * _3225;
    float _3321 = _3269 * _2155;
    float _3323 = _3269 * _2169;
    float _3325 = fma(_3277, _2237, _3297);
    float _3327 = _3269 * _2017;
    float _3329 = _3269 * _2049;
    float _3331 = _3269 * _2129;
    float _3333 = _3269 * _2201;
    float _3335 = fma(_3275, _2261, _3301);
    float _3337 = fma(_3275, _2285, _3305);
    float _3339 = fma(_3277, _2243, _3307);
    float _3341 = _3269 * _2071;
    float _3343 = _3269 * _2175;
    float _3345 = fma(_3275, _2315, _3313);
    float _3347 = fma(_3277, _2339, _3315);
    float _3349 = fma(_3277, _2255, _3317);
    float _3351 = _3269 * _2189;
    float _3353 = _3269 * _2207;
    float _3355 = fma(_3275, _2291, _3323);
    float _3357 = fma(_3319, _2357, _3325);
    float _3359 = _3269 * _2123;
    float _3361 = _3269 * _2181;
    float _3363 = fma(_3275, _2321, _3333);
    float _3365 = fma(_3277, _2381, _3337);
    float _3367 = fma(_3319, _2363, _3339);
    float _3369 = fma(_3275, _2297, _3343);
    float _3371 = fma(_3277, _2411, _3345);
    float _3373 = fma(_3319, _2375, _3349);
    float _3375 = fma(_3275, _2309, _3351);
    float _3377 = fma(_3275, _2327, _3353);
    float _3379 = fma(_3277, _2387, _3355);
    float _3381 = _3357 * 0.886227548122406005859375;
    float _3383 = fma(_3275, _2303, _3361);
    float _3385 = fma(_3277, _2417, _3363);
    float _3387 = fma(_3319, _2431, _3365);
    float _3389 = _3367 * 0.886227548122406005859375;
    float _3391 = _3269 * _2459;
    float _3393 = fma(_3277, _2393, _3369);
    float _3395 = fma(_3319, _2481, _3371);
    float _3397 = _3373 * 0.511664927005767822265625;
    float _3399 = fma(_3277, _2405, _3375);
    float _3401 = fma(_3277, _2423, _3377);
    float _3403 = fma(_3319, _2437, _3379);
    float _3405 = precise::max(_3381, 0.00999999977648258209228515625);
    float _3407 = fma(_3277, _2497, _3335);
    float _3409 = fma(_3277, _2399, _3383);
    float _3411 = fma(_3319, _2487, _3385);
    float _3413 = _3387 * 0.511664927005767822265625;
    float _3415 = fma(_3319, _2443, _3393);
    float _3417 = _3395 * 0.511664927005767822265625;
    float _3419 = _3397 * _3397;
    float _3421 = precise::max(_3389, 0.00999999977648258209228515625);
    float _3423 = fma(_3275, _2525, _3391);
    float _3425 = fma(_3319, _2493, _3401);
    float _3427 = _3403 * 0.511664927005767822265625;
    float _3429 = 1.0 / _3405;
    float _3431 = fma(_3319, _2449, _3409);
    float _3433 = _3411 * 0.511664927005767822265625;
    float _3435 = _3415 * 0.511664927005767822265625;
    float _3437 = fma(_3417, _3417, _3419);
    float _3439 = fma(_3319, _2475, _3399);
    float _3441 = _3425 * 0.511664927005767822265625;
    float _3443 = 1.0 / _3421;
    float _3445 = _3413 * _3413;
    float _3447 = _3431 * 0.511664927005767822265625;
    float _3449 = fma(_3435, _3435, _3437);
    float _3451 = fma(_3433, _3433, _3445);
    float _3453 = _3427 * _3427;
    float _3455 = _3439 * 0.511664927005767822265625;
    float _3457 = fma(_3447, _3447, _3451);
    float _3459 = fma(_3441, _3441, _3453);
    float _3461 = sqrt(_3449);
    float _3463 = fma(_3455, _3455, _3459);
    float _3465 = sqrt(_3457);
    float _3467 = sqrt(_3463);
    float _3469 = precise::max(_3461, 0.00999999977648258209228515625);
    float _3471 = fma(_3275, _2097, _3341);
    float _3473 = _3269 * _2471;
    float _3475 = precise::max(_3465, 0.00999999977648258209228515625);
    float _3477 = 1.0 / _3469;
    float _3479 = fma(_3275, _2267, _3303);
    float _3481 = _3269 * _2453;
    float _3483 = _3269 * _2465;
    float _3485 = precise::max(_3467, 0.00999999977648258209228515625);
    float _3487 = 1.0 / _3475;
    float _3489 = fma(_3277, _2249, _3471);
    float _3491 = fma(_3275, _2273, _3309);
    float _3493 = fma(_3275, _2279, _3321);
    float _3495 = fma(_3275, _2213, _3279);
    float _3497 = 1.0 / _3485;
    float _3499 = fma(_3275, _2225, _3327);
    float _3501 = fma(_3275, _2231, _3287);
    float _3503 = fma(_3275, _2565, _3289);
    float _3505 = fma(_3275, _2571, _3281);
    float _3507 = fma(_3275, _2577, _3291);
    float _3509 = fma(_3275, _2583, _3329);
    float _3511 = fma(_3275, _2617, _3311);
    float _3513 = fma(_3275, _2623, _3299);
    float _3515 = fma(_3275, _2629, _3359);
    float _3517 = fma(_3275, _2635, _3331);
    float _3519 = fma(_3275, _2519, _3481);
    float _3521 = fma(_3275, _2531, _3483);
    float _3523 = fma(_3275, _2537, _3473);
    float _3525 = fma(_3319, _2369, _3489);
    float _3527 = fma(_3277, _2503, _3479);
    float _3529 = fma(_3277, _2509, _3491);
    float _3531 = fma(_3277, _2515, _3493);
    float _3533 = fma(_3277, _2333, _3495);
    float _3535 = fma(_3277, _2345, _3499);
    float _3537 = fma(_3277, _2351, _3501);
    float _3539 = fma(_3277, _2703, _3503);
    float _3541 = fma(_3277, _2709, _3505);
    float _3543 = fma(_3277, _2715, _3507);
    float _3545 = fma(_3277, _2721, _3509);
    float _3547 = fma(_3277, _2753, _3511);
    float _3549 = fma(_3277, _2759, _3513);
    float _3551 = fma(_3277, _2765, _3515);
    float _3553 = fma(_3277, _2771, _3517);
    float _3555 = fma(_3277, _2777, _3519);
    float _3557 = fma(_3277, _2783, _3423);
    float _3559 = fma(_3277, _2789, _3521);
    float _3561 = fma(_3277, _2795, _3523);
    float _3563 = _3525 * 0.886227548122406005859375;
    float _3565 = _3397 * _3477;
    float _3567 = fma(_3123, _3169, _3195);
    float _3569 = fma(_3319, _2807, _3407);
    float _3571 = fma(_3319, _2813, _3527);
    float _3573 = fma(_3319, _2819, _3529);
    float _3575 = fma(_3319, _2825, _3531);
    float _3577 = fma(_3319, _2839, _3533);
    float _3579 = fma(_3319, _2845, _3347);
    float _3581 = fma(_3319, _2851, _3535);
    float _3583 = fma(_3319, _2857, _3537);
    float _3585 = fma(_3319, _2861, _3539);
    float _3587 = fma(_3319, _2867, _3541);
    float _3589 = fma(_3319, _2873, _3543);
    float _3591 = fma(_3319, _2879, _3545);
    float _3593 = fma(_3319, _2883, _3547);
    float _3595 = fma(_3319, _2889, _3549);
    float _3597 = fma(_3319, _2895, _3551);
    float _3599 = fma(_3319, _2901, _3553);
    float _3601 = fma(_3319, _2905, _3555);
    float _3603 = fma(_3319, _2911, _3557);
    float _3605 = fma(_3319, _2917, _3559);
    float _3607 = fma(_3319, _2923, _3561);
    float _3609 = precise::max(_3563, 0.00999999977648258209228515625);
    float _3611 = _3469 * _3429;
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = _3475 * _3443;
    float _3617 = precise::clamp(_3615, 0.0, 1.0);
    float _3619 = _3413 * _3487;
    float _3621 = _3417 * _3477;
    float _3623 = fma(_3089, _3169, _3197);
    float _3625 = _3567 * _3565;
    float _3627 = _3427 * _3497;
    float _3629 = _3435 * _3477;
    float _3631 = 1.0 / _3609;
    float _3633 = fma(_3115, _3131, _3189);
    float _3635 = _3433 * _3487;
    float _3637 = fma(_3623, _3621, _3625);
    float _3639 = _3441 * _3497;
    float _3641 = _3567 * _3627;
    float _3643 = _3567 * _3619;
    float _3645 = fma(_3135, _3169, _3633);
    float _3647 = _3613 + 1.0;
    float _3649 = _3447 * _3487;
    float _3651 = fma(_3623, _3635, _3643);
    float _3653 = _3567 * 1.02332699298858642578125;
    float _3655 = _3455 * _3497;
    float _3657 = fma(_3623, _3639, _3641);
    float _3659 = fma(_3645, _3629, _3637);
    float _3661 = 1.0 / _3647;
    float _3663 = _3575 * _3653;
    float _3665 = fma(_3645, _3655, _3657);
    float _3667 = fma(_3659, 0.5, 0.5);
    float _3669 = fma(_3645, _3649, _3651);
    float _3671 = fma(_3665, 0.5, 0.5);
    float _3673 = fma(_3669, 0.5, 0.5);
    float _3675 = _3577 * _3653;
    float _3677 = abs(_3671);
    float _3679 = log2(_3677);
    float _3681 = _3579 * _3653;
    float _3683 = _3595 * _3653;
    float _3685 = _3603 * _3653;
    float _3687 = fma(_3569, 0.88622701168060302734375, _3663);
    float _3689 = abs(_3667);
    float _3691 = log2(_3689);
    float _3693 = fma(_3571, 0.88622701168060302734375, _3675);
    float _3695 = fma(_3573, 0.88622701168060302734375, _3681);
    float _3697 = fma(_3593, 0.88622701168060302734375, _3683);
    float _3699 = _3645 * 1.02332699298858642578125;
    float _3701 = abs(_3673);
    float _3703 = log2(_3701);
    float _3705 = fma(_3601, 0.88622701168060302734375, _3685);
    float _3707 = _3485 * _3631;
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = fma(_3581, _3699, _3687);
    float _3713 = fma(_3583, _3699, _3693);
    float _3715 = fma(_3585, _3699, _3695);
    float _3717 = fma(_3597, _3699, _3697);
    float _3719 = fma(_3605, _3699, _3705);
    float _3721 = _3623 * 1.02332699298858642578125;
    float _3723 = fma(_3613, 2.0, 1.0);
    float _3725 = fma(_3617, 2.0, 1.0);
    float _3727 = fma(_3709, 2.0, 1.0);
    float _3729 = fma(_3599, _3721, _3717);
    float _3731 = _3723 * _3691;
    float _3733 = _3727 * _3679;
    float _3735 = _3725 * _3703;
    float _3737 = _3729 * 0.31830990314483642578125;
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = fma(_3587, _3721, _3711);
    float _3743 = _3617 + 1.0;
    float _3745 = _3709 + 1.0;
    float _3747 = exp2(_3731);
    float _3749 = _3739 * 0.88622701168060302734375;
    float _3751 = fma(_3589, _3721, _3713);
    float _3753 = fma(_3591, _3721, _3715);
    float _3755 = fma(_3607, _3721, _3719);
    float _3757 = exp2(_3735);
    float _3759 = precise::max(0.0, _3741);
    float _3761 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _3763 = exp2(_3733);
    float _3765 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[17].x, _3761);
    float _3767 = -_3613;
    float _3769 = _3767 + 1.0;
    float _3771 = 1.0 / _3743;
    float _3773 = -_3617;
    float _3775 = _3773 + 1.0;
    float _3777 = 1.0 / _3745;
    float _3779 = _3755 * 0.31830990314483642578125;
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = fma(_3613, 2.0, 2.0);
    float _3785 = fma(_3617, 2.0, 2.0);
    float _3787 = fma(_3709, 2.0, 2.0);
    float _3789 = precise::max(0.0, _3751);
    float _3791 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _3793 = -_3709;
    float _3795 = _3793 + 1.0;
    float _3797 = _3783 * _3747;
    float _3799 = -_3781;
    float _3801 = _3799 + 1.0;
    float _3803 = _3785 * _3757;
    float _3805 = _3787 * _3763;
    float _3807 = in.m_96.x;
    float _3809 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_98.x = _3623;
    out.m_98.y = _3567;
    out.m_98.z = _3645;
    float _3811 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[659].w, _3781);
    out.m_100.x = _1339;
    out.m_100.y = _1337;
    out.m_100.z = _1341;
    float _3813 = fma(_3789, (*spvDescriptorSet0.vp_c15)._m0[17].y, _3791);
    out.m_102.x = 0.0;
    float _3815 = _3769 * _3661;
    float _3817 = _3775 * _3771;
    float _3819 = _3795 * _3777;
    float _3821 = -_3797;
    float _3823 = _3821 + 1.0;
    float _3825 = -_3803;
    float _3827 = _3825 + 1.0;
    float _3829 = -_3805;
    float _3831 = _3829 + 1.0;
    bool _3833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3835 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _3837 = precise::max(0.0, _3753);
    float _3839 = fma(_3815, _3823, _3797);
    float _3841 = fma(_3817, _3827, _3803);
    float _3843 = fma(_3819, _3831, _3805);
    float _3845 = exp2(_3809);
    float _3847 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[17].z, _3835);
    float _3849 = _3381 * _3839;
    float _3851 = _3389 * _3841;
    float _3853 = _3811 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _3855 = _3563 * _3843;
    float _3857 = fma(_3849, _3853, _3765);
    float _3859 = fma(_3851, _3853, _3813);
    float _3861 = fma(_3855, _3853, _3847);
    float _3863 = _1411 * _1465;
    float _3865 = _3857 * 0.31830990314483642578125;
    float _3867 = _3859 * 0.31830990314483642578125;
    float _3869 = _3861 * 0.31830990314483642578125;
    bool _3871 = !_3833;
    if (!_3871)
    {
        float _3873 = -_1337;
        float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3877 = -_1339;
        float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3881 = -_1341;
        float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3885 = _3875 * _3875;
        float _3887 = fma(_3879, _3879, _3885);
        float _3889 = fma(_3883, _3883, _3887);
        float _3891 = sqrt(_3889);
        float _3893 = rsqrt(_3889);
        float _3895 = -_3891;
        float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3899 = _3897 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3901 = precise::clamp(_3899, 0.0, 1.0);
        float _3903 = _3879 * _3893;
        float _3905 = _3875 * _3893;
        float _3907 = abs(_3901);
        float _3909 = log2(_3907);
        float _3911 = _3883 * _3893;
        float _3913 = _3903 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3915 = _3567 * _3905;
        float _3917 = -_3905;
        float _3919 = -_3913;
        float _3921 = fma(_3917, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3919);
        float _3923 = fma(_3623, _3903, _3915);
        float _3925 = -_3911;
        float _3927 = fma(_3925, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3921);
        float _3929 = fma(_3645, _3911, _3923);
        float _3931 = precise::clamp(_3929, 0.0, 1.0);
        float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3935 = _3927 + _3933;
        float _3937 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3939 = _3935 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3941 = precise::clamp(_3939, 0.0, 1.0);
        float _3943 = exp2(_3937);
        float _3945 = _3943 * _3941;
        float _3947 = _3931 * _3945;
        float _3949 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3951 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3953 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3949;
        out.m_102.y = _3951;
        out.m_102.z = _3953;
    }
    float _3955 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3957 = -_3845;
    float _3959 = _3957 + 1.0;
    float _3961 = -_1886;
    float _3963 = _3961 + 1.0;
    float _3965 = _3863 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3967 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3969 = _3963 * _3955;
    float _3971 = precise::clamp(_3969, 0.0, 1.0);
    bool _3973 = _1411 > 0.0;
    bool _3975 = isnan(_1411);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan(0.0);
    bool _3981 = _3977 || _3979;
    float _3983 = _3965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3985 = _3967 * _1888;
    float _3987 = -_3971;
    float _3989 = fma(_3987, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _3991 = _1465 <= 0.0;
    bool _3993 = !_3981;
    bool _3995 = _3991 || _3993;
    float _3997 = -_3967;
    float _3999 = _3997 + 1.0;
    float _4001 = _1899 * _3985;
    float _4003 = _3989 * _3807;
    float _4005 = _1909 * _3985;
    out.m_56.x = _3983;
    float _4007 = fma(_1905, _4001, _1893);
    float _4009 = fma(_1907, _4001, _1895);
    float _4011 = _4003 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4013 = _1899 * _3999;
    float _4015 = fma(_1899, _4005, _1897);
    out.m_84.x = _3865;
    out.m_84.y = _3867;
    out.m_84.z = _3869;
    out.m_104.x = _4011;
    out.m_106.x = _4007;
    out.m_106.y = _4009;
    out.m_106.z = _4015;
    out.m_106.w = _4013;
    if (!_3995)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _4017 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4017;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _463 = false;
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
        float _4074 = as_type<float>(_141);
        out.gl_Position.z = _4074;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4144 = as_type<float>(_179);
        out.gl_Position.z = _4144;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
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
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _367 + _369;
    bool _373 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_367);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _389 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_367);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    float _405 = -_383;
    float _407 = _405 + 1.0;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _411 = 1.0 / _387;
    float _413 = _399 * _407;
    float _415 = -_399;
    float _417 = _415 + 1.0;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _421 = _403 * _411;
    float _423 = fma(_421, _371, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _427 = _423 * _413;
    float _429 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[115].x, _427);
    float _431 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _435 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[116].x, _429);
    float _437 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _431;
    out.m_66.y = _439;
    out.m_66.z = _437;
    out.m_66.w = _441;
    bool _443 = !_409;
    float _461;
    if (!_443)
    {
        float _445 = in.m_62.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_125);
        float _467 = 1.0 / _465;
        float _469 = _159 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = in.m_53.x;
    float _475 = in.m_53.y;
    float _477 = in.m_53.z;
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _485 = in.m_62.z;
    float _487 = _483 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _489 = in.m_62.y;
    float _491 = in.m_62.x;
    float _493 = _481 * _159;
    float _495 = _475 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _497 = _475 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _499 = _475 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _501 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].x, _495);
    float _503 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].x, _497);
    float _505 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].x, _499);
    float _507 = _485 * 2.0;
    float _509 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[5].z, _501);
    float _511 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[4].z, _503);
    float _513 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[6].z, _505);
    float _515 = _489 * 2.0;
    float _517 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _519 = _511 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _521 = _513 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _523 = floor(_507);
    float _525 = -_517;
    float _527 = _525 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _529 = -_519;
    float _531 = _529 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _491 * 2.0;
    float _535 = _527 * _527;
    float _537 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _539 = _521 + _537;
    float _541 = floor(_533);
    float _543 = fma(_531, _531, _535);
    float _545 = -_521;
    float _547 = _545 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _549 = _489 + _485;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    float _563 = fma(_547, _547, _543);
    float _565 = _549 + (-1.0);
    float _567 = floor(_515);
    bool _569 = _523 >= 0.0;
    bool _571 = isnan(_523);
    bool _573 = _569 || _571;
    bool _575 = isnan(0.0);
    bool _577 = _573 || _575;
    float _579 = _491 + _489;
    float _581 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _583 = _523 > 0.0;
    int _585 = _577 ? 0 : 1;
    float _587 = _579 + (-1.0);
    float _589 = sqrt(_563);
    bool _591 = _541 >= 0.0;
    bool _593 = isnan(_541);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    bool _601 = _541 > 0.0;
    int _603 = _599 ? 0 : 1;
    float _605 = exp2(_493);
    bool _607 = _567 > 0.0;
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _611 = _567 >= 0.0;
    bool _613 = isnan(_567);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    int _621 = _619 ? 0 : 1;
    float _623 = abs(_589);
    float _625 = precise::max(_623, 50.0);
    bool _627 = !_561;
    int _629 = _627 ? 0 : 1;
    float _631 = precise::min(_625, 200.0);
    int _633 = ~_585;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = -_605;
    float _641 = _639 + 1.0;
    int _643 = ~_621;
    int _645 = _643 + 1;
    int _647 = _645 + 1;
    float _649 = fma(_631, 0.006666666828095912933349609375, -0.3333333432674407958984375);
    bool _651 = !_553;
    int _653 = _651 ? 0 : 1;
    int _655 = _637;
    int _657 = _647;
    bool _659 = _557;
    if (!_583)
    {
        int _661 = ~_585;
        int _663 = _661 + 1;
        _655 = _663;
    }
    int _665 = _655;
    if (!_607)
    {
        int _667 = ~_621;
        int _669 = _667 + 1;
        _657 = _669;
    }
    int _671 = _657;
    int _673 = abs(_629);
    float _675 = in.m_68.x;
    float _677 = in.m_68.y;
    float _679 = in.m_68.z;
    bool _681 = !_557;
    int _683 = _681 ? 0 : 1;
    float _685 = -_649;
    float _687 = _517 + _685;
    int _689 = ~_603;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    int _695 = _693;
    if (!_601)
    {
        int _697 = ~_603;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _705 = 1.0 + _703;
    int _707 = abs(_653);
    float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _711 = _687 + _709;
    int _713 = abs(_683);
    float _715 = 1.0 / _705;
    float _717 = float(_707);
    float _719 = _711 * _711;
    float _721 = float(_673);
    float _723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _725 = _519 + _723;
    bool _727 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _729 = isnan(1.0);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _735 = _731 || _733;
    bool _737 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _739 = isnan(0.0);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _745 = _741 || _743;
    float _747 = fma(_725, _725, _719);
    float _749 = float(_713);
    float _751 = float(_701);
    float _753 = fma(_539, _539, _747);
    float _755 = float(_665);
    float _757 = _745 ? _641 : 0.0;
    float _759 = _749 * _751;
    float _761 = float(_671);
    float _763 = _717 * _755;
    float _765 = _759 * (-2.0);
    if (_735)
    {
        float _767 = _757 * _715;
        _161 = _767;
    }
    float _769 = _161;
    float _771 = sqrt(_753);
    float _773 = _763 * (-2.0);
    float _775 = fma(_765, _677, _677);
    float _777 = _489 + (-0.5);
    float _779 = fma(_581, _765, _581);
    float _781 = fma(_609, _773, _609);
    float _783 = fma(_773, _675, _675);
    float _785 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].y, _775);
    float _787 = _491 + (-0.5);
    float _789 = rsqrt(_753);
    float _791 = _721 * _761;
    float _793 = fma(_779, _769, _785);
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[196].x, _783);
    float _797 = _491 + _485;
    float _799 = _791 * (-2.0);
    float _801 = _771 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _803 = _797 + (-1.0);
    float _805 = _793 * 0.15915493667125701904296875;
    float _807 = fma(_799, _679, _679);
    float _809 = in.m_70.x;
    float _811 = in.m_70.y;
    float _813 = in.m_70.z;
    float _815 = precise::min(_487, _801);
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _819 = _485 + (-0.5);
    float _821 = fma(_781, _769, _795);
    float _823 = _805 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = _789 * _815;
    float _829 = fma(_817, _799, _817);
    float _831 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _807);
    float _833 = _821 * 0.15915493667125701904296875;
    float _835 = _711 * _827;
    float _837 = _725 * _827;
    float _839 = _539 * _827;
    float _841 = fma(_829, _769, _831);
    float _843 = -_835;
    float _845 = _711 + _843;
    float _847 = -_837;
    float _849 = _725 + _847;
    float _851 = -_839;
    float _853 = _539 + _851;
    float _855 = _841 * 0.15915493667125701904296875;
    float _857 = _845 * _845;
    float _859 = _805 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = fma(_849, _849, _857);
    float _867 = fma(_649, 0.2999999523162841796875, 1.0);
    float _869 = fma(_853, _853, _865);
    float _871 = _855 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = _867 * _811;
    float _877 = _867 * _809;
    float _879 = _867 * _813;
    float _881 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _883 = sqrt(_869);
    float _885 = _833 * 6.283185482025146484375;
    float _887 = sin(_885);
    float _889 = _833 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _789 * _883;
    float _895 = _483 * _893;
    float _897 = _855 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = _887 * _861;
    float _903 = _887 * _825;
    float _905 = _887 * _873;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _875);
    float _909 = _863 * _893;
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _877);
    float _913 = _881 * _893;
    float _915 = _891 * _861;
    float _917 = _891 * _825;
    float _919 = _891 * _873;
    float _921 = _909 * _907;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _879);
    float _925 = _895 * _911;
    float _927 = _861 * _873;
    float _929 = _919 * _921;
    float _931 = fma(_899, _915, _903);
    float _933 = _913 * _923;
    float _935 = -_901;
    float _937 = fma(_899, _917, _935);
    float _939 = -_921;
    float _941 = _899 * _939;
    float _943 = fma(_931, _925, _929);
    float _945 = -_917;
    float _947 = fma(_899, _901, _945);
    float _949 = _825 * _873;
    float _951 = _905 * _921;
    float _953 = fma(_927, _925, _941);
    float _955 = fma(_937, _933, _943);
    float _957 = fma(_899, _903, _915);
    float _959 = fma(_947, _925, _951);
    float _961 = fma(_949, _933, _953);
    float _963 = _955 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _965 = _955 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _967 = fma(_957, _933, _959);
    float _969 = _955 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _963);
    float _973 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _965);
    float _975 = -_839;
    float _977 = _521 + _975;
    float _979 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _969);
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].z, _971);
    float _983 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[24].z, _973);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[25].z, _979);
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _991 = _985 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _993 = _521 + _987;
    float _995 = _519 + _989;
    float _997 = -_835;
    float _999 = _687 + _997;
    float _1001 = _687 + _991;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _993 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1009 = _995 + _1007;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1013 = _1005 * _1005;
    float _1015 = fma(_1009, _1009, _1013);
    float _1017 = -_837;
    float _1019 = _519 + _1017;
    float _1021 = sqrt(_1015);
    float _1023 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1011);
    float _1025 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    bool _1027 = _1021 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1023;
    float _1031 = _991;
    float _1033 = _995;
    float _1035 = _905;
    if (!_1027)
    {
        _1029 = _993;
    }
    float _1037 = _1029;
    float _1039 = _1037;
    if (!_1027)
    {
        _1031 = _1001;
    }
    float _1041 = _1031;
    bool _1043 = !_1027;
    float _1045 = _1041;
    if (!_1043)
    {
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1051 = _1021 + _1049;
        float _1053 = _1001 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1055 = rsqrt(_1015);
        float _1057 = _1051 * _1047;
        float _1059 = _1057 * 0.15915493667125701904296875;
        float _1061 = _1059 * 6.283185482025146484375;
        float _1063 = cos(_1061);
        float _1065 = _1059 * 6.283185482025146484375;
        float _1067 = sin(_1065);
        float _1069 = _1063 + (-1.0);
        float _1071 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = fma(_1067, _1053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1075 = fma(_1001, _1063, _1071);
        float _1077 = _1055 * _1073;
        float _1079 = fma(_1009, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1081 = fma(_1005, _1077, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1045 = _1075;
        _1033 = _1079;
        _1039 = _1081;
    }
    float _1083 = _1045;
    float _1085 = _1033;
    float _1087 = _1039;
    float _1089 = -_687;
    float _1091 = _1089 + _1083;
    float _1093 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1095 = -_519;
    float _1097 = _1095 + _1085;
    float _1099 = _1091 * _1091;
    float _1101 = _999 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1103 = -_521;
    float _1105 = _1103 + _1087;
    float _1107 = fma(_1019, 0.008000000379979610443115234375, 64.0);
    float _1109 = fma(_1097, _1097, _1099);
    float _1111 = 1.0 / _1093;
    float _1113 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1101);
    float _1115 = -_837;
    float _1117 = _1115 + _1085;
    float _1119 = fma(_1105, _1105, _1109);
    float _1121 = precise::max(0.0, _1107);
    float _1123 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1125 = fma(_977, 0.008000000379979610443115234375, 64.0);
    float _1127 = -_835;
    float _1129 = _1127 + _1083;
    float _1131 = sqrt(_1119);
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1135 = precise::min(_1121, 127.0);
    float _1137 = -_839;
    float _1139 = _1137 + _1087;
    float _1141 = precise::max(0.0, _1125);
    float _1143 = _1133 + _1093;
    bool _1145 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1147 = isnan(0.5);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    float _1155 = trunc(_1135);
    int _1157 = int(_1155);
    float _1159 = precise::min(_1141, 127.0);
    float _1161 = _1143 * _1111;
    float _1163 = _1161 * 0.5;
    bool _1165 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1167 = isnan(0.5);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1173 = _1169 || _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1177 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1175);
    float _1179 = trunc(_1159);
    int _1181 = int(_1179);
    bool _1183 = _1131 > 0.0;
    float _1185 = 1.0 / _1177;
    float _1187 = _1085;
    float _1189 = _1083;
    float _1191 = _1087;
    float _1193 = _1159;
    if (!_1183)
    {
        _1187 = _1117;
    }
    float _1195 = _1187;
    int _1197 = _1181 << 7;
    int _1199 = _1197 + _1157;
    float _1201 = _1195;
    float _1203 = _1195;
    if (!_1183)
    {
        _1189 = _1129;
    }
    float _1205 = _1189;
    float _1207 = _1205;
    if (!_1183)
    {
        _1191 = _1139;
    }
    float _1209 = _1191;
    bool _1211 = !_1183;
    float _1213 = _1209;
    if (!_1211)
    {
        float _1215 = _203 * _203;
        float _1217 = fma(_201, _201, _1215);
        float _1219 = fma(_205, _205, _1217);
        float _1221 = rsqrt(_1119);
        float _1223 = sqrt(_1219);
        float _1225 = _1097 * _1221;
        float _1227 = _1091 * _1221;
        float _1229 = _1105 * _1221;
        bool _1231 = _1223 > 0.0;
        float _1233 = _1223;
        float _1235 = _1221;
        if (!_1231)
        {
            _1201 = _1117;
        }
        float _1237 = _1201;
        _1203 = _1237;
        if (!_1231)
        {
            _1233 = _1129;
        }
        float _1239 = _1233;
        _1207 = _1239;
        if (!_1231)
        {
            _1235 = _1139;
        }
        float _1241 = _1235;
        bool _1243 = !_1231;
        _1213 = _1241;
        if (!_1243)
        {
            float _1245 = rsqrt(_1219);
            float _1247 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1249 = _203 * _1245;
            float _1251 = _201 * _1245;
            float _1253 = _1227 * _1249;
            float _1255 = _205 * _1245;
            float _1257 = fma(_1225, _1251, _1253);
            float _1259 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1261 = fma(_1229, _1255, _1257);
            float _1263 = _1261 * _1259;
            float _1265 = fma(_201, _1263, _1117);
            float _1267 = fma(_203, _1263, _1129);
            float _1269 = fma(_205, _1263, _1139);
            _1203 = _1265;
            _1207 = _1267;
            _1213 = _1269;
        }
    }
    float _1271 = _1203;
    float _1273 = _1207;
    float _1275 = _1213;
    int _1277 = _1199 << 4;
    float _1279 = _1275;
    if (_1153)
    {
        _209 = _1271;
    }
    float _1281 = _209;
    float _1283 = _1281;
    if (_1153)
    {
        _211 = _1273;
    }
    float _1285 = _211;
    float _1287 = _1285;
    if (_1153)
    {
        _213 = _1275;
    }
    float _1289 = _213;
    float _1291 = _1289;
    if (!_1153)
    {
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1295 = _999 + _1293;
        float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1299 = _1019 + _1297;
        float _1301 = -_1019;
        float _1303 = _1301 + _1271;
        float _1305 = -_999;
        float _1307 = _1305 + _1273;
        float _1309 = _1295 * _1295;
        float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1313 = _977 + _1311;
        float _1315 = -_977;
        float _1317 = _1315 + _1275;
        float _1319 = fma(_1299, _1299, _1309);
        float _1321 = fma(_1313, _1313, _1319);
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1325 = sqrt(_1321);
        float _1327 = precise::min(_1325, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1329 = _1327 * _1323;
        float _1331 = fma(_1303, _1329, _1019);
        float _1333 = fma(_1307, _1329, _999);
        float _1335 = fma(_1317, _1329, _977);
        _1287 = _1333;
        _1283 = _1331;
        _1291 = _1335;
        _1279 = _1317;
    }
    float _1337 = _1287;
    float _1339 = _1283;
    float _1341 = _1291;
    float _1343 = _1279;
    float _1345 = _1343;
    if (_1173)
    {
        _1345 = 1.0;
    }
    float _1347 = _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1351 = _1185 * _1349;
    float _1353 = 0.0;
    float _1355 = _1347;
    if (_1173)
    {
        _1353 = 1.0;
    }
    float _1357 = _1353;
    int _1359 = _1277 + 8;
    float _1361 = _1357;
    if (!_1173)
    {
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = _1365 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1371;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1405 = fma(_1351, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        _1355 = _1409;
    }
    float _1411 = _1355;
    if (!_1173)
    {
        float _1413 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1419 = _1415 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        float _1423 = _1417 * 0.15915493667125701904296875;
        float _1425 = _1415 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = 1.0 / _1421;
        float _1431 = _1423 * 6.283185482025146484375;
        float _1433 = cos(_1431);
        float _1435 = _1427 * _1429;
        float _1437 = _1423 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1433 * _1435;
        float _1443 = 1.0 / _1441;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1445;
        float _1449 = 1.0 / _1447;
        float _1451 = _1439 * _1443;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = fma(_1351, _1451, _1453);
        float _1457 = _1455 * _1449;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        float _1461 = -_1459;
        float _1463 = _1461 + 1.0;
        _1361 = _1463;
    }
    float _1465 = _1361;
    uint _1468 = uint(int(uint(_1359) >> uint(2)));
    float _1470 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1468)]);
    float _1472 = floor(_1135);
    int _1474 = _1277 + 12;
    uint _1476 = uint(int(uint(_1277) >> uint(2)));
    float _1478 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1476)]);
    uint _1480 = uint(int(uint(_1474) >> uint(2)));
    float _1482 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1480)]);
    float _1484 = -_1472;
    float _1486 = _1135 + _1484;
    float _1488 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1490 = _1470 + _1486;
    float _1492 = trunc(_1490);
    int _1494 = int(_1492);
    int _1496 = _1157 + _1494;
    int _1498 = _1181 << 7;
    int _1500 = _1498 + _1496;
    int _1502 = _1500 << 4;
    float _1504 = floor(_1159);
    int _1506 = _1502 + 12;
    uint _1508 = uint(int(uint(_1502) >> uint(2)));
    float _1510 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1508)]);
    uint _1512 = uint(int(uint(_1506) >> uint(2)));
    float _1514 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1512)]);
    float _1516 = -_1504;
    float _1518 = _1159 + _1516;
    float _1520 = _1470 + _1518;
    float _1522 = trunc(_1520);
    int _1524 = int(_1522);
    int _1526 = _1181 + _1524;
    int _1528 = _1526 << 7;
    int _1530 = _1528 + _1157;
    int _1532 = _1526 << 7;
    int _1534 = _1532 + _1496;
    int _1536 = _1530 << 4;
    int _1538 = _1534 << 4;
    int _1540 = _1536 + 12;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1337 + _1542;
    int _1546 = _1538 + 12;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1339 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1554 = _1341 + _1552;
    uint _1556 = uint(int(uint(_1540) >> uint(2)));
    float _1558 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1556)]);
    uint _1560 = uint(int(uint(_1546) >> uint(2)));
    float _1562 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1560)]);
    float _1564 = _1544 * _1544;
    uint _1566 = uint(int(uint(_1536) >> uint(2)));
    float _1568 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1566)]);
    float _1570 = fma(_1550, _1550, _1564);
    uint _1572 = uint(int(uint(_1538) >> uint(2)));
    float _1574 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1572)]);
    float _1576 = fma(_1554, _1554, _1570);
    float _1578 = rsqrt(_1576);
    float _1580 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = _1550 * _1580;
    float _1584 = _1554 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 + _1588;
    float _1592 = sqrt(_1590);
    bool _1594 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1592 + _1596;
    float _1600 = _1554;
    float _1602 = _1598;
    float _1604 = _1580;
    float _1606 = as_type<float>(_1538);
    if (_1594)
    {
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1608;
    }
    float _1610 = _1600;
    if (_1594)
    {
        float _1612 = _1598 * _1610;
        _1602 = _1612;
    }
    float _1614 = _1602;
    if (_1594)
    {
        float _1616 = _1614 * 0.15915493667125701904296875;
        _1193 = _1616;
    }
    float _1618 = _1193;
    float _1620 = _1578;
    if (_1594)
    {
        float _1622 = _1618 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1620 = _1624;
    }
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1630 = _1610;
    if (_1594)
    {
        float _1632 = _1618 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = precise::max(0.0, _1628);
    float _1640 = _1590;
    float _1642 = _1638;
    if (_1594)
    {
        float _1644 = rsqrt(_1590);
        _1640 = _1644;
    }
    float _1646 = _1640;
    float _1648 = -_1580;
    float _1650 = -_1638;
    float _1652 = fma(_1544, _1648, _1650);
    float _1654 = _1652;
    if (_1594)
    {
        float _1656 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1656;
    }
    float _1658 = _1642;
    float _1660 = _1658;
    float _1662 = _1626;
    if (_1594)
    {
        float _1664 = _1626 + (-1.0);
        _1604 = _1664;
    }
    float _1666 = _1604;
    float _1668 = sqrt(_1576);
    float _1670 = _1636;
    float _1672 = _1666;
    if (_1594)
    {
        float _1674 = fma(_1636, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = _1676;
    if (_1594)
    {
        float _1680 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1680;
    }
    float _1682 = _1672;
    if (_1594)
    {
        float _1684 = _1646 * _1676;
        _1606 = _1684;
    }
    float _1686 = _1606;
    if (!_1594)
    {
        _1678 = _1582;
    }
    float _1688 = _1678;
    float _1690 = _1688;
    if (_1594)
    {
        float _1692 = fma(_1652, _1626, _1682);
        _1654 = _1692;
    }
    float _1694 = _1654;
    float _1696 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1594)
    {
        float _1698 = _1582 * _1686;
        _1690 = _1698;
    }
    float _1700 = _1690;
    if (!_1594)
    {
        _1660 = _1584;
    }
    float _1702 = _1660;
    float _1704 = _1702;
    if (_1594)
    {
        float _1706 = _1584 * _1686;
        _1704 = _1706;
    }
    float _1708 = _1704;
    if (!_1594)
    {
        _1662 = _1586;
    }
    float _1710 = _1662;
    float _1712 = _1710;
    if (_1594)
    {
        float _1714 = _1700 * _1700;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1019, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1720 = fma(_1694, _1694, _1716);
    if (!_1594)
    {
        _1696 = _1588;
    }
    float _1722 = _1696;
    float _1724 = _1722;
    if (_1594)
    {
        float _1726 = _1708 * _1708;
        _1724 = _1726;
    }
    float _1728 = _1724;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1668, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1738 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1740 = _1720 + _1728;
    float _1742 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1744 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1736);
    float _1748 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1742);
    float _1750 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1752 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1746);
    float _1754 = rsqrt(_1740);
    float _1756 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1748);
    float _1758 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1750);
    float _1760 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1762 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1766 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1760);
    float _1770 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1772 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1774 = -_1734;
    float _1776 = _1774 + 1.0;
    float _1778 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1768);
    float _1780 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1770);
    float _1782 = -_1772;
    float _1784 = fma(_1782, _1488, 1.0);
    float _1786 = abs(_1776);
    float _1788 = log2(_1786);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1780);
    float _1794 = _1754 * _1700;
    float _1796 = _1754 * _1694;
    float _1798 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1800 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1802 = _1754 * _1708;
    float _1804 = -_1800;
    float _1806 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1804);
    float _1808 = floor(_1718);
    float _1810 = -_1802;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1806);
    float _1814 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1816 = fma(_1812, -0.5, 0.5);
    float _1818 = exp2(_1814);
    float _1820 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1822 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1824 = log2(_1784);
    float _1826 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1820);
    float _1828 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1822);
    float _1830 = 1.0 / _1798;
    float _1832 = fma(_1812, 0.5, 0.5);
    float _1834 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1826);
    float _1836 = sqrt(_1816);
    float _1838 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = floor(_1738);
    float _1842 = -_1808;
    float _1844 = _1718 + _1842;
    float _1846 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1848 = _1796 + 1.0;
    float _1850 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1834);
    float _1852 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1854 = fma(_1832, _1846, -0.212114393711090087890625);
    float _1856 = -_1796;
    float _1858 = fma(_1818, _1848, _1856);
    float _1860 = _1824 * 0.693147182464599609375;
    float _1862 = _1850 * _1830;
    float _1864 = _1852 * _1830;
    float _1866 = fma(_1832, _1854, 1.570728778839111328125);
    float _1868 = _1836 * 0.636619746685028076171875;
    float _1870 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1872 = fma(_1862, 0.5, 0.5);
    float _1874 = fma(_1864, -0.5, 0.5);
    float _1876 = -_1840;
    float _1878 = _1738 + _1876;
    float _1880 = -_1866;
    float _1882 = fma(_1868, _1880, 1.0);
    float _1884 = fma(_1858, 0.5, 0.5);
    float2 _6769 = float2(_1844, _1878);
    float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6769, float2(0.0), isnan(_6769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6769, float2(0.0), isnan(_6769)), level(0.0)).x;
    float3 _6780 = float3(_1872, _1874, _1870);
    float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6780, float3(0.0), isnan(_6780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6780, float3(0.0), isnan(_6780)), level(0.0)).x;
    float3 _6791 = float3(_1872, _1874, _1870);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6791, float3(0.0), isnan(_6791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6791, float3(0.0), isnan(_6791)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _6807 = float2(_1882, _1884);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6807, float2(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6807, float2(0.0), isnan(_6807)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = floor(_1490);
    float _1913 = _1518 * _1514;
    float _1915 = in.m_72.y;
    float _1917 = in.m_62.w;
    float _1919 = in.m_72.x;
    float _1921 = -_1911;
    float _1923 = _1490 + _1921;
    float _1925 = _1923 * _1514;
    float _1927 = floor(_1913);
    float _1929 = floor(_1925);
    float _1931 = fma(_1514, _1927, _1929);
    float _1933 = floor(_1520);
    float _1935 = _1518 * _1482;
    float _1937 = _1486 * _1482;
    float _1939 = _1486 * _1558;
    float _1941 = _1923 * _1562;
    float _1943 = floor(_1935);
    float _1945 = -_1933;
    float _1947 = _1520 + _1945;
    float _1949 = floor(_1937);
    float _1951 = _1947 * _1558;
    float _1953 = _1947 * _1562;
    float _1955 = floor(_1951);
    float _1957 = floor(_1939);
    float _1959 = floor(_1941);
    float _1961 = floor(_1953);
    float _1963 = fma(_1482, _1943, _1949);
    float _1965 = fma(_1558, _1955, _1957);
    float _1967 = trunc(_1931);
    int _1969 = int(_1967);
    float _1971 = trunc(_1963);
    int _1973 = int(_1971);
    float _1975 = fma(_1562, _1961, _1959);
    float _1977 = trunc(_1965);
    int _1979 = int(_1977);
    int _1981 = as_type<int>(_1510) + _1969;
    float _1983 = trunc(_1975);
    int _1985 = int(_1983);
    int _1987 = _1981 * 656;
    int _1989 = as_type<int>(_1478) + _1973;
    int _1991 = _1987 + 262160;
    int _1993 = _1989 * 656;
    int _1995 = as_type<int>(_1568) + _1979;
    int _1997 = _1987 + 262176;
    int _1999 = _1987 + 262192;
    int _2001 = _1995 * 656;
    uint _2003 = uint(int(uint(_1991) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2003)];
    float _2005 = as_type<float>(_dmw1.x);
    int _2007 = _1991 + 4;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    float _2011 = as_type<float>(_dmw1.y);
    int _2013 = _1991 + 8;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    float _2017 = as_type<float>(_dmw1.z);
    int _2019 = _1991 + 12;
    uint _2021 = uint(int(uint(_2019) >> uint(2)));
    float _2023 = as_type<float>(_dmw1.w);
    int _2025 = as_type<int>(_1574) + _1985;
    int _2027 = _1993 + 262192;
    uint _2029 = uint(int(uint(_1997) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2029)];
    float _2031 = as_type<float>(_dmw2.x);
    int _2033 = _1997 + 4;
    uint _2035 = uint(int(uint(_2033) >> uint(2)));
    float _2037 = as_type<float>(_dmw2.y);
    int _2039 = _1997 + 8;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    float _2043 = as_type<float>(_dmw2.z);
    int _2045 = _1997 + 12;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    float _2049 = as_type<float>(_dmw2.w);
    int _2051 = _1987 + 262240;
    int _2053 = _2025 * 656;
    int _2055 = _1987 + 262144;
    uint _2057 = uint(int(uint(_1999) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2057)];
    float _2059 = as_type<float>(_dmw3.x);
    int _2061 = _1999 + 4;
    uint _2063 = uint(int(uint(_2061) >> uint(2)));
    float _2065 = as_type<float>(_dmw3.y);
    int _2067 = _1999 + 8;
    uint _2069 = uint(int(uint(_2067) >> uint(2)));
    float _2071 = as_type<float>(_dmw3.z);
    int _2073 = _1999 + 12;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    float _2077 = as_type<float>(_dmw3.w);
    int _2079 = _1987 + 262208;
    int _2081 = _1987 + 262224;
    uint _2083 = uint(int(uint(_2027) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2083)];
    float _2085 = as_type<float>(_dmw11.x);
    int _2087 = _2027 + 4;
    uint _2089 = uint(int(uint(_2087) >> uint(2)));
    float _2091 = as_type<float>(_dmw11.y);
    int _2093 = _2027 + 8;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    float _2097 = as_type<float>(_dmw11.z);
    int _2099 = _2027 + 12;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    float _2103 = as_type<float>(_dmw11.w);
    int _2105 = _1993 + 262160;
    int _2107 = _2001 + 262192;
    uint _2109 = uint(int(uint(_2051) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2109)];
    float _2111 = as_type<float>(_dmw6.x);
    int _2113 = _2051 + 4;
    uint _2115 = uint(int(uint(_2113) >> uint(2)));
    float _2117 = as_type<float>(_dmw6.y);
    int _2119 = _2051 + 8;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    float _2123 = as_type<float>(_dmw6.z);
    int _2125 = _2051 + 12;
    uint _2127 = uint(int(uint(_2125) >> uint(2)));
    float _2129 = as_type<float>(_dmw6.w);
    int _2131 = _1993 + 262144;
    int _2133 = _1993 + 262208;
    uint _2135 = uint(int(uint(_2055) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2135)];
    float _2137 = as_type<float>(_dmw0.x);
    int _2139 = _2055 + 4;
    uint _2141 = uint(int(uint(_2139) >> uint(2)));
    float _2143 = as_type<float>(_dmw0.y);
    int _2145 = _2055 + 8;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    float _2149 = as_type<float>(_dmw0.z);
    int _2151 = _2055 + 12;
    uint _2153 = uint(int(uint(_2151) >> uint(2)));
    float _2155 = as_type<float>(_dmw0.w);
    int _2157 = _2001 + 262160;
    int _2159 = _1987 + 262256;
    uint _2161 = uint(int(uint(_2079) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2161)];
    float _2163 = as_type<float>(_dmw4.x);
    int _2165 = _2079 + 4;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    float _2169 = as_type<float>(_dmw4.y);
    int _2171 = _2079 + 8;
    uint _2173 = uint(int(uint(_2171) >> uint(2)));
    float _2175 = as_type<float>(_dmw4.z);
    int _2177 = _2079 + 12;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    float _2181 = as_type<float>(_dmw4.w);
    int _2183 = _1993 + 262224;
    int _2185 = _2053 + 262192;
    uint _2187 = uint(int(uint(_2081) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2187)];
    float _2189 = as_type<float>(_dmw5.x);
    int _2191 = _2081 + 4;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    float _2195 = as_type<float>(_dmw5.y);
    int _2197 = _2081 + 8;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    float _2201 = as_type<float>(_dmw5.z);
    int _2203 = _2081 + 12;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    float _2207 = as_type<float>(_dmw5.w);
    int _2209 = _2001 + 262208;
    uint _2211 = uint(int(uint(_2105) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2211)];
    float _2213 = as_type<float>(_dmw9.x);
    int _2215 = _2105 + 4;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    float _2219 = as_type<float>(_dmw9.y);
    int _2221 = _2105 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    float _2225 = as_type<float>(_dmw9.z);
    int _2227 = _2105 + 12;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    float _2231 = as_type<float>(_dmw9.w);
    int _2233 = _2001 + 262224;
    uint _2235 = uint(int(uint(_2107) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2235)];
    float _2237 = as_type<float>(_dmw17.x);
    int _2239 = _2107 + 4;
    uint _2241 = uint(int(uint(_2239) >> uint(2)));
    float _2243 = as_type<float>(_dmw17.y);
    int _2245 = _2107 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    float _2249 = as_type<float>(_dmw17.z);
    int _2251 = _2107 + 12;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    float _2255 = as_type<float>(_dmw17.w);
    int _2257 = _2053 + 262208;
    uint _2259 = uint(int(uint(_2131) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2259)];
    float _2261 = as_type<float>(_dmw8.x);
    int _2263 = _2131 + 4;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    float _2267 = as_type<float>(_dmw8.y);
    int _2269 = _2131 + 8;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    float _2273 = as_type<float>(_dmw8.z);
    int _2275 = _2131 + 12;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    float _2279 = as_type<float>(_dmw8.w);
    int _2281 = _2053 + 262224;
    uint _2283 = uint(int(uint(_2133) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2283)];
    float _2285 = as_type<float>(_dmw12.x);
    int _2287 = _2133 + 4;
    uint _2289 = uint(int(uint(_2287) >> uint(2)));
    float _2291 = as_type<float>(_dmw12.y);
    int _2293 = _2133 + 8;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    float _2297 = as_type<float>(_dmw12.z);
    int _2299 = _2133 + 12;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    float _2303 = as_type<float>(_dmw12.w);
    int _2305 = _2001 + 262144;
    uint _2307 = uint(int(uint(_2183) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2307)];
    float _2309 = as_type<float>(_dmw13.x);
    int _2311 = _2183 + 4;
    uint _2313 = uint(int(uint(_2311) >> uint(2)));
    float _2315 = as_type<float>(_dmw13.y);
    int _2317 = _2183 + 8;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    float _2321 = as_type<float>(_dmw13.z);
    int _2323 = _2183 + 12;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    float _2327 = as_type<float>(_dmw13.w);
    int _2329 = _2001 + 262176;
    uint _2331 = uint(int(uint(_2157) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2331)];
    float _2333 = as_type<float>(_dmw16.x);
    int _2335 = _2157 + 4;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    float _2339 = as_type<float>(_dmw16.y);
    int _2341 = _2157 + 8;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    float _2345 = as_type<float>(_dmw16.z);
    int _2347 = _2157 + 12;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    float _2351 = as_type<float>(_dmw16.w);
    int _2353 = _2001 + 262240;
    uint _2355 = uint(int(uint(_2185) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2355)];
    float _2357 = as_type<float>(_dmw20.x);
    int _2359 = _2185 + 4;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    float _2363 = as_type<float>(_dmw20.y);
    int _2365 = _2185 + 8;
    uint _2367 = uint(int(uint(_2365) >> uint(2)));
    float _2369 = as_type<float>(_dmw20.z);
    int _2371 = _2185 + 12;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    float _2375 = as_type<float>(_dmw20.w);
    int _2377 = _2001 + 262256;
    uint _2379 = uint(int(uint(_2209) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2379)];
    float _2381 = as_type<float>(_dmw18.x);
    int _2383 = _2209 + 4;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw18.y);
    int _2389 = _2209 + 8;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw18.z);
    int _2395 = _2209 + 12;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    float _2399 = as_type<float>(_dmw18.w);
    int _2401 = _1993 + 262176;
    uint _2403 = uint(int(uint(_2233) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2403)];
    float _2405 = as_type<float>(_dmw19.x);
    int _2407 = _2233 + 4;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    float _2411 = as_type<float>(_dmw19.y);
    int _2413 = _2233 + 8;
    uint _2415 = uint(int(uint(_2413) >> uint(2)));
    float _2417 = as_type<float>(_dmw19.z);
    int _2419 = _2233 + 12;
    uint _2421 = uint(int(uint(_2419) >> uint(2)));
    float _2423 = as_type<float>(_dmw19.w);
    int _2425 = _1993 + 262240;
    int _2427 = _1993 + 262256;
    uint _2429 = uint(int(uint(_2257) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2429)];
    float _2431 = as_type<float>(_dmw21.x);
    int _2433 = _2257 + 4;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    float _2437 = as_type<float>(_dmw21.y);
    int _2439 = _2257 + 8;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    float _2443 = as_type<float>(_dmw21.z);
    int _2445 = _2257 + 12;
    uint _2447 = uint(int(uint(_2445) >> uint(2)));
    float _2449 = as_type<float>(_dmw21.w);
    uint _2451 = uint(int(uint(_2159) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2451)];
    float _2453 = as_type<float>(_dmw7.x);
    int _2455 = _2159 + 4;
    uint _2457 = uint(int(uint(_2455) >> uint(2)));
    float _2459 = as_type<float>(_dmw7.y);
    int _2461 = _2159 + 8;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    float _2465 = as_type<float>(_dmw7.z);
    int _2467 = _2159 + 12;
    uint _2469 = uint(int(uint(_2467) >> uint(2)));
    float _2471 = as_type<float>(_dmw7.w);
    uint _2473 = uint(int(uint(_2281) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2473)];
    float _2475 = as_type<float>(_dmw22.x);
    int _2477 = _2281 + 4;
    uint _2479 = uint(int(uint(_2477) >> uint(2)));
    float _2481 = as_type<float>(_dmw22.y);
    int _2483 = _2281 + 8;
    uint _2485 = uint(int(uint(_2483) >> uint(2)));
    float _2487 = as_type<float>(_dmw22.z);
    int _2489 = _2281 + 12;
    uint _2491 = uint(int(uint(_2489) >> uint(2)));
    float _2493 = as_type<float>(_dmw22.w);
    uint _2495 = uint(int(uint(_2305) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2495)];
    float _2497 = as_type<float>(_dmw15.x);
    int _2499 = _2305 + 4;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    float _2503 = as_type<float>(_dmw15.y);
    int _2505 = _2305 + 8;
    uint _2507 = uint(int(uint(_2505) >> uint(2)));
    float _2509 = as_type<float>(_dmw15.z);
    int _2511 = _2305 + 12;
    uint _2513 = uint(int(uint(_2511) >> uint(2)));
    float _2515 = as_type<float>(_dmw15.w);
    uint _2517 = uint(int(uint(_2427) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2517)];
    float _2519 = as_type<float>(_dmw14.x);
    int _2521 = _2427 + 4;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    float _2525 = as_type<float>(_dmw14.y);
    int _2527 = _2427 + 8;
    uint _2529 = uint(int(uint(_2527) >> uint(2)));
    float _2531 = as_type<float>(_dmw14.z);
    int _2533 = _2427 + 12;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    float _2537 = as_type<float>(_dmw14.w);
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2545 = _2543 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2549 = _2547 != 0;
    float _2551 = 1.0 / _2541;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2555 = _2553 != 0;
    float _2557 = -_1915;
    float _2559 = _2557 + 1.0;
    bool _2561 = _1917 > 0.5;
    uint _2563 = uint(int(uint(_2401) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2563)];
    float _2565 = as_type<float>(_dmw10.x);
    int _2567 = _2401 + 4;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    float _2571 = as_type<float>(_dmw10.y);
    int _2573 = _2401 + 8;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    float _2577 = as_type<float>(_dmw10.z);
    int _2579 = _2401 + 12;
    uint _2581 = uint(int(uint(_2579) >> uint(2)));
    float _2583 = as_type<float>(_dmw10.w);
    float _2585 = 1.0 / _2545;
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2589 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2587;
    bool _2591 = _2561;
    float _2593 = _1915;
    if (_2549)
    {
        bool _2595 = _491 > 0.5;
        _659 = _2595;
    }
    bool _2597 = _659;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2601 = _471 + _2599;
    bool _2603 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2605 = isnan(_471);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2611 = _2607 || _2609;
    float _2613 = float(_2611);
    uint _2615 = uint(int(uint(_2425) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2615)];
    float _2617 = as_type<float>(_dmw23.x);
    int _2619 = _2425 + 4;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    float _2623 = as_type<float>(_dmw23.y);
    int _2625 = _2425 + 8;
    uint _2627 = uint(int(uint(_2625) >> uint(2)));
    float _2629 = as_type<float>(_dmw23.z);
    int _2631 = _2425 + 12;
    uint _2633 = uint(int(uint(_2631) >> uint(2)));
    float _2635 = as_type<float>(_dmw23.w);
    bool _2637 = _489 > 0.5;
    float _2639 = _2589 * _2551;
    int _2641 = _2561 ? as_type<int>(_2559) : as_type<int>(_1915);
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2645 = _2643 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_2555)
    {
        bool _2647 = _485 > 0.5;
        _2591 = _2647;
    }
    bool _2649 = _2591;
    float _2651 = fma(_2639, _2601, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2653 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2655 = isnan(_471);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = -_2613;
    float _2667 = _2665 + 1.0;
    int _2669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2671 = _2669 != 0;
    float _2673 = _2645 * _2585;
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2677 = _471 + _2675;
    bool _2679 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2681 = isnan(_471);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2687 = _2683 || _2685;
    float _2689 = float(_2687);
    float _2691 = _2663 * _2667;
    float _2693 = -_2663;
    float _2695 = _2693 + 1.0;
    float _2697 = fma(_2673, _2677, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2699 = _2053 + 262176;
    uint _2701 = uint(int(uint(_2329) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2701)];
    float _2703 = as_type<float>(_dmw24.x);
    int _2705 = _2329 + 4;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    float _2709 = as_type<float>(_dmw24.y);
    int _2711 = _2329 + 8;
    uint _2713 = uint(int(uint(_2711) >> uint(2)));
    float _2715 = as_type<float>(_dmw24.z);
    int _2717 = _2329 + 12;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    float _2721 = as_type<float>(_dmw24.w);
    float _2723 = _2689 * _2695;
    int _2725 = _2053 + 262144;
    int _2727 = 0;
    float _2729 = _2695;
    if (_2549)
    {
        float _2731 = -_1919;
        float _2733 = _2731 + 1.0;
        _2727 = as_type<int>(_2733);
    }
    int _2735 = _2727;
    int _2737 = _2053 + 262160;
    float _2739 = _2651 * _2723;
    int _2741 = _2053 + 262240;
    float _2743 = -_2689;
    float _2745 = _2743 + 1.0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2749 = _2747 != 0;
    uint _2751 = uint(int(uint(_2353) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2751)];
    float _2753 = as_type<float>(_dmw25.x);
    int _2755 = _2353 + 4;
    uint _2757 = uint(int(uint(_2755) >> uint(2)));
    float _2759 = as_type<float>(_dmw25.y);
    int _2761 = _2353 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    float _2765 = as_type<float>(_dmw25.z);
    int _2767 = _2353 + 12;
    uint _2769 = uint(int(uint(_2767) >> uint(2)));
    float _2771 = as_type<float>(_dmw25.w);
    int _2773 = _2053 + 262256;
    uint _2775 = uint(int(uint(_2377) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
    float _2777 = as_type<float>(_dmw26.x);
    int _2779 = _2377 + 4;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    float _2783 = as_type<float>(_dmw26.y);
    int _2785 = _2377 + 8;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    float _2789 = as_type<float>(_dmw26.z);
    int _2791 = _2377 + 12;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    float _2795 = as_type<float>(_dmw26.w);
    float _2797 = _2745;
    if (!_2549)
    {
        _2729 = _1919;
    }
    float _2799 = _2729;
    float _2801 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2739);
    float _2803 = _2749 ? as_type<float>(_2641) : _1915;
    uint _2805 = uint(int(uint(_2725) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2805)];
    float _2807 = as_type<float>(_dmw27.x);
    int _2809 = _2725 + 4;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    float _2813 = as_type<float>(_dmw27.y);
    int _2815 = _2725 + 8;
    uint _2817 = uint(int(uint(_2815) >> uint(2)));
    float _2819 = as_type<float>(_dmw27.z);
    int _2821 = _2725 + 12;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    float _2825 = as_type<float>(_dmw27.w);
    float _2827 = _2799;
    if (_2671)
    {
        float _2829 = _2637 ? _2559 : _1915;
        _2593 = _2829;
    }
    float _2831 = _2593;
    if (_2549)
    {
        float _2833 = _2597 ? as_type<float>(_2735) : _1919;
        _2827 = _2833;
    }
    float _2835 = _2827;
    uint _2837 = uint(int(uint(_2737) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2837)];
    float _2839 = as_type<float>(_dmw28.x);
    int _2841 = _2737 + 4;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    float _2845 = as_type<float>(_dmw28.y);
    int _2847 = _2737 + 8;
    uint _2849 = uint(int(uint(_2847) >> uint(2)));
    float _2851 = as_type<float>(_dmw28.z);
    int _2853 = _2737 + 12;
    uint _2855 = uint(int(uint(_2853) >> uint(2)));
    float _2857 = as_type<float>(_dmw28.w);
    uint _2859 = uint(int(uint(_2699) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2859)];
    float _2861 = as_type<float>(_dmw29.x);
    int _2863 = _2699 + 4;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    float _2867 = as_type<float>(_dmw29.y);
    int _2869 = _2699 + 8;
    uint _2871 = uint(int(uint(_2869) >> uint(2)));
    float _2873 = as_type<float>(_dmw29.z);
    int _2875 = _2699 + 12;
    uint _2877 = uint(int(uint(_2875) >> uint(2)));
    float _2879 = as_type<float>(_dmw29.w);
    uint _2881 = uint(int(uint(_2741) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2881)];
    float _2883 = as_type<float>(_dmw30.x);
    int _2885 = _2741 + 4;
    uint _2887 = uint(int(uint(_2885) >> uint(2)));
    float _2889 = as_type<float>(_dmw30.y);
    int _2891 = _2741 + 8;
    uint _2893 = uint(int(uint(_2891) >> uint(2)));
    float _2895 = as_type<float>(_dmw30.z);
    int _2897 = _2741 + 12;
    uint _2899 = uint(int(uint(_2897) >> uint(2)));
    float _2901 = as_type<float>(_dmw30.w);
    uint _2903 = uint(int(uint(_2773) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2903)];
    float _2905 = as_type<float>(_dmw31.x);
    int _2907 = _2773 + 4;
    uint _2909 = uint(int(uint(_2907) >> uint(2)));
    float _2911 = as_type<float>(_dmw31.y);
    int _2913 = _2773 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    float _2917 = as_type<float>(_dmw31.z);
    int _2919 = _2773 + 12;
    uint _2921 = uint(int(uint(_2919) >> uint(2)));
    float _2923 = as_type<float>(_dmw31.w);
    float _2925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2927 = 0;
    if (_2555)
    {
        float _2929 = -_1919;
        float _2931 = _2929 + 1.0;
        _2927 = as_type<int>(_2931);
    }
    int _2933 = _2927;
    float _2935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_2555)
    {
        _2797 = _1919;
    }
    float _2937 = _2797;
    float _2939 = fma(_2697, _2691, _2801);
    float _2941 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2943 = _2937;
    if (_2555)
    {
        float _2945 = _2649 ? as_type<float>(_2933) : _1919;
        _2943 = _2945;
    }
    float _2947 = _2943;
    float _2949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2951 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2953 = fma(_2613, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2939);
    float _2955 = _2803 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2957 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2959 = _2951 * _2925;
    float _2961 = _2947 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2963 = _2957 * _2935;
    float _2965 = _2955 * _2941;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2971 = _2961 * _2949;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2975 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2979 = _2953 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2981 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _2959;
    out.m_74.y = _2963;
    out.m_74.z = _2971;
    out.m_74.w = _2965;
    float _2983 = _919 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2985 = _919 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2987 = _919 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2989 = in.m_76.x;
    float _2991 = in.m_76.y;
    float _2993 = in.m_76.z;
    bool _2995 = _875 != 0.0;
    bool _2997 = isnan(_875);
    bool _2999 = _2995 || _2997;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    out.m_78.x = _2975;
    out.m_78.y = _2977;
    out.m_78.z = _2981;
    out.m_78.w = _2979;
    float _3005 = _931 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3007 = _877 == 0.0;
    bool _3009 = !_3003;
    bool _3011 = _3007 && _3009;
    float _3013 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3005);
    float _3015 = in.m_80.x;
    float _3017 = in.m_80.y;
    float _3019 = in.m_80.z;
    float _3021 = in.m_80.w;
    float _3023 = abs(_1351);
    float _3025 = log2(_3023);
    bool _3027 = _879 == 0.0;
    bool _3029 = _3027 && _3011;
    float _3031 = _937 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3033 = -_899;
    float _3035 = fma(_3033, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2983);
    out.m_82.x = 1.0;
    out.m_82.y = 1.0;
    out.m_82.z = 1.0;
    float _3037 = -_899;
    float _3039 = fma(_3037, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2985);
    float _3041 = -_899;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2987);
    out.m_84.w = _815;
    float _3045 = 0.0;
    float _3047 = _2989;
    if (_3029)
    {
        _3045 = _2989;
    }
    float _3049 = _3045;
    float _3051 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3031);
    float _3053 = 0.0;
    float _3055 = _3049;
    if (_3029)
    {
        _3053 = _2993;
    }
    float _3057 = _3053;
    float _3059 = _931 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3061 = _931 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3063 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3065 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3059);
    float _3067 = _937 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3069 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3039);
    float _3071 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3073 = _937 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3075 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3035);
    float _3077 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3079 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3081 = 0.0;
    float _3083 = _3065;
    float _3085 = _3057;
    if (_3029)
    {
        _3081 = _2991;
    }
    float _3087 = _3081;
    float _3089 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3051);
    float _3091 = _3087;
    if (_3029)
    {
        _1035 = _3049;
    }
    float _3093 = _1035;
    float _3095 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3067);
    float _3097 = _3093;
    if (!_3029)
    {
        _3055 = _2989;
    }
    float _3099 = _3055;
    float _3101 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3013);
    if (_3029)
    {
        _3083 = _3057;
    }
    float _3103 = _3083;
    float _3105 = _3069 * _3017;
    float _3107 = _3103;
    if (!_3029)
    {
        _3085 = _2993;
    }
    float _3109 = _3085;
    float _3111 = exp2(_3063);
    float _3113 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3073);
    float _3115 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3117 = _3075 * _3017;
    float _3119 = _3077 * _3017;
    if (_3029)
    {
        _3047 = _3087;
    }
    float _3121 = _3047;
    float _3123 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3095);
    float _3125 = _3121;
    if (!_3029)
    {
        _3091 = _2991;
    }
    float _3127 = _3091;
    if (!_3029)
    {
        float _3129 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3099);
        _3097 = _3129;
    }
    float _3131 = _3097;
    float _3133 = fma(_3101, _3015, _3105);
    float _3135 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3113);
    float _3137 = fma(_3079, _3015, _3117);
    float _3139 = fma(_3115, _3015, _3119);
    float _3141 = _3019 * _3099;
    float _3143 = _3015 * _3127;
    float _3145 = fma(_3123, _3019, _3133);
    float _3147 = _3017 * _3109;
    float _3149 = fma(_3089, _3019, _3137);
    float _3151 = fma(_3135, _3019, _3139);
    float _3153 = -_3141;
    float _3155 = fma(_3015, _3109, _3153);
    if (!_3029)
    {
        float _3157 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3127);
        _3125 = _3157;
    }
    float _3159 = _3125;
    float _3161 = -_3147;
    float _3163 = fma(_3019, _3127, _3161);
    float _3165 = _3155 * _3021;
    out.m_86.x = _3149;
    out.m_86.y = _3145;
    out.m_86.z = _3151;
    if (!_3029)
    {
        float _3167 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3109);
        _3107 = _3167;
    }
    float _3169 = _3107;
    float _3171 = _3069 * _3159;
    float _3173 = _3075 * _3159;
    float _3175 = fma(_3111, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3177 = precise::clamp(_3175, 0.0, 1.0);
    float _3179 = -_3143;
    float _3181 = fma(_3017, _3099, _3179);
    float _3183 = _3163 * _3021;
    float _3185 = _3165 * _3075;
    float _3187 = _3165 * _3069;
    float _3189 = _3077 * _3159;
    float _3191 = _3165 * _3077;
    float _3193 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3195 = fma(_3101, _3131, _3171);
    float _3197 = fma(_3079, _3131, _3173);
    float _3199 = _3177 * _3177;
    float _3201 = fma(_3177, -2.0, 3.0);
    float _3203 = _3181 * _3021;
    float _3205 = fma(_3183, _3079, _3185);
    float _3207 = fma(_3183, _3101, _3187);
    float _3209 = fma(_3183, _3115, _3191);
    float _3211 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3193);
    float _3213 = _3199 * _3201;
    float _3215 = fma(_3203, _3123, _3207);
    float _3217 = fma(_3203, _3089, _3205);
    float _3219 = fma(_3203, _3135, _3209);
    float _3221 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3211);
    out.m_88.x = _1019;
    out.m_88.y = _999;
    out.m_88.z = _977;
    float _3223 = -_1943;
    float _3225 = _1935 + _3223;
    float _3227 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3221);
    out.m_90.x = _3217;
    out.m_90.y = _3215;
    out.m_90.z = _3219;
    float _3229 = -_1949;
    float _3231 = _1937 + _3229;
    float _3233 = -_3213;
    float _3235 = _3233 + 1.0;
    float _3237 = _1798 * 0.5;
    float _3239 = _3227 + _1798;
    float _3241 = fma(_1852, -0.5, _3237);
    float _3243 = -_3225;
    float _3245 = _3243 + 1.0;
    out.m_92.x = _895;
    bool _3247 = _1351 <= 8000.0;
    bool _3249 = isnan(_1351);
    bool _3251 = _3247 || _3249;
    bool _3253 = isnan(8000.0);
    bool _3255 = _3251 || _3253;
    float _3257 = float(_3255);
    float _3259 = _1850 + _1798;
    float _3261 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3213);
    float _3263 = _3239 * 0.5;
    float _3265 = -_3231;
    float _3267 = _3265 + 1.0;
    float _3269 = _3231 * _3245;
    out.gl_Position.x = _1850;
    out.gl_Position.y = _1852;
    out.gl_Position.z = _3227;
    out.gl_Position.w = _1798;
    float _3271 = _3259 * 0.5;
    float _3273 = _3257 * _3261;
    float _3275 = _3267 * _3245;
    float _3277 = _3225 * _3267;
    out.m_94.x = _3271;
    out.m_94.y = _3241;
    out.m_94.z = _3263;
    out.m_94.w = _1798;
    float _3279 = _3269 * _2005;
    float _3281 = _3269 * _2037;
    float _3283 = _3269 * _2011;
    float _3285 = _3269 * _2059;
    float _3287 = _3269 * _2023;
    float _3289 = _3269 * _2031;
    float _3291 = _3269 * _2043;
    float _3293 = _3269 * _2065;
    float _3295 = _3269 * _2077;
    float _3297 = fma(_3275, _2085, _3285);
    float _3299 = _3269 * _2117;
    float _3301 = _3269 * _2137;
    float _3303 = _3269 * _2143;
    float _3305 = _3269 * _2163;
    float _3307 = fma(_3275, _2091, _3293);
    float _3309 = _3269 * _2149;
    float _3311 = _3269 * _2111;
    float _3313 = _3269 * _2195;
    float _3315 = fma(_3275, _2219, _3283);
    float _3317 = fma(_3275, _2103, _3295);
    float _3319 = _3231 * _3225;
    float _3321 = _3269 * _2155;
    float _3323 = _3269 * _2169;
    float _3325 = fma(_3277, _2237, _3297);
    float _3327 = _3269 * _2017;
    float _3329 = _3269 * _2049;
    float _3331 = _3269 * _2129;
    float _3333 = _3269 * _2201;
    float _3335 = fma(_3275, _2261, _3301);
    float _3337 = fma(_3275, _2285, _3305);
    float _3339 = fma(_3277, _2243, _3307);
    float _3341 = _3269 * _2071;
    float _3343 = _3269 * _2175;
    float _3345 = fma(_3275, _2315, _3313);
    float _3347 = fma(_3277, _2339, _3315);
    float _3349 = fma(_3277, _2255, _3317);
    float _3351 = _3269 * _2189;
    float _3353 = _3269 * _2207;
    float _3355 = fma(_3275, _2291, _3323);
    float _3357 = fma(_3319, _2357, _3325);
    float _3359 = _3269 * _2123;
    float _3361 = _3269 * _2181;
    float _3363 = fma(_3275, _2321, _3333);
    float _3365 = fma(_3277, _2381, _3337);
    float _3367 = fma(_3319, _2363, _3339);
    float _3369 = fma(_3275, _2297, _3343);
    float _3371 = fma(_3277, _2411, _3345);
    float _3373 = fma(_3319, _2375, _3349);
    float _3375 = fma(_3275, _2309, _3351);
    float _3377 = fma(_3275, _2327, _3353);
    float _3379 = fma(_3277, _2387, _3355);
    float _3381 = _3357 * 0.886227548122406005859375;
    float _3383 = fma(_3275, _2303, _3361);
    float _3385 = fma(_3277, _2417, _3363);
    float _3387 = fma(_3319, _2431, _3365);
    float _3389 = _3367 * 0.886227548122406005859375;
    float _3391 = _3269 * _2459;
    float _3393 = fma(_3277, _2393, _3369);
    float _3395 = fma(_3319, _2481, _3371);
    float _3397 = _3373 * 0.511664927005767822265625;
    float _3399 = fma(_3277, _2405, _3375);
    float _3401 = fma(_3277, _2423, _3377);
    float _3403 = fma(_3319, _2437, _3379);
    float _3405 = precise::max(_3381, 0.00999999977648258209228515625);
    float _3407 = fma(_3277, _2497, _3335);
    float _3409 = fma(_3277, _2399, _3383);
    float _3411 = fma(_3319, _2487, _3385);
    float _3413 = _3387 * 0.511664927005767822265625;
    float _3415 = fma(_3319, _2443, _3393);
    float _3417 = _3395 * 0.511664927005767822265625;
    float _3419 = _3397 * _3397;
    float _3421 = precise::max(_3389, 0.00999999977648258209228515625);
    float _3423 = fma(_3275, _2525, _3391);
    float _3425 = fma(_3319, _2493, _3401);
    float _3427 = _3403 * 0.511664927005767822265625;
    float _3429 = 1.0 / _3405;
    float _3431 = fma(_3319, _2449, _3409);
    float _3433 = _3411 * 0.511664927005767822265625;
    float _3435 = _3415 * 0.511664927005767822265625;
    float _3437 = fma(_3417, _3417, _3419);
    float _3439 = fma(_3319, _2475, _3399);
    float _3441 = _3425 * 0.511664927005767822265625;
    float _3443 = 1.0 / _3421;
    float _3445 = _3413 * _3413;
    float _3447 = _3431 * 0.511664927005767822265625;
    float _3449 = fma(_3435, _3435, _3437);
    float _3451 = fma(_3433, _3433, _3445);
    float _3453 = _3427 * _3427;
    float _3455 = _3439 * 0.511664927005767822265625;
    float _3457 = fma(_3447, _3447, _3451);
    float _3459 = fma(_3441, _3441, _3453);
    float _3461 = sqrt(_3449);
    float _3463 = fma(_3455, _3455, _3459);
    float _3465 = sqrt(_3457);
    float _3467 = sqrt(_3463);
    float _3469 = precise::max(_3461, 0.00999999977648258209228515625);
    float _3471 = fma(_3275, _2097, _3341);
    float _3473 = _3269 * _2471;
    float _3475 = precise::max(_3465, 0.00999999977648258209228515625);
    float _3477 = 1.0 / _3469;
    float _3479 = fma(_3275, _2267, _3303);
    float _3481 = _3269 * _2453;
    float _3483 = _3269 * _2465;
    float _3485 = precise::max(_3467, 0.00999999977648258209228515625);
    float _3487 = 1.0 / _3475;
    float _3489 = fma(_3277, _2249, _3471);
    float _3491 = fma(_3275, _2273, _3309);
    float _3493 = fma(_3275, _2279, _3321);
    float _3495 = fma(_3275, _2213, _3279);
    float _3497 = 1.0 / _3485;
    float _3499 = fma(_3275, _2225, _3327);
    float _3501 = fma(_3275, _2231, _3287);
    float _3503 = fma(_3275, _2565, _3289);
    float _3505 = fma(_3275, _2571, _3281);
    float _3507 = fma(_3275, _2577, _3291);
    float _3509 = fma(_3275, _2583, _3329);
    float _3511 = fma(_3275, _2617, _3311);
    float _3513 = fma(_3275, _2623, _3299);
    float _3515 = fma(_3275, _2629, _3359);
    float _3517 = fma(_3275, _2635, _3331);
    float _3519 = fma(_3275, _2519, _3481);
    float _3521 = fma(_3275, _2531, _3483);
    float _3523 = fma(_3275, _2537, _3473);
    float _3525 = fma(_3319, _2369, _3489);
    float _3527 = fma(_3277, _2503, _3479);
    float _3529 = fma(_3277, _2509, _3491);
    float _3531 = fma(_3277, _2515, _3493);
    float _3533 = fma(_3277, _2333, _3495);
    float _3535 = fma(_3277, _2345, _3499);
    float _3537 = fma(_3277, _2351, _3501);
    float _3539 = fma(_3277, _2703, _3503);
    float _3541 = fma(_3277, _2709, _3505);
    float _3543 = fma(_3277, _2715, _3507);
    float _3545 = fma(_3277, _2721, _3509);
    float _3547 = fma(_3277, _2753, _3511);
    float _3549 = fma(_3277, _2759, _3513);
    float _3551 = fma(_3277, _2765, _3515);
    float _3553 = fma(_3277, _2771, _3517);
    float _3555 = fma(_3277, _2777, _3519);
    float _3557 = fma(_3277, _2783, _3423);
    float _3559 = fma(_3277, _2789, _3521);
    float _3561 = fma(_3277, _2795, _3523);
    float _3563 = _3525 * 0.886227548122406005859375;
    float _3565 = _3397 * _3477;
    float _3567 = fma(_3123, _3169, _3195);
    float _3569 = fma(_3319, _2807, _3407);
    float _3571 = fma(_3319, _2813, _3527);
    float _3573 = fma(_3319, _2819, _3529);
    float _3575 = fma(_3319, _2825, _3531);
    float _3577 = fma(_3319, _2839, _3533);
    float _3579 = fma(_3319, _2845, _3347);
    float _3581 = fma(_3319, _2851, _3535);
    float _3583 = fma(_3319, _2857, _3537);
    float _3585 = fma(_3319, _2861, _3539);
    float _3587 = fma(_3319, _2867, _3541);
    float _3589 = fma(_3319, _2873, _3543);
    float _3591 = fma(_3319, _2879, _3545);
    float _3593 = fma(_3319, _2883, _3547);
    float _3595 = fma(_3319, _2889, _3549);
    float _3597 = fma(_3319, _2895, _3551);
    float _3599 = fma(_3319, _2901, _3553);
    float _3601 = fma(_3319, _2905, _3555);
    float _3603 = fma(_3319, _2911, _3557);
    float _3605 = fma(_3319, _2917, _3559);
    float _3607 = fma(_3319, _2923, _3561);
    float _3609 = precise::max(_3563, 0.00999999977648258209228515625);
    float _3611 = _3469 * _3429;
    float _3613 = precise::clamp(_3611, 0.0, 1.0);
    float _3615 = _3475 * _3443;
    float _3617 = precise::clamp(_3615, 0.0, 1.0);
    float _3619 = _3413 * _3487;
    float _3621 = _3417 * _3477;
    float _3623 = fma(_3089, _3169, _3197);
    float _3625 = _3567 * _3565;
    float _3627 = _3427 * _3497;
    float _3629 = _3435 * _3477;
    float _3631 = 1.0 / _3609;
    float _3633 = fma(_3115, _3131, _3189);
    float _3635 = _3433 * _3487;
    float _3637 = fma(_3623, _3621, _3625);
    float _3639 = _3441 * _3497;
    float _3641 = _3567 * _3627;
    float _3643 = _3567 * _3619;
    float _3645 = fma(_3135, _3169, _3633);
    float _3647 = _3613 + 1.0;
    float _3649 = _3447 * _3487;
    float _3651 = fma(_3623, _3635, _3643);
    float _3653 = _3567 * 1.02332699298858642578125;
    float _3655 = _3455 * _3497;
    float _3657 = fma(_3623, _3639, _3641);
    float _3659 = fma(_3645, _3629, _3637);
    float _3661 = 1.0 / _3647;
    float _3663 = _3575 * _3653;
    float _3665 = fma(_3645, _3655, _3657);
    float _3667 = fma(_3659, 0.5, 0.5);
    float _3669 = fma(_3645, _3649, _3651);
    float _3671 = fma(_3665, 0.5, 0.5);
    float _3673 = fma(_3669, 0.5, 0.5);
    float _3675 = _3577 * _3653;
    float _3677 = abs(_3671);
    float _3679 = log2(_3677);
    float _3681 = _3579 * _3653;
    float _3683 = _3595 * _3653;
    float _3685 = _3603 * _3653;
    float _3687 = fma(_3569, 0.88622701168060302734375, _3663);
    float _3689 = abs(_3667);
    float _3691 = log2(_3689);
    float _3693 = fma(_3571, 0.88622701168060302734375, _3675);
    float _3695 = fma(_3573, 0.88622701168060302734375, _3681);
    float _3697 = fma(_3593, 0.88622701168060302734375, _3683);
    float _3699 = _3645 * 1.02332699298858642578125;
    float _3701 = abs(_3673);
    float _3703 = log2(_3701);
    float _3705 = fma(_3601, 0.88622701168060302734375, _3685);
    float _3707 = _3485 * _3631;
    float _3709 = precise::clamp(_3707, 0.0, 1.0);
    float _3711 = fma(_3581, _3699, _3687);
    float _3713 = fma(_3583, _3699, _3693);
    float _3715 = fma(_3585, _3699, _3695);
    float _3717 = fma(_3597, _3699, _3697);
    float _3719 = fma(_3605, _3699, _3705);
    float _3721 = _3623 * 1.02332699298858642578125;
    float _3723 = fma(_3613, 2.0, 1.0);
    float _3725 = fma(_3617, 2.0, 1.0);
    float _3727 = fma(_3709, 2.0, 1.0);
    float _3729 = fma(_3599, _3721, _3717);
    float _3731 = _3723 * _3691;
    float _3733 = _3727 * _3679;
    float _3735 = _3725 * _3703;
    float _3737 = _3729 * 0.31830990314483642578125;
    float _3739 = precise::clamp(_3737, 0.0, 1.0);
    float _3741 = fma(_3587, _3721, _3711);
    float _3743 = _3617 + 1.0;
    float _3745 = _3709 + 1.0;
    float _3747 = exp2(_3731);
    float _3749 = _3739 * 0.88622701168060302734375;
    float _3751 = fma(_3589, _3721, _3713);
    float _3753 = fma(_3591, _3721, _3715);
    float _3755 = fma(_3607, _3721, _3719);
    float _3757 = exp2(_3735);
    float _3759 = precise::max(0.0, _3741);
    float _3761 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _3763 = exp2(_3733);
    float _3765 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[17].x, _3761);
    float _3767 = -_3613;
    float _3769 = _3767 + 1.0;
    float _3771 = 1.0 / _3743;
    float _3773 = -_3617;
    float _3775 = _3773 + 1.0;
    float _3777 = 1.0 / _3745;
    float _3779 = _3755 * 0.31830990314483642578125;
    float _3781 = precise::clamp(_3779, 0.0, 1.0);
    float _3783 = fma(_3613, 2.0, 2.0);
    float _3785 = fma(_3617, 2.0, 2.0);
    float _3787 = fma(_3709, 2.0, 2.0);
    float _3789 = precise::max(0.0, _3751);
    float _3791 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _3793 = -_3709;
    float _3795 = _3793 + 1.0;
    float _3797 = _3783 * _3747;
    float _3799 = -_3781;
    float _3801 = _3799 + 1.0;
    float _3803 = _3785 * _3757;
    float _3805 = _3787 * _3763;
    float _3807 = in.m_96.x;
    float _3809 = _1788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_98.x = _3623;
    out.m_98.y = _3567;
    out.m_98.z = _3645;
    float _3811 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[659].w, _3781);
    out.m_100.x = _1339;
    out.m_100.y = _1337;
    out.m_100.z = _1341;
    float _3813 = fma(_3789, (*spvDescriptorSet0.vp_c15)._m0[17].y, _3791);
    out.m_102.x = 0.0;
    float _3815 = _3769 * _3661;
    float _3817 = _3775 * _3771;
    float _3819 = _3795 * _3777;
    float _3821 = -_3797;
    float _3823 = _3821 + 1.0;
    float _3825 = -_3803;
    float _3827 = _3825 + 1.0;
    float _3829 = -_3805;
    float _3831 = _3829 + 1.0;
    bool _3833 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3835 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _3837 = precise::max(0.0, _3753);
    float _3839 = fma(_3815, _3823, _3797);
    float _3841 = fma(_3817, _3827, _3803);
    float _3843 = fma(_3819, _3831, _3805);
    float _3845 = exp2(_3809);
    float _3847 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[17].z, _3835);
    float _3849 = _3381 * _3839;
    float _3851 = _3389 * _3841;
    float _3853 = _3811 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _3855 = _3563 * _3843;
    float _3857 = fma(_3849, _3853, _3765);
    float _3859 = fma(_3851, _3853, _3813);
    float _3861 = fma(_3855, _3853, _3847);
    float _3863 = _1411 * _1465;
    float _3865 = _3857 * 0.31830990314483642578125;
    float _3867 = _3859 * 0.31830990314483642578125;
    float _3869 = _3861 * 0.31830990314483642578125;
    bool _3871 = !_3833;
    if (!_3871)
    {
        float _3873 = -_1337;
        float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3877 = -_1339;
        float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3881 = -_1341;
        float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3885 = _3875 * _3875;
        float _3887 = fma(_3879, _3879, _3885);
        float _3889 = fma(_3883, _3883, _3887);
        float _3891 = sqrt(_3889);
        float _3893 = rsqrt(_3889);
        float _3895 = -_3891;
        float _3897 = _3895 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3899 = _3897 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3901 = precise::clamp(_3899, 0.0, 1.0);
        float _3903 = _3879 * _3893;
        float _3905 = _3875 * _3893;
        float _3907 = abs(_3901);
        float _3909 = log2(_3907);
        float _3911 = _3883 * _3893;
        float _3913 = _3903 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3915 = _3567 * _3905;
        float _3917 = -_3905;
        float _3919 = -_3913;
        float _3921 = fma(_3917, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3919);
        float _3923 = fma(_3623, _3903, _3915);
        float _3925 = -_3911;
        float _3927 = fma(_3925, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3921);
        float _3929 = fma(_3645, _3911, _3923);
        float _3931 = precise::clamp(_3929, 0.0, 1.0);
        float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3935 = _3927 + _3933;
        float _3937 = _3909 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3939 = _3935 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3941 = precise::clamp(_3939, 0.0, 1.0);
        float _3943 = exp2(_3937);
        float _3945 = _3943 * _3941;
        float _3947 = _3931 * _3945;
        float _3949 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3951 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3953 = _3947 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3949;
        out.m_102.y = _3951;
        out.m_102.z = _3953;
    }
    float _3955 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3957 = -_3845;
    float _3959 = _3957 + 1.0;
    float _3961 = -_1886;
    float _3963 = _3961 + 1.0;
    float _3965 = _3863 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3967 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3969 = _3963 * _3955;
    float _3971 = precise::clamp(_3969, 0.0, 1.0);
    bool _3973 = _1411 > 0.0;
    bool _3975 = isnan(_1411);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan(0.0);
    bool _3981 = _3977 || _3979;
    float _3983 = _3965 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3985 = _3967 * _1888;
    float _3987 = -_3971;
    float _3989 = fma(_3987, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _3991 = _1465 <= 0.0;
    bool _3993 = !_3981;
    bool _3995 = _3991 || _3993;
    float _3997 = -_3967;
    float _3999 = _3997 + 1.0;
    float _4001 = _1899 * _3985;
    float _4003 = _3989 * _3807;
    float _4005 = _1909 * _3985;
    out.m_56.x = _3983;
    float _4007 = fma(_1905, _4001, _1893);
    float _4009 = fma(_1907, _4001, _1895);
    float _4011 = _4003 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4013 = _1899 * _3999;
    float _4015 = fma(_1899, _4005, _1897);
    out.m_84.x = _3865;
    out.m_84.y = _3867;
    out.m_84.z = _3869;
    out.m_104.x = _4011;
    out.m_106.x = _4007;
    out.m_106.y = _4009;
    out.m_106.z = _4015;
    out.m_106.w = _4013;
    if (!_3995)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _4017 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4017;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

