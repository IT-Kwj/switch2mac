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
    float4 m_90 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_104 [[user(locn5)]];
    float4 m_106 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _4022 = as_type<float>(_141);
        out.gl_Position.z = _4022;
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
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_56.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4091 = as_type<float>(_179);
        out.gl_Position.z = _4091;
    }
    if (_173)
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
    float _311 = _301 * _293;
    float _313 = fma(_305, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _315 = fma(_309, _299, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _317 = _313 * _293;
    float _319 = _315 * _293;
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _311);
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
    bool _369 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _371 = isnan(_367);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _385 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _387 = isnan(_367);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _367 + _401;
    float _405 = -_379;
    float _407 = _405 + 1.0;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _411 = 1.0 / _383;
    float _413 = _395 * _407;
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = _399 * _411;
    float _421 = fma(_419, _403, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _423 = _421 * _413;
    float _425 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[115].x, _423);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _433 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[116].x, _425);
    float _435 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _435;
    out.m_66.y = _437;
    out.m_66.z = _439;
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
    float _473 = in.m_62.x;
    float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _477 = log2(_475);
    float _479 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _481 = in.m_62.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _485 = 1.0 + _483;
    float _487 = in.m_62.y;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _499 = _497 != 0;
    float _501 = 1.0 / _485;
    float _503 = in.m_53.x;
    float _505 = in.m_53.y;
    float _507 = in.m_53.z;
    bool _509 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _511 = isnan(1.0);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _517 = _513 || _515;
    bool _519 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = in.m_68.x;
    float _531 = in.m_68.y;
    float _533 = in.m_68.z;
    float _535 = _477 * _159;
    float _537 = exp2(_535);
    float _539 = _473 * 2.0;
    float _541 = _481 * 2.0;
    float _543 = _473 + _481;
    float _545 = floor(_539);
    float _547 = _487 * 2.0;
    float _549 = _543 + (-1.0);
    float _551 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _553 = -_537;
    float _555 = _553 + 1.0;
    float _557 = floor(_541);
    float _559 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _561 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
    float _563 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _565 = _527 ? _555 : 0.0;
    float _567 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
    float _569 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
    float _573 = floor(_547);
    float _575 = _487 + _481;
    bool _577 = _545 > 0.0;
    if (_517)
    {
        float _579 = _565 * _501;
        _163 = _579;
    }
    float _581 = _163;
    bool _583 = _545 >= 0.0;
    bool _585 = isnan(_545);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = _575 + (-1.0);
    float _595 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
    float _597 = _569 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _599 = _557 > 0.0;
    float _601 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _603 = _557 >= 0.0;
    bool _605 = isnan(_557);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _615 = _591 ? 0 : 1;
    float _617 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
    int _619 = _611 ? 0 : 1;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _623 = _597 + _621;
    bool _625 = !_495;
    int _627 = _625 ? 0 : 1;
    bool _629 = _573 > 0.0;
    float _631 = _623 * _623;
    bool _633 = _573 >= 0.0;
    bool _635 = isnan(_573);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _645 = !_491;
    int _647 = _645 ? 0 : 1;
    int _649 = ~_619;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _657 = _643 + _655;
    int _659 = ~_615;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _653;
    int _667 = _663;
    bool _669 = _629;
    if (!_599)
    {
        int _671 = ~_619;
        int _673 = _671 + 1;
        _665 = _673;
    }
    int _675 = _665;
    int _677 = abs(_627);
    if (!_577)
    {
        int _679 = ~_615;
        int _681 = _679 + 1;
        _667 = _681;
    }
    int _683 = _667;
    float _685 = in.m_70.x;
    float _687 = in.m_70.y;
    float _689 = in.m_70.z;
    int _691 = abs(_647);
    float _693 = _617 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _695 = _641 ? 0 : 1;
    float _697 = fma(_657, _657, _631);
    float _699 = float(_677);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _693 + _701;
    float _705 = float(_683);
    int _707 = ~_695;
    int _709 = _707 + 1;
    int _711 = _709 + 1;
    int _713 = _711;
    if (!_629)
    {
        int _715 = ~_695;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    float _721 = fma(_703, _703, _697);
    float _723 = _699 * _705;
    float _725 = float(_675);
    float _727 = sqrt(_721);
    float _729 = float(_691);
    float _731 = _723 * (-2.0);
    bool _733 = !_499;
    int _735 = _733 ? 0 : 1;
    float _737 = _487 + (-0.5);
    float _739 = float(_719);
    float _741 = _729 * _725;
    int _743 = abs(_735);
    float _745 = fma(_731, _687, _687);
    float _747 = fma(_601, _731, _601);
    float _749 = rsqrt(_721);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _753 = _473 + _487;
    float _755 = _479 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _757 = float(_743);
    float _759 = _727 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _761 = _753 + (-1.0);
    float _763 = fma(_747, _581, _751);
    float _765 = _741 * (-2.0);
    float _767 = _757 * _739;
    float _769 = precise::min(_755, _759);
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _773 = _473 + (-0.5);
    float _775 = fma(_765, _685, _685);
    float _777 = _767 * (-2.0);
    float _779 = _749 * _769;
    float _781 = fma(_771, _765, _771);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].x, _775);
    float _785 = fma(_777, _689, _689);
    float _787 = _481 + (-0.5);
    float _789 = _623 * _779;
    float _791 = fma(_613, _777, _613);
    float _793 = _657 * _779;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[196].z, _785);
    float _797 = -_789;
    float _799 = _623 + _797;
    float _801 = fma(_781, _581, _783);
    float _803 = -_793;
    float _805 = _657 + _803;
    float _807 = fma(_791, _581, _795);
    float _809 = _799 * _799;
    float _811 = _703 * _779;
    float _813 = _763 * 0.15915493667125701904296875;
    float _815 = _801 * 0.15915493667125701904296875;
    float _817 = fma(_805, _805, _809);
    float _819 = -_811;
    float _821 = _703 + _819;
    float _823 = _807 * 0.15915493667125701904296875;
    float _825 = _813 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = fma(_821, _821, _817);
    float _831 = -_789;
    float _833 = _597 + _831;
    float _835 = -_793;
    float _837 = _643 + _835;
    float _839 = -_811;
    float _841 = _693 + _839;
    float _843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _531);
    float _845 = sqrt(_829);
    float _847 = _813 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _815 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = _749 * _845;
    float _857 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _859 = _479 * _855;
    float _861 = _815 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _823 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _871 = _853 * _849;
    float _873 = _853 * _827;
    float _875 = _823 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = _863 * _849;
    float _881 = _863 * _827;
    float _883 = _853 * _867;
    float _885 = _857 * _855;
    float _887 = _849 * _867;
    float _889 = _863 * _867;
    float _891 = _827 * _867;
    float _893 = _869 * _855;
    float _895 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _529);
    float _897 = _885 * _843;
    float _899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _533);
    float _901 = fma(_877, _871, _881);
    float _903 = _859 * _895;
    float _905 = _883 * _897;
    float _907 = _893 * _899;
    float _909 = -_879;
    float _911 = fma(_877, _873, _909);
    float _913 = -_897;
    float _915 = _877 * _913;
    float _917 = fma(_901, _903, _905);
    float _919 = -_873;
    float _921 = fma(_877, _879, _919);
    float _923 = _889 * _897;
    float _925 = fma(_887, _903, _915);
    float _927 = fma(_911, _907, _917);
    float _929 = fma(_877, _881, _871);
    float _931 = fma(_921, _903, _923);
    float _933 = fma(_891, _907, _925);
    float _935 = _927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _937 = fma(_929, _907, _931);
    float _939 = _927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _935);
    float _943 = _927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[24].x, _939);
    float _947 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _945);
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _949);
    float _957 = _951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _959 = _693 + _953;
    float _961 = _955 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _963 = _643 + _957;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _959 + _965;
    float _969 = _833 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _971 = _597 + _961;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[11].x, _969);
    float _981 = fma(_975, _975, _977);
    float _983 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[11].z, _979);
    float _985 = sqrt(_981);
    bool _987 = _985 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _989 = _979;
    float _991 = _977;
    float _993 = _961;
    if (!_987)
    {
        _989 = _963;
    }
    float _995 = _989;
    float _997 = _995;
    if (!_987)
    {
        _991 = _959;
    }
    float _999 = _991;
    float _1001 = _999;
    if (!_987)
    {
        _993 = _971;
    }
    float _1003 = _993;
    bool _1005 = !_987;
    float _1007 = _1003;
    if (!_1005)
    {
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1013 = _985 + _1011;
        float _1015 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = _1013 * _1009;
        float _1019 = rsqrt(_981);
        float _1021 = _1017 * 0.15915493667125701904296875;
        float _1023 = _1021 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1021 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        float _1031 = fma(_1025, _1015, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1033 = _1019 * _1031;
        float _1035 = _1029 + (-1.0);
        float _1037 = fma(_975, _1033, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1039 = fma(_967, _1033, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1041 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1043 = fma(_971, _1029, _1041);
        _1007 = _1043;
        _997 = _1037;
        _1001 = _1039;
    }
    float _1045 = _1007;
    float _1047 = _997;
    float _1049 = _1001;
    float _1051 = -_597;
    float _1053 = _1051 + _1045;
    float _1055 = -_643;
    float _1057 = _1055 + _1047;
    float _1059 = _983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1061 = _1053 * _1053;
    float _1063 = _833 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1065 = -_693;
    float _1067 = _1065 + _1049;
    float _1069 = 1.0 / _1059;
    float _1071 = fma(_1057, _1057, _1061);
    float _1073 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1063);
    float _1075 = fma(_837, 0.008000000379979610443115234375, 64.0);
    float _1077 = -_793;
    float _1079 = _1077 + _1047;
    float _1081 = fma(_1067, _1067, _1071);
    float _1083 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1085 = -_789;
    float _1087 = _1085 + _1045;
    float _1089 = precise::max(0.0, _1075);
    float _1091 = sqrt(_1081);
    float _1093 = fma(_841, 0.008000000379979610443115234375, 64.0);
    float _1095 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1097 = precise::min(_1089, 127.0);
    float _1099 = -_811;
    float _1101 = _1099 + _1049;
    float _1103 = precise::max(0.0, _1093);
    float _1105 = _1095 + _1059;
    float _1107 = trunc(_1097);
    int _1109 = int(_1107);
    float _1111 = precise::min(_1103, 127.0);
    float _1113 = _1105 * _1069;
    float _1115 = _1113 * 0.5;
    bool _1117 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1125 = _1121 || _1123;
    bool _1127 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1129 = isnan(0.5);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1135 = _1131 || _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1139 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1137);
    bool _1141 = _1091 > 0.0;
    float _1143 = trunc(_1111);
    int _1145 = int(_1143);
    float _1147 = 1.0 / _1139;
    float _1149 = _1047;
    float _1151 = _1049;
    float _1153 = _1045;
    if (!_1141)
    {
        _1149 = _1079;
    }
    float _1155 = _1149;
    float _1157 = _1155;
    float _1159 = _1155;
    if (!_1141)
    {
        _1151 = _1087;
    }
    float _1161 = _1151;
    int _1163 = _1145 << 7;
    int _1165 = _1163 + _1109;
    float _1167 = _1161;
    if (!_1141)
    {
        _1153 = _1101;
    }
    float _1169 = _1153;
    bool _1171 = !_1141;
    float _1173 = _1169;
    if (!_1171)
    {
        float _1175 = _203 * _203;
        float _1177 = rsqrt(_1081);
        float _1179 = fma(_201, _201, _1175);
        float _1181 = fma(_205, _205, _1179);
        float _1183 = sqrt(_1181);
        float _1185 = _1057 * _1177;
        float _1187 = _1053 * _1177;
        float _1189 = _1067 * _1177;
        bool _1191 = _1183 > 0.0;
        float _1193 = _1177;
        float _1195 = _1183;
        if (!_1191)
        {
            _1157 = _1079;
        }
        float _1197 = _1157;
        _1159 = _1197;
        if (!_1191)
        {
            _1193 = _1087;
        }
        float _1199 = _1193;
        _1167 = _1199;
        if (!_1191)
        {
            _1195 = _1101;
        }
        float _1201 = _1195;
        bool _1203 = !_1191;
        _1173 = _1201;
        if (!_1203)
        {
            float _1205 = rsqrt(_1181);
            float _1207 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1209 = _203 * _1205;
            float _1211 = _201 * _1205;
            float _1213 = _205 * _1205;
            float _1215 = _1187 * _1209;
            float _1217 = fma(_1185, _1211, _1215);
            float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1221 = fma(_1189, _1213, _1217);
            float _1223 = _1221 * _1219;
            float _1225 = fma(_201, _1223, _1079);
            float _1227 = fma(_203, _1223, _1087);
            float _1229 = fma(_205, _1223, _1101);
            _1159 = _1225;
            _1167 = _1227;
            _1173 = _1229;
        }
    }
    float _1231 = _1159;
    float _1233 = _1167;
    float _1235 = _1173;
    int _1237 = _1165 << 4;
    if (_1125)
    {
        _209 = _1231;
    }
    float _1239 = _209;
    float _1241 = _1239;
    if (_1125)
    {
        _211 = _1233;
    }
    float _1243 = _211;
    float _1245 = _1243;
    if (_1125)
    {
        _213 = _1235;
    }
    float _1247 = _213;
    float _1249 = _1247;
    if (!_1125)
    {
        float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1253 = _833 + _1251;
        float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1257 = _837 + _1255;
        float _1259 = -_837;
        float _1261 = _1259 + _1231;
        float _1263 = -_833;
        float _1265 = _1263 + _1233;
        float _1267 = _1253 * _1253;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1271 = _841 + _1269;
        float _1273 = -_841;
        float _1275 = _1273 + _1235;
        float _1277 = fma(_1257, _1257, _1267);
        float _1279 = fma(_1271, _1271, _1277);
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1283 = sqrt(_1279);
        float _1285 = precise::min(_1283, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1287 = _1285 * _1281;
        float _1289 = fma(_1261, _1287, _837);
        float _1291 = fma(_1265, _1287, _833);
        float _1293 = fma(_1275, _1287, _841);
        _1245 = _1291;
        _1241 = _1289;
        _1249 = _1293;
    }
    float _1295 = _1245;
    float _1297 = _1241;
    float _1299 = _1249;
    float _1301 = 0.0;
    if (_1135)
    {
        _1301 = 1.0;
    }
    float _1303 = _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1307 = _1147 * _1305;
    float _1309 = 0.0;
    float _1311 = _1303;
    if (_1135)
    {
        _1309 = 1.0;
    }
    float _1313 = _1309;
    int _1315 = _1237 + 8;
    float _1317 = _1313;
    if (!_1135)
    {
        float _1319 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1321 = _1319 * 0.15915493667125701904296875;
        float _1323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1325 = _1321 * 6.283185482025146484375;
        float _1327 = cos(_1325);
        float _1329 = _1323 * 0.15915493667125701904296875;
        float _1331 = _1321 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = 1.0 / _1327;
        float _1337 = _1329 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1333 * _1335;
        float _1343 = _1329 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1349 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1347;
        float _1351 = _1339 * _1341;
        float _1353 = 1.0 / _1349;
        float _1355 = 1.0 / _1351;
        float _1357 = _1345 * _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1361 = fma(_1307, _1357, _1359);
        float _1363 = _1361 * _1353;
        float _1365 = precise::clamp(_1363, 0.0, 1.0);
        _1311 = _1365;
    }
    float _1367 = _1311;
    if (!_1135)
    {
        float _1369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1371 = _1369 * 0.15915493667125701904296875;
        float _1373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1375 = _1371 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        float _1379 = _1373 * 0.15915493667125701904296875;
        float _1381 = _1371 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = 1.0 / _1377;
        float _1387 = _1379 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = _1379 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = _1389 * _1391;
        float _1399 = 1.0 / _1397;
        float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1403 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1401;
        float _1405 = 1.0 / _1403;
        float _1407 = _1395 * _1399;
        float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1411 = fma(_1307, _1407, _1409);
        float _1413 = _1411 * _1405;
        float _1415 = precise::clamp(_1413, 0.0, 1.0);
        float _1417 = -_1415;
        float _1419 = _1417 + 1.0;
        _1317 = _1419;
    }
    float _1421 = _1317;
    uint _1424 = uint(int(uint(_1315) >> uint(2)));
    float _1426 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1424)]);
    float _1428 = floor(_1097);
    int _1430 = _1237 + 12;
    uint _1432 = uint(int(uint(_1237) >> uint(2)));
    float _1434 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1432)]);
    uint _1436 = uint(int(uint(_1430) >> uint(2)));
    float _1438 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1436)]);
    float _1440 = -_1428;
    float _1442 = _1097 + _1440;
    float _1444 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1446 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1444);
    float _1448 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1446);
    float _1450 = _1426 + _1442;
    float _1452 = trunc(_1450);
    int _1454 = int(_1452);
    int _1456 = _1109 + _1454;
    int _1458 = _1145 << 7;
    int _1460 = _1458 + _1456;
    int _1462 = _1460 << 4;
    float _1464 = floor(_1111);
    int _1466 = _1462 + 12;
    uint _1468 = uint(int(uint(_1462) >> uint(2)));
    float _1470 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1468)]);
    uint _1472 = uint(int(uint(_1466) >> uint(2)));
    float _1474 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1472)]);
    float _1476 = -_1464;
    float _1478 = _1111 + _1476;
    float _1480 = _1426 + _1478;
    float _1482 = trunc(_1480);
    int _1484 = int(_1482);
    int _1486 = _1145 + _1484;
    int _1488 = _1486 << 7;
    int _1490 = _1488 + _1109;
    int _1492 = _1486 << 7;
    int _1494 = _1492 + _1456;
    int _1496 = _1490 << 4;
    int _1498 = _1494 << 4;
    int _1500 = _1496 + 12;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1295 + _1502;
    int _1506 = _1498 + 12;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1297 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1299 + _1512;
    uint _1516 = uint(int(uint(_1500) >> uint(2)));
    float _1518 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1516)]);
    uint _1520 = uint(int(uint(_1506) >> uint(2)));
    float _1522 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1520)]);
    float _1524 = _1504 * _1504;
    uint _1526 = uint(int(uint(_1496) >> uint(2)));
    float _1528 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1526)]);
    float _1530 = fma(_1510, _1510, _1524);
    uint _1532 = uint(int(uint(_1498) >> uint(2)));
    float _1534 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1532)]);
    float _1536 = fma(_1514, _1514, _1530);
    float _1538 = rsqrt(_1536);
    float _1540 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1510 * _1540;
    float _1544 = _1514 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1514;
    float _1562 = _1558;
    float _1564 = as_type<float>(_1500);
    float _1566 = _1540;
    float _1568 = as_type<float>(_1496);
    if (_1554)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1570;
    }
    float _1572 = _1560;
    if (_1554)
    {
        float _1574 = _1558 * _1572;
        _1562 = _1574;
    }
    float _1576 = _1562;
    if (_1554)
    {
        float _1578 = _1576 * 0.15915493667125701904296875;
        _1564 = _1578;
    }
    float _1580 = _1564;
    float _1582 = _1538;
    if (_1554)
    {
        float _1584 = _1580 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1582 = _1586;
    }
    float _1588 = _1582;
    float _1590 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1592 = _1572;
    if (_1554)
    {
        float _1594 = _1580 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = precise::max(0.0, _1590);
    float _1602 = _1550;
    float _1604 = _1600;
    if (_1554)
    {
        float _1606 = rsqrt(_1550);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = -_1540;
    float _1612 = -_1600;
    float _1614 = fma(_1504, _1610, _1612);
    float _1616 = _1614;
    if (_1554)
    {
        float _1618 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1588;
    float _1624 = _1620;
    if (_1554)
    {
        float _1626 = _1588 + (-1.0);
        _1566 = _1626;
    }
    float _1628 = _1566;
    float _1630 = sqrt(_1536);
    float _1632 = _1598;
    float _1634 = _1628;
    if (_1554)
    {
        float _1636 = fma(_1598, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (_1554)
    {
        float _1642 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1642;
    }
    float _1644 = _1634;
    if (_1554)
    {
        float _1646 = _1608 * _1638;
        _1568 = _1646;
    }
    float _1648 = _1568;
    if (!_1554)
    {
        _1640 = _1542;
    }
    float _1650 = _1640;
    float _1652 = _1650;
    if (_1554)
    {
        float _1654 = fma(_1614, _1588, _1644);
        _1616 = _1654;
    }
    float _1656 = _1616;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1554)
    {
        float _1660 = _1542 * _1648;
        _1652 = _1660;
    }
    float _1662 = _1652;
    if (!_1554)
    {
        _1622 = _1546;
    }
    float _1664 = _1622;
    float _1666 = _1664;
    if (!_1554)
    {
        _1624 = _1544;
    }
    float _1668 = _1624;
    float _1670 = _1668;
    if (_1554)
    {
        float _1672 = _1544 * _1648;
        _1670 = _1672;
    }
    float _1674 = _1670;
    if (_1554)
    {
        float _1676 = _1662 * _1662;
        _1666 = _1676;
    }
    float _1678 = _1666;
    float _1680 = fma(_837, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1554)
    {
        _1658 = _1548;
    }
    float _1682 = _1658;
    float _1684 = _1682;
    if (_1554)
    {
        float _1686 = _1674 * _1674;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1656, _1656, _1678);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1700 = _1690 + _1688;
    float _1702 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1698);
    float _1706 = fma(_841, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1708 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1710 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1712 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1714 = rsqrt(_1700);
    float _1716 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1708);
    float _1718 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1710);
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1722 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1724 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = -_1696;
    float _1730 = _1728 + 1.0;
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = abs(_1730);
    float _1738 = log2(_1736);
    float _1740 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1744 = _1714 * _1662;
    float _1746 = _1714 * _1656;
    float _1748 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1750 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1756 = _1714 * _1674;
    float _1758 = -_1750;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = -_1752;
    float _1764 = fma(_1762, _1754, 1.0);
    float _1766 = -_1756;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1770 = floor(_1680);
    float _1772 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1774 = fma(_1768, -0.5, 0.5);
    float _1776 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1778 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1780 = exp2(_1772);
    float _1782 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1776);
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1778);
    float _1786 = log2(_1764);
    float _1788 = fma(_1768, 0.5, 0.5);
    float _1790 = 1.0 / _1748;
    float _1792 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1794 = floor(_1706);
    float _1796 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1798 = sqrt(_1774);
    float _1800 = -_1770;
    float _1802 = _1680 + _1800;
    float _1804 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = _1746 + 1.0;
    float _1808 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1810 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1812 = fma(_1788, _1804, -0.212114393711090087890625);
    float _1814 = -_1746;
    float _1816 = fma(_1780, _1806, _1814);
    float _1818 = _1786 * 0.693147182464599609375;
    float _1820 = _1808 * _1790;
    float _1822 = _1810 * _1790;
    float _1824 = -_1794;
    float _1826 = _1706 + _1824;
    float _1828 = fma(_1788, _1812, 1.570728778839111328125);
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1832 = fma(_1820, 0.5, 0.5);
    float _1834 = _1798 * 0.636619746685028076171875;
    float _1836 = fma(_1822, -0.5, 0.5);
    float _1838 = fma(_1816, 0.5, 0.5);
    float2 _6654 = float2(_1802, _1826);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6654, float2(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6654, float2(0.0), isnan(_6654)), level(0.0)).x;
    float _1842 = -_1828;
    float _1844 = fma(_1834, _1842, 1.0);
    float3 _6670 = float3(_1832, _1836, _1830);
    float _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6670, float3(0.0), isnan(_6670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6670, float3(0.0), isnan(_6670)), level(0.0)).x;
    float3 _6681 = float3(_1832, _1836, _1830);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6681, float3(0.0), isnan(_6681)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6681, float3(0.0), isnan(_6681)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _6697 = float2(_1844, _1838);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6697, float2(0.0), isnan(_6697)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6697, float2(0.0), isnan(_6697)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = floor(_1450);
    float _1871 = _1478 * _1474;
    float _1873 = in.m_72.y;
    float _1875 = in.m_62.w;
    float _1877 = in.m_72.x;
    float _1879 = in.m_74.x;
    float _1881 = in.m_74.y;
    float _1883 = in.m_74.z;
    float _1885 = -_1869;
    float _1887 = _1450 + _1885;
    float _1889 = in.m_76.x;
    float _1891 = in.m_76.y;
    float _1893 = in.m_76.z;
    float _1895 = in.m_76.w;
    float _1897 = _1887 * _1474;
    float _1899 = floor(_1871);
    float _1901 = floor(_1897);
    float _1903 = fma(_1474, _1899, _1901);
    float _1905 = floor(_1480);
    float _1907 = _1478 * _1438;
    float _1909 = _1442 * _1438;
    float _1911 = _1442 * _1518;
    float _1913 = _1887 * _1522;
    float _1915 = floor(_1907);
    float _1917 = -_1905;
    float _1919 = _1480 + _1917;
    float _1921 = floor(_1909);
    float _1923 = _1919 * _1518;
    float _1925 = _1919 * _1522;
    float _1927 = floor(_1923);
    float _1929 = floor(_1911);
    float _1931 = trunc(_1903);
    int _1933 = int(_1931);
    float _1935 = floor(_1913);
    float _1937 = floor(_1925);
    float _1939 = fma(_1438, _1915, _1921);
    float _1941 = fma(_1518, _1927, _1929);
    int _1943 = as_type<int>(_1470) + _1933;
    float _1945 = trunc(_1939);
    int _1947 = int(_1945);
    float _1949 = fma(_1522, _1937, _1935);
    float _1951 = trunc(_1941);
    int _1953 = int(_1951);
    float _1955 = trunc(_1949);
    int _1957 = int(_1955);
    int _1959 = _1943 * 656;
    int _1961 = as_type<int>(_1434) + _1947;
    int _1963 = _1959 + 262160;
    int _1965 = _1961 * 656;
    int _1967 = as_type<int>(_1528) + _1953;
    int _1969 = _1959 + 262240;
    int _1971 = _1959 + 262176;
    int _1973 = _1959 + 262192;
    int _1975 = _1967 * 656;
    int _1977 = as_type<int>(_1534) + _1957;
    uint _1979 = uint(int(uint(_1963) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1979)];
    float _1981 = as_type<float>(_dmw1.x);
    int _1983 = _1963 + 4;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    float _1987 = as_type<float>(_dmw1.y);
    int _1989 = _1963 + 8;
    uint _1991 = uint(int(uint(_1989) >> uint(2)));
    float _1993 = as_type<float>(_dmw1.z);
    int _1995 = _1963 + 12;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    float _1999 = as_type<float>(_dmw1.w);
    int _2001 = _1959 + 262224;
    int _2003 = _1965 + 262192;
    uint _2005 = uint(int(uint(_1969) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2005)];
    float _2007 = as_type<float>(_dmw6.x);
    int _2009 = _1969 + 4;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    float _2013 = as_type<float>(_dmw6.y);
    int _2015 = _1969 + 8;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    float _2019 = as_type<float>(_dmw6.z);
    int _2021 = _1969 + 12;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    float _2025 = as_type<float>(_dmw6.w);
    int _2027 = _1959 + 262208;
    int _2029 = _1977 * 656;
    uint _2031 = uint(int(uint(_1971) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2031)];
    float _2033 = as_type<float>(_dmw2.x);
    int _2035 = _1971 + 4;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    float _2039 = as_type<float>(_dmw2.y);
    int _2041 = _1971 + 8;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    float _2045 = as_type<float>(_dmw2.z);
    int _2047 = _1971 + 12;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    float _2051 = as_type<float>(_dmw2.w);
    int _2053 = _1965 + 262224;
    uint _2055 = uint(int(uint(_1973) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2055)];
    float _2057 = as_type<float>(_dmw3.x);
    int _2059 = _1973 + 4;
    uint _2061 = uint(int(uint(_2059) >> uint(2)));
    float _2063 = as_type<float>(_dmw3.y);
    int _2065 = _1973 + 8;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    float _2069 = as_type<float>(_dmw3.z);
    int _2071 = _1973 + 12;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    float _2075 = as_type<float>(_dmw3.w);
    int _2077 = _1975 + 262192;
    int _2079 = _1959 + 262144;
    uint _2081 = uint(int(uint(_2003) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2081)];
    float _2083 = as_type<float>(_dmw11.x);
    int _2085 = _2003 + 4;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    float _2089 = as_type<float>(_dmw11.y);
    int _2091 = _2003 + 8;
    uint _2093 = uint(int(uint(_2091) >> uint(2)));
    float _2095 = as_type<float>(_dmw11.z);
    int _2097 = _2003 + 12;
    uint _2099 = uint(int(uint(_2097) >> uint(2)));
    float _2101 = as_type<float>(_dmw11.w);
    int _2103 = _1959 + 262256;
    int _2105 = _1965 + 262208;
    uint _2107 = uint(int(uint(_2001) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2107)];
    float _2109 = as_type<float>(_dmw5.x);
    int _2111 = _2001 + 4;
    uint _2113 = uint(int(uint(_2111) >> uint(2)));
    float _2115 = as_type<float>(_dmw5.y);
    int _2117 = _2001 + 8;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    float _2121 = as_type<float>(_dmw5.z);
    int _2123 = _2001 + 12;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    float _2127 = as_type<float>(_dmw5.w);
    int _2129 = _1975 + 262224;
    int _2131 = _2029 + 262192;
    uint _2133 = uint(int(uint(_2027) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2133)];
    float _2135 = as_type<float>(_dmw4.x);
    int _2137 = _2027 + 4;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    float _2141 = as_type<float>(_dmw4.y);
    int _2143 = _2027 + 8;
    uint _2145 = uint(int(uint(_2143) >> uint(2)));
    float _2147 = as_type<float>(_dmw4.z);
    int _2149 = _2027 + 12;
    uint _2151 = uint(int(uint(_2149) >> uint(2)));
    float _2153 = as_type<float>(_dmw4.w);
    int _2155 = _1965 + 262144;
    int _2157 = _1965 + 262160;
    uint _2159 = uint(int(uint(_2077) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2159)];
    float _2161 = as_type<float>(_dmw17.x);
    int _2163 = _2077 + 4;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    float _2167 = as_type<float>(_dmw17.y);
    int _2169 = _2077 + 8;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    float _2173 = as_type<float>(_dmw17.z);
    int _2175 = _2077 + 12;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    float _2179 = as_type<float>(_dmw17.w);
    int _2181 = _1965 + 262176;
    int _2183 = _1965 + 262240;
    uint _2185 = uint(int(uint(_2105) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2185)];
    float _2187 = as_type<float>(_dmw12.x);
    int _2189 = _2105 + 4;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    float _2193 = as_type<float>(_dmw12.y);
    int _2195 = _2105 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    float _2199 = as_type<float>(_dmw12.z);
    int _2201 = _2105 + 12;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    float _2205 = as_type<float>(_dmw12.w);
    int _2207 = _1965 + 262256;
    int _2209 = _1975 + 262208;
    uint _2211 = uint(int(uint(_2053) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2211)];
    float _2213 = as_type<float>(_dmw13.x);
    int _2215 = _2053 + 4;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    float _2219 = as_type<float>(_dmw13.y);
    int _2221 = _2053 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    float _2225 = as_type<float>(_dmw13.z);
    int _2227 = _2053 + 12;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    float _2231 = as_type<float>(_dmw13.w);
    int _2233 = _2029 + 262224;
    int _2235 = _1975 + 262144;
    uint _2237 = uint(int(uint(_2131) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2237)];
    float _2239 = as_type<float>(_dmw20.x);
    int _2241 = _2131 + 4;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    float _2245 = as_type<float>(_dmw20.y);
    int _2247 = _2131 + 8;
    uint _2249 = uint(int(uint(_2247) >> uint(2)));
    float _2251 = as_type<float>(_dmw20.z);
    int _2253 = _2131 + 12;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    float _2257 = as_type<float>(_dmw20.w);
    int _2259 = _1975 + 262160;
    int _2261 = _1975 + 262176;
    uint _2263 = uint(int(uint(_2209) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2263)];
    float _2265 = as_type<float>(_dmw18.x);
    int _2267 = _2209 + 4;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    float _2271 = as_type<float>(_dmw18.y);
    int _2273 = _2209 + 8;
    uint _2275 = uint(int(uint(_2273) >> uint(2)));
    float _2277 = as_type<float>(_dmw18.z);
    int _2279 = _2209 + 12;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    float _2283 = as_type<float>(_dmw18.w);
    int _2285 = _1975 + 262240;
    int _2287 = _1975 + 262256;
    uint _2289 = uint(int(uint(_2233) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2289)];
    float _2291 = as_type<float>(_dmw22.x);
    int _2293 = _2233 + 4;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    float _2297 = as_type<float>(_dmw22.y);
    int _2299 = _2233 + 8;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    float _2303 = as_type<float>(_dmw22.z);
    int _2305 = _2233 + 12;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    float _2309 = as_type<float>(_dmw22.w);
    int _2311 = _2029 + 262208;
    uint _2313 = uint(int(uint(_2129) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2313)];
    float _2315 = as_type<float>(_dmw19.x);
    int _2317 = _2129 + 4;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    float _2321 = as_type<float>(_dmw19.y);
    int _2323 = _2129 + 8;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    float _2327 = as_type<float>(_dmw19.z);
    int _2329 = _2129 + 12;
    uint _2331 = uint(int(uint(_2329) >> uint(2)));
    float _2333 = as_type<float>(_dmw19.w);
    uint _2335 = uint(int(uint(_2311) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2335)];
    float _2337 = as_type<float>(_dmw21.x);
    int _2339 = _2311 + 4;
    uint _2341 = uint(int(uint(_2339) >> uint(2)));
    float _2343 = as_type<float>(_dmw21.y);
    int _2345 = _2311 + 8;
    uint _2347 = uint(int(uint(_2345) >> uint(2)));
    float _2349 = as_type<float>(_dmw21.z);
    int _2351 = _2311 + 12;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    float _2355 = as_type<float>(_dmw21.w);
    uint _2357 = uint(int(uint(_2079) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2357)];
    float _2359 = as_type<float>(_dmw0.x);
    int _2361 = _2079 + 4;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    float _2365 = as_type<float>(_dmw0.y);
    int _2367 = _2079 + 8;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    float _2371 = as_type<float>(_dmw0.z);
    int _2373 = _2079 + 12;
    uint _2375 = uint(int(uint(_2373) >> uint(2)));
    float _2377 = as_type<float>(_dmw0.w);
    uint _2379 = uint(int(uint(_2157) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2379)];
    float _2381 = as_type<float>(_dmw9.x);
    int _2383 = _2157 + 4;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw9.y);
    int _2389 = _2157 + 8;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw9.z);
    int _2395 = _2157 + 12;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    float _2399 = as_type<float>(_dmw9.w);
    uint _2401 = uint(int(uint(_2181) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2401)];
    float _2403 = as_type<float>(_dmw10.x);
    int _2405 = _2181 + 4;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    float _2409 = as_type<float>(_dmw10.y);
    int _2411 = _2181 + 8;
    uint _2413 = uint(int(uint(_2411) >> uint(2)));
    float _2415 = as_type<float>(_dmw10.z);
    int _2417 = _2181 + 12;
    uint _2419 = uint(int(uint(_2417) >> uint(2)));
    float _2421 = as_type<float>(_dmw10.w);
    uint _2423 = uint(int(uint(_2259) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2423)];
    float _2425 = as_type<float>(_dmw16.x);
    int _2427 = _2259 + 4;
    uint _2429 = uint(int(uint(_2427) >> uint(2)));
    float _2431 = as_type<float>(_dmw16.y);
    int _2433 = _2259 + 8;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    float _2437 = as_type<float>(_dmw16.z);
    int _2439 = _2259 + 12;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    float _2443 = as_type<float>(_dmw16.w);
    uint _2445 = uint(int(uint(_2103) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2445)];
    float _2447 = as_type<float>(_dmw7.x);
    int _2449 = _2103 + 4;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    float _2453 = as_type<float>(_dmw7.y);
    int _2455 = _2103 + 8;
    uint _2457 = uint(int(uint(_2455) >> uint(2)));
    float _2459 = as_type<float>(_dmw7.z);
    int _2461 = _2103 + 12;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    float _2465 = as_type<float>(_dmw7.w);
    uint _2467 = uint(int(uint(_2207) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2467)];
    float _2469 = as_type<float>(_dmw15.x);
    int _2471 = _2207 + 4;
    uint _2473 = uint(int(uint(_2471) >> uint(2)));
    float _2475 = as_type<float>(_dmw15.y);
    int _2477 = _2207 + 8;
    uint _2479 = uint(int(uint(_2477) >> uint(2)));
    float _2481 = as_type<float>(_dmw15.z);
    int _2483 = _2207 + 12;
    uint _2485 = uint(int(uint(_2483) >> uint(2)));
    float _2487 = as_type<float>(_dmw15.w);
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    uint _2497 = uint(int(uint(_2155) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2497)];
    float _2499 = as_type<float>(_dmw8.x);
    int _2501 = _2155 + 4;
    uint _2503 = uint(int(uint(_2501) >> uint(2)));
    float _2505 = as_type<float>(_dmw8.y);
    int _2507 = _2155 + 8;
    uint _2509 = uint(int(uint(_2507) >> uint(2)));
    float _2511 = as_type<float>(_dmw8.z);
    int _2513 = _2155 + 12;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    float _2517 = as_type<float>(_dmw8.w);
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2521 = _2519 != 0;
    float _2523 = 1.0 / _2491;
    int _2525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2527 = _2525 != 0;
    float _2529 = -_1873;
    float _2531 = _2529 + 1.0;
    bool _2533 = _1875 > 0.5;
    uint _2535 = uint(int(uint(_2183) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2535)];
    float _2537 = as_type<float>(_dmw14.x);
    int _2539 = _2183 + 4;
    uint _2541 = uint(int(uint(_2539) >> uint(2)));
    float _2543 = as_type<float>(_dmw14.y);
    int _2545 = _2183 + 8;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    float _2549 = as_type<float>(_dmw14.z);
    int _2551 = _2183 + 12;
    uint _2553 = uint(int(uint(_2551) >> uint(2)));
    float _2555 = as_type<float>(_dmw14.w);
    float _2557 = 1.0 / _2495;
    bool _2559 = _487 > 0.5;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2563 = _2561 != 0;
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2567 = _2565 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2569 = _2533;
    float _2571 = _1873;
    float _2573 = _1877;
    if (_2521)
    {
        bool _2575 = _473 > 0.5;
        _669 = _2575;
    }
    bool _2577 = _669;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2579;
    int _2583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2585 = _2583 != 0;
    bool _2587 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2589 = isnan(_471);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    out.m_78.x = 1.0;
    out.m_78.y = 1.0;
    out.m_78.z = 1.0;
    int _2599 = _2533 ? as_type<int>(_2531) : as_type<int>(_1873);
    float _2601 = _2581 * _2523;
    if (_2527)
    {
        bool _2603 = _481 > 0.5;
        _2569 = _2603;
    }
    bool _2605 = _2569;
    float _2607 = _2567 * _2557;
    int _2609 = _2029 + 262144;
    uint _2611 = uint(int(uint(_2235) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2611)];
    float _2613 = as_type<float>(_dmw23.x);
    int _2615 = _2235 + 4;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    float _2619 = as_type<float>(_dmw23.y);
    int _2621 = _2235 + 8;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    float _2625 = as_type<float>(_dmw23.z);
    int _2627 = _2235 + 12;
    uint _2629 = uint(int(uint(_2627) >> uint(2)));
    float _2631 = as_type<float>(_dmw23.w);
    bool _2633 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2635 = isnan(_471);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2641 = _2637 || _2639;
    float _2643 = float(_2641);
    float _2645 = -_2597;
    float _2647 = _2645 + 1.0;
    int _2649 = _2029 + 262240;
    uint _2651 = uint(int(uint(_2285) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2651)];
    float _2653 = as_type<float>(_dmw24.x);
    int _2655 = _2285 + 4;
    uint _2657 = uint(int(uint(_2655) >> uint(2)));
    float _2659 = as_type<float>(_dmw24.y);
    int _2661 = _2285 + 8;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    float _2665 = as_type<float>(_dmw24.z);
    int _2667 = _2285 + 12;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    float _2671 = as_type<float>(_dmw24.w);
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2675 = _471 + _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2679 = _471 + _2677;
    int _2681 = _2029 + 262160;
    uint _2683 = uint(int(uint(_2287) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2683)];
    float _2685 = as_type<float>(_dmw25.x);
    int _2687 = _2287 + 4;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    float _2691 = as_type<float>(_dmw25.y);
    int _2693 = _2287 + 8;
    uint _2695 = uint(int(uint(_2693) >> uint(2)));
    float _2697 = as_type<float>(_dmw25.z);
    int _2699 = _2287 + 12;
    uint _2701 = uint(int(uint(_2699) >> uint(2)));
    float _2703 = as_type<float>(_dmw25.w);
    float _2705 = fma(_2601, _2675, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2707 = fma(_2607, _2679, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2709 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2711 = isnan(_471);
    bool _2713 = _2709 || _2711;
    bool _2715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2717 = _2713 || _2715;
    float _2719 = float(_2717);
    uint _2721 = uint(int(uint(_2609) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2721)];
    float _2723 = as_type<float>(_dmw26.x);
    int _2725 = _2609 + 4;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    float _2729 = as_type<float>(_dmw26.y);
    int _2731 = _2609 + 8;
    uint _2733 = uint(int(uint(_2731) >> uint(2)));
    float _2735 = as_type<float>(_dmw26.z);
    int _2737 = _2609 + 12;
    uint _2739 = uint(int(uint(_2737) >> uint(2)));
    float _2741 = as_type<float>(_dmw26.w);
    float _2743 = _2643 * _2647;
    float _2745 = -_2643;
    float _2747 = _2745 + 1.0;
    uint _2749 = uint(int(uint(_2649) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2749)];
    float _2751 = as_type<float>(_dmw28.x);
    int _2753 = _2649 + 4;
    uint _2755 = uint(int(uint(_2753) >> uint(2)));
    float _2757 = as_type<float>(_dmw28.y);
    int _2759 = _2649 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    float _2763 = as_type<float>(_dmw28.z);
    int _2765 = _2649 + 12;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    float _2769 = as_type<float>(_dmw28.w);
    int _2771 = _2029 + 262176;
    int _2773 = _2029 + 262256;
    uint _2775 = uint(int(uint(_2681) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
    float _2777 = as_type<float>(_dmw27.x);
    int _2779 = _2681 + 4;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    float _2783 = as_type<float>(_dmw27.y);
    int _2785 = _2681 + 8;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    float _2789 = as_type<float>(_dmw27.z);
    int _2791 = _2681 + 12;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    float _2795 = as_type<float>(_dmw27.w);
    float _2797 = _2563 ? as_type<float>(_2599) : _1873;
    float _2799 = _2719 * _2747;
    float _2801 = _2799;
    if (_2585)
    {
        float _2803 = _2559 ? _2531 : _1873;
        _2571 = _2803;
    }
    float _2805 = _2571;
    uint _2807 = uint(int(uint(_2261) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2807)];
    float _2809 = as_type<float>(_dmw29.x);
    int _2811 = _2261 + 4;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    float _2815 = as_type<float>(_dmw29.y);
    int _2817 = _2261 + 8;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    float _2821 = as_type<float>(_dmw29.z);
    int _2823 = _2261 + 12;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    float _2827 = as_type<float>(_dmw29.w);
    uint _2829 = uint(int(uint(_2773) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2829)];
    float _2831 = as_type<float>(_dmw31.x);
    int _2833 = _2773 + 4;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    float _2837 = as_type<float>(_dmw31.y);
    int _2839 = _2773 + 8;
    uint _2841 = uint(int(uint(_2839) >> uint(2)));
    float _2843 = as_type<float>(_dmw31.z);
    int _2845 = _2773 + 12;
    uint _2847 = uint(int(uint(_2845) >> uint(2)));
    float _2849 = as_type<float>(_dmw31.w);
    uint _2851 = uint(int(uint(_2771) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2851)];
    float _2853 = as_type<float>(_dmw30.x);
    int _2855 = _2771 + 4;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    float _2859 = as_type<float>(_dmw30.y);
    int _2861 = _2771 + 8;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    float _2865 = as_type<float>(_dmw30.z);
    int _2867 = _2771 + 12;
    uint _2869 = uint(int(uint(_2867) >> uint(2)));
    float _2871 = as_type<float>(_dmw30.w);
    bool _2873 = _531 != 0.0;
    bool _2875 = isnan(_531);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(0.0);
    bool _2881 = _2877 || _2879;
    bool _2883 = _529 == 0.0;
    bool _2885 = !_2881;
    bool _2887 = _2883 && _2885;
    bool _2889 = _533 == 0.0;
    bool _2891 = _2889 && _2887;
    int _2893 = 0;
    if (_2521)
    {
        float _2895 = -_1877;
        float _2897 = _2895 + 1.0;
        _2893 = as_type<int>(_2897);
    }
    int _2899 = _2893;
    float _2901 = _2705 * _2799;
    float _2903 = -_2719;
    float _2905 = _2903 + 1.0;
    float _2907 = 0.0;
    float _2909 = _2901;
    float _2911 = _2905;
    if (!_2521)
    {
        _2907 = _1877;
    }
    float _2913 = _2907;
    float _2915 = _2913;
    if (_2521)
    {
        float _2917 = _2577 ? as_type<float>(_2899) : _1877;
        _2915 = _2917;
    }
    float _2919 = _2915;
    float _2921 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2901);
    float _2923 = 0.0;
    if (_2891)
    {
        _2923 = _1879;
    }
    float _2925 = _2923;
    float _2927 = _2925;
    if (_2891)
    {
        _2909 = _2925;
    }
    float _2929 = _2909;
    float _2931 = _2929;
    if (!_2891)
    {
        _2927 = _1879;
    }
    float _2933 = _2927;
    float _2935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2937 = 0.0;
    if (_2891)
    {
        _2937 = _1881;
    }
    float _2939 = _2937;
    float _2941 = _2939;
    if (_2891)
    {
        _2801 = _2939;
    }
    float _2943 = _2801;
    float _2945 = _2943;
    if (!_2891)
    {
        _2941 = _1881;
    }
    float _2947 = _2941;
    int _2949 = 0;
    if (_2527)
    {
        float _2951 = -_1877;
        float _2953 = _2951 + 1.0;
        _2949 = as_type<int>(_2953);
    }
    int _2955 = _2949;
    float _2957 = fma(_2707, _2743, _2921);
    float _2959 = _1891 * _1883;
    float _2961 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_2891)
    {
        float _2963 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2947);
        _2945 = _2963;
    }
    float _2965 = _2945;
    float _2967 = _1893 * _2933;
    if (_2527)
    {
        float _2969 = _2605 ? as_type<float>(_2955) : _1877;
        _2573 = _2969;
    }
    float _2971 = _2573;
    float _2973 = -_2959;
    float _2975 = fma(_1893, _2947, _2973);
    if (_2891)
    {
        _2911 = _1883;
    }
    float _2977 = _2911;
    float _2979 = _2977;
    if (!_2891)
    {
        float _2981 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1883);
        _2979 = _2981;
    }
    float _2983 = _2979;
    float _2985 = -_2967;
    float _2987 = fma(_1889, _1883, _2985);
    float _2989 = _2961 * _2935;
    float _2991 = fma(_2597, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2957);
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2999 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3001 = _2993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3003 = _2995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3005 = _2997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3007 = _2991 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _3001;
    out.m_80.y = _3003;
    out.m_80.z = _3005;
    out.m_80.w = _3007;
    float _3009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_2891)
    {
        float _3011 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2933);
        _2931 = _3011;
    }
    float _3013 = _2931;
    float _3015 = _1889 * _2947;
    float _3017 = abs(_1307);
    float _3019 = log2(_3017);
    float _3021 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3023 = -_3015;
    float _3025 = fma(_1891, _2933, _3023);
    float _3027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3031 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3033 = _2987 * _1895;
    float _3035 = _2975 * _1895;
    float _3037 = _3025 * _1895;
    float _3039 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3041 = _2919 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _837;
    out.m_82.y = _833;
    out.m_82.z = _841;
    float _3043 = exp2(_3031);
    float _3045 = -_877;
    float _3047 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3039);
    float _3049 = _3021 * _3027;
    float _3051 = _3041 * _3009;
    float _3053 = _901 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3055 = _2999 * _3029;
    float _3057 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3059 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3061 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.w = _769;
    float _3063 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3053);
    out.m_86.x = _3051;
    out.m_86.y = _3049;
    out.m_86.z = _3055;
    out.m_86.w = _2989;
    float _3065 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3059);
    float _3067 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3063);
    float _3069 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3071 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3073 = -_877;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3057);
    float _3077 = _901 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3079 = _901 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3081 = -_877;
    float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3085 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3075);
    float _3087 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3077);
    float _3089 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3079);
    float _3091 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3083);
    float _3093 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3095 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3087);
    float _3097 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3089);
    float _3099 = _3069 * _2965;
    float _3101 = _3085 * _2965;
    float _3103 = _3091 * _1891;
    float _3105 = _3091 * _2965;
    float _3107 = fma(_3043, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3109 = precise::clamp(_3107, 0.0, 1.0);
    float _3111 = _3033 * _3091;
    float _3113 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3093);
    float _3115 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3117 = fma(_3095, _3013, _3099);
    float _3119 = fma(_3097, _3013, _3101);
    float _3121 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3123 = _3069 * _1891;
    float _3125 = _3085 * _1891;
    float _3127 = fma(_3067, _3013, _3105);
    float _3129 = _3033 * _3069;
    float _3131 = fma(_3067, _1889, _3103);
    float _3133 = fma(_3035, _3067, _3111);
    float _3135 = _3109 * _3109;
    float _3137 = fma(_3109, -2.0, 3.0);
    float _3139 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3115);
    float _3141 = _3033 * _3085;
    float _3143 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3121);
    float _3145 = fma(_3095, _1889, _3123);
    float _3147 = fma(_3035, _3095, _3129);
    float _3149 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    float _3151 = _3135 * _3137;
    float _3153 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3139);
    float _3155 = fma(_3035, _3097, _3141);
    float _3157 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3143);
    float _3159 = fma(_3037, _3071, _3147);
    float _3161 = fma(_3097, _1889, _3125);
    float _3163 = -_3151;
    float _3165 = _3163 + 1.0;
    float _3167 = fma(_3037, _3149, _3155);
    float _3169 = fma(_3037, _3153, _3133);
    float _3171 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3157);
    float _3173 = -_1915;
    float _3175 = _1907 + _3173;
    float _3177 = fma(_3071, _1893, _3145);
    float _3179 = fma(_3149, _1893, _3161);
    float _3181 = fma(_3165, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3151);
    float _3183 = fma(_3153, _1893, _3131);
    float _3185 = _3171 + _1748;
    float _3187 = _1808 + _1748;
    float _3189 = _1748 * 0.5;
    out.m_88.x = _3159;
    out.m_88.y = _3167;
    out.m_88.z = _3169;
    float _3191 = -_1921;
    float _3193 = _1909 + _3191;
    float _3195 = _3185 * 0.5;
    float _3197 = _3187 * 0.5;
    float _3199 = fma(_1810, -0.5, _3189);
    out.m_90.x = _3177;
    out.m_90.y = _3179;
    out.m_90.z = _3183;
    float _3201 = -_3175;
    float _3203 = _3201 + 1.0;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _3171;
    out.gl_Position.w = _1748;
    float _3205 = _3193 * _3203;
    float _3207 = -_3193;
    float _3209 = _3207 + 1.0;
    out.m_92.x = _3197;
    out.m_92.y = _3199;
    out.m_92.z = _3195;
    out.m_92.w = _1748;
    float _3211 = _3209 * _3203;
    float _3213 = _3205 * _1987;
    float _3215 = _3205 * _2045;
    float _3217 = _3205 * _1981;
    float _3219 = _3205 * _2063;
    float _3221 = _3205 * _2039;
    float _3223 = _3205 * _2007;
    float _3225 = _3205 * _2075;
    float _3227 = _3205 * _1993;
    float _3229 = _3205 * _2069;
    float _3231 = _3175 * _3209;
    float _3233 = _3205 * _2051;
    float _3235 = _3205 * _2115;
    float _3237 = fma(_3211, _2101, _3225);
    float _3239 = _3205 * _2135;
    float _3241 = fma(_3211, _2089, _3219);
    float _3243 = _3205 * _2019;
    float _3245 = _3205 * _2013;
    float _3247 = _3205 * _2025;
    float _3249 = _3205 * _2141;
    float _3251 = _3193 * _3175;
    float _3253 = _3205 * _2147;
    float _3255 = _3205 * _2109;
    float _3257 = fma(_3211, _2219, _3235);
    float _3259 = fma(_3231, _2179, _3237);
    float _3261 = _3205 * _2121;
    float _3263 = fma(_3211, _2187, _3239);
    float _3265 = fma(_3231, _2167, _3241);
    float _3267 = _3205 * _1999;
    float _3269 = _3205 * _2127;
    float _3271 = fma(_3211, _2193, _3249);
    float _3273 = _3205 * _2057;
    float _3275 = fma(_3211, _2199, _3253);
    float _3277 = fma(_3211, _2213, _3255);
    float _3279 = fma(_3231, _2321, _3257);
    float _3281 = fma(_3251, _2257, _3259);
    float _3283 = _3205 * _2153;
    float _3285 = fma(_3211, _2225, _3261);
    float _3287 = fma(_3231, _2265, _3263);
    float _3289 = fma(_3251, _2245, _3265);
    float _3291 = fma(_3211, _2231, _3269);
    float _3293 = fma(_3231, _2271, _3271);
    float _3295 = fma(_3211, _2083, _3273);
    float _3297 = fma(_3231, _2277, _3275);
    float _3299 = fma(_3231, _2315, _3277);
    float _3301 = fma(_3251, _2297, _3279);
    float _3303 = _3281 * 0.511664927005767822265625;
    float _3305 = fma(_3211, _2205, _3283);
    float _3307 = fma(_3231, _2327, _3285);
    float _3309 = fma(_3251, _2337, _3287);
    float _3311 = _3289 * 0.886227548122406005859375;
    float _3313 = fma(_3231, _2333, _3291);
    float _3315 = fma(_3251, _2343, _3293);
    float _3317 = fma(_3231, _2161, _3295);
    float _3319 = fma(_3251, _2349, _3297);
    float _3321 = _3301 * 0.511664927005767822265625;
    float _3323 = _3303 * _3303;
    float _3325 = fma(_3231, _2283, _3305);
    float _3327 = fma(_3251, _2303, _3307);
    float _3329 = _3309 * 0.511664927005767822265625;
    float _3331 = precise::max(_3311, 0.00999999977648258209228515625);
    float _3333 = fma(_3251, _2309, _3313);
    float _3335 = _3315 * 0.511664927005767822265625;
    float _3337 = _3319 * 0.511664927005767822265625;
    float _3339 = fma(_3321, _3321, _3323);
    float _3341 = fma(_3251, _2355, _3325);
    float _3343 = _3327 * 0.511664927005767822265625;
    float _3345 = _3329 * _3329;
    float _3347 = 1.0 / _3331;
    float _3349 = fma(_3251, _2291, _3299);
    float _3351 = _3333 * 0.511664927005767822265625;
    float _3353 = fma(_3337, _3337, _3339);
    float _3355 = _3205 * _2359;
    float _3357 = _3341 * 0.511664927005767822265625;
    float _3359 = fma(_3343, _3343, _3345);
    float _3361 = _3335 * _3335;
    float _3363 = _3205 * _2365;
    float _3365 = _3205 * _2371;
    float _3367 = fma(_3211, _2387, _3213);
    float _3369 = _3349 * 0.511664927005767822265625;
    float _3371 = fma(_3351, _3351, _3361);
    float _3373 = _3205 * _2377;
    float _3375 = _3205 * _2033;
    float _3377 = fma(_3357, _3357, _3359);
    float _3379 = fma(_3211, _2409, _3221);
    float _3381 = sqrt(_3353);
    float _3383 = fma(_3231, _2431, _3367);
    float _3385 = fma(_3369, _3369, _3371);
    float _3387 = fma(_3251, _2239, _3317);
    float _3389 = _3205 * _2453;
    float _3391 = _3387 * 0.886227548122406005859375;
    float _3393 = sqrt(_3377);
    float _3395 = fma(_3211, _2475, _3389);
    float _3397 = precise::max(_3391, 0.00999999977648258209228515625);
    float _3399 = sqrt(_3385);
    float _3401 = 1.0 / _3397;
    float _3403 = precise::max(_3393, 0.00999999977648258209228515625);
    float _3405 = precise::max(_3381, 0.00999999977648258209228515625);
    float _3407 = 1.0 / _3405;
    float _3409 = precise::max(_3399, 0.00999999977648258209228515625);
    float _3411 = fma(_3211, _2505, _3363);
    float _3413 = fma(_3211, _2517, _3373);
    float _3415 = 1.0 / _3403;
    float _3417 = fma(_3211, _2095, _3229);
    float _3419 = 1.0 / _3409;
    float _3421 = fma(_3231, _2173, _3417);
    float _3423 = _3303 * _3407;
    float _3425 = fma(_3149, _2983, _3119);
    float _3427 = _3403 * _3347;
    float _3429 = precise::clamp(_3427, 0.0, 1.0);
    float _3431 = _3321 * _3407;
    float _3433 = _3337 * _3407;
    float _3435 = fma(_3251, _2251, _3421);
    float _3437 = _3425 * _3423;
    float _3439 = _3329 * _3415;
    float _3441 = fma(_3071, _2983, _3117);
    float _3443 = _3205 * _2447;
    float _3445 = _3205 * _2459;
    float _3447 = _3205 * _2465;
    float _3449 = fma(_3211, _2543, _3245);
    float _3451 = _3435 * 0.886227548122406005859375;
    float _3453 = _3335 * _3419;
    float _3455 = _3343 * _3415;
    float _3457 = _3425 * _3439;
    float _3459 = fma(_3231, _2631, _3413);
    float _3461 = fma(_3441, _3431, _3437);
    float _3463 = fma(_3153, _2983, _3127);
    float _3465 = fma(_3211, _2381, _3217);
    float _3467 = _3351 * _3419;
    float _3469 = _3425 * _3453;
    float _3471 = fma(_3211, _2537, _3223);
    float _3473 = fma(_3231, _2659, _3449);
    float _3475 = precise::max(_3451, 0.00999999977648258209228515625);
    float _3477 = fma(_3441, _3455, _3457);
    float _3479 = fma(_3251, _2741, _3459);
    float _3481 = fma(_3463, _3433, _3461);
    float _3483 = _3425 * 1.02332699298858642578125;
    float _3485 = fma(_3231, _2425, _3465);
    float _3487 = _3357 * _3415;
    float _3489 = _3369 * _3419;
    float _3491 = fma(_3441, _3467, _3469);
    float _3493 = fma(_3211, _2549, _3243);
    float _3495 = fma(_3231, _2653, _3471);
    float _3497 = fma(_3251, _2757, _3473);
    float _3499 = _3405 * _3401;
    float _3501 = precise::clamp(_3499, 0.0, 1.0);
    float _3503 = fma(_3481, 0.5, 0.5);
    float _3505 = 1.0 / _3475;
    float _3507 = fma(_3211, _2499, _3355);
    float _3509 = fma(_3231, _2619, _3411);
    float _3511 = fma(_3251, _2777, _3485);
    float _3513 = fma(_3463, _3487, _3477);
    float _3515 = fma(_3211, _2555, _3247);
    float _3517 = fma(_3231, _2665, _3493);
    float _3519 = fma(_3251, _2751, _3495);
    float _3521 = _3479 * _3483;
    float _3523 = fma(_3463, _3489, _3491);
    float _3525 = _3497 * _3483;
    float _3527 = fma(_3231, _2691, _3395);
    float _3529 = fma(_3211, _2393, _3227);
    float _3531 = fma(_3231, _2613, _3507);
    float _3533 = fma(_3251, _2729, _3509);
    float _3535 = _3511 * _3483;
    float _3537 = fma(_3513, 0.5, 0.5);
    float _3539 = fma(_3523, 0.5, 0.5);
    float _3541 = fma(_3211, _2511, _3365);
    float _3543 = fma(_3211, _2469, _3443);
    float _3545 = fma(_3231, _2671, _3515);
    float _3547 = fma(_3251, _2763, _3517);
    float _3549 = fma(_3519, 0.88622701168060302734375, _3525);
    float _3551 = _3463 * 1.02332699298858642578125;
    float _3553 = fma(_3251, _2783, _3383);
    float _3555 = fma(_3251, _2837, _3527);
    float _3557 = fma(_3231, _2437, _3529);
    float _3559 = fma(_3251, _2723, _3531);
    float _3561 = fma(_3533, 0.88622701168060302734375, _3535);
    float _3563 = fma(_3211, _2399, _3267);
    float _3565 = fma(_3211, _2403, _3375);
    float _3567 = fma(_3211, _2481, _3445);
    float _3569 = fma(_3231, _2625, _3541);
    float _3571 = fma(_3231, _2685, _3543);
    float _3573 = fma(_3251, _2769, _3545);
    float _3575 = fma(_3547, _3551, _3549);
    float _3577 = _3441 * 1.02332699298858642578125;
    float _3579 = _3553 * _3483;
    float _3581 = _3555 * _3483;
    float _3583 = abs(_3503);
    float _3585 = log2(_3583);
    float _3587 = fma(_3231, _2815, _3379);
    float _3589 = fma(_3251, _2789, _3557);
    float _3591 = fma(_3559, 0.88622701168060302734375, _3521);
    float _3593 = fma(_3231, _2443, _3563);
    float _3595 = fma(_3231, _2809, _3565);
    float _3597 = fma(_3231, _2697, _3567);
    float _3599 = abs(_3537);
    float _3601 = log2(_3599);
    float _3603 = fma(_3251, _2735, _3569);
    float _3605 = fma(_3251, _2831, _3571);
    float _3607 = fma(_3573, _3577, _3575);
    float _3609 = abs(_3539);
    float _3611 = log2(_3609);
    float _3613 = fma(_3251, _2859, _3587);
    float _3615 = fma(_3589, _3551, _3591);
    float _3617 = fma(_3211, _2421, _3233);
    float _3619 = fma(_3251, _2795, _3593);
    float _3621 = fma(_3251, _2853, _3595);
    float _3623 = fma(_3251, _2843, _3597);
    float _3625 = fma(_3603, 0.88622701168060302734375, _3579);
    float _3627 = fma(_3605, 0.88622701168060302734375, _3581);
    float _3629 = _3607 * 0.31830990314483642578125;
    float _3631 = precise::clamp(_3629, 0.0, 1.0);
    float _3633 = fma(_3211, _2415, _3215);
    float _3635 = fma(_3211, _2487, _3447);
    float _3637 = _3409 * _3505;
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3613, _3577, _3615);
    float _3643 = fma(_3231, _2827, _3617);
    float _3645 = fma(_3619, _3551, _3561);
    float _3647 = fma(_3621, _3551, _3625);
    float _3649 = fma(_3623, _3551, _3627);
    float _3651 = _3631 * 0.88622701168060302734375;
    float _3653 = fma(_3231, _2821, _3633);
    float _3655 = fma(_3231, _2703, _3635);
    float _3657 = fma(_3501, 2.0, 1.0);
    float _3659 = fma(_3429, 2.0, 1.0);
    float _3661 = fma(_3639, 2.0, 1.0);
    float _3663 = fma(_3251, _2871, _3643);
    float _3665 = precise::max(0.0, _3641);
    float _3667 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _3669 = fma(_3251, _2865, _3653);
    float _3671 = fma(_3251, _2849, _3655);
    float _3673 = _3657 * _3585;
    float _3675 = _3659 * _3601;
    float _3677 = _3661 * _3611;
    float _3679 = _3501 + 1.0;
    float _3681 = _3429 + 1.0;
    float _3683 = fma(_3663, _3577, _3647);
    float _3685 = fma(_3669, _3577, _3645);
    float _3687 = fma(_3671, _3577, _3649);
    float _3689 = fma(_3665, (*spvDescriptorSet0.vp_c15)._m0[17].x, _3667);
    float _3691 = _3639 + 1.0;
    float _3693 = exp2(_3673);
    float _3695 = precise::max(0.0, _3685);
    out.m_94.x = _859;
    float _3697 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3699 = in.m_96.x;
    float _3701 = exp2(_3675);
    float _3703 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _3705 = exp2(_3677);
    float _3707 = fma(_3695, (*spvDescriptorSet0.vp_c15)._m0[17].y, _3703);
    float _3709 = -_3501;
    float _3711 = _3709 + 1.0;
    float _3713 = 1.0 / _3679;
    float _3715 = -_3429;
    float _3717 = _3715 + 1.0;
    float _3719 = 1.0 / _3681;
    float _3721 = _3687 * 0.31830990314483642578125;
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = 1.0 / _3691;
    float _3727 = fma(_3501, 2.0, 2.0);
    float _3729 = fma(_3429, 2.0, 2.0);
    float _3731 = fma(_3639, 2.0, 2.0);
    float _3733 = -_3639;
    float _3735 = _3733 + 1.0;
    float _3737 = _3727 * _3693;
    float _3739 = _3729 * _3701;
    float _3741 = _3731 * _3705;
    out.m_98.x = _3441;
    out.m_98.y = _3425;
    out.m_98.z = _3463;
    float _3743 = -_3723;
    float _3745 = _3743 + 1.0;
    out.m_100.x = _1297;
    out.m_100.y = _1295;
    out.m_100.z = _1299;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c15)._m0[659].w, _3723);
    out.m_102.x = 0.0;
    float _3749 = _3711 * _3713;
    float _3751 = _3717 * _3719;
    float _3753 = _3735 * _3725;
    float _3755 = -_3737;
    float _3757 = _3755 + 1.0;
    float _3759 = -_3739;
    float _3761 = _3759 + 1.0;
    float _3763 = -_3741;
    float _3765 = _3763 + 1.0;
    bool _3767 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3769 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _3771 = precise::max(0.0, _3683);
    float _3773 = fma(_3749, _3757, _3737);
    float _3775 = fma(_3751, _3761, _3739);
    float _3777 = fma(_3753, _3765, _3741);
    float _3779 = exp2(_3697);
    float _3781 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[17].z, _3769);
    float _3783 = _3391 * _3773;
    float _3785 = _3311 * _3775;
    float _3787 = _3747 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _3789 = _3451 * _3777;
    bool _3791 = _1307 <= 8000.0;
    bool _3793 = isnan(_1307);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = fma(_3783, _3787, _3689);
    float _3805 = fma(_3785, _3787, _3707);
    float _3807 = fma(_3789, _3787, _3781);
    float _3809 = _3801 * _3181;
    float _3811 = _1367 * _1421;
    float _3813 = _3803 * 0.31830990314483642578125;
    float _3815 = _3805 * 0.31830990314483642578125;
    float _3817 = _3807 * 0.31830990314483642578125;
    bool _3819 = !_3767;
    if (!_3819)
    {
        float _3821 = -_1295;
        float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3825 = -_1297;
        float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3829 = -_1299;
        float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3833 = _3823 * _3823;
        float _3835 = fma(_3827, _3827, _3833);
        float _3837 = fma(_3831, _3831, _3835);
        float _3839 = sqrt(_3837);
        float _3841 = rsqrt(_3837);
        float _3843 = -_3839;
        float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3849 = precise::clamp(_3847, 0.0, 1.0);
        float _3851 = _3827 * _3841;
        float _3853 = _3823 * _3841;
        float _3855 = abs(_3849);
        float _3857 = log2(_3855);
        float _3859 = _3831 * _3841;
        float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3863 = _3425 * _3853;
        float _3865 = -_3853;
        float _3867 = -_3861;
        float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
        float _3871 = fma(_3441, _3851, _3863);
        float _3873 = -_3859;
        float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
        float _3877 = fma(_3463, _3859, _3871);
        float _3879 = precise::clamp(_3877, 0.0, 1.0);
        float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3883 = _3875 + _3881;
        float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3889 = precise::clamp(_3887, 0.0, 1.0);
        float _3891 = exp2(_3885);
        float _3893 = _3891 * _3889;
        float _3895 = _3879 * _3893;
        float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3897;
        out.m_102.y = _3899;
        out.m_102.z = _3901;
    }
    float _3903 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3905 = -_3779;
    float _3907 = _3905 + 1.0;
    float _3909 = -_1840;
    float _3911 = _3909 + 1.0;
    float _3913 = _3811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3915 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3917 = _3911 * _3903;
    float _3919 = precise::clamp(_3917, 0.0, 1.0);
    bool _3921 = _1367 > 0.0;
    bool _3923 = isnan(_1367);
    bool _3925 = _3921 || _3923;
    bool _3927 = isnan(0.0);
    bool _3929 = _3925 || _3927;
    float _3931 = _3913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3933 = _3915 * _1846;
    float _3935 = -_3919;
    float _3937 = fma(_3935, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _3939 = _1421 <= 0.0;
    bool _3941 = !_3929;
    bool _3943 = _3939 || _3941;
    float _3945 = -_3915;
    float _3947 = _3945 + 1.0;
    float _3949 = _1857 * _3933;
    float _3951 = _3937 * _3699;
    float _3953 = _1867 * _3933;
    out.m_56.x = _3931;
    float _3955 = fma(_1863, _3949, _1851);
    float _3957 = fma(_1865, _3949, _1853);
    float _3959 = _3951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3961 = _1857 * _3947;
    float _3963 = fma(_1857, _3953, _1855);
    out.m_84.x = _3813;
    out.m_84.y = _3815;
    out.m_84.z = _3817;
    out.m_104.x = _3959;
    out.m_106.x = _3955;
    out.m_106.y = _3957;
    out.m_106.z = _3963;
    out.m_106.w = _3961;
    if (!_3943)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _3965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3965;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _4022 = as_type<float>(_141);
        out.gl_Position.z = _4022;
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
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_56.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4091 = as_type<float>(_179);
        out.gl_Position.z = _4091;
    }
    if (_173)
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
    float _311 = _301 * _293;
    float _313 = fma(_305, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _315 = fma(_309, _299, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _317 = _313 * _293;
    float _319 = _315 * _293;
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _311);
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
    bool _369 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _371 = isnan(_367);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _385 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _387 = isnan(_367);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _367 + _401;
    float _405 = -_379;
    float _407 = _405 + 1.0;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _411 = 1.0 / _383;
    float _413 = _395 * _407;
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = _399 * _411;
    float _421 = fma(_419, _403, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _423 = _421 * _413;
    float _425 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[115].x, _423);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _433 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[116].x, _425);
    float _435 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _435;
    out.m_66.y = _437;
    out.m_66.z = _439;
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
    float _473 = in.m_62.x;
    float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _477 = log2(_475);
    float _479 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _481 = in.m_62.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _485 = 1.0 + _483;
    float _487 = in.m_62.y;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _499 = _497 != 0;
    float _501 = 1.0 / _485;
    float _503 = in.m_53.x;
    float _505 = in.m_53.y;
    float _507 = in.m_53.z;
    bool _509 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _511 = isnan(1.0);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _517 = _513 || _515;
    bool _519 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = in.m_68.x;
    float _531 = in.m_68.y;
    float _533 = in.m_68.z;
    float _535 = _477 * _159;
    float _537 = exp2(_535);
    float _539 = _473 * 2.0;
    float _541 = _481 * 2.0;
    float _543 = _473 + _481;
    float _545 = floor(_539);
    float _547 = _487 * 2.0;
    float _549 = _543 + (-1.0);
    float _551 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _553 = -_537;
    float _555 = _553 + 1.0;
    float _557 = floor(_541);
    float _559 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _561 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
    float _563 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _565 = _527 ? _555 : 0.0;
    float _567 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
    float _569 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
    float _573 = floor(_547);
    float _575 = _487 + _481;
    bool _577 = _545 > 0.0;
    if (_517)
    {
        float _579 = _565 * _501;
        _163 = _579;
    }
    float _581 = _163;
    bool _583 = _545 >= 0.0;
    bool _585 = isnan(_545);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = _575 + (-1.0);
    float _595 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
    float _597 = _569 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _599 = _557 > 0.0;
    float _601 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _603 = _557 >= 0.0;
    bool _605 = isnan(_557);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _615 = _591 ? 0 : 1;
    float _617 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
    int _619 = _611 ? 0 : 1;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _623 = _597 + _621;
    bool _625 = !_495;
    int _627 = _625 ? 0 : 1;
    bool _629 = _573 > 0.0;
    float _631 = _623 * _623;
    bool _633 = _573 >= 0.0;
    bool _635 = isnan(_573);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _645 = !_491;
    int _647 = _645 ? 0 : 1;
    int _649 = ~_619;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _657 = _643 + _655;
    int _659 = ~_615;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _653;
    int _667 = _663;
    bool _669 = _629;
    if (!_599)
    {
        int _671 = ~_619;
        int _673 = _671 + 1;
        _665 = _673;
    }
    int _675 = _665;
    int _677 = abs(_627);
    if (!_577)
    {
        int _679 = ~_615;
        int _681 = _679 + 1;
        _667 = _681;
    }
    int _683 = _667;
    float _685 = in.m_70.x;
    float _687 = in.m_70.y;
    float _689 = in.m_70.z;
    int _691 = abs(_647);
    float _693 = _617 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _695 = _641 ? 0 : 1;
    float _697 = fma(_657, _657, _631);
    float _699 = float(_677);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _693 + _701;
    float _705 = float(_683);
    int _707 = ~_695;
    int _709 = _707 + 1;
    int _711 = _709 + 1;
    int _713 = _711;
    if (!_629)
    {
        int _715 = ~_695;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    float _721 = fma(_703, _703, _697);
    float _723 = _699 * _705;
    float _725 = float(_675);
    float _727 = sqrt(_721);
    float _729 = float(_691);
    float _731 = _723 * (-2.0);
    bool _733 = !_499;
    int _735 = _733 ? 0 : 1;
    float _737 = _487 + (-0.5);
    float _739 = float(_719);
    float _741 = _729 * _725;
    int _743 = abs(_735);
    float _745 = fma(_731, _687, _687);
    float _747 = fma(_601, _731, _601);
    float _749 = rsqrt(_721);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _753 = _473 + _487;
    float _755 = _479 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _757 = float(_743);
    float _759 = _727 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _761 = _753 + (-1.0);
    float _763 = fma(_747, _581, _751);
    float _765 = _741 * (-2.0);
    float _767 = _757 * _739;
    float _769 = precise::min(_755, _759);
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _773 = _473 + (-0.5);
    float _775 = fma(_765, _685, _685);
    float _777 = _767 * (-2.0);
    float _779 = _749 * _769;
    float _781 = fma(_771, _765, _771);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].x, _775);
    float _785 = fma(_777, _689, _689);
    float _787 = _481 + (-0.5);
    float _789 = _623 * _779;
    float _791 = fma(_613, _777, _613);
    float _793 = _657 * _779;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[196].z, _785);
    float _797 = -_789;
    float _799 = _623 + _797;
    float _801 = fma(_781, _581, _783);
    float _803 = -_793;
    float _805 = _657 + _803;
    float _807 = fma(_791, _581, _795);
    float _809 = _799 * _799;
    float _811 = _703 * _779;
    float _813 = _763 * 0.15915493667125701904296875;
    float _815 = _801 * 0.15915493667125701904296875;
    float _817 = fma(_805, _805, _809);
    float _819 = -_811;
    float _821 = _703 + _819;
    float _823 = _807 * 0.15915493667125701904296875;
    float _825 = _813 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = fma(_821, _821, _817);
    float _831 = -_789;
    float _833 = _597 + _831;
    float _835 = -_793;
    float _837 = _643 + _835;
    float _839 = -_811;
    float _841 = _693 + _839;
    float _843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _531);
    float _845 = sqrt(_829);
    float _847 = _813 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _815 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = _749 * _845;
    float _857 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _859 = _479 * _855;
    float _861 = _815 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _823 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _871 = _853 * _849;
    float _873 = _853 * _827;
    float _875 = _823 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = _863 * _849;
    float _881 = _863 * _827;
    float _883 = _853 * _867;
    float _885 = _857 * _855;
    float _887 = _849 * _867;
    float _889 = _863 * _867;
    float _891 = _827 * _867;
    float _893 = _869 * _855;
    float _895 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _529);
    float _897 = _885 * _843;
    float _899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _533);
    float _901 = fma(_877, _871, _881);
    float _903 = _859 * _895;
    float _905 = _883 * _897;
    float _907 = _893 * _899;
    float _909 = -_879;
    float _911 = fma(_877, _873, _909);
    float _913 = -_897;
    float _915 = _877 * _913;
    float _917 = fma(_901, _903, _905);
    float _919 = -_873;
    float _921 = fma(_877, _879, _919);
    float _923 = _889 * _897;
    float _925 = fma(_887, _903, _915);
    float _927 = fma(_911, _907, _917);
    float _929 = fma(_877, _881, _871);
    float _931 = fma(_921, _903, _923);
    float _933 = fma(_891, _907, _925);
    float _935 = _927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _937 = fma(_929, _907, _931);
    float _939 = _927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _935);
    float _943 = _927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[24].x, _939);
    float _947 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _945);
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _949);
    float _957 = _951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _959 = _693 + _953;
    float _961 = _955 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _963 = _643 + _957;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _959 + _965;
    float _969 = _833 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _971 = _597 + _961;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[11].x, _969);
    float _981 = fma(_975, _975, _977);
    float _983 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[11].z, _979);
    float _985 = sqrt(_981);
    bool _987 = _985 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _989 = _979;
    float _991 = _977;
    float _993 = _961;
    if (!_987)
    {
        _989 = _963;
    }
    float _995 = _989;
    float _997 = _995;
    if (!_987)
    {
        _991 = _959;
    }
    float _999 = _991;
    float _1001 = _999;
    if (!_987)
    {
        _993 = _971;
    }
    float _1003 = _993;
    bool _1005 = !_987;
    float _1007 = _1003;
    if (!_1005)
    {
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1013 = _985 + _1011;
        float _1015 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = _1013 * _1009;
        float _1019 = rsqrt(_981);
        float _1021 = _1017 * 0.15915493667125701904296875;
        float _1023 = _1021 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1021 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        float _1031 = fma(_1025, _1015, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1033 = _1019 * _1031;
        float _1035 = _1029 + (-1.0);
        float _1037 = fma(_975, _1033, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1039 = fma(_967, _1033, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1041 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1043 = fma(_971, _1029, _1041);
        _1007 = _1043;
        _997 = _1037;
        _1001 = _1039;
    }
    float _1045 = _1007;
    float _1047 = _997;
    float _1049 = _1001;
    float _1051 = -_597;
    float _1053 = _1051 + _1045;
    float _1055 = -_643;
    float _1057 = _1055 + _1047;
    float _1059 = _983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1061 = _1053 * _1053;
    float _1063 = _833 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1065 = -_693;
    float _1067 = _1065 + _1049;
    float _1069 = 1.0 / _1059;
    float _1071 = fma(_1057, _1057, _1061);
    float _1073 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1063);
    float _1075 = fma(_837, 0.008000000379979610443115234375, 64.0);
    float _1077 = -_793;
    float _1079 = _1077 + _1047;
    float _1081 = fma(_1067, _1067, _1071);
    float _1083 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1085 = -_789;
    float _1087 = _1085 + _1045;
    float _1089 = precise::max(0.0, _1075);
    float _1091 = sqrt(_1081);
    float _1093 = fma(_841, 0.008000000379979610443115234375, 64.0);
    float _1095 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1097 = precise::min(_1089, 127.0);
    float _1099 = -_811;
    float _1101 = _1099 + _1049;
    float _1103 = precise::max(0.0, _1093);
    float _1105 = _1095 + _1059;
    float _1107 = trunc(_1097);
    int _1109 = int(_1107);
    float _1111 = precise::min(_1103, 127.0);
    float _1113 = _1105 * _1069;
    float _1115 = _1113 * 0.5;
    bool _1117 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1125 = _1121 || _1123;
    bool _1127 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1129 = isnan(0.5);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1135 = _1131 || _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1139 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1137);
    bool _1141 = _1091 > 0.0;
    float _1143 = trunc(_1111);
    int _1145 = int(_1143);
    float _1147 = 1.0 / _1139;
    float _1149 = _1047;
    float _1151 = _1049;
    float _1153 = _1045;
    if (!_1141)
    {
        _1149 = _1079;
    }
    float _1155 = _1149;
    float _1157 = _1155;
    float _1159 = _1155;
    if (!_1141)
    {
        _1151 = _1087;
    }
    float _1161 = _1151;
    int _1163 = _1145 << 7;
    int _1165 = _1163 + _1109;
    float _1167 = _1161;
    if (!_1141)
    {
        _1153 = _1101;
    }
    float _1169 = _1153;
    bool _1171 = !_1141;
    float _1173 = _1169;
    if (!_1171)
    {
        float _1175 = _203 * _203;
        float _1177 = rsqrt(_1081);
        float _1179 = fma(_201, _201, _1175);
        float _1181 = fma(_205, _205, _1179);
        float _1183 = sqrt(_1181);
        float _1185 = _1057 * _1177;
        float _1187 = _1053 * _1177;
        float _1189 = _1067 * _1177;
        bool _1191 = _1183 > 0.0;
        float _1193 = _1177;
        float _1195 = _1183;
        if (!_1191)
        {
            _1157 = _1079;
        }
        float _1197 = _1157;
        _1159 = _1197;
        if (!_1191)
        {
            _1193 = _1087;
        }
        float _1199 = _1193;
        _1167 = _1199;
        if (!_1191)
        {
            _1195 = _1101;
        }
        float _1201 = _1195;
        bool _1203 = !_1191;
        _1173 = _1201;
        if (!_1203)
        {
            float _1205 = rsqrt(_1181);
            float _1207 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1209 = _203 * _1205;
            float _1211 = _201 * _1205;
            float _1213 = _205 * _1205;
            float _1215 = _1187 * _1209;
            float _1217 = fma(_1185, _1211, _1215);
            float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1221 = fma(_1189, _1213, _1217);
            float _1223 = _1221 * _1219;
            float _1225 = fma(_201, _1223, _1079);
            float _1227 = fma(_203, _1223, _1087);
            float _1229 = fma(_205, _1223, _1101);
            _1159 = _1225;
            _1167 = _1227;
            _1173 = _1229;
        }
    }
    float _1231 = _1159;
    float _1233 = _1167;
    float _1235 = _1173;
    int _1237 = _1165 << 4;
    if (_1125)
    {
        _209 = _1231;
    }
    float _1239 = _209;
    float _1241 = _1239;
    if (_1125)
    {
        _211 = _1233;
    }
    float _1243 = _211;
    float _1245 = _1243;
    if (_1125)
    {
        _213 = _1235;
    }
    float _1247 = _213;
    float _1249 = _1247;
    if (!_1125)
    {
        float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1253 = _833 + _1251;
        float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1257 = _837 + _1255;
        float _1259 = -_837;
        float _1261 = _1259 + _1231;
        float _1263 = -_833;
        float _1265 = _1263 + _1233;
        float _1267 = _1253 * _1253;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1271 = _841 + _1269;
        float _1273 = -_841;
        float _1275 = _1273 + _1235;
        float _1277 = fma(_1257, _1257, _1267);
        float _1279 = fma(_1271, _1271, _1277);
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1283 = sqrt(_1279);
        float _1285 = precise::min(_1283, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1287 = _1285 * _1281;
        float _1289 = fma(_1261, _1287, _837);
        float _1291 = fma(_1265, _1287, _833);
        float _1293 = fma(_1275, _1287, _841);
        _1245 = _1291;
        _1241 = _1289;
        _1249 = _1293;
    }
    float _1295 = _1245;
    float _1297 = _1241;
    float _1299 = _1249;
    float _1301 = 0.0;
    if (_1135)
    {
        _1301 = 1.0;
    }
    float _1303 = _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1307 = _1147 * _1305;
    float _1309 = 0.0;
    float _1311 = _1303;
    if (_1135)
    {
        _1309 = 1.0;
    }
    float _1313 = _1309;
    int _1315 = _1237 + 8;
    float _1317 = _1313;
    if (!_1135)
    {
        float _1319 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1321 = _1319 * 0.15915493667125701904296875;
        float _1323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1325 = _1321 * 6.283185482025146484375;
        float _1327 = cos(_1325);
        float _1329 = _1323 * 0.15915493667125701904296875;
        float _1331 = _1321 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = 1.0 / _1327;
        float _1337 = _1329 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1333 * _1335;
        float _1343 = _1329 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1349 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1347;
        float _1351 = _1339 * _1341;
        float _1353 = 1.0 / _1349;
        float _1355 = 1.0 / _1351;
        float _1357 = _1345 * _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1361 = fma(_1307, _1357, _1359);
        float _1363 = _1361 * _1353;
        float _1365 = precise::clamp(_1363, 0.0, 1.0);
        _1311 = _1365;
    }
    float _1367 = _1311;
    if (!_1135)
    {
        float _1369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1371 = _1369 * 0.15915493667125701904296875;
        float _1373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1375 = _1371 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        float _1379 = _1373 * 0.15915493667125701904296875;
        float _1381 = _1371 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = 1.0 / _1377;
        float _1387 = _1379 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = _1379 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = _1389 * _1391;
        float _1399 = 1.0 / _1397;
        float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1403 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1401;
        float _1405 = 1.0 / _1403;
        float _1407 = _1395 * _1399;
        float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1411 = fma(_1307, _1407, _1409);
        float _1413 = _1411 * _1405;
        float _1415 = precise::clamp(_1413, 0.0, 1.0);
        float _1417 = -_1415;
        float _1419 = _1417 + 1.0;
        _1317 = _1419;
    }
    float _1421 = _1317;
    uint _1424 = uint(int(uint(_1315) >> uint(2)));
    float _1426 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1424)]);
    float _1428 = floor(_1097);
    int _1430 = _1237 + 12;
    uint _1432 = uint(int(uint(_1237) >> uint(2)));
    float _1434 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1432)]);
    uint _1436 = uint(int(uint(_1430) >> uint(2)));
    float _1438 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1436)]);
    float _1440 = -_1428;
    float _1442 = _1097 + _1440;
    float _1444 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1446 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1444);
    float _1448 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1446);
    float _1450 = _1426 + _1442;
    float _1452 = trunc(_1450);
    int _1454 = int(_1452);
    int _1456 = _1109 + _1454;
    int _1458 = _1145 << 7;
    int _1460 = _1458 + _1456;
    int _1462 = _1460 << 4;
    float _1464 = floor(_1111);
    int _1466 = _1462 + 12;
    uint _1468 = uint(int(uint(_1462) >> uint(2)));
    float _1470 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1468)]);
    uint _1472 = uint(int(uint(_1466) >> uint(2)));
    float _1474 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1472)]);
    float _1476 = -_1464;
    float _1478 = _1111 + _1476;
    float _1480 = _1426 + _1478;
    float _1482 = trunc(_1480);
    int _1484 = int(_1482);
    int _1486 = _1145 + _1484;
    int _1488 = _1486 << 7;
    int _1490 = _1488 + _1109;
    int _1492 = _1486 << 7;
    int _1494 = _1492 + _1456;
    int _1496 = _1490 << 4;
    int _1498 = _1494 << 4;
    int _1500 = _1496 + 12;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1295 + _1502;
    int _1506 = _1498 + 12;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1297 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1299 + _1512;
    uint _1516 = uint(int(uint(_1500) >> uint(2)));
    float _1518 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1516)]);
    uint _1520 = uint(int(uint(_1506) >> uint(2)));
    float _1522 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1520)]);
    float _1524 = _1504 * _1504;
    uint _1526 = uint(int(uint(_1496) >> uint(2)));
    float _1528 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1526)]);
    float _1530 = fma(_1510, _1510, _1524);
    uint _1532 = uint(int(uint(_1498) >> uint(2)));
    float _1534 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1532)]);
    float _1536 = fma(_1514, _1514, _1530);
    float _1538 = rsqrt(_1536);
    float _1540 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1510 * _1540;
    float _1544 = _1514 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1514;
    float _1562 = _1558;
    float _1564 = as_type<float>(_1500);
    float _1566 = _1540;
    float _1568 = as_type<float>(_1496);
    if (_1554)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1570;
    }
    float _1572 = _1560;
    if (_1554)
    {
        float _1574 = _1558 * _1572;
        _1562 = _1574;
    }
    float _1576 = _1562;
    if (_1554)
    {
        float _1578 = _1576 * 0.15915493667125701904296875;
        _1564 = _1578;
    }
    float _1580 = _1564;
    float _1582 = _1538;
    if (_1554)
    {
        float _1584 = _1580 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1582 = _1586;
    }
    float _1588 = _1582;
    float _1590 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1592 = _1572;
    if (_1554)
    {
        float _1594 = _1580 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = precise::max(0.0, _1590);
    float _1602 = _1550;
    float _1604 = _1600;
    if (_1554)
    {
        float _1606 = rsqrt(_1550);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = -_1540;
    float _1612 = -_1600;
    float _1614 = fma(_1504, _1610, _1612);
    float _1616 = _1614;
    if (_1554)
    {
        float _1618 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1588;
    float _1624 = _1620;
    if (_1554)
    {
        float _1626 = _1588 + (-1.0);
        _1566 = _1626;
    }
    float _1628 = _1566;
    float _1630 = sqrt(_1536);
    float _1632 = _1598;
    float _1634 = _1628;
    if (_1554)
    {
        float _1636 = fma(_1598, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (_1554)
    {
        float _1642 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1642;
    }
    float _1644 = _1634;
    if (_1554)
    {
        float _1646 = _1608 * _1638;
        _1568 = _1646;
    }
    float _1648 = _1568;
    if (!_1554)
    {
        _1640 = _1542;
    }
    float _1650 = _1640;
    float _1652 = _1650;
    if (_1554)
    {
        float _1654 = fma(_1614, _1588, _1644);
        _1616 = _1654;
    }
    float _1656 = _1616;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1554)
    {
        float _1660 = _1542 * _1648;
        _1652 = _1660;
    }
    float _1662 = _1652;
    if (!_1554)
    {
        _1622 = _1546;
    }
    float _1664 = _1622;
    float _1666 = _1664;
    if (!_1554)
    {
        _1624 = _1544;
    }
    float _1668 = _1624;
    float _1670 = _1668;
    if (_1554)
    {
        float _1672 = _1544 * _1648;
        _1670 = _1672;
    }
    float _1674 = _1670;
    if (_1554)
    {
        float _1676 = _1662 * _1662;
        _1666 = _1676;
    }
    float _1678 = _1666;
    float _1680 = fma(_837, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1554)
    {
        _1658 = _1548;
    }
    float _1682 = _1658;
    float _1684 = _1682;
    if (_1554)
    {
        float _1686 = _1674 * _1674;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1656, _1656, _1678);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1700 = _1690 + _1688;
    float _1702 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1698);
    float _1706 = fma(_841, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1708 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1710 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1712 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1714 = rsqrt(_1700);
    float _1716 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1708);
    float _1718 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1710);
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1722 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1724 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = -_1696;
    float _1730 = _1728 + 1.0;
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = abs(_1730);
    float _1738 = log2(_1736);
    float _1740 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1744 = _1714 * _1662;
    float _1746 = _1714 * _1656;
    float _1748 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1750 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1756 = _1714 * _1674;
    float _1758 = -_1750;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = -_1752;
    float _1764 = fma(_1762, _1754, 1.0);
    float _1766 = -_1756;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1770 = floor(_1680);
    float _1772 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1774 = fma(_1768, -0.5, 0.5);
    float _1776 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1778 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1780 = exp2(_1772);
    float _1782 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1776);
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1778);
    float _1786 = log2(_1764);
    float _1788 = fma(_1768, 0.5, 0.5);
    float _1790 = 1.0 / _1748;
    float _1792 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1794 = floor(_1706);
    float _1796 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1798 = sqrt(_1774);
    float _1800 = -_1770;
    float _1802 = _1680 + _1800;
    float _1804 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = _1746 + 1.0;
    float _1808 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1810 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1812 = fma(_1788, _1804, -0.212114393711090087890625);
    float _1814 = -_1746;
    float _1816 = fma(_1780, _1806, _1814);
    float _1818 = _1786 * 0.693147182464599609375;
    float _1820 = _1808 * _1790;
    float _1822 = _1810 * _1790;
    float _1824 = -_1794;
    float _1826 = _1706 + _1824;
    float _1828 = fma(_1788, _1812, 1.570728778839111328125);
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1832 = fma(_1820, 0.5, 0.5);
    float _1834 = _1798 * 0.636619746685028076171875;
    float _1836 = fma(_1822, -0.5, 0.5);
    float _1838 = fma(_1816, 0.5, 0.5);
    float2 _6654 = float2(_1802, _1826);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6654, float2(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6654, float2(0.0), isnan(_6654)), level(0.0)).x;
    float _1842 = -_1828;
    float _1844 = fma(_1834, _1842, 1.0);
    float3 _6670 = float3(_1832, _1836, _1830);
    float _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6670, float3(0.0), isnan(_6670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6670, float3(0.0), isnan(_6670)), level(0.0)).x;
    float3 _6681 = float3(_1832, _1836, _1830);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6681, float3(0.0), isnan(_6681)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6681, float3(0.0), isnan(_6681)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _6697 = float2(_1844, _1838);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6697, float2(0.0), isnan(_6697)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6697, float2(0.0), isnan(_6697)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = floor(_1450);
    float _1871 = _1478 * _1474;
    float _1873 = in.m_72.y;
    float _1875 = in.m_62.w;
    float _1877 = in.m_72.x;
    float _1879 = in.m_74.x;
    float _1881 = in.m_74.y;
    float _1883 = in.m_74.z;
    float _1885 = -_1869;
    float _1887 = _1450 + _1885;
    float _1889 = in.m_76.x;
    float _1891 = in.m_76.y;
    float _1893 = in.m_76.z;
    float _1895 = in.m_76.w;
    float _1897 = _1887 * _1474;
    float _1899 = floor(_1871);
    float _1901 = floor(_1897);
    float _1903 = fma(_1474, _1899, _1901);
    float _1905 = floor(_1480);
    float _1907 = _1478 * _1438;
    float _1909 = _1442 * _1438;
    float _1911 = _1442 * _1518;
    float _1913 = _1887 * _1522;
    float _1915 = floor(_1907);
    float _1917 = -_1905;
    float _1919 = _1480 + _1917;
    float _1921 = floor(_1909);
    float _1923 = _1919 * _1518;
    float _1925 = _1919 * _1522;
    float _1927 = floor(_1923);
    float _1929 = floor(_1911);
    float _1931 = trunc(_1903);
    int _1933 = int(_1931);
    float _1935 = floor(_1913);
    float _1937 = floor(_1925);
    float _1939 = fma(_1438, _1915, _1921);
    float _1941 = fma(_1518, _1927, _1929);
    int _1943 = as_type<int>(_1470) + _1933;
    float _1945 = trunc(_1939);
    int _1947 = int(_1945);
    float _1949 = fma(_1522, _1937, _1935);
    float _1951 = trunc(_1941);
    int _1953 = int(_1951);
    float _1955 = trunc(_1949);
    int _1957 = int(_1955);
    int _1959 = _1943 * 656;
    int _1961 = as_type<int>(_1434) + _1947;
    int _1963 = _1959 + 262160;
    int _1965 = _1961 * 656;
    int _1967 = as_type<int>(_1528) + _1953;
    int _1969 = _1959 + 262240;
    int _1971 = _1959 + 262176;
    int _1973 = _1959 + 262192;
    int _1975 = _1967 * 656;
    int _1977 = as_type<int>(_1534) + _1957;
    uint _1979 = uint(int(uint(_1963) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1979)];
    float _1981 = as_type<float>(_dmw1.x);
    int _1983 = _1963 + 4;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    float _1987 = as_type<float>(_dmw1.y);
    int _1989 = _1963 + 8;
    uint _1991 = uint(int(uint(_1989) >> uint(2)));
    float _1993 = as_type<float>(_dmw1.z);
    int _1995 = _1963 + 12;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    float _1999 = as_type<float>(_dmw1.w);
    int _2001 = _1959 + 262224;
    int _2003 = _1965 + 262192;
    uint _2005 = uint(int(uint(_1969) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2005)];
    float _2007 = as_type<float>(_dmw6.x);
    int _2009 = _1969 + 4;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    float _2013 = as_type<float>(_dmw6.y);
    int _2015 = _1969 + 8;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    float _2019 = as_type<float>(_dmw6.z);
    int _2021 = _1969 + 12;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    float _2025 = as_type<float>(_dmw6.w);
    int _2027 = _1959 + 262208;
    int _2029 = _1977 * 656;
    uint _2031 = uint(int(uint(_1971) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2031)];
    float _2033 = as_type<float>(_dmw2.x);
    int _2035 = _1971 + 4;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    float _2039 = as_type<float>(_dmw2.y);
    int _2041 = _1971 + 8;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    float _2045 = as_type<float>(_dmw2.z);
    int _2047 = _1971 + 12;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    float _2051 = as_type<float>(_dmw2.w);
    int _2053 = _1965 + 262224;
    uint _2055 = uint(int(uint(_1973) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2055)];
    float _2057 = as_type<float>(_dmw3.x);
    int _2059 = _1973 + 4;
    uint _2061 = uint(int(uint(_2059) >> uint(2)));
    float _2063 = as_type<float>(_dmw3.y);
    int _2065 = _1973 + 8;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    float _2069 = as_type<float>(_dmw3.z);
    int _2071 = _1973 + 12;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    float _2075 = as_type<float>(_dmw3.w);
    int _2077 = _1975 + 262192;
    int _2079 = _1959 + 262144;
    uint _2081 = uint(int(uint(_2003) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2081)];
    float _2083 = as_type<float>(_dmw11.x);
    int _2085 = _2003 + 4;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    float _2089 = as_type<float>(_dmw11.y);
    int _2091 = _2003 + 8;
    uint _2093 = uint(int(uint(_2091) >> uint(2)));
    float _2095 = as_type<float>(_dmw11.z);
    int _2097 = _2003 + 12;
    uint _2099 = uint(int(uint(_2097) >> uint(2)));
    float _2101 = as_type<float>(_dmw11.w);
    int _2103 = _1959 + 262256;
    int _2105 = _1965 + 262208;
    uint _2107 = uint(int(uint(_2001) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2107)];
    float _2109 = as_type<float>(_dmw5.x);
    int _2111 = _2001 + 4;
    uint _2113 = uint(int(uint(_2111) >> uint(2)));
    float _2115 = as_type<float>(_dmw5.y);
    int _2117 = _2001 + 8;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    float _2121 = as_type<float>(_dmw5.z);
    int _2123 = _2001 + 12;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    float _2127 = as_type<float>(_dmw5.w);
    int _2129 = _1975 + 262224;
    int _2131 = _2029 + 262192;
    uint _2133 = uint(int(uint(_2027) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2133)];
    float _2135 = as_type<float>(_dmw4.x);
    int _2137 = _2027 + 4;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    float _2141 = as_type<float>(_dmw4.y);
    int _2143 = _2027 + 8;
    uint _2145 = uint(int(uint(_2143) >> uint(2)));
    float _2147 = as_type<float>(_dmw4.z);
    int _2149 = _2027 + 12;
    uint _2151 = uint(int(uint(_2149) >> uint(2)));
    float _2153 = as_type<float>(_dmw4.w);
    int _2155 = _1965 + 262144;
    int _2157 = _1965 + 262160;
    uint _2159 = uint(int(uint(_2077) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2159)];
    float _2161 = as_type<float>(_dmw17.x);
    int _2163 = _2077 + 4;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    float _2167 = as_type<float>(_dmw17.y);
    int _2169 = _2077 + 8;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    float _2173 = as_type<float>(_dmw17.z);
    int _2175 = _2077 + 12;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    float _2179 = as_type<float>(_dmw17.w);
    int _2181 = _1965 + 262176;
    int _2183 = _1965 + 262240;
    uint _2185 = uint(int(uint(_2105) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2185)];
    float _2187 = as_type<float>(_dmw12.x);
    int _2189 = _2105 + 4;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    float _2193 = as_type<float>(_dmw12.y);
    int _2195 = _2105 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    float _2199 = as_type<float>(_dmw12.z);
    int _2201 = _2105 + 12;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    float _2205 = as_type<float>(_dmw12.w);
    int _2207 = _1965 + 262256;
    int _2209 = _1975 + 262208;
    uint _2211 = uint(int(uint(_2053) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2211)];
    float _2213 = as_type<float>(_dmw13.x);
    int _2215 = _2053 + 4;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    float _2219 = as_type<float>(_dmw13.y);
    int _2221 = _2053 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    float _2225 = as_type<float>(_dmw13.z);
    int _2227 = _2053 + 12;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    float _2231 = as_type<float>(_dmw13.w);
    int _2233 = _2029 + 262224;
    int _2235 = _1975 + 262144;
    uint _2237 = uint(int(uint(_2131) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2237)];
    float _2239 = as_type<float>(_dmw20.x);
    int _2241 = _2131 + 4;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    float _2245 = as_type<float>(_dmw20.y);
    int _2247 = _2131 + 8;
    uint _2249 = uint(int(uint(_2247) >> uint(2)));
    float _2251 = as_type<float>(_dmw20.z);
    int _2253 = _2131 + 12;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    float _2257 = as_type<float>(_dmw20.w);
    int _2259 = _1975 + 262160;
    int _2261 = _1975 + 262176;
    uint _2263 = uint(int(uint(_2209) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2263)];
    float _2265 = as_type<float>(_dmw18.x);
    int _2267 = _2209 + 4;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    float _2271 = as_type<float>(_dmw18.y);
    int _2273 = _2209 + 8;
    uint _2275 = uint(int(uint(_2273) >> uint(2)));
    float _2277 = as_type<float>(_dmw18.z);
    int _2279 = _2209 + 12;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    float _2283 = as_type<float>(_dmw18.w);
    int _2285 = _1975 + 262240;
    int _2287 = _1975 + 262256;
    uint _2289 = uint(int(uint(_2233) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2289)];
    float _2291 = as_type<float>(_dmw22.x);
    int _2293 = _2233 + 4;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    float _2297 = as_type<float>(_dmw22.y);
    int _2299 = _2233 + 8;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    float _2303 = as_type<float>(_dmw22.z);
    int _2305 = _2233 + 12;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    float _2309 = as_type<float>(_dmw22.w);
    int _2311 = _2029 + 262208;
    uint _2313 = uint(int(uint(_2129) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2313)];
    float _2315 = as_type<float>(_dmw19.x);
    int _2317 = _2129 + 4;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    float _2321 = as_type<float>(_dmw19.y);
    int _2323 = _2129 + 8;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    float _2327 = as_type<float>(_dmw19.z);
    int _2329 = _2129 + 12;
    uint _2331 = uint(int(uint(_2329) >> uint(2)));
    float _2333 = as_type<float>(_dmw19.w);
    uint _2335 = uint(int(uint(_2311) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2335)];
    float _2337 = as_type<float>(_dmw21.x);
    int _2339 = _2311 + 4;
    uint _2341 = uint(int(uint(_2339) >> uint(2)));
    float _2343 = as_type<float>(_dmw21.y);
    int _2345 = _2311 + 8;
    uint _2347 = uint(int(uint(_2345) >> uint(2)));
    float _2349 = as_type<float>(_dmw21.z);
    int _2351 = _2311 + 12;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    float _2355 = as_type<float>(_dmw21.w);
    uint _2357 = uint(int(uint(_2079) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2357)];
    float _2359 = as_type<float>(_dmw0.x);
    int _2361 = _2079 + 4;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    float _2365 = as_type<float>(_dmw0.y);
    int _2367 = _2079 + 8;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    float _2371 = as_type<float>(_dmw0.z);
    int _2373 = _2079 + 12;
    uint _2375 = uint(int(uint(_2373) >> uint(2)));
    float _2377 = as_type<float>(_dmw0.w);
    uint _2379 = uint(int(uint(_2157) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2379)];
    float _2381 = as_type<float>(_dmw9.x);
    int _2383 = _2157 + 4;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw9.y);
    int _2389 = _2157 + 8;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw9.z);
    int _2395 = _2157 + 12;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    float _2399 = as_type<float>(_dmw9.w);
    uint _2401 = uint(int(uint(_2181) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2401)];
    float _2403 = as_type<float>(_dmw10.x);
    int _2405 = _2181 + 4;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    float _2409 = as_type<float>(_dmw10.y);
    int _2411 = _2181 + 8;
    uint _2413 = uint(int(uint(_2411) >> uint(2)));
    float _2415 = as_type<float>(_dmw10.z);
    int _2417 = _2181 + 12;
    uint _2419 = uint(int(uint(_2417) >> uint(2)));
    float _2421 = as_type<float>(_dmw10.w);
    uint _2423 = uint(int(uint(_2259) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2423)];
    float _2425 = as_type<float>(_dmw16.x);
    int _2427 = _2259 + 4;
    uint _2429 = uint(int(uint(_2427) >> uint(2)));
    float _2431 = as_type<float>(_dmw16.y);
    int _2433 = _2259 + 8;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    float _2437 = as_type<float>(_dmw16.z);
    int _2439 = _2259 + 12;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    float _2443 = as_type<float>(_dmw16.w);
    uint _2445 = uint(int(uint(_2103) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2445)];
    float _2447 = as_type<float>(_dmw7.x);
    int _2449 = _2103 + 4;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    float _2453 = as_type<float>(_dmw7.y);
    int _2455 = _2103 + 8;
    uint _2457 = uint(int(uint(_2455) >> uint(2)));
    float _2459 = as_type<float>(_dmw7.z);
    int _2461 = _2103 + 12;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    float _2465 = as_type<float>(_dmw7.w);
    uint _2467 = uint(int(uint(_2207) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2467)];
    float _2469 = as_type<float>(_dmw15.x);
    int _2471 = _2207 + 4;
    uint _2473 = uint(int(uint(_2471) >> uint(2)));
    float _2475 = as_type<float>(_dmw15.y);
    int _2477 = _2207 + 8;
    uint _2479 = uint(int(uint(_2477) >> uint(2)));
    float _2481 = as_type<float>(_dmw15.z);
    int _2483 = _2207 + 12;
    uint _2485 = uint(int(uint(_2483) >> uint(2)));
    float _2487 = as_type<float>(_dmw15.w);
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    uint _2497 = uint(int(uint(_2155) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2497)];
    float _2499 = as_type<float>(_dmw8.x);
    int _2501 = _2155 + 4;
    uint _2503 = uint(int(uint(_2501) >> uint(2)));
    float _2505 = as_type<float>(_dmw8.y);
    int _2507 = _2155 + 8;
    uint _2509 = uint(int(uint(_2507) >> uint(2)));
    float _2511 = as_type<float>(_dmw8.z);
    int _2513 = _2155 + 12;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    float _2517 = as_type<float>(_dmw8.w);
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2521 = _2519 != 0;
    float _2523 = 1.0 / _2491;
    int _2525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2527 = _2525 != 0;
    float _2529 = -_1873;
    float _2531 = _2529 + 1.0;
    bool _2533 = _1875 > 0.5;
    uint _2535 = uint(int(uint(_2183) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2535)];
    float _2537 = as_type<float>(_dmw14.x);
    int _2539 = _2183 + 4;
    uint _2541 = uint(int(uint(_2539) >> uint(2)));
    float _2543 = as_type<float>(_dmw14.y);
    int _2545 = _2183 + 8;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    float _2549 = as_type<float>(_dmw14.z);
    int _2551 = _2183 + 12;
    uint _2553 = uint(int(uint(_2551) >> uint(2)));
    float _2555 = as_type<float>(_dmw14.w);
    float _2557 = 1.0 / _2495;
    bool _2559 = _487 > 0.5;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2563 = _2561 != 0;
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2567 = _2565 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2569 = _2533;
    float _2571 = _1873;
    float _2573 = _1877;
    if (_2521)
    {
        bool _2575 = _473 > 0.5;
        _669 = _2575;
    }
    bool _2577 = _669;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2579;
    int _2583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2585 = _2583 != 0;
    bool _2587 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2589 = isnan(_471);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    out.m_78.x = 1.0;
    out.m_78.y = 1.0;
    out.m_78.z = 1.0;
    int _2599 = _2533 ? as_type<int>(_2531) : as_type<int>(_1873);
    float _2601 = _2581 * _2523;
    if (_2527)
    {
        bool _2603 = _481 > 0.5;
        _2569 = _2603;
    }
    bool _2605 = _2569;
    float _2607 = _2567 * _2557;
    int _2609 = _2029 + 262144;
    uint _2611 = uint(int(uint(_2235) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2611)];
    float _2613 = as_type<float>(_dmw23.x);
    int _2615 = _2235 + 4;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    float _2619 = as_type<float>(_dmw23.y);
    int _2621 = _2235 + 8;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    float _2625 = as_type<float>(_dmw23.z);
    int _2627 = _2235 + 12;
    uint _2629 = uint(int(uint(_2627) >> uint(2)));
    float _2631 = as_type<float>(_dmw23.w);
    bool _2633 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2635 = isnan(_471);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2641 = _2637 || _2639;
    float _2643 = float(_2641);
    float _2645 = -_2597;
    float _2647 = _2645 + 1.0;
    int _2649 = _2029 + 262240;
    uint _2651 = uint(int(uint(_2285) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2651)];
    float _2653 = as_type<float>(_dmw24.x);
    int _2655 = _2285 + 4;
    uint _2657 = uint(int(uint(_2655) >> uint(2)));
    float _2659 = as_type<float>(_dmw24.y);
    int _2661 = _2285 + 8;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    float _2665 = as_type<float>(_dmw24.z);
    int _2667 = _2285 + 12;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    float _2671 = as_type<float>(_dmw24.w);
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2675 = _471 + _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2679 = _471 + _2677;
    int _2681 = _2029 + 262160;
    uint _2683 = uint(int(uint(_2287) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2683)];
    float _2685 = as_type<float>(_dmw25.x);
    int _2687 = _2287 + 4;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    float _2691 = as_type<float>(_dmw25.y);
    int _2693 = _2287 + 8;
    uint _2695 = uint(int(uint(_2693) >> uint(2)));
    float _2697 = as_type<float>(_dmw25.z);
    int _2699 = _2287 + 12;
    uint _2701 = uint(int(uint(_2699) >> uint(2)));
    float _2703 = as_type<float>(_dmw25.w);
    float _2705 = fma(_2601, _2675, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2707 = fma(_2607, _2679, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2709 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2711 = isnan(_471);
    bool _2713 = _2709 || _2711;
    bool _2715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2717 = _2713 || _2715;
    float _2719 = float(_2717);
    uint _2721 = uint(int(uint(_2609) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2721)];
    float _2723 = as_type<float>(_dmw26.x);
    int _2725 = _2609 + 4;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    float _2729 = as_type<float>(_dmw26.y);
    int _2731 = _2609 + 8;
    uint _2733 = uint(int(uint(_2731) >> uint(2)));
    float _2735 = as_type<float>(_dmw26.z);
    int _2737 = _2609 + 12;
    uint _2739 = uint(int(uint(_2737) >> uint(2)));
    float _2741 = as_type<float>(_dmw26.w);
    float _2743 = _2643 * _2647;
    float _2745 = -_2643;
    float _2747 = _2745 + 1.0;
    uint _2749 = uint(int(uint(_2649) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2749)];
    float _2751 = as_type<float>(_dmw28.x);
    int _2753 = _2649 + 4;
    uint _2755 = uint(int(uint(_2753) >> uint(2)));
    float _2757 = as_type<float>(_dmw28.y);
    int _2759 = _2649 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    float _2763 = as_type<float>(_dmw28.z);
    int _2765 = _2649 + 12;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    float _2769 = as_type<float>(_dmw28.w);
    int _2771 = _2029 + 262176;
    int _2773 = _2029 + 262256;
    uint _2775 = uint(int(uint(_2681) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
    float _2777 = as_type<float>(_dmw27.x);
    int _2779 = _2681 + 4;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    float _2783 = as_type<float>(_dmw27.y);
    int _2785 = _2681 + 8;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    float _2789 = as_type<float>(_dmw27.z);
    int _2791 = _2681 + 12;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    float _2795 = as_type<float>(_dmw27.w);
    float _2797 = _2563 ? as_type<float>(_2599) : _1873;
    float _2799 = _2719 * _2747;
    float _2801 = _2799;
    if (_2585)
    {
        float _2803 = _2559 ? _2531 : _1873;
        _2571 = _2803;
    }
    float _2805 = _2571;
    uint _2807 = uint(int(uint(_2261) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2807)];
    float _2809 = as_type<float>(_dmw29.x);
    int _2811 = _2261 + 4;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    float _2815 = as_type<float>(_dmw29.y);
    int _2817 = _2261 + 8;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    float _2821 = as_type<float>(_dmw29.z);
    int _2823 = _2261 + 12;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    float _2827 = as_type<float>(_dmw29.w);
    uint _2829 = uint(int(uint(_2773) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2829)];
    float _2831 = as_type<float>(_dmw31.x);
    int _2833 = _2773 + 4;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    float _2837 = as_type<float>(_dmw31.y);
    int _2839 = _2773 + 8;
    uint _2841 = uint(int(uint(_2839) >> uint(2)));
    float _2843 = as_type<float>(_dmw31.z);
    int _2845 = _2773 + 12;
    uint _2847 = uint(int(uint(_2845) >> uint(2)));
    float _2849 = as_type<float>(_dmw31.w);
    uint _2851 = uint(int(uint(_2771) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2851)];
    float _2853 = as_type<float>(_dmw30.x);
    int _2855 = _2771 + 4;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    float _2859 = as_type<float>(_dmw30.y);
    int _2861 = _2771 + 8;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    float _2865 = as_type<float>(_dmw30.z);
    int _2867 = _2771 + 12;
    uint _2869 = uint(int(uint(_2867) >> uint(2)));
    float _2871 = as_type<float>(_dmw30.w);
    bool _2873 = _531 != 0.0;
    bool _2875 = isnan(_531);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(0.0);
    bool _2881 = _2877 || _2879;
    bool _2883 = _529 == 0.0;
    bool _2885 = !_2881;
    bool _2887 = _2883 && _2885;
    bool _2889 = _533 == 0.0;
    bool _2891 = _2889 && _2887;
    int _2893 = 0;
    if (_2521)
    {
        float _2895 = -_1877;
        float _2897 = _2895 + 1.0;
        _2893 = as_type<int>(_2897);
    }
    int _2899 = _2893;
    float _2901 = _2705 * _2799;
    float _2903 = -_2719;
    float _2905 = _2903 + 1.0;
    float _2907 = 0.0;
    float _2909 = _2901;
    float _2911 = _2905;
    if (!_2521)
    {
        _2907 = _1877;
    }
    float _2913 = _2907;
    float _2915 = _2913;
    if (_2521)
    {
        float _2917 = _2577 ? as_type<float>(_2899) : _1877;
        _2915 = _2917;
    }
    float _2919 = _2915;
    float _2921 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2901);
    float _2923 = 0.0;
    if (_2891)
    {
        _2923 = _1879;
    }
    float _2925 = _2923;
    float _2927 = _2925;
    if (_2891)
    {
        _2909 = _2925;
    }
    float _2929 = _2909;
    float _2931 = _2929;
    if (!_2891)
    {
        _2927 = _1879;
    }
    float _2933 = _2927;
    float _2935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2937 = 0.0;
    if (_2891)
    {
        _2937 = _1881;
    }
    float _2939 = _2937;
    float _2941 = _2939;
    if (_2891)
    {
        _2801 = _2939;
    }
    float _2943 = _2801;
    float _2945 = _2943;
    if (!_2891)
    {
        _2941 = _1881;
    }
    float _2947 = _2941;
    int _2949 = 0;
    if (_2527)
    {
        float _2951 = -_1877;
        float _2953 = _2951 + 1.0;
        _2949 = as_type<int>(_2953);
    }
    int _2955 = _2949;
    float _2957 = fma(_2707, _2743, _2921);
    float _2959 = _1891 * _1883;
    float _2961 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_2891)
    {
        float _2963 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2947);
        _2945 = _2963;
    }
    float _2965 = _2945;
    float _2967 = _1893 * _2933;
    if (_2527)
    {
        float _2969 = _2605 ? as_type<float>(_2955) : _1877;
        _2573 = _2969;
    }
    float _2971 = _2573;
    float _2973 = -_2959;
    float _2975 = fma(_1893, _2947, _2973);
    if (_2891)
    {
        _2911 = _1883;
    }
    float _2977 = _2911;
    float _2979 = _2977;
    if (!_2891)
    {
        float _2981 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1883);
        _2979 = _2981;
    }
    float _2983 = _2979;
    float _2985 = -_2967;
    float _2987 = fma(_1889, _1883, _2985);
    float _2989 = _2961 * _2935;
    float _2991 = fma(_2597, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2957);
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2999 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3001 = _2993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3003 = _2995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3005 = _2997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3007 = _2991 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _3001;
    out.m_80.y = _3003;
    out.m_80.z = _3005;
    out.m_80.w = _3007;
    float _3009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_2891)
    {
        float _3011 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2933);
        _2931 = _3011;
    }
    float _3013 = _2931;
    float _3015 = _1889 * _2947;
    float _3017 = abs(_1307);
    float _3019 = log2(_3017);
    float _3021 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3023 = -_3015;
    float _3025 = fma(_1891, _2933, _3023);
    float _3027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3031 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3033 = _2987 * _1895;
    float _3035 = _2975 * _1895;
    float _3037 = _3025 * _1895;
    float _3039 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3041 = _2919 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _837;
    out.m_82.y = _833;
    out.m_82.z = _841;
    float _3043 = exp2(_3031);
    float _3045 = -_877;
    float _3047 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3039);
    float _3049 = _3021 * _3027;
    float _3051 = _3041 * _3009;
    float _3053 = _901 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3055 = _2999 * _3029;
    float _3057 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3059 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3061 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.w = _769;
    float _3063 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3053);
    out.m_86.x = _3051;
    out.m_86.y = _3049;
    out.m_86.z = _3055;
    out.m_86.w = _2989;
    float _3065 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3059);
    float _3067 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3063);
    float _3069 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3071 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3073 = -_877;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3057);
    float _3077 = _901 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3079 = _901 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3081 = -_877;
    float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3085 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3075);
    float _3087 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3077);
    float _3089 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3079);
    float _3091 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3083);
    float _3093 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3095 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3087);
    float _3097 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3089);
    float _3099 = _3069 * _2965;
    float _3101 = _3085 * _2965;
    float _3103 = _3091 * _1891;
    float _3105 = _3091 * _2965;
    float _3107 = fma(_3043, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3109 = precise::clamp(_3107, 0.0, 1.0);
    float _3111 = _3033 * _3091;
    float _3113 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3093);
    float _3115 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3117 = fma(_3095, _3013, _3099);
    float _3119 = fma(_3097, _3013, _3101);
    float _3121 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3123 = _3069 * _1891;
    float _3125 = _3085 * _1891;
    float _3127 = fma(_3067, _3013, _3105);
    float _3129 = _3033 * _3069;
    float _3131 = fma(_3067, _1889, _3103);
    float _3133 = fma(_3035, _3067, _3111);
    float _3135 = _3109 * _3109;
    float _3137 = fma(_3109, -2.0, 3.0);
    float _3139 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3115);
    float _3141 = _3033 * _3085;
    float _3143 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3121);
    float _3145 = fma(_3095, _1889, _3123);
    float _3147 = fma(_3035, _3095, _3129);
    float _3149 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    float _3151 = _3135 * _3137;
    float _3153 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3139);
    float _3155 = fma(_3035, _3097, _3141);
    float _3157 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3143);
    float _3159 = fma(_3037, _3071, _3147);
    float _3161 = fma(_3097, _1889, _3125);
    float _3163 = -_3151;
    float _3165 = _3163 + 1.0;
    float _3167 = fma(_3037, _3149, _3155);
    float _3169 = fma(_3037, _3153, _3133);
    float _3171 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3157);
    float _3173 = -_1915;
    float _3175 = _1907 + _3173;
    float _3177 = fma(_3071, _1893, _3145);
    float _3179 = fma(_3149, _1893, _3161);
    float _3181 = fma(_3165, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3151);
    float _3183 = fma(_3153, _1893, _3131);
    float _3185 = _3171 + _1748;
    float _3187 = _1808 + _1748;
    float _3189 = _1748 * 0.5;
    out.m_88.x = _3159;
    out.m_88.y = _3167;
    out.m_88.z = _3169;
    float _3191 = -_1921;
    float _3193 = _1909 + _3191;
    float _3195 = _3185 * 0.5;
    float _3197 = _3187 * 0.5;
    float _3199 = fma(_1810, -0.5, _3189);
    out.m_90.x = _3177;
    out.m_90.y = _3179;
    out.m_90.z = _3183;
    float _3201 = -_3175;
    float _3203 = _3201 + 1.0;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _3171;
    out.gl_Position.w = _1748;
    float _3205 = _3193 * _3203;
    float _3207 = -_3193;
    float _3209 = _3207 + 1.0;
    out.m_92.x = _3197;
    out.m_92.y = _3199;
    out.m_92.z = _3195;
    out.m_92.w = _1748;
    float _3211 = _3209 * _3203;
    float _3213 = _3205 * _1987;
    float _3215 = _3205 * _2045;
    float _3217 = _3205 * _1981;
    float _3219 = _3205 * _2063;
    float _3221 = _3205 * _2039;
    float _3223 = _3205 * _2007;
    float _3225 = _3205 * _2075;
    float _3227 = _3205 * _1993;
    float _3229 = _3205 * _2069;
    float _3231 = _3175 * _3209;
    float _3233 = _3205 * _2051;
    float _3235 = _3205 * _2115;
    float _3237 = fma(_3211, _2101, _3225);
    float _3239 = _3205 * _2135;
    float _3241 = fma(_3211, _2089, _3219);
    float _3243 = _3205 * _2019;
    float _3245 = _3205 * _2013;
    float _3247 = _3205 * _2025;
    float _3249 = _3205 * _2141;
    float _3251 = _3193 * _3175;
    float _3253 = _3205 * _2147;
    float _3255 = _3205 * _2109;
    float _3257 = fma(_3211, _2219, _3235);
    float _3259 = fma(_3231, _2179, _3237);
    float _3261 = _3205 * _2121;
    float _3263 = fma(_3211, _2187, _3239);
    float _3265 = fma(_3231, _2167, _3241);
    float _3267 = _3205 * _1999;
    float _3269 = _3205 * _2127;
    float _3271 = fma(_3211, _2193, _3249);
    float _3273 = _3205 * _2057;
    float _3275 = fma(_3211, _2199, _3253);
    float _3277 = fma(_3211, _2213, _3255);
    float _3279 = fma(_3231, _2321, _3257);
    float _3281 = fma(_3251, _2257, _3259);
    float _3283 = _3205 * _2153;
    float _3285 = fma(_3211, _2225, _3261);
    float _3287 = fma(_3231, _2265, _3263);
    float _3289 = fma(_3251, _2245, _3265);
    float _3291 = fma(_3211, _2231, _3269);
    float _3293 = fma(_3231, _2271, _3271);
    float _3295 = fma(_3211, _2083, _3273);
    float _3297 = fma(_3231, _2277, _3275);
    float _3299 = fma(_3231, _2315, _3277);
    float _3301 = fma(_3251, _2297, _3279);
    float _3303 = _3281 * 0.511664927005767822265625;
    float _3305 = fma(_3211, _2205, _3283);
    float _3307 = fma(_3231, _2327, _3285);
    float _3309 = fma(_3251, _2337, _3287);
    float _3311 = _3289 * 0.886227548122406005859375;
    float _3313 = fma(_3231, _2333, _3291);
    float _3315 = fma(_3251, _2343, _3293);
    float _3317 = fma(_3231, _2161, _3295);
    float _3319 = fma(_3251, _2349, _3297);
    float _3321 = _3301 * 0.511664927005767822265625;
    float _3323 = _3303 * _3303;
    float _3325 = fma(_3231, _2283, _3305);
    float _3327 = fma(_3251, _2303, _3307);
    float _3329 = _3309 * 0.511664927005767822265625;
    float _3331 = precise::max(_3311, 0.00999999977648258209228515625);
    float _3333 = fma(_3251, _2309, _3313);
    float _3335 = _3315 * 0.511664927005767822265625;
    float _3337 = _3319 * 0.511664927005767822265625;
    float _3339 = fma(_3321, _3321, _3323);
    float _3341 = fma(_3251, _2355, _3325);
    float _3343 = _3327 * 0.511664927005767822265625;
    float _3345 = _3329 * _3329;
    float _3347 = 1.0 / _3331;
    float _3349 = fma(_3251, _2291, _3299);
    float _3351 = _3333 * 0.511664927005767822265625;
    float _3353 = fma(_3337, _3337, _3339);
    float _3355 = _3205 * _2359;
    float _3357 = _3341 * 0.511664927005767822265625;
    float _3359 = fma(_3343, _3343, _3345);
    float _3361 = _3335 * _3335;
    float _3363 = _3205 * _2365;
    float _3365 = _3205 * _2371;
    float _3367 = fma(_3211, _2387, _3213);
    float _3369 = _3349 * 0.511664927005767822265625;
    float _3371 = fma(_3351, _3351, _3361);
    float _3373 = _3205 * _2377;
    float _3375 = _3205 * _2033;
    float _3377 = fma(_3357, _3357, _3359);
    float _3379 = fma(_3211, _2409, _3221);
    float _3381 = sqrt(_3353);
    float _3383 = fma(_3231, _2431, _3367);
    float _3385 = fma(_3369, _3369, _3371);
    float _3387 = fma(_3251, _2239, _3317);
    float _3389 = _3205 * _2453;
    float _3391 = _3387 * 0.886227548122406005859375;
    float _3393 = sqrt(_3377);
    float _3395 = fma(_3211, _2475, _3389);
    float _3397 = precise::max(_3391, 0.00999999977648258209228515625);
    float _3399 = sqrt(_3385);
    float _3401 = 1.0 / _3397;
    float _3403 = precise::max(_3393, 0.00999999977648258209228515625);
    float _3405 = precise::max(_3381, 0.00999999977648258209228515625);
    float _3407 = 1.0 / _3405;
    float _3409 = precise::max(_3399, 0.00999999977648258209228515625);
    float _3411 = fma(_3211, _2505, _3363);
    float _3413 = fma(_3211, _2517, _3373);
    float _3415 = 1.0 / _3403;
    float _3417 = fma(_3211, _2095, _3229);
    float _3419 = 1.0 / _3409;
    float _3421 = fma(_3231, _2173, _3417);
    float _3423 = _3303 * _3407;
    float _3425 = fma(_3149, _2983, _3119);
    float _3427 = _3403 * _3347;
    float _3429 = precise::clamp(_3427, 0.0, 1.0);
    float _3431 = _3321 * _3407;
    float _3433 = _3337 * _3407;
    float _3435 = fma(_3251, _2251, _3421);
    float _3437 = _3425 * _3423;
    float _3439 = _3329 * _3415;
    float _3441 = fma(_3071, _2983, _3117);
    float _3443 = _3205 * _2447;
    float _3445 = _3205 * _2459;
    float _3447 = _3205 * _2465;
    float _3449 = fma(_3211, _2543, _3245);
    float _3451 = _3435 * 0.886227548122406005859375;
    float _3453 = _3335 * _3419;
    float _3455 = _3343 * _3415;
    float _3457 = _3425 * _3439;
    float _3459 = fma(_3231, _2631, _3413);
    float _3461 = fma(_3441, _3431, _3437);
    float _3463 = fma(_3153, _2983, _3127);
    float _3465 = fma(_3211, _2381, _3217);
    float _3467 = _3351 * _3419;
    float _3469 = _3425 * _3453;
    float _3471 = fma(_3211, _2537, _3223);
    float _3473 = fma(_3231, _2659, _3449);
    float _3475 = precise::max(_3451, 0.00999999977648258209228515625);
    float _3477 = fma(_3441, _3455, _3457);
    float _3479 = fma(_3251, _2741, _3459);
    float _3481 = fma(_3463, _3433, _3461);
    float _3483 = _3425 * 1.02332699298858642578125;
    float _3485 = fma(_3231, _2425, _3465);
    float _3487 = _3357 * _3415;
    float _3489 = _3369 * _3419;
    float _3491 = fma(_3441, _3467, _3469);
    float _3493 = fma(_3211, _2549, _3243);
    float _3495 = fma(_3231, _2653, _3471);
    float _3497 = fma(_3251, _2757, _3473);
    float _3499 = _3405 * _3401;
    float _3501 = precise::clamp(_3499, 0.0, 1.0);
    float _3503 = fma(_3481, 0.5, 0.5);
    float _3505 = 1.0 / _3475;
    float _3507 = fma(_3211, _2499, _3355);
    float _3509 = fma(_3231, _2619, _3411);
    float _3511 = fma(_3251, _2777, _3485);
    float _3513 = fma(_3463, _3487, _3477);
    float _3515 = fma(_3211, _2555, _3247);
    float _3517 = fma(_3231, _2665, _3493);
    float _3519 = fma(_3251, _2751, _3495);
    float _3521 = _3479 * _3483;
    float _3523 = fma(_3463, _3489, _3491);
    float _3525 = _3497 * _3483;
    float _3527 = fma(_3231, _2691, _3395);
    float _3529 = fma(_3211, _2393, _3227);
    float _3531 = fma(_3231, _2613, _3507);
    float _3533 = fma(_3251, _2729, _3509);
    float _3535 = _3511 * _3483;
    float _3537 = fma(_3513, 0.5, 0.5);
    float _3539 = fma(_3523, 0.5, 0.5);
    float _3541 = fma(_3211, _2511, _3365);
    float _3543 = fma(_3211, _2469, _3443);
    float _3545 = fma(_3231, _2671, _3515);
    float _3547 = fma(_3251, _2763, _3517);
    float _3549 = fma(_3519, 0.88622701168060302734375, _3525);
    float _3551 = _3463 * 1.02332699298858642578125;
    float _3553 = fma(_3251, _2783, _3383);
    float _3555 = fma(_3251, _2837, _3527);
    float _3557 = fma(_3231, _2437, _3529);
    float _3559 = fma(_3251, _2723, _3531);
    float _3561 = fma(_3533, 0.88622701168060302734375, _3535);
    float _3563 = fma(_3211, _2399, _3267);
    float _3565 = fma(_3211, _2403, _3375);
    float _3567 = fma(_3211, _2481, _3445);
    float _3569 = fma(_3231, _2625, _3541);
    float _3571 = fma(_3231, _2685, _3543);
    float _3573 = fma(_3251, _2769, _3545);
    float _3575 = fma(_3547, _3551, _3549);
    float _3577 = _3441 * 1.02332699298858642578125;
    float _3579 = _3553 * _3483;
    float _3581 = _3555 * _3483;
    float _3583 = abs(_3503);
    float _3585 = log2(_3583);
    float _3587 = fma(_3231, _2815, _3379);
    float _3589 = fma(_3251, _2789, _3557);
    float _3591 = fma(_3559, 0.88622701168060302734375, _3521);
    float _3593 = fma(_3231, _2443, _3563);
    float _3595 = fma(_3231, _2809, _3565);
    float _3597 = fma(_3231, _2697, _3567);
    float _3599 = abs(_3537);
    float _3601 = log2(_3599);
    float _3603 = fma(_3251, _2735, _3569);
    float _3605 = fma(_3251, _2831, _3571);
    float _3607 = fma(_3573, _3577, _3575);
    float _3609 = abs(_3539);
    float _3611 = log2(_3609);
    float _3613 = fma(_3251, _2859, _3587);
    float _3615 = fma(_3589, _3551, _3591);
    float _3617 = fma(_3211, _2421, _3233);
    float _3619 = fma(_3251, _2795, _3593);
    float _3621 = fma(_3251, _2853, _3595);
    float _3623 = fma(_3251, _2843, _3597);
    float _3625 = fma(_3603, 0.88622701168060302734375, _3579);
    float _3627 = fma(_3605, 0.88622701168060302734375, _3581);
    float _3629 = _3607 * 0.31830990314483642578125;
    float _3631 = precise::clamp(_3629, 0.0, 1.0);
    float _3633 = fma(_3211, _2415, _3215);
    float _3635 = fma(_3211, _2487, _3447);
    float _3637 = _3409 * _3505;
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3613, _3577, _3615);
    float _3643 = fma(_3231, _2827, _3617);
    float _3645 = fma(_3619, _3551, _3561);
    float _3647 = fma(_3621, _3551, _3625);
    float _3649 = fma(_3623, _3551, _3627);
    float _3651 = _3631 * 0.88622701168060302734375;
    float _3653 = fma(_3231, _2821, _3633);
    float _3655 = fma(_3231, _2703, _3635);
    float _3657 = fma(_3501, 2.0, 1.0);
    float _3659 = fma(_3429, 2.0, 1.0);
    float _3661 = fma(_3639, 2.0, 1.0);
    float _3663 = fma(_3251, _2871, _3643);
    float _3665 = precise::max(0.0, _3641);
    float _3667 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _3669 = fma(_3251, _2865, _3653);
    float _3671 = fma(_3251, _2849, _3655);
    float _3673 = _3657 * _3585;
    float _3675 = _3659 * _3601;
    float _3677 = _3661 * _3611;
    float _3679 = _3501 + 1.0;
    float _3681 = _3429 + 1.0;
    float _3683 = fma(_3663, _3577, _3647);
    float _3685 = fma(_3669, _3577, _3645);
    float _3687 = fma(_3671, _3577, _3649);
    float _3689 = fma(_3665, (*spvDescriptorSet0.vp_c15)._m0[17].x, _3667);
    float _3691 = _3639 + 1.0;
    float _3693 = exp2(_3673);
    float _3695 = precise::max(0.0, _3685);
    out.m_94.x = _859;
    float _3697 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3699 = in.m_96.x;
    float _3701 = exp2(_3675);
    float _3703 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _3705 = exp2(_3677);
    float _3707 = fma(_3695, (*spvDescriptorSet0.vp_c15)._m0[17].y, _3703);
    float _3709 = -_3501;
    float _3711 = _3709 + 1.0;
    float _3713 = 1.0 / _3679;
    float _3715 = -_3429;
    float _3717 = _3715 + 1.0;
    float _3719 = 1.0 / _3681;
    float _3721 = _3687 * 0.31830990314483642578125;
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = 1.0 / _3691;
    float _3727 = fma(_3501, 2.0, 2.0);
    float _3729 = fma(_3429, 2.0, 2.0);
    float _3731 = fma(_3639, 2.0, 2.0);
    float _3733 = -_3639;
    float _3735 = _3733 + 1.0;
    float _3737 = _3727 * _3693;
    float _3739 = _3729 * _3701;
    float _3741 = _3731 * _3705;
    out.m_98.x = _3441;
    out.m_98.y = _3425;
    out.m_98.z = _3463;
    float _3743 = -_3723;
    float _3745 = _3743 + 1.0;
    out.m_100.x = _1297;
    out.m_100.y = _1295;
    out.m_100.z = _1299;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c15)._m0[659].w, _3723);
    out.m_102.x = 0.0;
    float _3749 = _3711 * _3713;
    float _3751 = _3717 * _3719;
    float _3753 = _3735 * _3725;
    float _3755 = -_3737;
    float _3757 = _3755 + 1.0;
    float _3759 = -_3739;
    float _3761 = _3759 + 1.0;
    float _3763 = -_3741;
    float _3765 = _3763 + 1.0;
    bool _3767 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3769 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _3771 = precise::max(0.0, _3683);
    float _3773 = fma(_3749, _3757, _3737);
    float _3775 = fma(_3751, _3761, _3739);
    float _3777 = fma(_3753, _3765, _3741);
    float _3779 = exp2(_3697);
    float _3781 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[17].z, _3769);
    float _3783 = _3391 * _3773;
    float _3785 = _3311 * _3775;
    float _3787 = _3747 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _3789 = _3451 * _3777;
    bool _3791 = _1307 <= 8000.0;
    bool _3793 = isnan(_1307);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = fma(_3783, _3787, _3689);
    float _3805 = fma(_3785, _3787, _3707);
    float _3807 = fma(_3789, _3787, _3781);
    float _3809 = _3801 * _3181;
    float _3811 = _1367 * _1421;
    float _3813 = _3803 * 0.31830990314483642578125;
    float _3815 = _3805 * 0.31830990314483642578125;
    float _3817 = _3807 * 0.31830990314483642578125;
    bool _3819 = !_3767;
    if (!_3819)
    {
        float _3821 = -_1295;
        float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3825 = -_1297;
        float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3829 = -_1299;
        float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3833 = _3823 * _3823;
        float _3835 = fma(_3827, _3827, _3833);
        float _3837 = fma(_3831, _3831, _3835);
        float _3839 = sqrt(_3837);
        float _3841 = rsqrt(_3837);
        float _3843 = -_3839;
        float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3849 = precise::clamp(_3847, 0.0, 1.0);
        float _3851 = _3827 * _3841;
        float _3853 = _3823 * _3841;
        float _3855 = abs(_3849);
        float _3857 = log2(_3855);
        float _3859 = _3831 * _3841;
        float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3863 = _3425 * _3853;
        float _3865 = -_3853;
        float _3867 = -_3861;
        float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
        float _3871 = fma(_3441, _3851, _3863);
        float _3873 = -_3859;
        float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
        float _3877 = fma(_3463, _3859, _3871);
        float _3879 = precise::clamp(_3877, 0.0, 1.0);
        float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3883 = _3875 + _3881;
        float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3889 = precise::clamp(_3887, 0.0, 1.0);
        float _3891 = exp2(_3885);
        float _3893 = _3891 * _3889;
        float _3895 = _3879 * _3893;
        float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3897;
        out.m_102.y = _3899;
        out.m_102.z = _3901;
    }
    float _3903 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3905 = -_3779;
    float _3907 = _3905 + 1.0;
    float _3909 = -_1840;
    float _3911 = _3909 + 1.0;
    float _3913 = _3811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3915 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3917 = _3911 * _3903;
    float _3919 = precise::clamp(_3917, 0.0, 1.0);
    bool _3921 = _1367 > 0.0;
    bool _3923 = isnan(_1367);
    bool _3925 = _3921 || _3923;
    bool _3927 = isnan(0.0);
    bool _3929 = _3925 || _3927;
    float _3931 = _3913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3933 = _3915 * _1846;
    float _3935 = -_3919;
    float _3937 = fma(_3935, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _3939 = _1421 <= 0.0;
    bool _3941 = !_3929;
    bool _3943 = _3939 || _3941;
    float _3945 = -_3915;
    float _3947 = _3945 + 1.0;
    float _3949 = _1857 * _3933;
    float _3951 = _3937 * _3699;
    float _3953 = _1867 * _3933;
    out.m_56.x = _3931;
    float _3955 = fma(_1863, _3949, _1851);
    float _3957 = fma(_1865, _3949, _1853);
    float _3959 = _3951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3961 = _1857 * _3947;
    float _3963 = fma(_1857, _3953, _1855);
    out.m_84.x = _3813;
    out.m_84.y = _3815;
    out.m_84.z = _3817;
    out.m_104.x = _3959;
    out.m_106.x = _3955;
    out.m_106.y = _3957;
    out.m_106.z = _3963;
    out.m_106.w = _3961;
    if (!_3943)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _3965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3965;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _4022 = as_type<float>(_141);
        out.gl_Position.z = _4022;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_58.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_56.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4091 = as_type<float>(_179);
        out.gl_Position.z = _4091;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _311 = _301 * _293;
    float _313 = fma(_305, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _315 = fma(_309, _299, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _317 = _313 * _293;
    float _319 = _315 * _293;
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _311);
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
    bool _369 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _371 = isnan(_367);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _385 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _387 = isnan(_367);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _367 + _401;
    float _405 = -_379;
    float _407 = _405 + 1.0;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _411 = 1.0 / _383;
    float _413 = _395 * _407;
    float _415 = -_395;
    float _417 = _415 + 1.0;
    float _419 = _399 * _411;
    float _421 = fma(_419, _403, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _423 = _421 * _413;
    float _425 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[115].x, _423);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _433 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[116].x, _425);
    float _435 = _427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = _429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _439 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _441 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _435;
    out.m_66.y = _437;
    out.m_66.z = _439;
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
    float _473 = in.m_62.x;
    float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _477 = log2(_475);
    float _479 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _481 = in.m_62.z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _485 = 1.0 + _483;
    float _487 = in.m_62.y;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _499 = _497 != 0;
    float _501 = 1.0 / _485;
    float _503 = in.m_53.x;
    float _505 = in.m_53.y;
    float _507 = in.m_53.z;
    bool _509 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _511 = isnan(1.0);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _517 = _513 || _515;
    bool _519 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _527 = _523 || _525;
    float _529 = in.m_68.x;
    float _531 = in.m_68.y;
    float _533 = in.m_68.z;
    float _535 = _477 * _159;
    float _537 = exp2(_535);
    float _539 = _473 * 2.0;
    float _541 = _481 * 2.0;
    float _543 = _473 + _481;
    float _545 = floor(_539);
    float _547 = _487 * 2.0;
    float _549 = _543 + (-1.0);
    float _551 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _553 = -_537;
    float _555 = _553 + 1.0;
    float _557 = floor(_541);
    float _559 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _561 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
    float _563 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _565 = _527 ? _555 : 0.0;
    float _567 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
    float _569 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
    float _573 = floor(_547);
    float _575 = _487 + _481;
    bool _577 = _545 > 0.0;
    if (_517)
    {
        float _579 = _565 * _501;
        _163 = _579;
    }
    float _581 = _163;
    bool _583 = _545 >= 0.0;
    bool _585 = isnan(_545);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = _575 + (-1.0);
    float _595 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
    float _597 = _569 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _599 = _557 > 0.0;
    float _601 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _603 = _557 >= 0.0;
    bool _605 = isnan(_557);
    bool _607 = _603 || _605;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    float _613 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _615 = _591 ? 0 : 1;
    float _617 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
    int _619 = _611 ? 0 : 1;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _623 = _597 + _621;
    bool _625 = !_495;
    int _627 = _625 ? 0 : 1;
    bool _629 = _573 > 0.0;
    float _631 = _623 * _623;
    bool _633 = _573 >= 0.0;
    bool _635 = isnan(_573);
    bool _637 = _633 || _635;
    bool _639 = isnan(0.0);
    bool _641 = _637 || _639;
    float _643 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _645 = !_491;
    int _647 = _645 ? 0 : 1;
    int _649 = ~_619;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _657 = _643 + _655;
    int _659 = ~_615;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _653;
    int _667 = _663;
    bool _669 = _629;
    if (!_599)
    {
        int _671 = ~_619;
        int _673 = _671 + 1;
        _665 = _673;
    }
    int _675 = _665;
    int _677 = abs(_627);
    if (!_577)
    {
        int _679 = ~_615;
        int _681 = _679 + 1;
        _667 = _681;
    }
    int _683 = _667;
    float _685 = in.m_70.x;
    float _687 = in.m_70.y;
    float _689 = in.m_70.z;
    int _691 = abs(_647);
    float _693 = _617 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _695 = _641 ? 0 : 1;
    float _697 = fma(_657, _657, _631);
    float _699 = float(_677);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _693 + _701;
    float _705 = float(_683);
    int _707 = ~_695;
    int _709 = _707 + 1;
    int _711 = _709 + 1;
    int _713 = _711;
    if (!_629)
    {
        int _715 = ~_695;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    float _721 = fma(_703, _703, _697);
    float _723 = _699 * _705;
    float _725 = float(_675);
    float _727 = sqrt(_721);
    float _729 = float(_691);
    float _731 = _723 * (-2.0);
    bool _733 = !_499;
    int _735 = _733 ? 0 : 1;
    float _737 = _487 + (-0.5);
    float _739 = float(_719);
    float _741 = _729 * _725;
    int _743 = abs(_735);
    float _745 = fma(_731, _687, _687);
    float _747 = fma(_601, _731, _601);
    float _749 = rsqrt(_721);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _753 = _473 + _487;
    float _755 = _479 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _757 = float(_743);
    float _759 = _727 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _761 = _753 + (-1.0);
    float _763 = fma(_747, _581, _751);
    float _765 = _741 * (-2.0);
    float _767 = _757 * _739;
    float _769 = precise::min(_755, _759);
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _773 = _473 + (-0.5);
    float _775 = fma(_765, _685, _685);
    float _777 = _767 * (-2.0);
    float _779 = _749 * _769;
    float _781 = fma(_771, _765, _771);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[196].x, _775);
    float _785 = fma(_777, _689, _689);
    float _787 = _481 + (-0.5);
    float _789 = _623 * _779;
    float _791 = fma(_613, _777, _613);
    float _793 = _657 * _779;
    float _795 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[196].z, _785);
    float _797 = -_789;
    float _799 = _623 + _797;
    float _801 = fma(_781, _581, _783);
    float _803 = -_793;
    float _805 = _657 + _803;
    float _807 = fma(_791, _581, _795);
    float _809 = _799 * _799;
    float _811 = _703 * _779;
    float _813 = _763 * 0.15915493667125701904296875;
    float _815 = _801 * 0.15915493667125701904296875;
    float _817 = fma(_805, _805, _809);
    float _819 = -_811;
    float _821 = _703 + _819;
    float _823 = _807 * 0.15915493667125701904296875;
    float _825 = _813 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = fma(_821, _821, _817);
    float _831 = -_789;
    float _833 = _597 + _831;
    float _835 = -_793;
    float _837 = _643 + _835;
    float _839 = -_811;
    float _841 = _693 + _839;
    float _843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _531);
    float _845 = sqrt(_829);
    float _847 = _813 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _815 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = _749 * _845;
    float _857 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _859 = _479 * _855;
    float _861 = _815 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _823 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _871 = _853 * _849;
    float _873 = _853 * _827;
    float _875 = _823 * 6.283185482025146484375;
    float _877 = sin(_875);
    float _879 = _863 * _849;
    float _881 = _863 * _827;
    float _883 = _853 * _867;
    float _885 = _857 * _855;
    float _887 = _849 * _867;
    float _889 = _863 * _867;
    float _891 = _827 * _867;
    float _893 = _869 * _855;
    float _895 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _529);
    float _897 = _885 * _843;
    float _899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _533);
    float _901 = fma(_877, _871, _881);
    float _903 = _859 * _895;
    float _905 = _883 * _897;
    float _907 = _893 * _899;
    float _909 = -_879;
    float _911 = fma(_877, _873, _909);
    float _913 = -_897;
    float _915 = _877 * _913;
    float _917 = fma(_901, _903, _905);
    float _919 = -_873;
    float _921 = fma(_877, _879, _919);
    float _923 = _889 * _897;
    float _925 = fma(_887, _903, _915);
    float _927 = fma(_911, _907, _917);
    float _929 = fma(_877, _881, _871);
    float _931 = fma(_921, _903, _923);
    float _933 = fma(_891, _907, _925);
    float _935 = _927 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _937 = fma(_929, _907, _931);
    float _939 = _927 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _935);
    float _943 = _927 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[24].x, _939);
    float _947 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _941);
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _945);
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _949);
    float _957 = _951 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _959 = _693 + _953;
    float _961 = _955 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _963 = _643 + _957;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _967 = _959 + _965;
    float _969 = _833 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _971 = _597 + _961;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[11].x, _969);
    float _981 = fma(_975, _975, _977);
    float _983 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[11].z, _979);
    float _985 = sqrt(_981);
    bool _987 = _985 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _989 = _979;
    float _991 = _977;
    float _993 = _961;
    if (!_987)
    {
        _989 = _963;
    }
    float _995 = _989;
    float _997 = _995;
    if (!_987)
    {
        _991 = _959;
    }
    float _999 = _991;
    float _1001 = _999;
    if (!_987)
    {
        _993 = _971;
    }
    float _1003 = _993;
    bool _1005 = !_987;
    float _1007 = _1003;
    if (!_1005)
    {
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1013 = _985 + _1011;
        float _1015 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = _1013 * _1009;
        float _1019 = rsqrt(_981);
        float _1021 = _1017 * 0.15915493667125701904296875;
        float _1023 = _1021 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1021 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        float _1031 = fma(_1025, _1015, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1033 = _1019 * _1031;
        float _1035 = _1029 + (-1.0);
        float _1037 = fma(_975, _1033, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1039 = fma(_967, _1033, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1041 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1043 = fma(_971, _1029, _1041);
        _1007 = _1043;
        _997 = _1037;
        _1001 = _1039;
    }
    float _1045 = _1007;
    float _1047 = _997;
    float _1049 = _1001;
    float _1051 = -_597;
    float _1053 = _1051 + _1045;
    float _1055 = -_643;
    float _1057 = _1055 + _1047;
    float _1059 = _983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1061 = _1053 * _1053;
    float _1063 = _833 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1065 = -_693;
    float _1067 = _1065 + _1049;
    float _1069 = 1.0 / _1059;
    float _1071 = fma(_1057, _1057, _1061);
    float _1073 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1063);
    float _1075 = fma(_837, 0.008000000379979610443115234375, 64.0);
    float _1077 = -_793;
    float _1079 = _1077 + _1047;
    float _1081 = fma(_1067, _1067, _1071);
    float _1083 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1085 = -_789;
    float _1087 = _1085 + _1045;
    float _1089 = precise::max(0.0, _1075);
    float _1091 = sqrt(_1081);
    float _1093 = fma(_841, 0.008000000379979610443115234375, 64.0);
    float _1095 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1097 = precise::min(_1089, 127.0);
    float _1099 = -_811;
    float _1101 = _1099 + _1049;
    float _1103 = precise::max(0.0, _1093);
    float _1105 = _1095 + _1059;
    float _1107 = trunc(_1097);
    int _1109 = int(_1107);
    float _1111 = precise::min(_1103, 127.0);
    float _1113 = _1105 * _1069;
    float _1115 = _1113 * 0.5;
    bool _1117 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1125 = _1121 || _1123;
    bool _1127 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1129 = isnan(0.5);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1135 = _1131 || _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1139 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1137);
    bool _1141 = _1091 > 0.0;
    float _1143 = trunc(_1111);
    int _1145 = int(_1143);
    float _1147 = 1.0 / _1139;
    float _1149 = _1047;
    float _1151 = _1049;
    float _1153 = _1045;
    if (!_1141)
    {
        _1149 = _1079;
    }
    float _1155 = _1149;
    float _1157 = _1155;
    float _1159 = _1155;
    if (!_1141)
    {
        _1151 = _1087;
    }
    float _1161 = _1151;
    int _1163 = _1145 << 7;
    int _1165 = _1163 + _1109;
    float _1167 = _1161;
    if (!_1141)
    {
        _1153 = _1101;
    }
    float _1169 = _1153;
    bool _1171 = !_1141;
    float _1173 = _1169;
    if (!_1171)
    {
        float _1175 = _203 * _203;
        float _1177 = rsqrt(_1081);
        float _1179 = fma(_201, _201, _1175);
        float _1181 = fma(_205, _205, _1179);
        float _1183 = sqrt(_1181);
        float _1185 = _1057 * _1177;
        float _1187 = _1053 * _1177;
        float _1189 = _1067 * _1177;
        bool _1191 = _1183 > 0.0;
        float _1193 = _1177;
        float _1195 = _1183;
        if (!_1191)
        {
            _1157 = _1079;
        }
        float _1197 = _1157;
        _1159 = _1197;
        if (!_1191)
        {
            _1193 = _1087;
        }
        float _1199 = _1193;
        _1167 = _1199;
        if (!_1191)
        {
            _1195 = _1101;
        }
        float _1201 = _1195;
        bool _1203 = !_1191;
        _1173 = _1201;
        if (!_1203)
        {
            float _1205 = rsqrt(_1181);
            float _1207 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1209 = _203 * _1205;
            float _1211 = _201 * _1205;
            float _1213 = _205 * _1205;
            float _1215 = _1187 * _1209;
            float _1217 = fma(_1185, _1211, _1215);
            float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1221 = fma(_1189, _1213, _1217);
            float _1223 = _1221 * _1219;
            float _1225 = fma(_201, _1223, _1079);
            float _1227 = fma(_203, _1223, _1087);
            float _1229 = fma(_205, _1223, _1101);
            _1159 = _1225;
            _1167 = _1227;
            _1173 = _1229;
        }
    }
    float _1231 = _1159;
    float _1233 = _1167;
    float _1235 = _1173;
    int _1237 = _1165 << 4;
    if (_1125)
    {
        _209 = _1231;
    }
    float _1239 = _209;
    float _1241 = _1239;
    if (_1125)
    {
        _211 = _1233;
    }
    float _1243 = _211;
    float _1245 = _1243;
    if (_1125)
    {
        _213 = _1235;
    }
    float _1247 = _213;
    float _1249 = _1247;
    if (!_1125)
    {
        float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1253 = _833 + _1251;
        float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1257 = _837 + _1255;
        float _1259 = -_837;
        float _1261 = _1259 + _1231;
        float _1263 = -_833;
        float _1265 = _1263 + _1233;
        float _1267 = _1253 * _1253;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1271 = _841 + _1269;
        float _1273 = -_841;
        float _1275 = _1273 + _1235;
        float _1277 = fma(_1257, _1257, _1267);
        float _1279 = fma(_1271, _1271, _1277);
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1283 = sqrt(_1279);
        float _1285 = precise::min(_1283, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1287 = _1285 * _1281;
        float _1289 = fma(_1261, _1287, _837);
        float _1291 = fma(_1265, _1287, _833);
        float _1293 = fma(_1275, _1287, _841);
        _1245 = _1291;
        _1241 = _1289;
        _1249 = _1293;
    }
    float _1295 = _1245;
    float _1297 = _1241;
    float _1299 = _1249;
    float _1301 = 0.0;
    if (_1135)
    {
        _1301 = 1.0;
    }
    float _1303 = _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1307 = _1147 * _1305;
    float _1309 = 0.0;
    float _1311 = _1303;
    if (_1135)
    {
        _1309 = 1.0;
    }
    float _1313 = _1309;
    int _1315 = _1237 + 8;
    float _1317 = _1313;
    if (!_1135)
    {
        float _1319 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1321 = _1319 * 0.15915493667125701904296875;
        float _1323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1325 = _1321 * 6.283185482025146484375;
        float _1327 = cos(_1325);
        float _1329 = _1323 * 0.15915493667125701904296875;
        float _1331 = _1321 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = 1.0 / _1327;
        float _1337 = _1329 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1333 * _1335;
        float _1343 = _1329 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1349 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1347;
        float _1351 = _1339 * _1341;
        float _1353 = 1.0 / _1349;
        float _1355 = 1.0 / _1351;
        float _1357 = _1345 * _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1361 = fma(_1307, _1357, _1359);
        float _1363 = _1361 * _1353;
        float _1365 = precise::clamp(_1363, 0.0, 1.0);
        _1311 = _1365;
    }
    float _1367 = _1311;
    if (!_1135)
    {
        float _1369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1371 = _1369 * 0.15915493667125701904296875;
        float _1373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1375 = _1371 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        float _1379 = _1373 * 0.15915493667125701904296875;
        float _1381 = _1371 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = 1.0 / _1377;
        float _1387 = _1379 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = _1379 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = _1389 * _1391;
        float _1399 = 1.0 / _1397;
        float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1403 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1401;
        float _1405 = 1.0 / _1403;
        float _1407 = _1395 * _1399;
        float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1411 = fma(_1307, _1407, _1409);
        float _1413 = _1411 * _1405;
        float _1415 = precise::clamp(_1413, 0.0, 1.0);
        float _1417 = -_1415;
        float _1419 = _1417 + 1.0;
        _1317 = _1419;
    }
    float _1421 = _1317;
    uint _1424 = uint(int(uint(_1315) >> uint(2)));
    float _1426 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1424)]);
    float _1428 = floor(_1097);
    int _1430 = _1237 + 12;
    uint _1432 = uint(int(uint(_1237) >> uint(2)));
    float _1434 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1432)]);
    uint _1436 = uint(int(uint(_1430) >> uint(2)));
    float _1438 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1436)]);
    float _1440 = -_1428;
    float _1442 = _1097 + _1440;
    float _1444 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1446 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1444);
    float _1448 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1446);
    float _1450 = _1426 + _1442;
    float _1452 = trunc(_1450);
    int _1454 = int(_1452);
    int _1456 = _1109 + _1454;
    int _1458 = _1145 << 7;
    int _1460 = _1458 + _1456;
    int _1462 = _1460 << 4;
    float _1464 = floor(_1111);
    int _1466 = _1462 + 12;
    uint _1468 = uint(int(uint(_1462) >> uint(2)));
    float _1470 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1468)]);
    uint _1472 = uint(int(uint(_1466) >> uint(2)));
    float _1474 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1472)]);
    float _1476 = -_1464;
    float _1478 = _1111 + _1476;
    float _1480 = _1426 + _1478;
    float _1482 = trunc(_1480);
    int _1484 = int(_1482);
    int _1486 = _1145 + _1484;
    int _1488 = _1486 << 7;
    int _1490 = _1488 + _1109;
    int _1492 = _1486 << 7;
    int _1494 = _1492 + _1456;
    int _1496 = _1490 << 4;
    int _1498 = _1494 << 4;
    int _1500 = _1496 + 12;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1295 + _1502;
    int _1506 = _1498 + 12;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1297 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1299 + _1512;
    uint _1516 = uint(int(uint(_1500) >> uint(2)));
    float _1518 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1516)]);
    uint _1520 = uint(int(uint(_1506) >> uint(2)));
    float _1522 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1520)]);
    float _1524 = _1504 * _1504;
    uint _1526 = uint(int(uint(_1496) >> uint(2)));
    float _1528 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1526)]);
    float _1530 = fma(_1510, _1510, _1524);
    uint _1532 = uint(int(uint(_1498) >> uint(2)));
    float _1534 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_1532)]);
    float _1536 = fma(_1514, _1514, _1530);
    float _1538 = rsqrt(_1536);
    float _1540 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1542 = _1510 * _1540;
    float _1544 = _1514 * _1540;
    float _1546 = _1542 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 + _1548;
    float _1552 = sqrt(_1550);
    bool _1554 = _1552 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1552 + _1556;
    float _1560 = _1514;
    float _1562 = _1558;
    float _1564 = as_type<float>(_1500);
    float _1566 = _1540;
    float _1568 = as_type<float>(_1496);
    if (_1554)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1560 = _1570;
    }
    float _1572 = _1560;
    if (_1554)
    {
        float _1574 = _1558 * _1572;
        _1562 = _1574;
    }
    float _1576 = _1562;
    if (_1554)
    {
        float _1578 = _1576 * 0.15915493667125701904296875;
        _1564 = _1578;
    }
    float _1580 = _1564;
    float _1582 = _1538;
    if (_1554)
    {
        float _1584 = _1580 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1582 = _1586;
    }
    float _1588 = _1582;
    float _1590 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1592 = _1572;
    if (_1554)
    {
        float _1594 = _1580 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = precise::max(0.0, _1590);
    float _1602 = _1550;
    float _1604 = _1600;
    if (_1554)
    {
        float _1606 = rsqrt(_1550);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = -_1540;
    float _1612 = -_1600;
    float _1614 = fma(_1504, _1610, _1612);
    float _1616 = _1614;
    if (_1554)
    {
        float _1618 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1588;
    float _1624 = _1620;
    if (_1554)
    {
        float _1626 = _1588 + (-1.0);
        _1566 = _1626;
    }
    float _1628 = _1566;
    float _1630 = sqrt(_1536);
    float _1632 = _1598;
    float _1634 = _1628;
    if (_1554)
    {
        float _1636 = fma(_1598, _1620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (_1554)
    {
        float _1642 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1642;
    }
    float _1644 = _1634;
    if (_1554)
    {
        float _1646 = _1608 * _1638;
        _1568 = _1646;
    }
    float _1648 = _1568;
    if (!_1554)
    {
        _1640 = _1542;
    }
    float _1650 = _1640;
    float _1652 = _1650;
    if (_1554)
    {
        float _1654 = fma(_1614, _1588, _1644);
        _1616 = _1654;
    }
    float _1656 = _1616;
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1554)
    {
        float _1660 = _1542 * _1648;
        _1652 = _1660;
    }
    float _1662 = _1652;
    if (!_1554)
    {
        _1622 = _1546;
    }
    float _1664 = _1622;
    float _1666 = _1664;
    if (!_1554)
    {
        _1624 = _1544;
    }
    float _1668 = _1624;
    float _1670 = _1668;
    if (_1554)
    {
        float _1672 = _1544 * _1648;
        _1670 = _1672;
    }
    float _1674 = _1670;
    if (_1554)
    {
        float _1676 = _1662 * _1662;
        _1666 = _1676;
    }
    float _1678 = _1666;
    float _1680 = fma(_837, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1554)
    {
        _1658 = _1548;
    }
    float _1682 = _1658;
    float _1684 = _1682;
    if (_1554)
    {
        float _1686 = _1674 * _1674;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1656, _1656, _1678);
    float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1694 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1692);
    float _1696 = precise::clamp(_1694, 0.0, 1.0);
    float _1698 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1700 = _1690 + _1688;
    float _1702 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1704 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1698);
    float _1706 = fma(_841, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1708 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1710 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1702);
    float _1712 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1704);
    float _1714 = rsqrt(_1700);
    float _1716 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1708);
    float _1718 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1710);
    float _1720 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1722 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1724 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = -_1696;
    float _1730 = _1728 + 1.0;
    float _1732 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = abs(_1730);
    float _1738 = log2(_1736);
    float _1740 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1744 = _1714 * _1662;
    float _1746 = _1714 * _1656;
    float _1748 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1750 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1756 = _1714 * _1674;
    float _1758 = -_1750;
    float _1760 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = -_1752;
    float _1764 = fma(_1762, _1754, 1.0);
    float _1766 = -_1756;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1770 = floor(_1680);
    float _1772 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1774 = fma(_1768, -0.5, 0.5);
    float _1776 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1778 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1780 = exp2(_1772);
    float _1782 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1776);
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1778);
    float _1786 = log2(_1764);
    float _1788 = fma(_1768, 0.5, 0.5);
    float _1790 = 1.0 / _1748;
    float _1792 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1782);
    float _1794 = floor(_1706);
    float _1796 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1784);
    float _1798 = sqrt(_1774);
    float _1800 = -_1770;
    float _1802 = _1680 + _1800;
    float _1804 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = _1746 + 1.0;
    float _1808 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1792);
    float _1810 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1812 = fma(_1788, _1804, -0.212114393711090087890625);
    float _1814 = -_1746;
    float _1816 = fma(_1780, _1806, _1814);
    float _1818 = _1786 * 0.693147182464599609375;
    float _1820 = _1808 * _1790;
    float _1822 = _1810 * _1790;
    float _1824 = -_1794;
    float _1826 = _1706 + _1824;
    float _1828 = fma(_1788, _1812, 1.570728778839111328125);
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1832 = fma(_1820, 0.5, 0.5);
    float _1834 = _1798 * 0.636619746685028076171875;
    float _1836 = fma(_1822, -0.5, 0.5);
    float _1838 = fma(_1816, 0.5, 0.5);
    float2 _6654 = float2(_1802, _1826);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6654, float2(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6654, float2(0.0), isnan(_6654)), level(0.0)).x;
    float _1842 = -_1828;
    float _1844 = fma(_1834, _1842, 1.0);
    float3 _6670 = float3(_1832, _1836, _1830);
    float _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6670, float3(0.0), isnan(_6670)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6670, float3(0.0), isnan(_6670)), level(0.0)).x;
    float3 _6681 = float3(_1832, _1836, _1830);
    float4 _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6681, float3(0.0), isnan(_6681)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6681, float3(0.0), isnan(_6681)), level(0.0)).xyzw;
    float _1851 = _1849.x;
    float _1853 = _1849.y;
    float _1855 = _1849.z;
    float _1857 = _1849.w;
    float2 _6697 = float2(_1844, _1838);
    float3 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6697, float2(0.0), isnan(_6697)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6697, float2(0.0), isnan(_6697)), level(0.0)).xyz;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = floor(_1450);
    float _1871 = _1478 * _1474;
    float _1873 = in.m_72.y;
    float _1875 = in.m_62.w;
    float _1877 = in.m_72.x;
    float _1879 = in.m_74.x;
    float _1881 = in.m_74.y;
    float _1883 = in.m_74.z;
    float _1885 = -_1869;
    float _1887 = _1450 + _1885;
    float _1889 = in.m_76.x;
    float _1891 = in.m_76.y;
    float _1893 = in.m_76.z;
    float _1895 = in.m_76.w;
    float _1897 = _1887 * _1474;
    float _1899 = floor(_1871);
    float _1901 = floor(_1897);
    float _1903 = fma(_1474, _1899, _1901);
    float _1905 = floor(_1480);
    float _1907 = _1478 * _1438;
    float _1909 = _1442 * _1438;
    float _1911 = _1442 * _1518;
    float _1913 = _1887 * _1522;
    float _1915 = floor(_1907);
    float _1917 = -_1905;
    float _1919 = _1480 + _1917;
    float _1921 = floor(_1909);
    float _1923 = _1919 * _1518;
    float _1925 = _1919 * _1522;
    float _1927 = floor(_1923);
    float _1929 = floor(_1911);
    float _1931 = trunc(_1903);
    int _1933 = int(_1931);
    float _1935 = floor(_1913);
    float _1937 = floor(_1925);
    float _1939 = fma(_1438, _1915, _1921);
    float _1941 = fma(_1518, _1927, _1929);
    int _1943 = as_type<int>(_1470) + _1933;
    float _1945 = trunc(_1939);
    int _1947 = int(_1945);
    float _1949 = fma(_1522, _1937, _1935);
    float _1951 = trunc(_1941);
    int _1953 = int(_1951);
    float _1955 = trunc(_1949);
    int _1957 = int(_1955);
    int _1959 = _1943 * 656;
    int _1961 = as_type<int>(_1434) + _1947;
    int _1963 = _1959 + 262160;
    int _1965 = _1961 * 656;
    int _1967 = as_type<int>(_1528) + _1953;
    int _1969 = _1959 + 262240;
    int _1971 = _1959 + 262176;
    int _1973 = _1959 + 262192;
    int _1975 = _1967 * 656;
    int _1977 = as_type<int>(_1534) + _1957;
    uint _1979 = uint(int(uint(_1963) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_1979)];
    float _1981 = as_type<float>(_dmw1.x);
    int _1983 = _1963 + 4;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    float _1987 = as_type<float>(_dmw1.y);
    int _1989 = _1963 + 8;
    uint _1991 = uint(int(uint(_1989) >> uint(2)));
    float _1993 = as_type<float>(_dmw1.z);
    int _1995 = _1963 + 12;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    float _1999 = as_type<float>(_dmw1.w);
    int _2001 = _1959 + 262224;
    int _2003 = _1965 + 262192;
    uint _2005 = uint(int(uint(_1969) >> uint(2)));
    packed_uint4 _dmw6 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2005)];
    float _2007 = as_type<float>(_dmw6.x);
    int _2009 = _1969 + 4;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    float _2013 = as_type<float>(_dmw6.y);
    int _2015 = _1969 + 8;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    float _2019 = as_type<float>(_dmw6.z);
    int _2021 = _1969 + 12;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    float _2025 = as_type<float>(_dmw6.w);
    int _2027 = _1959 + 262208;
    int _2029 = _1977 * 656;
    uint _2031 = uint(int(uint(_1971) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2031)];
    float _2033 = as_type<float>(_dmw2.x);
    int _2035 = _1971 + 4;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    float _2039 = as_type<float>(_dmw2.y);
    int _2041 = _1971 + 8;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    float _2045 = as_type<float>(_dmw2.z);
    int _2047 = _1971 + 12;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    float _2051 = as_type<float>(_dmw2.w);
    int _2053 = _1965 + 262224;
    uint _2055 = uint(int(uint(_1973) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2055)];
    float _2057 = as_type<float>(_dmw3.x);
    int _2059 = _1973 + 4;
    uint _2061 = uint(int(uint(_2059) >> uint(2)));
    float _2063 = as_type<float>(_dmw3.y);
    int _2065 = _1973 + 8;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    float _2069 = as_type<float>(_dmw3.z);
    int _2071 = _1973 + 12;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    float _2075 = as_type<float>(_dmw3.w);
    int _2077 = _1975 + 262192;
    int _2079 = _1959 + 262144;
    uint _2081 = uint(int(uint(_2003) >> uint(2)));
    packed_uint4 _dmw11 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2081)];
    float _2083 = as_type<float>(_dmw11.x);
    int _2085 = _2003 + 4;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    float _2089 = as_type<float>(_dmw11.y);
    int _2091 = _2003 + 8;
    uint _2093 = uint(int(uint(_2091) >> uint(2)));
    float _2095 = as_type<float>(_dmw11.z);
    int _2097 = _2003 + 12;
    uint _2099 = uint(int(uint(_2097) >> uint(2)));
    float _2101 = as_type<float>(_dmw11.w);
    int _2103 = _1959 + 262256;
    int _2105 = _1965 + 262208;
    uint _2107 = uint(int(uint(_2001) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2107)];
    float _2109 = as_type<float>(_dmw5.x);
    int _2111 = _2001 + 4;
    uint _2113 = uint(int(uint(_2111) >> uint(2)));
    float _2115 = as_type<float>(_dmw5.y);
    int _2117 = _2001 + 8;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    float _2121 = as_type<float>(_dmw5.z);
    int _2123 = _2001 + 12;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    float _2127 = as_type<float>(_dmw5.w);
    int _2129 = _1975 + 262224;
    int _2131 = _2029 + 262192;
    uint _2133 = uint(int(uint(_2027) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2133)];
    float _2135 = as_type<float>(_dmw4.x);
    int _2137 = _2027 + 4;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    float _2141 = as_type<float>(_dmw4.y);
    int _2143 = _2027 + 8;
    uint _2145 = uint(int(uint(_2143) >> uint(2)));
    float _2147 = as_type<float>(_dmw4.z);
    int _2149 = _2027 + 12;
    uint _2151 = uint(int(uint(_2149) >> uint(2)));
    float _2153 = as_type<float>(_dmw4.w);
    int _2155 = _1965 + 262144;
    int _2157 = _1965 + 262160;
    uint _2159 = uint(int(uint(_2077) >> uint(2)));
    packed_uint4 _dmw17 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2159)];
    float _2161 = as_type<float>(_dmw17.x);
    int _2163 = _2077 + 4;
    uint _2165 = uint(int(uint(_2163) >> uint(2)));
    float _2167 = as_type<float>(_dmw17.y);
    int _2169 = _2077 + 8;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    float _2173 = as_type<float>(_dmw17.z);
    int _2175 = _2077 + 12;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    float _2179 = as_type<float>(_dmw17.w);
    int _2181 = _1965 + 262176;
    int _2183 = _1965 + 262240;
    uint _2185 = uint(int(uint(_2105) >> uint(2)));
    packed_uint4 _dmw12 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2185)];
    float _2187 = as_type<float>(_dmw12.x);
    int _2189 = _2105 + 4;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    float _2193 = as_type<float>(_dmw12.y);
    int _2195 = _2105 + 8;
    uint _2197 = uint(int(uint(_2195) >> uint(2)));
    float _2199 = as_type<float>(_dmw12.z);
    int _2201 = _2105 + 12;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    float _2205 = as_type<float>(_dmw12.w);
    int _2207 = _1965 + 262256;
    int _2209 = _1975 + 262208;
    uint _2211 = uint(int(uint(_2053) >> uint(2)));
    packed_uint4 _dmw13 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2211)];
    float _2213 = as_type<float>(_dmw13.x);
    int _2215 = _2053 + 4;
    uint _2217 = uint(int(uint(_2215) >> uint(2)));
    float _2219 = as_type<float>(_dmw13.y);
    int _2221 = _2053 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    float _2225 = as_type<float>(_dmw13.z);
    int _2227 = _2053 + 12;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    float _2231 = as_type<float>(_dmw13.w);
    int _2233 = _2029 + 262224;
    int _2235 = _1975 + 262144;
    uint _2237 = uint(int(uint(_2131) >> uint(2)));
    packed_uint4 _dmw20 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2237)];
    float _2239 = as_type<float>(_dmw20.x);
    int _2241 = _2131 + 4;
    uint _2243 = uint(int(uint(_2241) >> uint(2)));
    float _2245 = as_type<float>(_dmw20.y);
    int _2247 = _2131 + 8;
    uint _2249 = uint(int(uint(_2247) >> uint(2)));
    float _2251 = as_type<float>(_dmw20.z);
    int _2253 = _2131 + 12;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    float _2257 = as_type<float>(_dmw20.w);
    int _2259 = _1975 + 262160;
    int _2261 = _1975 + 262176;
    uint _2263 = uint(int(uint(_2209) >> uint(2)));
    packed_uint4 _dmw18 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2263)];
    float _2265 = as_type<float>(_dmw18.x);
    int _2267 = _2209 + 4;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    float _2271 = as_type<float>(_dmw18.y);
    int _2273 = _2209 + 8;
    uint _2275 = uint(int(uint(_2273) >> uint(2)));
    float _2277 = as_type<float>(_dmw18.z);
    int _2279 = _2209 + 12;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    float _2283 = as_type<float>(_dmw18.w);
    int _2285 = _1975 + 262240;
    int _2287 = _1975 + 262256;
    uint _2289 = uint(int(uint(_2233) >> uint(2)));
    packed_uint4 _dmw22 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2289)];
    float _2291 = as_type<float>(_dmw22.x);
    int _2293 = _2233 + 4;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    float _2297 = as_type<float>(_dmw22.y);
    int _2299 = _2233 + 8;
    uint _2301 = uint(int(uint(_2299) >> uint(2)));
    float _2303 = as_type<float>(_dmw22.z);
    int _2305 = _2233 + 12;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    float _2309 = as_type<float>(_dmw22.w);
    int _2311 = _2029 + 262208;
    uint _2313 = uint(int(uint(_2129) >> uint(2)));
    packed_uint4 _dmw19 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2313)];
    float _2315 = as_type<float>(_dmw19.x);
    int _2317 = _2129 + 4;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    float _2321 = as_type<float>(_dmw19.y);
    int _2323 = _2129 + 8;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    float _2327 = as_type<float>(_dmw19.z);
    int _2329 = _2129 + 12;
    uint _2331 = uint(int(uint(_2329) >> uint(2)));
    float _2333 = as_type<float>(_dmw19.w);
    uint _2335 = uint(int(uint(_2311) >> uint(2)));
    packed_uint4 _dmw21 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2335)];
    float _2337 = as_type<float>(_dmw21.x);
    int _2339 = _2311 + 4;
    uint _2341 = uint(int(uint(_2339) >> uint(2)));
    float _2343 = as_type<float>(_dmw21.y);
    int _2345 = _2311 + 8;
    uint _2347 = uint(int(uint(_2345) >> uint(2)));
    float _2349 = as_type<float>(_dmw21.z);
    int _2351 = _2311 + 12;
    uint _2353 = uint(int(uint(_2351) >> uint(2)));
    float _2355 = as_type<float>(_dmw21.w);
    uint _2357 = uint(int(uint(_2079) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2357)];
    float _2359 = as_type<float>(_dmw0.x);
    int _2361 = _2079 + 4;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    float _2365 = as_type<float>(_dmw0.y);
    int _2367 = _2079 + 8;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    float _2371 = as_type<float>(_dmw0.z);
    int _2373 = _2079 + 12;
    uint _2375 = uint(int(uint(_2373) >> uint(2)));
    float _2377 = as_type<float>(_dmw0.w);
    uint _2379 = uint(int(uint(_2157) >> uint(2)));
    packed_uint4 _dmw9 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2379)];
    float _2381 = as_type<float>(_dmw9.x);
    int _2383 = _2157 + 4;
    uint _2385 = uint(int(uint(_2383) >> uint(2)));
    float _2387 = as_type<float>(_dmw9.y);
    int _2389 = _2157 + 8;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    float _2393 = as_type<float>(_dmw9.z);
    int _2395 = _2157 + 12;
    uint _2397 = uint(int(uint(_2395) >> uint(2)));
    float _2399 = as_type<float>(_dmw9.w);
    uint _2401 = uint(int(uint(_2181) >> uint(2)));
    packed_uint4 _dmw10 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2401)];
    float _2403 = as_type<float>(_dmw10.x);
    int _2405 = _2181 + 4;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    float _2409 = as_type<float>(_dmw10.y);
    int _2411 = _2181 + 8;
    uint _2413 = uint(int(uint(_2411) >> uint(2)));
    float _2415 = as_type<float>(_dmw10.z);
    int _2417 = _2181 + 12;
    uint _2419 = uint(int(uint(_2417) >> uint(2)));
    float _2421 = as_type<float>(_dmw10.w);
    uint _2423 = uint(int(uint(_2259) >> uint(2)));
    packed_uint4 _dmw16 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2423)];
    float _2425 = as_type<float>(_dmw16.x);
    int _2427 = _2259 + 4;
    uint _2429 = uint(int(uint(_2427) >> uint(2)));
    float _2431 = as_type<float>(_dmw16.y);
    int _2433 = _2259 + 8;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    float _2437 = as_type<float>(_dmw16.z);
    int _2439 = _2259 + 12;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    float _2443 = as_type<float>(_dmw16.w);
    uint _2445 = uint(int(uint(_2103) >> uint(2)));
    packed_uint4 _dmw7 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2445)];
    float _2447 = as_type<float>(_dmw7.x);
    int _2449 = _2103 + 4;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    float _2453 = as_type<float>(_dmw7.y);
    int _2455 = _2103 + 8;
    uint _2457 = uint(int(uint(_2455) >> uint(2)));
    float _2459 = as_type<float>(_dmw7.z);
    int _2461 = _2103 + 12;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    float _2465 = as_type<float>(_dmw7.w);
    uint _2467 = uint(int(uint(_2207) >> uint(2)));
    packed_uint4 _dmw15 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2467)];
    float _2469 = as_type<float>(_dmw15.x);
    int _2471 = _2207 + 4;
    uint _2473 = uint(int(uint(_2471) >> uint(2)));
    float _2475 = as_type<float>(_dmw15.y);
    int _2477 = _2207 + 8;
    uint _2479 = uint(int(uint(_2477) >> uint(2)));
    float _2481 = as_type<float>(_dmw15.z);
    int _2483 = _2207 + 12;
    uint _2485 = uint(int(uint(_2483) >> uint(2)));
    float _2487 = as_type<float>(_dmw15.w);
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    uint _2497 = uint(int(uint(_2155) >> uint(2)));
    packed_uint4 _dmw8 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2497)];
    float _2499 = as_type<float>(_dmw8.x);
    int _2501 = _2155 + 4;
    uint _2503 = uint(int(uint(_2501) >> uint(2)));
    float _2505 = as_type<float>(_dmw8.y);
    int _2507 = _2155 + 8;
    uint _2509 = uint(int(uint(_2507) >> uint(2)));
    float _2511 = as_type<float>(_dmw8.z);
    int _2513 = _2155 + 12;
    uint _2515 = uint(int(uint(_2513) >> uint(2)));
    float _2517 = as_type<float>(_dmw8.w);
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2521 = _2519 != 0;
    float _2523 = 1.0 / _2491;
    int _2525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2527 = _2525 != 0;
    float _2529 = -_1873;
    float _2531 = _2529 + 1.0;
    bool _2533 = _1875 > 0.5;
    uint _2535 = uint(int(uint(_2183) >> uint(2)));
    packed_uint4 _dmw14 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2535)];
    float _2537 = as_type<float>(_dmw14.x);
    int _2539 = _2183 + 4;
    uint _2541 = uint(int(uint(_2539) >> uint(2)));
    float _2543 = as_type<float>(_dmw14.y);
    int _2545 = _2183 + 8;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    float _2549 = as_type<float>(_dmw14.z);
    int _2551 = _2183 + 12;
    uint _2553 = uint(int(uint(_2551) >> uint(2)));
    float _2555 = as_type<float>(_dmw14.w);
    float _2557 = 1.0 / _2495;
    bool _2559 = _487 > 0.5;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2563 = _2561 != 0;
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2567 = _2565 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2569 = _2533;
    float _2571 = _1873;
    float _2573 = _1877;
    if (_2521)
    {
        bool _2575 = _473 > 0.5;
        _669 = _2575;
    }
    bool _2577 = _669;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2579;
    int _2583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2585 = _2583 != 0;
    bool _2587 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2589 = isnan(_471);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    out.m_78.x = 1.0;
    out.m_78.y = 1.0;
    out.m_78.z = 1.0;
    int _2599 = _2533 ? as_type<int>(_2531) : as_type<int>(_1873);
    float _2601 = _2581 * _2523;
    if (_2527)
    {
        bool _2603 = _481 > 0.5;
        _2569 = _2603;
    }
    bool _2605 = _2569;
    float _2607 = _2567 * _2557;
    int _2609 = _2029 + 262144;
    uint _2611 = uint(int(uint(_2235) >> uint(2)));
    packed_uint4 _dmw23 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2611)];
    float _2613 = as_type<float>(_dmw23.x);
    int _2615 = _2235 + 4;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    float _2619 = as_type<float>(_dmw23.y);
    int _2621 = _2235 + 8;
    uint _2623 = uint(int(uint(_2621) >> uint(2)));
    float _2625 = as_type<float>(_dmw23.z);
    int _2627 = _2235 + 12;
    uint _2629 = uint(int(uint(_2627) >> uint(2)));
    float _2631 = as_type<float>(_dmw23.w);
    bool _2633 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2635 = isnan(_471);
    bool _2637 = _2633 || _2635;
    bool _2639 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2641 = _2637 || _2639;
    float _2643 = float(_2641);
    float _2645 = -_2597;
    float _2647 = _2645 + 1.0;
    int _2649 = _2029 + 262240;
    uint _2651 = uint(int(uint(_2285) >> uint(2)));
    packed_uint4 _dmw24 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2651)];
    float _2653 = as_type<float>(_dmw24.x);
    int _2655 = _2285 + 4;
    uint _2657 = uint(int(uint(_2655) >> uint(2)));
    float _2659 = as_type<float>(_dmw24.y);
    int _2661 = _2285 + 8;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    float _2665 = as_type<float>(_dmw24.z);
    int _2667 = _2285 + 12;
    uint _2669 = uint(int(uint(_2667) >> uint(2)));
    float _2671 = as_type<float>(_dmw24.w);
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2675 = _471 + _2673;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2679 = _471 + _2677;
    int _2681 = _2029 + 262160;
    uint _2683 = uint(int(uint(_2287) >> uint(2)));
    packed_uint4 _dmw25 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2683)];
    float _2685 = as_type<float>(_dmw25.x);
    int _2687 = _2287 + 4;
    uint _2689 = uint(int(uint(_2687) >> uint(2)));
    float _2691 = as_type<float>(_dmw25.y);
    int _2693 = _2287 + 8;
    uint _2695 = uint(int(uint(_2693) >> uint(2)));
    float _2697 = as_type<float>(_dmw25.z);
    int _2699 = _2287 + 12;
    uint _2701 = uint(int(uint(_2699) >> uint(2)));
    float _2703 = as_type<float>(_dmw25.w);
    float _2705 = fma(_2601, _2675, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2707 = fma(_2607, _2679, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2709 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2711 = isnan(_471);
    bool _2713 = _2709 || _2711;
    bool _2715 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2717 = _2713 || _2715;
    float _2719 = float(_2717);
    uint _2721 = uint(int(uint(_2609) >> uint(2)));
    packed_uint4 _dmw26 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2721)];
    float _2723 = as_type<float>(_dmw26.x);
    int _2725 = _2609 + 4;
    uint _2727 = uint(int(uint(_2725) >> uint(2)));
    float _2729 = as_type<float>(_dmw26.y);
    int _2731 = _2609 + 8;
    uint _2733 = uint(int(uint(_2731) >> uint(2)));
    float _2735 = as_type<float>(_dmw26.z);
    int _2737 = _2609 + 12;
    uint _2739 = uint(int(uint(_2737) >> uint(2)));
    float _2741 = as_type<float>(_dmw26.w);
    float _2743 = _2643 * _2647;
    float _2745 = -_2643;
    float _2747 = _2745 + 1.0;
    uint _2749 = uint(int(uint(_2649) >> uint(2)));
    packed_uint4 _dmw28 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2749)];
    float _2751 = as_type<float>(_dmw28.x);
    int _2753 = _2649 + 4;
    uint _2755 = uint(int(uint(_2753) >> uint(2)));
    float _2757 = as_type<float>(_dmw28.y);
    int _2759 = _2649 + 8;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    float _2763 = as_type<float>(_dmw28.z);
    int _2765 = _2649 + 12;
    uint _2767 = uint(int(uint(_2765) >> uint(2)));
    float _2769 = as_type<float>(_dmw28.w);
    int _2771 = _2029 + 262176;
    int _2773 = _2029 + 262256;
    uint _2775 = uint(int(uint(_2681) >> uint(2)));
    packed_uint4 _dmw27 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2775)];
    float _2777 = as_type<float>(_dmw27.x);
    int _2779 = _2681 + 4;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    float _2783 = as_type<float>(_dmw27.y);
    int _2785 = _2681 + 8;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    float _2789 = as_type<float>(_dmw27.z);
    int _2791 = _2681 + 12;
    uint _2793 = uint(int(uint(_2791) >> uint(2)));
    float _2795 = as_type<float>(_dmw27.w);
    float _2797 = _2563 ? as_type<float>(_2599) : _1873;
    float _2799 = _2719 * _2747;
    float _2801 = _2799;
    if (_2585)
    {
        float _2803 = _2559 ? _2531 : _1873;
        _2571 = _2803;
    }
    float _2805 = _2571;
    uint _2807 = uint(int(uint(_2261) >> uint(2)));
    packed_uint4 _dmw29 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2807)];
    float _2809 = as_type<float>(_dmw29.x);
    int _2811 = _2261 + 4;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    float _2815 = as_type<float>(_dmw29.y);
    int _2817 = _2261 + 8;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    float _2821 = as_type<float>(_dmw29.z);
    int _2823 = _2261 + 12;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    float _2827 = as_type<float>(_dmw29.w);
    uint _2829 = uint(int(uint(_2773) >> uint(2)));
    packed_uint4 _dmw31 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2829)];
    float _2831 = as_type<float>(_dmw31.x);
    int _2833 = _2773 + 4;
    uint _2835 = uint(int(uint(_2833) >> uint(2)));
    float _2837 = as_type<float>(_dmw31.y);
    int _2839 = _2773 + 8;
    uint _2841 = uint(int(uint(_2839) >> uint(2)));
    float _2843 = as_type<float>(_dmw31.z);
    int _2845 = _2773 + 12;
    uint _2847 = uint(int(uint(_2845) >> uint(2)));
    float _2849 = as_type<float>(_dmw31.w);
    uint _2851 = uint(int(uint(_2771) >> uint(2)));
    packed_uint4 _dmw30 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_2851)];
    float _2853 = as_type<float>(_dmw30.x);
    int _2855 = _2771 + 4;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    float _2859 = as_type<float>(_dmw30.y);
    int _2861 = _2771 + 8;
    uint _2863 = uint(int(uint(_2861) >> uint(2)));
    float _2865 = as_type<float>(_dmw30.z);
    int _2867 = _2771 + 12;
    uint _2869 = uint(int(uint(_2867) >> uint(2)));
    float _2871 = as_type<float>(_dmw30.w);
    bool _2873 = _531 != 0.0;
    bool _2875 = isnan(_531);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(0.0);
    bool _2881 = _2877 || _2879;
    bool _2883 = _529 == 0.0;
    bool _2885 = !_2881;
    bool _2887 = _2883 && _2885;
    bool _2889 = _533 == 0.0;
    bool _2891 = _2889 && _2887;
    int _2893 = 0;
    if (_2521)
    {
        float _2895 = -_1877;
        float _2897 = _2895 + 1.0;
        _2893 = as_type<int>(_2897);
    }
    int _2899 = _2893;
    float _2901 = _2705 * _2799;
    float _2903 = -_2719;
    float _2905 = _2903 + 1.0;
    float _2907 = 0.0;
    float _2909 = _2901;
    float _2911 = _2905;
    if (!_2521)
    {
        _2907 = _1877;
    }
    float _2913 = _2907;
    float _2915 = _2913;
    if (_2521)
    {
        float _2917 = _2577 ? as_type<float>(_2899) : _1877;
        _2915 = _2917;
    }
    float _2919 = _2915;
    float _2921 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2901);
    float _2923 = 0.0;
    if (_2891)
    {
        _2923 = _1879;
    }
    float _2925 = _2923;
    float _2927 = _2925;
    if (_2891)
    {
        _2909 = _2925;
    }
    float _2929 = _2909;
    float _2931 = _2929;
    if (!_2891)
    {
        _2927 = _1879;
    }
    float _2933 = _2927;
    float _2935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2937 = 0.0;
    if (_2891)
    {
        _2937 = _1881;
    }
    float _2939 = _2937;
    float _2941 = _2939;
    if (_2891)
    {
        _2801 = _2939;
    }
    float _2943 = _2801;
    float _2945 = _2943;
    if (!_2891)
    {
        _2941 = _1881;
    }
    float _2947 = _2941;
    int _2949 = 0;
    if (_2527)
    {
        float _2951 = -_1877;
        float _2953 = _2951 + 1.0;
        _2949 = as_type<int>(_2953);
    }
    int _2955 = _2949;
    float _2957 = fma(_2707, _2743, _2921);
    float _2959 = _1891 * _1883;
    float _2961 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_2891)
    {
        float _2963 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2947);
        _2945 = _2963;
    }
    float _2965 = _2945;
    float _2967 = _1893 * _2933;
    if (_2527)
    {
        float _2969 = _2605 ? as_type<float>(_2955) : _1877;
        _2573 = _2969;
    }
    float _2971 = _2573;
    float _2973 = -_2959;
    float _2975 = fma(_1893, _2947, _2973);
    if (_2891)
    {
        _2911 = _1883;
    }
    float _2977 = _2911;
    float _2979 = _2977;
    if (!_2891)
    {
        float _2981 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1883);
        _2979 = _2981;
    }
    float _2983 = _2979;
    float _2985 = -_2967;
    float _2987 = fma(_1889, _1883, _2985);
    float _2989 = _2961 * _2935;
    float _2991 = fma(_2597, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2957);
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2999 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3001 = _2993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3003 = _2995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3005 = _2997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3007 = _2991 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_80.x = _3001;
    out.m_80.y = _3003;
    out.m_80.z = _3005;
    out.m_80.w = _3007;
    float _3009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_2891)
    {
        float _3011 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2933);
        _2931 = _3011;
    }
    float _3013 = _2931;
    float _3015 = _1889 * _2947;
    float _3017 = abs(_1307);
    float _3019 = log2(_3017);
    float _3021 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3023 = -_3015;
    float _3025 = fma(_1891, _2933, _3023);
    float _3027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3031 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3033 = _2987 * _1895;
    float _3035 = _2975 * _1895;
    float _3037 = _3025 * _1895;
    float _3039 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3041 = _2919 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _837;
    out.m_82.y = _833;
    out.m_82.z = _841;
    float _3043 = exp2(_3031);
    float _3045 = -_877;
    float _3047 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3039);
    float _3049 = _3021 * _3027;
    float _3051 = _3041 * _3009;
    float _3053 = _901 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3055 = _2999 * _3029;
    float _3057 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3059 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3061 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_84.w = _769;
    float _3063 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3053);
    out.m_86.x = _3051;
    out.m_86.y = _3049;
    out.m_86.z = _3055;
    out.m_86.w = _2989;
    float _3065 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3059);
    float _3067 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3063);
    float _3069 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3071 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3073 = -_877;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3057);
    float _3077 = _901 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3079 = _901 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3081 = -_877;
    float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3061);
    float _3085 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3075);
    float _3087 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3077);
    float _3089 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3079);
    float _3091 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3083);
    float _3093 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3095 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3087);
    float _3097 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3089);
    float _3099 = _3069 * _2965;
    float _3101 = _3085 * _2965;
    float _3103 = _3091 * _1891;
    float _3105 = _3091 * _2965;
    float _3107 = fma(_3043, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3109 = precise::clamp(_3107, 0.0, 1.0);
    float _3111 = _3033 * _3091;
    float _3113 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3093);
    float _3115 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3117 = fma(_3095, _3013, _3099);
    float _3119 = fma(_3097, _3013, _3101);
    float _3121 = _1720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3123 = _3069 * _1891;
    float _3125 = _3085 * _1891;
    float _3127 = fma(_3067, _3013, _3105);
    float _3129 = _3033 * _3069;
    float _3131 = fma(_3067, _1889, _3103);
    float _3133 = fma(_3035, _3067, _3111);
    float _3135 = _3109 * _3109;
    float _3137 = fma(_3109, -2.0, 3.0);
    float _3139 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3115);
    float _3141 = _3033 * _3085;
    float _3143 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3121);
    float _3145 = fma(_3095, _1889, _3123);
    float _3147 = fma(_3035, _3095, _3129);
    float _3149 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3113);
    float _3151 = _3135 * _3137;
    float _3153 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3139);
    float _3155 = fma(_3035, _3097, _3141);
    float _3157 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3143);
    float _3159 = fma(_3037, _3071, _3147);
    float _3161 = fma(_3097, _1889, _3125);
    float _3163 = -_3151;
    float _3165 = _3163 + 1.0;
    float _3167 = fma(_3037, _3149, _3155);
    float _3169 = fma(_3037, _3153, _3133);
    float _3171 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3157);
    float _3173 = -_1915;
    float _3175 = _1907 + _3173;
    float _3177 = fma(_3071, _1893, _3145);
    float _3179 = fma(_3149, _1893, _3161);
    float _3181 = fma(_3165, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3151);
    float _3183 = fma(_3153, _1893, _3131);
    float _3185 = _3171 + _1748;
    float _3187 = _1808 + _1748;
    float _3189 = _1748 * 0.5;
    out.m_88.x = _3159;
    out.m_88.y = _3167;
    out.m_88.z = _3169;
    float _3191 = -_1921;
    float _3193 = _1909 + _3191;
    float _3195 = _3185 * 0.5;
    float _3197 = _3187 * 0.5;
    float _3199 = fma(_1810, -0.5, _3189);
    out.m_90.x = _3177;
    out.m_90.y = _3179;
    out.m_90.z = _3183;
    float _3201 = -_3175;
    float _3203 = _3201 + 1.0;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1810;
    out.gl_Position.z = _3171;
    out.gl_Position.w = _1748;
    float _3205 = _3193 * _3203;
    float _3207 = -_3193;
    float _3209 = _3207 + 1.0;
    out.m_92.x = _3197;
    out.m_92.y = _3199;
    out.m_92.z = _3195;
    out.m_92.w = _1748;
    float _3211 = _3209 * _3203;
    float _3213 = _3205 * _1987;
    float _3215 = _3205 * _2045;
    float _3217 = _3205 * _1981;
    float _3219 = _3205 * _2063;
    float _3221 = _3205 * _2039;
    float _3223 = _3205 * _2007;
    float _3225 = _3205 * _2075;
    float _3227 = _3205 * _1993;
    float _3229 = _3205 * _2069;
    float _3231 = _3175 * _3209;
    float _3233 = _3205 * _2051;
    float _3235 = _3205 * _2115;
    float _3237 = fma(_3211, _2101, _3225);
    float _3239 = _3205 * _2135;
    float _3241 = fma(_3211, _2089, _3219);
    float _3243 = _3205 * _2019;
    float _3245 = _3205 * _2013;
    float _3247 = _3205 * _2025;
    float _3249 = _3205 * _2141;
    float _3251 = _3193 * _3175;
    float _3253 = _3205 * _2147;
    float _3255 = _3205 * _2109;
    float _3257 = fma(_3211, _2219, _3235);
    float _3259 = fma(_3231, _2179, _3237);
    float _3261 = _3205 * _2121;
    float _3263 = fma(_3211, _2187, _3239);
    float _3265 = fma(_3231, _2167, _3241);
    float _3267 = _3205 * _1999;
    float _3269 = _3205 * _2127;
    float _3271 = fma(_3211, _2193, _3249);
    float _3273 = _3205 * _2057;
    float _3275 = fma(_3211, _2199, _3253);
    float _3277 = fma(_3211, _2213, _3255);
    float _3279 = fma(_3231, _2321, _3257);
    float _3281 = fma(_3251, _2257, _3259);
    float _3283 = _3205 * _2153;
    float _3285 = fma(_3211, _2225, _3261);
    float _3287 = fma(_3231, _2265, _3263);
    float _3289 = fma(_3251, _2245, _3265);
    float _3291 = fma(_3211, _2231, _3269);
    float _3293 = fma(_3231, _2271, _3271);
    float _3295 = fma(_3211, _2083, _3273);
    float _3297 = fma(_3231, _2277, _3275);
    float _3299 = fma(_3231, _2315, _3277);
    float _3301 = fma(_3251, _2297, _3279);
    float _3303 = _3281 * 0.511664927005767822265625;
    float _3305 = fma(_3211, _2205, _3283);
    float _3307 = fma(_3231, _2327, _3285);
    float _3309 = fma(_3251, _2337, _3287);
    float _3311 = _3289 * 0.886227548122406005859375;
    float _3313 = fma(_3231, _2333, _3291);
    float _3315 = fma(_3251, _2343, _3293);
    float _3317 = fma(_3231, _2161, _3295);
    float _3319 = fma(_3251, _2349, _3297);
    float _3321 = _3301 * 0.511664927005767822265625;
    float _3323 = _3303 * _3303;
    float _3325 = fma(_3231, _2283, _3305);
    float _3327 = fma(_3251, _2303, _3307);
    float _3329 = _3309 * 0.511664927005767822265625;
    float _3331 = precise::max(_3311, 0.00999999977648258209228515625);
    float _3333 = fma(_3251, _2309, _3313);
    float _3335 = _3315 * 0.511664927005767822265625;
    float _3337 = _3319 * 0.511664927005767822265625;
    float _3339 = fma(_3321, _3321, _3323);
    float _3341 = fma(_3251, _2355, _3325);
    float _3343 = _3327 * 0.511664927005767822265625;
    float _3345 = _3329 * _3329;
    float _3347 = 1.0 / _3331;
    float _3349 = fma(_3251, _2291, _3299);
    float _3351 = _3333 * 0.511664927005767822265625;
    float _3353 = fma(_3337, _3337, _3339);
    float _3355 = _3205 * _2359;
    float _3357 = _3341 * 0.511664927005767822265625;
    float _3359 = fma(_3343, _3343, _3345);
    float _3361 = _3335 * _3335;
    float _3363 = _3205 * _2365;
    float _3365 = _3205 * _2371;
    float _3367 = fma(_3211, _2387, _3213);
    float _3369 = _3349 * 0.511664927005767822265625;
    float _3371 = fma(_3351, _3351, _3361);
    float _3373 = _3205 * _2377;
    float _3375 = _3205 * _2033;
    float _3377 = fma(_3357, _3357, _3359);
    float _3379 = fma(_3211, _2409, _3221);
    float _3381 = sqrt(_3353);
    float _3383 = fma(_3231, _2431, _3367);
    float _3385 = fma(_3369, _3369, _3371);
    float _3387 = fma(_3251, _2239, _3317);
    float _3389 = _3205 * _2453;
    float _3391 = _3387 * 0.886227548122406005859375;
    float _3393 = sqrt(_3377);
    float _3395 = fma(_3211, _2475, _3389);
    float _3397 = precise::max(_3391, 0.00999999977648258209228515625);
    float _3399 = sqrt(_3385);
    float _3401 = 1.0 / _3397;
    float _3403 = precise::max(_3393, 0.00999999977648258209228515625);
    float _3405 = precise::max(_3381, 0.00999999977648258209228515625);
    float _3407 = 1.0 / _3405;
    float _3409 = precise::max(_3399, 0.00999999977648258209228515625);
    float _3411 = fma(_3211, _2505, _3363);
    float _3413 = fma(_3211, _2517, _3373);
    float _3415 = 1.0 / _3403;
    float _3417 = fma(_3211, _2095, _3229);
    float _3419 = 1.0 / _3409;
    float _3421 = fma(_3231, _2173, _3417);
    float _3423 = _3303 * _3407;
    float _3425 = fma(_3149, _2983, _3119);
    float _3427 = _3403 * _3347;
    float _3429 = precise::clamp(_3427, 0.0, 1.0);
    float _3431 = _3321 * _3407;
    float _3433 = _3337 * _3407;
    float _3435 = fma(_3251, _2251, _3421);
    float _3437 = _3425 * _3423;
    float _3439 = _3329 * _3415;
    float _3441 = fma(_3071, _2983, _3117);
    float _3443 = _3205 * _2447;
    float _3445 = _3205 * _2459;
    float _3447 = _3205 * _2465;
    float _3449 = fma(_3211, _2543, _3245);
    float _3451 = _3435 * 0.886227548122406005859375;
    float _3453 = _3335 * _3419;
    float _3455 = _3343 * _3415;
    float _3457 = _3425 * _3439;
    float _3459 = fma(_3231, _2631, _3413);
    float _3461 = fma(_3441, _3431, _3437);
    float _3463 = fma(_3153, _2983, _3127);
    float _3465 = fma(_3211, _2381, _3217);
    float _3467 = _3351 * _3419;
    float _3469 = _3425 * _3453;
    float _3471 = fma(_3211, _2537, _3223);
    float _3473 = fma(_3231, _2659, _3449);
    float _3475 = precise::max(_3451, 0.00999999977648258209228515625);
    float _3477 = fma(_3441, _3455, _3457);
    float _3479 = fma(_3251, _2741, _3459);
    float _3481 = fma(_3463, _3433, _3461);
    float _3483 = _3425 * 1.02332699298858642578125;
    float _3485 = fma(_3231, _2425, _3465);
    float _3487 = _3357 * _3415;
    float _3489 = _3369 * _3419;
    float _3491 = fma(_3441, _3467, _3469);
    float _3493 = fma(_3211, _2549, _3243);
    float _3495 = fma(_3231, _2653, _3471);
    float _3497 = fma(_3251, _2757, _3473);
    float _3499 = _3405 * _3401;
    float _3501 = precise::clamp(_3499, 0.0, 1.0);
    float _3503 = fma(_3481, 0.5, 0.5);
    float _3505 = 1.0 / _3475;
    float _3507 = fma(_3211, _2499, _3355);
    float _3509 = fma(_3231, _2619, _3411);
    float _3511 = fma(_3251, _2777, _3485);
    float _3513 = fma(_3463, _3487, _3477);
    float _3515 = fma(_3211, _2555, _3247);
    float _3517 = fma(_3231, _2665, _3493);
    float _3519 = fma(_3251, _2751, _3495);
    float _3521 = _3479 * _3483;
    float _3523 = fma(_3463, _3489, _3491);
    float _3525 = _3497 * _3483;
    float _3527 = fma(_3231, _2691, _3395);
    float _3529 = fma(_3211, _2393, _3227);
    float _3531 = fma(_3231, _2613, _3507);
    float _3533 = fma(_3251, _2729, _3509);
    float _3535 = _3511 * _3483;
    float _3537 = fma(_3513, 0.5, 0.5);
    float _3539 = fma(_3523, 0.5, 0.5);
    float _3541 = fma(_3211, _2511, _3365);
    float _3543 = fma(_3211, _2469, _3443);
    float _3545 = fma(_3231, _2671, _3515);
    float _3547 = fma(_3251, _2763, _3517);
    float _3549 = fma(_3519, 0.88622701168060302734375, _3525);
    float _3551 = _3463 * 1.02332699298858642578125;
    float _3553 = fma(_3251, _2783, _3383);
    float _3555 = fma(_3251, _2837, _3527);
    float _3557 = fma(_3231, _2437, _3529);
    float _3559 = fma(_3251, _2723, _3531);
    float _3561 = fma(_3533, 0.88622701168060302734375, _3535);
    float _3563 = fma(_3211, _2399, _3267);
    float _3565 = fma(_3211, _2403, _3375);
    float _3567 = fma(_3211, _2481, _3445);
    float _3569 = fma(_3231, _2625, _3541);
    float _3571 = fma(_3231, _2685, _3543);
    float _3573 = fma(_3251, _2769, _3545);
    float _3575 = fma(_3547, _3551, _3549);
    float _3577 = _3441 * 1.02332699298858642578125;
    float _3579 = _3553 * _3483;
    float _3581 = _3555 * _3483;
    float _3583 = abs(_3503);
    float _3585 = log2(_3583);
    float _3587 = fma(_3231, _2815, _3379);
    float _3589 = fma(_3251, _2789, _3557);
    float _3591 = fma(_3559, 0.88622701168060302734375, _3521);
    float _3593 = fma(_3231, _2443, _3563);
    float _3595 = fma(_3231, _2809, _3565);
    float _3597 = fma(_3231, _2697, _3567);
    float _3599 = abs(_3537);
    float _3601 = log2(_3599);
    float _3603 = fma(_3251, _2735, _3569);
    float _3605 = fma(_3251, _2831, _3571);
    float _3607 = fma(_3573, _3577, _3575);
    float _3609 = abs(_3539);
    float _3611 = log2(_3609);
    float _3613 = fma(_3251, _2859, _3587);
    float _3615 = fma(_3589, _3551, _3591);
    float _3617 = fma(_3211, _2421, _3233);
    float _3619 = fma(_3251, _2795, _3593);
    float _3621 = fma(_3251, _2853, _3595);
    float _3623 = fma(_3251, _2843, _3597);
    float _3625 = fma(_3603, 0.88622701168060302734375, _3579);
    float _3627 = fma(_3605, 0.88622701168060302734375, _3581);
    float _3629 = _3607 * 0.31830990314483642578125;
    float _3631 = precise::clamp(_3629, 0.0, 1.0);
    float _3633 = fma(_3211, _2415, _3215);
    float _3635 = fma(_3211, _2487, _3447);
    float _3637 = _3409 * _3505;
    float _3639 = precise::clamp(_3637, 0.0, 1.0);
    float _3641 = fma(_3613, _3577, _3615);
    float _3643 = fma(_3231, _2827, _3617);
    float _3645 = fma(_3619, _3551, _3561);
    float _3647 = fma(_3621, _3551, _3625);
    float _3649 = fma(_3623, _3551, _3627);
    float _3651 = _3631 * 0.88622701168060302734375;
    float _3653 = fma(_3231, _2821, _3633);
    float _3655 = fma(_3231, _2703, _3635);
    float _3657 = fma(_3501, 2.0, 1.0);
    float _3659 = fma(_3429, 2.0, 1.0);
    float _3661 = fma(_3639, 2.0, 1.0);
    float _3663 = fma(_3251, _2871, _3643);
    float _3665 = precise::max(0.0, _3641);
    float _3667 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].x;
    float _3669 = fma(_3251, _2865, _3653);
    float _3671 = fma(_3251, _2849, _3655);
    float _3673 = _3657 * _3585;
    float _3675 = _3659 * _3601;
    float _3677 = _3661 * _3611;
    float _3679 = _3501 + 1.0;
    float _3681 = _3429 + 1.0;
    float _3683 = fma(_3663, _3577, _3647);
    float _3685 = fma(_3669, _3577, _3645);
    float _3687 = fma(_3671, _3577, _3649);
    float _3689 = fma(_3665, (*spvDescriptorSet0.vp_c15)._m0[17].x, _3667);
    float _3691 = _3639 + 1.0;
    float _3693 = exp2(_3673);
    float _3695 = precise::max(0.0, _3685);
    out.m_94.x = _859;
    float _3697 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3699 = in.m_96.x;
    float _3701 = exp2(_3675);
    float _3703 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].y;
    float _3705 = exp2(_3677);
    float _3707 = fma(_3695, (*spvDescriptorSet0.vp_c15)._m0[17].y, _3703);
    float _3709 = -_3501;
    float _3711 = _3709 + 1.0;
    float _3713 = 1.0 / _3679;
    float _3715 = -_3429;
    float _3717 = _3715 + 1.0;
    float _3719 = 1.0 / _3681;
    float _3721 = _3687 * 0.31830990314483642578125;
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = 1.0 / _3691;
    float _3727 = fma(_3501, 2.0, 2.0);
    float _3729 = fma(_3429, 2.0, 2.0);
    float _3731 = fma(_3639, 2.0, 2.0);
    float _3733 = -_3639;
    float _3735 = _3733 + 1.0;
    float _3737 = _3727 * _3693;
    float _3739 = _3729 * _3701;
    float _3741 = _3731 * _3705;
    out.m_98.x = _3441;
    out.m_98.y = _3425;
    out.m_98.z = _3463;
    float _3743 = -_3723;
    float _3745 = _3743 + 1.0;
    out.m_100.x = _1297;
    out.m_100.y = _1295;
    out.m_100.z = _1299;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c15)._m0[659].w, _3723);
    out.m_102.x = 0.0;
    float _3749 = _3711 * _3713;
    float _3751 = _3717 * _3719;
    float _3753 = _3735 * _3725;
    float _3755 = -_3737;
    float _3757 = _3755 + 1.0;
    float _3759 = -_3739;
    float _3761 = _3759 + 1.0;
    float _3763 = -_3741;
    float _3765 = _3763 + 1.0;
    bool _3767 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3769 = _3651 * (*spvDescriptorSet0.vp_c15)._m0[659].z;
    float _3771 = precise::max(0.0, _3683);
    float _3773 = fma(_3749, _3757, _3737);
    float _3775 = fma(_3751, _3761, _3739);
    float _3777 = fma(_3753, _3765, _3741);
    float _3779 = exp2(_3697);
    float _3781 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[17].z, _3769);
    float _3783 = _3391 * _3773;
    float _3785 = _3311 * _3775;
    float _3787 = _3747 * (*spvDescriptorSet0.vp_c13)._m0[3].x;
    float _3789 = _3451 * _3777;
    bool _3791 = _1307 <= 8000.0;
    bool _3793 = isnan(_1307);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(8000.0);
    bool _3799 = _3795 || _3797;
    float _3801 = float(_3799);
    float _3803 = fma(_3783, _3787, _3689);
    float _3805 = fma(_3785, _3787, _3707);
    float _3807 = fma(_3789, _3787, _3781);
    float _3809 = _3801 * _3181;
    float _3811 = _1367 * _1421;
    float _3813 = _3803 * 0.31830990314483642578125;
    float _3815 = _3805 * 0.31830990314483642578125;
    float _3817 = _3807 * 0.31830990314483642578125;
    bool _3819 = !_3767;
    if (!_3819)
    {
        float _3821 = -_1295;
        float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3825 = -_1297;
        float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3829 = -_1299;
        float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3833 = _3823 * _3823;
        float _3835 = fma(_3827, _3827, _3833);
        float _3837 = fma(_3831, _3831, _3835);
        float _3839 = sqrt(_3837);
        float _3841 = rsqrt(_3837);
        float _3843 = -_3839;
        float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3849 = precise::clamp(_3847, 0.0, 1.0);
        float _3851 = _3827 * _3841;
        float _3853 = _3823 * _3841;
        float _3855 = abs(_3849);
        float _3857 = log2(_3855);
        float _3859 = _3831 * _3841;
        float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3863 = _3425 * _3853;
        float _3865 = -_3853;
        float _3867 = -_3861;
        float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
        float _3871 = fma(_3441, _3851, _3863);
        float _3873 = -_3859;
        float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
        float _3877 = fma(_3463, _3859, _3871);
        float _3879 = precise::clamp(_3877, 0.0, 1.0);
        float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3883 = _3875 + _3881;
        float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3889 = precise::clamp(_3887, 0.0, 1.0);
        float _3891 = exp2(_3885);
        float _3893 = _3891 * _3889;
        float _3895 = _3879 * _3893;
        float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3897;
        out.m_102.y = _3899;
        out.m_102.z = _3901;
    }
    float _3903 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3905 = -_3779;
    float _3907 = _3905 + 1.0;
    float _3909 = -_1840;
    float _3911 = _3909 + 1.0;
    float _3913 = _3811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3915 = _3907 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3917 = _3911 * _3903;
    float _3919 = precise::clamp(_3917, 0.0, 1.0);
    bool _3921 = _1367 > 0.0;
    bool _3923 = isnan(_1367);
    bool _3925 = _3921 || _3923;
    bool _3927 = isnan(0.0);
    bool _3929 = _3925 || _3927;
    float _3931 = _3913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3933 = _3915 * _1846;
    float _3935 = -_3919;
    float _3937 = fma(_3935, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _3939 = _1421 <= 0.0;
    bool _3941 = !_3929;
    bool _3943 = _3939 || _3941;
    float _3945 = -_3915;
    float _3947 = _3945 + 1.0;
    float _3949 = _1857 * _3933;
    float _3951 = _3937 * _3699;
    float _3953 = _1867 * _3933;
    out.m_56.x = _3931;
    float _3955 = fma(_1863, _3949, _1851);
    float _3957 = fma(_1865, _3949, _1853);
    float _3959 = _3951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3961 = _1857 * _3947;
    float _3963 = fma(_1857, _3953, _1855);
    out.m_84.x = _3813;
    out.m_84.y = _3815;
    out.m_84.z = _3817;
    out.m_104.x = _3959;
    out.m_106.x = _3955;
    out.m_106.y = _3957;
    out.m_106.z = _3963;
    out.m_106.w = _3961;
    if (!_3943)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _3965 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3965;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

