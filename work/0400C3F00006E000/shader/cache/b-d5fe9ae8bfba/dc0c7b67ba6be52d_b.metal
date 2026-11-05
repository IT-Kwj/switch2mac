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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_100 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 m_98 [[user(locn14)]];
    float4 m_94 [[user(locn15)]];
    float4 m_96 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4691 = false;
    bool _457 = false;
    bool _313 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = in.m_48.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = _116;
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5000 = as_type<float>(_143);
        out.gl_Position.z = _5000;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _145 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_116);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_121);
    bool _157 = _125 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _133;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    float _167 = _125 * _163;
    int _169 = 0;
    float _171 = _167;
    if (_161)
    {
        float _173 = _165 * 5.0;
        _169 = as_type<int>(_173);
    }
    int _175 = _169;
    out.m_51.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5063 = as_type<float>(_175);
        out.gl_Position.z = _5063;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_58.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        _215 = _167;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_58.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        _311 = _167;
    }
    _313 = false;
    float _315 = _311;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _341 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _343 = isnan(_315);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _353;
    bool _357 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _359 = isnan(_315);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = 1.0 / _323;
    float _371 = -_335;
    float _373 = _371 + 1.0;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _377 = _351 * _373;
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _339;
    float _385 = _355 * _369;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _393 = _389 * _383;
    float _395 = _391 * _377;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _403 = _315 + _401;
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _407 = _335 * _399;
    float _409 = fma(_393, _403, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = fma(_409, _407, _405);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _421 = _411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[117].x, _417);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _427 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = _423 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _431 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _421;
    out.m_62.y = _431;
    out.m_62.z = _427;
    out.m_62.w = _429;
    float _433 = _291 * _415;
    float _435 = _289 * _413;
    bool _437 = !_375;
    float _455;
    if (!_437)
    {
        float _439 = in.m_58.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _167;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _473 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _475 = isnan(_459);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _503;
    float _507 = -_483;
    float _509 = _507 + 1.0;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _525 = 1.0 / _471;
    float _527 = 1.0 / _487;
    float _529 = _505 * _501;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _535 = _499 * _509;
    float _537 = -_499;
    float _539 = _537 + 1.0;
    float _541 = fma(_529, _463, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _543;
    float _547 = _521 * _539;
    float _549 = _533 * _525;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _553 = _459 + _551;
    bool _555 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _557 = isnan(_459);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = _541 * _547;
    float _569 = -_521;
    float _571 = _569 + 1.0;
    float _573 = fma(_549, _553, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _577 = _459 + _575;
    float _579 = _545 * _527;
    float _581 = -_565;
    float _583 = _581 + 1.0;
    float _585 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[131].x, _567);
    float _587 = fma(_579, _577, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _589 = _483 * _583;
    float _591 = fma(_573, _535, _585);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _595 = fma(_587, _589, _591);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _599 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _603 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[134].x, _595);
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _599;
    out.m_64.y = _605;
    out.m_64.z = _607;
    out.m_64.w = _609;
    bool _611 = !_523;
    float _613 = _599;
    float _615 = _609;
    float _617 = _585;
    if (!_611)
    {
        float _619 = in.m_58.x;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _623 = _619 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _171 = _633;
    }
    float _635 = _171;
    float _637 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _639 = int(_637);
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _643 = _641 != 0;
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _647 = int(_645);
    float _649 = float(_639);
    float _651 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _653 = int(_651);
    if (_643)
    {
        _613 = 1.0;
    }
    float _655 = _613;
    float _657 = _655;
    if (_643)
    {
        _615 = 1.0;
    }
    float _659 = _615;
    float _661 = float(_647);
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _665 = int(_663);
    float _667 = 1.0 / _649;
    float _669 = float(uint(_653));
    int _671 = ~_653;
    int _673 = _671 + 1;
    float _675 = 1.0 / _661;
    float _677 = float(uint(_665));
    float _679 = _667 * _125;
    float _681 = 1.0 / _669;
    float _683 = _675 * _125;
    float _685 = 1.0 / _677;
    float _687 = _675;
    float _689 = _649;
    float _691 = _659;
    if (_643)
    {
        float _693 = in.m_58.x;
        float _695 = in.m_58.y;
        _687 = _693;
        _689 = _695;
    }
    float _697 = _687;
    float _699 = _689;
    float _701 = trunc(_679);
    int _703 = int(_701);
    int _705 = as_type<int>(_681) + (-2);
    float _707 = trunc(_683);
    int _709 = int(_707);
    int _711 = as_type<int>(_685) + (-2);
    int _713 = as_type<int>(_685);
    if (_643)
    {
        _713 = 0;
    }
    int _715 = _713;
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _719 = int(_717);
    float _721 = float(uint(_703));
    float _723 = _721;
    float _725 = _697;
    float _727 = _699;
    int _729 = _715;
    if (_643)
    {
        _617 = _697;
    }
    float _731 = _617;
    float _733 = as_type<float>(_711) * _721;
    float _735 = _731;
    if (_643)
    {
        _723 = _699;
    }
    float _737 = _723;
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _741 = int(_739);
    float _743 = float(uint(_709));
    float _745 = as_type<float>(_705) * _743;
    float _747 = trunc(_733);
    float _749 = precise::max(_747, 0.0);
    uint _752 = uint(_749);
    float _754 = float(uint(_719));
    float _756 = float(_741);
    float _758 = 1.0 / _754;
    float _760 = 1.0 / _756;
    int _762 = as_type<int>(_754);
    float _764 = _756;
    float _766 = _745;
    float _768 = _737;
    if (_643)
    {
        _762 = 0;
    }
    int _770 = _762;
    float _772 = trunc(_745);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    int _778 = _770;
    if (_643)
    {
        _764 = _731;
    }
    float _780 = _764;
    float _782 = _780;
    if (_643)
    {
        _766 = _731;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_643)
    {
        float _788 = in.m_58.x;
        float _790 = in.m_58.y;
        float _792 = in.m_58.z;
        float _794 = _788 * 3.1415927410125732421875;
        float _796 = _794 * 0.15915493667125701904296875;
        float _798 = _790 * 3.1415927410125732421875;
        float _800 = _798 * 0.15915493667125701904296875;
        float _802 = _796 * 6.283185482025146484375;
        float _804 = sin(_802);
        float _806 = _800 * 6.283185482025146484375;
        float _808 = sin(_806);
        _691 = 5.839270114898681640625;
        _782 = _792;
        _657 = 7.345489978790283203125;
        _725 = _788;
        _735 = _790;
        _727 = _790;
        _768 = _808;
        _778 = 1;
        _786 = _804;
        _729 = 2;
    }
    float _810 = _691;
    float _812 = _782;
    float _814 = _657;
    float _816 = _725;
    float _818 = _735;
    float _820 = _727;
    float _822 = _768;
    int _824 = _778;
    float _826 = _786;
    int _828 = _729;
    int _830 = _673 * int(_776);
    int _832 = _830 + _709;
    int _834 = ~_665;
    int _836 = _834 + 1;
    float _838 = _810 * _812;
    float _840 = in.m_58.z;
    float _842 = in.m_58.w;
    float _844 = _760 * _125;
    float _846 = float(uint(_832));
    float _848 = _814 * _816;
    int _850 = _836 * int(_752);
    int _852 = _850 + _703;
    float _854 = floor(_838);
    float _856 = float(_709);
    float _858 = as_type<float>(_705) * _846;
    float _860 = float(_653);
    float _862 = _814 * _818;
    float _864 = float(uint(_852));
    float _866 = _816 * 2.0;
    float _868 = floor(_848);
    bool _870 = _856 >= _860;
    bool _872 = isnan(_856);
    bool _874 = _870 || _872;
    bool _876 = isnan(_860);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = as_type<float>(_711) * _864;
    int _884 = as_type<int>(_758) + (-2);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _888 = _635 + _886;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _892 = _890 != 0;
    bool _894 = _820 > 0.5;
    float _896 = trunc(_844);
    int _898 = int(_896);
    float _900 = -_854;
    float _902 = _838 + _900;
    float _904 = float(_703);
    bool _906 = _842 > 0.5;
    bool _908 = _840 > 0.5;
    float _910 = trunc(_858);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = -_868;
    float _918 = _848 + _916;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _930 = _928 != 0;
    float _932 = -_195;
    int _934 = _908 ? as_type<int>(_932) : as_type<int>(_195);
    float _936 = trunc(_882);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    float _942 = float(uint(_898));
    int _944 = ~_653;
    int _946 = _944 + 1;
    int _948 = ~_665;
    int _950 = _948 + 1;
    int _952 = int(_906);
    int _954 = _908 ? 2 : 0;
    int _956 = _952 | _954;
    int _958 = _892 ? 4 : 0;
    int _960 = _956 | _958;
    int _962 = _922 ? 8 : 0;
    int _964 = _960 | _962;
    int _966 = _926 ? 16 : 0;
    int _968 = _964 | _966;
    int _970 = _930 ? 32 : 0;
    int _972 = _968 | _970;
    int _974 = _894 ? 64 : 0;
    int _976 = _972 | _974;
    int _978 = _976 & 64;
    float _980 = trunc(_880);
    int _982 = int(_980);
    int _984 = int(_776) + int(_914);
    float _986 = as_type<float>(_884) * _942;
    float _988 = -_191;
    int _990 = _894 ? as_type<int>(_988) : as_type<int>(_191);
    bool _992 = !_930;
    float _994 = _992 ? _195 : as_type<float>(_934);
    int _996 = _946 * _984;
    int _998 = _996 + _709;
    bool _1000 = !_926;
    float _1002 = _1000 ? _191 : as_type<float>(_990);
    float _1004 = floor(_862);
    float _1006 = float(_665);
    int _1008 = int(_752) + int(_940);
    bool _1010 = _904 >= _1006;
    bool _1012 = isnan(_904);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(_1006);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _918 * _860;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1034 = _1032 != 0;
    int _1036 = _950 * _1008;
    int _1038 = _1036 + _703;
    float _1040 = trunc(_1020);
    int _1042 = int(_1040);
    bool _1044 = !_892;
    int _1046 = _1044 ? 0 : 1;
    bool _1048 = !_1030;
    int _1050 = _1048 ? 0 : 1;
    bool _1052 = !_1026;
    int _1054 = _1052 ? 0 : 1;
    bool _1056 = uint(_998) >= uint(_653);
    float _1058 = trunc(_1022);
    int _1060 = int(_1058);
    float _1062 = _902 * _1006;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1066 = _1064 != 0;
    float _1068 = -_1004;
    float _1070 = _862 + _1068;
    bool _1072 = uint(_1038) >= uint(_665);
    bool _1074 = !_1034;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = trunc(_986);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    bool _1084 = !_1056;
    int _1086 = _1084 ? 0 : (-1);
    bool _1088 = !_1072;
    int _1090 = _1088 ? 0 : (-1);
    int _1092 = abs(_1046);
    int _1094 = ~_984;
    int _1096 = _1094 + _1086;
    int _1098 = _1096 + 1;
    float _1100 = trunc(_1062);
    int _1102 = int(_1100);
    bool _1104 = !_1066;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1060 * _1092;
    int _1110 = _1108 + _709;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1122 = _1120 != 0;
    int _1124 = _653 * _1098;
    int _1126 = _1124 + _709;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1130 = _1128 != 0;
    int _1132 = ~_1008;
    int _1134 = _1132 + _1090;
    int _1136 = _1134 + 1;
    bool _1138 = !_1130;
    int _1140 = _1138 ? 0 : 1;
    int _1142 = ~_719;
    int _1144 = _1142 + 1;
    int _1146 = _665 * _1136;
    int _1148 = _1146 + _703;
    int _1150 = abs(_1140);
    bool _1152 = _653 == 0;
    int _1154 = _1144 * int(_1082);
    int _1156 = _1154 + _898;
    bool _1158 = !_1114;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _1102 * _1150;
    int _1164 = _1162 + _703;
    float _1166 = _163 * _125;
    bool _1168 = _665 == 0;
    int _1170 = ~_982;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = _860 * _1166;
    bool _1178 = !_1152;
    int _1180 = _1178 ? _1126 : (-1);
    float _1182 = _1006 * _1166;
    int _1184 = ~_1042;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1168;
    int _1192 = _1190 ? _1148 : (-1);
    int _1194 = _1180 * _1174;
    float _1196 = float(uint(_1156));
    float _1198 = trunc(_1176);
    int _1200 = int(_1198);
    bool _1202 = !_1118;
    int _1204 = _1202 ? 0 : 1;
    int _1206 = _1192 * _1188;
    int _1208 = _653 + (-1);
    float _1210 = as_type<float>(_884) * _1196;
    int _1212 = _665 + (-1);
    int _1214 = abs(_1204);
    int _1216 = _982 * _1208;
    int _1218 = _1216 + _1194;
    int _1220 = abs(_1050);
    float _1222 = trunc(_1210);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = _1042 * _1212;
    int _1230 = _1228 + _1206;
    int _1232 = abs(_1076);
    int _1234 = _1218 * _1220;
    int _1236 = abs(_1054);
    int _1238 = _1230 * _1214;
    int _1240 = abs(_1106);
    float _1242 = trunc(_1182);
    int _1244 = int(_1242);
    int _1246 = _1200 * _1236;
    int _1248 = _1246 + _1234;
    int _1250 = abs(_1160);
    int _1252 = _1110 * _1232;
    int _1254 = _1252 + _1248;
    int _1256 = ~_719;
    int _1258 = _1256 + 1;
    int _1260 = int(_1082) + int(_1226);
    int _1262 = _1060 * _1240;
    int _1264 = _1262 + _1254;
    bool _1266 = !_1122;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = -_195;
    int _1272 = _906 ? as_type<int>(_1270) : as_type<int>(_195);
    int _1274 = _1258 * _1260;
    int _1276 = _1274 + _898;
    float _1278 = -_191;
    int _1280 = _908 ? as_type<int>(_1278) : as_type<int>(_191);
    int _1282 = _1244 * _1250;
    int _1284 = _1282 + _1238;
    float _1286 = float(uint(_1264));
    int _1288 = abs(_1268);
    bool _1290 = uint(_1276) >= uint(_719);
    float _1292 = as_type<float>(_705) * _1286;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1300 = _1298 != 0;
    float _1302 = trunc(_1292);
    float _1304 = precise::max(_1302, 0.0);
    uint _1306 = uint(_1304);
    bool _1308 = _978 != 0;
    float _1310 = float(_719);
    float _1312 = float(_898);
    bool _1314 = !_922;
    float _1316 = _1314 ? _195 : as_type<float>(_1272);
    bool _1318 = !_1296;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = !_1300;
    int _1324 = _1322 ? 0 : 1;
    bool _1326 = !_1290;
    int _1328 = _1326 ? 0 : (-1);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1332 = _1330 != 0;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1336 = _1334 != 0;
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1340 = _1338 != 0;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1344 = _1342 != 0;
    bool _1346 = _1312 >= _1310;
    bool _1348 = isnan(_1312);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(_1310);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1310 * _1166;
    float _1360 = _1070 * _1310;
    int _1362 = _1164 * _1288;
    int _1364 = _1362 + _1284;
    bool _1366 = !_1336;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1372 = _1370 != 0;
    float _1374 = trunc(_1356);
    int _1376 = int(_1374);
    int _1378 = abs(_1320);
    int _1380 = ~_653;
    int _1382 = _1380 + 1;
    int _1384 = ~_1260;
    int _1386 = _1384 + _1328;
    int _1388 = _1386 + 1;
    int _1390 = _1382 * int(_1306);
    int _1392 = _1390 + _1264;
    float _1394 = trunc(_1360);
    int _1396 = int(_1394);
    int _1398 = abs(_1368);
    int _1400 = _1102 * _1378;
    int _1402 = _1400 + _1364;
    float _1404 = as_type<float>(_1378);
    float _1406 = as_type<float>(_1264);
    float _1408 = as_type<float>(_828);
    float _1410 = as_type<float>(_824);
    if (_1372)
    {
        float _1412 = in.m_58.w;
        _1404 = _1412;
    }
    float _1414 = _1404;
    float _1416 = float(uint(_1392));
    int _1418 = _719 * _1388;
    int _1420 = _1418 + _898;
    bool _1422 = !_1332;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1358);
    int _1428 = int(_1426);
    bool _1430 = _719 == 0;
    float _1432 = as_type<float>(_705) * _1416;
    float _1434 = float(uint(_1402));
    int _1436 = ~_1376;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    bool _1442 = !_1430;
    int _1444 = _1442 ? _1420 : (-1);
    float _1446 = as_type<float>(_711) * _1434;
    float _1448 = trunc(_1432);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = abs(_1324);
    int _1456 = _1444 * _1440;
    int _1458 = _719 + (-1);
    int _1460 = abs(_1424);
    float _1462 = trunc(_1446);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    int _1468 = _1376 * _1458;
    int _1470 = _1468 + _1456;
    int _1472 = _1470 * _1398;
    int _1474 = ~_665;
    int _1476 = _1474 + 1;
    int _1478 = _1396 * _1454;
    int _1480 = _1478 + _898;
    float _1482 = as_type<float>(_1454);
    if (_1372)
    {
        float _1484 = _1414 * 3.1415927410125732421875;
        _1482 = _1484;
    }
    float _1486 = _1482;
    int _1488 = _1428 * _1460;
    int _1490 = _1488 + _1472;
    bool _1492 = !_1340;
    int _1494 = _1492 ? 0 : 1;
    int _1496 = ~_653;
    int _1498 = _1496 + 1;
    float _1500 = _1486;
    if (_1372)
    {
        float _1502 = _1486 * 0.15915493667125701904296875;
        _1500 = _1502;
    }
    float _1504 = _1500;
    int _1506 = int(_1306) + int(_1452);
    int _1508 = _1476 * int(_1466);
    int _1510 = _1508 + _1402;
    int _1512 = abs(_1494);
    bool _1514 = !_1344;
    int _1516 = _1514 ? 0 : 1;
    int _1518 = _1498 * _1506;
    int _1520 = _1518 + _1264;
    float _1522 = float(uint(_1510));
    float _1524 = _1504;
    if (_1372)
    {
        float _1526 = _1504 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        _1524 = _1528;
    }
    float _1530 = _1524;
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1534 = _1532 != 0;
    int _1536 = abs(_1516);
    float _1538 = as_type<float>(_711) * _1522;
    bool _1540 = uint(_1520) >= uint(_653);
    int _1542 = _1480 * _1512;
    int _1544 = _1542 + _1490;
    float _1546 = float(uint(_1110));
    float _1548 = trunc(_1538);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    bool _1554 = !_1540;
    int _1556 = _1554 ? 0 : (-1);
    int _1558 = _1396 * _1536;
    int _1560 = _1558 + _1544;
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1564 = _1562 != 0;
    float _1566 = as_type<float>(_705) * _1546;
    int _1568 = ~_1506;
    int _1570 = _1568 + _1556;
    int _1572 = _1570 + 1;
    float _1574 = as_type<float>(_1376);
    bool _1576 = _1564;
    if (_1534)
    {
        float _1578 = in.m_58.x;
        _1574 = _1578;
    }
    float _1580 = _1574;
    bool _1582 = !_1564;
    float _1584 = _1582 ? _191 : as_type<float>(_1280);
    float _1586 = trunc(_1566);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    if (_1372)
    {
        bool _1592 = _1530 > 0.5;
        _1576 = _1592;
    }
    bool _1594 = _1576;
    int _1596 = _653 * _1572;
    int _1598 = _1596 + _1264;
    float _1600 = float(uint(_1560));
    bool _1602 = _653 == 0;
    float _1604 = 0.0;
    if (!_1372)
    {
        _1604 = _191;
    }
    float _1606 = _1604;
    float _1608 = as_type<float>(_884) * _1600;
    bool _1610 = !_1602;
    int _1612 = _1610 ? _1598 : (-1);
    float _1614 = _1606;
    if (_1372)
    {
        float _1616 = -_191;
        float _1618 = _1594 ? _1616 : _191;
        _1614 = _1618;
    }
    float _1620 = _1614;
    int _1622 = _1612 & 3;
    bool _1624 = _1622 != 0;
    float _1626 = trunc(_1608);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = ~_653;
    int _1634 = _1632 + 1;
    int _1636 = _1612 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = _1624 ? 0 : 1;
    int _1642 = _1634 * int(_1590);
    int _1644 = _1642 + _1110;
    bool _1646 = uint(_1636) > 1u;
    if (_1534)
    {
        float _1648 = _1580 * 3.1415927410125732421875;
        _1406 = _1648;
    }
    float _1650 = _1406;
    int _1652 = int(_1466) + int(_1552);
    float _1654 = float(uint(_1164));
    float _1656 = _1650;
    if (_1534)
    {
        float _1658 = _1650 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = float(uint(_1644));
    int _1664 = ~_665;
    int _1666 = _1664 + 1;
    float _1668 = as_type<float>(_711) * _1654;
    int _1670 = ~_719;
    int _1672 = _1670 + 1;
    float _1674 = as_type<float>(_705) * _1662;
    int _1676 = ~_1640;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1666 * _1652;
    int _1684 = _1682 + _1402;
    int _1686 = _1680;
    if (!_1646)
    {
        int _1688 = ~_1640;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    int _1694 = _1672 * int(_1630);
    int _1696 = _1694 + _1560;
    float _1698 = -_195;
    int _1700 = _1308 ? as_type<int>(_1698) : as_type<int>(_195);
    float _1702 = trunc(_1668);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    bool _1708 = uint(_1636) >= 2u;
    bool _1710 = uint(_1684) >= uint(_665);
    float _1712 = float(uint(_1696));
    int _1714 = _1708 ? 0 : 1;
    float _1716 = _1660;
    if (_1534)
    {
        float _1718 = _1660 * 6.283185482025146484375;
        float _1720 = sin(_1718);
        _1716 = _1720;
    }
    float _1722 = _1716;
    bool _1724 = _1636 != 3;
    float _1726 = as_type<float>(_884) * _1712;
    bool _1728 = !_1710;
    int _1730 = _1728 ? 0 : (-1);
    int _1732 = ~_665;
    int _1734 = _1732 + 1;
    int _1736 = ~_1652;
    int _1738 = _1736 + _1730;
    int _1740 = _1738 + 1;
    float _1742 = trunc(_1726);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    int _1748 = _665 * _1740;
    int _1750 = _1748 + _1402;
    float _1752 = 0.0;
    bool _1754 = _1724;
    if (!_1534)
    {
        _1752 = _195;
    }
    float _1756 = _1752;
    int _1758 = _1734 * int(_1706);
    int _1760 = _1758 + _1164;
    int _1762 = ~_1714;
    int _1764 = _1762 + 1;
    int _1766 = _1764 + 1;
    float _1768 = trunc(_1674);
    float _1770 = precise::max(_1768, 0.0);
    uint _1772 = uint(_1770);
    int _1774 = _1766;
    float _1776 = _1756;
    if (_1724)
    {
        int _1778 = ~_1714;
        int _1780 = _1778 + 1;
        _1774 = _1780;
    }
    int _1782 = _1774;
    if (_1534)
    {
        bool _1784 = _1722 > 0.5;
        _1754 = _1784;
    }
    bool _1786 = _1754;
    bool _1788 = !_1168;
    int _1790 = _1788 ? _1750 : (-1);
    float _1792 = float(uint(_1760));
    int _1794 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1796 = _1794 != 0;
    if (_1534)
    {
        float _1798 = -_195;
        float _1800 = _1786 ? _1798 : _195;
        _1776 = _1800;
    }
    float _1802 = _1776;
    float _1804 = as_type<float>(_711) * _1792;
    int _1806 = _1790 & 3;
    bool _1808 = _1806 != 0;
    bool _1810 = !_1796;
    float _1812 = _1810 ? _195 : as_type<float>(_1700);
    int _1814 = int(_1630) + int(_1746);
    float _1816 = trunc(_1804);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = ~_653;
    int _1824 = _1822 + 1;
    int _1826 = ~_719;
    int _1828 = _1826 + 1;
    int _1830 = _1790 & 3;
    bool _1832 = _1830 != 0;
    bool _1834 = uint(_1806) > 1u;
    int _1836 = _1828 * _1814;
    int _1838 = _1836 + _1560;
    int _1840 = int(_1590) + int(_1772);
    float _1842 = float(uint(_1480));
    int _1844 = _1832 ? 0 : 1;
    float _1846 = as_type<float>(_884) * _1842;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1850 = _1848 != 0;
    int _1852 = _1824 * _1840;
    int _1854 = _1852 + _1110;
    int _1856 = ~_1844;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    bool _1862 = !_1850;
    int _1864 = _1862 ? 0 : 1;
    float _1866 = trunc(_1846);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    bool _1872 = uint(_1838) >= uint(_719);
    int _1874 = _1860;
    if (!_1834)
    {
        int _1876 = ~_1844;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    bool _1882 = uint(_1854) >= uint(_653);
    bool _1884 = !_1872;
    int _1886 = _1884 ? 0 : (-1);
    bool _1888 = _1806 != 3;
    bool _1890 = !_1882;
    int _1892 = _1890 ? 0 : (-1);
    bool _1894 = uint(_1806) >= 2u;
    int _1896 = ~_1814;
    int _1898 = _1896 + _1886;
    int _1900 = _1898 + 1;
    int _1902 = ~_665;
    int _1904 = _1902 + 1;
    int _1906 = int(_1706) + int(_1820);
    int _1908 = _719 * _1900;
    int _1910 = _1908 + _1560;
    int _1912 = _1894 ? 0 : 1;
    float _1914 = in.m_66.x;
    float _1916 = in.m_66.y;
    float _1918 = in.m_66.z;
    float _1920 = in.m_66.w;
    int _1922 = ~_719;
    int _1924 = _1922 + 1;
    int _1926 = _1904 * _1906;
    int _1928 = _1926 + _1164;
    int _1930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1932 = _1930 != 0;
    int _1934 = ~_1912;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1938;
    int _1942 = _1880;
    if (_1888)
    {
        int _1944 = ~_1912;
        int _1946 = _1944 + 1;
        _1940 = _1946;
    }
    int _1948 = _1940;
    int _1950 = _1924 * int(_1870);
    int _1952 = _1950 + _1480;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1956 = _1954 != 0;
    float _1958 = _820 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1960 = !_1932;
    int _1962 = _1960 ? 0 : 1;
    bool _1964 = uint(_1928) >= uint(_665);
    bool _1966 = !_1430;
    int _1968 = _1966 ? _1910 : (-1);
    bool _1970 = !_1956;
    int _1972 = _1970 ? 0 : 1;
    bool _1974 = !_1964;
    int _1976 = _1974 ? 0 : (-1);
    int _1978 = _1968 & 3;
    bool _1980 = _1978 != 0;
    float _1982 = float(uint(_1952));
    int _1984 = _1968 & 3;
    bool _1986 = _1984 != 0;
    int _1988 = _1980 ? 0 : 1;
    float _1990 = as_type<float>(_884) * _1982;
    bool _1992 = uint(_1984) > 1u;
    int _1994 = ~_1988;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = ~_719;
    int _2002 = _2000 + 1;
    float _2004 = trunc(_1990);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2014 = _1998;
    float _2016 = as_type<float>(_1870);
    if (!_1992)
    {
        int _2018 = ~_1988;
        int _2020 = _2018 + 1;
        _2014 = _2020;
    }
    int _2022 = _2014;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2026 = uint(_1984) >= 2u;
    float _2028 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2012);
    float _2030 = _822 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2032 = _2026 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _2036 = _1984 != 3;
    float _2038 = fma(_2030, -2.0, _2024);
    int _2040 = int(_1870) + int(_2008);
    float _2042 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2028);
    int _2044 = ~as_type<int>(_2032);
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = floor(_866);
    int _2052 = _2002 * _2040;
    int _2054 = _2052 + _1480;
    float _2056 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2038);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2062 = _2048;
    float _2064 = _2032;
    float _2066 = as_type<float>(_2008);
    if (_2036)
    {
        int _2068 = ~as_type<int>(_2032);
        int _2070 = _2068 + 1;
        _2062 = _2070;
    }
    int _2072 = _2062;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2076 = uint(_2054) >= uint(_719);
    float _2078 = _816 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2082 = !_2076;
    int _2084 = _2082 ? 0 : (-1);
    float _2086 = -_2010;
    float _2088 = fma(_2078, 2.0, _2086);
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2092 = _816 > 0.5;
    float _2094 = fma(_1958, -2.0, _2074);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2098 = -_191;
    int _2100 = _2092 ? as_type<int>(_2098) : as_type<int>(_191);
    float _2102 = -_125;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2088);
    bool _2106 = _824 != 1;
    float _2108 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2096);
    float _2110 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2112 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2114 = log2(_2112);
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2118 = -_2034;
    float _2120 = fma(_2110, 2.0, _2118);
    float _2122 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2108);
    float _2124 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2094);
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_2106)
    {
        _2016 = _820;
    }
    float _2128 = _2016;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2132 = 0.0;
    float _2134 = _2128;
    if (!_2106)
    {
        _2132 = _820;
    }
    float _2136 = _2132;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2140 = _2136;
    if (!_2106)
    {
        _2064 = _840;
    }
    float _2142 = _2064;
    float _2144 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2126);
    float _2146 = _2142;
    if (!_2106)
    {
        _2066 = _840;
    }
    float _2148 = _2066;
    float _2150 = _2114 * _125;
    float _2152 = _2148;
    if (_2106)
    {
        _2134 = _816;
    }
    float _2154 = _2134;
    float _2156 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2130);
    if (_2106)
    {
        _2140 = _816;
    }
    float _2158 = _2140;
    float _2160 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2138);
    if (_2106)
    {
        _2146 = _820;
    }
    float _2162 = _2146;
    float _2164 = exp2(_2150);
    if (_2106)
    {
        _2152 = _820;
    }
    float _2166 = _2152;
    float _2168 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2170 = _828 != 2;
    float _2172 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2156);
    float _2174 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2058);
    float _2176 = -_2060;
    float _2178 = fma(_2168, 2.0, _2176);
    float _2180 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2182 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2144);
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2186 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2160);
    float _2188 = fma(_2180, -2.0, _2080);
    float _2190 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2174);
    float _2192 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2184);
    float _2194 = -_125;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2120);
    if (_2170)
    {
        _1408 = _816;
    }
    float _2198 = _1408;
    float _2200 = -_2164;
    float _2202 = _2200 + 1.0;
    float _2204 = _2198;
    if (_2170)
    {
        _1410 = _820;
    }
    float _2206 = _1410;
    float _2208 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2192);
    float _2210 = _2206;
    if (!_2170)
    {
        _2204 = _840;
    }
    float _2212 = _2204;
    float _2214 = -_125;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2178);
    if (!_2170)
    {
        _2210 = _816;
    }
    float _2218 = _2210;
    float _2220 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2188);
    int _2222 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2224 = _2222 != 0;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2230 = !_2224;
    float _2232 = _2230 ? _191 : as_type<float>(_2100);
    float _2234 = -_2090;
    float _2236 = fma(_2226, 2.0, _2234);
    bool _2238 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2246 = _2242 || _2244;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2250 = fma(_2228, -2.0, _2116);
    float _2252 = in.m_68.x;
    float _2254 = in.m_68.y;
    float _2256 = in.m_68.z;
    float _2258 = in.m_68.w;
    float _2260 = _2246 ? _2202 : 0.0;
    float _2262 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2248);
    bool _2264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2266 = isnan(1.0);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2272 = _2268 || _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2276 = 1.0 + _2274;
    float _2278 = in.m_46.x;
    float _2280 = in.m_46.y;
    float _2282 = in.m_46.z;
    float _2284 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2262);
    float _2286 = -_125;
    float _2288 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2236);
    float _2290 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2250);
    float _2292 = in.m_70.x;
    float _2294 = in.m_70.y;
    float _2296 = in.m_70.z;
    float _2298 = in.m_70.w;
    float _2300 = 1.0 / _2276;
    float _2302 = -_2122;
    float _2304 = _2302 + 1.0;
    float _2306 = -_2182;
    float _2308 = _2306 + 1.0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2318 = ~_1906;
    int _2320 = _2318 + _1976;
    int _2322 = _2320 + 1;
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2326 = _2324 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2328 = abs(_1948);
    float _2330 = 1.0 / _2312;
    float _2332 = -_2284;
    float _2334 = _2332 + 1.0;
    int _2336 = ~_1840;
    int _2338 = _2336 + _1892;
    int _2340 = _2338 + 1;
    float _2342 = -_2208;
    float _2344 = _2342 + 1.0;
    if (_2272)
    {
        float _2346 = _2260 * _2300;
        _135 = _2346;
    }
    float _2348 = _135;
    bool _2350 = _2050 >= 0.0;
    bool _2352 = isnan(_2050);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(0.0);
    bool _2358 = _2354 || _2356;
    float _2360 = _820 * 2.0;
    float _2362 = _2280 * _1916;
    float _2364 = _2280 * _2254;
    float _2366 = 1.0 / _2316;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2372 = _2280 * _2294;
    int _2374 = _2358 ? 0 : 1;
    float _2376 = fma(_2278, _1914, _2362);
    bool _2378 = _2050 > 0.0;
    float _2380 = fma(_2278, _2292, _2372);
    float _2382 = floor(_2360);
    float _2384 = fma(_2278, _2252, _2364);
    float _2386 = fma(_2282, _2296, _2380);
    int _2388 = ~_2374;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2398 = fma(_2282, _1918, _2376);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2400;
    float _2404 = 1.0 / _2326;
    float _2406 = fma(_2282, _2256, _2384);
    int _2408 = _2392;
    if (!_2378)
    {
        int _2410 = ~_2374;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2418 = _2416 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2420 = _840 * 2.0;
    float _2422 = _2418 * _2330;
    float _2424 = 1.0 / _2396;
    bool _2426 = _2382 >= 0.0;
    bool _2428 = isnan(_2382);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan(0.0);
    bool _2434 = _2430 || _2432;
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2438 = _2436 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2440;
    float _2444 = _2402 * _2366;
    int _2446 = _2434 ? 0 : 1;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2452 = _2382 > 0.0;
    float _2454 = floor(_2420);
    float _2456 = _2442 * _2404;
    int _2458 = _665 * _2322;
    int _2460 = _2458 + _1164;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2464 = _635 + _2462;
    int _2466 = ~_2446;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2472;
    float _2476 = 1.0 / _2438;
    bool _2478 = !_1168;
    int _2480 = _2478 ? _2460 : (-1);
    float _2482 = fma(_2444, _2464, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2484 = _2474 * _2424;
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2486;
    int _2490 = _2470;
    if (!_2452)
    {
        int _2492 = ~_2446;
        int _2494 = _2492 + 1;
        _2490 = _2494;
    }
    int _2496 = _2490;
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2500 = _635 + _2498;
    bool _2502 = !_1638;
    int _2504 = _2502 ? 0 : 1;
    float _2506 = 1.0 / _2370;
    bool _2508 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2510 = isnan(_635);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    float _2520 = fma(_2456, _2500, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2528 = _2526 != 0;
    int _2530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2532 = _2530 != 0;
    float _2534 = fma(_2484, _888, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2536 = _2454 >= 0.0;
    bool _2538 = isnan(_2454);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan(0.0);
    bool _2544 = _2540 || _2542;
    float _2546 = _2398 + _1920;
    bool _2548 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2550 = isnan(_635);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = _2488 * _2476;
    float _2562 = -_2518;
    float _2564 = _2562 + 1.0;
    int _2566 = _2544 ? 0 : 1;
    float _2568 = _2386 + _2298;
    bool _2570 = _2454 > 0.0;
    float _2572 = _2558 * _2564;
    bool _2574 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2576 = isnan(_635);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2582 = _2578 || _2580;
    float _2584 = float(_2582);
    float _2586 = _2406 + _2258;
    float _2588 = _2450 * _2506;
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2594 = -_2558;
    float _2596 = _2594 + 1.0;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2600 = _635 + _2598;
    bool _2602 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2604 = isnan(_635);
    bool _2606 = _2602 || _2604;
    bool _2608 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2610 = _2606 || _2608;
    float _2612 = float(_2610);
    float _2614 = -_2584;
    float _2616 = _2614 + 1.0;
    float _2618 = _2584 * _2596;
    float _2620 = fma(_2422, _2600, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2622 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2624 = isnan(_635);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = _2612 * _2616;
    float _2636 = -_2612;
    float _2638 = _2636 + 1.0;
    bool _2640 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2642 = isnan(_635);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2648 = _2644 || _2646;
    float _2650 = float(_2648);
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2654 = _635 + _2652;
    float _2656 = -_2632;
    float _2658 = _2656 + 1.0;
    float _2660 = _2632 * _2638;
    float _2662 = fma(_2588, _2654, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2664 = _2650 * _2658;
    bool _2666 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2668 = isnan(_635);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = -_2650;
    float _2680 = _2678 + 1.0;
    int _2682 = _1790 >> 31;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2688 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2690 = isnan(_635);
    bool _2692 = _2688 || _2690;
    bool _2694 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2696 = _2692 || _2694;
    float _2698 = float(_2696);
    float _2700 = _2676 * _2680;
    int _2702 = _2682 & 3;
    float _2704 = -_2676;
    float _2706 = _2704 + 1.0;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _635 + _2708;
    float _2712 = 1.0 / _2686;
    int _2714 = _1790 + _2702;
    float _2716 = _2698 * _2706;
    float _2718 = -_2698;
    float _2720 = _2718 + 1.0;
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2724 = _635 + _2722;
    int _2726 = _2714 >> 2;
    float _2728 = _2482 * _2716;
    int _2730 = ~_2566;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    float _2736 = _820 + _816;
    int _2738 = _2726 << 4;
    int _2740 = _2738 + 656;
    float _2742 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2728);
    int _2744 = _2734;
    float _2746 = _2618;
    float _2748 = _2568;
    if (!_2570)
    {
        int _2750 = ~_2566;
        int _2752 = _2750 + 1;
        _2744 = _2752;
    }
    int _2754 = _2744;
    float _2756 = fma(_2560, _2724, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    uint _2758 = uint(int(uint(_2740) >> uint(2)));
    uint _2760 = uint(int(uint(int(_2758)) >> uint(2)));
    int _2762 = int(_2758) & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = int(_2758) + 1;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    int _2770 = _2766 & 3;
    float _2772 = (*spvDescriptorSet0.vp_c9)._m0[int(_2768)][_2770];
    float _2774 = fma(_2620, _2700, _2742);
    float _2776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2778 = _2546 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2782 = _2586 + _2780;
    bool _2784 = !_1808;
    int _2786 = _2784 ? 0 : 1;
    float _2788 = fma(_2520, _2664, _2774);
    float _2790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2792 = _2568 + _2790;
    float _2794 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2796 = _1806 != 3;
    float _2798 = _816 + _840;
    float _2800 = _816 + (-0.5);
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2794);
    float _2804 = _2592 * _2712;
    float _2806 = fma(_2662, _2660, _2788);
    float _2808 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2802);
    float _2810 = fma(_2804, _2710, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2812 = _2740 + 8;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    bool _2830 = !_2796;
    int _2832 = _2830 ? 0 : (-1);
    float _2834 = _820 + _840;
    bool _2836 = _2808 >= 0.0;
    float _2838 = _820 + (-0.5);
    float _2840 = _2736 + (-1.0);
    float _2842 = _1620 + 0.5;
    float _2844 = fma(_2534, _2634, _2806);
    float _2846 = _1802 + (-0.5);
    float _2848 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2850 = fma(_2842, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2196);
    float _2852 = fma(_2810, _2618, _2844);
    int _2854 = abs(_1880);
    float _2856 = -_2846;
    float _2858 = -_2056;
    float _2860 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2858);
    float _2862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2864 = _2232 + 0.5;
    if (_2836)
    {
        _2746 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2866 = _2746;
    float _2868 = _1812 + (-0.5);
    int _2870 = ~_2854;
    int _2872 = _2870 + 1;
    int _2874 = _2872 + 1;
    float _2876 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2104);
    int _2878 = abs(_2786);
    float _2880 = -_2868;
    float _2882 = -_2124;
    float _2884 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2882);
    if (_2836)
    {
        float _2886 = _2866 * 5.0;
        _1942 = as_type<int>(_2886);
    }
    int _2888 = _1942;
    float _2890 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2892 = int(_2890);
    float _2894 = fma(_2756, _2572, _2852);
    float _2896 = -_2304;
    float _2898 = fma(_2896, _1620, _2850);
    float _2900 = -_2042;
    float _2902 = _2900 + 1.0;
    if (_2836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9012 = as_type<float>(_2888);
        out.gl_Position.z = _9012;
    }
    float _2904 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2894);
    float _2906 = _2862 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2908 = _2874 * as_type<int>(_2772);
    float _2910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2912 = fma(_2902, _1802, _2860);
    float _2914 = _2778 * _2778;
    int _2916 = ~_2878;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    float _2922 = _1316 + (-0.5);
    bool _2924 = !_2524;
    int _2926 = _2924 ? 0 : 1;
    out.m_72.x = _2898;
    out.m_72.y = _2912;
    float _2928 = _1584 + 0.5;
    int _2930 = _2920 * as_type<int>(_2764);
    int _2932 = _2930 + _2908;
    float _2934 = fma(_2792, _2792, _2914);
    int _2936 = ~_2328;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = fma(_2906, _2928, _2216);
    int _2944 = abs(_2832);
    float _2946 = fma(_2782, _2782, _2934);
    int _2948 = abs(_2892);
    int _2950 = _2940 * as_type<int>(_2820);
    int _2952 = _2950 + _2932;
    float _2954 = float(uint(_2892));
    int _2956 = _653 * _2340;
    int _2958 = _2956 + _1110;
    int _2960 = abs(_1962);
    float _2962 = _2910 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2964 = ~_2944;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    out.m_74.x = _2904;
    float _2970 = 1.0 / _2954;
    int _2972 = ~_2960;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = -_2962;
    float _2980 = -_2220;
    float _2982 = fma(_2978, _2922, _2980);
    int _2984 = _2968 * as_type<int>(_2828);
    int _2986 = _2984 + _2952;
    float _2988 = float(uint(_2948));
    float _2990 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2992 = ~_2892;
    int _2994 = _2992 + 1;
    int _2996 = _2986 * _2976;
    int _2998 = _1968 >> 31;
    float _3000 = rsqrt(_2946);
    float _3002 = float(_2754);
    int _3004 = _2480 * _2960;
    int _3006 = _3004 + _2996;
    int _3008 = _1612 >> 31;
    if (_2836)
    {
        out.m_53.x = 0.0;
    }
    int _3010 = abs(_1692);
    int _3012 = _3008 & 3;
    float _3014 = 1.0 / _2988;
    int _3016 = _2998 & 3;
    int _3018 = as_type<int>(_2970) + (-2);
    float _3020 = float(uint(_3006));
    int _3022 = _1612 + _3012;
    float _3024 = _2990 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3026 = _1968 + _3016;
    float _3028 = as_type<float>(_3018) * _3020;
    int _3030 = _3022 >> 2;
    float _3032 = _3024 * _3000;
    int _3034 = _3026 >> 2;
    float _3036 = trunc(_3028);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    int _3042 = abs(_3006);
    float _3044 = _2778 * _3032;
    int _3046 = as_type<int>(_3014) + (-2);
    float _3048 = _2792 * _3032;
    int _3050 = _3030 << 4;
    int _3052 = _3050 + 368;
    float _3054 = -_3044;
    float _3056 = _2778 + _3054;
    int _3058 = _3034 << 4;
    int _3060 = _3058 + 800;
    float _3062 = in.m_76.x;
    float _3064 = in.m_76.y;
    float _3066 = in.m_76.z;
    float _3068 = float(uint(_3042));
    float _3070 = -_3048;
    float _3072 = _2792 + _3070;
    int _3074 = abs(_2926);
    float _3076 = _3056 * _3056;
    uint _3078 = uint(int(uint(_3060) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    float _3094 = as_type<float>(_3046) * _3068;
    float _3096 = float(_3074);
    int _3098 = _2994 * int(_3040);
    int _3100 = _3098 + _3006;
    float _3102 = fma(_3072, _3072, _3076);
    int _3104 = abs(_2022);
    float _3106 = _3096 * _3002;
    float _3108 = float(uint(_3100));
    uint _3110 = uint(int(uint(_3052) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    float _3126 = -_2172;
    float _3128 = _3126 + 1.0;
    float _3130 = _2782 * _3032;
    float _3132 = -_2334;
    float _3134 = fma(_1584, _3132, _2942);
    float _3136 = as_type<float>(_3018) * _3108;
    float _3138 = -_2308;
    float _3140 = fma(_2232, _3138, _2876);
    float _3142 = -_2190;
    float _3144 = _3142 + 1.0;
    float _3146 = trunc(_3094);
    float _3148 = precise::max(_3146, 0.0);
    uint _3150 = uint(_3148);
    float _3152 = fma(_1812, _3128, _2884);
    float _3154 = -_3130;
    float _3156 = _2782 + _3154;
    float _3158 = fma(_1316, _3144, _2982);
    int _3160 = ~_2948;
    int _3162 = _3160 + 1;
    float _3164 = _3106 * (-2.0);
    float _3166 = fma(_3156, _3156, _3102);
    int _3168 = ~_3104;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    out.m_78.x = _3140;
    out.m_78.y = _3152;
    out.m_78.z = _3134;
    out.m_78.w = _3158;
    float _3174 = fma(_3164, _3062, _3062);
    float _3176 = trunc(_3136);
    float _3178 = precise::max(_3176, 0.0);
    uint _3180 = uint(_3178);
    float _3182 = fma(_2848, _3164, _2848);
    int _3184 = abs(_2504);
    float _3186 = fma(_2800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3174);
    int _3188 = ~_2040;
    int _3190 = _3188 + _2084;
    int _3192 = _3190 + 1;
    int _3194 = _3052 + 8;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    uint _3198 = uint(int(uint(int(_3196)) >> uint(2)));
    int _3200 = int(_3196) & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    int _3204 = int(_3196) + 1;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    int _3208 = _3204 & 3;
    float _3210 = (*spvDescriptorSet0.vp_c9)._m0[int(_3206)][_3208];
    int _3212 = _3162 * int(_3150);
    int _3214 = _3212 + _3042;
    int _3216 = abs(_1864);
    float _3218 = fma(_3182, _2348, _3186);
    int _3220 = _719 * _3192;
    int _3222 = _3220 + _1480;
    int _3224 = abs(_1972);
    float _3226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3228 = float(uint(_3214));
    int _3230 = _3060 + 8;
    uint _3232 = uint(int(uint(_3230) >> uint(2)));
    uint _3234 = uint(int(uint(int(_3232)) >> uint(2)));
    int _3236 = int(_3232) & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = int(_3232) + 1;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    int _3244 = _3240 & 3;
    float _3246 = (*spvDescriptorSet0.vp_c9)._m0[int(_3242)][_3244];
    bool _3248 = !_1986;
    int _3250 = _3248 ? 0 : 1;
    int _3252 = int(_3040) + int(_3180);
    float _3254 = as_type<float>(_3046) * _3228;
    int _3256 = ~_2892;
    int _3258 = _3256 + 1;
    int _3260 = ~_3010;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    float _3266 = trunc(_3254);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    bool _3272 = _1636 != 3;
    int _3274 = _3258 * _3252;
    int _3276 = _3274 + _3006;
    bool _3278 = _653 == 0;
    int _3280 = _3172 * as_type<int>(_3092);
    int _3282 = abs(_3250);
    int _3284 = _3264 * as_type<int>(_3124);
    bool _3286 = !_3272;
    int _3288 = _3286 ? 0 : (-1);
    float _3290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3292 = uint(_3276) >= uint(_2892);
    int _3294 = ~_2948;
    int _3296 = _3294 + 1;
    int _3298 = ~_3184;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    int _3304 = int(_3150) + int(_3270);
    bool _3306 = !_3292;
    int _3308 = _3306 ? 0 : (-1);
    int _3310 = _3302 * as_type<int>(_3116);
    int _3312 = _3310 + _3284;
    int _3314 = ~_3282;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = _3296 * _3304;
    int _3322 = _3320 + _3042;
    int _3324 = ~_3252;
    int _3326 = _3324 + _3308;
    int _3328 = _3326 + 1;
    bool _3330 = _1984 != 3;
    int _3332 = _3318 * as_type<int>(_3084);
    int _3334 = _3332 + _3280;
    int _3336 = abs(_2072);
    int _3338 = _2892 * _3328;
    int _3340 = _3338 + _3006;
    bool _3342 = !_3330;
    int _3344 = _3342 ? 0 : (-1);
    bool _3346 = uint(_3322) >= uint(_2948);
    int _3348 = ~_3336;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3006 ^ _2892;
    int _3356 = abs(_1782);
    int _3358 = _3352 * as_type<int>(_3238);
    int _3360 = _3358 + _3334;
    bool _3362 = !_3346;
    int _3364 = _3362 ? 0 : (-1);
    uint _3366 = uint(int(uint(_3354) >> uint(31)));
    int _3368 = ~_3356;
    int _3370 = _3368 + 1;
    int _3372 = _3370 + 1;
    int _3374 = abs(_3288);
    int _3376 = ~_3364;
    int _3378 = _3304 + _3376;
    int _3380 = _3378 + 1;
    int _3382 = _3372 * as_type<int>(_3202);
    int _3384 = _3382 + _3312;
    int _3386 = ~int(_3366);
    int _3388 = _3386 + 1;
    int _3390 = abs(_3344);
    int _3392 = ~_3374;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    bool _3398 = _2892 == 0;
    int _3400 = _3380 ^ _3388;
    int _3402 = _3396 * as_type<int>(_3210);
    int _3404 = _3402 + _3384;
    int _3406 = ~_3390;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = _3226 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3414 = ~_3216;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    bool _3420 = !_3398;
    int _3422 = _3420 ? _3340 : (-1);
    int _3424 = _3410 * as_type<int>(_3246);
    int _3426 = _3424 + _3360;
    bool _3428 = _2892 == 0;
    int _3430 = _3404 * _3418;
    int _3432 = ~_3388;
    int _3434 = _3432 + _3400;
    int _3436 = _3434 + 1;
    float _3438 = _3290 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3440 = ~_3224;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    bool _3446 = !_3428;
    int _3448 = _3446 ? _3436 : (-1);
    bool _3450 = !_3278;
    int _3452 = _3450 ? _2958 : (-1);
    int _3454 = _3426 * _3444;
    float _3456 = float(_3448);
    float _3458 = float(_3422);
    int _3460 = _3452 * _3216;
    int _3462 = _3460 + _3430;
    bool _3464 = !_2528;
    int _3466 = _3464 ? 0 : 1;
    float _3468 = -_2290;
    float _3470 = fma(_3412, _3456, _3468);
    bool _3472 = !_1430;
    int _3474 = _3472 ? _3222 : (-1);
    float _3476 = fma(_3438, _3458, _2288);
    float _3478 = _1002 + 0.5;
    int _3480 = abs(_3466);
    float _3482 = _994 + (-0.5);
    int _3484 = _3474 * _3224;
    int _3486 = _3484 + _3454;
    float _3488 = fma(_3438, _3478, _3476);
    float _3490 = -_3412;
    float _3492 = fma(_3490, _3482, _3470);
    float _3494 = -_2186;
    float _3496 = _3494 + 1.0;
    float _3498 = -_2344;
    float _3500 = fma(_1002, _3498, _3488);
    float _3502 = float(_3462);
    float _3504 = float(_3486);
    float _3506 = fma(_994, _3496, _3492);
    float _3508 = float(_2414);
    out.m_80.x = _3502;
    float _3510 = float(_3480);
    out.m_80.w = _3504;
    bool _3512 = !_2532;
    int _3514 = _3512 ? 0 : 1;
    float _3516 = _3510 * _3508;
    out.m_82.x = _3500;
    out.m_82.y = _3506;
    float _3518 = _3290;
    if (_2836)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3520 = -_3044;
    float _3522 = _2546 + _3520;
    float _3524 = -_3048;
    float _3526 = _2568 + _3524;
    float _3528 = float(_2496);
    float _3530 = _2834 + (-1.0);
    float _3532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3534 = _3522 + _3532;
    int _3536 = abs(_3514);
    float _3538 = -_3130;
    float _3540 = _2586 + _3538;
    float _3542 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3544 = _3526 + _3542;
    float _3546 = _3534 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3548 = fma(_3530, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3552 = _3540 + _3550;
    float _3554 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3546);
    float _3556 = float(_3536);
    float _3558 = _3516 * (-2.0);
    float _3560 = _3218 * 0.15915493667125701904296875;
    float _3562 = fma(_3552, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3554);
    float _3564 = _2798 + (-1.0);
    float _3566 = fma(_3558, _3064, _3064);
    float _3568 = fma(_3548, _3558, _3548);
    float _3570 = _3556 * _3528;
    bool _3572 = _3562 >= 0.0;
    float _3574 = fma(_2838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3566);
    float _3576 = sqrt(_3166);
    float _3578 = _3570 * (-2.0);
    float _3580 = fma(_3564, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3582 = fma(_3568, _2348, _3574);
    float _3584 = _840 + (-0.5);
    float _3586 = fma(_3578, _3066, _3066);
    float _3588 = fma(_3580, _3578, _3580);
    float _3590 = _3582 * 0.15915493667125701904296875;
    float _3592 = _3560 * 6.283185482025146484375;
    float _3594 = sin(_3592);
    float _3596 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3586);
    float _3598 = _3526;
    if (_3572)
    {
        _3518 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3600 = _3518;
    int _3602 = as_type<int>(_3600);
    if (_3572)
    {
        out.m_53.x = 0.0;
    }
    float _3604 = fma(_3588, _2348, _3596);
    float _3606 = _3560 * 6.283185482025146484375;
    float _3608 = cos(_3606);
    if (_3572)
    {
        float _3610 = _3600 * 5.0;
        _3602 = as_type<int>(_3610);
    }
    int _3612 = _3602;
    float _3614 = _3604 * 0.15915493667125701904296875;
    if (_3572)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10039 = as_type<float>(_3612);
        out.gl_Position.z = _10039;
    }
    float _3616 = _3590 * 6.283185482025146484375;
    float _3618 = sin(_3616);
    float _3620 = _3590 * 6.283185482025146484375;
    float _3622 = cos(_3620);
    if (_3572)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3624 = _3614 * 6.283185482025146484375;
    float _3626 = cos(_3624);
    float _3628 = _3000 * _3576;
    float _3630 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _3634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _3636 = _2990 * _3628;
    float _3638 = _3628 * _3630;
    float _3640 = _3608 * _3622;
    float _3642 = _3614 * 6.283185482025146484375;
    float _3644 = sin(_3642);
    float _3646 = _3608 * _3618;
    float _3648 = _3632 * _3638;
    float _3650 = _3594 * _3618;
    float _3652 = _3594 * _3622;
    float _3654 = _3634 * _3636;
    float _3656 = _3628 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3658 = _3656 * 0.5;
    float _3660 = _3522 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3662 = _3608 * _3626;
    float _3664 = _3622 * _3626;
    float _3666 = _3594 * _3626;
    float _3668 = _3618 * _3626;
    float _3670 = _3662 * _3648;
    bool _3672 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3674 = isnan(0.5);
    bool _3676 = _3672 || _3674;
    bool _3678 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3680 = _3676 || _3678;
    float _3682 = fma(_3644, _3640, _3650);
    float _3684 = -_3652;
    float _3686 = fma(_3644, _3646, _3684);
    float _3688 = -_3648;
    float _3690 = _3644 * _3688;
    float _3692 = -_3646;
    float _3694 = fma(_3644, _3652, _3692);
    float _3696 = fma(_3682, _3654, _3670);
    float _3698 = _3666 * _3648;
    float _3700 = fma(_3664, _3654, _3690);
    bool _3702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3704 = isnan(0.5);
    bool _3706 = _3702 || _3704;
    bool _3708 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3710 = _3706 || _3708;
    float _3712 = fma(_3686, _3658, _3696);
    float _3714 = fma(_3644, _3650, _3640);
    float _3716 = fma(_3694, _3654, _3698);
    float _3718 = fma(_3668, _3658, _3700);
    float _3720 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3722 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3724 = fma(_3714, _3658, _3716);
    float _3726 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3720);
    float _3728 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3722);
    float _3730 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3660);
    float _3732 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3726);
    float _3734 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3728);
    float _3736 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3730);
    float _3738 = _3732 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3740 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3742 = _3736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3744 = _2586 + _3738;
    float _3746 = _2568 + _3740;
    float _3748 = _3522 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3750 = 1.0 / _3742;
    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3754 = _3744 + _3752;
    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3758 = _3746 + _3756;
    float _3760 = _3754 * _3754;
    float _3762 = fma(_3758, _3758, _3760);
    float _3764 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3748);
    float _3766 = sqrt(_3762);
    float _3768 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3764);
    float _3770 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3772 = _3770 + _3742;
    float _3774 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3776 = _3772 * _3750;
    float _3778 = _3776 * 0.5;
    float _3780 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3774);
    bool _3782 = _3766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3786 = fma(_3778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3784);
    float _3788 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3780);
    float _3790 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3792 = 1.0 / _3786;
    float _3794 = _2546 + _3790;
    float _3796 = _3790;
    float _3798 = _3774;
    float _3800 = _3772;
    float _3802 = _3724;
    float _3804 = _3750;
    float _3806 = _3762;
    if (!_3782)
    {
        _3796 = _3746;
    }
    float _3808 = _3796;
    float _3810 = _3808;
    if (!_3782)
    {
        _3798 = _3744;
    }
    float _3812 = _3798;
    float _3814 = _3812;
    if (!_3782)
    {
        _3800 = _3794;
    }
    float _3816 = _3800;
    bool _3818 = !_3782;
    float _3820 = _3816;
    float _3822 = _3792;
    if (!_3818)
    {
        float _3824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3828 = _3766 + _3826;
        float _3830 = rsqrt(_3762);
        float _3832 = _3828 * _3824;
        float _3834 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3836 = _3832 * 0.15915493667125701904296875;
        float _3838 = _3836 * 6.283185482025146484375;
        float _3840 = sin(_3838);
        float _3842 = _3836 * 6.283185482025146484375;
        float _3844 = cos(_3842);
        float _3846 = fma(_3840, _3834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3848 = _3830 * _3846;
        float _3850 = _3844 + (-1.0);
        float _3852 = fma(_3758, _3848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3854 = fma(_3754, _3848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3856 = _3850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3858 = fma(_3794, _3844, _3856);
        _3820 = _3858;
        _3810 = _3852;
        _3814 = _3854;
        _3802 = _3850;
    }
    float _3860 = _3820;
    float _3862 = _3810;
    float _3864 = _3814;
    float _3866 = _3802;
    float _3868 = -_3044;
    float _3870 = _3868 + _3860;
    float _3872 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3874 = _3792 * _3872;
    float _3876 = -_3048;
    float _3878 = _3876 + _3862;
    float _3880 = -_3130;
    float _3882 = _3880 + _3864;
    float _3884 = _3878;
    float _3886 = _3882;
    float _3888 = _3866;
    if (_3710)
    {
        _3804 = 1.0;
    }
    float _3890 = _3804;
    float _3892 = _3890;
    if (_3680)
    {
        _3822 = _3870;
    }
    float _3894 = _3822;
    float _3896 = _3894;
    if (!_3680)
    {
        float _3898 = _3534 * _3534;
        float _3900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3902 = -_2586;
        float _3904 = _3902 + _3864;
        float _3906 = -_2546;
        float _3908 = _3906 + _3860;
        float _3910 = fma(_3544, _3544, _3898);
        float _3912 = -_2568;
        float _3914 = _3912 + _3862;
        float _3916 = fma(_3552, _3552, _3910);
        float _3918 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3920 = sqrt(_3916);
        float _3922 = 1.0 / _3628;
        float _3924 = _3918 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3926 = precise::min(_3920, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3928 = _3926 * _3900;
        float _3930 = _3928 * _3922;
        float _3932 = _3924 * _3930;
        float _3934 = _3904 * _3930;
        float _3936 = fma(_3908, _3932, _3522);
        float _3938 = fma(_3914, _3932, _3526);
        float _3940 = fma(_3924, _3934, _3540);
        _3896 = _3936;
        _3884 = _3938;
        _3886 = _3940;
        _3888 = _3922;
    }
    float _3942 = _3896;
    float _3944 = _3884;
    float _3946 = _3886;
    float _3948 = _3888;
    float _3950 = _3948;
    if (!_3710)
    {
        float _3952 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3954 = _3952 * 0.15915493667125701904296875;
        float _3956 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3958 = _3954 * 6.283185482025146484375;
        float _3960 = cos(_3958);
        float _3962 = _3956 * 0.15915493667125701904296875;
        float _3964 = _3954 * 6.283185482025146484375;
        float _3966 = sin(_3964);
        float _3968 = 1.0 / _3960;
        float _3970 = _3962 * 6.283185482025146484375;
        float _3972 = cos(_3970);
        float _3974 = _3966 * _3968;
        float _3976 = _3962 * 6.283185482025146484375;
        float _3978 = sin(_3976);
        float _3980 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3982 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3980;
        float _3984 = _3972 * _3974;
        float _3986 = 1.0 / _3984;
        float _3988 = 1.0 / _3982;
        float _3990 = _3978 * _3986;
        float _3992 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3994 = fma(_3874, _3990, _3992);
        float _3996 = _3994 * _3988;
        float _3998 = precise::clamp(_3996, 0.0, 1.0);
        _3950 = _3954;
        _3892 = _3998;
    }
    float _4000 = _3950;
    float _4002 = _3892;
    float _4004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4006 = _3942 + _4004;
    float _4008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4010 = _3944 + _4008;
    float _4012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4014 = _3946 + _4012;
    float _4016 = _4006 * _4006;
    float _4018 = fma(_4010, _4010, _4016);
    float _4020 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4022 = fma(_4014, _4014, _4018);
    float _4024 = rsqrt(_4022);
    float _4026 = sqrt(_4022);
    float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4030 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4032 = _4010 * _4028;
    float _4034 = _4014 * _4028;
    float _4036 = _4032 * _4032;
    float _4038 = _4034 * _4034;
    float _4040 = _4036 + _4038;
    float _4042 = sqrt(_4040);
    bool _4044 = _4042 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4048 = _4042 + _4046;
    float _4050 = _4014;
    float _4052 = _4040;
    float _4054 = _4048;
    float _4056 = _4006;
    if (_4044)
    {
        float _4058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4050 = _4058;
    }
    float _4060 = _4050;
    if (!_4044)
    {
        _3598 = _4038;
    }
    float _4062 = _3598;
    float _4064 = _4062;
    if (_4044)
    {
        float _4066 = rsqrt(_4040);
        _4052 = _4066;
    }
    float _4068 = _4052;
    float _4070 = _4068;
    if (_4044)
    {
        float _4072 = _4048 * _4060;
        _4054 = _4072;
    }
    float _4074 = _4054;
    if (_4044)
    {
        float _4076 = _4074 * 0.15915493667125701904296875;
        _2748 = _4076;
    }
    float _4078 = _2748;
    float _4080 = _4024;
    if (_4044)
    {
        float _4082 = _4078 * 6.283185482025146484375;
        float _4084 = sin(_4082);
        _4080 = _4084;
    }
    float _4086 = _4080;
    float _4088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4090 = precise::max(0.0, _4088);
    float _4092 = _4000;
    float _4094 = _4090;
    float _4096 = _4088;
    if (_4044)
    {
        float _4098 = _4078 * 6.283185482025146484375;
        float _4100 = cos(_4098);
        _4092 = _4100;
    }
    float _4102 = _4092;
    float _4104 = -_4028;
    float _4106 = -_4090;
    float _4108 = fma(_4006, _4104, _4106);
    if (!_4044)
    {
        _4094 = _4032;
    }
    float _4110 = _4094;
    float _4112 = _4110;
    if (_4044)
    {
        float _4114 = _4108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4096 = _4114;
    }
    float _4116 = _4096;
    float _4118 = floor(_4020);
    float _4120 = _4086;
    float _4122 = _4116;
    if (_4044)
    {
        float _4124 = fma(_4086, _4116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4056 = _4124;
    }
    float _4126 = _4056;
    float _4128 = _4126;
    if (!_4044)
    {
        _4120 = _4036;
    }
    float _4130 = _4120;
    float _4132 = _4130;
    if (_4044)
    {
        float _4134 = _4102 + (-1.0);
        _4122 = _4134;
    }
    float _4136 = _4122;
    float _4138 = _4136;
    if (_4044)
    {
        float _4140 = _4068 * _4126;
        _3806 = _4140;
    }
    float _4142 = _3806;
    if (!_4044)
    {
        _4128 = _4108;
    }
    float _4144 = _4128;
    float _4146 = _4144;
    if (_4044)
    {
        float _4148 = _4136 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4070 = _4148;
    }
    float _4150 = _4070;
    if (_4044)
    {
        float _4152 = _4032 * _4142;
        _4112 = _4152;
    }
    float _4154 = _4112;
    if (!_4044)
    {
        _4138 = _4034;
    }
    float _4156 = _4138;
    float _4158 = _4156;
    if (_4044)
    {
        float _4160 = _4034 * _4142;
        _4158 = _4160;
    }
    float _4162 = _4158;
    if (_4044)
    {
        float _4164 = fma(_4108, _4102, _4150);
        _4146 = _4164;
    }
    float _4166 = _4146;
    if (_4044)
    {
        float _4168 = _4154 * _4154;
        _4132 = _4168;
    }
    float _4170 = _4132;
    if (_4044)
    {
        float _4172 = _4162 * _4162;
        _4064 = _4172;
    }
    float _4174 = _4064;
    float _4176 = fma(_4166, _4166, _4170);
    float _4178 = _4176 + _4174;
    float _4180 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4030);
    float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4184 = fma(_4026, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4182);
    float _4186 = precise::clamp(_4184, 0.0, 1.0);
    float _4188 = rsqrt(_4178);
    float _4190 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4180);
    float _4192 = -_4186;
    float _4194 = _4192 + 1.0;
    float _4196 = _4190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4198 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4200 = fma(_3540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4202 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4204 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4206 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4208 = abs(_4194);
    float _4210 = log2(_4208);
    float _4212 = -_4204;
    float _4214 = fma(_4212, _4198, 1.0);
    float _4216 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4218 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4202);
    float _4220 = _4188 * _4154;
    float _4222 = _4188 * _4166;
    float _4224 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4216);
    float _4226 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4218);
    float _4228 = _4188 * _4162;
    float _4230 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4232 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4224);
    float _4234 = _4226 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4236 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4206);
    float _4238 = -_4230;
    float _4240 = fma(_4222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4238);
    float _4242 = _4232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4244 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4246 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4236);
    float _4248 = -_4228;
    float _4250 = fma(_4248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4240);
    float _4252 = floor(_4200);
    float _4254 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4244);
    float _4256 = _4246 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4258 = fma(_4250, -0.5, 0.5);
    float _4260 = _4210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4262 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4254);
    float _4264 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4266 = log2(_4214);
    float _4268 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4262);
    float _4270 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4264);
    float _4272 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4270);
    float _4274 = 1.0 / _4268;
    float _4276 = -_4118;
    float _4278 = _4020 + _4276;
    float _4280 = fma(_4250, 0.5, 0.5);
    float _4282 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4284 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4272);
    float _4286 = -_4252;
    float _4288 = _4200 + _4286;
    float _4290 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4282);
    float _4292 = sqrt(_4258);
    float _4294 = fma(_4280, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4296 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4290);
    float _4298 = fma(_4280, _4294, -0.212114393711090087890625);
    float _4300 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4296);
    float _4302 = exp2(_4260);
    float _4304 = _4266 * 0.693147182464599609375;
    float _4306 = _4284 * _4274;
    float _4308 = _4300 * _4274;
    float2 _11154 = float2(_4278, _4288);
    float _4310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11154, float2(0.0), isnan(_11154)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11154, float2(0.0), isnan(_11154)), level(0.0)).x;
    float _4312 = fma(_4280, _4298, 1.570728778839111328125);
    float _4314 = _4304 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4316 = fma(_4306, 0.5, 0.5);
    float _4318 = _4292 * 0.636619746685028076171875;
    float _4320 = _4222 + 1.0;
    float _4322 = fma(_4308, -0.5, 0.5);
    float _4324 = -_4312;
    float _4326 = fma(_4318, _4324, 1.0);
    float _4328 = -_4222;
    float _4330 = fma(_4302, _4320, _4328);
    float3 _11193 = float3(_4316, _4322, _4314);
    float _4332 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11193, float3(0.0), isnan(_11193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11193, float3(0.0), isnan(_11193)), level(0.0)).x;
    float _4334 = fma(_4330, 0.5, 0.5);
    float3 _11206 = float3(_4316, _4322, _4314);
    float4 _4337 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11206, float3(0.0), isnan(_11206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11206, float3(0.0), isnan(_11206)), level(0.0)).xyzw;
    float _4339 = _4337.x;
    float _4341 = _4337.y;
    float _4343 = _4337.z;
    float _4345 = _4337.w;
    float2 _11222 = float2(_4326, _4334);
    float3 _4349 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11222, float2(0.0), isnan(_11222)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11222, float2(0.0), isnan(_11222)), level(0.0)).xyz;
    float _4351 = _4349.x;
    float _4353 = _4349.y;
    float _4355 = _4349.z;
    float _4357 = abs(_3874);
    float _4359 = log2(_4357);
    float _4361 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4363 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4365 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4367 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4369 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4361);
    float _4371 = -_3644;
    float _4373 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4363);
    float _4375 = -_3644;
    float _4377 = fma(_4375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4365);
    float _4379 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4381 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4383 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4385 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4387 = -_3644;
    float _4389 = fma(_4387, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4379);
    float _4391 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4393 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4381);
    float _4395 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4383);
    float _4397 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4399 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4391);
    float _4401 = fma(_4367, _4367, 1.0);
    float _4403 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4405 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4373);
    float _4407 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4389);
    float _4409 = exp2(_4397);
    float _4411 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4377);
    float _4413 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4385);
    float _4415 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4403);
    float _4417 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4369);
    float _4419 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4421 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4413);
    float _4423 = rsqrt(_4401);
    float _4425 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4415);
    float _4427 = _4367 * _4407;
    float _4429 = _4367 * _4405;
    float _4431 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4393);
    float _4433 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4399);
    out.m_84.x = _4417;
    out.m_84.y = _4421;
    out.m_84.z = _4425;
    float _4435 = fma(_4419, _4421, _4427);
    float _4437 = fma(_4409, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4439 = precise::clamp(_4437, 0.0, 1.0);
    float _4441 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4395);
    float _4443 = fma(_4419, _4417, _4429);
    float _4445 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4447 = in.m_86.x;
    float _4449 = fma(_4439, -2.0, 3.0);
    float _4451 = _4439 * _4439;
    float _4453 = _4367 * _4423;
    float _4455 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4445);
    float _4457 = _4210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4459 = _4451 * _4449;
    float _4461 = _4367 * _4411;
    float _4463 = -_4431;
    float _4465 = _4453 * _4463;
    float _4467 = exp2(_4457);
    float _4469 = -_4459;
    float _4471 = _4469 + 1.0;
    bool _4473 = _3874 <= 8000.0;
    bool _4475 = isnan(_3874);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan(8000.0);
    bool _4481 = _4477 || _4479;
    float _4483 = float(_4481);
    float _4485 = -_4433;
    float _4487 = _4453 * _4485;
    float _4489 = _4268 * 0.5;
    float _4491 = fma(_4471, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4459);
    float _4493 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4455);
    float _4495 = -_4441;
    float _4497 = _4453 * _4495;
    float _4499 = fma(_4423, _4405, _4465);
    float _4501 = fma(_4423, _4407, _4487);
    float _4503 = _4483 * _4491;
    float _4505 = fma(_4423, _4411, _4497);
    float _4507 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4493);
    float _4509 = _4284 + _4268;
    float _4511 = _4503 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4513 = fma(_4419, _4425, _4461);
    float _4515 = -_4467;
    float _4517 = _4515 + 1.0;
    float _4519 = _4507 + _4268;
    float _4521 = _4431 + _4443;
    float _4523 = _4517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4525 = _4519 * 0.5;
    float _4527 = _4509 * 0.5;
    float _4529 = fma(_4300, -0.5, _4489);
    out.gl_Position.x = _4284;
    out.gl_Position.y = _4300;
    out.gl_Position.z = _4507;
    out.gl_Position.w = _4268;
    float _4531 = _4433 + _4435;
    float _4533 = _4441 + _4513;
    bool _4535 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4537 = isnan(_4026);
    bool _4539 = _4535 || _4537;
    bool _4541 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4543 = _4539 || _4541;
    out.m_88.x = _4527;
    out.m_88.y = _4529;
    out.m_88.z = _4525;
    out.m_88.w = _4268;
    float _4545 = _4002 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_90.x = _4499;
    out.m_90.y = _4501;
    out.m_90.z = _4505;
    out.m_92.x = _4521;
    out.m_92.y = _4531;
    out.m_92.z = _4533;
    float _4547 = -_4523;
    float _4549 = _4547 + 1.0;
    float _4551 = _4268;
    float _4553 = _4507;
    float _4555 = _4300;
    float _4557 = _4549;
    if (!_4543)
    {
        _4551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4559 = _4551;
    float _4561 = _4559;
    float _4563 = _4559;
    if (!_4543)
    {
        _4553 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4565 = _4553;
    float _4567 = _4565;
    float _4569 = _4565;
    if (!_4543)
    {
        _4555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4571 = _4555;
    float _4573 = -_4310;
    float _4575 = _4573 + 1.0;
    float _4577 = _4575 * _4511;
    float _4579 = precise::clamp(_4577, 0.0, 1.0);
    float _4581 = -_4579;
    float _4583 = fma(_4581, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4585 = _4583 * _4447;
    float _4587 = _4523 * _4332;
    float _4589 = _4585 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4591 = _4345 * _4587;
    float _4593 = _4345 * _4549;
    float _4595 = _4341;
    float _4597 = _4339;
    float _4599 = _4571;
    float _4601 = _4571;
    if (!_4543)
    {
        _4557 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4603 = _4557;
    out.m_94.x = _4589;
    float _4605 = _4355 * _4587;
    float _4607 = fma(_4351, _4591, _4339);
    float _4609 = fma(_4353, _4591, _4341);
    float _4611 = _4603;
    float _4613 = _4603;
    if (!_4543)
    {
        _4595 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4615 = _4595;
    float _4617 = fma(_4345, _4605, _4343);
    float _4619 = _4615;
    float _4621 = _4615;
    if (!_4543)
    {
        _4597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4623 = _4597;
    out.m_96.x = _4607;
    out.m_96.y = _4609;
    out.m_96.z = _4617;
    out.m_96.w = _4593;
    bool _4625 = !_4543;
    float _4627 = _4623;
    float _4629 = _4623;
    if (!_4625)
    {
        bool _4631 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4633 = isnan(_4026);
        bool _4635 = _4631 || _4633;
        bool _4637 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4639 = _4635 || _4637;
        if (!_4639)
        {
            float _4641 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4643 = _4026 + _4641;
            float _4645 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4647 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4645;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4653 = 1.0 / _4647;
            float _4655 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4657 = _4655 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4659 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4661 = _4659 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4663 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4665 = _4663 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4667 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4669 = _4667 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4671 = _4643 * _4653;
            float _4673 = precise::clamp(_4671, 0.0, 1.0);
            float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4677 = _4675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4679 = fma(_4673, _4651, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4681 = fma(_4673, _4677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4683 = fma(_4673, _4657, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4685 = fma(_4673, _4661, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4687 = fma(_4673, _4665, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4689 = fma(_4673, _4669, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4629 = _4683;
            _4601 = _4687;
            _4621 = _4679;
            _4569 = _4685;
            _4563 = _4681;
            _4613 = _4689;
            _4691 = true;
        }
        else
        {
            bool _4693 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4695 = isnan(_4026);
            bool _4697 = _4693 || _4695;
            bool _4699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4701 = _4697 || _4699;
            if (!_4701)
            {
                _4619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4703 = _4619;
            _4621 = _4703;
            if (!_4701)
            {
                _4627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4705 = _4627;
            _4629 = _4705;
            if (!_4701)
            {
                _4561 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4707 = _4561;
            _4563 = _4707;
            if (!_4701)
            {
                _4567 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4709 = _4567;
            _4569 = _4709;
            if (!_4701)
            {
                _4599 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4711 = _4599;
            _4601 = _4711;
            if (!_4701)
            {
                _4611 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4713 = _4611;
            bool _4715 = !_4701;
            _4613 = _4713;
            if (!_4715)
            {
                bool _4717 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4719 = isnan(_4026);
                bool _4721 = _4717 || _4719;
                bool _4723 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4725 = _4721 || _4723;
                if (!_4725)
                {
                    float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4729 = _4026 + _4727;
                    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4733 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4731;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4739 = 1.0 / _4733;
                    float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4743 = _4741 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4747 = _4745 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4753 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4755 = _4753 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4757 = _4729 * _4739;
                    float _4759 = precise::clamp(_4757, 0.0, 1.0);
                    float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4765 = fma(_4759, _4737, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4767 = fma(_4759, _4763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4769 = fma(_4759, _4743, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4771 = fma(_4759, _4747, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4773 = fma(_4759, _4751, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4775 = fma(_4759, _4755, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4629 = _4769;
                    _4601 = _4773;
                    _4621 = _4765;
                    _4569 = _4771;
                    _4563 = _4767;
                    _4613 = _4775;
                    _4691 = true;
                }
                else
                {
                    _4629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4601 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4569 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4563 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4613 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4691 = false;
    float _4777 = _4629;
    float _4779 = _4601;
    float _4781 = _4621;
    float _4783 = _4569;
    float _4785 = _4563;
    float _4787 = _4613;
    float _4789 = fma(_4531, -0.5, 0.5);
    float _4791 = precise::clamp(_4789, 0.0, 1.0);
    float _4793 = -_4777;
    float _4795 = _4793 + _4779;
    float _4797 = _4545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4799 = -_4781;
    float _4801 = _4799 + _4783;
    float _4803 = fma(_4791, _4795, _4777);
    out.m_98.x = 0.0;
    float _4805 = -_4785;
    float _4807 = _4805 + _4787;
    float _4809 = fma(_4791, _4801, _4781);
    float _4811 = _4803 * 0.586610972881317138671875;
    out.m_53.x = _4797;
    bool _4813 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4815 = fma(_4791, _4807, _4785);
    float _4817 = fma(_4809, 0.298911988735198974609375, _4811);
    bool _4819 = _4002 > 0.0;
    bool _4821 = isnan(_4002);
    bool _4823 = _4819 || _4821;
    bool _4825 = isnan(0.0);
    bool _4827 = _4823 || _4825;
    float _4829 = fma(_4815, 0.114477999508380889892578125, _4817);
    float _4831 = -_4829;
    float _4833 = _4809 + _4831;
    float _4835 = -_4829;
    float _4837 = _4803 + _4835;
    float _4839 = -_4829;
    float _4841 = _4815 + _4839;
    float _4843 = fma(_4833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    float _4845 = fma(_4837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    float _4847 = fma(_4841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    bool _4849 = !_4813;
    if (!_4849)
    {
        float _4851 = -_3942;
        float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4855 = -_3944;
        float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4859 = -_3946;
        float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4863 = _4853 * _4853;
        float _4865 = fma(_4857, _4857, _4863);
        float _4867 = fma(_4861, _4861, _4865);
        float _4869 = sqrt(_4867);
        float _4871 = rsqrt(_4867);
        float _4873 = -_4869;
        float _4875 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4877 = _4875 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4879 = precise::clamp(_4877, 0.0, 1.0);
        float _4881 = _4857 * _4871;
        float _4883 = _4853 * _4871;
        float _4885 = abs(_4879);
        float _4887 = log2(_4885);
        float _4889 = _4861 * _4871;
        float _4891 = _4881 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4893 = _4531 * _4883;
        float _4895 = -_4883;
        float _4897 = -_4891;
        float _4899 = fma(_4895, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4897);
        float _4901 = fma(_4521, _4881, _4893);
        float _4903 = -_4889;
        float _4905 = fma(_4903, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4899);
        float _4907 = fma(_4533, _4889, _4901);
        float _4909 = precise::clamp(_4907, 0.0, 1.0);
        float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4913 = _4905 + _4911;
        float _4915 = _4887 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4917 = _4913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4919 = precise::clamp(_4917, 0.0, 1.0);
        float _4921 = exp2(_4915);
        float _4923 = _4921 * _4919;
        float _4925 = _4909 * _4923;
        float _4927 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4929 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4931 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4927;
        out.m_98.y = _4929;
        out.m_98.z = _4931;
    }
    out.m_100.x = _4843;
    out.m_100.y = _4845;
    out.m_100.z = _4847;
    if (_4827)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4933 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4933;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4691 = false;
    bool _457 = false;
    bool _313 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = in.m_48.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = _116;
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5000 = as_type<float>(_143);
        out.gl_Position.z = _5000;
    }
    if (!_129)
    {
        return out;
    }
    bool _145 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_116);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_121);
    bool _157 = _125 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _133;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    float _167 = _125 * _163;
    int _169 = 0;
    float _171 = _167;
    if (_161)
    {
        float _173 = _165 * 5.0;
        _169 = as_type<int>(_173);
    }
    int _175 = _169;
    out.m_51.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5063 = as_type<float>(_175);
        out.gl_Position.z = _5063;
    }
    if (_161)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_58.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        _215 = _167;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_58.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        _311 = _167;
    }
    _313 = false;
    float _315 = _311;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _341 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _343 = isnan(_315);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _353;
    bool _357 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _359 = isnan(_315);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = 1.0 / _323;
    float _371 = -_335;
    float _373 = _371 + 1.0;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _377 = _351 * _373;
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _339;
    float _385 = _355 * _369;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _393 = _389 * _383;
    float _395 = _391 * _377;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _403 = _315 + _401;
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _407 = _335 * _399;
    float _409 = fma(_393, _403, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = fma(_409, _407, _405);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _421 = _411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[117].x, _417);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _427 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = _423 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _431 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _421;
    out.m_62.y = _431;
    out.m_62.z = _427;
    out.m_62.w = _429;
    float _433 = _291 * _415;
    float _435 = _289 * _413;
    bool _437 = !_375;
    float _455;
    if (!_437)
    {
        float _439 = in.m_58.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _167;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _473 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _475 = isnan(_459);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _503;
    float _507 = -_483;
    float _509 = _507 + 1.0;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _525 = 1.0 / _471;
    float _527 = 1.0 / _487;
    float _529 = _505 * _501;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _535 = _499 * _509;
    float _537 = -_499;
    float _539 = _537 + 1.0;
    float _541 = fma(_529, _463, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _543;
    float _547 = _521 * _539;
    float _549 = _533 * _525;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _553 = _459 + _551;
    bool _555 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _557 = isnan(_459);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = _541 * _547;
    float _569 = -_521;
    float _571 = _569 + 1.0;
    float _573 = fma(_549, _553, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _577 = _459 + _575;
    float _579 = _545 * _527;
    float _581 = -_565;
    float _583 = _581 + 1.0;
    float _585 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[131].x, _567);
    float _587 = fma(_579, _577, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _589 = _483 * _583;
    float _591 = fma(_573, _535, _585);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _595 = fma(_587, _589, _591);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _599 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _603 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[134].x, _595);
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _599;
    out.m_64.y = _605;
    out.m_64.z = _607;
    out.m_64.w = _609;
    bool _611 = !_523;
    float _613 = _599;
    float _615 = _609;
    float _617 = _585;
    if (!_611)
    {
        float _619 = in.m_58.x;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _623 = _619 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _171 = _633;
    }
    float _635 = _171;
    float _637 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _639 = int(_637);
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _643 = _641 != 0;
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _647 = int(_645);
    float _649 = float(_639);
    float _651 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _653 = int(_651);
    if (_643)
    {
        _613 = 1.0;
    }
    float _655 = _613;
    float _657 = _655;
    if (_643)
    {
        _615 = 1.0;
    }
    float _659 = _615;
    float _661 = float(_647);
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _665 = int(_663);
    float _667 = 1.0 / _649;
    float _669 = float(uint(_653));
    int _671 = ~_653;
    int _673 = _671 + 1;
    float _675 = 1.0 / _661;
    float _677 = float(uint(_665));
    float _679 = _667 * _125;
    float _681 = 1.0 / _669;
    float _683 = _675 * _125;
    float _685 = 1.0 / _677;
    float _687 = _675;
    float _689 = _649;
    float _691 = _659;
    if (_643)
    {
        float _693 = in.m_58.x;
        float _695 = in.m_58.y;
        _687 = _693;
        _689 = _695;
    }
    float _697 = _687;
    float _699 = _689;
    float _701 = trunc(_679);
    int _703 = int(_701);
    int _705 = as_type<int>(_681) + (-2);
    float _707 = trunc(_683);
    int _709 = int(_707);
    int _711 = as_type<int>(_685) + (-2);
    int _713 = as_type<int>(_685);
    if (_643)
    {
        _713 = 0;
    }
    int _715 = _713;
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _719 = int(_717);
    float _721 = float(uint(_703));
    float _723 = _721;
    float _725 = _697;
    float _727 = _699;
    int _729 = _715;
    if (_643)
    {
        _617 = _697;
    }
    float _731 = _617;
    float _733 = as_type<float>(_711) * _721;
    float _735 = _731;
    if (_643)
    {
        _723 = _699;
    }
    float _737 = _723;
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _741 = int(_739);
    float _743 = float(uint(_709));
    float _745 = as_type<float>(_705) * _743;
    float _747 = trunc(_733);
    float _749 = precise::max(_747, 0.0);
    uint _752 = uint(_749);
    float _754 = float(uint(_719));
    float _756 = float(_741);
    float _758 = 1.0 / _754;
    float _760 = 1.0 / _756;
    int _762 = as_type<int>(_754);
    float _764 = _756;
    float _766 = _745;
    float _768 = _737;
    if (_643)
    {
        _762 = 0;
    }
    int _770 = _762;
    float _772 = trunc(_745);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    int _778 = _770;
    if (_643)
    {
        _764 = _731;
    }
    float _780 = _764;
    float _782 = _780;
    if (_643)
    {
        _766 = _731;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_643)
    {
        float _788 = in.m_58.x;
        float _790 = in.m_58.y;
        float _792 = in.m_58.z;
        float _794 = _788 * 3.1415927410125732421875;
        float _796 = _794 * 0.15915493667125701904296875;
        float _798 = _790 * 3.1415927410125732421875;
        float _800 = _798 * 0.15915493667125701904296875;
        float _802 = _796 * 6.283185482025146484375;
        float _804 = sin(_802);
        float _806 = _800 * 6.283185482025146484375;
        float _808 = sin(_806);
        _691 = 5.839270114898681640625;
        _782 = _792;
        _657 = 7.345489978790283203125;
        _725 = _788;
        _735 = _790;
        _727 = _790;
        _768 = _808;
        _778 = 1;
        _786 = _804;
        _729 = 2;
    }
    float _810 = _691;
    float _812 = _782;
    float _814 = _657;
    float _816 = _725;
    float _818 = _735;
    float _820 = _727;
    float _822 = _768;
    int _824 = _778;
    float _826 = _786;
    int _828 = _729;
    int _830 = _673 * int(_776);
    int _832 = _830 + _709;
    int _834 = ~_665;
    int _836 = _834 + 1;
    float _838 = _810 * _812;
    float _840 = in.m_58.z;
    float _842 = in.m_58.w;
    float _844 = _760 * _125;
    float _846 = float(uint(_832));
    float _848 = _814 * _816;
    int _850 = _836 * int(_752);
    int _852 = _850 + _703;
    float _854 = floor(_838);
    float _856 = float(_709);
    float _858 = as_type<float>(_705) * _846;
    float _860 = float(_653);
    float _862 = _814 * _818;
    float _864 = float(uint(_852));
    float _866 = _816 * 2.0;
    float _868 = floor(_848);
    bool _870 = _856 >= _860;
    bool _872 = isnan(_856);
    bool _874 = _870 || _872;
    bool _876 = isnan(_860);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = as_type<float>(_711) * _864;
    int _884 = as_type<int>(_758) + (-2);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _888 = _635 + _886;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _892 = _890 != 0;
    bool _894 = _820 > 0.5;
    float _896 = trunc(_844);
    int _898 = int(_896);
    float _900 = -_854;
    float _902 = _838 + _900;
    float _904 = float(_703);
    bool _906 = _842 > 0.5;
    bool _908 = _840 > 0.5;
    float _910 = trunc(_858);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = -_868;
    float _918 = _848 + _916;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _930 = _928 != 0;
    float _932 = -_195;
    int _934 = _908 ? as_type<int>(_932) : as_type<int>(_195);
    float _936 = trunc(_882);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    float _942 = float(uint(_898));
    int _944 = ~_653;
    int _946 = _944 + 1;
    int _948 = ~_665;
    int _950 = _948 + 1;
    int _952 = int(_906);
    int _954 = _908 ? 2 : 0;
    int _956 = _952 | _954;
    int _958 = _892 ? 4 : 0;
    int _960 = _956 | _958;
    int _962 = _922 ? 8 : 0;
    int _964 = _960 | _962;
    int _966 = _926 ? 16 : 0;
    int _968 = _964 | _966;
    int _970 = _930 ? 32 : 0;
    int _972 = _968 | _970;
    int _974 = _894 ? 64 : 0;
    int _976 = _972 | _974;
    int _978 = _976 & 64;
    float _980 = trunc(_880);
    int _982 = int(_980);
    int _984 = int(_776) + int(_914);
    float _986 = as_type<float>(_884) * _942;
    float _988 = -_191;
    int _990 = _894 ? as_type<int>(_988) : as_type<int>(_191);
    bool _992 = !_930;
    float _994 = _992 ? _195 : as_type<float>(_934);
    int _996 = _946 * _984;
    int _998 = _996 + _709;
    bool _1000 = !_926;
    float _1002 = _1000 ? _191 : as_type<float>(_990);
    float _1004 = floor(_862);
    float _1006 = float(_665);
    int _1008 = int(_752) + int(_940);
    bool _1010 = _904 >= _1006;
    bool _1012 = isnan(_904);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(_1006);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _918 * _860;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1034 = _1032 != 0;
    int _1036 = _950 * _1008;
    int _1038 = _1036 + _703;
    float _1040 = trunc(_1020);
    int _1042 = int(_1040);
    bool _1044 = !_892;
    int _1046 = _1044 ? 0 : 1;
    bool _1048 = !_1030;
    int _1050 = _1048 ? 0 : 1;
    bool _1052 = !_1026;
    int _1054 = _1052 ? 0 : 1;
    bool _1056 = uint(_998) >= uint(_653);
    float _1058 = trunc(_1022);
    int _1060 = int(_1058);
    float _1062 = _902 * _1006;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1066 = _1064 != 0;
    float _1068 = -_1004;
    float _1070 = _862 + _1068;
    bool _1072 = uint(_1038) >= uint(_665);
    bool _1074 = !_1034;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = trunc(_986);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    bool _1084 = !_1056;
    int _1086 = _1084 ? 0 : (-1);
    bool _1088 = !_1072;
    int _1090 = _1088 ? 0 : (-1);
    int _1092 = abs(_1046);
    int _1094 = ~_984;
    int _1096 = _1094 + _1086;
    int _1098 = _1096 + 1;
    float _1100 = trunc(_1062);
    int _1102 = int(_1100);
    bool _1104 = !_1066;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1060 * _1092;
    int _1110 = _1108 + _709;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1122 = _1120 != 0;
    int _1124 = _653 * _1098;
    int _1126 = _1124 + _709;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1130 = _1128 != 0;
    int _1132 = ~_1008;
    int _1134 = _1132 + _1090;
    int _1136 = _1134 + 1;
    bool _1138 = !_1130;
    int _1140 = _1138 ? 0 : 1;
    int _1142 = ~_719;
    int _1144 = _1142 + 1;
    int _1146 = _665 * _1136;
    int _1148 = _1146 + _703;
    int _1150 = abs(_1140);
    bool _1152 = _653 == 0;
    int _1154 = _1144 * int(_1082);
    int _1156 = _1154 + _898;
    bool _1158 = !_1114;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _1102 * _1150;
    int _1164 = _1162 + _703;
    float _1166 = _163 * _125;
    bool _1168 = _665 == 0;
    int _1170 = ~_982;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = _860 * _1166;
    bool _1178 = !_1152;
    int _1180 = _1178 ? _1126 : (-1);
    float _1182 = _1006 * _1166;
    int _1184 = ~_1042;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1168;
    int _1192 = _1190 ? _1148 : (-1);
    int _1194 = _1180 * _1174;
    float _1196 = float(uint(_1156));
    float _1198 = trunc(_1176);
    int _1200 = int(_1198);
    bool _1202 = !_1118;
    int _1204 = _1202 ? 0 : 1;
    int _1206 = _1192 * _1188;
    int _1208 = _653 + (-1);
    float _1210 = as_type<float>(_884) * _1196;
    int _1212 = _665 + (-1);
    int _1214 = abs(_1204);
    int _1216 = _982 * _1208;
    int _1218 = _1216 + _1194;
    int _1220 = abs(_1050);
    float _1222 = trunc(_1210);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = _1042 * _1212;
    int _1230 = _1228 + _1206;
    int _1232 = abs(_1076);
    int _1234 = _1218 * _1220;
    int _1236 = abs(_1054);
    int _1238 = _1230 * _1214;
    int _1240 = abs(_1106);
    float _1242 = trunc(_1182);
    int _1244 = int(_1242);
    int _1246 = _1200 * _1236;
    int _1248 = _1246 + _1234;
    int _1250 = abs(_1160);
    int _1252 = _1110 * _1232;
    int _1254 = _1252 + _1248;
    int _1256 = ~_719;
    int _1258 = _1256 + 1;
    int _1260 = int(_1082) + int(_1226);
    int _1262 = _1060 * _1240;
    int _1264 = _1262 + _1254;
    bool _1266 = !_1122;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = -_195;
    int _1272 = _906 ? as_type<int>(_1270) : as_type<int>(_195);
    int _1274 = _1258 * _1260;
    int _1276 = _1274 + _898;
    float _1278 = -_191;
    int _1280 = _908 ? as_type<int>(_1278) : as_type<int>(_191);
    int _1282 = _1244 * _1250;
    int _1284 = _1282 + _1238;
    float _1286 = float(uint(_1264));
    int _1288 = abs(_1268);
    bool _1290 = uint(_1276) >= uint(_719);
    float _1292 = as_type<float>(_705) * _1286;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1300 = _1298 != 0;
    float _1302 = trunc(_1292);
    float _1304 = precise::max(_1302, 0.0);
    uint _1306 = uint(_1304);
    bool _1308 = _978 != 0;
    float _1310 = float(_719);
    float _1312 = float(_898);
    bool _1314 = !_922;
    float _1316 = _1314 ? _195 : as_type<float>(_1272);
    bool _1318 = !_1296;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = !_1300;
    int _1324 = _1322 ? 0 : 1;
    bool _1326 = !_1290;
    int _1328 = _1326 ? 0 : (-1);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1332 = _1330 != 0;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1336 = _1334 != 0;
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1340 = _1338 != 0;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1344 = _1342 != 0;
    bool _1346 = _1312 >= _1310;
    bool _1348 = isnan(_1312);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(_1310);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1310 * _1166;
    float _1360 = _1070 * _1310;
    int _1362 = _1164 * _1288;
    int _1364 = _1362 + _1284;
    bool _1366 = !_1336;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1372 = _1370 != 0;
    float _1374 = trunc(_1356);
    int _1376 = int(_1374);
    int _1378 = abs(_1320);
    int _1380 = ~_653;
    int _1382 = _1380 + 1;
    int _1384 = ~_1260;
    int _1386 = _1384 + _1328;
    int _1388 = _1386 + 1;
    int _1390 = _1382 * int(_1306);
    int _1392 = _1390 + _1264;
    float _1394 = trunc(_1360);
    int _1396 = int(_1394);
    int _1398 = abs(_1368);
    int _1400 = _1102 * _1378;
    int _1402 = _1400 + _1364;
    float _1404 = as_type<float>(_1378);
    float _1406 = as_type<float>(_1264);
    float _1408 = as_type<float>(_828);
    float _1410 = as_type<float>(_824);
    if (_1372)
    {
        float _1412 = in.m_58.w;
        _1404 = _1412;
    }
    float _1414 = _1404;
    float _1416 = float(uint(_1392));
    int _1418 = _719 * _1388;
    int _1420 = _1418 + _898;
    bool _1422 = !_1332;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1358);
    int _1428 = int(_1426);
    bool _1430 = _719 == 0;
    float _1432 = as_type<float>(_705) * _1416;
    float _1434 = float(uint(_1402));
    int _1436 = ~_1376;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    bool _1442 = !_1430;
    int _1444 = _1442 ? _1420 : (-1);
    float _1446 = as_type<float>(_711) * _1434;
    float _1448 = trunc(_1432);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = abs(_1324);
    int _1456 = _1444 * _1440;
    int _1458 = _719 + (-1);
    int _1460 = abs(_1424);
    float _1462 = trunc(_1446);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    int _1468 = _1376 * _1458;
    int _1470 = _1468 + _1456;
    int _1472 = _1470 * _1398;
    int _1474 = ~_665;
    int _1476 = _1474 + 1;
    int _1478 = _1396 * _1454;
    int _1480 = _1478 + _898;
    float _1482 = as_type<float>(_1454);
    if (_1372)
    {
        float _1484 = _1414 * 3.1415927410125732421875;
        _1482 = _1484;
    }
    float _1486 = _1482;
    int _1488 = _1428 * _1460;
    int _1490 = _1488 + _1472;
    bool _1492 = !_1340;
    int _1494 = _1492 ? 0 : 1;
    int _1496 = ~_653;
    int _1498 = _1496 + 1;
    float _1500 = _1486;
    if (_1372)
    {
        float _1502 = _1486 * 0.15915493667125701904296875;
        _1500 = _1502;
    }
    float _1504 = _1500;
    int _1506 = int(_1306) + int(_1452);
    int _1508 = _1476 * int(_1466);
    int _1510 = _1508 + _1402;
    int _1512 = abs(_1494);
    bool _1514 = !_1344;
    int _1516 = _1514 ? 0 : 1;
    int _1518 = _1498 * _1506;
    int _1520 = _1518 + _1264;
    float _1522 = float(uint(_1510));
    float _1524 = _1504;
    if (_1372)
    {
        float _1526 = _1504 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        _1524 = _1528;
    }
    float _1530 = _1524;
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1534 = _1532 != 0;
    int _1536 = abs(_1516);
    float _1538 = as_type<float>(_711) * _1522;
    bool _1540 = uint(_1520) >= uint(_653);
    int _1542 = _1480 * _1512;
    int _1544 = _1542 + _1490;
    float _1546 = float(uint(_1110));
    float _1548 = trunc(_1538);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    bool _1554 = !_1540;
    int _1556 = _1554 ? 0 : (-1);
    int _1558 = _1396 * _1536;
    int _1560 = _1558 + _1544;
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1564 = _1562 != 0;
    float _1566 = as_type<float>(_705) * _1546;
    int _1568 = ~_1506;
    int _1570 = _1568 + _1556;
    int _1572 = _1570 + 1;
    float _1574 = as_type<float>(_1376);
    bool _1576 = _1564;
    if (_1534)
    {
        float _1578 = in.m_58.x;
        _1574 = _1578;
    }
    float _1580 = _1574;
    bool _1582 = !_1564;
    float _1584 = _1582 ? _191 : as_type<float>(_1280);
    float _1586 = trunc(_1566);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    if (_1372)
    {
        bool _1592 = _1530 > 0.5;
        _1576 = _1592;
    }
    bool _1594 = _1576;
    int _1596 = _653 * _1572;
    int _1598 = _1596 + _1264;
    float _1600 = float(uint(_1560));
    bool _1602 = _653 == 0;
    float _1604 = 0.0;
    if (!_1372)
    {
        _1604 = _191;
    }
    float _1606 = _1604;
    float _1608 = as_type<float>(_884) * _1600;
    bool _1610 = !_1602;
    int _1612 = _1610 ? _1598 : (-1);
    float _1614 = _1606;
    if (_1372)
    {
        float _1616 = -_191;
        float _1618 = _1594 ? _1616 : _191;
        _1614 = _1618;
    }
    float _1620 = _1614;
    int _1622 = _1612 & 3;
    bool _1624 = _1622 != 0;
    float _1626 = trunc(_1608);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = ~_653;
    int _1634 = _1632 + 1;
    int _1636 = _1612 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = _1624 ? 0 : 1;
    int _1642 = _1634 * int(_1590);
    int _1644 = _1642 + _1110;
    bool _1646 = uint(_1636) > 1u;
    if (_1534)
    {
        float _1648 = _1580 * 3.1415927410125732421875;
        _1406 = _1648;
    }
    float _1650 = _1406;
    int _1652 = int(_1466) + int(_1552);
    float _1654 = float(uint(_1164));
    float _1656 = _1650;
    if (_1534)
    {
        float _1658 = _1650 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = float(uint(_1644));
    int _1664 = ~_665;
    int _1666 = _1664 + 1;
    float _1668 = as_type<float>(_711) * _1654;
    int _1670 = ~_719;
    int _1672 = _1670 + 1;
    float _1674 = as_type<float>(_705) * _1662;
    int _1676 = ~_1640;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1666 * _1652;
    int _1684 = _1682 + _1402;
    int _1686 = _1680;
    if (!_1646)
    {
        int _1688 = ~_1640;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    int _1694 = _1672 * int(_1630);
    int _1696 = _1694 + _1560;
    float _1698 = -_195;
    int _1700 = _1308 ? as_type<int>(_1698) : as_type<int>(_195);
    float _1702 = trunc(_1668);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    bool _1708 = uint(_1636) >= 2u;
    bool _1710 = uint(_1684) >= uint(_665);
    float _1712 = float(uint(_1696));
    int _1714 = _1708 ? 0 : 1;
    float _1716 = _1660;
    if (_1534)
    {
        float _1718 = _1660 * 6.283185482025146484375;
        float _1720 = sin(_1718);
        _1716 = _1720;
    }
    float _1722 = _1716;
    bool _1724 = _1636 != 3;
    float _1726 = as_type<float>(_884) * _1712;
    bool _1728 = !_1710;
    int _1730 = _1728 ? 0 : (-1);
    int _1732 = ~_665;
    int _1734 = _1732 + 1;
    int _1736 = ~_1652;
    int _1738 = _1736 + _1730;
    int _1740 = _1738 + 1;
    float _1742 = trunc(_1726);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    int _1748 = _665 * _1740;
    int _1750 = _1748 + _1402;
    float _1752 = 0.0;
    bool _1754 = _1724;
    if (!_1534)
    {
        _1752 = _195;
    }
    float _1756 = _1752;
    int _1758 = _1734 * int(_1706);
    int _1760 = _1758 + _1164;
    int _1762 = ~_1714;
    int _1764 = _1762 + 1;
    int _1766 = _1764 + 1;
    float _1768 = trunc(_1674);
    float _1770 = precise::max(_1768, 0.0);
    uint _1772 = uint(_1770);
    int _1774 = _1766;
    float _1776 = _1756;
    if (_1724)
    {
        int _1778 = ~_1714;
        int _1780 = _1778 + 1;
        _1774 = _1780;
    }
    int _1782 = _1774;
    if (_1534)
    {
        bool _1784 = _1722 > 0.5;
        _1754 = _1784;
    }
    bool _1786 = _1754;
    bool _1788 = !_1168;
    int _1790 = _1788 ? _1750 : (-1);
    float _1792 = float(uint(_1760));
    int _1794 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1796 = _1794 != 0;
    if (_1534)
    {
        float _1798 = -_195;
        float _1800 = _1786 ? _1798 : _195;
        _1776 = _1800;
    }
    float _1802 = _1776;
    float _1804 = as_type<float>(_711) * _1792;
    int _1806 = _1790 & 3;
    bool _1808 = _1806 != 0;
    bool _1810 = !_1796;
    float _1812 = _1810 ? _195 : as_type<float>(_1700);
    int _1814 = int(_1630) + int(_1746);
    float _1816 = trunc(_1804);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = ~_653;
    int _1824 = _1822 + 1;
    int _1826 = ~_719;
    int _1828 = _1826 + 1;
    int _1830 = _1790 & 3;
    bool _1832 = _1830 != 0;
    bool _1834 = uint(_1806) > 1u;
    int _1836 = _1828 * _1814;
    int _1838 = _1836 + _1560;
    int _1840 = int(_1590) + int(_1772);
    float _1842 = float(uint(_1480));
    int _1844 = _1832 ? 0 : 1;
    float _1846 = as_type<float>(_884) * _1842;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1850 = _1848 != 0;
    int _1852 = _1824 * _1840;
    int _1854 = _1852 + _1110;
    int _1856 = ~_1844;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    bool _1862 = !_1850;
    int _1864 = _1862 ? 0 : 1;
    float _1866 = trunc(_1846);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    bool _1872 = uint(_1838) >= uint(_719);
    int _1874 = _1860;
    if (!_1834)
    {
        int _1876 = ~_1844;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    bool _1882 = uint(_1854) >= uint(_653);
    bool _1884 = !_1872;
    int _1886 = _1884 ? 0 : (-1);
    bool _1888 = _1806 != 3;
    bool _1890 = !_1882;
    int _1892 = _1890 ? 0 : (-1);
    bool _1894 = uint(_1806) >= 2u;
    int _1896 = ~_1814;
    int _1898 = _1896 + _1886;
    int _1900 = _1898 + 1;
    int _1902 = ~_665;
    int _1904 = _1902 + 1;
    int _1906 = int(_1706) + int(_1820);
    int _1908 = _719 * _1900;
    int _1910 = _1908 + _1560;
    int _1912 = _1894 ? 0 : 1;
    float _1914 = in.m_66.x;
    float _1916 = in.m_66.y;
    float _1918 = in.m_66.z;
    float _1920 = in.m_66.w;
    int _1922 = ~_719;
    int _1924 = _1922 + 1;
    int _1926 = _1904 * _1906;
    int _1928 = _1926 + _1164;
    int _1930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1932 = _1930 != 0;
    int _1934 = ~_1912;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1938;
    int _1942 = _1880;
    if (_1888)
    {
        int _1944 = ~_1912;
        int _1946 = _1944 + 1;
        _1940 = _1946;
    }
    int _1948 = _1940;
    int _1950 = _1924 * int(_1870);
    int _1952 = _1950 + _1480;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1956 = _1954 != 0;
    float _1958 = _820 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1960 = !_1932;
    int _1962 = _1960 ? 0 : 1;
    bool _1964 = uint(_1928) >= uint(_665);
    bool _1966 = !_1430;
    int _1968 = _1966 ? _1910 : (-1);
    bool _1970 = !_1956;
    int _1972 = _1970 ? 0 : 1;
    bool _1974 = !_1964;
    int _1976 = _1974 ? 0 : (-1);
    int _1978 = _1968 & 3;
    bool _1980 = _1978 != 0;
    float _1982 = float(uint(_1952));
    int _1984 = _1968 & 3;
    bool _1986 = _1984 != 0;
    int _1988 = _1980 ? 0 : 1;
    float _1990 = as_type<float>(_884) * _1982;
    bool _1992 = uint(_1984) > 1u;
    int _1994 = ~_1988;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = ~_719;
    int _2002 = _2000 + 1;
    float _2004 = trunc(_1990);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2014 = _1998;
    float _2016 = as_type<float>(_1870);
    if (!_1992)
    {
        int _2018 = ~_1988;
        int _2020 = _2018 + 1;
        _2014 = _2020;
    }
    int _2022 = _2014;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2026 = uint(_1984) >= 2u;
    float _2028 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2012);
    float _2030 = _822 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2032 = _2026 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _2036 = _1984 != 3;
    float _2038 = fma(_2030, -2.0, _2024);
    int _2040 = int(_1870) + int(_2008);
    float _2042 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2028);
    int _2044 = ~as_type<int>(_2032);
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = floor(_866);
    int _2052 = _2002 * _2040;
    int _2054 = _2052 + _1480;
    float _2056 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2038);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2062 = _2048;
    float _2064 = _2032;
    float _2066 = as_type<float>(_2008);
    if (_2036)
    {
        int _2068 = ~as_type<int>(_2032);
        int _2070 = _2068 + 1;
        _2062 = _2070;
    }
    int _2072 = _2062;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2076 = uint(_2054) >= uint(_719);
    float _2078 = _816 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2082 = !_2076;
    int _2084 = _2082 ? 0 : (-1);
    float _2086 = -_2010;
    float _2088 = fma(_2078, 2.0, _2086);
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2092 = _816 > 0.5;
    float _2094 = fma(_1958, -2.0, _2074);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2098 = -_191;
    int _2100 = _2092 ? as_type<int>(_2098) : as_type<int>(_191);
    float _2102 = -_125;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2088);
    bool _2106 = _824 != 1;
    float _2108 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2096);
    float _2110 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2112 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2114 = log2(_2112);
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2118 = -_2034;
    float _2120 = fma(_2110, 2.0, _2118);
    float _2122 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2108);
    float _2124 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2094);
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_2106)
    {
        _2016 = _820;
    }
    float _2128 = _2016;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2132 = 0.0;
    float _2134 = _2128;
    if (!_2106)
    {
        _2132 = _820;
    }
    float _2136 = _2132;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2140 = _2136;
    if (!_2106)
    {
        _2064 = _840;
    }
    float _2142 = _2064;
    float _2144 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2126);
    float _2146 = _2142;
    if (!_2106)
    {
        _2066 = _840;
    }
    float _2148 = _2066;
    float _2150 = _2114 * _125;
    float _2152 = _2148;
    if (_2106)
    {
        _2134 = _816;
    }
    float _2154 = _2134;
    float _2156 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2130);
    if (_2106)
    {
        _2140 = _816;
    }
    float _2158 = _2140;
    float _2160 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2138);
    if (_2106)
    {
        _2146 = _820;
    }
    float _2162 = _2146;
    float _2164 = exp2(_2150);
    if (_2106)
    {
        _2152 = _820;
    }
    float _2166 = _2152;
    float _2168 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2170 = _828 != 2;
    float _2172 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2156);
    float _2174 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2058);
    float _2176 = -_2060;
    float _2178 = fma(_2168, 2.0, _2176);
    float _2180 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2182 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2144);
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2186 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2160);
    float _2188 = fma(_2180, -2.0, _2080);
    float _2190 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2174);
    float _2192 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2184);
    float _2194 = -_125;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2120);
    if (_2170)
    {
        _1408 = _816;
    }
    float _2198 = _1408;
    float _2200 = -_2164;
    float _2202 = _2200 + 1.0;
    float _2204 = _2198;
    if (_2170)
    {
        _1410 = _820;
    }
    float _2206 = _1410;
    float _2208 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2192);
    float _2210 = _2206;
    if (!_2170)
    {
        _2204 = _840;
    }
    float _2212 = _2204;
    float _2214 = -_125;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2178);
    if (!_2170)
    {
        _2210 = _816;
    }
    float _2218 = _2210;
    float _2220 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2188);
    int _2222 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2224 = _2222 != 0;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2230 = !_2224;
    float _2232 = _2230 ? _191 : as_type<float>(_2100);
    float _2234 = -_2090;
    float _2236 = fma(_2226, 2.0, _2234);
    bool _2238 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2246 = _2242 || _2244;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2250 = fma(_2228, -2.0, _2116);
    float _2252 = in.m_68.x;
    float _2254 = in.m_68.y;
    float _2256 = in.m_68.z;
    float _2258 = in.m_68.w;
    float _2260 = _2246 ? _2202 : 0.0;
    float _2262 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2248);
    bool _2264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2266 = isnan(1.0);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2272 = _2268 || _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2276 = 1.0 + _2274;
    float _2278 = in.m_46.x;
    float _2280 = in.m_46.y;
    float _2282 = in.m_46.z;
    float _2284 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2262);
    float _2286 = -_125;
    float _2288 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2236);
    float _2290 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2250);
    float _2292 = in.m_70.x;
    float _2294 = in.m_70.y;
    float _2296 = in.m_70.z;
    float _2298 = in.m_70.w;
    float _2300 = 1.0 / _2276;
    float _2302 = -_2122;
    float _2304 = _2302 + 1.0;
    float _2306 = -_2182;
    float _2308 = _2306 + 1.0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2318 = ~_1906;
    int _2320 = _2318 + _1976;
    int _2322 = _2320 + 1;
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2326 = _2324 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2328 = abs(_1948);
    float _2330 = 1.0 / _2312;
    float _2332 = -_2284;
    float _2334 = _2332 + 1.0;
    int _2336 = ~_1840;
    int _2338 = _2336 + _1892;
    int _2340 = _2338 + 1;
    float _2342 = -_2208;
    float _2344 = _2342 + 1.0;
    if (_2272)
    {
        float _2346 = _2260 * _2300;
        _135 = _2346;
    }
    float _2348 = _135;
    bool _2350 = _2050 >= 0.0;
    bool _2352 = isnan(_2050);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(0.0);
    bool _2358 = _2354 || _2356;
    float _2360 = _820 * 2.0;
    float _2362 = _2280 * _1916;
    float _2364 = _2280 * _2254;
    float _2366 = 1.0 / _2316;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2372 = _2280 * _2294;
    int _2374 = _2358 ? 0 : 1;
    float _2376 = fma(_2278, _1914, _2362);
    bool _2378 = _2050 > 0.0;
    float _2380 = fma(_2278, _2292, _2372);
    float _2382 = floor(_2360);
    float _2384 = fma(_2278, _2252, _2364);
    float _2386 = fma(_2282, _2296, _2380);
    int _2388 = ~_2374;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2398 = fma(_2282, _1918, _2376);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2400;
    float _2404 = 1.0 / _2326;
    float _2406 = fma(_2282, _2256, _2384);
    int _2408 = _2392;
    if (!_2378)
    {
        int _2410 = ~_2374;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2418 = _2416 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2420 = _840 * 2.0;
    float _2422 = _2418 * _2330;
    float _2424 = 1.0 / _2396;
    bool _2426 = _2382 >= 0.0;
    bool _2428 = isnan(_2382);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan(0.0);
    bool _2434 = _2430 || _2432;
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2438 = _2436 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2440;
    float _2444 = _2402 * _2366;
    int _2446 = _2434 ? 0 : 1;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2452 = _2382 > 0.0;
    float _2454 = floor(_2420);
    float _2456 = _2442 * _2404;
    int _2458 = _665 * _2322;
    int _2460 = _2458 + _1164;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2464 = _635 + _2462;
    int _2466 = ~_2446;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2472;
    float _2476 = 1.0 / _2438;
    bool _2478 = !_1168;
    int _2480 = _2478 ? _2460 : (-1);
    float _2482 = fma(_2444, _2464, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2484 = _2474 * _2424;
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2486;
    int _2490 = _2470;
    if (!_2452)
    {
        int _2492 = ~_2446;
        int _2494 = _2492 + 1;
        _2490 = _2494;
    }
    int _2496 = _2490;
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2500 = _635 + _2498;
    bool _2502 = !_1638;
    int _2504 = _2502 ? 0 : 1;
    float _2506 = 1.0 / _2370;
    bool _2508 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2510 = isnan(_635);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    float _2520 = fma(_2456, _2500, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2528 = _2526 != 0;
    int _2530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2532 = _2530 != 0;
    float _2534 = fma(_2484, _888, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2536 = _2454 >= 0.0;
    bool _2538 = isnan(_2454);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan(0.0);
    bool _2544 = _2540 || _2542;
    float _2546 = _2398 + _1920;
    bool _2548 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2550 = isnan(_635);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = _2488 * _2476;
    float _2562 = -_2518;
    float _2564 = _2562 + 1.0;
    int _2566 = _2544 ? 0 : 1;
    float _2568 = _2386 + _2298;
    bool _2570 = _2454 > 0.0;
    float _2572 = _2558 * _2564;
    bool _2574 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2576 = isnan(_635);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2582 = _2578 || _2580;
    float _2584 = float(_2582);
    float _2586 = _2406 + _2258;
    float _2588 = _2450 * _2506;
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2594 = -_2558;
    float _2596 = _2594 + 1.0;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2600 = _635 + _2598;
    bool _2602 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2604 = isnan(_635);
    bool _2606 = _2602 || _2604;
    bool _2608 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2610 = _2606 || _2608;
    float _2612 = float(_2610);
    float _2614 = -_2584;
    float _2616 = _2614 + 1.0;
    float _2618 = _2584 * _2596;
    float _2620 = fma(_2422, _2600, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2622 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2624 = isnan(_635);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = _2612 * _2616;
    float _2636 = -_2612;
    float _2638 = _2636 + 1.0;
    bool _2640 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2642 = isnan(_635);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2648 = _2644 || _2646;
    float _2650 = float(_2648);
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2654 = _635 + _2652;
    float _2656 = -_2632;
    float _2658 = _2656 + 1.0;
    float _2660 = _2632 * _2638;
    float _2662 = fma(_2588, _2654, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2664 = _2650 * _2658;
    bool _2666 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2668 = isnan(_635);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = -_2650;
    float _2680 = _2678 + 1.0;
    int _2682 = _1790 >> 31;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2688 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2690 = isnan(_635);
    bool _2692 = _2688 || _2690;
    bool _2694 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2696 = _2692 || _2694;
    float _2698 = float(_2696);
    float _2700 = _2676 * _2680;
    int _2702 = _2682 & 3;
    float _2704 = -_2676;
    float _2706 = _2704 + 1.0;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _635 + _2708;
    float _2712 = 1.0 / _2686;
    int _2714 = _1790 + _2702;
    float _2716 = _2698 * _2706;
    float _2718 = -_2698;
    float _2720 = _2718 + 1.0;
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2724 = _635 + _2722;
    int _2726 = _2714 >> 2;
    float _2728 = _2482 * _2716;
    int _2730 = ~_2566;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    float _2736 = _820 + _816;
    int _2738 = _2726 << 4;
    int _2740 = _2738 + 656;
    float _2742 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2728);
    int _2744 = _2734;
    float _2746 = _2618;
    float _2748 = _2568;
    if (!_2570)
    {
        int _2750 = ~_2566;
        int _2752 = _2750 + 1;
        _2744 = _2752;
    }
    int _2754 = _2744;
    float _2756 = fma(_2560, _2724, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    uint _2758 = uint(int(uint(_2740) >> uint(2)));
    uint _2760 = uint(int(uint(int(_2758)) >> uint(2)));
    int _2762 = int(_2758) & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = int(_2758) + 1;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    int _2770 = _2766 & 3;
    float _2772 = (*spvDescriptorSet0.vp_c9)._m0[int(_2768)][_2770];
    float _2774 = fma(_2620, _2700, _2742);
    float _2776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2778 = _2546 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2782 = _2586 + _2780;
    bool _2784 = !_1808;
    int _2786 = _2784 ? 0 : 1;
    float _2788 = fma(_2520, _2664, _2774);
    float _2790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2792 = _2568 + _2790;
    float _2794 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2796 = _1806 != 3;
    float _2798 = _816 + _840;
    float _2800 = _816 + (-0.5);
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2794);
    float _2804 = _2592 * _2712;
    float _2806 = fma(_2662, _2660, _2788);
    float _2808 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2802);
    float _2810 = fma(_2804, _2710, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2812 = _2740 + 8;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    bool _2830 = !_2796;
    int _2832 = _2830 ? 0 : (-1);
    float _2834 = _820 + _840;
    bool _2836 = _2808 >= 0.0;
    float _2838 = _820 + (-0.5);
    float _2840 = _2736 + (-1.0);
    float _2842 = _1620 + 0.5;
    float _2844 = fma(_2534, _2634, _2806);
    float _2846 = _1802 + (-0.5);
    float _2848 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2850 = fma(_2842, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2196);
    float _2852 = fma(_2810, _2618, _2844);
    int _2854 = abs(_1880);
    float _2856 = -_2846;
    float _2858 = -_2056;
    float _2860 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2858);
    float _2862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2864 = _2232 + 0.5;
    if (_2836)
    {
        _2746 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2866 = _2746;
    float _2868 = _1812 + (-0.5);
    int _2870 = ~_2854;
    int _2872 = _2870 + 1;
    int _2874 = _2872 + 1;
    float _2876 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2104);
    int _2878 = abs(_2786);
    float _2880 = -_2868;
    float _2882 = -_2124;
    float _2884 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2882);
    if (_2836)
    {
        float _2886 = _2866 * 5.0;
        _1942 = as_type<int>(_2886);
    }
    int _2888 = _1942;
    float _2890 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2892 = int(_2890);
    float _2894 = fma(_2756, _2572, _2852);
    float _2896 = -_2304;
    float _2898 = fma(_2896, _1620, _2850);
    float _2900 = -_2042;
    float _2902 = _2900 + 1.0;
    if (_2836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9012 = as_type<float>(_2888);
        out.gl_Position.z = _9012;
    }
    float _2904 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2894);
    float _2906 = _2862 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2908 = _2874 * as_type<int>(_2772);
    float _2910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2912 = fma(_2902, _1802, _2860);
    float _2914 = _2778 * _2778;
    int _2916 = ~_2878;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    float _2922 = _1316 + (-0.5);
    bool _2924 = !_2524;
    int _2926 = _2924 ? 0 : 1;
    out.m_72.x = _2898;
    out.m_72.y = _2912;
    float _2928 = _1584 + 0.5;
    int _2930 = _2920 * as_type<int>(_2764);
    int _2932 = _2930 + _2908;
    float _2934 = fma(_2792, _2792, _2914);
    int _2936 = ~_2328;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = fma(_2906, _2928, _2216);
    int _2944 = abs(_2832);
    float _2946 = fma(_2782, _2782, _2934);
    int _2948 = abs(_2892);
    int _2950 = _2940 * as_type<int>(_2820);
    int _2952 = _2950 + _2932;
    float _2954 = float(uint(_2892));
    int _2956 = _653 * _2340;
    int _2958 = _2956 + _1110;
    int _2960 = abs(_1962);
    float _2962 = _2910 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2964 = ~_2944;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    out.m_74.x = _2904;
    float _2970 = 1.0 / _2954;
    int _2972 = ~_2960;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = -_2962;
    float _2980 = -_2220;
    float _2982 = fma(_2978, _2922, _2980);
    int _2984 = _2968 * as_type<int>(_2828);
    int _2986 = _2984 + _2952;
    float _2988 = float(uint(_2948));
    float _2990 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2992 = ~_2892;
    int _2994 = _2992 + 1;
    int _2996 = _2986 * _2976;
    int _2998 = _1968 >> 31;
    float _3000 = rsqrt(_2946);
    float _3002 = float(_2754);
    int _3004 = _2480 * _2960;
    int _3006 = _3004 + _2996;
    int _3008 = _1612 >> 31;
    if (_2836)
    {
        out.m_53.x = 0.0;
    }
    int _3010 = abs(_1692);
    int _3012 = _3008 & 3;
    float _3014 = 1.0 / _2988;
    int _3016 = _2998 & 3;
    int _3018 = as_type<int>(_2970) + (-2);
    float _3020 = float(uint(_3006));
    int _3022 = _1612 + _3012;
    float _3024 = _2990 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3026 = _1968 + _3016;
    float _3028 = as_type<float>(_3018) * _3020;
    int _3030 = _3022 >> 2;
    float _3032 = _3024 * _3000;
    int _3034 = _3026 >> 2;
    float _3036 = trunc(_3028);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    int _3042 = abs(_3006);
    float _3044 = _2778 * _3032;
    int _3046 = as_type<int>(_3014) + (-2);
    float _3048 = _2792 * _3032;
    int _3050 = _3030 << 4;
    int _3052 = _3050 + 368;
    float _3054 = -_3044;
    float _3056 = _2778 + _3054;
    int _3058 = _3034 << 4;
    int _3060 = _3058 + 800;
    float _3062 = in.m_76.x;
    float _3064 = in.m_76.y;
    float _3066 = in.m_76.z;
    float _3068 = float(uint(_3042));
    float _3070 = -_3048;
    float _3072 = _2792 + _3070;
    int _3074 = abs(_2926);
    float _3076 = _3056 * _3056;
    uint _3078 = uint(int(uint(_3060) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    float _3094 = as_type<float>(_3046) * _3068;
    float _3096 = float(_3074);
    int _3098 = _2994 * int(_3040);
    int _3100 = _3098 + _3006;
    float _3102 = fma(_3072, _3072, _3076);
    int _3104 = abs(_2022);
    float _3106 = _3096 * _3002;
    float _3108 = float(uint(_3100));
    uint _3110 = uint(int(uint(_3052) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    float _3126 = -_2172;
    float _3128 = _3126 + 1.0;
    float _3130 = _2782 * _3032;
    float _3132 = -_2334;
    float _3134 = fma(_1584, _3132, _2942);
    float _3136 = as_type<float>(_3018) * _3108;
    float _3138 = -_2308;
    float _3140 = fma(_2232, _3138, _2876);
    float _3142 = -_2190;
    float _3144 = _3142 + 1.0;
    float _3146 = trunc(_3094);
    float _3148 = precise::max(_3146, 0.0);
    uint _3150 = uint(_3148);
    float _3152 = fma(_1812, _3128, _2884);
    float _3154 = -_3130;
    float _3156 = _2782 + _3154;
    float _3158 = fma(_1316, _3144, _2982);
    int _3160 = ~_2948;
    int _3162 = _3160 + 1;
    float _3164 = _3106 * (-2.0);
    float _3166 = fma(_3156, _3156, _3102);
    int _3168 = ~_3104;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    out.m_78.x = _3140;
    out.m_78.y = _3152;
    out.m_78.z = _3134;
    out.m_78.w = _3158;
    float _3174 = fma(_3164, _3062, _3062);
    float _3176 = trunc(_3136);
    float _3178 = precise::max(_3176, 0.0);
    uint _3180 = uint(_3178);
    float _3182 = fma(_2848, _3164, _2848);
    int _3184 = abs(_2504);
    float _3186 = fma(_2800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3174);
    int _3188 = ~_2040;
    int _3190 = _3188 + _2084;
    int _3192 = _3190 + 1;
    int _3194 = _3052 + 8;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    uint _3198 = uint(int(uint(int(_3196)) >> uint(2)));
    int _3200 = int(_3196) & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    int _3204 = int(_3196) + 1;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    int _3208 = _3204 & 3;
    float _3210 = (*spvDescriptorSet0.vp_c9)._m0[int(_3206)][_3208];
    int _3212 = _3162 * int(_3150);
    int _3214 = _3212 + _3042;
    int _3216 = abs(_1864);
    float _3218 = fma(_3182, _2348, _3186);
    int _3220 = _719 * _3192;
    int _3222 = _3220 + _1480;
    int _3224 = abs(_1972);
    float _3226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3228 = float(uint(_3214));
    int _3230 = _3060 + 8;
    uint _3232 = uint(int(uint(_3230) >> uint(2)));
    uint _3234 = uint(int(uint(int(_3232)) >> uint(2)));
    int _3236 = int(_3232) & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = int(_3232) + 1;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    int _3244 = _3240 & 3;
    float _3246 = (*spvDescriptorSet0.vp_c9)._m0[int(_3242)][_3244];
    bool _3248 = !_1986;
    int _3250 = _3248 ? 0 : 1;
    int _3252 = int(_3040) + int(_3180);
    float _3254 = as_type<float>(_3046) * _3228;
    int _3256 = ~_2892;
    int _3258 = _3256 + 1;
    int _3260 = ~_3010;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    float _3266 = trunc(_3254);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    bool _3272 = _1636 != 3;
    int _3274 = _3258 * _3252;
    int _3276 = _3274 + _3006;
    bool _3278 = _653 == 0;
    int _3280 = _3172 * as_type<int>(_3092);
    int _3282 = abs(_3250);
    int _3284 = _3264 * as_type<int>(_3124);
    bool _3286 = !_3272;
    int _3288 = _3286 ? 0 : (-1);
    float _3290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3292 = uint(_3276) >= uint(_2892);
    int _3294 = ~_2948;
    int _3296 = _3294 + 1;
    int _3298 = ~_3184;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    int _3304 = int(_3150) + int(_3270);
    bool _3306 = !_3292;
    int _3308 = _3306 ? 0 : (-1);
    int _3310 = _3302 * as_type<int>(_3116);
    int _3312 = _3310 + _3284;
    int _3314 = ~_3282;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = _3296 * _3304;
    int _3322 = _3320 + _3042;
    int _3324 = ~_3252;
    int _3326 = _3324 + _3308;
    int _3328 = _3326 + 1;
    bool _3330 = _1984 != 3;
    int _3332 = _3318 * as_type<int>(_3084);
    int _3334 = _3332 + _3280;
    int _3336 = abs(_2072);
    int _3338 = _2892 * _3328;
    int _3340 = _3338 + _3006;
    bool _3342 = !_3330;
    int _3344 = _3342 ? 0 : (-1);
    bool _3346 = uint(_3322) >= uint(_2948);
    int _3348 = ~_3336;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3006 ^ _2892;
    int _3356 = abs(_1782);
    int _3358 = _3352 * as_type<int>(_3238);
    int _3360 = _3358 + _3334;
    bool _3362 = !_3346;
    int _3364 = _3362 ? 0 : (-1);
    uint _3366 = uint(int(uint(_3354) >> uint(31)));
    int _3368 = ~_3356;
    int _3370 = _3368 + 1;
    int _3372 = _3370 + 1;
    int _3374 = abs(_3288);
    int _3376 = ~_3364;
    int _3378 = _3304 + _3376;
    int _3380 = _3378 + 1;
    int _3382 = _3372 * as_type<int>(_3202);
    int _3384 = _3382 + _3312;
    int _3386 = ~int(_3366);
    int _3388 = _3386 + 1;
    int _3390 = abs(_3344);
    int _3392 = ~_3374;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    bool _3398 = _2892 == 0;
    int _3400 = _3380 ^ _3388;
    int _3402 = _3396 * as_type<int>(_3210);
    int _3404 = _3402 + _3384;
    int _3406 = ~_3390;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = _3226 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3414 = ~_3216;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    bool _3420 = !_3398;
    int _3422 = _3420 ? _3340 : (-1);
    int _3424 = _3410 * as_type<int>(_3246);
    int _3426 = _3424 + _3360;
    bool _3428 = _2892 == 0;
    int _3430 = _3404 * _3418;
    int _3432 = ~_3388;
    int _3434 = _3432 + _3400;
    int _3436 = _3434 + 1;
    float _3438 = _3290 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3440 = ~_3224;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    bool _3446 = !_3428;
    int _3448 = _3446 ? _3436 : (-1);
    bool _3450 = !_3278;
    int _3452 = _3450 ? _2958 : (-1);
    int _3454 = _3426 * _3444;
    float _3456 = float(_3448);
    float _3458 = float(_3422);
    int _3460 = _3452 * _3216;
    int _3462 = _3460 + _3430;
    bool _3464 = !_2528;
    int _3466 = _3464 ? 0 : 1;
    float _3468 = -_2290;
    float _3470 = fma(_3412, _3456, _3468);
    bool _3472 = !_1430;
    int _3474 = _3472 ? _3222 : (-1);
    float _3476 = fma(_3438, _3458, _2288);
    float _3478 = _1002 + 0.5;
    int _3480 = abs(_3466);
    float _3482 = _994 + (-0.5);
    int _3484 = _3474 * _3224;
    int _3486 = _3484 + _3454;
    float _3488 = fma(_3438, _3478, _3476);
    float _3490 = -_3412;
    float _3492 = fma(_3490, _3482, _3470);
    float _3494 = -_2186;
    float _3496 = _3494 + 1.0;
    float _3498 = -_2344;
    float _3500 = fma(_1002, _3498, _3488);
    float _3502 = float(_3462);
    float _3504 = float(_3486);
    float _3506 = fma(_994, _3496, _3492);
    float _3508 = float(_2414);
    out.m_80.x = _3502;
    float _3510 = float(_3480);
    out.m_80.w = _3504;
    bool _3512 = !_2532;
    int _3514 = _3512 ? 0 : 1;
    float _3516 = _3510 * _3508;
    out.m_82.x = _3500;
    out.m_82.y = _3506;
    float _3518 = _3290;
    if (_2836)
    {
        return out;
    }
    float _3520 = -_3044;
    float _3522 = _2546 + _3520;
    float _3524 = -_3048;
    float _3526 = _2568 + _3524;
    float _3528 = float(_2496);
    float _3530 = _2834 + (-1.0);
    float _3532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3534 = _3522 + _3532;
    int _3536 = abs(_3514);
    float _3538 = -_3130;
    float _3540 = _2586 + _3538;
    float _3542 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3544 = _3526 + _3542;
    float _3546 = _3534 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3548 = fma(_3530, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3552 = _3540 + _3550;
    float _3554 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3546);
    float _3556 = float(_3536);
    float _3558 = _3516 * (-2.0);
    float _3560 = _3218 * 0.15915493667125701904296875;
    float _3562 = fma(_3552, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3554);
    float _3564 = _2798 + (-1.0);
    float _3566 = fma(_3558, _3064, _3064);
    float _3568 = fma(_3548, _3558, _3548);
    float _3570 = _3556 * _3528;
    bool _3572 = _3562 >= 0.0;
    float _3574 = fma(_2838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3566);
    float _3576 = sqrt(_3166);
    float _3578 = _3570 * (-2.0);
    float _3580 = fma(_3564, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3582 = fma(_3568, _2348, _3574);
    float _3584 = _840 + (-0.5);
    float _3586 = fma(_3578, _3066, _3066);
    float _3588 = fma(_3580, _3578, _3580);
    float _3590 = _3582 * 0.15915493667125701904296875;
    float _3592 = _3560 * 6.283185482025146484375;
    float _3594 = sin(_3592);
    float _3596 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3586);
    float _3598 = _3526;
    if (_3572)
    {
        _3518 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3600 = _3518;
    int _3602 = as_type<int>(_3600);
    if (_3572)
    {
        out.m_53.x = 0.0;
    }
    float _3604 = fma(_3588, _2348, _3596);
    float _3606 = _3560 * 6.283185482025146484375;
    float _3608 = cos(_3606);
    if (_3572)
    {
        float _3610 = _3600 * 5.0;
        _3602 = as_type<int>(_3610);
    }
    int _3612 = _3602;
    float _3614 = _3604 * 0.15915493667125701904296875;
    if (_3572)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10039 = as_type<float>(_3612);
        out.gl_Position.z = _10039;
    }
    float _3616 = _3590 * 6.283185482025146484375;
    float _3618 = sin(_3616);
    float _3620 = _3590 * 6.283185482025146484375;
    float _3622 = cos(_3620);
    if (_3572)
    {
        return out;
    }
    float _3624 = _3614 * 6.283185482025146484375;
    float _3626 = cos(_3624);
    float _3628 = _3000 * _3576;
    float _3630 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _3634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _3636 = _2990 * _3628;
    float _3638 = _3628 * _3630;
    float _3640 = _3608 * _3622;
    float _3642 = _3614 * 6.283185482025146484375;
    float _3644 = sin(_3642);
    float _3646 = _3608 * _3618;
    float _3648 = _3632 * _3638;
    float _3650 = _3594 * _3618;
    float _3652 = _3594 * _3622;
    float _3654 = _3634 * _3636;
    float _3656 = _3628 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3658 = _3656 * 0.5;
    float _3660 = _3522 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3662 = _3608 * _3626;
    float _3664 = _3622 * _3626;
    float _3666 = _3594 * _3626;
    float _3668 = _3618 * _3626;
    float _3670 = _3662 * _3648;
    bool _3672 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3674 = isnan(0.5);
    bool _3676 = _3672 || _3674;
    bool _3678 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3680 = _3676 || _3678;
    float _3682 = fma(_3644, _3640, _3650);
    float _3684 = -_3652;
    float _3686 = fma(_3644, _3646, _3684);
    float _3688 = -_3648;
    float _3690 = _3644 * _3688;
    float _3692 = -_3646;
    float _3694 = fma(_3644, _3652, _3692);
    float _3696 = fma(_3682, _3654, _3670);
    float _3698 = _3666 * _3648;
    float _3700 = fma(_3664, _3654, _3690);
    bool _3702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3704 = isnan(0.5);
    bool _3706 = _3702 || _3704;
    bool _3708 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3710 = _3706 || _3708;
    float _3712 = fma(_3686, _3658, _3696);
    float _3714 = fma(_3644, _3650, _3640);
    float _3716 = fma(_3694, _3654, _3698);
    float _3718 = fma(_3668, _3658, _3700);
    float _3720 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3722 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3724 = fma(_3714, _3658, _3716);
    float _3726 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3720);
    float _3728 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3722);
    float _3730 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3660);
    float _3732 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3726);
    float _3734 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3728);
    float _3736 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3730);
    float _3738 = _3732 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3740 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3742 = _3736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3744 = _2586 + _3738;
    float _3746 = _2568 + _3740;
    float _3748 = _3522 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3750 = 1.0 / _3742;
    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3754 = _3744 + _3752;
    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3758 = _3746 + _3756;
    float _3760 = _3754 * _3754;
    float _3762 = fma(_3758, _3758, _3760);
    float _3764 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3748);
    float _3766 = sqrt(_3762);
    float _3768 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3764);
    float _3770 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3772 = _3770 + _3742;
    float _3774 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3776 = _3772 * _3750;
    float _3778 = _3776 * 0.5;
    float _3780 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3774);
    bool _3782 = _3766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3786 = fma(_3778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3784);
    float _3788 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3780);
    float _3790 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3792 = 1.0 / _3786;
    float _3794 = _2546 + _3790;
    float _3796 = _3790;
    float _3798 = _3774;
    float _3800 = _3772;
    float _3802 = _3724;
    float _3804 = _3750;
    float _3806 = _3762;
    if (!_3782)
    {
        _3796 = _3746;
    }
    float _3808 = _3796;
    float _3810 = _3808;
    if (!_3782)
    {
        _3798 = _3744;
    }
    float _3812 = _3798;
    float _3814 = _3812;
    if (!_3782)
    {
        _3800 = _3794;
    }
    float _3816 = _3800;
    bool _3818 = !_3782;
    float _3820 = _3816;
    float _3822 = _3792;
    if (!_3818)
    {
        float _3824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3828 = _3766 + _3826;
        float _3830 = rsqrt(_3762);
        float _3832 = _3828 * _3824;
        float _3834 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3836 = _3832 * 0.15915493667125701904296875;
        float _3838 = _3836 * 6.283185482025146484375;
        float _3840 = sin(_3838);
        float _3842 = _3836 * 6.283185482025146484375;
        float _3844 = cos(_3842);
        float _3846 = fma(_3840, _3834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3848 = _3830 * _3846;
        float _3850 = _3844 + (-1.0);
        float _3852 = fma(_3758, _3848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3854 = fma(_3754, _3848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3856 = _3850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3858 = fma(_3794, _3844, _3856);
        _3820 = _3858;
        _3810 = _3852;
        _3814 = _3854;
        _3802 = _3850;
    }
    float _3860 = _3820;
    float _3862 = _3810;
    float _3864 = _3814;
    float _3866 = _3802;
    float _3868 = -_3044;
    float _3870 = _3868 + _3860;
    float _3872 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3874 = _3792 * _3872;
    float _3876 = -_3048;
    float _3878 = _3876 + _3862;
    float _3880 = -_3130;
    float _3882 = _3880 + _3864;
    float _3884 = _3878;
    float _3886 = _3882;
    float _3888 = _3866;
    if (_3710)
    {
        _3804 = 1.0;
    }
    float _3890 = _3804;
    float _3892 = _3890;
    if (_3680)
    {
        _3822 = _3870;
    }
    float _3894 = _3822;
    float _3896 = _3894;
    if (!_3680)
    {
        float _3898 = _3534 * _3534;
        float _3900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3902 = -_2586;
        float _3904 = _3902 + _3864;
        float _3906 = -_2546;
        float _3908 = _3906 + _3860;
        float _3910 = fma(_3544, _3544, _3898);
        float _3912 = -_2568;
        float _3914 = _3912 + _3862;
        float _3916 = fma(_3552, _3552, _3910);
        float _3918 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3920 = sqrt(_3916);
        float _3922 = 1.0 / _3628;
        float _3924 = _3918 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3926 = precise::min(_3920, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3928 = _3926 * _3900;
        float _3930 = _3928 * _3922;
        float _3932 = _3924 * _3930;
        float _3934 = _3904 * _3930;
        float _3936 = fma(_3908, _3932, _3522);
        float _3938 = fma(_3914, _3932, _3526);
        float _3940 = fma(_3924, _3934, _3540);
        _3896 = _3936;
        _3884 = _3938;
        _3886 = _3940;
        _3888 = _3922;
    }
    float _3942 = _3896;
    float _3944 = _3884;
    float _3946 = _3886;
    float _3948 = _3888;
    float _3950 = _3948;
    if (!_3710)
    {
        float _3952 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3954 = _3952 * 0.15915493667125701904296875;
        float _3956 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3958 = _3954 * 6.283185482025146484375;
        float _3960 = cos(_3958);
        float _3962 = _3956 * 0.15915493667125701904296875;
        float _3964 = _3954 * 6.283185482025146484375;
        float _3966 = sin(_3964);
        float _3968 = 1.0 / _3960;
        float _3970 = _3962 * 6.283185482025146484375;
        float _3972 = cos(_3970);
        float _3974 = _3966 * _3968;
        float _3976 = _3962 * 6.283185482025146484375;
        float _3978 = sin(_3976);
        float _3980 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3982 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3980;
        float _3984 = _3972 * _3974;
        float _3986 = 1.0 / _3984;
        float _3988 = 1.0 / _3982;
        float _3990 = _3978 * _3986;
        float _3992 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3994 = fma(_3874, _3990, _3992);
        float _3996 = _3994 * _3988;
        float _3998 = precise::clamp(_3996, 0.0, 1.0);
        _3950 = _3954;
        _3892 = _3998;
    }
    float _4000 = _3950;
    float _4002 = _3892;
    float _4004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4006 = _3942 + _4004;
    float _4008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4010 = _3944 + _4008;
    float _4012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4014 = _3946 + _4012;
    float _4016 = _4006 * _4006;
    float _4018 = fma(_4010, _4010, _4016);
    float _4020 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4022 = fma(_4014, _4014, _4018);
    float _4024 = rsqrt(_4022);
    float _4026 = sqrt(_4022);
    float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4030 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4032 = _4010 * _4028;
    float _4034 = _4014 * _4028;
    float _4036 = _4032 * _4032;
    float _4038 = _4034 * _4034;
    float _4040 = _4036 + _4038;
    float _4042 = sqrt(_4040);
    bool _4044 = _4042 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4048 = _4042 + _4046;
    float _4050 = _4014;
    float _4052 = _4040;
    float _4054 = _4048;
    float _4056 = _4006;
    if (_4044)
    {
        float _4058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4050 = _4058;
    }
    float _4060 = _4050;
    if (!_4044)
    {
        _3598 = _4038;
    }
    float _4062 = _3598;
    float _4064 = _4062;
    if (_4044)
    {
        float _4066 = rsqrt(_4040);
        _4052 = _4066;
    }
    float _4068 = _4052;
    float _4070 = _4068;
    if (_4044)
    {
        float _4072 = _4048 * _4060;
        _4054 = _4072;
    }
    float _4074 = _4054;
    if (_4044)
    {
        float _4076 = _4074 * 0.15915493667125701904296875;
        _2748 = _4076;
    }
    float _4078 = _2748;
    float _4080 = _4024;
    if (_4044)
    {
        float _4082 = _4078 * 6.283185482025146484375;
        float _4084 = sin(_4082);
        _4080 = _4084;
    }
    float _4086 = _4080;
    float _4088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4090 = precise::max(0.0, _4088);
    float _4092 = _4000;
    float _4094 = _4090;
    float _4096 = _4088;
    if (_4044)
    {
        float _4098 = _4078 * 6.283185482025146484375;
        float _4100 = cos(_4098);
        _4092 = _4100;
    }
    float _4102 = _4092;
    float _4104 = -_4028;
    float _4106 = -_4090;
    float _4108 = fma(_4006, _4104, _4106);
    if (!_4044)
    {
        _4094 = _4032;
    }
    float _4110 = _4094;
    float _4112 = _4110;
    if (_4044)
    {
        float _4114 = _4108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4096 = _4114;
    }
    float _4116 = _4096;
    float _4118 = floor(_4020);
    float _4120 = _4086;
    float _4122 = _4116;
    if (_4044)
    {
        float _4124 = fma(_4086, _4116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4056 = _4124;
    }
    float _4126 = _4056;
    float _4128 = _4126;
    if (!_4044)
    {
        _4120 = _4036;
    }
    float _4130 = _4120;
    float _4132 = _4130;
    if (_4044)
    {
        float _4134 = _4102 + (-1.0);
        _4122 = _4134;
    }
    float _4136 = _4122;
    float _4138 = _4136;
    if (_4044)
    {
        float _4140 = _4068 * _4126;
        _3806 = _4140;
    }
    float _4142 = _3806;
    if (!_4044)
    {
        _4128 = _4108;
    }
    float _4144 = _4128;
    float _4146 = _4144;
    if (_4044)
    {
        float _4148 = _4136 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4070 = _4148;
    }
    float _4150 = _4070;
    if (_4044)
    {
        float _4152 = _4032 * _4142;
        _4112 = _4152;
    }
    float _4154 = _4112;
    if (!_4044)
    {
        _4138 = _4034;
    }
    float _4156 = _4138;
    float _4158 = _4156;
    if (_4044)
    {
        float _4160 = _4034 * _4142;
        _4158 = _4160;
    }
    float _4162 = _4158;
    if (_4044)
    {
        float _4164 = fma(_4108, _4102, _4150);
        _4146 = _4164;
    }
    float _4166 = _4146;
    if (_4044)
    {
        float _4168 = _4154 * _4154;
        _4132 = _4168;
    }
    float _4170 = _4132;
    if (_4044)
    {
        float _4172 = _4162 * _4162;
        _4064 = _4172;
    }
    float _4174 = _4064;
    float _4176 = fma(_4166, _4166, _4170);
    float _4178 = _4176 + _4174;
    float _4180 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4030);
    float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4184 = fma(_4026, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4182);
    float _4186 = precise::clamp(_4184, 0.0, 1.0);
    float _4188 = rsqrt(_4178);
    float _4190 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4180);
    float _4192 = -_4186;
    float _4194 = _4192 + 1.0;
    float _4196 = _4190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4198 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4200 = fma(_3540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4202 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4204 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4206 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4208 = abs(_4194);
    float _4210 = log2(_4208);
    float _4212 = -_4204;
    float _4214 = fma(_4212, _4198, 1.0);
    float _4216 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4218 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4202);
    float _4220 = _4188 * _4154;
    float _4222 = _4188 * _4166;
    float _4224 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4216);
    float _4226 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4218);
    float _4228 = _4188 * _4162;
    float _4230 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4232 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4224);
    float _4234 = _4226 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4236 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4206);
    float _4238 = -_4230;
    float _4240 = fma(_4222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4238);
    float _4242 = _4232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4244 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4246 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4236);
    float _4248 = -_4228;
    float _4250 = fma(_4248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4240);
    float _4252 = floor(_4200);
    float _4254 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4244);
    float _4256 = _4246 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4258 = fma(_4250, -0.5, 0.5);
    float _4260 = _4210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4262 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4254);
    float _4264 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4266 = log2(_4214);
    float _4268 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4262);
    float _4270 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4264);
    float _4272 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4270);
    float _4274 = 1.0 / _4268;
    float _4276 = -_4118;
    float _4278 = _4020 + _4276;
    float _4280 = fma(_4250, 0.5, 0.5);
    float _4282 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4284 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4272);
    float _4286 = -_4252;
    float _4288 = _4200 + _4286;
    float _4290 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4282);
    float _4292 = sqrt(_4258);
    float _4294 = fma(_4280, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4296 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4290);
    float _4298 = fma(_4280, _4294, -0.212114393711090087890625);
    float _4300 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4296);
    float _4302 = exp2(_4260);
    float _4304 = _4266 * 0.693147182464599609375;
    float _4306 = _4284 * _4274;
    float _4308 = _4300 * _4274;
    float2 _11154 = float2(_4278, _4288);
    float _4310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11154, float2(0.0), isnan(_11154)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11154, float2(0.0), isnan(_11154)), level(0.0)).x;
    float _4312 = fma(_4280, _4298, 1.570728778839111328125);
    float _4314 = _4304 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4316 = fma(_4306, 0.5, 0.5);
    float _4318 = _4292 * 0.636619746685028076171875;
    float _4320 = _4222 + 1.0;
    float _4322 = fma(_4308, -0.5, 0.5);
    float _4324 = -_4312;
    float _4326 = fma(_4318, _4324, 1.0);
    float _4328 = -_4222;
    float _4330 = fma(_4302, _4320, _4328);
    float3 _11193 = float3(_4316, _4322, _4314);
    float _4332 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11193, float3(0.0), isnan(_11193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11193, float3(0.0), isnan(_11193)), level(0.0)).x;
    float _4334 = fma(_4330, 0.5, 0.5);
    float3 _11206 = float3(_4316, _4322, _4314);
    float4 _4337 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11206, float3(0.0), isnan(_11206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11206, float3(0.0), isnan(_11206)), level(0.0)).xyzw;
    float _4339 = _4337.x;
    float _4341 = _4337.y;
    float _4343 = _4337.z;
    float _4345 = _4337.w;
    float2 _11222 = float2(_4326, _4334);
    float3 _4349 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11222, float2(0.0), isnan(_11222)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11222, float2(0.0), isnan(_11222)), level(0.0)).xyz;
    float _4351 = _4349.x;
    float _4353 = _4349.y;
    float _4355 = _4349.z;
    float _4357 = abs(_3874);
    float _4359 = log2(_4357);
    float _4361 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4363 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4365 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4367 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4369 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4361);
    float _4371 = -_3644;
    float _4373 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4363);
    float _4375 = -_3644;
    float _4377 = fma(_4375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4365);
    float _4379 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4381 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4383 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4385 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4387 = -_3644;
    float _4389 = fma(_4387, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4379);
    float _4391 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4393 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4381);
    float _4395 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4383);
    float _4397 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4399 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4391);
    float _4401 = fma(_4367, _4367, 1.0);
    float _4403 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4405 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4373);
    float _4407 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4389);
    float _4409 = exp2(_4397);
    float _4411 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4377);
    float _4413 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4385);
    float _4415 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4403);
    float _4417 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4369);
    float _4419 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4421 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4413);
    float _4423 = rsqrt(_4401);
    float _4425 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4415);
    float _4427 = _4367 * _4407;
    float _4429 = _4367 * _4405;
    float _4431 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4393);
    float _4433 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4399);
    out.m_84.x = _4417;
    out.m_84.y = _4421;
    out.m_84.z = _4425;
    float _4435 = fma(_4419, _4421, _4427);
    float _4437 = fma(_4409, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4439 = precise::clamp(_4437, 0.0, 1.0);
    float _4441 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4395);
    float _4443 = fma(_4419, _4417, _4429);
    float _4445 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4447 = in.m_86.x;
    float _4449 = fma(_4439, -2.0, 3.0);
    float _4451 = _4439 * _4439;
    float _4453 = _4367 * _4423;
    float _4455 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4445);
    float _4457 = _4210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4459 = _4451 * _4449;
    float _4461 = _4367 * _4411;
    float _4463 = -_4431;
    float _4465 = _4453 * _4463;
    float _4467 = exp2(_4457);
    float _4469 = -_4459;
    float _4471 = _4469 + 1.0;
    bool _4473 = _3874 <= 8000.0;
    bool _4475 = isnan(_3874);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan(8000.0);
    bool _4481 = _4477 || _4479;
    float _4483 = float(_4481);
    float _4485 = -_4433;
    float _4487 = _4453 * _4485;
    float _4489 = _4268 * 0.5;
    float _4491 = fma(_4471, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4459);
    float _4493 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4455);
    float _4495 = -_4441;
    float _4497 = _4453 * _4495;
    float _4499 = fma(_4423, _4405, _4465);
    float _4501 = fma(_4423, _4407, _4487);
    float _4503 = _4483 * _4491;
    float _4505 = fma(_4423, _4411, _4497);
    float _4507 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4493);
    float _4509 = _4284 + _4268;
    float _4511 = _4503 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4513 = fma(_4419, _4425, _4461);
    float _4515 = -_4467;
    float _4517 = _4515 + 1.0;
    float _4519 = _4507 + _4268;
    float _4521 = _4431 + _4443;
    float _4523 = _4517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4525 = _4519 * 0.5;
    float _4527 = _4509 * 0.5;
    float _4529 = fma(_4300, -0.5, _4489);
    out.gl_Position.x = _4284;
    out.gl_Position.y = _4300;
    out.gl_Position.z = _4507;
    out.gl_Position.w = _4268;
    float _4531 = _4433 + _4435;
    float _4533 = _4441 + _4513;
    bool _4535 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4537 = isnan(_4026);
    bool _4539 = _4535 || _4537;
    bool _4541 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4543 = _4539 || _4541;
    out.m_88.x = _4527;
    out.m_88.y = _4529;
    out.m_88.z = _4525;
    out.m_88.w = _4268;
    float _4545 = _4002 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_90.x = _4499;
    out.m_90.y = _4501;
    out.m_90.z = _4505;
    out.m_92.x = _4521;
    out.m_92.y = _4531;
    out.m_92.z = _4533;
    float _4547 = -_4523;
    float _4549 = _4547 + 1.0;
    float _4551 = _4268;
    float _4553 = _4507;
    float _4555 = _4300;
    float _4557 = _4549;
    if (!_4543)
    {
        _4551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4559 = _4551;
    float _4561 = _4559;
    float _4563 = _4559;
    if (!_4543)
    {
        _4553 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4565 = _4553;
    float _4567 = _4565;
    float _4569 = _4565;
    if (!_4543)
    {
        _4555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4571 = _4555;
    float _4573 = -_4310;
    float _4575 = _4573 + 1.0;
    float _4577 = _4575 * _4511;
    float _4579 = precise::clamp(_4577, 0.0, 1.0);
    float _4581 = -_4579;
    float _4583 = fma(_4581, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4585 = _4583 * _4447;
    float _4587 = _4523 * _4332;
    float _4589 = _4585 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4591 = _4345 * _4587;
    float _4593 = _4345 * _4549;
    float _4595 = _4341;
    float _4597 = _4339;
    float _4599 = _4571;
    float _4601 = _4571;
    if (!_4543)
    {
        _4557 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4603 = _4557;
    out.m_94.x = _4589;
    float _4605 = _4355 * _4587;
    float _4607 = fma(_4351, _4591, _4339);
    float _4609 = fma(_4353, _4591, _4341);
    float _4611 = _4603;
    float _4613 = _4603;
    if (!_4543)
    {
        _4595 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4615 = _4595;
    float _4617 = fma(_4345, _4605, _4343);
    float _4619 = _4615;
    float _4621 = _4615;
    if (!_4543)
    {
        _4597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4623 = _4597;
    out.m_96.x = _4607;
    out.m_96.y = _4609;
    out.m_96.z = _4617;
    out.m_96.w = _4593;
    bool _4625 = !_4543;
    float _4627 = _4623;
    float _4629 = _4623;
    if (!_4625)
    {
        bool _4631 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4633 = isnan(_4026);
        bool _4635 = _4631 || _4633;
        bool _4637 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4639 = _4635 || _4637;
        if (!_4639)
        {
            float _4641 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4643 = _4026 + _4641;
            float _4645 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4647 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4645;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4653 = 1.0 / _4647;
            float _4655 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4657 = _4655 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4659 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4661 = _4659 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4663 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4665 = _4663 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4667 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4669 = _4667 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4671 = _4643 * _4653;
            float _4673 = precise::clamp(_4671, 0.0, 1.0);
            float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4677 = _4675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4679 = fma(_4673, _4651, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4681 = fma(_4673, _4677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4683 = fma(_4673, _4657, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4685 = fma(_4673, _4661, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4687 = fma(_4673, _4665, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4689 = fma(_4673, _4669, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4629 = _4683;
            _4601 = _4687;
            _4621 = _4679;
            _4569 = _4685;
            _4563 = _4681;
            _4613 = _4689;
            _4691 = true;
        }
        else
        {
            bool _4693 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4695 = isnan(_4026);
            bool _4697 = _4693 || _4695;
            bool _4699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4701 = _4697 || _4699;
            if (!_4701)
            {
                _4619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4703 = _4619;
            _4621 = _4703;
            if (!_4701)
            {
                _4627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4705 = _4627;
            _4629 = _4705;
            if (!_4701)
            {
                _4561 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4707 = _4561;
            _4563 = _4707;
            if (!_4701)
            {
                _4567 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4709 = _4567;
            _4569 = _4709;
            if (!_4701)
            {
                _4599 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4711 = _4599;
            _4601 = _4711;
            if (!_4701)
            {
                _4611 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4713 = _4611;
            bool _4715 = !_4701;
            _4613 = _4713;
            if (!_4715)
            {
                bool _4717 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4719 = isnan(_4026);
                bool _4721 = _4717 || _4719;
                bool _4723 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4725 = _4721 || _4723;
                if (!_4725)
                {
                    float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4729 = _4026 + _4727;
                    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4733 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4731;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4739 = 1.0 / _4733;
                    float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4743 = _4741 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4747 = _4745 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4753 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4755 = _4753 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4757 = _4729 * _4739;
                    float _4759 = precise::clamp(_4757, 0.0, 1.0);
                    float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4765 = fma(_4759, _4737, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4767 = fma(_4759, _4763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4769 = fma(_4759, _4743, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4771 = fma(_4759, _4747, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4773 = fma(_4759, _4751, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4775 = fma(_4759, _4755, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4629 = _4769;
                    _4601 = _4773;
                    _4621 = _4765;
                    _4569 = _4771;
                    _4563 = _4767;
                    _4613 = _4775;
                    _4691 = true;
                }
                else
                {
                    _4629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4601 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4569 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4563 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4613 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4691 = false;
    float _4777 = _4629;
    float _4779 = _4601;
    float _4781 = _4621;
    float _4783 = _4569;
    float _4785 = _4563;
    float _4787 = _4613;
    float _4789 = fma(_4531, -0.5, 0.5);
    float _4791 = precise::clamp(_4789, 0.0, 1.0);
    float _4793 = -_4777;
    float _4795 = _4793 + _4779;
    float _4797 = _4545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4799 = -_4781;
    float _4801 = _4799 + _4783;
    float _4803 = fma(_4791, _4795, _4777);
    out.m_98.x = 0.0;
    float _4805 = -_4785;
    float _4807 = _4805 + _4787;
    float _4809 = fma(_4791, _4801, _4781);
    float _4811 = _4803 * 0.586610972881317138671875;
    out.m_53.x = _4797;
    bool _4813 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4815 = fma(_4791, _4807, _4785);
    float _4817 = fma(_4809, 0.298911988735198974609375, _4811);
    bool _4819 = _4002 > 0.0;
    bool _4821 = isnan(_4002);
    bool _4823 = _4819 || _4821;
    bool _4825 = isnan(0.0);
    bool _4827 = _4823 || _4825;
    float _4829 = fma(_4815, 0.114477999508380889892578125, _4817);
    float _4831 = -_4829;
    float _4833 = _4809 + _4831;
    float _4835 = -_4829;
    float _4837 = _4803 + _4835;
    float _4839 = -_4829;
    float _4841 = _4815 + _4839;
    float _4843 = fma(_4833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    float _4845 = fma(_4837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    float _4847 = fma(_4841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    bool _4849 = !_4813;
    if (!_4849)
    {
        float _4851 = -_3942;
        float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4855 = -_3944;
        float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4859 = -_3946;
        float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4863 = _4853 * _4853;
        float _4865 = fma(_4857, _4857, _4863);
        float _4867 = fma(_4861, _4861, _4865);
        float _4869 = sqrt(_4867);
        float _4871 = rsqrt(_4867);
        float _4873 = -_4869;
        float _4875 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4877 = _4875 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4879 = precise::clamp(_4877, 0.0, 1.0);
        float _4881 = _4857 * _4871;
        float _4883 = _4853 * _4871;
        float _4885 = abs(_4879);
        float _4887 = log2(_4885);
        float _4889 = _4861 * _4871;
        float _4891 = _4881 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4893 = _4531 * _4883;
        float _4895 = -_4883;
        float _4897 = -_4891;
        float _4899 = fma(_4895, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4897);
        float _4901 = fma(_4521, _4881, _4893);
        float _4903 = -_4889;
        float _4905 = fma(_4903, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4899);
        float _4907 = fma(_4533, _4889, _4901);
        float _4909 = precise::clamp(_4907, 0.0, 1.0);
        float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4913 = _4905 + _4911;
        float _4915 = _4887 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4917 = _4913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4919 = precise::clamp(_4917, 0.0, 1.0);
        float _4921 = exp2(_4915);
        float _4923 = _4921 * _4919;
        float _4925 = _4909 * _4923;
        float _4927 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4929 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4931 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4927;
        out.m_98.y = _4929;
        out.m_98.z = _4931;
    }
    out.m_100.x = _4843;
    out.m_100.y = _4845;
    out.m_100.z = _4847;
    if (_4827)
    {
        return out;
    }
    float _4933 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4933;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4691 = false;
    bool _457 = false;
    bool _313 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = in.m_48.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = _116;
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5000 = as_type<float>(_143);
        out.gl_Position.z = _5000;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _145 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_116);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_121);
    bool _157 = _125 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _133;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    float _167 = _125 * _163;
    int _169 = 0;
    float _171 = _167;
    if (_161)
    {
        float _173 = _165 * 5.0;
        _169 = as_type<int>(_173);
    }
    int _175 = _169;
    out.m_51.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5063 = as_type<float>(_175);
        out.gl_Position.z = _5063;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_58.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        _215 = _167;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    bool _225 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_219);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -_235;
    float _243 = _241 + 1.0;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _239;
    float _265 = _255 * _243;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = _223 * _263;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    bool _293 = !_261;
    float _311;
    if (!_293)
    {
        float _295 = in.m_58.x;
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _299 = _295 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        _311 = _167;
    }
    _313 = false;
    float _315 = _311;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _341 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _343 = isnan(_315);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _353;
    bool _357 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _359 = isnan(_315);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = 1.0 / _323;
    float _371 = -_335;
    float _373 = _371 + 1.0;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _377 = _351 * _373;
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = 1.0 / _339;
    float _385 = _355 * _369;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _393 = _389 * _383;
    float _395 = _391 * _377;
    float _397 = -_367;
    float _399 = _397 + 1.0;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _403 = _315 + _401;
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _407 = _335 * _399;
    float _409 = fma(_393, _403, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = fma(_409, _407, _405);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _421 = _411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[117].x, _417);
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _427 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _429 = _423 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _431 = _425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _421;
    out.m_62.y = _431;
    out.m_62.z = _427;
    out.m_62.w = _429;
    float _433 = _291 * _415;
    float _435 = _289 * _413;
    bool _437 = !_375;
    float _455;
    if (!_437)
    {
        float _439 = in.m_58.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _167;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _473 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _475 = isnan(_459);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _503;
    float _507 = -_483;
    float _509 = _507 + 1.0;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _525 = 1.0 / _471;
    float _527 = 1.0 / _487;
    float _529 = _505 * _501;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _535 = _499 * _509;
    float _537 = -_499;
    float _539 = _537 + 1.0;
    float _541 = fma(_529, _463, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _543;
    float _547 = _521 * _539;
    float _549 = _533 * _525;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _553 = _459 + _551;
    bool _555 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _557 = isnan(_459);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = _541 * _547;
    float _569 = -_521;
    float _571 = _569 + 1.0;
    float _573 = fma(_549, _553, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _577 = _459 + _575;
    float _579 = _545 * _527;
    float _581 = -_565;
    float _583 = _581 + 1.0;
    float _585 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[131].x, _567);
    float _587 = fma(_579, _577, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _589 = _483 * _583;
    float _591 = fma(_573, _535, _585);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _595 = fma(_587, _589, _591);
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _599 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _603 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[134].x, _595);
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _599;
    out.m_64.y = _605;
    out.m_64.z = _607;
    out.m_64.w = _609;
    bool _611 = !_523;
    float _613 = _599;
    float _615 = _609;
    float _617 = _585;
    if (!_611)
    {
        float _619 = in.m_58.x;
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _623 = _619 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _171 = _633;
    }
    float _635 = _171;
    float _637 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _639 = int(_637);
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _643 = _641 != 0;
    float _645 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _647 = int(_645);
    float _649 = float(_639);
    float _651 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _653 = int(_651);
    if (_643)
    {
        _613 = 1.0;
    }
    float _655 = _613;
    float _657 = _655;
    if (_643)
    {
        _615 = 1.0;
    }
    float _659 = _615;
    float _661 = float(_647);
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _665 = int(_663);
    float _667 = 1.0 / _649;
    float _669 = float(uint(_653));
    int _671 = ~_653;
    int _673 = _671 + 1;
    float _675 = 1.0 / _661;
    float _677 = float(uint(_665));
    float _679 = _667 * _125;
    float _681 = 1.0 / _669;
    float _683 = _675 * _125;
    float _685 = 1.0 / _677;
    float _687 = _675;
    float _689 = _649;
    float _691 = _659;
    if (_643)
    {
        float _693 = in.m_58.x;
        float _695 = in.m_58.y;
        _687 = _693;
        _689 = _695;
    }
    float _697 = _687;
    float _699 = _689;
    float _701 = trunc(_679);
    int _703 = int(_701);
    int _705 = as_type<int>(_681) + (-2);
    float _707 = trunc(_683);
    int _709 = int(_707);
    int _711 = as_type<int>(_685) + (-2);
    int _713 = as_type<int>(_685);
    if (_643)
    {
        _713 = 0;
    }
    int _715 = _713;
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _719 = int(_717);
    float _721 = float(uint(_703));
    float _723 = _721;
    float _725 = _697;
    float _727 = _699;
    int _729 = _715;
    if (_643)
    {
        _617 = _697;
    }
    float _731 = _617;
    float _733 = as_type<float>(_711) * _721;
    float _735 = _731;
    if (_643)
    {
        _723 = _699;
    }
    float _737 = _723;
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _741 = int(_739);
    float _743 = float(uint(_709));
    float _745 = as_type<float>(_705) * _743;
    float _747 = trunc(_733);
    float _749 = precise::max(_747, 0.0);
    uint _752 = uint(_749);
    float _754 = float(uint(_719));
    float _756 = float(_741);
    float _758 = 1.0 / _754;
    float _760 = 1.0 / _756;
    int _762 = as_type<int>(_754);
    float _764 = _756;
    float _766 = _745;
    float _768 = _737;
    if (_643)
    {
        _762 = 0;
    }
    int _770 = _762;
    float _772 = trunc(_745);
    float _774 = precise::max(_772, 0.0);
    uint _776 = uint(_774);
    int _778 = _770;
    if (_643)
    {
        _764 = _731;
    }
    float _780 = _764;
    float _782 = _780;
    if (_643)
    {
        _766 = _731;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_643)
    {
        float _788 = in.m_58.x;
        float _790 = in.m_58.y;
        float _792 = in.m_58.z;
        float _794 = _788 * 3.1415927410125732421875;
        float _796 = _794 * 0.15915493667125701904296875;
        float _798 = _790 * 3.1415927410125732421875;
        float _800 = _798 * 0.15915493667125701904296875;
        float _802 = _796 * 6.283185482025146484375;
        float _804 = sin(_802);
        float _806 = _800 * 6.283185482025146484375;
        float _808 = sin(_806);
        _691 = 5.839270114898681640625;
        _782 = _792;
        _657 = 7.345489978790283203125;
        _725 = _788;
        _735 = _790;
        _727 = _790;
        _768 = _808;
        _778 = 1;
        _786 = _804;
        _729 = 2;
    }
    float _810 = _691;
    float _812 = _782;
    float _814 = _657;
    float _816 = _725;
    float _818 = _735;
    float _820 = _727;
    float _822 = _768;
    int _824 = _778;
    float _826 = _786;
    int _828 = _729;
    int _830 = _673 * int(_776);
    int _832 = _830 + _709;
    int _834 = ~_665;
    int _836 = _834 + 1;
    float _838 = _810 * _812;
    float _840 = in.m_58.z;
    float _842 = in.m_58.w;
    float _844 = _760 * _125;
    float _846 = float(uint(_832));
    float _848 = _814 * _816;
    int _850 = _836 * int(_752);
    int _852 = _850 + _703;
    float _854 = floor(_838);
    float _856 = float(_709);
    float _858 = as_type<float>(_705) * _846;
    float _860 = float(_653);
    float _862 = _814 * _818;
    float _864 = float(uint(_852));
    float _866 = _816 * 2.0;
    float _868 = floor(_848);
    bool _870 = _856 >= _860;
    bool _872 = isnan(_856);
    bool _874 = _870 || _872;
    bool _876 = isnan(_860);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = as_type<float>(_711) * _864;
    int _884 = as_type<int>(_758) + (-2);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _888 = _635 + _886;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _892 = _890 != 0;
    bool _894 = _820 > 0.5;
    float _896 = trunc(_844);
    int _898 = int(_896);
    float _900 = -_854;
    float _902 = _838 + _900;
    float _904 = float(_703);
    bool _906 = _842 > 0.5;
    bool _908 = _840 > 0.5;
    float _910 = trunc(_858);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = -_868;
    float _918 = _848 + _916;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _930 = _928 != 0;
    float _932 = -_195;
    int _934 = _908 ? as_type<int>(_932) : as_type<int>(_195);
    float _936 = trunc(_882);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    float _942 = float(uint(_898));
    int _944 = ~_653;
    int _946 = _944 + 1;
    int _948 = ~_665;
    int _950 = _948 + 1;
    int _952 = int(_906);
    int _954 = _908 ? 2 : 0;
    int _956 = _952 | _954;
    int _958 = _892 ? 4 : 0;
    int _960 = _956 | _958;
    int _962 = _922 ? 8 : 0;
    int _964 = _960 | _962;
    int _966 = _926 ? 16 : 0;
    int _968 = _964 | _966;
    int _970 = _930 ? 32 : 0;
    int _972 = _968 | _970;
    int _974 = _894 ? 64 : 0;
    int _976 = _972 | _974;
    int _978 = _976 & 64;
    float _980 = trunc(_880);
    int _982 = int(_980);
    int _984 = int(_776) + int(_914);
    float _986 = as_type<float>(_884) * _942;
    float _988 = -_191;
    int _990 = _894 ? as_type<int>(_988) : as_type<int>(_191);
    bool _992 = !_930;
    float _994 = _992 ? _195 : as_type<float>(_934);
    int _996 = _946 * _984;
    int _998 = _996 + _709;
    bool _1000 = !_926;
    float _1002 = _1000 ? _191 : as_type<float>(_990);
    float _1004 = floor(_862);
    float _1006 = float(_665);
    int _1008 = int(_752) + int(_940);
    bool _1010 = _904 >= _1006;
    bool _1012 = isnan(_904);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(_1006);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _918 * _860;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1034 = _1032 != 0;
    int _1036 = _950 * _1008;
    int _1038 = _1036 + _703;
    float _1040 = trunc(_1020);
    int _1042 = int(_1040);
    bool _1044 = !_892;
    int _1046 = _1044 ? 0 : 1;
    bool _1048 = !_1030;
    int _1050 = _1048 ? 0 : 1;
    bool _1052 = !_1026;
    int _1054 = _1052 ? 0 : 1;
    bool _1056 = uint(_998) >= uint(_653);
    float _1058 = trunc(_1022);
    int _1060 = int(_1058);
    float _1062 = _902 * _1006;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1066 = _1064 != 0;
    float _1068 = -_1004;
    float _1070 = _862 + _1068;
    bool _1072 = uint(_1038) >= uint(_665);
    bool _1074 = !_1034;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = trunc(_986);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    bool _1084 = !_1056;
    int _1086 = _1084 ? 0 : (-1);
    bool _1088 = !_1072;
    int _1090 = _1088 ? 0 : (-1);
    int _1092 = abs(_1046);
    int _1094 = ~_984;
    int _1096 = _1094 + _1086;
    int _1098 = _1096 + 1;
    float _1100 = trunc(_1062);
    int _1102 = int(_1100);
    bool _1104 = !_1066;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _1060 * _1092;
    int _1110 = _1108 + _709;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1122 = _1120 != 0;
    int _1124 = _653 * _1098;
    int _1126 = _1124 + _709;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1130 = _1128 != 0;
    int _1132 = ~_1008;
    int _1134 = _1132 + _1090;
    int _1136 = _1134 + 1;
    bool _1138 = !_1130;
    int _1140 = _1138 ? 0 : 1;
    int _1142 = ~_719;
    int _1144 = _1142 + 1;
    int _1146 = _665 * _1136;
    int _1148 = _1146 + _703;
    int _1150 = abs(_1140);
    bool _1152 = _653 == 0;
    int _1154 = _1144 * int(_1082);
    int _1156 = _1154 + _898;
    bool _1158 = !_1114;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _1102 * _1150;
    int _1164 = _1162 + _703;
    float _1166 = _163 * _125;
    bool _1168 = _665 == 0;
    int _1170 = ~_982;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = _860 * _1166;
    bool _1178 = !_1152;
    int _1180 = _1178 ? _1126 : (-1);
    float _1182 = _1006 * _1166;
    int _1184 = ~_1042;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1168;
    int _1192 = _1190 ? _1148 : (-1);
    int _1194 = _1180 * _1174;
    float _1196 = float(uint(_1156));
    float _1198 = trunc(_1176);
    int _1200 = int(_1198);
    bool _1202 = !_1118;
    int _1204 = _1202 ? 0 : 1;
    int _1206 = _1192 * _1188;
    int _1208 = _653 + (-1);
    float _1210 = as_type<float>(_884) * _1196;
    int _1212 = _665 + (-1);
    int _1214 = abs(_1204);
    int _1216 = _982 * _1208;
    int _1218 = _1216 + _1194;
    int _1220 = abs(_1050);
    float _1222 = trunc(_1210);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = _1042 * _1212;
    int _1230 = _1228 + _1206;
    int _1232 = abs(_1076);
    int _1234 = _1218 * _1220;
    int _1236 = abs(_1054);
    int _1238 = _1230 * _1214;
    int _1240 = abs(_1106);
    float _1242 = trunc(_1182);
    int _1244 = int(_1242);
    int _1246 = _1200 * _1236;
    int _1248 = _1246 + _1234;
    int _1250 = abs(_1160);
    int _1252 = _1110 * _1232;
    int _1254 = _1252 + _1248;
    int _1256 = ~_719;
    int _1258 = _1256 + 1;
    int _1260 = int(_1082) + int(_1226);
    int _1262 = _1060 * _1240;
    int _1264 = _1262 + _1254;
    bool _1266 = !_1122;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = -_195;
    int _1272 = _906 ? as_type<int>(_1270) : as_type<int>(_195);
    int _1274 = _1258 * _1260;
    int _1276 = _1274 + _898;
    float _1278 = -_191;
    int _1280 = _908 ? as_type<int>(_1278) : as_type<int>(_191);
    int _1282 = _1244 * _1250;
    int _1284 = _1282 + _1238;
    float _1286 = float(uint(_1264));
    int _1288 = abs(_1268);
    bool _1290 = uint(_1276) >= uint(_719);
    float _1292 = as_type<float>(_705) * _1286;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1300 = _1298 != 0;
    float _1302 = trunc(_1292);
    float _1304 = precise::max(_1302, 0.0);
    uint _1306 = uint(_1304);
    bool _1308 = _978 != 0;
    float _1310 = float(_719);
    float _1312 = float(_898);
    bool _1314 = !_922;
    float _1316 = _1314 ? _195 : as_type<float>(_1272);
    bool _1318 = !_1296;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = !_1300;
    int _1324 = _1322 ? 0 : 1;
    bool _1326 = !_1290;
    int _1328 = _1326 ? 0 : (-1);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1332 = _1330 != 0;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1336 = _1334 != 0;
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1340 = _1338 != 0;
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1344 = _1342 != 0;
    bool _1346 = _1312 >= _1310;
    bool _1348 = isnan(_1312);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(_1310);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1310 * _1166;
    float _1360 = _1070 * _1310;
    int _1362 = _1164 * _1288;
    int _1364 = _1362 + _1284;
    bool _1366 = !_1336;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1372 = _1370 != 0;
    float _1374 = trunc(_1356);
    int _1376 = int(_1374);
    int _1378 = abs(_1320);
    int _1380 = ~_653;
    int _1382 = _1380 + 1;
    int _1384 = ~_1260;
    int _1386 = _1384 + _1328;
    int _1388 = _1386 + 1;
    int _1390 = _1382 * int(_1306);
    int _1392 = _1390 + _1264;
    float _1394 = trunc(_1360);
    int _1396 = int(_1394);
    int _1398 = abs(_1368);
    int _1400 = _1102 * _1378;
    int _1402 = _1400 + _1364;
    float _1404 = as_type<float>(_1378);
    float _1406 = as_type<float>(_1264);
    float _1408 = as_type<float>(_828);
    float _1410 = as_type<float>(_824);
    if (_1372)
    {
        float _1412 = in.m_58.w;
        _1404 = _1412;
    }
    float _1414 = _1404;
    float _1416 = float(uint(_1392));
    int _1418 = _719 * _1388;
    int _1420 = _1418 + _898;
    bool _1422 = !_1332;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1358);
    int _1428 = int(_1426);
    bool _1430 = _719 == 0;
    float _1432 = as_type<float>(_705) * _1416;
    float _1434 = float(uint(_1402));
    int _1436 = ~_1376;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    bool _1442 = !_1430;
    int _1444 = _1442 ? _1420 : (-1);
    float _1446 = as_type<float>(_711) * _1434;
    float _1448 = trunc(_1432);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = abs(_1324);
    int _1456 = _1444 * _1440;
    int _1458 = _719 + (-1);
    int _1460 = abs(_1424);
    float _1462 = trunc(_1446);
    float _1464 = precise::max(_1462, 0.0);
    uint _1466 = uint(_1464);
    int _1468 = _1376 * _1458;
    int _1470 = _1468 + _1456;
    int _1472 = _1470 * _1398;
    int _1474 = ~_665;
    int _1476 = _1474 + 1;
    int _1478 = _1396 * _1454;
    int _1480 = _1478 + _898;
    float _1482 = as_type<float>(_1454);
    if (_1372)
    {
        float _1484 = _1414 * 3.1415927410125732421875;
        _1482 = _1484;
    }
    float _1486 = _1482;
    int _1488 = _1428 * _1460;
    int _1490 = _1488 + _1472;
    bool _1492 = !_1340;
    int _1494 = _1492 ? 0 : 1;
    int _1496 = ~_653;
    int _1498 = _1496 + 1;
    float _1500 = _1486;
    if (_1372)
    {
        float _1502 = _1486 * 0.15915493667125701904296875;
        _1500 = _1502;
    }
    float _1504 = _1500;
    int _1506 = int(_1306) + int(_1452);
    int _1508 = _1476 * int(_1466);
    int _1510 = _1508 + _1402;
    int _1512 = abs(_1494);
    bool _1514 = !_1344;
    int _1516 = _1514 ? 0 : 1;
    int _1518 = _1498 * _1506;
    int _1520 = _1518 + _1264;
    float _1522 = float(uint(_1510));
    float _1524 = _1504;
    if (_1372)
    {
        float _1526 = _1504 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        _1524 = _1528;
    }
    float _1530 = _1524;
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1534 = _1532 != 0;
    int _1536 = abs(_1516);
    float _1538 = as_type<float>(_711) * _1522;
    bool _1540 = uint(_1520) >= uint(_653);
    int _1542 = _1480 * _1512;
    int _1544 = _1542 + _1490;
    float _1546 = float(uint(_1110));
    float _1548 = trunc(_1538);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    bool _1554 = !_1540;
    int _1556 = _1554 ? 0 : (-1);
    int _1558 = _1396 * _1536;
    int _1560 = _1558 + _1544;
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1564 = _1562 != 0;
    float _1566 = as_type<float>(_705) * _1546;
    int _1568 = ~_1506;
    int _1570 = _1568 + _1556;
    int _1572 = _1570 + 1;
    float _1574 = as_type<float>(_1376);
    bool _1576 = _1564;
    if (_1534)
    {
        float _1578 = in.m_58.x;
        _1574 = _1578;
    }
    float _1580 = _1574;
    bool _1582 = !_1564;
    float _1584 = _1582 ? _191 : as_type<float>(_1280);
    float _1586 = trunc(_1566);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    if (_1372)
    {
        bool _1592 = _1530 > 0.5;
        _1576 = _1592;
    }
    bool _1594 = _1576;
    int _1596 = _653 * _1572;
    int _1598 = _1596 + _1264;
    float _1600 = float(uint(_1560));
    bool _1602 = _653 == 0;
    float _1604 = 0.0;
    if (!_1372)
    {
        _1604 = _191;
    }
    float _1606 = _1604;
    float _1608 = as_type<float>(_884) * _1600;
    bool _1610 = !_1602;
    int _1612 = _1610 ? _1598 : (-1);
    float _1614 = _1606;
    if (_1372)
    {
        float _1616 = -_191;
        float _1618 = _1594 ? _1616 : _191;
        _1614 = _1618;
    }
    float _1620 = _1614;
    int _1622 = _1612 & 3;
    bool _1624 = _1622 != 0;
    float _1626 = trunc(_1608);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = ~_653;
    int _1634 = _1632 + 1;
    int _1636 = _1612 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = _1624 ? 0 : 1;
    int _1642 = _1634 * int(_1590);
    int _1644 = _1642 + _1110;
    bool _1646 = uint(_1636) > 1u;
    if (_1534)
    {
        float _1648 = _1580 * 3.1415927410125732421875;
        _1406 = _1648;
    }
    float _1650 = _1406;
    int _1652 = int(_1466) + int(_1552);
    float _1654 = float(uint(_1164));
    float _1656 = _1650;
    if (_1534)
    {
        float _1658 = _1650 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = float(uint(_1644));
    int _1664 = ~_665;
    int _1666 = _1664 + 1;
    float _1668 = as_type<float>(_711) * _1654;
    int _1670 = ~_719;
    int _1672 = _1670 + 1;
    float _1674 = as_type<float>(_705) * _1662;
    int _1676 = ~_1640;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1666 * _1652;
    int _1684 = _1682 + _1402;
    int _1686 = _1680;
    if (!_1646)
    {
        int _1688 = ~_1640;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    int _1694 = _1672 * int(_1630);
    int _1696 = _1694 + _1560;
    float _1698 = -_195;
    int _1700 = _1308 ? as_type<int>(_1698) : as_type<int>(_195);
    float _1702 = trunc(_1668);
    float _1704 = precise::max(_1702, 0.0);
    uint _1706 = uint(_1704);
    bool _1708 = uint(_1636) >= 2u;
    bool _1710 = uint(_1684) >= uint(_665);
    float _1712 = float(uint(_1696));
    int _1714 = _1708 ? 0 : 1;
    float _1716 = _1660;
    if (_1534)
    {
        float _1718 = _1660 * 6.283185482025146484375;
        float _1720 = sin(_1718);
        _1716 = _1720;
    }
    float _1722 = _1716;
    bool _1724 = _1636 != 3;
    float _1726 = as_type<float>(_884) * _1712;
    bool _1728 = !_1710;
    int _1730 = _1728 ? 0 : (-1);
    int _1732 = ~_665;
    int _1734 = _1732 + 1;
    int _1736 = ~_1652;
    int _1738 = _1736 + _1730;
    int _1740 = _1738 + 1;
    float _1742 = trunc(_1726);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    int _1748 = _665 * _1740;
    int _1750 = _1748 + _1402;
    float _1752 = 0.0;
    bool _1754 = _1724;
    if (!_1534)
    {
        _1752 = _195;
    }
    float _1756 = _1752;
    int _1758 = _1734 * int(_1706);
    int _1760 = _1758 + _1164;
    int _1762 = ~_1714;
    int _1764 = _1762 + 1;
    int _1766 = _1764 + 1;
    float _1768 = trunc(_1674);
    float _1770 = precise::max(_1768, 0.0);
    uint _1772 = uint(_1770);
    int _1774 = _1766;
    float _1776 = _1756;
    if (_1724)
    {
        int _1778 = ~_1714;
        int _1780 = _1778 + 1;
        _1774 = _1780;
    }
    int _1782 = _1774;
    if (_1534)
    {
        bool _1784 = _1722 > 0.5;
        _1754 = _1784;
    }
    bool _1786 = _1754;
    bool _1788 = !_1168;
    int _1790 = _1788 ? _1750 : (-1);
    float _1792 = float(uint(_1760));
    int _1794 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1796 = _1794 != 0;
    if (_1534)
    {
        float _1798 = -_195;
        float _1800 = _1786 ? _1798 : _195;
        _1776 = _1800;
    }
    float _1802 = _1776;
    float _1804 = as_type<float>(_711) * _1792;
    int _1806 = _1790 & 3;
    bool _1808 = _1806 != 0;
    bool _1810 = !_1796;
    float _1812 = _1810 ? _195 : as_type<float>(_1700);
    int _1814 = int(_1630) + int(_1746);
    float _1816 = trunc(_1804);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = ~_653;
    int _1824 = _1822 + 1;
    int _1826 = ~_719;
    int _1828 = _1826 + 1;
    int _1830 = _1790 & 3;
    bool _1832 = _1830 != 0;
    bool _1834 = uint(_1806) > 1u;
    int _1836 = _1828 * _1814;
    int _1838 = _1836 + _1560;
    int _1840 = int(_1590) + int(_1772);
    float _1842 = float(uint(_1480));
    int _1844 = _1832 ? 0 : 1;
    float _1846 = as_type<float>(_884) * _1842;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1850 = _1848 != 0;
    int _1852 = _1824 * _1840;
    int _1854 = _1852 + _1110;
    int _1856 = ~_1844;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    bool _1862 = !_1850;
    int _1864 = _1862 ? 0 : 1;
    float _1866 = trunc(_1846);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    bool _1872 = uint(_1838) >= uint(_719);
    int _1874 = _1860;
    if (!_1834)
    {
        int _1876 = ~_1844;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    bool _1882 = uint(_1854) >= uint(_653);
    bool _1884 = !_1872;
    int _1886 = _1884 ? 0 : (-1);
    bool _1888 = _1806 != 3;
    bool _1890 = !_1882;
    int _1892 = _1890 ? 0 : (-1);
    bool _1894 = uint(_1806) >= 2u;
    int _1896 = ~_1814;
    int _1898 = _1896 + _1886;
    int _1900 = _1898 + 1;
    int _1902 = ~_665;
    int _1904 = _1902 + 1;
    int _1906 = int(_1706) + int(_1820);
    int _1908 = _719 * _1900;
    int _1910 = _1908 + _1560;
    int _1912 = _1894 ? 0 : 1;
    float _1914 = in.m_66.x;
    float _1916 = in.m_66.y;
    float _1918 = in.m_66.z;
    float _1920 = in.m_66.w;
    int _1922 = ~_719;
    int _1924 = _1922 + 1;
    int _1926 = _1904 * _1906;
    int _1928 = _1926 + _1164;
    int _1930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1932 = _1930 != 0;
    int _1934 = ~_1912;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1938;
    int _1942 = _1880;
    if (_1888)
    {
        int _1944 = ~_1912;
        int _1946 = _1944 + 1;
        _1940 = _1946;
    }
    int _1948 = _1940;
    int _1950 = _1924 * int(_1870);
    int _1952 = _1950 + _1480;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1956 = _1954 != 0;
    float _1958 = _820 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1960 = !_1932;
    int _1962 = _1960 ? 0 : 1;
    bool _1964 = uint(_1928) >= uint(_665);
    bool _1966 = !_1430;
    int _1968 = _1966 ? _1910 : (-1);
    bool _1970 = !_1956;
    int _1972 = _1970 ? 0 : 1;
    bool _1974 = !_1964;
    int _1976 = _1974 ? 0 : (-1);
    int _1978 = _1968 & 3;
    bool _1980 = _1978 != 0;
    float _1982 = float(uint(_1952));
    int _1984 = _1968 & 3;
    bool _1986 = _1984 != 0;
    int _1988 = _1980 ? 0 : 1;
    float _1990 = as_type<float>(_884) * _1982;
    bool _1992 = uint(_1984) > 1u;
    int _1994 = ~_1988;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    int _2000 = ~_719;
    int _2002 = _2000 + 1;
    float _2004 = trunc(_1990);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2014 = _1998;
    float _2016 = as_type<float>(_1870);
    if (!_1992)
    {
        int _2018 = ~_1988;
        int _2020 = _2018 + 1;
        _2014 = _2020;
    }
    int _2022 = _2014;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2026 = uint(_1984) >= 2u;
    float _2028 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2012);
    float _2030 = _822 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2032 = _2026 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _2036 = _1984 != 3;
    float _2038 = fma(_2030, -2.0, _2024);
    int _2040 = int(_1870) + int(_2008);
    float _2042 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2028);
    int _2044 = ~as_type<int>(_2032);
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = floor(_866);
    int _2052 = _2002 * _2040;
    int _2054 = _2052 + _1480;
    float _2056 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2038);
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2062 = _2048;
    float _2064 = _2032;
    float _2066 = as_type<float>(_2008);
    if (_2036)
    {
        int _2068 = ~as_type<int>(_2032);
        int _2070 = _2068 + 1;
        _2062 = _2070;
    }
    int _2072 = _2062;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2076 = uint(_2054) >= uint(_719);
    float _2078 = _816 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2082 = !_2076;
    int _2084 = _2082 ? 0 : (-1);
    float _2086 = -_2010;
    float _2088 = fma(_2078, 2.0, _2086);
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2092 = _816 > 0.5;
    float _2094 = fma(_1958, -2.0, _2074);
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2098 = -_191;
    int _2100 = _2092 ? as_type<int>(_2098) : as_type<int>(_191);
    float _2102 = -_125;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2088);
    bool _2106 = _824 != 1;
    float _2108 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2096);
    float _2110 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2112 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2114 = log2(_2112);
    float _2116 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2118 = -_2034;
    float _2120 = fma(_2110, 2.0, _2118);
    float _2122 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2108);
    float _2124 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2094);
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_2106)
    {
        _2016 = _820;
    }
    float _2128 = _2016;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2132 = 0.0;
    float _2134 = _2128;
    if (!_2106)
    {
        _2132 = _820;
    }
    float _2136 = _2132;
    float _2138 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2140 = _2136;
    if (!_2106)
    {
        _2064 = _840;
    }
    float _2142 = _2064;
    float _2144 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2126);
    float _2146 = _2142;
    if (!_2106)
    {
        _2066 = _840;
    }
    float _2148 = _2066;
    float _2150 = _2114 * _125;
    float _2152 = _2148;
    if (_2106)
    {
        _2134 = _816;
    }
    float _2154 = _2134;
    float _2156 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2130);
    if (_2106)
    {
        _2140 = _816;
    }
    float _2158 = _2140;
    float _2160 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2138);
    if (_2106)
    {
        _2146 = _820;
    }
    float _2162 = _2146;
    float _2164 = exp2(_2150);
    if (_2106)
    {
        _2152 = _820;
    }
    float _2166 = _2152;
    float _2168 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2170 = _828 != 2;
    float _2172 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2156);
    float _2174 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2058);
    float _2176 = -_2060;
    float _2178 = fma(_2168, 2.0, _2176);
    float _2180 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2182 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2144);
    float _2184 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2186 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2160);
    float _2188 = fma(_2180, -2.0, _2080);
    float _2190 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2174);
    float _2192 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2184);
    float _2194 = -_125;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2120);
    if (_2170)
    {
        _1408 = _816;
    }
    float _2198 = _1408;
    float _2200 = -_2164;
    float _2202 = _2200 + 1.0;
    float _2204 = _2198;
    if (_2170)
    {
        _1410 = _820;
    }
    float _2206 = _1410;
    float _2208 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2192);
    float _2210 = _2206;
    if (!_2170)
    {
        _2204 = _840;
    }
    float _2212 = _2204;
    float _2214 = -_125;
    float _2216 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2178);
    if (!_2170)
    {
        _2210 = _816;
    }
    float _2218 = _2210;
    float _2220 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2188);
    int _2222 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2224 = _2222 != 0;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2228 = _2218 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2230 = !_2224;
    float _2232 = _2230 ? _191 : as_type<float>(_2100);
    float _2234 = -_2090;
    float _2236 = fma(_2226, 2.0, _2234);
    bool _2238 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2246 = _2242 || _2244;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2250 = fma(_2228, -2.0, _2116);
    float _2252 = in.m_68.x;
    float _2254 = in.m_68.y;
    float _2256 = in.m_68.z;
    float _2258 = in.m_68.w;
    float _2260 = _2246 ? _2202 : 0.0;
    float _2262 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2248);
    bool _2264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2266 = isnan(1.0);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2272 = _2268 || _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2276 = 1.0 + _2274;
    float _2278 = in.m_46.x;
    float _2280 = in.m_46.y;
    float _2282 = in.m_46.z;
    float _2284 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2262);
    float _2286 = -_125;
    float _2288 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2236);
    float _2290 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2250);
    float _2292 = in.m_70.x;
    float _2294 = in.m_70.y;
    float _2296 = in.m_70.z;
    float _2298 = in.m_70.w;
    float _2300 = 1.0 / _2276;
    float _2302 = -_2122;
    float _2304 = _2302 + 1.0;
    float _2306 = -_2182;
    float _2308 = _2306 + 1.0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2318 = ~_1906;
    int _2320 = _2318 + _1976;
    int _2322 = _2320 + 1;
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2326 = _2324 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2328 = abs(_1948);
    float _2330 = 1.0 / _2312;
    float _2332 = -_2284;
    float _2334 = _2332 + 1.0;
    int _2336 = ~_1840;
    int _2338 = _2336 + _1892;
    int _2340 = _2338 + 1;
    float _2342 = -_2208;
    float _2344 = _2342 + 1.0;
    if (_2272)
    {
        float _2346 = _2260 * _2300;
        _135 = _2346;
    }
    float _2348 = _135;
    bool _2350 = _2050 >= 0.0;
    bool _2352 = isnan(_2050);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(0.0);
    bool _2358 = _2354 || _2356;
    float _2360 = _820 * 2.0;
    float _2362 = _2280 * _1916;
    float _2364 = _2280 * _2254;
    float _2366 = 1.0 / _2316;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2370 = _2368 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2372 = _2280 * _2294;
    int _2374 = _2358 ? 0 : 1;
    float _2376 = fma(_2278, _1914, _2362);
    bool _2378 = _2050 > 0.0;
    float _2380 = fma(_2278, _2292, _2372);
    float _2382 = floor(_2360);
    float _2384 = fma(_2278, _2252, _2364);
    float _2386 = fma(_2282, _2296, _2380);
    int _2388 = ~_2374;
    int _2390 = _2388 + 1;
    int _2392 = _2390 + 1;
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2398 = fma(_2282, _1918, _2376);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2400;
    float _2404 = 1.0 / _2326;
    float _2406 = fma(_2282, _2256, _2384);
    int _2408 = _2392;
    if (!_2378)
    {
        int _2410 = ~_2374;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    float _2416 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2418 = _2416 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2420 = _840 * 2.0;
    float _2422 = _2418 * _2330;
    float _2424 = 1.0 / _2396;
    bool _2426 = _2382 >= 0.0;
    bool _2428 = isnan(_2382);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan(0.0);
    bool _2434 = _2430 || _2432;
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2438 = _2436 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2440;
    float _2444 = _2402 * _2366;
    int _2446 = _2434 ? 0 : 1;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2452 = _2382 > 0.0;
    float _2454 = floor(_2420);
    float _2456 = _2442 * _2404;
    int _2458 = _665 * _2322;
    int _2460 = _2458 + _1164;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2464 = _635 + _2462;
    int _2466 = ~_2446;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2472;
    float _2476 = 1.0 / _2438;
    bool _2478 = !_1168;
    int _2480 = _2478 ? _2460 : (-1);
    float _2482 = fma(_2444, _2464, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2484 = _2474 * _2424;
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2486;
    int _2490 = _2470;
    if (!_2452)
    {
        int _2492 = ~_2446;
        int _2494 = _2492 + 1;
        _2490 = _2494;
    }
    int _2496 = _2490;
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2500 = _635 + _2498;
    bool _2502 = !_1638;
    int _2504 = _2502 ? 0 : 1;
    float _2506 = 1.0 / _2370;
    bool _2508 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2510 = isnan(_635);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    float _2520 = fma(_2456, _2500, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2528 = _2526 != 0;
    int _2530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2532 = _2530 != 0;
    float _2534 = fma(_2484, _888, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2536 = _2454 >= 0.0;
    bool _2538 = isnan(_2454);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan(0.0);
    bool _2544 = _2540 || _2542;
    float _2546 = _2398 + _1920;
    bool _2548 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2550 = isnan(_635);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = _2488 * _2476;
    float _2562 = -_2518;
    float _2564 = _2562 + 1.0;
    int _2566 = _2544 ? 0 : 1;
    float _2568 = _2386 + _2298;
    bool _2570 = _2454 > 0.0;
    float _2572 = _2558 * _2564;
    bool _2574 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2576 = isnan(_635);
    bool _2578 = _2574 || _2576;
    bool _2580 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2582 = _2578 || _2580;
    float _2584 = float(_2582);
    float _2586 = _2406 + _2258;
    float _2588 = _2450 * _2506;
    float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2594 = -_2558;
    float _2596 = _2594 + 1.0;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2600 = _635 + _2598;
    bool _2602 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2604 = isnan(_635);
    bool _2606 = _2602 || _2604;
    bool _2608 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2610 = _2606 || _2608;
    float _2612 = float(_2610);
    float _2614 = -_2584;
    float _2616 = _2614 + 1.0;
    float _2618 = _2584 * _2596;
    float _2620 = fma(_2422, _2600, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2622 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2624 = isnan(_635);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = _2612 * _2616;
    float _2636 = -_2612;
    float _2638 = _2636 + 1.0;
    bool _2640 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2642 = isnan(_635);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2648 = _2644 || _2646;
    float _2650 = float(_2648);
    float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2654 = _635 + _2652;
    float _2656 = -_2632;
    float _2658 = _2656 + 1.0;
    float _2660 = _2632 * _2638;
    float _2662 = fma(_2588, _2654, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2664 = _2650 * _2658;
    bool _2666 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2668 = isnan(_635);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = -_2650;
    float _2680 = _2678 + 1.0;
    int _2682 = _1790 >> 31;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2688 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2690 = isnan(_635);
    bool _2692 = _2688 || _2690;
    bool _2694 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2696 = _2692 || _2694;
    float _2698 = float(_2696);
    float _2700 = _2676 * _2680;
    int _2702 = _2682 & 3;
    float _2704 = -_2676;
    float _2706 = _2704 + 1.0;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _635 + _2708;
    float _2712 = 1.0 / _2686;
    int _2714 = _1790 + _2702;
    float _2716 = _2698 * _2706;
    float _2718 = -_2698;
    float _2720 = _2718 + 1.0;
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2724 = _635 + _2722;
    int _2726 = _2714 >> 2;
    float _2728 = _2482 * _2716;
    int _2730 = ~_2566;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    float _2736 = _820 + _816;
    int _2738 = _2726 << 4;
    int _2740 = _2738 + 656;
    float _2742 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2728);
    int _2744 = _2734;
    float _2746 = _2618;
    float _2748 = _2568;
    if (!_2570)
    {
        int _2750 = ~_2566;
        int _2752 = _2750 + 1;
        _2744 = _2752;
    }
    int _2754 = _2744;
    float _2756 = fma(_2560, _2724, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    uint _2758 = uint(int(uint(_2740) >> uint(2)));
    uint _2760 = uint(int(uint(int(_2758)) >> uint(2)));
    int _2762 = int(_2758) & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = int(_2758) + 1;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    int _2770 = _2766 & 3;
    float _2772 = (*spvDescriptorSet0.vp_c9)._m0[int(_2768)][_2770];
    float _2774 = fma(_2620, _2700, _2742);
    float _2776 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2778 = _2546 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2782 = _2586 + _2780;
    bool _2784 = !_1808;
    int _2786 = _2784 ? 0 : 1;
    float _2788 = fma(_2520, _2664, _2774);
    float _2790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2792 = _2568 + _2790;
    float _2794 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2796 = _1806 != 3;
    float _2798 = _816 + _840;
    float _2800 = _816 + (-0.5);
    float _2802 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2794);
    float _2804 = _2592 * _2712;
    float _2806 = fma(_2662, _2660, _2788);
    float _2808 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2802);
    float _2810 = fma(_2804, _2710, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2812 = _2740 + 8;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    bool _2830 = !_2796;
    int _2832 = _2830 ? 0 : (-1);
    float _2834 = _820 + _840;
    bool _2836 = _2808 >= 0.0;
    float _2838 = _820 + (-0.5);
    float _2840 = _2736 + (-1.0);
    float _2842 = _1620 + 0.5;
    float _2844 = fma(_2534, _2634, _2806);
    float _2846 = _1802 + (-0.5);
    float _2848 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2850 = fma(_2842, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2196);
    float _2852 = fma(_2810, _2618, _2844);
    int _2854 = abs(_1880);
    float _2856 = -_2846;
    float _2858 = -_2056;
    float _2860 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2858);
    float _2862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2864 = _2232 + 0.5;
    if (_2836)
    {
        _2746 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2866 = _2746;
    float _2868 = _1812 + (-0.5);
    int _2870 = ~_2854;
    int _2872 = _2870 + 1;
    int _2874 = _2872 + 1;
    float _2876 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2104);
    int _2878 = abs(_2786);
    float _2880 = -_2868;
    float _2882 = -_2124;
    float _2884 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2882);
    if (_2836)
    {
        float _2886 = _2866 * 5.0;
        _1942 = as_type<int>(_2886);
    }
    int _2888 = _1942;
    float _2890 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2892 = int(_2890);
    float _2894 = fma(_2756, _2572, _2852);
    float _2896 = -_2304;
    float _2898 = fma(_2896, _1620, _2850);
    float _2900 = -_2042;
    float _2902 = _2900 + 1.0;
    if (_2836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9012 = as_type<float>(_2888);
        out.gl_Position.z = _9012;
    }
    float _2904 = fma(_2518, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2894);
    float _2906 = _2862 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2908 = _2874 * as_type<int>(_2772);
    float _2910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2912 = fma(_2902, _1802, _2860);
    float _2914 = _2778 * _2778;
    int _2916 = ~_2878;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    float _2922 = _1316 + (-0.5);
    bool _2924 = !_2524;
    int _2926 = _2924 ? 0 : 1;
    out.m_72.x = _2898;
    out.m_72.y = _2912;
    float _2928 = _1584 + 0.5;
    int _2930 = _2920 * as_type<int>(_2764);
    int _2932 = _2930 + _2908;
    float _2934 = fma(_2792, _2792, _2914);
    int _2936 = ~_2328;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = fma(_2906, _2928, _2216);
    int _2944 = abs(_2832);
    float _2946 = fma(_2782, _2782, _2934);
    int _2948 = abs(_2892);
    int _2950 = _2940 * as_type<int>(_2820);
    int _2952 = _2950 + _2932;
    float _2954 = float(uint(_2892));
    int _2956 = _653 * _2340;
    int _2958 = _2956 + _1110;
    int _2960 = abs(_1962);
    float _2962 = _2910 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2964 = ~_2944;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    out.m_74.x = _2904;
    float _2970 = 1.0 / _2954;
    int _2972 = ~_2960;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = -_2962;
    float _2980 = -_2220;
    float _2982 = fma(_2978, _2922, _2980);
    int _2984 = _2968 * as_type<int>(_2828);
    int _2986 = _2984 + _2952;
    float _2988 = float(uint(_2948));
    float _2990 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2992 = ~_2892;
    int _2994 = _2992 + 1;
    int _2996 = _2986 * _2976;
    int _2998 = _1968 >> 31;
    float _3000 = rsqrt(_2946);
    float _3002 = float(_2754);
    int _3004 = _2480 * _2960;
    int _3006 = _3004 + _2996;
    int _3008 = _1612 >> 31;
    if (_2836)
    {
        out.m_53.x = 0.0;
    }
    int _3010 = abs(_1692);
    int _3012 = _3008 & 3;
    float _3014 = 1.0 / _2988;
    int _3016 = _2998 & 3;
    int _3018 = as_type<int>(_2970) + (-2);
    float _3020 = float(uint(_3006));
    int _3022 = _1612 + _3012;
    float _3024 = _2990 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3026 = _1968 + _3016;
    float _3028 = as_type<float>(_3018) * _3020;
    int _3030 = _3022 >> 2;
    float _3032 = _3024 * _3000;
    int _3034 = _3026 >> 2;
    float _3036 = trunc(_3028);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    int _3042 = abs(_3006);
    float _3044 = _2778 * _3032;
    int _3046 = as_type<int>(_3014) + (-2);
    float _3048 = _2792 * _3032;
    int _3050 = _3030 << 4;
    int _3052 = _3050 + 368;
    float _3054 = -_3044;
    float _3056 = _2778 + _3054;
    int _3058 = _3034 << 4;
    int _3060 = _3058 + 800;
    float _3062 = in.m_76.x;
    float _3064 = in.m_76.y;
    float _3066 = in.m_76.z;
    float _3068 = float(uint(_3042));
    float _3070 = -_3048;
    float _3072 = _2792 + _3070;
    int _3074 = abs(_2926);
    float _3076 = _3056 * _3056;
    uint _3078 = uint(int(uint(_3060) >> uint(2)));
    uint _3080 = uint(int(uint(int(_3078)) >> uint(2)));
    int _3082 = int(_3078) & 3;
    float _3084 = (*spvDescriptorSet0.vp_c9)._m0[int(_3080)][_3082];
    int _3086 = int(_3078) + 1;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    int _3090 = _3086 & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    float _3094 = as_type<float>(_3046) * _3068;
    float _3096 = float(_3074);
    int _3098 = _2994 * int(_3040);
    int _3100 = _3098 + _3006;
    float _3102 = fma(_3072, _3072, _3076);
    int _3104 = abs(_2022);
    float _3106 = _3096 * _3002;
    float _3108 = float(uint(_3100));
    uint _3110 = uint(int(uint(_3052) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    float _3126 = -_2172;
    float _3128 = _3126 + 1.0;
    float _3130 = _2782 * _3032;
    float _3132 = -_2334;
    float _3134 = fma(_1584, _3132, _2942);
    float _3136 = as_type<float>(_3018) * _3108;
    float _3138 = -_2308;
    float _3140 = fma(_2232, _3138, _2876);
    float _3142 = -_2190;
    float _3144 = _3142 + 1.0;
    float _3146 = trunc(_3094);
    float _3148 = precise::max(_3146, 0.0);
    uint _3150 = uint(_3148);
    float _3152 = fma(_1812, _3128, _2884);
    float _3154 = -_3130;
    float _3156 = _2782 + _3154;
    float _3158 = fma(_1316, _3144, _2982);
    int _3160 = ~_2948;
    int _3162 = _3160 + 1;
    float _3164 = _3106 * (-2.0);
    float _3166 = fma(_3156, _3156, _3102);
    int _3168 = ~_3104;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    out.m_78.x = _3140;
    out.m_78.y = _3152;
    out.m_78.z = _3134;
    out.m_78.w = _3158;
    float _3174 = fma(_3164, _3062, _3062);
    float _3176 = trunc(_3136);
    float _3178 = precise::max(_3176, 0.0);
    uint _3180 = uint(_3178);
    float _3182 = fma(_2848, _3164, _2848);
    int _3184 = abs(_2504);
    float _3186 = fma(_2800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3174);
    int _3188 = ~_2040;
    int _3190 = _3188 + _2084;
    int _3192 = _3190 + 1;
    int _3194 = _3052 + 8;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    uint _3198 = uint(int(uint(int(_3196)) >> uint(2)));
    int _3200 = int(_3196) & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    int _3204 = int(_3196) + 1;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    int _3208 = _3204 & 3;
    float _3210 = (*spvDescriptorSet0.vp_c9)._m0[int(_3206)][_3208];
    int _3212 = _3162 * int(_3150);
    int _3214 = _3212 + _3042;
    int _3216 = abs(_1864);
    float _3218 = fma(_3182, _2348, _3186);
    int _3220 = _719 * _3192;
    int _3222 = _3220 + _1480;
    int _3224 = abs(_1972);
    float _3226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3228 = float(uint(_3214));
    int _3230 = _3060 + 8;
    uint _3232 = uint(int(uint(_3230) >> uint(2)));
    uint _3234 = uint(int(uint(int(_3232)) >> uint(2)));
    int _3236 = int(_3232) & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = int(_3232) + 1;
    uint _3242 = uint(int(uint(_3240) >> uint(2)));
    int _3244 = _3240 & 3;
    float _3246 = (*spvDescriptorSet0.vp_c9)._m0[int(_3242)][_3244];
    bool _3248 = !_1986;
    int _3250 = _3248 ? 0 : 1;
    int _3252 = int(_3040) + int(_3180);
    float _3254 = as_type<float>(_3046) * _3228;
    int _3256 = ~_2892;
    int _3258 = _3256 + 1;
    int _3260 = ~_3010;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    float _3266 = trunc(_3254);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    bool _3272 = _1636 != 3;
    int _3274 = _3258 * _3252;
    int _3276 = _3274 + _3006;
    bool _3278 = _653 == 0;
    int _3280 = _3172 * as_type<int>(_3092);
    int _3282 = abs(_3250);
    int _3284 = _3264 * as_type<int>(_3124);
    bool _3286 = !_3272;
    int _3288 = _3286 ? 0 : (-1);
    float _3290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3292 = uint(_3276) >= uint(_2892);
    int _3294 = ~_2948;
    int _3296 = _3294 + 1;
    int _3298 = ~_3184;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    int _3304 = int(_3150) + int(_3270);
    bool _3306 = !_3292;
    int _3308 = _3306 ? 0 : (-1);
    int _3310 = _3302 * as_type<int>(_3116);
    int _3312 = _3310 + _3284;
    int _3314 = ~_3282;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = _3296 * _3304;
    int _3322 = _3320 + _3042;
    int _3324 = ~_3252;
    int _3326 = _3324 + _3308;
    int _3328 = _3326 + 1;
    bool _3330 = _1984 != 3;
    int _3332 = _3318 * as_type<int>(_3084);
    int _3334 = _3332 + _3280;
    int _3336 = abs(_2072);
    int _3338 = _2892 * _3328;
    int _3340 = _3338 + _3006;
    bool _3342 = !_3330;
    int _3344 = _3342 ? 0 : (-1);
    bool _3346 = uint(_3322) >= uint(_2948);
    int _3348 = ~_3336;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    int _3354 = _3006 ^ _2892;
    int _3356 = abs(_1782);
    int _3358 = _3352 * as_type<int>(_3238);
    int _3360 = _3358 + _3334;
    bool _3362 = !_3346;
    int _3364 = _3362 ? 0 : (-1);
    uint _3366 = uint(int(uint(_3354) >> uint(31)));
    int _3368 = ~_3356;
    int _3370 = _3368 + 1;
    int _3372 = _3370 + 1;
    int _3374 = abs(_3288);
    int _3376 = ~_3364;
    int _3378 = _3304 + _3376;
    int _3380 = _3378 + 1;
    int _3382 = _3372 * as_type<int>(_3202);
    int _3384 = _3382 + _3312;
    int _3386 = ~int(_3366);
    int _3388 = _3386 + 1;
    int _3390 = abs(_3344);
    int _3392 = ~_3374;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    bool _3398 = _2892 == 0;
    int _3400 = _3380 ^ _3388;
    int _3402 = _3396 * as_type<int>(_3210);
    int _3404 = _3402 + _3384;
    int _3406 = ~_3390;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = _3226 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3414 = ~_3216;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    bool _3420 = !_3398;
    int _3422 = _3420 ? _3340 : (-1);
    int _3424 = _3410 * as_type<int>(_3246);
    int _3426 = _3424 + _3360;
    bool _3428 = _2892 == 0;
    int _3430 = _3404 * _3418;
    int _3432 = ~_3388;
    int _3434 = _3432 + _3400;
    int _3436 = _3434 + 1;
    float _3438 = _3290 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3440 = ~_3224;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    bool _3446 = !_3428;
    int _3448 = _3446 ? _3436 : (-1);
    bool _3450 = !_3278;
    int _3452 = _3450 ? _2958 : (-1);
    int _3454 = _3426 * _3444;
    float _3456 = float(_3448);
    float _3458 = float(_3422);
    int _3460 = _3452 * _3216;
    int _3462 = _3460 + _3430;
    bool _3464 = !_2528;
    int _3466 = _3464 ? 0 : 1;
    float _3468 = -_2290;
    float _3470 = fma(_3412, _3456, _3468);
    bool _3472 = !_1430;
    int _3474 = _3472 ? _3222 : (-1);
    float _3476 = fma(_3438, _3458, _2288);
    float _3478 = _1002 + 0.5;
    int _3480 = abs(_3466);
    float _3482 = _994 + (-0.5);
    int _3484 = _3474 * _3224;
    int _3486 = _3484 + _3454;
    float _3488 = fma(_3438, _3478, _3476);
    float _3490 = -_3412;
    float _3492 = fma(_3490, _3482, _3470);
    float _3494 = -_2186;
    float _3496 = _3494 + 1.0;
    float _3498 = -_2344;
    float _3500 = fma(_1002, _3498, _3488);
    float _3502 = float(_3462);
    float _3504 = float(_3486);
    float _3506 = fma(_994, _3496, _3492);
    float _3508 = float(_2414);
    out.m_80.x = _3502;
    float _3510 = float(_3480);
    out.m_80.w = _3504;
    bool _3512 = !_2532;
    int _3514 = _3512 ? 0 : 1;
    float _3516 = _3510 * _3508;
    out.m_82.x = _3500;
    out.m_82.y = _3506;
    float _3518 = _3290;
    if (_2836)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3520 = -_3044;
    float _3522 = _2546 + _3520;
    float _3524 = -_3048;
    float _3526 = _2568 + _3524;
    float _3528 = float(_2496);
    float _3530 = _2834 + (-1.0);
    float _3532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3534 = _3522 + _3532;
    int _3536 = abs(_3514);
    float _3538 = -_3130;
    float _3540 = _2586 + _3538;
    float _3542 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3544 = _3526 + _3542;
    float _3546 = _3534 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3548 = fma(_3530, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3552 = _3540 + _3550;
    float _3554 = fma(_3544, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3546);
    float _3556 = float(_3536);
    float _3558 = _3516 * (-2.0);
    float _3560 = _3218 * 0.15915493667125701904296875;
    float _3562 = fma(_3552, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3554);
    float _3564 = _2798 + (-1.0);
    float _3566 = fma(_3558, _3064, _3064);
    float _3568 = fma(_3548, _3558, _3548);
    float _3570 = _3556 * _3528;
    bool _3572 = _3562 >= 0.0;
    float _3574 = fma(_2838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3566);
    float _3576 = sqrt(_3166);
    float _3578 = _3570 * (-2.0);
    float _3580 = fma(_3564, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3582 = fma(_3568, _2348, _3574);
    float _3584 = _840 + (-0.5);
    float _3586 = fma(_3578, _3066, _3066);
    float _3588 = fma(_3580, _3578, _3580);
    float _3590 = _3582 * 0.15915493667125701904296875;
    float _3592 = _3560 * 6.283185482025146484375;
    float _3594 = sin(_3592);
    float _3596 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3586);
    float _3598 = _3526;
    if (_3572)
    {
        _3518 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3600 = _3518;
    int _3602 = as_type<int>(_3600);
    if (_3572)
    {
        out.m_53.x = 0.0;
    }
    float _3604 = fma(_3588, _2348, _3596);
    float _3606 = _3560 * 6.283185482025146484375;
    float _3608 = cos(_3606);
    if (_3572)
    {
        float _3610 = _3600 * 5.0;
        _3602 = as_type<int>(_3610);
    }
    int _3612 = _3602;
    float _3614 = _3604 * 0.15915493667125701904296875;
    if (_3572)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10039 = as_type<float>(_3612);
        out.gl_Position.z = _10039;
    }
    float _3616 = _3590 * 6.283185482025146484375;
    float _3618 = sin(_3616);
    float _3620 = _3590 * 6.283185482025146484375;
    float _3622 = cos(_3620);
    if (_3572)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3624 = _3614 * 6.283185482025146484375;
    float _3626 = cos(_3624);
    float _3628 = _3000 * _3576;
    float _3630 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _3634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _3636 = _2990 * _3628;
    float _3638 = _3628 * _3630;
    float _3640 = _3608 * _3622;
    float _3642 = _3614 * 6.283185482025146484375;
    float _3644 = sin(_3642);
    float _3646 = _3608 * _3618;
    float _3648 = _3632 * _3638;
    float _3650 = _3594 * _3618;
    float _3652 = _3594 * _3622;
    float _3654 = _3634 * _3636;
    float _3656 = _3628 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3658 = _3656 * 0.5;
    float _3660 = _3522 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3662 = _3608 * _3626;
    float _3664 = _3622 * _3626;
    float _3666 = _3594 * _3626;
    float _3668 = _3618 * _3626;
    float _3670 = _3662 * _3648;
    bool _3672 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3674 = isnan(0.5);
    bool _3676 = _3672 || _3674;
    bool _3678 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3680 = _3676 || _3678;
    float _3682 = fma(_3644, _3640, _3650);
    float _3684 = -_3652;
    float _3686 = fma(_3644, _3646, _3684);
    float _3688 = -_3648;
    float _3690 = _3644 * _3688;
    float _3692 = -_3646;
    float _3694 = fma(_3644, _3652, _3692);
    float _3696 = fma(_3682, _3654, _3670);
    float _3698 = _3666 * _3648;
    float _3700 = fma(_3664, _3654, _3690);
    bool _3702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3704 = isnan(0.5);
    bool _3706 = _3702 || _3704;
    bool _3708 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3710 = _3706 || _3708;
    float _3712 = fma(_3686, _3658, _3696);
    float _3714 = fma(_3644, _3650, _3640);
    float _3716 = fma(_3694, _3654, _3698);
    float _3718 = fma(_3668, _3658, _3700);
    float _3720 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3722 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3724 = fma(_3714, _3658, _3716);
    float _3726 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3720);
    float _3728 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3722);
    float _3730 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3660);
    float _3732 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3726);
    float _3734 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3728);
    float _3736 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3730);
    float _3738 = _3732 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3740 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3742 = _3736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3744 = _2586 + _3738;
    float _3746 = _2568 + _3740;
    float _3748 = _3522 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3750 = 1.0 / _3742;
    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3754 = _3744 + _3752;
    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3758 = _3746 + _3756;
    float _3760 = _3754 * _3754;
    float _3762 = fma(_3758, _3758, _3760);
    float _3764 = fma(_3526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3748);
    float _3766 = sqrt(_3762);
    float _3768 = fma(_3540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3764);
    float _3770 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3772 = _3770 + _3742;
    float _3774 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3776 = _3772 * _3750;
    float _3778 = _3776 * 0.5;
    float _3780 = fma(_3718, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3774);
    bool _3782 = _3766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3786 = fma(_3778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3784);
    float _3788 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3780);
    float _3790 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3792 = 1.0 / _3786;
    float _3794 = _2546 + _3790;
    float _3796 = _3790;
    float _3798 = _3774;
    float _3800 = _3772;
    float _3802 = _3724;
    float _3804 = _3750;
    float _3806 = _3762;
    if (!_3782)
    {
        _3796 = _3746;
    }
    float _3808 = _3796;
    float _3810 = _3808;
    if (!_3782)
    {
        _3798 = _3744;
    }
    float _3812 = _3798;
    float _3814 = _3812;
    if (!_3782)
    {
        _3800 = _3794;
    }
    float _3816 = _3800;
    bool _3818 = !_3782;
    float _3820 = _3816;
    float _3822 = _3792;
    if (!_3818)
    {
        float _3824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3828 = _3766 + _3826;
        float _3830 = rsqrt(_3762);
        float _3832 = _3828 * _3824;
        float _3834 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3836 = _3832 * 0.15915493667125701904296875;
        float _3838 = _3836 * 6.283185482025146484375;
        float _3840 = sin(_3838);
        float _3842 = _3836 * 6.283185482025146484375;
        float _3844 = cos(_3842);
        float _3846 = fma(_3840, _3834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3848 = _3830 * _3846;
        float _3850 = _3844 + (-1.0);
        float _3852 = fma(_3758, _3848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3854 = fma(_3754, _3848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3856 = _3850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3858 = fma(_3794, _3844, _3856);
        _3820 = _3858;
        _3810 = _3852;
        _3814 = _3854;
        _3802 = _3850;
    }
    float _3860 = _3820;
    float _3862 = _3810;
    float _3864 = _3814;
    float _3866 = _3802;
    float _3868 = -_3044;
    float _3870 = _3868 + _3860;
    float _3872 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3874 = _3792 * _3872;
    float _3876 = -_3048;
    float _3878 = _3876 + _3862;
    float _3880 = -_3130;
    float _3882 = _3880 + _3864;
    float _3884 = _3878;
    float _3886 = _3882;
    float _3888 = _3866;
    if (_3710)
    {
        _3804 = 1.0;
    }
    float _3890 = _3804;
    float _3892 = _3890;
    if (_3680)
    {
        _3822 = _3870;
    }
    float _3894 = _3822;
    float _3896 = _3894;
    if (!_3680)
    {
        float _3898 = _3534 * _3534;
        float _3900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3902 = -_2586;
        float _3904 = _3902 + _3864;
        float _3906 = -_2546;
        float _3908 = _3906 + _3860;
        float _3910 = fma(_3544, _3544, _3898);
        float _3912 = -_2568;
        float _3914 = _3912 + _3862;
        float _3916 = fma(_3552, _3552, _3910);
        float _3918 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3920 = sqrt(_3916);
        float _3922 = 1.0 / _3628;
        float _3924 = _3918 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3926 = precise::min(_3920, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3928 = _3926 * _3900;
        float _3930 = _3928 * _3922;
        float _3932 = _3924 * _3930;
        float _3934 = _3904 * _3930;
        float _3936 = fma(_3908, _3932, _3522);
        float _3938 = fma(_3914, _3932, _3526);
        float _3940 = fma(_3924, _3934, _3540);
        _3896 = _3936;
        _3884 = _3938;
        _3886 = _3940;
        _3888 = _3922;
    }
    float _3942 = _3896;
    float _3944 = _3884;
    float _3946 = _3886;
    float _3948 = _3888;
    float _3950 = _3948;
    if (!_3710)
    {
        float _3952 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3954 = _3952 * 0.15915493667125701904296875;
        float _3956 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3958 = _3954 * 6.283185482025146484375;
        float _3960 = cos(_3958);
        float _3962 = _3956 * 0.15915493667125701904296875;
        float _3964 = _3954 * 6.283185482025146484375;
        float _3966 = sin(_3964);
        float _3968 = 1.0 / _3960;
        float _3970 = _3962 * 6.283185482025146484375;
        float _3972 = cos(_3970);
        float _3974 = _3966 * _3968;
        float _3976 = _3962 * 6.283185482025146484375;
        float _3978 = sin(_3976);
        float _3980 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3982 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3980;
        float _3984 = _3972 * _3974;
        float _3986 = 1.0 / _3984;
        float _3988 = 1.0 / _3982;
        float _3990 = _3978 * _3986;
        float _3992 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3994 = fma(_3874, _3990, _3992);
        float _3996 = _3994 * _3988;
        float _3998 = precise::clamp(_3996, 0.0, 1.0);
        _3950 = _3954;
        _3892 = _3998;
    }
    float _4000 = _3950;
    float _4002 = _3892;
    float _4004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4006 = _3942 + _4004;
    float _4008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4010 = _3944 + _4008;
    float _4012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4014 = _3946 + _4012;
    float _4016 = _4006 * _4006;
    float _4018 = fma(_4010, _4010, _4016);
    float _4020 = fma(_3526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4022 = fma(_4014, _4014, _4018);
    float _4024 = rsqrt(_4022);
    float _4026 = sqrt(_4022);
    float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4030 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4032 = _4010 * _4028;
    float _4034 = _4014 * _4028;
    float _4036 = _4032 * _4032;
    float _4038 = _4034 * _4034;
    float _4040 = _4036 + _4038;
    float _4042 = sqrt(_4040);
    bool _4044 = _4042 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4048 = _4042 + _4046;
    float _4050 = _4014;
    float _4052 = _4040;
    float _4054 = _4048;
    float _4056 = _4006;
    if (_4044)
    {
        float _4058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4050 = _4058;
    }
    float _4060 = _4050;
    if (!_4044)
    {
        _3598 = _4038;
    }
    float _4062 = _3598;
    float _4064 = _4062;
    if (_4044)
    {
        float _4066 = rsqrt(_4040);
        _4052 = _4066;
    }
    float _4068 = _4052;
    float _4070 = _4068;
    if (_4044)
    {
        float _4072 = _4048 * _4060;
        _4054 = _4072;
    }
    float _4074 = _4054;
    if (_4044)
    {
        float _4076 = _4074 * 0.15915493667125701904296875;
        _2748 = _4076;
    }
    float _4078 = _2748;
    float _4080 = _4024;
    if (_4044)
    {
        float _4082 = _4078 * 6.283185482025146484375;
        float _4084 = sin(_4082);
        _4080 = _4084;
    }
    float _4086 = _4080;
    float _4088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4090 = precise::max(0.0, _4088);
    float _4092 = _4000;
    float _4094 = _4090;
    float _4096 = _4088;
    if (_4044)
    {
        float _4098 = _4078 * 6.283185482025146484375;
        float _4100 = cos(_4098);
        _4092 = _4100;
    }
    float _4102 = _4092;
    float _4104 = -_4028;
    float _4106 = -_4090;
    float _4108 = fma(_4006, _4104, _4106);
    if (!_4044)
    {
        _4094 = _4032;
    }
    float _4110 = _4094;
    float _4112 = _4110;
    if (_4044)
    {
        float _4114 = _4108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4096 = _4114;
    }
    float _4116 = _4096;
    float _4118 = floor(_4020);
    float _4120 = _4086;
    float _4122 = _4116;
    if (_4044)
    {
        float _4124 = fma(_4086, _4116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4056 = _4124;
    }
    float _4126 = _4056;
    float _4128 = _4126;
    if (!_4044)
    {
        _4120 = _4036;
    }
    float _4130 = _4120;
    float _4132 = _4130;
    if (_4044)
    {
        float _4134 = _4102 + (-1.0);
        _4122 = _4134;
    }
    float _4136 = _4122;
    float _4138 = _4136;
    if (_4044)
    {
        float _4140 = _4068 * _4126;
        _3806 = _4140;
    }
    float _4142 = _3806;
    if (!_4044)
    {
        _4128 = _4108;
    }
    float _4144 = _4128;
    float _4146 = _4144;
    if (_4044)
    {
        float _4148 = _4136 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4070 = _4148;
    }
    float _4150 = _4070;
    if (_4044)
    {
        float _4152 = _4032 * _4142;
        _4112 = _4152;
    }
    float _4154 = _4112;
    if (!_4044)
    {
        _4138 = _4034;
    }
    float _4156 = _4138;
    float _4158 = _4156;
    if (_4044)
    {
        float _4160 = _4034 * _4142;
        _4158 = _4160;
    }
    float _4162 = _4158;
    if (_4044)
    {
        float _4164 = fma(_4108, _4102, _4150);
        _4146 = _4164;
    }
    float _4166 = _4146;
    if (_4044)
    {
        float _4168 = _4154 * _4154;
        _4132 = _4168;
    }
    float _4170 = _4132;
    if (_4044)
    {
        float _4172 = _4162 * _4162;
        _4064 = _4172;
    }
    float _4174 = _4064;
    float _4176 = fma(_4166, _4166, _4170);
    float _4178 = _4176 + _4174;
    float _4180 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4030);
    float _4182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4184 = fma(_4026, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4182);
    float _4186 = precise::clamp(_4184, 0.0, 1.0);
    float _4188 = rsqrt(_4178);
    float _4190 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4180);
    float _4192 = -_4186;
    float _4194 = _4192 + 1.0;
    float _4196 = _4190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4198 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4200 = fma(_3540, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4202 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4204 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4206 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4208 = abs(_4194);
    float _4210 = log2(_4208);
    float _4212 = -_4204;
    float _4214 = fma(_4212, _4198, 1.0);
    float _4216 = _3942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4218 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4202);
    float _4220 = _4188 * _4154;
    float _4222 = _4188 * _4166;
    float _4224 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4216);
    float _4226 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4218);
    float _4228 = _4188 * _4162;
    float _4230 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4232 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4224);
    float _4234 = _4226 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4236 = fma(_3944, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4206);
    float _4238 = -_4230;
    float _4240 = fma(_4222, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4238);
    float _4242 = _4232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4244 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4246 = fma(_3946, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4236);
    float _4248 = -_4228;
    float _4250 = fma(_4248, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4240);
    float _4252 = floor(_4200);
    float _4254 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4244);
    float _4256 = _4246 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4258 = fma(_4250, -0.5, 0.5);
    float _4260 = _4210 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4262 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4254);
    float _4264 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4266 = log2(_4214);
    float _4268 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4262);
    float _4270 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4264);
    float _4272 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4270);
    float _4274 = 1.0 / _4268;
    float _4276 = -_4118;
    float _4278 = _4020 + _4276;
    float _4280 = fma(_4250, 0.5, 0.5);
    float _4282 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4284 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4272);
    float _4286 = -_4252;
    float _4288 = _4200 + _4286;
    float _4290 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4282);
    float _4292 = sqrt(_4258);
    float _4294 = fma(_4280, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4296 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4290);
    float _4298 = fma(_4280, _4294, -0.212114393711090087890625);
    float _4300 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4296);
    float _4302 = exp2(_4260);
    float _4304 = _4266 * 0.693147182464599609375;
    float _4306 = _4284 * _4274;
    float _4308 = _4300 * _4274;
    float2 _11154 = float2(_4278, _4288);
    float _4310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11154, float2(0.0), isnan(_11154)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11154, float2(0.0), isnan(_11154)), level(0.0)).x;
    float _4312 = fma(_4280, _4298, 1.570728778839111328125);
    float _4314 = _4304 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4316 = fma(_4306, 0.5, 0.5);
    float _4318 = _4292 * 0.636619746685028076171875;
    float _4320 = _4222 + 1.0;
    float _4322 = fma(_4308, -0.5, 0.5);
    float _4324 = -_4312;
    float _4326 = fma(_4318, _4324, 1.0);
    float _4328 = -_4222;
    float _4330 = fma(_4302, _4320, _4328);
    float3 _11193 = float3(_4316, _4322, _4314);
    float _4332 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11193, float3(0.0), isnan(_11193)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11193, float3(0.0), isnan(_11193)), level(0.0)).x;
    float _4334 = fma(_4330, 0.5, 0.5);
    float3 _11206 = float3(_4316, _4322, _4314);
    float4 _4337 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11206, float3(0.0), isnan(_11206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11206, float3(0.0), isnan(_11206)), level(0.0)).xyzw;
    float _4339 = _4337.x;
    float _4341 = _4337.y;
    float _4343 = _4337.z;
    float _4345 = _4337.w;
    float2 _11222 = float2(_4326, _4334);
    float3 _4349 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11222, float2(0.0), isnan(_11222)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11222, float2(0.0), isnan(_11222)), level(0.0)).xyz;
    float _4351 = _4349.x;
    float _4353 = _4349.y;
    float _4355 = _4349.z;
    float _4357 = abs(_3874);
    float _4359 = log2(_4357);
    float _4361 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4363 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4365 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4367 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4369 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4361);
    float _4371 = -_3644;
    float _4373 = fma(_4371, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4363);
    float _4375 = -_3644;
    float _4377 = fma(_4375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4365);
    float _4379 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4381 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4383 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4385 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4387 = -_3644;
    float _4389 = fma(_4387, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4379);
    float _4391 = _3686 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4393 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4381);
    float _4395 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4383);
    float _4397 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4399 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4391);
    float _4401 = fma(_4367, _4367, 1.0);
    float _4403 = _3682 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4405 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4373);
    float _4407 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4389);
    float _4409 = exp2(_4397);
    float _4411 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4377);
    float _4413 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4385);
    float _4415 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4403);
    float _4417 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4369);
    float _4419 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4421 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4413);
    float _4423 = rsqrt(_4401);
    float _4425 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4415);
    float _4427 = _4367 * _4407;
    float _4429 = _4367 * _4405;
    float _4431 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4393);
    float _4433 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4399);
    out.m_84.x = _4417;
    out.m_84.y = _4421;
    out.m_84.z = _4425;
    float _4435 = fma(_4419, _4421, _4427);
    float _4437 = fma(_4409, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4439 = precise::clamp(_4437, 0.0, 1.0);
    float _4441 = fma(_3714, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4395);
    float _4443 = fma(_4419, _4417, _4429);
    float _4445 = _4234 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4447 = in.m_86.x;
    float _4449 = fma(_4439, -2.0, 3.0);
    float _4451 = _4439 * _4439;
    float _4453 = _4367 * _4423;
    float _4455 = fma(_4242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4445);
    float _4457 = _4210 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4459 = _4451 * _4449;
    float _4461 = _4367 * _4411;
    float _4463 = -_4431;
    float _4465 = _4453 * _4463;
    float _4467 = exp2(_4457);
    float _4469 = -_4459;
    float _4471 = _4469 + 1.0;
    bool _4473 = _3874 <= 8000.0;
    bool _4475 = isnan(_3874);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan(8000.0);
    bool _4481 = _4477 || _4479;
    float _4483 = float(_4481);
    float _4485 = -_4433;
    float _4487 = _4453 * _4485;
    float _4489 = _4268 * 0.5;
    float _4491 = fma(_4471, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4459);
    float _4493 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4455);
    float _4495 = -_4441;
    float _4497 = _4453 * _4495;
    float _4499 = fma(_4423, _4405, _4465);
    float _4501 = fma(_4423, _4407, _4487);
    float _4503 = _4483 * _4491;
    float _4505 = fma(_4423, _4411, _4497);
    float _4507 = fma(_4256, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4493);
    float _4509 = _4284 + _4268;
    float _4511 = _4503 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4513 = fma(_4419, _4425, _4461);
    float _4515 = -_4467;
    float _4517 = _4515 + 1.0;
    float _4519 = _4507 + _4268;
    float _4521 = _4431 + _4443;
    float _4523 = _4517 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4525 = _4519 * 0.5;
    float _4527 = _4509 * 0.5;
    float _4529 = fma(_4300, -0.5, _4489);
    out.gl_Position.x = _4284;
    out.gl_Position.y = _4300;
    out.gl_Position.z = _4507;
    out.gl_Position.w = _4268;
    float _4531 = _4433 + _4435;
    float _4533 = _4441 + _4513;
    bool _4535 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4537 = isnan(_4026);
    bool _4539 = _4535 || _4537;
    bool _4541 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4543 = _4539 || _4541;
    out.m_88.x = _4527;
    out.m_88.y = _4529;
    out.m_88.z = _4525;
    out.m_88.w = _4268;
    float _4545 = _4002 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_90.x = _4499;
    out.m_90.y = _4501;
    out.m_90.z = _4505;
    out.m_92.x = _4521;
    out.m_92.y = _4531;
    out.m_92.z = _4533;
    float _4547 = -_4523;
    float _4549 = _4547 + 1.0;
    float _4551 = _4268;
    float _4553 = _4507;
    float _4555 = _4300;
    float _4557 = _4549;
    if (!_4543)
    {
        _4551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4559 = _4551;
    float _4561 = _4559;
    float _4563 = _4559;
    if (!_4543)
    {
        _4553 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4565 = _4553;
    float _4567 = _4565;
    float _4569 = _4565;
    if (!_4543)
    {
        _4555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4571 = _4555;
    float _4573 = -_4310;
    float _4575 = _4573 + 1.0;
    float _4577 = _4575 * _4511;
    float _4579 = precise::clamp(_4577, 0.0, 1.0);
    float _4581 = -_4579;
    float _4583 = fma(_4581, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4585 = _4583 * _4447;
    float _4587 = _4523 * _4332;
    float _4589 = _4585 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4591 = _4345 * _4587;
    float _4593 = _4345 * _4549;
    float _4595 = _4341;
    float _4597 = _4339;
    float _4599 = _4571;
    float _4601 = _4571;
    if (!_4543)
    {
        _4557 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4603 = _4557;
    out.m_94.x = _4589;
    float _4605 = _4355 * _4587;
    float _4607 = fma(_4351, _4591, _4339);
    float _4609 = fma(_4353, _4591, _4341);
    float _4611 = _4603;
    float _4613 = _4603;
    if (!_4543)
    {
        _4595 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4615 = _4595;
    float _4617 = fma(_4345, _4605, _4343);
    float _4619 = _4615;
    float _4621 = _4615;
    if (!_4543)
    {
        _4597 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4623 = _4597;
    out.m_96.x = _4607;
    out.m_96.y = _4609;
    out.m_96.z = _4617;
    out.m_96.w = _4593;
    bool _4625 = !_4543;
    float _4627 = _4623;
    float _4629 = _4623;
    if (!_4625)
    {
        bool _4631 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4633 = isnan(_4026);
        bool _4635 = _4631 || _4633;
        bool _4637 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4639 = _4635 || _4637;
        if (!_4639)
        {
            float _4641 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4643 = _4026 + _4641;
            float _4645 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4647 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4645;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4653 = 1.0 / _4647;
            float _4655 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4657 = _4655 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4659 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4661 = _4659 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4663 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4665 = _4663 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4667 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4669 = _4667 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4671 = _4643 * _4653;
            float _4673 = precise::clamp(_4671, 0.0, 1.0);
            float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4677 = _4675 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4679 = fma(_4673, _4651, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4681 = fma(_4673, _4677, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4683 = fma(_4673, _4657, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4685 = fma(_4673, _4661, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4687 = fma(_4673, _4665, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4689 = fma(_4673, _4669, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4629 = _4683;
            _4601 = _4687;
            _4621 = _4679;
            _4569 = _4685;
            _4563 = _4681;
            _4613 = _4689;
            _4691 = true;
        }
        else
        {
            bool _4693 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4695 = isnan(_4026);
            bool _4697 = _4693 || _4695;
            bool _4699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4701 = _4697 || _4699;
            if (!_4701)
            {
                _4619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4703 = _4619;
            _4621 = _4703;
            if (!_4701)
            {
                _4627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4705 = _4627;
            _4629 = _4705;
            if (!_4701)
            {
                _4561 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4707 = _4561;
            _4563 = _4707;
            if (!_4701)
            {
                _4567 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4709 = _4567;
            _4569 = _4709;
            if (!_4701)
            {
                _4599 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4711 = _4599;
            _4601 = _4711;
            if (!_4701)
            {
                _4611 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4713 = _4611;
            bool _4715 = !_4701;
            _4613 = _4713;
            if (!_4715)
            {
                bool _4717 = _4026 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4719 = isnan(_4026);
                bool _4721 = _4717 || _4719;
                bool _4723 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4725 = _4721 || _4723;
                if (!_4725)
                {
                    float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4729 = _4026 + _4727;
                    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4733 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4731;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4739 = 1.0 / _4733;
                    float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4743 = _4741 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4747 = _4745 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4753 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4755 = _4753 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4757 = _4729 * _4739;
                    float _4759 = precise::clamp(_4757, 0.0, 1.0);
                    float _4761 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4763 = _4761 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4765 = fma(_4759, _4737, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4767 = fma(_4759, _4763, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4769 = fma(_4759, _4743, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4771 = fma(_4759, _4747, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4773 = fma(_4759, _4751, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4775 = fma(_4759, _4755, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4629 = _4769;
                    _4601 = _4773;
                    _4621 = _4765;
                    _4569 = _4771;
                    _4563 = _4767;
                    _4613 = _4775;
                    _4691 = true;
                }
                else
                {
                    _4629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4601 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4569 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4563 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4613 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4691 = false;
    float _4777 = _4629;
    float _4779 = _4601;
    float _4781 = _4621;
    float _4783 = _4569;
    float _4785 = _4563;
    float _4787 = _4613;
    float _4789 = fma(_4531, -0.5, 0.5);
    float _4791 = precise::clamp(_4789, 0.0, 1.0);
    float _4793 = -_4777;
    float _4795 = _4793 + _4779;
    float _4797 = _4545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4799 = -_4781;
    float _4801 = _4799 + _4783;
    float _4803 = fma(_4791, _4795, _4777);
    out.m_98.x = 0.0;
    float _4805 = -_4785;
    float _4807 = _4805 + _4787;
    float _4809 = fma(_4791, _4801, _4781);
    float _4811 = _4803 * 0.586610972881317138671875;
    out.m_53.x = _4797;
    bool _4813 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4815 = fma(_4791, _4807, _4785);
    float _4817 = fma(_4809, 0.298911988735198974609375, _4811);
    bool _4819 = _4002 > 0.0;
    bool _4821 = isnan(_4002);
    bool _4823 = _4819 || _4821;
    bool _4825 = isnan(0.0);
    bool _4827 = _4823 || _4825;
    float _4829 = fma(_4815, 0.114477999508380889892578125, _4817);
    float _4831 = -_4829;
    float _4833 = _4809 + _4831;
    float _4835 = -_4829;
    float _4837 = _4803 + _4835;
    float _4839 = -_4829;
    float _4841 = _4815 + _4839;
    float _4843 = fma(_4833, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    float _4845 = fma(_4837, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    float _4847 = fma(_4841, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4829);
    bool _4849 = !_4813;
    if (!_4849)
    {
        float _4851 = -_3942;
        float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4855 = -_3944;
        float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4859 = -_3946;
        float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4863 = _4853 * _4853;
        float _4865 = fma(_4857, _4857, _4863);
        float _4867 = fma(_4861, _4861, _4865);
        float _4869 = sqrt(_4867);
        float _4871 = rsqrt(_4867);
        float _4873 = -_4869;
        float _4875 = _4873 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4877 = _4875 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4879 = precise::clamp(_4877, 0.0, 1.0);
        float _4881 = _4857 * _4871;
        float _4883 = _4853 * _4871;
        float _4885 = abs(_4879);
        float _4887 = log2(_4885);
        float _4889 = _4861 * _4871;
        float _4891 = _4881 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4893 = _4531 * _4883;
        float _4895 = -_4883;
        float _4897 = -_4891;
        float _4899 = fma(_4895, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4897);
        float _4901 = fma(_4521, _4881, _4893);
        float _4903 = -_4889;
        float _4905 = fma(_4903, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4899);
        float _4907 = fma(_4533, _4889, _4901);
        float _4909 = precise::clamp(_4907, 0.0, 1.0);
        float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4913 = _4905 + _4911;
        float _4915 = _4887 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4917 = _4913 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4919 = precise::clamp(_4917, 0.0, 1.0);
        float _4921 = exp2(_4915);
        float _4923 = _4921 * _4919;
        float _4925 = _4909 * _4923;
        float _4927 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4929 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4931 = _4925 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4927;
        out.m_98.y = _4929;
        out.m_98.z = _4931;
    }
    out.m_100.x = _4843;
    out.m_100.y = _4845;
    out.m_100.z = _4847;
    if (_4827)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4933 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4933;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

