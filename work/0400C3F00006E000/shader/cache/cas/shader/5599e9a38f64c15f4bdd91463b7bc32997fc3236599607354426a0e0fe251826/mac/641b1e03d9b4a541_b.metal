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
    float4 m_76 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 m_80 [[user(locn13)]];
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
    float4 m_68 [[attribute(2)]];
    float4 m_72 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4635 = false;
    bool _551 = false;
    bool _407 = false;
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
    float _133 = as_type<float>(_121);
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
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4946 = as_type<float>(_143);
        out.gl_Position.z = _4946;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_121);
    bool _159 = _125 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _133;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    float _169 = _125 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _145 = as_type<int>(_173);
    }
    int _175 = _145;
    out.m_51.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5009 = as_type<float>(_175);
        out.gl_Position.z = _5009;
    }
    if (_163)
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
        _215 = _169;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _219 + _225;
    bool _229 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _231 = isnan(_219);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _219 + _253;
    float _257 = 1.0 / _243;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = 1.0 / _251;
    float _263 = 1.0 / _247;
    float _265 = _223 * _257;
    bool _267 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _269 = isnan(_219);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = -_239;
    float _281 = _279 + 1.0;
    float _283 = _277 * _281;
    float _285 = _227 * _261;
    bool _287 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_219);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -_277;
    float _301 = _299 + 1.0;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _307 = _255 * _263;
    bool _309 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_219);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = _297 * _301;
    float _327 = -_297;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_323, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = _319 * _329;
    float _339 = fma(_333, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = -_319;
    float _343 = _341 + 1.0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _335 * _337;
    float _351 = _339 * _337;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _353;
    float _357 = fma(_305, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _361 = fma(_347, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _369 = fma(_355, _285, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _371 = fma(_357, _325, _359);
    float _373 = fma(_365, _285, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_361, _325, _367);
    float _377 = fma(_369, _283, _371);
    float _379 = fma(_373, _283, _375);
    float _381 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].x, _377);
    float _383 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].y, _379);
    bool _385 = !_259;
    float _387 = _285;
    float _405;
    if (!_385)
    {
        float _389 = in.m_58.x;
        float _391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _395 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _397 = _395 * _391;
        float _399 = floor(_397);
        float _401 = -_399;
        float _403 = _397 + _401;
        _405 = _403;
        _407 = true;
    }
    else
    {
        _405 = _169;
    }
    _407 = false;
    float _409 = _405;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _409 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _435 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _437 = isnan(_409);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _447;
    bool _451 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_409);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / _417;
    float _465 = -_429;
    float _467 = _465 + 1.0;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _471 = 1.0 / _433;
    float _473 = _449 * _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _479 = -_461;
    float _481 = _479 + 1.0;
    float _483 = fma(_473, _413, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _485 = _445 * _467;
    float _487 = -_445;
    float _489 = _487 + 1.0;
    float _491 = _429 * _481;
    float _493 = _477 * _471;
    float _495 = _483 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _409 + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _495);
    float _503 = fma(_493, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _507 = fma(_503, _491, _501);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[117].x, _507);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _525 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _519;
    out.m_62.y = _521;
    out.m_62.z = _525;
    out.m_62.w = _523;
    float _527 = _383 * _513;
    float _529 = _381 * _511;
    bool _531 = !_469;
    float _549;
    if (!_531)
    {
        float _533 = in.m_58.x;
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _537 = _533 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        _549 = _169;
    }
    _551 = false;
    float _553 = _549;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _563 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _565 = isnan(_553);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _579 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _581 = isnan(_553);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _591;
    bool _595 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _597 = isnan(_553);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _561;
    float _609 = -_573;
    float _611 = _609 + 1.0;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _615 = 1.0 / _577;
    float _617 = _593 * _607;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _623 = -_605;
    float _625 = _623 + 1.0;
    float _627 = fma(_617, _557, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _629 = _589 * _611;
    float _631 = -_589;
    float _633 = _631 + 1.0;
    float _635 = _573 * _625;
    float _637 = _621 * _615;
    float _639 = _627 * _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _643 = _553 + _641;
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[131].x, _639);
    float _647 = fma(_637, _643, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = fma(_647, _635, _645);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[133].x, _651);
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _659;
    out.m_64.y = _661;
    out.m_64.z = _663;
    out.m_64.w = _665;
    bool _667 = !_613;
    float _669 = _657;
    int _671 = as_type<int>(_659);
    int _673 = as_type<int>(_639);
    float _675 = _645;
    float _677 = _573;
    float _679 = _653;
    if (!_667)
    {
        float _681 = in.m_58.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _669 = _689;
        _171 = _695;
    }
    float _697 = _669;
    float _699 = _171;
    float _701 = in.m_58.z;
    float _703 = in.m_58.w;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _711 = _697;
    if (_707)
    {
        float _713 = in.m_58.x;
        float _715 = in.m_58.y;
        _709 = _713;
        _711 = _715;
    }
    float _717 = _709;
    float _719 = _711;
    float _721 = 0.0;
    if (_707)
    {
        _721 = 1.0;
    }
    float _723 = _721;
    float _725 = 0.0;
    float _727 = _723;
    if (_707)
    {
        _725 = 1.0;
    }
    float _729 = _725;
    float _731 = _729;
    if (_707)
    {
        _671 = 0;
    }
    int _733 = _671;
    int _735 = _733;
    if (_707)
    {
        _673 = 0;
    }
    int _737 = _673;
    float _739 = _701 * 2.0;
    float _741 = floor(_739);
    float _743 = 0.0;
    float _745 = _717;
    float _747 = _719;
    int _749 = _737;
    if (_707)
    {
        _743 = _717;
    }
    float _751 = _743;
    float _753 = _751;
    if (_707)
    {
        _675 = _719;
    }
    float _755 = _675;
    float _757 = _755;
    if (_707)
    {
        _677 = _751;
    }
    float _759 = _677;
    float _761 = _759;
    if (_707)
    {
        _679 = _751;
    }
    float _763 = _679;
    float _765 = _763;
    if (!_707)
    {
        float _767 = in.m_58.x;
        float _769 = in.m_58.y;
        float _771 = in.m_58.z;
        float _773 = _767 * 3.1415927410125732421875;
        float _775 = _773 * 0.15915493667125701904296875;
        float _777 = _769 * 3.1415927410125732421875;
        float _779 = _777 * 0.15915493667125701904296875;
        float _781 = _775 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _779 * 6.283185482025146484375;
        float _787 = sin(_785);
        _745 = _767;
        _757 = _787;
        _747 = _769;
        _735 = 1;
        _749 = 2;
        _761 = _783;
        _731 = 5.839270114898681640625;
        _765 = _771;
        _727 = 7.345489978790283203125;
        _753 = _769;
    }
    float _789 = _745;
    float _791 = _757;
    float _793 = _747;
    int _795 = _735;
    int _797 = _749;
    float _799 = _761;
    float _801 = _731;
    float _803 = _765;
    float _805 = _727;
    float _807 = _753;
    float _809 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _811 = log2(_809);
    float _813 = _789 * 2.0;
    bool _815 = _741 > 0.0;
    float _817 = _791 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _819 = _741 >= 0.0;
    bool _821 = isnan(_741);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = _793 * 2.0;
    float _831 = _165 * _125;
    float _833 = floor(_813);
    int _835 = _827 ? 0 : 1;
    float _837 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _841 = ~_835;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _849 = _845;
    float _851 = _817;
    if (!_815)
    {
        int _853 = ~_835;
        int _855 = _853 + 1;
        _849 = _855;
    }
    int _857 = _849;
    float _859 = _811 * _125;
    bool _861 = _795 != 1;
    float _863 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[93].w, _839);
    bool _865 = _701 > 0.5;
    float _867 = floor(_829);
    float _869 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _863);
    float _871 = -_195;
    int _873 = _865 ? as_type<int>(_871) : as_type<int>(_195);
    bool _875 = _833 > 0.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _879 = _833 >= 0.0;
    bool _881 = isnan(_833);
    bool _883 = _879 || _881;
    bool _885 = isnan(0.0);
    bool _887 = _883 || _885;
    float _889 = exp2(_859);
    float _891 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _893 = _887 ? 0 : 1;
    float _895 = -_877;
    float _897 = fma(_891, 2.0, _895);
    bool _899 = _797 != 2;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _903 = ~_893;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _911 = int(_909);
    int _913 = _907;
    if (!_875)
    {
        int _915 = ~_893;
        int _917 = _915 + 1;
        _913 = _917;
    }
    int _919 = _913;
    float _921 = -_125;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    bool _925 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _933 = _929 || _931;
    float _935 = -_889;
    float _937 = _935 + 1.0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _949 = _947 != 0;
    float _951 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[93].z, _901);
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _955 = _933 ? _937 : 0.0;
    float _957 = _799 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _959 = _793 > 0.5;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _963 = !_949;
    float _965 = _963 ? _195 : as_type<float>(_873);
    float _967 = -_953;
    float _969 = fma(_957, 2.0, _967);
    float _971 = -_191;
    int _973 = _959 ? as_type<int>(_971) : as_type<int>(_191);
    float _975 = fma(_817, -2.0, _961);
    float _977 = _793 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _979 = !_945;
    float _981 = _979 ? _191 : as_type<float>(_973);
    float _983 = _793 + _701;
    int _985 = int(_861);
    int _987 = _899 ? 2 : 0;
    int _989 = _985 | _987;
    int _991 = _959 ? 4 : 0;
    int _993 = _989 | _991;
    int _995 = _941 ? 8 : 0;
    int _997 = _993 | _995;
    int _999 = _945 ? 16 : 0;
    int _1001 = _997 | _999;
    int _1003 = _949 ? 32 : 0;
    int _1005 = _1001 | _1003;
    int _1007 = _865 ? 64 : 0;
    int _1009 = _1005 | _1007;
    int _1011 = _1009 & 64;
    float _1013 = _793 + _789;
    float _1015 = _983 + (-1.0);
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1027 = _1025 != 0;
    float _1029 = _1013 + (-1.0);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1033 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _951);
    bool _1035 = !_1023;
    float _1037 = _1035 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1041 = !_1019;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1047 = !_1027;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = fma(_977, -2.0, _1039);
    float _1053 = -_125;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[91].x, _969);
    float _1057 = _961;
    float _1059 = _977;
    float _1061 = _953;
    float _1063 = _1037;
    if (!_861)
    {
        _1057 = _701;
    }
    float _1065 = _1057;
    float _1067 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1051);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1075 = _1073 != 0;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1079 = _1077 != 0;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1083 = _1065;
    if (!_861)
    {
        _851 = _793;
    }
    float _1085 = _851;
    float _1087 = _1085;
    if (_861)
    {
        _1083 = _793;
    }
    float _1089 = _1083;
    if (!_861)
    {
        _387 = _793;
    }
    float _1091 = _387;
    float _1093 = _1091;
    if (_861)
    {
        _1087 = _789;
    }
    float _1095 = _1087;
    float _1097 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1045);
    if (_861)
    {
        _1093 = _789;
    }
    float _1099 = _1093;
    float _1101 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = 0.0;
    if (!_861)
    {
        _1105 = _701;
    }
    float _1107 = _1105;
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1081);
    float _1111 = _1107;
    if (_899)
    {
        _1059 = _793;
    }
    float _1113 = _1059;
    float _1115 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1117 = _1113;
    if (_899)
    {
        _1061 = _789;
    }
    float _1119 = _1061;
    float _1121 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1123 = int(_1121);
    bool _1125 = !_1075;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = -_1103;
    float _1131 = fma(_1101, 2.0, _1129);
    bool _1133 = !_1071;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1097);
    bool _1139 = !_1079;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = -_125;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1131);
    float _1147 = _1119;
    if (_861)
    {
        _1111 = _793;
    }
    float _1149 = _1111;
    if (!_899)
    {
        _1147 = _701;
    }
    float _1151 = _1147;
    if (!_899)
    {
        _1117 = _789;
    }
    float _1153 = _1117;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1165 = _1163 != 0;
    bool _1167 = _867 > 0.0;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1171 = _867 >= 0.0;
    bool _1173 = isnan(_867);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan(0.0);
    bool _1179 = _1175 || _1177;
    float _1181 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1183 = int(_1181);
    bool _1185 = !_1157;
    int _1187 = _1185 ? 0 : 1;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1193 = abs(_1187);
    float _1195 = float(_911);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1199 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1201 = float(_1123);
    float _1203 = 1.0 / _1195;
    float _1205 = float(_1183);
    float _1207 = fma(_1199, -2.0, _1189);
    float _1209 = fma(_1169, -2.0, _1197);
    float _1211 = float(_857);
    float _1213 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1207);
    int _1215 = int(_1167);
    int _1217 = _1179 ? 2 : 0;
    int _1219 = _1215 | _1217;
    int _1221 = _959 ? 4 : 0;
    int _1223 = _1219 | _1221;
    int _1225 = _941 ? 8 : 0;
    int _1227 = _1223 | _1225;
    int _1229 = _1157 ? 16 : 0;
    int _1231 = _1227 | _1229;
    int _1233 = _1161 ? 32 : 0;
    int _1235 = _1231 | _1233;
    int _1237 = _1165 ? 64 : 0;
    int _1239 = _1235 | _1237;
    int _1241 = _1239 & 4;
    float _1243 = 1.0 / _1205;
    float _1245 = in.m_66.x;
    float _1247 = in.m_66.y;
    float _1249 = in.m_66.z;
    bool _1251 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1253 = isnan(1.0);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1259 = _1255 || _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1263 = 1.0 + _1261;
    float _1265 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1267 = float(_1193);
    float _1269 = 1.0 / _1201;
    float _1271 = -_1191;
    float _1273 = fma(_1265, 2.0, _1271);
    float _1275 = _1267 * _1211;
    float _1277 = _1203 * _125;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1281 = 1.0 / _1263;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1285 = !_1161;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1291 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1279);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1295 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1283);
    float _1297 = float(_919);
    float _1299 = _1243 * _125;
    float _1301 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1293);
    int _1303 = abs(_1287);
    float _1305 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1289);
    float _1307 = _1275 * (-2.0);
    float _1309 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1291);
    float _1311 = float(_1303);
    float _1313 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1295);
    float _1315 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1301);
    float _1317 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1109);
    float _1319 = _1269 * _125;
    float _1321 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1305);
    float _1323 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _975);
    float _1325 = -_125;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1273);
    float _1329 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1209);
    float _1331 = _1311 * _1297;
    if (_1259)
    {
        float _1333 = _955 * _1281;
        _135 = _1333;
    }
    float _1335 = _135;
    float _1337 = _789 + (-0.5);
    float _1339 = fma(_1307, _1245, _1245);
    int _1341 = _1179 ? 0 : 1;
    float _1343 = fma(_1115, _1307, _1115);
    bool _1345 = !_1165;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1339);
    int _1351 = ~_1341;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    float _1357 = _793 + (-0.5);
    int _1359 = abs(_1347);
    float _1361 = in.m_46.x;
    float _1363 = in.m_46.y;
    float _1365 = in.m_46.z;
    int _1367 = _1355;
    float _1369 = _1335;
    if (!_1167)
    {
        int _1371 = ~_1341;
        int _1373 = _1371 + 1;
        _1367 = _1373;
    }
    int _1375 = _1367;
    float _1377 = _1331 * (-2.0);
    float _1379 = fma(_1343, _1335, _1349);
    float _1381 = fma(_1377, _1247, _1247);
    float _1383 = float(_1375);
    float _1385 = fma(_1031, _1377, _1031);
    float _1387 = float(_1359);
    float _1389 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1381);
    float _1391 = _789 + _701;
    float _1393 = _1379 * 0.15915493667125701904296875;
    float _1395 = _1387 * _1383;
    float _1397 = fma(_1385, _1335, _1389);
    float _1399 = in.m_68.x;
    float _1401 = in.m_68.y;
    float _1403 = in.m_68.z;
    float _1405 = in.m_68.w;
    float _1407 = _1391 + (-1.0);
    float _1409 = _1395 * (-2.0);
    float _1411 = _701 + (-0.5);
    float _1413 = in.m_70.x;
    float _1415 = in.m_70.y;
    float _1417 = in.m_70.z;
    float _1419 = in.m_70.w;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1423 = fma(_1409, _1249, _1249);
    float _1425 = _1397 * 0.15915493667125701904296875;
    float _1427 = in.m_72.x;
    float _1429 = in.m_72.y;
    float _1431 = in.m_72.z;
    float _1433 = in.m_72.w;
    float _1435 = fma(_1421, _1409, _1421);
    float _1437 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1423);
    float _1439 = _1393 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1447 = fma(_1435, _1335, _1437);
    bool _1449 = _703 > 0.5;
    float _1451 = _837 * _1443;
    float _1453 = _847 * _1445;
    float _1455 = _1447 * 0.15915493667125701904296875;
    float _1457 = _1393 * 6.283185482025146484375;
    float _1459 = cos(_1457);
    float _1461 = _1363 * _1401;
    float _1463 = _1425 * 6.283185482025146484375;
    float _1465 = sin(_1463);
    float _1467 = _1363 * _1415;
    float _1469 = fma(_1361, _1399, _1461);
    float _1471 = _1363 * _1429;
    float _1473 = fma(_1361, _1413, _1467);
    float _1475 = fma(_1365, _1403, _1469);
    float _1477 = _1425 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = fma(_1361, _1427, _1471);
    float _1483 = fma(_1365, _1417, _1473);
    float _1485 = _1475 + _1405;
    float _1487 = fma(_1365, _1431, _1481);
    float _1489 = _1483 + _1419;
    float _1491 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1493 = _1455 * 6.283185482025146484375;
    float _1495 = cos(_1493);
    float _1497 = _1441 * _1465;
    float _1499 = _1487 + _1433;
    float _1501 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1491);
    float _1503 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1501);
    float _1505 = _1455 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = _1459 * _1479;
    float _1511 = _1441 * _1479;
    float _1513 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1515 = _1459 * _1495;
    float _1517 = _1459 * _1465;
    float _1519 = _1441 * _1495;
    float _1521 = _1479 * _1495;
    float _1523 = _1515 * _1451;
    float _1525 = _1465 * _1495;
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = 1.0 / _1513;
    float _1531 = fma(_1507, _1509, _1497);
    float _1533 = -_1451;
    float _1535 = _1507 * _1533;
    float _1537 = -_1511;
    float _1539 = fma(_1507, _1517, _1537);
    float _1541 = -_1517;
    float _1543 = fma(_1507, _1511, _1541);
    float _1545 = fma(_1531, _1453, _1523);
    float _1547 = _1519 * _1451;
    float _1549 = fma(_1521, _1453, _1535);
    float _1551 = fma(_1507, _1497, _1509);
    float _1553 = fma(_1539, _1527, _1545);
    float _1555 = fma(_1543, _1453, _1547);
    float _1557 = fma(_1525, _1527, _1549);
    float _1559 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1561 = fma(_1551, _1527, _1555);
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1567 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1559);
    float _1569 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1563);
    float _1571 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1565);
    float _1573 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1567);
    float _1575 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1569);
    float _1577 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1571);
    float _1579 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1581 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1583 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1585 = _1499 + _1579;
    float _1587 = _1489 + _1581;
    float _1589 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1593 = _1585 + _1591;
    float _1595 = _1485 + _1583;
    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1599 = _1587 + _1597;
    float _1601 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1589);
    float _1603 = _1593 * _1593;
    float _1605 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1601);
    float _1607 = fma(_1599, _1599, _1603);
    float _1609 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1611 = sqrt(_1607);
    float _1613 = _1609 + _1513;
    float _1615 = -_195;
    int _1617 = _1449 ? as_type<int>(_1615) : as_type<int>(_195);
    float _1619 = _1613 * _1529;
    float _1621 = _1619 * 0.5;
    bool _1623 = !_941;
    float _1625 = _1623 ? _195 : as_type<float>(_1617);
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1629 = _1627 != 0;
    int _1631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1633 = _1631 != 0;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1637 = _1635 != 0;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1641 = _1639 != 0;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1643);
    float _1647 = 1.0 / _1645;
    bool _1649 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1651 = !_1633;
    int _1653 = _1651 ? 0 : 1;
    bool _1655 = !_1629;
    int _1657 = _1655 ? 0 : 1;
    bool _1659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1661 = isnan(0.5);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1667 = _1663 || _1665;
    bool _1669 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1671 = isnan(0.5);
    bool _1673 = _1669 || _1671;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1677 = _1673 || _1675;
    bool _1679 = !_1637;
    int _1681 = _1679 ? 0 : 1;
    bool _1683 = !_1641;
    int _1685 = _1683 ? 0 : 1;
    float _1687 = _1529;
    float _1689 = _1445;
    float _1691 = _1587;
    float _1693 = _1607;
    float _1695 = _1561;
    float _1697 = _1489;
    if (!_1649)
    {
        _1687 = _1585;
    }
    float _1699 = _1687;
    float _1701 = _1699;
    if (!_1649)
    {
        _1689 = _1595;
    }
    float _1703 = _1689;
    bool _1705 = !_1649;
    float _1707 = _1703;
    if (!_1705)
    {
        float _1709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1713 = _1611 + _1711;
        float _1715 = rsqrt(_1607);
        float _1717 = _1713 * _1709;
        float _1719 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = _1717 * 0.15915493667125701904296875;
        float _1723 = _1721 * 6.283185482025146484375;
        float _1725 = cos(_1723);
        float _1727 = _1721 * 6.283185482025146484375;
        float _1729 = sin(_1727);
        float _1731 = _1725 + (-1.0);
        float _1733 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1735 = fma(_1729, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1737 = fma(_1595, _1725, _1733);
        float _1739 = _1715 * _1735;
        float _1741 = fma(_1599, _1739, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1743 = fma(_1593, _1739, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1707 = _1737;
        _1691 = _1741;
        _1701 = _1743;
    }
    float _1745 = _1707;
    float _1747 = _1691;
    float _1749 = _1701;
    float _1751 = _1745;
    float _1753 = _1747;
    float _1755 = _1749;
    if (_1677)
    {
        _1693 = 1.0;
    }
    float _1757 = _1693;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1761 = _1647 * _1759;
    float _1763 = _1757;
    if (!_1667)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1767 = _1485 + _1765;
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1771 = _1489 + _1769;
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1775 = -_1485;
        float _1777 = _1775 + _1745;
        float _1779 = _1767 * _1767;
        float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1783 = _1499 + _1781;
        float _1785 = -_1489;
        float _1787 = _1785 + _1747;
        float _1789 = fma(_1771, _1771, _1779);
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1793 = fma(_1783, _1783, _1789);
        float _1795 = sqrt(_1793);
        float _1797 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1799 = precise::min(_1795, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1801 = _1799 * _1791;
        float _1803 = _1797 * _1801;
        float _1805 = -_1499;
        float _1807 = _1805 + _1749;
        float _1809 = fma(_1777, _1803, _1485);
        float _1811 = fma(_1787, _1803, _1489);
        float _1813 = fma(_1807, _1803, _1499);
        _1751 = _1809;
        _1753 = _1811;
        _1755 = _1813;
    }
    float _1815 = _1751;
    float _1817 = _1753;
    float _1819 = _1755;
    if (!_1677)
    {
        float _1821 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1823 = _1821 * 0.15915493667125701904296875;
        float _1825 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1827 = _1823 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = _1825 * 0.15915493667125701904296875;
        float _1833 = _1823 * 6.283185482025146484375;
        float _1835 = sin(_1833);
        float _1837 = 1.0 / _1829;
        float _1839 = _1831 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = _1835 * _1837;
        float _1845 = _1831 * 6.283185482025146484375;
        float _1847 = sin(_1845);
        float _1849 = _1841 * _1843;
        float _1851 = 1.0 / _1849;
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1855 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1853;
        float _1857 = 1.0 / _1855;
        float _1859 = _1847 * _1851;
        float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1863 = fma(_1761, _1859, _1861);
        float _1865 = _1863 * _1857;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        _1695 = _1831;
        _1763 = _1867;
    }
    float _1869 = _1695;
    float _1871 = _1763;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1875 = _1815 + _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1879 = _1817 + _1877;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1883 = _1819 + _1881;
    float _1885 = _1875 * _1875;
    bool _1887 = _1011 != 0;
    float _1889 = fma(_1879, _1879, _1885);
    float _1891 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1893 = fma(_1883, _1883, _1889);
    float _1895 = floor(_1891);
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1899 = rsqrt(_1893);
    float _1901 = sqrt(_1893);
    float _1903 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1905 = _1879 * _1903;
    float _1907 = _1883 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 * _1907;
    float _1913 = _1909 + _1911;
    float _1915 = sqrt(_1913);
    bool _1917 = _1915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1921 = _1915 + _1919;
    float _1923 = _1899;
    float _1925 = _1913;
    float _1927 = _1921;
    float _1929 = _1869;
    float _1931 = _1875;
    if (_1917)
    {
        float _1933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1923 = _1933;
    }
    float _1935 = _1923;
    if (!_1917)
    {
        _1697 = _1909;
    }
    float _1937 = _1697;
    float _1939 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1941 = _1937;
    if (_1917)
    {
        float _1943 = rsqrt(_1913);
        _1925 = _1943;
    }
    float _1945 = _1925;
    if (_1917)
    {
        float _1947 = _1921 * _1935;
        _1927 = _1947;
    }
    float _1949 = _1927;
    if (_1917)
    {
        float _1951 = _1949 * 0.15915493667125701904296875;
        _1929 = _1951;
    }
    float _1953 = _1929;
    float _1955 = _1883;
    float _1957 = _1953;
    if (_1917)
    {
        float _1959 = _1953 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1967 = precise::max(0.0, _1965);
    float _1969 = _1935;
    float _1971 = _1967;
    if (_1917)
    {
        float _1973 = _1953 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        _1969 = _1975;
    }
    float _1977 = _1969;
    float _1979 = -_1903;
    float _1981 = -_1967;
    float _1983 = fma(_1875, _1979, _1981);
    if (_1917)
    {
        float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1985;
    }
    float _1987 = _1931;
    float _1989 = _1963;
    float _1991 = _1987;
    if (_1917)
    {
        float _1993 = fma(_1963, _1987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1989 = _1993;
    }
    float _1995 = _1989;
    float _1997 = _1995;
    if (!_1917)
    {
        _1991 = _1983;
    }
    float _1999 = _1991;
    float _2001 = _1999;
    float _2003 = _1977;
    if (_1917)
    {
        float _2005 = _1977 + (-1.0);
        _1971 = _2005;
    }
    float _2007 = _1971;
    float _2009 = _2007;
    if (_1917)
    {
        float _2011 = _1945 * _1995;
        _1369 = _2011;
    }
    float _2013 = _1369;
    if (!_1917)
    {
        _1997 = _1905;
    }
    float _2015 = _1997;
    float _2017 = _2015;
    if (_1917)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1957 = _2019;
    }
    float _2021 = _1957;
    if (_1917)
    {
        float _2023 = _1905 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1917)
    {
        _2009 = _1907;
    }
    float _2027 = _2009;
    float _2029 = _2027;
    if (_1917)
    {
        float _2031 = _1907 * _2013;
        _2029 = _2031;
    }
    float _2033 = _2029;
    if (_1917)
    {
        float _2035 = fma(_1983, _1977, _2021);
        _2001 = _2035;
    }
    float _2037 = _2001;
    if (_1917)
    {
        float _2039 = _2025 * _2025;
        _1941 = _2039;
    }
    float _2041 = _1941;
    if (!_1917)
    {
        _2003 = _1911;
    }
    float _2043 = _2003;
    float _2045 = _2043;
    if (_1917)
    {
        float _2047 = _2033 * _2033;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = fma(_2037, _2037, _2041);
    float _2053 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2055 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2057 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1939);
    float _2059 = _2051 + _2049;
    float _2061 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2063 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2065 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2053);
    float _2067 = rsqrt(_2059);
    float _2069 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2061);
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2073 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2055);
    float _2079 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2081 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2069);
    float _2083 = -_2075;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2077);
    float _2089 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2091 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2057);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2097 = abs(_2085);
    float _2099 = log2(_2097);
    float _2101 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2103 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2105 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2067 * _2025;
    float _2109 = _2067 * _2037;
    float _2111 = _2067 * _2033;
    float _2113 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2101);
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2117 = floor(_2063);
    float _2119 = -_1895;
    float _2121 = _1891 + _2119;
    float _2123 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2113);
    float _2125 = -_2115;
    float _2127 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2125);
    float _2129 = -_2105;
    float _2131 = fma(_2129, _1897, 1.0);
    float _2133 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2123);
    float _2135 = -_2111;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2127);
    float _2139 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2141 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2143 = log2(_2131);
    float _2145 = fma(_2137, -0.5, 0.5);
    float _2147 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2149 = fma(_2137, 0.5, 0.5);
    float _2151 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2141);
    float _2153 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2147);
    float _2155 = -_2117;
    float _2157 = _2063 + _2155;
    float _2159 = 1.0 / _2133;
    float _2161 = fma(_2149, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2163 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2151);
    float _2165 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2153);
    float _2167 = _2109 + 1.0;
    float _2169 = fma(_2149, _2161, -0.212114393711090087890625);
    float _2171 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2163);
    float _2173 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2165);
    float _2175 = exp2(_2139);
    float _2177 = fma(_2149, _2169, 1.570728778839111328125);
    float _2179 = _2143 * 0.693147182464599609375;
    float _2181 = sqrt(_2145);
    float _2183 = _2171 * _2159;
    float _2185 = _2173 * _2159;
    float _2187 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2189 = fma(_2185, -0.5, 0.5);
    float _2191 = -_2109;
    float _2193 = fma(_2175, _2167, _2191);
    float2 _8151 = float2(_2121, _2157);
    float _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8151, float2(0.0), isnan(_8151)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8151, float2(0.0), isnan(_8151)), level(0.0)).x;
    float _2197 = fma(_2193, 0.5, 0.5);
    float _2199 = _2181 * 0.636619746685028076171875;
    float _2201 = fma(_2183, 0.5, 0.5);
    float _2203 = -_2177;
    float _2205 = fma(_2199, _2203, 1.0);
    float3 _8174 = float3(_2201, _2189, _2187);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8174, float3(0.0), isnan(_8174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8174, float3(0.0), isnan(_8174)), level(0.0)).x;
    float3 _8185 = float3(_2201, _2189, _2187);
    float4 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8185, float3(0.0), isnan(_8185)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8185, float3(0.0), isnan(_8185)), level(0.0)).xyzw;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float _2218 = _2210.w;
    float2 _8201 = float2(_2205, _2197);
    float3 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8201, float2(0.0), isnan(_8201)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8201, float2(0.0), isnan(_8201)), level(0.0)).xyz;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2232 = int(_2230);
    float _2234 = _801 * _803;
    int _2236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2238 = _2236 != 0;
    float _2240 = -_1317;
    float _2242 = _2240 + 1.0;
    int _2244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2246 = _2244 != 0;
    float _2248 = -_1309;
    float _2250 = _2248 + 1.0;
    int _2252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2254 = _2252 != 0;
    float _2256 = -_1137;
    float _2258 = _2256 + 1.0;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2262 = int(_2260);
    int _2264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2266 = _2264 != 0;
    float _2268 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2270 = abs(_1135);
    float _2272 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2274 = abs(_1049);
    float _2276 = -_1313;
    float _2278 = _2276 + 1.0;
    bool _2280 = _1241 != 0;
    float _2282 = trunc(_1319);
    int _2284 = int(_2282);
    float _2286 = float(uint(_2232));
    float _2288 = -_1315;
    float _2290 = _2288 + 1.0;
    float _2292 = trunc(_1277);
    int _2294 = int(_2292);
    float _2296 = float(uint(_2262));
    float _2298 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2272);
    float _2300 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2302 = int(_2300);
    float _2304 = float(uint(_2284));
    float _2306 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2298);
    float _2308 = float(_2232);
    float _2310 = float(_2284);
    float _2312 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2314 = 1.0 / _2286;
    bool _2316 = _2310 >= _2308;
    bool _2318 = isnan(_2310);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan(_2308);
    bool _2324 = _2320 || _2322;
    float _2326 = float(_2324);
    float _2328 = float(_2294);
    out.gl_Position.x = _2171;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2312;
    out.gl_Position.w = _2133;
    bool _2330 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2332 = isnan(_699);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2338 = _2334 || _2336;
    float _2340 = float(_2338);
    float _2342 = 1.0 / _2296;
    float _2344 = float(uint(_2302));
    int _2346 = as_type<int>(_2314) + (-2);
    float _2348 = 1.0 / _2344;
    int _2350 = ~_2232;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2346) * _2304;
    int _2356 = as_type<int>(_2342) + (-2);
    float _2358 = trunc(_2354);
    float _2360 = precise::max(_2358, 0.0);
    uint _2363 = uint(_2360);
    float _2365 = float(uint(_2294));
    float _2367 = as_type<float>(_2356) * _2365;
    float _2369 = _805 * _789;
    float _2371 = trunc(_1299);
    int _2373 = int(_2371);
    int _2375 = ~_2262;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2367);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = _2352 * int(_2363);
    int _2387 = _2385 + _2284;
    float _2389 = float(uint(_2387));
    float _2391 = trunc(_2326);
    int _2393 = int(_2391);
    float _2395 = float(uint(_2373));
    float _2397 = as_type<float>(_2346) * _2389;
    float _2399 = floor(_2369);
    int _2401 = _2377 * int(_2383);
    int _2403 = _2401 + _2294;
    float _2405 = float(uint(_2403));
    float _2407 = trunc(_2397);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = as_type<float>(_2356) * _2405;
    int _2415 = as_type<int>(_2348) + (-2);
    int _2417 = ~_2232;
    int _2419 = _2417 + 1;
    float _2421 = floor(_2234);
    float _2423 = as_type<float>(_2415) * _2395;
    float _2425 = -_2399;
    float _2427 = _2369 + _2425;
    float _2429 = _805 * _807;
    int _2431 = ~_2302;
    int _2433 = _2431 + 1;
    float _2435 = trunc(_2413);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = int(_2363) + int(_2411);
    float _2443 = float(_2262);
    float _2445 = as_type<float>(_2411);
    float _2447 = _2429;
    float _2449 = as_type<float>(_2356);
    float _2451 = _2173;
    float _2453 = _2171;
    if (_2266)
    {
        float _2455 = in.m_58.w;
        _2445 = _2455;
    }
    float _2457 = _2445;
    int _2459 = ~_2262;
    int _2461 = _2459 + 1;
    int _2463 = _2419 * _2441;
    int _2465 = _2463 + _2284;
    bool _2467 = _2328 >= _2443;
    bool _2469 = isnan(_2328);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan(_2443);
    bool _2475 = _2471 || _2473;
    float _2477 = float(_2475);
    float _2479 = trunc(_2423);
    float _2481 = precise::max(_2479, 0.0);
    uint _2483 = uint(_2481);
    float _2485 = -_2421;
    float _2487 = _2234 + _2485;
    float _2489 = _2427 * _2308;
    float _2491 = _2308 * _831;
    bool _2493 = uint(_2465) >= uint(_2232);
    float _2495 = _2487 * _2443;
    bool _2497 = !_2254;
    int _2499 = _2497 ? 0 : 1;
    float _2501 = trunc(_2489);
    int _2503 = int(_2501);
    int _2505 = int(_2383) + int(_2439);
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2509 = _2507 != 0;
    int _2511 = abs(_2499);
    int _2513 = _2461 * _2505;
    int _2515 = _2513 + _2294;
    bool _2517 = !_2509;
    int _2519 = _2517 ? 0 : 1;
    int _2521 = _2433 * int(_2483);
    int _2523 = _2521 + _2373;
    float _2525 = trunc(_2495);
    int _2527 = int(_2525);
    bool _2529 = _2232 == 0;
    float _2531 = float(uint(_2523));
    bool _2533 = !_2493;
    int _2535 = _2533 ? 0 : (-1);
    bool _2537 = uint(_2515) >= uint(_2262);
    float _2539 = trunc(_2477);
    int _2541 = int(_2539);
    int _2543 = ~_2441;
    int _2545 = _2543 + _2535;
    int _2547 = _2545 + 1;
    float _2549 = as_type<float>(_2415) * _2531;
    bool _2551 = !_2537;
    int _2553 = _2551 ? 0 : (-1);
    int _2555 = abs(_2519);
    int _2557 = _2503 * _2511;
    int _2559 = _2557 + _2284;
    int _2561 = ~_2505;
    int _2563 = _2561 + _2553;
    int _2565 = _2563 + 1;
    float _2567 = trunc(_2549);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    int _2573 = _2232 * _2547;
    int _2575 = _2573 + _2284;
    bool _2577 = _2262 == 0;
    int _2579 = _2262 * _2565;
    int _2581 = _2579 + _2294;
    bool _2583 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2585 = isnan(_699);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2591 = _2587 || _2589;
    float _2593 = float(_2591);
    int _2595 = _2527 * _2555;
    int _2597 = _2595 + _2294;
    bool _2599 = !_2529;
    int _2601 = _2599 ? _2575 : (-1);
    float _2603 = trunc(_2491);
    int _2605 = int(_2603);
    int _2607 = ~_2541;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2577;
    int _2615 = _2613 ? _2581 : (-1);
    int _2617 = ~_2393;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = _2262 + (-1);
    int _2625 = _2615 * _2611;
    int _2627 = ~_2302;
    int _2629 = _2627 + 1;
    int _2631 = _2601 * _2621;
    int _2633 = _2232 + (-1);
    int _2635 = _2541 * _2623;
    int _2637 = _2635 + _2625;
    int _2639 = int(_2483) + int(_2571);
    float _2641 = _2443 * _831;
    int _2643 = _2393 * _2633;
    int _2645 = _2643 + _2631;
    int _2647 = abs(_1127);
    float _2649 = exp2(_2268);
    int _2651 = abs(as_type<int>(_1037));
    int _2653 = _2629 * _2639;
    int _2655 = _2653 + _2373;
    float _2657 = as_type<float>(_2655);
    if (_2266)
    {
        float _2659 = _2457 * 3.1415927410125732421875;
        _1063 = _2659;
    }
    float _2661 = _1063;
    bool _2663 = !_2238;
    int _2665 = _2663 ? 0 : 1;
    int _2667 = _2637 * _2647;
    int _2669 = abs(_1043);
    int _2671 = _2645 * _2651;
    float _2673 = trunc(_2641);
    int _2675 = int(_2673);
    bool _2677 = uint(_2655) >= uint(_2302);
    bool _2679 = _2677;
    if (_2266)
    {
        float _2681 = _2661 * 0.15915493667125701904296875;
        _2657 = _2681;
    }
    float _2683 = _2657;
    float _2685 = float(_2302);
    float _2687 = float(_2373);
    int _2689 = abs(_1657);
    float _2691 = _2683;
    if (_2266)
    {
        float _2693 = _2683 * 6.283185482025146484375;
        float _2695 = sin(_2693);
        _2691 = _2695;
    }
    float _2697 = _2691;
    bool _2699 = _2687 >= _2685;
    bool _2701 = isnan(_2687);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(_2685);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2685 * _831;
    float _2713 = -_2649;
    float _2715 = _2713 + 1.0;
    int _2717 = abs(_2665);
    int _2719 = _2605 * _2669;
    int _2721 = _2719 + _2671;
    bool _2723 = !_2677;
    int _2725 = _2723 ? 0 : (-1);
    float _2727 = trunc(_2709);
    int _2729 = int(_2727);
    int _2731 = _2675 * _2270;
    int _2733 = _2731 + _2667;
    int _2735 = abs(_1141);
    int _2737 = _2559 * _2274;
    int _2739 = _2737 + _2721;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2743 = _2741 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2745 = ~_2639;
    int _2747 = _2745 + _2725;
    int _2749 = _2747 + 1;
    float _2751 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2753 = _2503 * _2717;
    int _2755 = _2753 + _2739;
    bool _2757 = !_2246;
    int _2759 = _2757 ? 0 : 1;
    float _2761 = floor(_2429);
    if (_2266)
    {
        bool _2763 = _2697 > 0.5;
        _2679 = _2763;
    }
    bool _2765 = _2679;
    int _2767 = _2597 * _2735;
    int _2769 = _2767 + _2733;
    int _2771 = abs(_2759);
    int _2773 = _2302 * _2749;
    int _2775 = _2773 + _2373;
    float _2777 = float(uint(_2755));
    float _2779 = trunc(_2711);
    int _2781 = int(_2779);
    bool _2783 = _2302 == 0;
    float _2785 = as_type<float>(_2346) * _2777;
    float _2787 = float(uint(_2559));
    int _2789 = _2527 * _2771;
    int _2791 = _2789 + _2769;
    int _2793 = ~_2729;
    int _2795 = _2793 + 1;
    int _2797 = _2795 + 1;
    bool _2799 = !_2783;
    int _2801 = _2799 ? _2775 : (-1);
    float _2803 = trunc(_2785);
    float _2805 = precise::max(_2803, 0.0);
    uint _2807 = uint(_2805);
    float _2809 = float(uint(_2791));
    float _2811 = -_2761;
    float _2813 = _2429 + _2811;
    if (!_2266)
    {
        _2447 = _191;
    }
    float _2815 = _2447;
    float _2817 = as_type<float>(_2346) * _2787;
    float _2819 = _2815;
    if (_2266)
    {
        float _2821 = -_191;
        float _2823 = _2765 ? _2821 : _191;
        _2819 = _2823;
    }
    float _2825 = _2819;
    float _2827 = as_type<float>(_2356) * _2809;
    int _2829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2831 = _2829 != 0;
    int _2833 = _2801 * _2797;
    int _2835 = ~_2232;
    int _2837 = _2835 + 1;
    float _2839 = trunc(_2817);
    float _2841 = precise::max(_2839, 0.0);
    uint _2843 = uint(_2841);
    int _2845 = _2302 + (-1);
    float _2847 = _2813 * _2685;
    int _2849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2851 = _2849 != 0;
    int _2853 = ~_2262;
    int _2855 = _2853 + 1;
    int _2857 = _2837 * int(_2807);
    int _2859 = _2857 + _2755;
    int _2861 = abs(_1653);
    float _2863 = trunc(_2827);
    float _2865 = precise::max(_2863, 0.0);
    uint _2867 = uint(_2865);
    int _2869 = _2729 * _2845;
    int _2871 = _2869 + _2833;
    bool _2873 = !_2851;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = as_type<float>(_2639);
    if (_2831)
    {
        float _2879 = in.m_58.x;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = float(uint(_2859));
    int _2885 = ~_2232;
    int _2887 = _2885 + 1;
    float _2889 = trunc(_2847);
    int _2891 = int(_2889);
    int _2893 = abs(_2875);
    float _2895 = as_type<float>(_2346) * _2883;
    int _2897 = _2887 * int(_2843);
    int _2899 = _2897 + _2559;
    int _2901 = _2855 * int(_2867);
    int _2903 = _2901 + _2791;
    float _2905 = trunc(_2895);
    float _2907 = precise::max(_2905, 0.0);
    uint _2909 = uint(_2907);
    float _2911 = float(uint(_2903));
    int _2913 = _2871 * _2861;
    float _2915 = float(uint(_2899));
    int _2917 = _2891 * _2893;
    int _2919 = _2917 + _2373;
    int _2921 = abs(_1681);
    float _2923 = as_type<float>(_2356) * _2911;
    int _2925 = _2781 * _2689;
    int _2927 = _2925 + _2913;
    float _2929 = float(uint(_2597));
    float _2931 = as_type<float>(_2346) * _2915;
    float _2933 = trunc(_2923);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    int _2939 = ~_2232;
    int _2941 = _2939 + 1;
    int _2943 = _2919 * _2921;
    int _2945 = _2943 + _2927;
    int _2947 = abs(_1685);
    float _2949 = as_type<float>(_2356) * _2929;
    float _2951 = _2929;
    if (_2831)
    {
        float _2953 = _2881 * 3.1415927410125732421875;
        _2951 = _2953;
    }
    float _2955 = _2951;
    float _2957 = 1.0 / _2743;
    int _2959 = int(_2807) + int(_2909);
    float _2961 = _2955;
    if (_2831)
    {
        float _2963 = _2955 * 0.15915493667125701904296875;
        _2961 = _2963;
    }
    float _2965 = _2961;
    int _2967 = ~_2262;
    int _2969 = _2967 + 1;
    int _2971 = _2891 * _2947;
    int _2973 = _2971 + _2945;
    int _2975 = _2941 * _2959;
    int _2977 = _2975 + _2755;
    float _2979 = trunc(_2949);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = float(uint(_2919));
    float _2987 = -_2195;
    float _2989 = _2987 + 1.0;
    int _2991 = int(_2867) + int(_2937);
    float _2993 = -_191;
    int _2995 = _1887 ? as_type<int>(_2993) : as_type<int>(_191);
    float _2997 = as_type<float>(_2415) * _2985;
    bool _2999 = uint(_2977) >= uint(_2232);
    float _3001 = _2965;
    if (_2831)
    {
        float _3003 = _2965 * 6.283185482025146484375;
        float _3005 = sin(_3003);
        _3001 = _3005;
    }
    float _3007 = _3001;
    int _3009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3011 = _3009 != 0;
    int _3013 = _2969 * _2991;
    int _3015 = _3013 + _2791;
    float _3017 = float(uint(_2973));
    int _3019 = ~_2262;
    int _3021 = _3019 + 1;
    bool _3023 = !_3011;
    float _3025 = _3023 ? _191 : as_type<float>(_2995);
    float _3027 = trunc(_2931);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    bool _3033 = uint(_3015) >= uint(_2262);
    float _3035 = as_type<float>(_2415) * _3017;
    int _3037 = _3021 * int(_2983);
    int _3039 = _3037 + _2597;
    bool _3041 = !_2999;
    int _3043 = _3041 ? 0 : (-1);
    int _3045 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3047 = _3045 != 0;
    float _3049 = trunc(_2997);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    float _3055 = float(uint(_3039));
    bool _3057 = !_3033;
    int _3059 = _3057 ? 0 : (-1);
    int _3061 = ~_2959;
    int _3063 = _3061 + _3043;
    int _3065 = _3063 + 1;
    float _3067 = as_type<float>(_2356) * _3055;
    bool _3069 = _3033;
    if (_2831)
    {
        bool _3071 = _3007 > 0.5;
        _3069 = _3071;
    }
    bool _3073 = _3069;
    float _3075 = trunc(_3035);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = ~_2302;
    int _3083 = _3081 + 1;
    int _3085 = _2232 * _3065;
    int _3087 = _3085 + _2755;
    int _3089 = ~_2991;
    int _3091 = _3089 + _3059;
    int _3093 = _3091 + 1;
    int _3095 = int(_2843) + int(_3031);
    int _3097 = ~_2302;
    int _3099 = _3097 + 1;
    int _3101 = _3083 * int(_3053);
    int _3103 = _3101 + _2919;
    if (!_2831)
    {
        _2449 = _195;
    }
    float _3105 = _2449;
    int _3107 = _2262 * _3093;
    int _3109 = _3107 + _2791;
    bool _3111 = !_2529;
    int _3113 = _3111 ? _3087 : (-1);
    float _3115 = trunc(_3067);
    float _3117 = precise::max(_3115, 0.0);
    uint _3119 = uint(_3117);
    float _3121 = float(uint(_3103));
    float _3123 = _3105;
    if (_2831)
    {
        float _3125 = -_195;
        float _3127 = _3073 ? _3125 : _195;
        _3123 = _3127;
    }
    float _3129 = _3123;
    int _3131 = _3099 * int(_3079);
    int _3133 = _3131 + _2973;
    int _3135 = _3113 & 3;
    bool _3137 = _3135 != 0;
    float _3139 = as_type<float>(_2415) * _3121;
    int _3141 = ~_2232;
    int _3143 = _3141 + 1;
    float _3145 = -_195;
    int _3147 = _2280 ? as_type<int>(_3145) : as_type<int>(_195);
    float _3149 = trunc(_3139);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    float _3155 = float(uint(_3133));
    int _3157 = _3143 * _3095;
    int _3159 = _3157 + _2559;
    bool _3161 = uint(_3135) > 1u;
    int _3163 = _3113 & 3;
    bool _3165 = _3163 != 0;
    float _3167 = as_type<float>(_2415) * _3155;
    bool _3169 = !_2577;
    int _3171 = _3169 ? _3109 : (-1);
    int _3173 = _3165 ? 0 : 1;
    int _3175 = _3171 & 3;
    bool _3177 = _3175 != 0;
    float _3179 = trunc(_3167);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    bool _3185 = !_3047;
    float _3187 = _3185 ? _195 : as_type<float>(_3147);
    bool _3189 = uint(_3159) >= uint(_2232);
    int _3191 = ~_3173;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3195;
    if (!_3161)
    {
        int _3199 = ~_3173;
        int _3201 = _3199 + 1;
        _3197 = _3201;
    }
    int _3203 = _3197;
    bool _3205 = uint(_3175) > 1u;
    bool _3207 = !_3189;
    int _3209 = _3207 ? 0 : (-1);
    int _3211 = _3171 & 3;
    bool _3213 = _3211 != 0;
    int _3215 = ~_2262;
    int _3217 = _3215 + 1;
    int _3219 = _3213 ? 0 : 1;
    int _3221 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3223 = _3221 != 0;
    int _3225 = int(_2983) + int(_3119);
    int _3227 = ~_3219;
    int _3229 = _3227 + 1;
    int _3231 = _3229 + 1;
    int _3233 = _3231;
    if (!_3205)
    {
        int _3235 = ~_3219;
        int _3237 = _3235 + 1;
        _3233 = _3237;
    }
    int _3239 = _3233;
    int _3241 = _3217 * _3225;
    int _3243 = _3241 + _2597;
    bool _3245 = !_3177;
    int _3247 = _3245 ? 0 : 1;
    bool _3249 = _3175 != 3;
    int _3251 = int(_3079) + int(_3183);
    int _3253 = int(_3053) + int(_3153);
    int _3255 = ~_2302;
    int _3257 = _3255 + 1;
    bool _3259 = uint(_3175) >= 2u;
    int _3261 = _3257 * _3251;
    int _3263 = _3261 + _2973;
    int _3265 = ~_2302;
    int _3267 = _3265 + 1;
    int _3269 = _3259 ? 0 : 1;
    float _3271 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3275 = uint(_3243) >= uint(_2262);
    int _3277 = _3267 * _3253;
    int _3279 = _3277 + _2919;
    float _3281 = 1.0 / _3273;
    int _3283 = ~_3269;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    int _3289 = _3287;
    if (_3249)
    {
        int _3291 = ~_3269;
        int _3293 = _3291 + 1;
        _3289 = _3293;
    }
    int _3295 = _3289;
    float _3297 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3299 = _3297 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3301 = uint(_3263) >= uint(_2302);
    bool _3303 = !_3275;
    int _3305 = _3303 ? 0 : (-1);
    float _3307 = 1.0 / _3299;
    bool _3309 = uint(_3279) >= uint(_2302);
    bool _3311 = !_3301;
    int _3313 = _3311 ? 0 : (-1);
    bool _3315 = _789 > 0.5;
    bool _3317 = !_3309;
    int _3319 = _3317 ? 0 : (-1);
    bool _3321 = _3175 != 3;
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3325 = _3323 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3327 = -_191;
    int _3329 = _3315 ? as_type<int>(_3327) : as_type<int>(_191);
    float _3331 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3333 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3331;
    bool _3335 = !_3321;
    int _3337 = _3335 ? 0 : (-1);
    float _3339 = 1.0 / _3325;
    bool _3341 = !_3223;
    float _3343 = _3341 ? _191 : as_type<float>(_3329);
    float _3345 = _3333 * _3281;
    int _3347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3349 = _3347 != 0;
    float _3351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3353 = _3351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3357 = _3355 != 0;
    int _3359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3361 = _3359 != 0;
    float _3363 = _3353 * _3307;
    bool _3365 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3367 = isnan(_699);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3373 = _3369 || _3371;
    float _3375 = float(_3373);
    float _3377 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3377;
    bool _3381 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3383 = isnan(_699);
    bool _3385 = _3381 || _3383;
    bool _3387 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3389 = _3385 || _3387;
    float _3391 = float(_3389);
    float _3393 = -_3375;
    float _3395 = _3393 + 1.0;
    bool _3397 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3399 = isnan(_699);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3405 = _3401 || _3403;
    float _3407 = float(_3405);
    float _3409 = -_3391;
    float _3411 = _3409 + 1.0;
    float _3413 = _3379 * _3339;
    float _3415 = _3391 * _3395;
    float _3417 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3419 = _3417 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3421 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3423 = isnan(_699);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3429 = _3425 || _3427;
    float _3431 = float(_3429);
    float _3433 = _3407 * _3411;
    float _3435 = -_3407;
    float _3437 = _3435 + 1.0;
    float _3439 = -_2593;
    float _3441 = _3439 + 1.0;
    float _3443 = 1.0 / _3419;
    float _3445 = -_3431;
    float _3447 = _3445 + 1.0;
    float _3449 = _3431 * _3437;
    float _3451 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3453 = _3451 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3455 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3457 = isnan(_699);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = _2340 * _3441;
    float _3469 = -_2340;
    float _3471 = _3469 + 1.0;
    bool _3473 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3475 = isnan(_699);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3481 = _3477 || _3479;
    float _3483 = float(_3481);
    float _3485 = 1.0 / _3453;
    float _3487 = _2593 * _3447;
    float _3489 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3491 = _699 + _3489;
    float _3493 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3495 = _3493 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3497 = _3465 * _3471;
    float _3499 = -_3465;
    float _3501 = _3499 + 1.0;
    float _3503 = fma(_3345, _3491, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3505 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3507 = _3505 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3509 = 1.0 / _3495;
    float _3511 = _3483 * _3501;
    float _3513 = _3507 * _3443;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3517 = _699 + _3515;
    float _3519 = _3503 * _3511;
    float _3521 = -_3483;
    float _3523 = _3521 + 1.0;
    float _3525 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3527 = _3525 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3529 = fma(_3363, _3517, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3533 = _699 + _3531;
    float _3535 = fma(_3523, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3519);
    float _3537 = _3527 * _3485;
    float _3539 = abs(_1761);
    float _3541 = log2(_3539);
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3545 = _699 + _3543;
    float _3547 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3549 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3547;
    float _3551 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3551;
    float _3555 = fma(_3529, _3497, _3535);
    float _3557 = fma(_3413, _3545, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3559 = fma(_3513, _3533, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3561 = _3549 * _3509;
    float _3563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3565 = _3553 * _2957;
    float _3567 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3569 = _699 + _3567;
    float _3571 = fma(_3557, _3467, _3555);
    float _3573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3575 = _699 + _3573;
    float _3577 = _2825 + 0.5;
    float _3579 = fma(_3565, _3569, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3581 = fma(_3559, _3487, _3571);
    float _3583 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3585 = _3129 + (-0.5);
    float _3587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3589 = _699 + _3587;
    float _3591 = fma(_3537, _3575, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3593 = fma(_3579, _3449, _3581);
    float _3595 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1055);
    float _3597 = -_3585;
    float _3599 = -_1323;
    float _3601 = fma(_3597, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3599);
    float _3603 = -_1033;
    float _3605 = _3603 + 1.0;
    float _3607 = _3343 + 0.5;
    float _3609 = exp2(_3583);
    float _3611 = -_869;
    float _3613 = _3611 + 1.0;
    float _3615 = _3187 + (-0.5);
    float _3617 = fma(_3591, _3433, _3593);
    float _3619 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[80].x, _923);
    float _3621 = -_3605;
    float _3623 = fma(_3621, _2825, _3595);
    float _3625 = fma(_3613, _3129, _3601);
    float _3627 = -_3615;
    float _3629 = -_1067;
    float _3631 = fma(_3627, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3629);
    float _3633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3635 = _3563 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3637 = _3025 + 0.5;
    int _3639 = _3171 >> 31;
    out.m_74.x = _3623;
    out.m_74.y = _3625;
    int _3641 = ~_3251;
    int _3643 = _3641 + _3313;
    int _3645 = _3643 + 1;
    float _3647 = fma(_3635, _3637, _1145);
    int _3649 = _3639 & 3;
    float _3651 = _1625 + (-0.5);
    float _3653 = -_2242;
    float _3655 = fma(_3025, _3653, _3647);
    int _3657 = _3171 + _3649;
    float _3659 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3661 = int(_3659);
    float _3663 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3665 = precise::clamp(_3663, 0.0, 1.0);
    int _3667 = _3657 >> 2;
    float _3669 = _3633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3671 = -_1321;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3665, -2.0, 3.0);
    float _3677 = _3665 * _3665;
    float _3679 = -_3669;
    float _3681 = -_1213;
    float _3683 = fma(_3679, _3651, _3681);
    int _3685 = _3667 << 4;
    int _3687 = _3685 + 656;
    float _3689 = -_2250;
    float _3691 = fma(_3343, _3689, _3619);
    float _3693 = _3677 * _3675;
    float _3695 = fma(_3187, _3673, _3631);
    uint _3697 = uint(int(uint(_3687) >> uint(2)));
    uint _3699 = uint(int(uint(int(_3697)) >> uint(2)));
    int _3701 = int(_3697) & 3;
    float _3703 = (*spvDescriptorSet0.vp_c9)._m0[int(_3699)][_3701];
    int _3705 = int(_3697) + 1;
    uint _3707 = uint(int(uint(_3705) >> uint(2)));
    int _3709 = _3705 & 3;
    float _3711 = (*spvDescriptorSet0.vp_c9)._m0[int(_3707)][_3709];
    float _3713 = fma(_1625, _2258, _3683);
    float _3715 = -_3693;
    float _3717 = _3715 + 1.0;
    float _3719 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3721 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3723 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3725 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3693);
    out.m_76.x = _3691;
    out.m_76.y = _3695;
    out.m_76.z = _3655;
    out.m_76.w = _3713;
    int _3727 = _3687 + 8;
    uint _3729 = uint(int(uint(_3727) >> uint(2)));
    uint _3731 = uint(int(uint(int(_3729)) >> uint(2)));
    int _3733 = int(_3729) & 3;
    float _3735 = (*spvDescriptorSet0.vp_c9)._m0[int(_3731)][_3733];
    int _3737 = int(_3729) + 1;
    uint _3739 = uint(int(uint(_3737) >> uint(2)));
    int _3741 = _3737 & 3;
    float _3743 = (*spvDescriptorSet0.vp_c9)._m0[int(_3739)][_3741];
    float _3745 = -_1507;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3719);
    float _3749 = -_1507;
    float _3751 = fma(_3749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3721);
    float _3753 = -_1507;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3723);
    int _3757 = ~_3253;
    int _3759 = _3757 + _3319;
    int _3761 = _3759 + 1;
    float _3763 = fma(_3561, _3589, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3765 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3751);
    int _3767 = ~_3225;
    int _3769 = _3767 + _3305;
    int _3771 = _3769 + 1;
    int _3773 = _2302 * _3645;
    int _3775 = _3773 + _2973;
    float _3777 = fma(_3763, _3415, _3617);
    int _3779 = _2302 * _3761;
    int _3781 = _3779 + _2919;
    float _3783 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3785 = _2262 * _3771;
    int _3787 = _3785 + _2597;
    float _3789 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3791 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3793 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3795 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3797 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3789);
    int _3799 = abs(_3239);
    float _3801 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3791);
    float _3803 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3793);
    bool _3805 = !_3357;
    int _3807 = _3805 ? 0 : 1;
    float _3809 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3811 = ~_3799;
    int _3813 = _3811 + 1;
    int _3815 = _3813 + 1;
    float _3817 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3801);
    int _3819 = abs(_3247);
    float _3821 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3823 = uint(_3135) >= 2u;
    float _3825 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3795);
    int _3827 = ~_3819;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    float _3833 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3809);
    int _3835 = abs(_3807);
    float _3837 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3821);
    int _3839 = abs(_3337);
    float _3841 = fma(_3375, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3777);
    int _3843 = _3823 ? 0 : 1;
    float _3845 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3833);
    bool _3847 = _3135 != 3;
    float _3849 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3837);
    int _3851 = ~_3839;
    int _3853 = _3851 + 1;
    int _3855 = _3853 + 1;
    int _3857 = _3815 * as_type<int>(_3711);
    int _3859 = abs(_3295);
    float _3861 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3747);
    bool _3863 = !_2783;
    int _3865 = _3863 ? _3775 : (-1);
    int _3867 = _3831 * as_type<int>(_3703);
    int _3869 = _3867 + _3857;
    int _3871 = ~_3859;
    int _3873 = _3871 + 1;
    int _3875 = _3873 + 1;
    float _3877 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3755);
    int _3879 = _3113 >> 31;
    out.m_78.x = _3841;
    int _3881 = ~_3843;
    int _3883 = _3881 + 1;
    int _3885 = _3883 + 1;
    int _3887 = _3875 * as_type<int>(_3735);
    int _3889 = _3887 + _3869;
    int _3891 = _3879 & 3;
    int _3893 = ~_3835;
    int _3895 = _3893 + 1;
    int _3897 = _3895 + 1;
    int _3899 = _3855 * as_type<int>(_3743);
    int _3901 = _3899 + _3889;
    int _3903 = _3113 + _3891;
    float _3905 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3797);
    int _3907 = abs(_3661);
    int _3909 = _3901 * _3897;
    float _3911 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3803);
    float _3913 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3825);
    float _3915 = float(uint(_3661));
    float _3917 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3919 = _3903 >> 2;
    float _3921 = _3917 * _3861;
    int _3923 = _3885;
    if (_3847)
    {
        int _3925 = ~_3843;
        int _3927 = _3925 + 1;
        _3923 = _3927;
    }
    int _3929 = _3923;
    float _3931 = 1.0 / _3915;
    int _3933 = _3865 >> 31;
    float _3935 = fma(_3783, _3911, _3921);
    bool _3937 = !_2577;
    int _3939 = _3937 ? _3787 : (-1);
    out.m_80.x = _3911;
    out.m_80.y = _3905;
    out.m_80.z = _3913;
    int _3941 = _3865 & 3;
    bool _3943 = _3941 != 0;
    float _3945 = _3817 + _3935;
    float _3947 = float(uint(_3907));
    int _3949 = _3939 * _3835;
    int _3951 = _3949 + _3909;
    int _3953 = _3919 << 4;
    int _3955 = _3953 + 368;
    float _3957 = _3917 * _3765;
    int _3959 = _3865 & 3;
    bool _3961 = _3959 != 0;
    int _3963 = _3933 & 3;
    uint _3965 = uint(int(uint(_3955) >> uint(2)));
    uint _3967 = uint(int(uint(int(_3965)) >> uint(2)));
    int _3969 = int(_3965) & 3;
    float _3971 = (*spvDescriptorSet0.vp_c9)._m0[int(_3967)][_3969];
    int _3973 = int(_3965) + 1;
    uint _3975 = uint(int(uint(_3973) >> uint(2)));
    int _3977 = _3973 & 3;
    float _3979 = (*spvDescriptorSet0.vp_c9)._m0[int(_3975)][_3977];
    int _3981 = _3943 ? 0 : 1;
    float _3983 = 1.0 / _3947;
    bool _3985 = uint(_3959) > 1u;
    float _3987 = fma(_3783, _3905, _3957);
    int _3989 = _3865 + _3963;
    int _3991 = abs(_3951);
    int _3993 = _3989 >> 2;
    int _3995 = ~_3981;
    int _3997 = _3995 + 1;
    int _3999 = _3997 + 1;
    int _4001 = _3993 << 4;
    int _4003 = _4001 + 800;
    bool _4005 = _1761 <= 8000.0;
    bool _4007 = isnan(_1761);
    bool _4009 = _4005 || _4007;
    bool _4011 = isnan(8000.0);
    bool _4013 = _4009 || _4011;
    float _4015 = float(_4013);
    int _4017 = _3999;
    if (!_3985)
    {
        int _4019 = ~_3981;
        int _4021 = _4019 + 1;
        _4017 = _4021;
    }
    int _4023 = _4017;
    uint _4025 = uint(int(uint(_4003) >> uint(2)));
    uint _4027 = uint(int(uint(int(_4025)) >> uint(2)));
    int _4029 = int(_4025) & 3;
    float _4031 = (*spvDescriptorSet0.vp_c9)._m0[int(_4027)][_4029];
    int _4033 = int(_4025) + 1;
    uint _4035 = uint(int(uint(_4033) >> uint(2)));
    int _4037 = _4033 & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = as_type<int>(_3931) + (-2);
    float _4043 = _4015 * _3725;
    float _4045 = float(uint(_3951));
    int _4047 = ~_3095;
    int _4049 = _4047 + _3209;
    int _4051 = _4049 + 1;
    float _4053 = as_type<float>(_4041) * _4045;
    int _4055 = as_type<int>(_3983) + (-2);
    int _4057 = _3955 + 8;
    uint _4059 = uint(int(uint(_4057) >> uint(2)));
    uint _4061 = uint(int(uint(int(_4059)) >> uint(2)));
    int _4063 = int(_4059) & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = int(_4059) + 1;
    uint _4069 = uint(int(uint(_4067) >> uint(2)));
    int _4071 = _4067 & 3;
    float _4073 = (*spvDescriptorSet0.vp_c9)._m0[int(_4069)][_4071];
    float _4075 = float(uint(_3991));
    int _4077 = _2232 * _4051;
    int _4079 = _4077 + _2559;
    float _4081 = _3917 * _3877;
    float _4083 = trunc(_4053);
    float _4085 = precise::max(_4083, 0.0);
    uint _4087 = uint(_4085);
    bool _4089 = !_3137;
    int _4091 = _4089 ? 0 : 1;
    float _4093 = as_type<float>(_4055) * _4075;
    bool _4095 = uint(_3959) >= 2u;
    int _4097 = _4003 + 8;
    uint _4099 = uint(int(uint(_4097) >> uint(2)));
    uint _4101 = uint(int(uint(int(_4099)) >> uint(2)));
    int _4103 = int(_4099) & 3;
    float _4105 = (*spvDescriptorSet0.vp_c9)._m0[int(_4101)][_4103];
    int _4107 = int(_4099) + 1;
    uint _4109 = uint(int(uint(_4107) >> uint(2)));
    int _4111 = _4107 & 3;
    float _4113 = (*spvDescriptorSet0.vp_c9)._m0[int(_4109)][_4111];
    bool _4115 = _3959 != 3;
    float _4117 = fma(_3783, _3913, _4081);
    int _4119 = ~_3661;
    int _4121 = _4119 + 1;
    float _4123 = trunc(_4093);
    float _4125 = precise::max(_4123, 0.0);
    uint _4127 = uint(_4125);
    int _4129 = _4095 ? 0 : 1;
    bool _4131 = _3135 != 3;
    int _4133 = ~_3907;
    int _4135 = _4133 + 1;
    int _4137 = abs(_3203);
    int _4139 = _4121 * int(_4087);
    int _4141 = _4139 + _3951;
    float _4143 = fma(_3917, _3917, 1.0);
    int _4145 = ~_4137;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    int _4151 = ~_4129;
    int _4153 = _4151 + 1;
    int _4155 = _4153 + 1;
    int _4157 = _4155;
    if (_4115)
    {
        int _4159 = ~_4129;
        int _4161 = _4159 + 1;
        _4157 = _4161;
    }
    int _4163 = _4157;
    int _4165 = _4135 * int(_4127);
    int _4167 = _4165 + _3991;
    float _4169 = float(uint(_4141));
    int _4171 = _4149 * as_type<int>(_3979);
    bool _4173 = !_3961;
    int _4175 = _4173 ? 0 : 1;
    float _4177 = rsqrt(_4143);
    int _4179 = abs(_4091);
    float _4181 = as_type<float>(_4041) * _4169;
    float _4183 = float(uint(_4167));
    int _4185 = abs(_4175);
    int _4187 = abs(_4023);
    float _4189 = trunc(_4181);
    float _4191 = precise::max(_4189, 0.0);
    uint _4193 = uint(_4191);
    float _4195 = as_type<float>(_4055) * _4183;
    int _4197 = abs(_3929);
    int _4199 = abs(_4163);
    float _4201 = _3917 * _4177;
    int _4203 = ~_4187;
    int _4205 = _4203 + 1;
    int _4207 = _4205 + 1;
    float _4209 = trunc(_4195);
    float _4211 = precise::max(_4209, 0.0);
    uint _4213 = uint(_4211);
    int _4215 = ~_4179;
    int _4217 = _4215 + 1;
    int _4219 = _4217 + 1;
    int _4221 = ~_4185;
    int _4223 = _4221 + 1;
    int _4225 = _4223 + 1;
    int _4227 = _4207 * as_type<int>(_4039);
    int _4229 = _4219 * as_type<int>(_3971);
    int _4231 = _4229 + _4171;
    int _4233 = _4225 * as_type<int>(_4031);
    int _4235 = _4233 + _4227;
    int _4237 = ~_4197;
    int _4239 = _4237 + 1;
    int _4241 = _4239 + 1;
    int _4243 = ~_4199;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    bool _4249 = _3959 != 3;
    int _4251 = _4241 * as_type<int>(_4065);
    int _4253 = _4251 + _4231;
    float _4255 = -_3817;
    float _4257 = _4201 * _4255;
    int _4259 = _4247 * as_type<int>(_4105);
    int _4261 = _4259 + _4235;
    float _4263 = -_3845;
    float _4265 = _4201 * _4263;
    bool _4267 = !_4131;
    int _4269 = _4267 ? 0 : (-1);
    float _4271 = fma(_4177, _3861, _4257);
    int _4273 = int(_4087) + int(_4193);
    float _4275 = fma(_4177, _3765, _4265);
    bool _4277 = !_4249;
    int _4279 = _4277 ? 0 : (-1);
    float _4281 = -_3849;
    float _4283 = _4201 * _4281;
    int _4285 = abs(_4269);
    int _4287 = ~_3661;
    int _4289 = _4287 + 1;
    int _4291 = abs(_4279);
    int _4293 = ~_3907;
    int _4295 = _4293 + 1;
    int _4297 = _4289 * _4273;
    int _4299 = _4297 + _3951;
    float _4301 = fma(_4177, _3877, _4283);
    int _4303 = int(_4127) + int(_4213);
    float _4305 = _3845 + _3987;
    float _4307 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _4309 = ~_4285;
    int _4311 = _4309 + 1;
    int _4313 = _4311 + 1;
    out.m_82.x = _4271;
    out.m_82.y = _4275;
    out.m_82.z = _4301;
    bool _4315 = uint(_4299) >= uint(_3661);
    int _4317 = _4295 * _4303;
    int _4319 = _4317 + _3991;
    int _4321 = ~_4291;
    int _4323 = _4321 + 1;
    int _4325 = _4323 + 1;
    int _4327 = _4313 * as_type<int>(_4073);
    int _4329 = _4327 + _4253;
    bool _4331 = !_3349;
    int _4333 = _4331 ? 0 : 1;
    float _4335 = _2989 * _4307;
    float _4337 = precise::clamp(_4335, 0.0, 1.0);
    bool _4339 = !_4315;
    int _4341 = _4339 ? 0 : (-1);
    int _4343 = _4325 * as_type<int>(_4113);
    int _4345 = _4343 + _4261;
    bool _4347 = uint(_4319) >= uint(_3907);
    int _4349 = _3951 ^ _3661;
    int _4351 = abs(_4333);
    float _4353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4355 = ~_4273;
    int _4357 = _4355 + _4341;
    int _4359 = _4357 + 1;
    bool _4361 = !_4347;
    int _4363 = _4361 ? 0 : (-1);
    uint _4365 = uint(int(uint(_4349) >> uint(31)));
    int _4367 = _3661 * _4359;
    int _4369 = _4367 + _3951;
    int _4371 = ~_4351;
    int _4373 = _4371 + 1;
    int _4375 = _4373 + 1;
    int _4377 = ~_4363;
    int _4379 = _4303 + _4377;
    int _4381 = _4379 + 1;
    int _4383 = ~int(_4365);
    int _4385 = _4383 + 1;
    int _4387 = _4329 * _4375;
    bool _4389 = _3661 == 0;
    float _4391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4393 = !_3361;
    int _4395 = _4393 ? 0 : 1;
    int _4397 = _4381 ^ _4385;
    bool _4399 = !_4389;
    int _4401 = _4399 ? _4369 : (-1);
    float _4403 = _3849 + _4117;
    int _4405 = abs(_4395);
    int _4407 = ~_4385;
    int _4409 = _4407 + _4397;
    int _4411 = _4409 + 1;
    float _4413 = float(_4401);
    float _4415 = _4353 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4417 = ~_4405;
    int _4419 = _4417 + 1;
    int _4421 = _4419 + 1;
    out.m_84.x = _3945;
    out.m_84.y = _4305;
    out.m_84.z = _4403;
    bool _4423 = _3661 == 0;
    float _4425 = fma(_4415, _4413, _1327);
    float _4427 = _981 + 0.5;
    int _4429 = _4345 * _4421;
    bool _4431 = !_4423;
    int _4433 = _4431 ? _4411 : (-1);
    float _4435 = fma(_4415, _4427, _4425);
    bool _4437 = !_2783;
    int _4439 = _4437 ? _3781 : (-1);
    float _4441 = in.m_86.x;
    float _4443 = float(_4433);
    float _4445 = _4391 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4447 = _965 + (-0.5);
    int _4449 = _4439 * _4405;
    int _4451 = _4449 + _4429;
    bool _4453 = !_2529;
    int _4455 = _4453 ? _4079 : (-1);
    float _4457 = -_1329;
    float _4459 = fma(_4445, _4443, _4457);
    float _4461 = -_2278;
    float _4463 = fma(_981, _4461, _4435);
    float _4465 = _2133 * 0.5;
    float _4467 = float(_4451);
    float _4469 = -_4445;
    float _4471 = fma(_4469, _4447, _4459);
    int _4473 = _4455 * _4351;
    int _4475 = _4473 + _4387;
    float _4477 = _2312 + _2133;
    float _4479 = fma(_2173, -0.5, _4465);
    float _4481 = fma(_965, _2290, _4471);
    out.m_88.w = _4467;
    float _4483 = float(_4475);
    float _4485 = _2171 + _2133;
    float _4487 = -_4337;
    float _4489 = fma(_4487, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4491 = _4477 * 0.5;
    float _4493 = _4485 * 0.5;
    out.m_90.x = _4463;
    out.m_90.y = _4481;
    float _4495 = _2751 * _2207;
    float _4497 = _4489 * _4441;
    float _4499 = -_2751;
    float _4501 = _4499 + 1.0;
    out.m_92.x = _4493;
    out.m_92.y = _4479;
    out.m_92.z = _4491;
    out.m_92.w = _2133;
    float _4503 = _2218 * _4495;
    float _4505 = _2228 * _4495;
    float _4507 = _4497 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4509 = _2218 * _4501;
    float _4511 = fma(_2224, _4503, _2212);
    float _4513 = fma(_2226, _4503, _2214);
    float _4515 = fma(_2218, _4505, _2216);
    out.m_94.x = _4507;
    bool _4517 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4519 = isnan(_1901);
    bool _4521 = _4517 || _4519;
    bool _4523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4525 = _4521 || _4523;
    float _4527 = _1871 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4511;
    out.m_96.y = _4513;
    out.m_96.z = _4515;
    out.m_96.w = _4509;
    out.m_88.x = _4483;
    float _4529 = _4497;
    float _4531 = _4495;
    float _4533 = _4483;
    float _4535 = _4503;
    if (!_4525)
    {
        _2451 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4537 = _2451;
    float _4539 = _4537;
    float _4541 = _4537;
    if (!_4525)
    {
        _2453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4543 = _2453;
    float _4545 = _4543;
    float _4547 = _4543;
    if (!_4525)
    {
        _4529 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4549 = _4529;
    float _4551 = _4549;
    float _4553 = _4549;
    if (!_4525)
    {
        _4531 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4555 = _4531;
    float _4557 = _4555;
    float _4559 = _4555;
    if (!_4525)
    {
        _4533 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4561 = _4533;
    float _4563 = _4561;
    float _4565 = _4561;
    if (!_4525)
    {
        _4535 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4567 = _4535;
    bool _4569 = !_4525;
    float _4571 = _4567;
    float _4573 = _4567;
    if (!_4569)
    {
        bool _4575 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4577 = isnan(_1901);
        bool _4579 = _4575 || _4577;
        bool _4581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4583 = _4579 || _4581;
        if (!_4583)
        {
            float _4585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4587 = _1901 + _4585;
            float _4589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4591 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4589;
            float _4593 = 1.0 / _4591;
            float _4595 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4597 = _4595 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4599 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4601 = _4599 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4603 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4605 = _4603 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4607 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4609 = _4607 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4611 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4613 = _4611 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4615 = _4587 * _4593;
            float _4617 = precise::clamp(_4615, 0.0, 1.0);
            float _4619 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4621 = _4619 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4623 = fma(_4617, _4597, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4625 = fma(_4617, _4621, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4627 = fma(_4617, _4601, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4629 = fma(_4617, _4605, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4631 = fma(_4617, _4609, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4633 = fma(_4617, _4613, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4547 = _4625;
            _4565 = _4631;
            _4541 = _4623;
            _4559 = _4629;
            _4553 = _4627;
            _4573 = _4633;
            _4635 = true;
        }
        else
        {
            bool _4637 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4639 = isnan(_1901);
            bool _4641 = _4637 || _4639;
            bool _4643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4645 = _4641 || _4643;
            if (!_4645)
            {
                _4539 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4647 = _4539;
            _4541 = _4647;
            if (!_4645)
            {
                _4545 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4649 = _4545;
            _4547 = _4649;
            if (!_4645)
            {
                _4551 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4651 = _4551;
            _4553 = _4651;
            if (!_4645)
            {
                _4557 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4653 = _4557;
            _4559 = _4653;
            if (!_4645)
            {
                _4563 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4655 = _4563;
            _4565 = _4655;
            if (!_4645)
            {
                _4571 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4657 = _4571;
            bool _4659 = !_4645;
            _4573 = _4657;
            if (!_4659)
            {
                bool _4661 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4663 = isnan(_1901);
                bool _4665 = _4661 || _4663;
                bool _4667 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4669 = _4665 || _4667;
                if (!_4669)
                {
                    float _4671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4673 = _1901 + _4671;
                    float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4677 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4675;
                    float _4679 = 1.0 / _4677;
                    float _4681 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4683 = _4681 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4685 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4687 = _4685 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4689 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4691 = _4689 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4693 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4695 = _4693 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4697 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4699 = _4697 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4701 = _4673 * _4679;
                    float _4703 = precise::clamp(_4701, 0.0, 1.0);
                    float _4705 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4707 = _4705 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4709 = fma(_4703, _4683, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4711 = fma(_4703, _4707, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4713 = fma(_4703, _4687, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4715 = fma(_4703, _4691, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4717 = fma(_4703, _4695, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4719 = fma(_4703, _4699, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4547 = _4711;
                    _4565 = _4717;
                    _4541 = _4709;
                    _4559 = _4715;
                    _4553 = _4713;
                    _4573 = _4719;
                    _4635 = true;
                }
                else
                {
                    _4547 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4565 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4541 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4559 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4553 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4573 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4635 = false;
    float _4721 = _4547;
    float _4723 = _4565;
    float _4725 = _4541;
    float _4727 = _4559;
    float _4729 = _4553;
    float _4731 = _4573;
    float _4733 = fma(_4305, -0.5, 0.5);
    float _4735 = precise::clamp(_4733, 0.0, 1.0);
    float _4737 = -_4721;
    float _4739 = _4737 + _4723;
    float _4741 = -_4725;
    float _4743 = _4741 + _4727;
    out.m_98.x = 0.0;
    float _4745 = fma(_4735, _4739, _4721);
    float _4747 = -_4729;
    float _4749 = _4747 + _4731;
    float _4751 = fma(_4735, _4743, _4725);
    float _4753 = _4745 * 0.586610972881317138671875;
    bool _4755 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4757 = fma(_4735, _4749, _4729);
    float _4759 = _4527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4761 = fma(_4751, 0.298911988735198974609375, _4753);
    bool _4763 = _1871 > 0.0;
    bool _4765 = isnan(_1871);
    bool _4767 = _4763 || _4765;
    bool _4769 = isnan(0.0);
    bool _4771 = _4767 || _4769;
    float _4773 = fma(_4757, 0.114477999508380889892578125, _4761);
    out.m_53.x = _4759;
    float _4775 = -_4773;
    float _4777 = _4751 + _4775;
    float _4779 = -_4773;
    float _4781 = _4745 + _4779;
    float _4783 = -_4773;
    float _4785 = _4757 + _4783;
    float _4787 = fma(_4777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    float _4789 = fma(_4781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    float _4791 = fma(_4785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    bool _4793 = !_4755;
    if (!_4793)
    {
        float _4795 = -_1815;
        float _4797 = _4795 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4799 = -_1817;
        float _4801 = _4799 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4803 = -_1819;
        float _4805 = _4803 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4807 = _4797 * _4797;
        float _4809 = fma(_4801, _4801, _4807);
        float _4811 = fma(_4805, _4805, _4809);
        float _4813 = sqrt(_4811);
        float _4815 = rsqrt(_4811);
        float _4817 = -_4813;
        float _4819 = _4817 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4821 = _4819 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4823 = precise::clamp(_4821, 0.0, 1.0);
        float _4825 = _4801 * _4815;
        float _4827 = _4797 * _4815;
        float _4829 = abs(_4823);
        float _4831 = log2(_4829);
        float _4833 = _4805 * _4815;
        float _4835 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4837 = _4305 * _4827;
        float _4839 = -_4827;
        float _4841 = -_4835;
        float _4843 = fma(_4839, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4841);
        float _4845 = fma(_3945, _4825, _4837);
        float _4847 = -_4833;
        float _4849 = fma(_4847, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4843);
        float _4851 = fma(_4403, _4833, _4845);
        float _4853 = precise::clamp(_4851, 0.0, 1.0);
        float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4857 = _4849 + _4855;
        float _4859 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4861 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4863 = precise::clamp(_4861, 0.0, 1.0);
        float _4865 = exp2(_4859);
        float _4867 = _4865 * _4863;
        float _4869 = _4853 * _4867;
        float _4871 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4873 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4875 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4871;
        out.m_98.y = _4873;
        out.m_98.z = _4875;
    }
    out.m_100.x = _4787;
    out.m_100.y = _4789;
    out.m_100.z = _4791;
    if (_4771)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4877 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4877;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4635 = false;
    bool _551 = false;
    bool _407 = false;
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
    float _133 = as_type<float>(_121);
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
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4946 = as_type<float>(_143);
        out.gl_Position.z = _4946;
    }
    if (!_129)
    {
        return out;
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_121);
    bool _159 = _125 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _133;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    float _169 = _125 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _145 = as_type<int>(_173);
    }
    int _175 = _145;
    out.m_51.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5009 = as_type<float>(_175);
        out.gl_Position.z = _5009;
    }
    if (_163)
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
        _215 = _169;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _219 + _225;
    bool _229 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _231 = isnan(_219);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _219 + _253;
    float _257 = 1.0 / _243;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = 1.0 / _251;
    float _263 = 1.0 / _247;
    float _265 = _223 * _257;
    bool _267 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _269 = isnan(_219);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = -_239;
    float _281 = _279 + 1.0;
    float _283 = _277 * _281;
    float _285 = _227 * _261;
    bool _287 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_219);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -_277;
    float _301 = _299 + 1.0;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _307 = _255 * _263;
    bool _309 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_219);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = _297 * _301;
    float _327 = -_297;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_323, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = _319 * _329;
    float _339 = fma(_333, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = -_319;
    float _343 = _341 + 1.0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _335 * _337;
    float _351 = _339 * _337;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _353;
    float _357 = fma(_305, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _361 = fma(_347, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _369 = fma(_355, _285, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _371 = fma(_357, _325, _359);
    float _373 = fma(_365, _285, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_361, _325, _367);
    float _377 = fma(_369, _283, _371);
    float _379 = fma(_373, _283, _375);
    float _381 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].x, _377);
    float _383 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].y, _379);
    bool _385 = !_259;
    float _387 = _285;
    float _405;
    if (!_385)
    {
        float _389 = in.m_58.x;
        float _391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _395 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _397 = _395 * _391;
        float _399 = floor(_397);
        float _401 = -_399;
        float _403 = _397 + _401;
        _405 = _403;
        _407 = true;
    }
    else
    {
        _405 = _169;
    }
    _407 = false;
    float _409 = _405;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _409 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _435 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _437 = isnan(_409);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _447;
    bool _451 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_409);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / _417;
    float _465 = -_429;
    float _467 = _465 + 1.0;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _471 = 1.0 / _433;
    float _473 = _449 * _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _479 = -_461;
    float _481 = _479 + 1.0;
    float _483 = fma(_473, _413, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _485 = _445 * _467;
    float _487 = -_445;
    float _489 = _487 + 1.0;
    float _491 = _429 * _481;
    float _493 = _477 * _471;
    float _495 = _483 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _409 + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _495);
    float _503 = fma(_493, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _507 = fma(_503, _491, _501);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[117].x, _507);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _525 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _519;
    out.m_62.y = _521;
    out.m_62.z = _525;
    out.m_62.w = _523;
    float _527 = _383 * _513;
    float _529 = _381 * _511;
    bool _531 = !_469;
    float _549;
    if (!_531)
    {
        float _533 = in.m_58.x;
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _537 = _533 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        _549 = _169;
    }
    _551 = false;
    float _553 = _549;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _563 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _565 = isnan(_553);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _579 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _581 = isnan(_553);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _591;
    bool _595 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _597 = isnan(_553);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _561;
    float _609 = -_573;
    float _611 = _609 + 1.0;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _615 = 1.0 / _577;
    float _617 = _593 * _607;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _623 = -_605;
    float _625 = _623 + 1.0;
    float _627 = fma(_617, _557, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _629 = _589 * _611;
    float _631 = -_589;
    float _633 = _631 + 1.0;
    float _635 = _573 * _625;
    float _637 = _621 * _615;
    float _639 = _627 * _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _643 = _553 + _641;
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[131].x, _639);
    float _647 = fma(_637, _643, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = fma(_647, _635, _645);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[133].x, _651);
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _659;
    out.m_64.y = _661;
    out.m_64.z = _663;
    out.m_64.w = _665;
    bool _667 = !_613;
    float _669 = _657;
    int _671 = as_type<int>(_659);
    int _673 = as_type<int>(_639);
    float _675 = _645;
    float _677 = _573;
    float _679 = _653;
    if (!_667)
    {
        float _681 = in.m_58.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _669 = _689;
        _171 = _695;
    }
    float _697 = _669;
    float _699 = _171;
    float _701 = in.m_58.z;
    float _703 = in.m_58.w;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _711 = _697;
    if (_707)
    {
        float _713 = in.m_58.x;
        float _715 = in.m_58.y;
        _709 = _713;
        _711 = _715;
    }
    float _717 = _709;
    float _719 = _711;
    float _721 = 0.0;
    if (_707)
    {
        _721 = 1.0;
    }
    float _723 = _721;
    float _725 = 0.0;
    float _727 = _723;
    if (_707)
    {
        _725 = 1.0;
    }
    float _729 = _725;
    float _731 = _729;
    if (_707)
    {
        _671 = 0;
    }
    int _733 = _671;
    int _735 = _733;
    if (_707)
    {
        _673 = 0;
    }
    int _737 = _673;
    float _739 = _701 * 2.0;
    float _741 = floor(_739);
    float _743 = 0.0;
    float _745 = _717;
    float _747 = _719;
    int _749 = _737;
    if (_707)
    {
        _743 = _717;
    }
    float _751 = _743;
    float _753 = _751;
    if (_707)
    {
        _675 = _719;
    }
    float _755 = _675;
    float _757 = _755;
    if (_707)
    {
        _677 = _751;
    }
    float _759 = _677;
    float _761 = _759;
    if (_707)
    {
        _679 = _751;
    }
    float _763 = _679;
    float _765 = _763;
    if (!_707)
    {
        float _767 = in.m_58.x;
        float _769 = in.m_58.y;
        float _771 = in.m_58.z;
        float _773 = _767 * 3.1415927410125732421875;
        float _775 = _773 * 0.15915493667125701904296875;
        float _777 = _769 * 3.1415927410125732421875;
        float _779 = _777 * 0.15915493667125701904296875;
        float _781 = _775 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _779 * 6.283185482025146484375;
        float _787 = sin(_785);
        _745 = _767;
        _757 = _787;
        _747 = _769;
        _735 = 1;
        _749 = 2;
        _761 = _783;
        _731 = 5.839270114898681640625;
        _765 = _771;
        _727 = 7.345489978790283203125;
        _753 = _769;
    }
    float _789 = _745;
    float _791 = _757;
    float _793 = _747;
    int _795 = _735;
    int _797 = _749;
    float _799 = _761;
    float _801 = _731;
    float _803 = _765;
    float _805 = _727;
    float _807 = _753;
    float _809 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _811 = log2(_809);
    float _813 = _789 * 2.0;
    bool _815 = _741 > 0.0;
    float _817 = _791 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _819 = _741 >= 0.0;
    bool _821 = isnan(_741);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = _793 * 2.0;
    float _831 = _165 * _125;
    float _833 = floor(_813);
    int _835 = _827 ? 0 : 1;
    float _837 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _841 = ~_835;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _849 = _845;
    float _851 = _817;
    if (!_815)
    {
        int _853 = ~_835;
        int _855 = _853 + 1;
        _849 = _855;
    }
    int _857 = _849;
    float _859 = _811 * _125;
    bool _861 = _795 != 1;
    float _863 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[93].w, _839);
    bool _865 = _701 > 0.5;
    float _867 = floor(_829);
    float _869 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _863);
    float _871 = -_195;
    int _873 = _865 ? as_type<int>(_871) : as_type<int>(_195);
    bool _875 = _833 > 0.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _879 = _833 >= 0.0;
    bool _881 = isnan(_833);
    bool _883 = _879 || _881;
    bool _885 = isnan(0.0);
    bool _887 = _883 || _885;
    float _889 = exp2(_859);
    float _891 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _893 = _887 ? 0 : 1;
    float _895 = -_877;
    float _897 = fma(_891, 2.0, _895);
    bool _899 = _797 != 2;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _903 = ~_893;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _911 = int(_909);
    int _913 = _907;
    if (!_875)
    {
        int _915 = ~_893;
        int _917 = _915 + 1;
        _913 = _917;
    }
    int _919 = _913;
    float _921 = -_125;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    bool _925 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _933 = _929 || _931;
    float _935 = -_889;
    float _937 = _935 + 1.0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _949 = _947 != 0;
    float _951 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[93].z, _901);
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _955 = _933 ? _937 : 0.0;
    float _957 = _799 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _959 = _793 > 0.5;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _963 = !_949;
    float _965 = _963 ? _195 : as_type<float>(_873);
    float _967 = -_953;
    float _969 = fma(_957, 2.0, _967);
    float _971 = -_191;
    int _973 = _959 ? as_type<int>(_971) : as_type<int>(_191);
    float _975 = fma(_817, -2.0, _961);
    float _977 = _793 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _979 = !_945;
    float _981 = _979 ? _191 : as_type<float>(_973);
    float _983 = _793 + _701;
    int _985 = int(_861);
    int _987 = _899 ? 2 : 0;
    int _989 = _985 | _987;
    int _991 = _959 ? 4 : 0;
    int _993 = _989 | _991;
    int _995 = _941 ? 8 : 0;
    int _997 = _993 | _995;
    int _999 = _945 ? 16 : 0;
    int _1001 = _997 | _999;
    int _1003 = _949 ? 32 : 0;
    int _1005 = _1001 | _1003;
    int _1007 = _865 ? 64 : 0;
    int _1009 = _1005 | _1007;
    int _1011 = _1009 & 64;
    float _1013 = _793 + _789;
    float _1015 = _983 + (-1.0);
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1027 = _1025 != 0;
    float _1029 = _1013 + (-1.0);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1033 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _951);
    bool _1035 = !_1023;
    float _1037 = _1035 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1041 = !_1019;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1047 = !_1027;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = fma(_977, -2.0, _1039);
    float _1053 = -_125;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[91].x, _969);
    float _1057 = _961;
    float _1059 = _977;
    float _1061 = _953;
    float _1063 = _1037;
    if (!_861)
    {
        _1057 = _701;
    }
    float _1065 = _1057;
    float _1067 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1051);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1075 = _1073 != 0;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1079 = _1077 != 0;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1083 = _1065;
    if (!_861)
    {
        _851 = _793;
    }
    float _1085 = _851;
    float _1087 = _1085;
    if (_861)
    {
        _1083 = _793;
    }
    float _1089 = _1083;
    if (!_861)
    {
        _387 = _793;
    }
    float _1091 = _387;
    float _1093 = _1091;
    if (_861)
    {
        _1087 = _789;
    }
    float _1095 = _1087;
    float _1097 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1045);
    if (_861)
    {
        _1093 = _789;
    }
    float _1099 = _1093;
    float _1101 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = 0.0;
    if (!_861)
    {
        _1105 = _701;
    }
    float _1107 = _1105;
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1081);
    float _1111 = _1107;
    if (_899)
    {
        _1059 = _793;
    }
    float _1113 = _1059;
    float _1115 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1117 = _1113;
    if (_899)
    {
        _1061 = _789;
    }
    float _1119 = _1061;
    float _1121 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1123 = int(_1121);
    bool _1125 = !_1075;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = -_1103;
    float _1131 = fma(_1101, 2.0, _1129);
    bool _1133 = !_1071;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1097);
    bool _1139 = !_1079;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = -_125;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1131);
    float _1147 = _1119;
    if (_861)
    {
        _1111 = _793;
    }
    float _1149 = _1111;
    if (!_899)
    {
        _1147 = _701;
    }
    float _1151 = _1147;
    if (!_899)
    {
        _1117 = _789;
    }
    float _1153 = _1117;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1165 = _1163 != 0;
    bool _1167 = _867 > 0.0;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1171 = _867 >= 0.0;
    bool _1173 = isnan(_867);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan(0.0);
    bool _1179 = _1175 || _1177;
    float _1181 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1183 = int(_1181);
    bool _1185 = !_1157;
    int _1187 = _1185 ? 0 : 1;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1193 = abs(_1187);
    float _1195 = float(_911);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1199 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1201 = float(_1123);
    float _1203 = 1.0 / _1195;
    float _1205 = float(_1183);
    float _1207 = fma(_1199, -2.0, _1189);
    float _1209 = fma(_1169, -2.0, _1197);
    float _1211 = float(_857);
    float _1213 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1207);
    int _1215 = int(_1167);
    int _1217 = _1179 ? 2 : 0;
    int _1219 = _1215 | _1217;
    int _1221 = _959 ? 4 : 0;
    int _1223 = _1219 | _1221;
    int _1225 = _941 ? 8 : 0;
    int _1227 = _1223 | _1225;
    int _1229 = _1157 ? 16 : 0;
    int _1231 = _1227 | _1229;
    int _1233 = _1161 ? 32 : 0;
    int _1235 = _1231 | _1233;
    int _1237 = _1165 ? 64 : 0;
    int _1239 = _1235 | _1237;
    int _1241 = _1239 & 4;
    float _1243 = 1.0 / _1205;
    float _1245 = in.m_66.x;
    float _1247 = in.m_66.y;
    float _1249 = in.m_66.z;
    bool _1251 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1253 = isnan(1.0);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1259 = _1255 || _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1263 = 1.0 + _1261;
    float _1265 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1267 = float(_1193);
    float _1269 = 1.0 / _1201;
    float _1271 = -_1191;
    float _1273 = fma(_1265, 2.0, _1271);
    float _1275 = _1267 * _1211;
    float _1277 = _1203 * _125;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1281 = 1.0 / _1263;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1285 = !_1161;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1291 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1279);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1295 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1283);
    float _1297 = float(_919);
    float _1299 = _1243 * _125;
    float _1301 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1293);
    int _1303 = abs(_1287);
    float _1305 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1289);
    float _1307 = _1275 * (-2.0);
    float _1309 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1291);
    float _1311 = float(_1303);
    float _1313 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1295);
    float _1315 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1301);
    float _1317 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1109);
    float _1319 = _1269 * _125;
    float _1321 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1305);
    float _1323 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _975);
    float _1325 = -_125;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1273);
    float _1329 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1209);
    float _1331 = _1311 * _1297;
    if (_1259)
    {
        float _1333 = _955 * _1281;
        _135 = _1333;
    }
    float _1335 = _135;
    float _1337 = _789 + (-0.5);
    float _1339 = fma(_1307, _1245, _1245);
    int _1341 = _1179 ? 0 : 1;
    float _1343 = fma(_1115, _1307, _1115);
    bool _1345 = !_1165;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1339);
    int _1351 = ~_1341;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    float _1357 = _793 + (-0.5);
    int _1359 = abs(_1347);
    float _1361 = in.m_46.x;
    float _1363 = in.m_46.y;
    float _1365 = in.m_46.z;
    int _1367 = _1355;
    float _1369 = _1335;
    if (!_1167)
    {
        int _1371 = ~_1341;
        int _1373 = _1371 + 1;
        _1367 = _1373;
    }
    int _1375 = _1367;
    float _1377 = _1331 * (-2.0);
    float _1379 = fma(_1343, _1335, _1349);
    float _1381 = fma(_1377, _1247, _1247);
    float _1383 = float(_1375);
    float _1385 = fma(_1031, _1377, _1031);
    float _1387 = float(_1359);
    float _1389 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1381);
    float _1391 = _789 + _701;
    float _1393 = _1379 * 0.15915493667125701904296875;
    float _1395 = _1387 * _1383;
    float _1397 = fma(_1385, _1335, _1389);
    float _1399 = in.m_68.x;
    float _1401 = in.m_68.y;
    float _1403 = in.m_68.z;
    float _1405 = in.m_68.w;
    float _1407 = _1391 + (-1.0);
    float _1409 = _1395 * (-2.0);
    float _1411 = _701 + (-0.5);
    float _1413 = in.m_70.x;
    float _1415 = in.m_70.y;
    float _1417 = in.m_70.z;
    float _1419 = in.m_70.w;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1423 = fma(_1409, _1249, _1249);
    float _1425 = _1397 * 0.15915493667125701904296875;
    float _1427 = in.m_72.x;
    float _1429 = in.m_72.y;
    float _1431 = in.m_72.z;
    float _1433 = in.m_72.w;
    float _1435 = fma(_1421, _1409, _1421);
    float _1437 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1423);
    float _1439 = _1393 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1447 = fma(_1435, _1335, _1437);
    bool _1449 = _703 > 0.5;
    float _1451 = _837 * _1443;
    float _1453 = _847 * _1445;
    float _1455 = _1447 * 0.15915493667125701904296875;
    float _1457 = _1393 * 6.283185482025146484375;
    float _1459 = cos(_1457);
    float _1461 = _1363 * _1401;
    float _1463 = _1425 * 6.283185482025146484375;
    float _1465 = sin(_1463);
    float _1467 = _1363 * _1415;
    float _1469 = fma(_1361, _1399, _1461);
    float _1471 = _1363 * _1429;
    float _1473 = fma(_1361, _1413, _1467);
    float _1475 = fma(_1365, _1403, _1469);
    float _1477 = _1425 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = fma(_1361, _1427, _1471);
    float _1483 = fma(_1365, _1417, _1473);
    float _1485 = _1475 + _1405;
    float _1487 = fma(_1365, _1431, _1481);
    float _1489 = _1483 + _1419;
    float _1491 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1493 = _1455 * 6.283185482025146484375;
    float _1495 = cos(_1493);
    float _1497 = _1441 * _1465;
    float _1499 = _1487 + _1433;
    float _1501 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1491);
    float _1503 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1501);
    float _1505 = _1455 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = _1459 * _1479;
    float _1511 = _1441 * _1479;
    float _1513 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1515 = _1459 * _1495;
    float _1517 = _1459 * _1465;
    float _1519 = _1441 * _1495;
    float _1521 = _1479 * _1495;
    float _1523 = _1515 * _1451;
    float _1525 = _1465 * _1495;
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = 1.0 / _1513;
    float _1531 = fma(_1507, _1509, _1497);
    float _1533 = -_1451;
    float _1535 = _1507 * _1533;
    float _1537 = -_1511;
    float _1539 = fma(_1507, _1517, _1537);
    float _1541 = -_1517;
    float _1543 = fma(_1507, _1511, _1541);
    float _1545 = fma(_1531, _1453, _1523);
    float _1547 = _1519 * _1451;
    float _1549 = fma(_1521, _1453, _1535);
    float _1551 = fma(_1507, _1497, _1509);
    float _1553 = fma(_1539, _1527, _1545);
    float _1555 = fma(_1543, _1453, _1547);
    float _1557 = fma(_1525, _1527, _1549);
    float _1559 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1561 = fma(_1551, _1527, _1555);
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1567 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1559);
    float _1569 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1563);
    float _1571 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1565);
    float _1573 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1567);
    float _1575 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1569);
    float _1577 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1571);
    float _1579 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1581 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1583 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1585 = _1499 + _1579;
    float _1587 = _1489 + _1581;
    float _1589 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1593 = _1585 + _1591;
    float _1595 = _1485 + _1583;
    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1599 = _1587 + _1597;
    float _1601 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1589);
    float _1603 = _1593 * _1593;
    float _1605 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1601);
    float _1607 = fma(_1599, _1599, _1603);
    float _1609 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1611 = sqrt(_1607);
    float _1613 = _1609 + _1513;
    float _1615 = -_195;
    int _1617 = _1449 ? as_type<int>(_1615) : as_type<int>(_195);
    float _1619 = _1613 * _1529;
    float _1621 = _1619 * 0.5;
    bool _1623 = !_941;
    float _1625 = _1623 ? _195 : as_type<float>(_1617);
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1629 = _1627 != 0;
    int _1631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1633 = _1631 != 0;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1637 = _1635 != 0;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1641 = _1639 != 0;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1643);
    float _1647 = 1.0 / _1645;
    bool _1649 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1651 = !_1633;
    int _1653 = _1651 ? 0 : 1;
    bool _1655 = !_1629;
    int _1657 = _1655 ? 0 : 1;
    bool _1659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1661 = isnan(0.5);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1667 = _1663 || _1665;
    bool _1669 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1671 = isnan(0.5);
    bool _1673 = _1669 || _1671;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1677 = _1673 || _1675;
    bool _1679 = !_1637;
    int _1681 = _1679 ? 0 : 1;
    bool _1683 = !_1641;
    int _1685 = _1683 ? 0 : 1;
    float _1687 = _1529;
    float _1689 = _1445;
    float _1691 = _1587;
    float _1693 = _1607;
    float _1695 = _1561;
    float _1697 = _1489;
    if (!_1649)
    {
        _1687 = _1585;
    }
    float _1699 = _1687;
    float _1701 = _1699;
    if (!_1649)
    {
        _1689 = _1595;
    }
    float _1703 = _1689;
    bool _1705 = !_1649;
    float _1707 = _1703;
    if (!_1705)
    {
        float _1709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1713 = _1611 + _1711;
        float _1715 = rsqrt(_1607);
        float _1717 = _1713 * _1709;
        float _1719 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = _1717 * 0.15915493667125701904296875;
        float _1723 = _1721 * 6.283185482025146484375;
        float _1725 = cos(_1723);
        float _1727 = _1721 * 6.283185482025146484375;
        float _1729 = sin(_1727);
        float _1731 = _1725 + (-1.0);
        float _1733 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1735 = fma(_1729, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1737 = fma(_1595, _1725, _1733);
        float _1739 = _1715 * _1735;
        float _1741 = fma(_1599, _1739, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1743 = fma(_1593, _1739, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1707 = _1737;
        _1691 = _1741;
        _1701 = _1743;
    }
    float _1745 = _1707;
    float _1747 = _1691;
    float _1749 = _1701;
    float _1751 = _1745;
    float _1753 = _1747;
    float _1755 = _1749;
    if (_1677)
    {
        _1693 = 1.0;
    }
    float _1757 = _1693;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1761 = _1647 * _1759;
    float _1763 = _1757;
    if (!_1667)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1767 = _1485 + _1765;
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1771 = _1489 + _1769;
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1775 = -_1485;
        float _1777 = _1775 + _1745;
        float _1779 = _1767 * _1767;
        float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1783 = _1499 + _1781;
        float _1785 = -_1489;
        float _1787 = _1785 + _1747;
        float _1789 = fma(_1771, _1771, _1779);
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1793 = fma(_1783, _1783, _1789);
        float _1795 = sqrt(_1793);
        float _1797 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1799 = precise::min(_1795, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1801 = _1799 * _1791;
        float _1803 = _1797 * _1801;
        float _1805 = -_1499;
        float _1807 = _1805 + _1749;
        float _1809 = fma(_1777, _1803, _1485);
        float _1811 = fma(_1787, _1803, _1489);
        float _1813 = fma(_1807, _1803, _1499);
        _1751 = _1809;
        _1753 = _1811;
        _1755 = _1813;
    }
    float _1815 = _1751;
    float _1817 = _1753;
    float _1819 = _1755;
    if (!_1677)
    {
        float _1821 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1823 = _1821 * 0.15915493667125701904296875;
        float _1825 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1827 = _1823 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = _1825 * 0.15915493667125701904296875;
        float _1833 = _1823 * 6.283185482025146484375;
        float _1835 = sin(_1833);
        float _1837 = 1.0 / _1829;
        float _1839 = _1831 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = _1835 * _1837;
        float _1845 = _1831 * 6.283185482025146484375;
        float _1847 = sin(_1845);
        float _1849 = _1841 * _1843;
        float _1851 = 1.0 / _1849;
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1855 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1853;
        float _1857 = 1.0 / _1855;
        float _1859 = _1847 * _1851;
        float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1863 = fma(_1761, _1859, _1861);
        float _1865 = _1863 * _1857;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        _1695 = _1831;
        _1763 = _1867;
    }
    float _1869 = _1695;
    float _1871 = _1763;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1875 = _1815 + _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1879 = _1817 + _1877;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1883 = _1819 + _1881;
    float _1885 = _1875 * _1875;
    bool _1887 = _1011 != 0;
    float _1889 = fma(_1879, _1879, _1885);
    float _1891 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1893 = fma(_1883, _1883, _1889);
    float _1895 = floor(_1891);
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1899 = rsqrt(_1893);
    float _1901 = sqrt(_1893);
    float _1903 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1905 = _1879 * _1903;
    float _1907 = _1883 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 * _1907;
    float _1913 = _1909 + _1911;
    float _1915 = sqrt(_1913);
    bool _1917 = _1915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1921 = _1915 + _1919;
    float _1923 = _1899;
    float _1925 = _1913;
    float _1927 = _1921;
    float _1929 = _1869;
    float _1931 = _1875;
    if (_1917)
    {
        float _1933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1923 = _1933;
    }
    float _1935 = _1923;
    if (!_1917)
    {
        _1697 = _1909;
    }
    float _1937 = _1697;
    float _1939 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1941 = _1937;
    if (_1917)
    {
        float _1943 = rsqrt(_1913);
        _1925 = _1943;
    }
    float _1945 = _1925;
    if (_1917)
    {
        float _1947 = _1921 * _1935;
        _1927 = _1947;
    }
    float _1949 = _1927;
    if (_1917)
    {
        float _1951 = _1949 * 0.15915493667125701904296875;
        _1929 = _1951;
    }
    float _1953 = _1929;
    float _1955 = _1883;
    float _1957 = _1953;
    if (_1917)
    {
        float _1959 = _1953 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1967 = precise::max(0.0, _1965);
    float _1969 = _1935;
    float _1971 = _1967;
    if (_1917)
    {
        float _1973 = _1953 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        _1969 = _1975;
    }
    float _1977 = _1969;
    float _1979 = -_1903;
    float _1981 = -_1967;
    float _1983 = fma(_1875, _1979, _1981);
    if (_1917)
    {
        float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1985;
    }
    float _1987 = _1931;
    float _1989 = _1963;
    float _1991 = _1987;
    if (_1917)
    {
        float _1993 = fma(_1963, _1987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1989 = _1993;
    }
    float _1995 = _1989;
    float _1997 = _1995;
    if (!_1917)
    {
        _1991 = _1983;
    }
    float _1999 = _1991;
    float _2001 = _1999;
    float _2003 = _1977;
    if (_1917)
    {
        float _2005 = _1977 + (-1.0);
        _1971 = _2005;
    }
    float _2007 = _1971;
    float _2009 = _2007;
    if (_1917)
    {
        float _2011 = _1945 * _1995;
        _1369 = _2011;
    }
    float _2013 = _1369;
    if (!_1917)
    {
        _1997 = _1905;
    }
    float _2015 = _1997;
    float _2017 = _2015;
    if (_1917)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1957 = _2019;
    }
    float _2021 = _1957;
    if (_1917)
    {
        float _2023 = _1905 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1917)
    {
        _2009 = _1907;
    }
    float _2027 = _2009;
    float _2029 = _2027;
    if (_1917)
    {
        float _2031 = _1907 * _2013;
        _2029 = _2031;
    }
    float _2033 = _2029;
    if (_1917)
    {
        float _2035 = fma(_1983, _1977, _2021);
        _2001 = _2035;
    }
    float _2037 = _2001;
    if (_1917)
    {
        float _2039 = _2025 * _2025;
        _1941 = _2039;
    }
    float _2041 = _1941;
    if (!_1917)
    {
        _2003 = _1911;
    }
    float _2043 = _2003;
    float _2045 = _2043;
    if (_1917)
    {
        float _2047 = _2033 * _2033;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = fma(_2037, _2037, _2041);
    float _2053 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2055 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2057 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1939);
    float _2059 = _2051 + _2049;
    float _2061 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2063 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2065 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2053);
    float _2067 = rsqrt(_2059);
    float _2069 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2061);
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2073 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2055);
    float _2079 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2081 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2069);
    float _2083 = -_2075;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2077);
    float _2089 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2091 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2057);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2097 = abs(_2085);
    float _2099 = log2(_2097);
    float _2101 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2103 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2105 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2067 * _2025;
    float _2109 = _2067 * _2037;
    float _2111 = _2067 * _2033;
    float _2113 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2101);
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2117 = floor(_2063);
    float _2119 = -_1895;
    float _2121 = _1891 + _2119;
    float _2123 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2113);
    float _2125 = -_2115;
    float _2127 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2125);
    float _2129 = -_2105;
    float _2131 = fma(_2129, _1897, 1.0);
    float _2133 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2123);
    float _2135 = -_2111;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2127);
    float _2139 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2141 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2143 = log2(_2131);
    float _2145 = fma(_2137, -0.5, 0.5);
    float _2147 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2149 = fma(_2137, 0.5, 0.5);
    float _2151 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2141);
    float _2153 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2147);
    float _2155 = -_2117;
    float _2157 = _2063 + _2155;
    float _2159 = 1.0 / _2133;
    float _2161 = fma(_2149, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2163 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2151);
    float _2165 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2153);
    float _2167 = _2109 + 1.0;
    float _2169 = fma(_2149, _2161, -0.212114393711090087890625);
    float _2171 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2163);
    float _2173 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2165);
    float _2175 = exp2(_2139);
    float _2177 = fma(_2149, _2169, 1.570728778839111328125);
    float _2179 = _2143 * 0.693147182464599609375;
    float _2181 = sqrt(_2145);
    float _2183 = _2171 * _2159;
    float _2185 = _2173 * _2159;
    float _2187 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2189 = fma(_2185, -0.5, 0.5);
    float _2191 = -_2109;
    float _2193 = fma(_2175, _2167, _2191);
    float2 _8151 = float2(_2121, _2157);
    float _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8151, float2(0.0), isnan(_8151)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8151, float2(0.0), isnan(_8151)), level(0.0)).x;
    float _2197 = fma(_2193, 0.5, 0.5);
    float _2199 = _2181 * 0.636619746685028076171875;
    float _2201 = fma(_2183, 0.5, 0.5);
    float _2203 = -_2177;
    float _2205 = fma(_2199, _2203, 1.0);
    float3 _8174 = float3(_2201, _2189, _2187);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8174, float3(0.0), isnan(_8174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8174, float3(0.0), isnan(_8174)), level(0.0)).x;
    float3 _8185 = float3(_2201, _2189, _2187);
    float4 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8185, float3(0.0), isnan(_8185)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8185, float3(0.0), isnan(_8185)), level(0.0)).xyzw;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float _2218 = _2210.w;
    float2 _8201 = float2(_2205, _2197);
    float3 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8201, float2(0.0), isnan(_8201)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8201, float2(0.0), isnan(_8201)), level(0.0)).xyz;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2232 = int(_2230);
    float _2234 = _801 * _803;
    int _2236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2238 = _2236 != 0;
    float _2240 = -_1317;
    float _2242 = _2240 + 1.0;
    int _2244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2246 = _2244 != 0;
    float _2248 = -_1309;
    float _2250 = _2248 + 1.0;
    int _2252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2254 = _2252 != 0;
    float _2256 = -_1137;
    float _2258 = _2256 + 1.0;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2262 = int(_2260);
    int _2264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2266 = _2264 != 0;
    float _2268 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2270 = abs(_1135);
    float _2272 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2274 = abs(_1049);
    float _2276 = -_1313;
    float _2278 = _2276 + 1.0;
    bool _2280 = _1241 != 0;
    float _2282 = trunc(_1319);
    int _2284 = int(_2282);
    float _2286 = float(uint(_2232));
    float _2288 = -_1315;
    float _2290 = _2288 + 1.0;
    float _2292 = trunc(_1277);
    int _2294 = int(_2292);
    float _2296 = float(uint(_2262));
    float _2298 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2272);
    float _2300 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2302 = int(_2300);
    float _2304 = float(uint(_2284));
    float _2306 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2298);
    float _2308 = float(_2232);
    float _2310 = float(_2284);
    float _2312 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2314 = 1.0 / _2286;
    bool _2316 = _2310 >= _2308;
    bool _2318 = isnan(_2310);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan(_2308);
    bool _2324 = _2320 || _2322;
    float _2326 = float(_2324);
    float _2328 = float(_2294);
    out.gl_Position.x = _2171;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2312;
    out.gl_Position.w = _2133;
    bool _2330 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2332 = isnan(_699);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2338 = _2334 || _2336;
    float _2340 = float(_2338);
    float _2342 = 1.0 / _2296;
    float _2344 = float(uint(_2302));
    int _2346 = as_type<int>(_2314) + (-2);
    float _2348 = 1.0 / _2344;
    int _2350 = ~_2232;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2346) * _2304;
    int _2356 = as_type<int>(_2342) + (-2);
    float _2358 = trunc(_2354);
    float _2360 = precise::max(_2358, 0.0);
    uint _2363 = uint(_2360);
    float _2365 = float(uint(_2294));
    float _2367 = as_type<float>(_2356) * _2365;
    float _2369 = _805 * _789;
    float _2371 = trunc(_1299);
    int _2373 = int(_2371);
    int _2375 = ~_2262;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2367);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = _2352 * int(_2363);
    int _2387 = _2385 + _2284;
    float _2389 = float(uint(_2387));
    float _2391 = trunc(_2326);
    int _2393 = int(_2391);
    float _2395 = float(uint(_2373));
    float _2397 = as_type<float>(_2346) * _2389;
    float _2399 = floor(_2369);
    int _2401 = _2377 * int(_2383);
    int _2403 = _2401 + _2294;
    float _2405 = float(uint(_2403));
    float _2407 = trunc(_2397);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = as_type<float>(_2356) * _2405;
    int _2415 = as_type<int>(_2348) + (-2);
    int _2417 = ~_2232;
    int _2419 = _2417 + 1;
    float _2421 = floor(_2234);
    float _2423 = as_type<float>(_2415) * _2395;
    float _2425 = -_2399;
    float _2427 = _2369 + _2425;
    float _2429 = _805 * _807;
    int _2431 = ~_2302;
    int _2433 = _2431 + 1;
    float _2435 = trunc(_2413);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = int(_2363) + int(_2411);
    float _2443 = float(_2262);
    float _2445 = as_type<float>(_2411);
    float _2447 = _2429;
    float _2449 = as_type<float>(_2356);
    float _2451 = _2173;
    float _2453 = _2171;
    if (_2266)
    {
        float _2455 = in.m_58.w;
        _2445 = _2455;
    }
    float _2457 = _2445;
    int _2459 = ~_2262;
    int _2461 = _2459 + 1;
    int _2463 = _2419 * _2441;
    int _2465 = _2463 + _2284;
    bool _2467 = _2328 >= _2443;
    bool _2469 = isnan(_2328);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan(_2443);
    bool _2475 = _2471 || _2473;
    float _2477 = float(_2475);
    float _2479 = trunc(_2423);
    float _2481 = precise::max(_2479, 0.0);
    uint _2483 = uint(_2481);
    float _2485 = -_2421;
    float _2487 = _2234 + _2485;
    float _2489 = _2427 * _2308;
    float _2491 = _2308 * _831;
    bool _2493 = uint(_2465) >= uint(_2232);
    float _2495 = _2487 * _2443;
    bool _2497 = !_2254;
    int _2499 = _2497 ? 0 : 1;
    float _2501 = trunc(_2489);
    int _2503 = int(_2501);
    int _2505 = int(_2383) + int(_2439);
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2509 = _2507 != 0;
    int _2511 = abs(_2499);
    int _2513 = _2461 * _2505;
    int _2515 = _2513 + _2294;
    bool _2517 = !_2509;
    int _2519 = _2517 ? 0 : 1;
    int _2521 = _2433 * int(_2483);
    int _2523 = _2521 + _2373;
    float _2525 = trunc(_2495);
    int _2527 = int(_2525);
    bool _2529 = _2232 == 0;
    float _2531 = float(uint(_2523));
    bool _2533 = !_2493;
    int _2535 = _2533 ? 0 : (-1);
    bool _2537 = uint(_2515) >= uint(_2262);
    float _2539 = trunc(_2477);
    int _2541 = int(_2539);
    int _2543 = ~_2441;
    int _2545 = _2543 + _2535;
    int _2547 = _2545 + 1;
    float _2549 = as_type<float>(_2415) * _2531;
    bool _2551 = !_2537;
    int _2553 = _2551 ? 0 : (-1);
    int _2555 = abs(_2519);
    int _2557 = _2503 * _2511;
    int _2559 = _2557 + _2284;
    int _2561 = ~_2505;
    int _2563 = _2561 + _2553;
    int _2565 = _2563 + 1;
    float _2567 = trunc(_2549);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    int _2573 = _2232 * _2547;
    int _2575 = _2573 + _2284;
    bool _2577 = _2262 == 0;
    int _2579 = _2262 * _2565;
    int _2581 = _2579 + _2294;
    bool _2583 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2585 = isnan(_699);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2591 = _2587 || _2589;
    float _2593 = float(_2591);
    int _2595 = _2527 * _2555;
    int _2597 = _2595 + _2294;
    bool _2599 = !_2529;
    int _2601 = _2599 ? _2575 : (-1);
    float _2603 = trunc(_2491);
    int _2605 = int(_2603);
    int _2607 = ~_2541;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2577;
    int _2615 = _2613 ? _2581 : (-1);
    int _2617 = ~_2393;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = _2262 + (-1);
    int _2625 = _2615 * _2611;
    int _2627 = ~_2302;
    int _2629 = _2627 + 1;
    int _2631 = _2601 * _2621;
    int _2633 = _2232 + (-1);
    int _2635 = _2541 * _2623;
    int _2637 = _2635 + _2625;
    int _2639 = int(_2483) + int(_2571);
    float _2641 = _2443 * _831;
    int _2643 = _2393 * _2633;
    int _2645 = _2643 + _2631;
    int _2647 = abs(_1127);
    float _2649 = exp2(_2268);
    int _2651 = abs(as_type<int>(_1037));
    int _2653 = _2629 * _2639;
    int _2655 = _2653 + _2373;
    float _2657 = as_type<float>(_2655);
    if (_2266)
    {
        float _2659 = _2457 * 3.1415927410125732421875;
        _1063 = _2659;
    }
    float _2661 = _1063;
    bool _2663 = !_2238;
    int _2665 = _2663 ? 0 : 1;
    int _2667 = _2637 * _2647;
    int _2669 = abs(_1043);
    int _2671 = _2645 * _2651;
    float _2673 = trunc(_2641);
    int _2675 = int(_2673);
    bool _2677 = uint(_2655) >= uint(_2302);
    bool _2679 = _2677;
    if (_2266)
    {
        float _2681 = _2661 * 0.15915493667125701904296875;
        _2657 = _2681;
    }
    float _2683 = _2657;
    float _2685 = float(_2302);
    float _2687 = float(_2373);
    int _2689 = abs(_1657);
    float _2691 = _2683;
    if (_2266)
    {
        float _2693 = _2683 * 6.283185482025146484375;
        float _2695 = sin(_2693);
        _2691 = _2695;
    }
    float _2697 = _2691;
    bool _2699 = _2687 >= _2685;
    bool _2701 = isnan(_2687);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(_2685);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2685 * _831;
    float _2713 = -_2649;
    float _2715 = _2713 + 1.0;
    int _2717 = abs(_2665);
    int _2719 = _2605 * _2669;
    int _2721 = _2719 + _2671;
    bool _2723 = !_2677;
    int _2725 = _2723 ? 0 : (-1);
    float _2727 = trunc(_2709);
    int _2729 = int(_2727);
    int _2731 = _2675 * _2270;
    int _2733 = _2731 + _2667;
    int _2735 = abs(_1141);
    int _2737 = _2559 * _2274;
    int _2739 = _2737 + _2721;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2743 = _2741 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2745 = ~_2639;
    int _2747 = _2745 + _2725;
    int _2749 = _2747 + 1;
    float _2751 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2753 = _2503 * _2717;
    int _2755 = _2753 + _2739;
    bool _2757 = !_2246;
    int _2759 = _2757 ? 0 : 1;
    float _2761 = floor(_2429);
    if (_2266)
    {
        bool _2763 = _2697 > 0.5;
        _2679 = _2763;
    }
    bool _2765 = _2679;
    int _2767 = _2597 * _2735;
    int _2769 = _2767 + _2733;
    int _2771 = abs(_2759);
    int _2773 = _2302 * _2749;
    int _2775 = _2773 + _2373;
    float _2777 = float(uint(_2755));
    float _2779 = trunc(_2711);
    int _2781 = int(_2779);
    bool _2783 = _2302 == 0;
    float _2785 = as_type<float>(_2346) * _2777;
    float _2787 = float(uint(_2559));
    int _2789 = _2527 * _2771;
    int _2791 = _2789 + _2769;
    int _2793 = ~_2729;
    int _2795 = _2793 + 1;
    int _2797 = _2795 + 1;
    bool _2799 = !_2783;
    int _2801 = _2799 ? _2775 : (-1);
    float _2803 = trunc(_2785);
    float _2805 = precise::max(_2803, 0.0);
    uint _2807 = uint(_2805);
    float _2809 = float(uint(_2791));
    float _2811 = -_2761;
    float _2813 = _2429 + _2811;
    if (!_2266)
    {
        _2447 = _191;
    }
    float _2815 = _2447;
    float _2817 = as_type<float>(_2346) * _2787;
    float _2819 = _2815;
    if (_2266)
    {
        float _2821 = -_191;
        float _2823 = _2765 ? _2821 : _191;
        _2819 = _2823;
    }
    float _2825 = _2819;
    float _2827 = as_type<float>(_2356) * _2809;
    int _2829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2831 = _2829 != 0;
    int _2833 = _2801 * _2797;
    int _2835 = ~_2232;
    int _2837 = _2835 + 1;
    float _2839 = trunc(_2817);
    float _2841 = precise::max(_2839, 0.0);
    uint _2843 = uint(_2841);
    int _2845 = _2302 + (-1);
    float _2847 = _2813 * _2685;
    int _2849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2851 = _2849 != 0;
    int _2853 = ~_2262;
    int _2855 = _2853 + 1;
    int _2857 = _2837 * int(_2807);
    int _2859 = _2857 + _2755;
    int _2861 = abs(_1653);
    float _2863 = trunc(_2827);
    float _2865 = precise::max(_2863, 0.0);
    uint _2867 = uint(_2865);
    int _2869 = _2729 * _2845;
    int _2871 = _2869 + _2833;
    bool _2873 = !_2851;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = as_type<float>(_2639);
    if (_2831)
    {
        float _2879 = in.m_58.x;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = float(uint(_2859));
    int _2885 = ~_2232;
    int _2887 = _2885 + 1;
    float _2889 = trunc(_2847);
    int _2891 = int(_2889);
    int _2893 = abs(_2875);
    float _2895 = as_type<float>(_2346) * _2883;
    int _2897 = _2887 * int(_2843);
    int _2899 = _2897 + _2559;
    int _2901 = _2855 * int(_2867);
    int _2903 = _2901 + _2791;
    float _2905 = trunc(_2895);
    float _2907 = precise::max(_2905, 0.0);
    uint _2909 = uint(_2907);
    float _2911 = float(uint(_2903));
    int _2913 = _2871 * _2861;
    float _2915 = float(uint(_2899));
    int _2917 = _2891 * _2893;
    int _2919 = _2917 + _2373;
    int _2921 = abs(_1681);
    float _2923 = as_type<float>(_2356) * _2911;
    int _2925 = _2781 * _2689;
    int _2927 = _2925 + _2913;
    float _2929 = float(uint(_2597));
    float _2931 = as_type<float>(_2346) * _2915;
    float _2933 = trunc(_2923);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    int _2939 = ~_2232;
    int _2941 = _2939 + 1;
    int _2943 = _2919 * _2921;
    int _2945 = _2943 + _2927;
    int _2947 = abs(_1685);
    float _2949 = as_type<float>(_2356) * _2929;
    float _2951 = _2929;
    if (_2831)
    {
        float _2953 = _2881 * 3.1415927410125732421875;
        _2951 = _2953;
    }
    float _2955 = _2951;
    float _2957 = 1.0 / _2743;
    int _2959 = int(_2807) + int(_2909);
    float _2961 = _2955;
    if (_2831)
    {
        float _2963 = _2955 * 0.15915493667125701904296875;
        _2961 = _2963;
    }
    float _2965 = _2961;
    int _2967 = ~_2262;
    int _2969 = _2967 + 1;
    int _2971 = _2891 * _2947;
    int _2973 = _2971 + _2945;
    int _2975 = _2941 * _2959;
    int _2977 = _2975 + _2755;
    float _2979 = trunc(_2949);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = float(uint(_2919));
    float _2987 = -_2195;
    float _2989 = _2987 + 1.0;
    int _2991 = int(_2867) + int(_2937);
    float _2993 = -_191;
    int _2995 = _1887 ? as_type<int>(_2993) : as_type<int>(_191);
    float _2997 = as_type<float>(_2415) * _2985;
    bool _2999 = uint(_2977) >= uint(_2232);
    float _3001 = _2965;
    if (_2831)
    {
        float _3003 = _2965 * 6.283185482025146484375;
        float _3005 = sin(_3003);
        _3001 = _3005;
    }
    float _3007 = _3001;
    int _3009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3011 = _3009 != 0;
    int _3013 = _2969 * _2991;
    int _3015 = _3013 + _2791;
    float _3017 = float(uint(_2973));
    int _3019 = ~_2262;
    int _3021 = _3019 + 1;
    bool _3023 = !_3011;
    float _3025 = _3023 ? _191 : as_type<float>(_2995);
    float _3027 = trunc(_2931);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    bool _3033 = uint(_3015) >= uint(_2262);
    float _3035 = as_type<float>(_2415) * _3017;
    int _3037 = _3021 * int(_2983);
    int _3039 = _3037 + _2597;
    bool _3041 = !_2999;
    int _3043 = _3041 ? 0 : (-1);
    int _3045 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3047 = _3045 != 0;
    float _3049 = trunc(_2997);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    float _3055 = float(uint(_3039));
    bool _3057 = !_3033;
    int _3059 = _3057 ? 0 : (-1);
    int _3061 = ~_2959;
    int _3063 = _3061 + _3043;
    int _3065 = _3063 + 1;
    float _3067 = as_type<float>(_2356) * _3055;
    bool _3069 = _3033;
    if (_2831)
    {
        bool _3071 = _3007 > 0.5;
        _3069 = _3071;
    }
    bool _3073 = _3069;
    float _3075 = trunc(_3035);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = ~_2302;
    int _3083 = _3081 + 1;
    int _3085 = _2232 * _3065;
    int _3087 = _3085 + _2755;
    int _3089 = ~_2991;
    int _3091 = _3089 + _3059;
    int _3093 = _3091 + 1;
    int _3095 = int(_2843) + int(_3031);
    int _3097 = ~_2302;
    int _3099 = _3097 + 1;
    int _3101 = _3083 * int(_3053);
    int _3103 = _3101 + _2919;
    if (!_2831)
    {
        _2449 = _195;
    }
    float _3105 = _2449;
    int _3107 = _2262 * _3093;
    int _3109 = _3107 + _2791;
    bool _3111 = !_2529;
    int _3113 = _3111 ? _3087 : (-1);
    float _3115 = trunc(_3067);
    float _3117 = precise::max(_3115, 0.0);
    uint _3119 = uint(_3117);
    float _3121 = float(uint(_3103));
    float _3123 = _3105;
    if (_2831)
    {
        float _3125 = -_195;
        float _3127 = _3073 ? _3125 : _195;
        _3123 = _3127;
    }
    float _3129 = _3123;
    int _3131 = _3099 * int(_3079);
    int _3133 = _3131 + _2973;
    int _3135 = _3113 & 3;
    bool _3137 = _3135 != 0;
    float _3139 = as_type<float>(_2415) * _3121;
    int _3141 = ~_2232;
    int _3143 = _3141 + 1;
    float _3145 = -_195;
    int _3147 = _2280 ? as_type<int>(_3145) : as_type<int>(_195);
    float _3149 = trunc(_3139);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    float _3155 = float(uint(_3133));
    int _3157 = _3143 * _3095;
    int _3159 = _3157 + _2559;
    bool _3161 = uint(_3135) > 1u;
    int _3163 = _3113 & 3;
    bool _3165 = _3163 != 0;
    float _3167 = as_type<float>(_2415) * _3155;
    bool _3169 = !_2577;
    int _3171 = _3169 ? _3109 : (-1);
    int _3173 = _3165 ? 0 : 1;
    int _3175 = _3171 & 3;
    bool _3177 = _3175 != 0;
    float _3179 = trunc(_3167);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    bool _3185 = !_3047;
    float _3187 = _3185 ? _195 : as_type<float>(_3147);
    bool _3189 = uint(_3159) >= uint(_2232);
    int _3191 = ~_3173;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3195;
    if (!_3161)
    {
        int _3199 = ~_3173;
        int _3201 = _3199 + 1;
        _3197 = _3201;
    }
    int _3203 = _3197;
    bool _3205 = uint(_3175) > 1u;
    bool _3207 = !_3189;
    int _3209 = _3207 ? 0 : (-1);
    int _3211 = _3171 & 3;
    bool _3213 = _3211 != 0;
    int _3215 = ~_2262;
    int _3217 = _3215 + 1;
    int _3219 = _3213 ? 0 : 1;
    int _3221 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3223 = _3221 != 0;
    int _3225 = int(_2983) + int(_3119);
    int _3227 = ~_3219;
    int _3229 = _3227 + 1;
    int _3231 = _3229 + 1;
    int _3233 = _3231;
    if (!_3205)
    {
        int _3235 = ~_3219;
        int _3237 = _3235 + 1;
        _3233 = _3237;
    }
    int _3239 = _3233;
    int _3241 = _3217 * _3225;
    int _3243 = _3241 + _2597;
    bool _3245 = !_3177;
    int _3247 = _3245 ? 0 : 1;
    bool _3249 = _3175 != 3;
    int _3251 = int(_3079) + int(_3183);
    int _3253 = int(_3053) + int(_3153);
    int _3255 = ~_2302;
    int _3257 = _3255 + 1;
    bool _3259 = uint(_3175) >= 2u;
    int _3261 = _3257 * _3251;
    int _3263 = _3261 + _2973;
    int _3265 = ~_2302;
    int _3267 = _3265 + 1;
    int _3269 = _3259 ? 0 : 1;
    float _3271 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3275 = uint(_3243) >= uint(_2262);
    int _3277 = _3267 * _3253;
    int _3279 = _3277 + _2919;
    float _3281 = 1.0 / _3273;
    int _3283 = ~_3269;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    int _3289 = _3287;
    if (_3249)
    {
        int _3291 = ~_3269;
        int _3293 = _3291 + 1;
        _3289 = _3293;
    }
    int _3295 = _3289;
    float _3297 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3299 = _3297 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3301 = uint(_3263) >= uint(_2302);
    bool _3303 = !_3275;
    int _3305 = _3303 ? 0 : (-1);
    float _3307 = 1.0 / _3299;
    bool _3309 = uint(_3279) >= uint(_2302);
    bool _3311 = !_3301;
    int _3313 = _3311 ? 0 : (-1);
    bool _3315 = _789 > 0.5;
    bool _3317 = !_3309;
    int _3319 = _3317 ? 0 : (-1);
    bool _3321 = _3175 != 3;
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3325 = _3323 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3327 = -_191;
    int _3329 = _3315 ? as_type<int>(_3327) : as_type<int>(_191);
    float _3331 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3333 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3331;
    bool _3335 = !_3321;
    int _3337 = _3335 ? 0 : (-1);
    float _3339 = 1.0 / _3325;
    bool _3341 = !_3223;
    float _3343 = _3341 ? _191 : as_type<float>(_3329);
    float _3345 = _3333 * _3281;
    int _3347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3349 = _3347 != 0;
    float _3351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3353 = _3351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3357 = _3355 != 0;
    int _3359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3361 = _3359 != 0;
    float _3363 = _3353 * _3307;
    bool _3365 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3367 = isnan(_699);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3373 = _3369 || _3371;
    float _3375 = float(_3373);
    float _3377 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3377;
    bool _3381 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3383 = isnan(_699);
    bool _3385 = _3381 || _3383;
    bool _3387 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3389 = _3385 || _3387;
    float _3391 = float(_3389);
    float _3393 = -_3375;
    float _3395 = _3393 + 1.0;
    bool _3397 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3399 = isnan(_699);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3405 = _3401 || _3403;
    float _3407 = float(_3405);
    float _3409 = -_3391;
    float _3411 = _3409 + 1.0;
    float _3413 = _3379 * _3339;
    float _3415 = _3391 * _3395;
    float _3417 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3419 = _3417 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3421 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3423 = isnan(_699);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3429 = _3425 || _3427;
    float _3431 = float(_3429);
    float _3433 = _3407 * _3411;
    float _3435 = -_3407;
    float _3437 = _3435 + 1.0;
    float _3439 = -_2593;
    float _3441 = _3439 + 1.0;
    float _3443 = 1.0 / _3419;
    float _3445 = -_3431;
    float _3447 = _3445 + 1.0;
    float _3449 = _3431 * _3437;
    float _3451 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3453 = _3451 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3455 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3457 = isnan(_699);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = _2340 * _3441;
    float _3469 = -_2340;
    float _3471 = _3469 + 1.0;
    bool _3473 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3475 = isnan(_699);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3481 = _3477 || _3479;
    float _3483 = float(_3481);
    float _3485 = 1.0 / _3453;
    float _3487 = _2593 * _3447;
    float _3489 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3491 = _699 + _3489;
    float _3493 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3495 = _3493 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3497 = _3465 * _3471;
    float _3499 = -_3465;
    float _3501 = _3499 + 1.0;
    float _3503 = fma(_3345, _3491, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3505 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3507 = _3505 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3509 = 1.0 / _3495;
    float _3511 = _3483 * _3501;
    float _3513 = _3507 * _3443;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3517 = _699 + _3515;
    float _3519 = _3503 * _3511;
    float _3521 = -_3483;
    float _3523 = _3521 + 1.0;
    float _3525 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3527 = _3525 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3529 = fma(_3363, _3517, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3533 = _699 + _3531;
    float _3535 = fma(_3523, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3519);
    float _3537 = _3527 * _3485;
    float _3539 = abs(_1761);
    float _3541 = log2(_3539);
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3545 = _699 + _3543;
    float _3547 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3549 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3547;
    float _3551 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3551;
    float _3555 = fma(_3529, _3497, _3535);
    float _3557 = fma(_3413, _3545, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3559 = fma(_3513, _3533, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3561 = _3549 * _3509;
    float _3563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3565 = _3553 * _2957;
    float _3567 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3569 = _699 + _3567;
    float _3571 = fma(_3557, _3467, _3555);
    float _3573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3575 = _699 + _3573;
    float _3577 = _2825 + 0.5;
    float _3579 = fma(_3565, _3569, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3581 = fma(_3559, _3487, _3571);
    float _3583 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3585 = _3129 + (-0.5);
    float _3587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3589 = _699 + _3587;
    float _3591 = fma(_3537, _3575, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3593 = fma(_3579, _3449, _3581);
    float _3595 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1055);
    float _3597 = -_3585;
    float _3599 = -_1323;
    float _3601 = fma(_3597, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3599);
    float _3603 = -_1033;
    float _3605 = _3603 + 1.0;
    float _3607 = _3343 + 0.5;
    float _3609 = exp2(_3583);
    float _3611 = -_869;
    float _3613 = _3611 + 1.0;
    float _3615 = _3187 + (-0.5);
    float _3617 = fma(_3591, _3433, _3593);
    float _3619 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[80].x, _923);
    float _3621 = -_3605;
    float _3623 = fma(_3621, _2825, _3595);
    float _3625 = fma(_3613, _3129, _3601);
    float _3627 = -_3615;
    float _3629 = -_1067;
    float _3631 = fma(_3627, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3629);
    float _3633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3635 = _3563 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3637 = _3025 + 0.5;
    int _3639 = _3171 >> 31;
    out.m_74.x = _3623;
    out.m_74.y = _3625;
    int _3641 = ~_3251;
    int _3643 = _3641 + _3313;
    int _3645 = _3643 + 1;
    float _3647 = fma(_3635, _3637, _1145);
    int _3649 = _3639 & 3;
    float _3651 = _1625 + (-0.5);
    float _3653 = -_2242;
    float _3655 = fma(_3025, _3653, _3647);
    int _3657 = _3171 + _3649;
    float _3659 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3661 = int(_3659);
    float _3663 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3665 = precise::clamp(_3663, 0.0, 1.0);
    int _3667 = _3657 >> 2;
    float _3669 = _3633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3671 = -_1321;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3665, -2.0, 3.0);
    float _3677 = _3665 * _3665;
    float _3679 = -_3669;
    float _3681 = -_1213;
    float _3683 = fma(_3679, _3651, _3681);
    int _3685 = _3667 << 4;
    int _3687 = _3685 + 656;
    float _3689 = -_2250;
    float _3691 = fma(_3343, _3689, _3619);
    float _3693 = _3677 * _3675;
    float _3695 = fma(_3187, _3673, _3631);
    uint _3697 = uint(int(uint(_3687) >> uint(2)));
    uint _3699 = uint(int(uint(int(_3697)) >> uint(2)));
    int _3701 = int(_3697) & 3;
    float _3703 = (*spvDescriptorSet0.vp_c9)._m0[int(_3699)][_3701];
    int _3705 = int(_3697) + 1;
    uint _3707 = uint(int(uint(_3705) >> uint(2)));
    int _3709 = _3705 & 3;
    float _3711 = (*spvDescriptorSet0.vp_c9)._m0[int(_3707)][_3709];
    float _3713 = fma(_1625, _2258, _3683);
    float _3715 = -_3693;
    float _3717 = _3715 + 1.0;
    float _3719 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3721 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3723 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3725 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3693);
    out.m_76.x = _3691;
    out.m_76.y = _3695;
    out.m_76.z = _3655;
    out.m_76.w = _3713;
    int _3727 = _3687 + 8;
    uint _3729 = uint(int(uint(_3727) >> uint(2)));
    uint _3731 = uint(int(uint(int(_3729)) >> uint(2)));
    int _3733 = int(_3729) & 3;
    float _3735 = (*spvDescriptorSet0.vp_c9)._m0[int(_3731)][_3733];
    int _3737 = int(_3729) + 1;
    uint _3739 = uint(int(uint(_3737) >> uint(2)));
    int _3741 = _3737 & 3;
    float _3743 = (*spvDescriptorSet0.vp_c9)._m0[int(_3739)][_3741];
    float _3745 = -_1507;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3719);
    float _3749 = -_1507;
    float _3751 = fma(_3749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3721);
    float _3753 = -_1507;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3723);
    int _3757 = ~_3253;
    int _3759 = _3757 + _3319;
    int _3761 = _3759 + 1;
    float _3763 = fma(_3561, _3589, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3765 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3751);
    int _3767 = ~_3225;
    int _3769 = _3767 + _3305;
    int _3771 = _3769 + 1;
    int _3773 = _2302 * _3645;
    int _3775 = _3773 + _2973;
    float _3777 = fma(_3763, _3415, _3617);
    int _3779 = _2302 * _3761;
    int _3781 = _3779 + _2919;
    float _3783 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3785 = _2262 * _3771;
    int _3787 = _3785 + _2597;
    float _3789 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3791 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3793 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3795 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3797 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3789);
    int _3799 = abs(_3239);
    float _3801 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3791);
    float _3803 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3793);
    bool _3805 = !_3357;
    int _3807 = _3805 ? 0 : 1;
    float _3809 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3811 = ~_3799;
    int _3813 = _3811 + 1;
    int _3815 = _3813 + 1;
    float _3817 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3801);
    int _3819 = abs(_3247);
    float _3821 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3823 = uint(_3135) >= 2u;
    float _3825 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3795);
    int _3827 = ~_3819;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    float _3833 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3809);
    int _3835 = abs(_3807);
    float _3837 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3821);
    int _3839 = abs(_3337);
    float _3841 = fma(_3375, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3777);
    int _3843 = _3823 ? 0 : 1;
    float _3845 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3833);
    bool _3847 = _3135 != 3;
    float _3849 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3837);
    int _3851 = ~_3839;
    int _3853 = _3851 + 1;
    int _3855 = _3853 + 1;
    int _3857 = _3815 * as_type<int>(_3711);
    int _3859 = abs(_3295);
    float _3861 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3747);
    bool _3863 = !_2783;
    int _3865 = _3863 ? _3775 : (-1);
    int _3867 = _3831 * as_type<int>(_3703);
    int _3869 = _3867 + _3857;
    int _3871 = ~_3859;
    int _3873 = _3871 + 1;
    int _3875 = _3873 + 1;
    float _3877 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3755);
    int _3879 = _3113 >> 31;
    out.m_78.x = _3841;
    int _3881 = ~_3843;
    int _3883 = _3881 + 1;
    int _3885 = _3883 + 1;
    int _3887 = _3875 * as_type<int>(_3735);
    int _3889 = _3887 + _3869;
    int _3891 = _3879 & 3;
    int _3893 = ~_3835;
    int _3895 = _3893 + 1;
    int _3897 = _3895 + 1;
    int _3899 = _3855 * as_type<int>(_3743);
    int _3901 = _3899 + _3889;
    int _3903 = _3113 + _3891;
    float _3905 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3797);
    int _3907 = abs(_3661);
    int _3909 = _3901 * _3897;
    float _3911 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3803);
    float _3913 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3825);
    float _3915 = float(uint(_3661));
    float _3917 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3919 = _3903 >> 2;
    float _3921 = _3917 * _3861;
    int _3923 = _3885;
    if (_3847)
    {
        int _3925 = ~_3843;
        int _3927 = _3925 + 1;
        _3923 = _3927;
    }
    int _3929 = _3923;
    float _3931 = 1.0 / _3915;
    int _3933 = _3865 >> 31;
    float _3935 = fma(_3783, _3911, _3921);
    bool _3937 = !_2577;
    int _3939 = _3937 ? _3787 : (-1);
    out.m_80.x = _3911;
    out.m_80.y = _3905;
    out.m_80.z = _3913;
    int _3941 = _3865 & 3;
    bool _3943 = _3941 != 0;
    float _3945 = _3817 + _3935;
    float _3947 = float(uint(_3907));
    int _3949 = _3939 * _3835;
    int _3951 = _3949 + _3909;
    int _3953 = _3919 << 4;
    int _3955 = _3953 + 368;
    float _3957 = _3917 * _3765;
    int _3959 = _3865 & 3;
    bool _3961 = _3959 != 0;
    int _3963 = _3933 & 3;
    uint _3965 = uint(int(uint(_3955) >> uint(2)));
    uint _3967 = uint(int(uint(int(_3965)) >> uint(2)));
    int _3969 = int(_3965) & 3;
    float _3971 = (*spvDescriptorSet0.vp_c9)._m0[int(_3967)][_3969];
    int _3973 = int(_3965) + 1;
    uint _3975 = uint(int(uint(_3973) >> uint(2)));
    int _3977 = _3973 & 3;
    float _3979 = (*spvDescriptorSet0.vp_c9)._m0[int(_3975)][_3977];
    int _3981 = _3943 ? 0 : 1;
    float _3983 = 1.0 / _3947;
    bool _3985 = uint(_3959) > 1u;
    float _3987 = fma(_3783, _3905, _3957);
    int _3989 = _3865 + _3963;
    int _3991 = abs(_3951);
    int _3993 = _3989 >> 2;
    int _3995 = ~_3981;
    int _3997 = _3995 + 1;
    int _3999 = _3997 + 1;
    int _4001 = _3993 << 4;
    int _4003 = _4001 + 800;
    bool _4005 = _1761 <= 8000.0;
    bool _4007 = isnan(_1761);
    bool _4009 = _4005 || _4007;
    bool _4011 = isnan(8000.0);
    bool _4013 = _4009 || _4011;
    float _4015 = float(_4013);
    int _4017 = _3999;
    if (!_3985)
    {
        int _4019 = ~_3981;
        int _4021 = _4019 + 1;
        _4017 = _4021;
    }
    int _4023 = _4017;
    uint _4025 = uint(int(uint(_4003) >> uint(2)));
    uint _4027 = uint(int(uint(int(_4025)) >> uint(2)));
    int _4029 = int(_4025) & 3;
    float _4031 = (*spvDescriptorSet0.vp_c9)._m0[int(_4027)][_4029];
    int _4033 = int(_4025) + 1;
    uint _4035 = uint(int(uint(_4033) >> uint(2)));
    int _4037 = _4033 & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = as_type<int>(_3931) + (-2);
    float _4043 = _4015 * _3725;
    float _4045 = float(uint(_3951));
    int _4047 = ~_3095;
    int _4049 = _4047 + _3209;
    int _4051 = _4049 + 1;
    float _4053 = as_type<float>(_4041) * _4045;
    int _4055 = as_type<int>(_3983) + (-2);
    int _4057 = _3955 + 8;
    uint _4059 = uint(int(uint(_4057) >> uint(2)));
    uint _4061 = uint(int(uint(int(_4059)) >> uint(2)));
    int _4063 = int(_4059) & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = int(_4059) + 1;
    uint _4069 = uint(int(uint(_4067) >> uint(2)));
    int _4071 = _4067 & 3;
    float _4073 = (*spvDescriptorSet0.vp_c9)._m0[int(_4069)][_4071];
    float _4075 = float(uint(_3991));
    int _4077 = _2232 * _4051;
    int _4079 = _4077 + _2559;
    float _4081 = _3917 * _3877;
    float _4083 = trunc(_4053);
    float _4085 = precise::max(_4083, 0.0);
    uint _4087 = uint(_4085);
    bool _4089 = !_3137;
    int _4091 = _4089 ? 0 : 1;
    float _4093 = as_type<float>(_4055) * _4075;
    bool _4095 = uint(_3959) >= 2u;
    int _4097 = _4003 + 8;
    uint _4099 = uint(int(uint(_4097) >> uint(2)));
    uint _4101 = uint(int(uint(int(_4099)) >> uint(2)));
    int _4103 = int(_4099) & 3;
    float _4105 = (*spvDescriptorSet0.vp_c9)._m0[int(_4101)][_4103];
    int _4107 = int(_4099) + 1;
    uint _4109 = uint(int(uint(_4107) >> uint(2)));
    int _4111 = _4107 & 3;
    float _4113 = (*spvDescriptorSet0.vp_c9)._m0[int(_4109)][_4111];
    bool _4115 = _3959 != 3;
    float _4117 = fma(_3783, _3913, _4081);
    int _4119 = ~_3661;
    int _4121 = _4119 + 1;
    float _4123 = trunc(_4093);
    float _4125 = precise::max(_4123, 0.0);
    uint _4127 = uint(_4125);
    int _4129 = _4095 ? 0 : 1;
    bool _4131 = _3135 != 3;
    int _4133 = ~_3907;
    int _4135 = _4133 + 1;
    int _4137 = abs(_3203);
    int _4139 = _4121 * int(_4087);
    int _4141 = _4139 + _3951;
    float _4143 = fma(_3917, _3917, 1.0);
    int _4145 = ~_4137;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    int _4151 = ~_4129;
    int _4153 = _4151 + 1;
    int _4155 = _4153 + 1;
    int _4157 = _4155;
    if (_4115)
    {
        int _4159 = ~_4129;
        int _4161 = _4159 + 1;
        _4157 = _4161;
    }
    int _4163 = _4157;
    int _4165 = _4135 * int(_4127);
    int _4167 = _4165 + _3991;
    float _4169 = float(uint(_4141));
    int _4171 = _4149 * as_type<int>(_3979);
    bool _4173 = !_3961;
    int _4175 = _4173 ? 0 : 1;
    float _4177 = rsqrt(_4143);
    int _4179 = abs(_4091);
    float _4181 = as_type<float>(_4041) * _4169;
    float _4183 = float(uint(_4167));
    int _4185 = abs(_4175);
    int _4187 = abs(_4023);
    float _4189 = trunc(_4181);
    float _4191 = precise::max(_4189, 0.0);
    uint _4193 = uint(_4191);
    float _4195 = as_type<float>(_4055) * _4183;
    int _4197 = abs(_3929);
    int _4199 = abs(_4163);
    float _4201 = _3917 * _4177;
    int _4203 = ~_4187;
    int _4205 = _4203 + 1;
    int _4207 = _4205 + 1;
    float _4209 = trunc(_4195);
    float _4211 = precise::max(_4209, 0.0);
    uint _4213 = uint(_4211);
    int _4215 = ~_4179;
    int _4217 = _4215 + 1;
    int _4219 = _4217 + 1;
    int _4221 = ~_4185;
    int _4223 = _4221 + 1;
    int _4225 = _4223 + 1;
    int _4227 = _4207 * as_type<int>(_4039);
    int _4229 = _4219 * as_type<int>(_3971);
    int _4231 = _4229 + _4171;
    int _4233 = _4225 * as_type<int>(_4031);
    int _4235 = _4233 + _4227;
    int _4237 = ~_4197;
    int _4239 = _4237 + 1;
    int _4241 = _4239 + 1;
    int _4243 = ~_4199;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    bool _4249 = _3959 != 3;
    int _4251 = _4241 * as_type<int>(_4065);
    int _4253 = _4251 + _4231;
    float _4255 = -_3817;
    float _4257 = _4201 * _4255;
    int _4259 = _4247 * as_type<int>(_4105);
    int _4261 = _4259 + _4235;
    float _4263 = -_3845;
    float _4265 = _4201 * _4263;
    bool _4267 = !_4131;
    int _4269 = _4267 ? 0 : (-1);
    float _4271 = fma(_4177, _3861, _4257);
    int _4273 = int(_4087) + int(_4193);
    float _4275 = fma(_4177, _3765, _4265);
    bool _4277 = !_4249;
    int _4279 = _4277 ? 0 : (-1);
    float _4281 = -_3849;
    float _4283 = _4201 * _4281;
    int _4285 = abs(_4269);
    int _4287 = ~_3661;
    int _4289 = _4287 + 1;
    int _4291 = abs(_4279);
    int _4293 = ~_3907;
    int _4295 = _4293 + 1;
    int _4297 = _4289 * _4273;
    int _4299 = _4297 + _3951;
    float _4301 = fma(_4177, _3877, _4283);
    int _4303 = int(_4127) + int(_4213);
    float _4305 = _3845 + _3987;
    float _4307 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _4309 = ~_4285;
    int _4311 = _4309 + 1;
    int _4313 = _4311 + 1;
    out.m_82.x = _4271;
    out.m_82.y = _4275;
    out.m_82.z = _4301;
    bool _4315 = uint(_4299) >= uint(_3661);
    int _4317 = _4295 * _4303;
    int _4319 = _4317 + _3991;
    int _4321 = ~_4291;
    int _4323 = _4321 + 1;
    int _4325 = _4323 + 1;
    int _4327 = _4313 * as_type<int>(_4073);
    int _4329 = _4327 + _4253;
    bool _4331 = !_3349;
    int _4333 = _4331 ? 0 : 1;
    float _4335 = _2989 * _4307;
    float _4337 = precise::clamp(_4335, 0.0, 1.0);
    bool _4339 = !_4315;
    int _4341 = _4339 ? 0 : (-1);
    int _4343 = _4325 * as_type<int>(_4113);
    int _4345 = _4343 + _4261;
    bool _4347 = uint(_4319) >= uint(_3907);
    int _4349 = _3951 ^ _3661;
    int _4351 = abs(_4333);
    float _4353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4355 = ~_4273;
    int _4357 = _4355 + _4341;
    int _4359 = _4357 + 1;
    bool _4361 = !_4347;
    int _4363 = _4361 ? 0 : (-1);
    uint _4365 = uint(int(uint(_4349) >> uint(31)));
    int _4367 = _3661 * _4359;
    int _4369 = _4367 + _3951;
    int _4371 = ~_4351;
    int _4373 = _4371 + 1;
    int _4375 = _4373 + 1;
    int _4377 = ~_4363;
    int _4379 = _4303 + _4377;
    int _4381 = _4379 + 1;
    int _4383 = ~int(_4365);
    int _4385 = _4383 + 1;
    int _4387 = _4329 * _4375;
    bool _4389 = _3661 == 0;
    float _4391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4393 = !_3361;
    int _4395 = _4393 ? 0 : 1;
    int _4397 = _4381 ^ _4385;
    bool _4399 = !_4389;
    int _4401 = _4399 ? _4369 : (-1);
    float _4403 = _3849 + _4117;
    int _4405 = abs(_4395);
    int _4407 = ~_4385;
    int _4409 = _4407 + _4397;
    int _4411 = _4409 + 1;
    float _4413 = float(_4401);
    float _4415 = _4353 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4417 = ~_4405;
    int _4419 = _4417 + 1;
    int _4421 = _4419 + 1;
    out.m_84.x = _3945;
    out.m_84.y = _4305;
    out.m_84.z = _4403;
    bool _4423 = _3661 == 0;
    float _4425 = fma(_4415, _4413, _1327);
    float _4427 = _981 + 0.5;
    int _4429 = _4345 * _4421;
    bool _4431 = !_4423;
    int _4433 = _4431 ? _4411 : (-1);
    float _4435 = fma(_4415, _4427, _4425);
    bool _4437 = !_2783;
    int _4439 = _4437 ? _3781 : (-1);
    float _4441 = in.m_86.x;
    float _4443 = float(_4433);
    float _4445 = _4391 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4447 = _965 + (-0.5);
    int _4449 = _4439 * _4405;
    int _4451 = _4449 + _4429;
    bool _4453 = !_2529;
    int _4455 = _4453 ? _4079 : (-1);
    float _4457 = -_1329;
    float _4459 = fma(_4445, _4443, _4457);
    float _4461 = -_2278;
    float _4463 = fma(_981, _4461, _4435);
    float _4465 = _2133 * 0.5;
    float _4467 = float(_4451);
    float _4469 = -_4445;
    float _4471 = fma(_4469, _4447, _4459);
    int _4473 = _4455 * _4351;
    int _4475 = _4473 + _4387;
    float _4477 = _2312 + _2133;
    float _4479 = fma(_2173, -0.5, _4465);
    float _4481 = fma(_965, _2290, _4471);
    out.m_88.w = _4467;
    float _4483 = float(_4475);
    float _4485 = _2171 + _2133;
    float _4487 = -_4337;
    float _4489 = fma(_4487, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4491 = _4477 * 0.5;
    float _4493 = _4485 * 0.5;
    out.m_90.x = _4463;
    out.m_90.y = _4481;
    float _4495 = _2751 * _2207;
    float _4497 = _4489 * _4441;
    float _4499 = -_2751;
    float _4501 = _4499 + 1.0;
    out.m_92.x = _4493;
    out.m_92.y = _4479;
    out.m_92.z = _4491;
    out.m_92.w = _2133;
    float _4503 = _2218 * _4495;
    float _4505 = _2228 * _4495;
    float _4507 = _4497 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4509 = _2218 * _4501;
    float _4511 = fma(_2224, _4503, _2212);
    float _4513 = fma(_2226, _4503, _2214);
    float _4515 = fma(_2218, _4505, _2216);
    out.m_94.x = _4507;
    bool _4517 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4519 = isnan(_1901);
    bool _4521 = _4517 || _4519;
    bool _4523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4525 = _4521 || _4523;
    float _4527 = _1871 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4511;
    out.m_96.y = _4513;
    out.m_96.z = _4515;
    out.m_96.w = _4509;
    out.m_88.x = _4483;
    float _4529 = _4497;
    float _4531 = _4495;
    float _4533 = _4483;
    float _4535 = _4503;
    if (!_4525)
    {
        _2451 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4537 = _2451;
    float _4539 = _4537;
    float _4541 = _4537;
    if (!_4525)
    {
        _2453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4543 = _2453;
    float _4545 = _4543;
    float _4547 = _4543;
    if (!_4525)
    {
        _4529 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4549 = _4529;
    float _4551 = _4549;
    float _4553 = _4549;
    if (!_4525)
    {
        _4531 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4555 = _4531;
    float _4557 = _4555;
    float _4559 = _4555;
    if (!_4525)
    {
        _4533 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4561 = _4533;
    float _4563 = _4561;
    float _4565 = _4561;
    if (!_4525)
    {
        _4535 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4567 = _4535;
    bool _4569 = !_4525;
    float _4571 = _4567;
    float _4573 = _4567;
    if (!_4569)
    {
        bool _4575 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4577 = isnan(_1901);
        bool _4579 = _4575 || _4577;
        bool _4581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4583 = _4579 || _4581;
        if (!_4583)
        {
            float _4585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4587 = _1901 + _4585;
            float _4589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4591 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4589;
            float _4593 = 1.0 / _4591;
            float _4595 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4597 = _4595 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4599 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4601 = _4599 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4603 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4605 = _4603 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4607 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4609 = _4607 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4611 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4613 = _4611 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4615 = _4587 * _4593;
            float _4617 = precise::clamp(_4615, 0.0, 1.0);
            float _4619 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4621 = _4619 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4623 = fma(_4617, _4597, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4625 = fma(_4617, _4621, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4627 = fma(_4617, _4601, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4629 = fma(_4617, _4605, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4631 = fma(_4617, _4609, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4633 = fma(_4617, _4613, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4547 = _4625;
            _4565 = _4631;
            _4541 = _4623;
            _4559 = _4629;
            _4553 = _4627;
            _4573 = _4633;
            _4635 = true;
        }
        else
        {
            bool _4637 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4639 = isnan(_1901);
            bool _4641 = _4637 || _4639;
            bool _4643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4645 = _4641 || _4643;
            if (!_4645)
            {
                _4539 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4647 = _4539;
            _4541 = _4647;
            if (!_4645)
            {
                _4545 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4649 = _4545;
            _4547 = _4649;
            if (!_4645)
            {
                _4551 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4651 = _4551;
            _4553 = _4651;
            if (!_4645)
            {
                _4557 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4653 = _4557;
            _4559 = _4653;
            if (!_4645)
            {
                _4563 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4655 = _4563;
            _4565 = _4655;
            if (!_4645)
            {
                _4571 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4657 = _4571;
            bool _4659 = !_4645;
            _4573 = _4657;
            if (!_4659)
            {
                bool _4661 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4663 = isnan(_1901);
                bool _4665 = _4661 || _4663;
                bool _4667 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4669 = _4665 || _4667;
                if (!_4669)
                {
                    float _4671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4673 = _1901 + _4671;
                    float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4677 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4675;
                    float _4679 = 1.0 / _4677;
                    float _4681 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4683 = _4681 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4685 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4687 = _4685 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4689 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4691 = _4689 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4693 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4695 = _4693 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4697 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4699 = _4697 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4701 = _4673 * _4679;
                    float _4703 = precise::clamp(_4701, 0.0, 1.0);
                    float _4705 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4707 = _4705 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4709 = fma(_4703, _4683, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4711 = fma(_4703, _4707, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4713 = fma(_4703, _4687, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4715 = fma(_4703, _4691, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4717 = fma(_4703, _4695, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4719 = fma(_4703, _4699, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4547 = _4711;
                    _4565 = _4717;
                    _4541 = _4709;
                    _4559 = _4715;
                    _4553 = _4713;
                    _4573 = _4719;
                    _4635 = true;
                }
                else
                {
                    _4547 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4565 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4541 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4559 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4553 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4573 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4635 = false;
    float _4721 = _4547;
    float _4723 = _4565;
    float _4725 = _4541;
    float _4727 = _4559;
    float _4729 = _4553;
    float _4731 = _4573;
    float _4733 = fma(_4305, -0.5, 0.5);
    float _4735 = precise::clamp(_4733, 0.0, 1.0);
    float _4737 = -_4721;
    float _4739 = _4737 + _4723;
    float _4741 = -_4725;
    float _4743 = _4741 + _4727;
    out.m_98.x = 0.0;
    float _4745 = fma(_4735, _4739, _4721);
    float _4747 = -_4729;
    float _4749 = _4747 + _4731;
    float _4751 = fma(_4735, _4743, _4725);
    float _4753 = _4745 * 0.586610972881317138671875;
    bool _4755 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4757 = fma(_4735, _4749, _4729);
    float _4759 = _4527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4761 = fma(_4751, 0.298911988735198974609375, _4753);
    bool _4763 = _1871 > 0.0;
    bool _4765 = isnan(_1871);
    bool _4767 = _4763 || _4765;
    bool _4769 = isnan(0.0);
    bool _4771 = _4767 || _4769;
    float _4773 = fma(_4757, 0.114477999508380889892578125, _4761);
    out.m_53.x = _4759;
    float _4775 = -_4773;
    float _4777 = _4751 + _4775;
    float _4779 = -_4773;
    float _4781 = _4745 + _4779;
    float _4783 = -_4773;
    float _4785 = _4757 + _4783;
    float _4787 = fma(_4777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    float _4789 = fma(_4781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    float _4791 = fma(_4785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    bool _4793 = !_4755;
    if (!_4793)
    {
        float _4795 = -_1815;
        float _4797 = _4795 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4799 = -_1817;
        float _4801 = _4799 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4803 = -_1819;
        float _4805 = _4803 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4807 = _4797 * _4797;
        float _4809 = fma(_4801, _4801, _4807);
        float _4811 = fma(_4805, _4805, _4809);
        float _4813 = sqrt(_4811);
        float _4815 = rsqrt(_4811);
        float _4817 = -_4813;
        float _4819 = _4817 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4821 = _4819 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4823 = precise::clamp(_4821, 0.0, 1.0);
        float _4825 = _4801 * _4815;
        float _4827 = _4797 * _4815;
        float _4829 = abs(_4823);
        float _4831 = log2(_4829);
        float _4833 = _4805 * _4815;
        float _4835 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4837 = _4305 * _4827;
        float _4839 = -_4827;
        float _4841 = -_4835;
        float _4843 = fma(_4839, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4841);
        float _4845 = fma(_3945, _4825, _4837);
        float _4847 = -_4833;
        float _4849 = fma(_4847, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4843);
        float _4851 = fma(_4403, _4833, _4845);
        float _4853 = precise::clamp(_4851, 0.0, 1.0);
        float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4857 = _4849 + _4855;
        float _4859 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4861 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4863 = precise::clamp(_4861, 0.0, 1.0);
        float _4865 = exp2(_4859);
        float _4867 = _4865 * _4863;
        float _4869 = _4853 * _4867;
        float _4871 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4873 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4875 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4871;
        out.m_98.y = _4873;
        out.m_98.z = _4875;
    }
    out.m_100.x = _4787;
    out.m_100.y = _4789;
    out.m_100.z = _4791;
    if (_4771)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4877 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4877;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4635 = false;
    bool _551 = false;
    bool _407 = false;
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
    float _133 = as_type<float>(_121);
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
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4946 = as_type<float>(_143);
        out.gl_Position.z = _4946;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_121);
    bool _159 = _125 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _133;
    if (_163)
    {
        out.m_53.x = 0.0;
    }
    float _169 = _125 * _165;
    float _171 = _169;
    if (_163)
    {
        float _173 = _167 * 5.0;
        _145 = as_type<int>(_173);
    }
    int _175 = _145;
    out.m_51.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5009 = as_type<float>(_175);
        out.gl_Position.z = _5009;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _215 = _169;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = _219 + _225;
    bool _229 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _231 = isnan(_219);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _249;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _219 + _253;
    float _257 = 1.0 / _243;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _261 = 1.0 / _251;
    float _263 = 1.0 / _247;
    float _265 = _223 * _257;
    bool _267 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _269 = isnan(_219);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = -_239;
    float _281 = _279 + 1.0;
    float _283 = _277 * _281;
    float _285 = _227 * _261;
    bool _287 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _289 = isnan(_219);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -_277;
    float _301 = _299 + 1.0;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _307 = _255 * _263;
    bool _309 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _311 = isnan(_219);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    float _325 = _297 * _301;
    float _327 = -_297;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_323, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = _319 * _329;
    float _339 = fma(_333, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = -_319;
    float _343 = _341 + 1.0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = _335 * _337;
    float _351 = _339 * _337;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _353;
    float _357 = fma(_305, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _361 = fma(_347, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _363;
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _369 = fma(_355, _285, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _371 = fma(_357, _325, _359);
    float _373 = fma(_365, _285, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _375 = fma(_361, _325, _367);
    float _377 = fma(_369, _283, _371);
    float _379 = fma(_373, _283, _375);
    float _381 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].x, _377);
    float _383 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[146].y, _379);
    bool _385 = !_259;
    float _387 = _285;
    float _405;
    if (!_385)
    {
        float _389 = in.m_58.x;
        float _391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _395 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _397 = _395 * _391;
        float _399 = floor(_397);
        float _401 = -_399;
        float _403 = _397 + _401;
        _405 = _403;
        _407 = true;
    }
    else
    {
        _405 = _169;
    }
    _407 = false;
    float _409 = _405;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _409 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _435 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _437 = isnan(_409);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _447;
    bool _451 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_409);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / _417;
    float _465 = -_429;
    float _467 = _465 + 1.0;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _471 = 1.0 / _433;
    float _473 = _449 * _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _479 = -_461;
    float _481 = _479 + 1.0;
    float _483 = fma(_473, _413, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _485 = _445 * _467;
    float _487 = -_445;
    float _489 = _487 + 1.0;
    float _491 = _429 * _481;
    float _493 = _477 * _471;
    float _495 = _483 * _485;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _499 = _409 + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _495);
    float _503 = fma(_493, _499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _507 = fma(_503, _491, _501);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[117].x, _507);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = _505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _525 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _519;
    out.m_62.y = _521;
    out.m_62.z = _525;
    out.m_62.w = _523;
    float _527 = _383 * _513;
    float _529 = _381 * _511;
    bool _531 = !_469;
    float _549;
    if (!_531)
    {
        float _533 = in.m_58.x;
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _537 = _533 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        _549 = _169;
    }
    _551 = false;
    float _553 = _549;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _563 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _565 = isnan(_553);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _579 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _581 = isnan(_553);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _591;
    bool _595 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _597 = isnan(_553);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _561;
    float _609 = -_573;
    float _611 = _609 + 1.0;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _615 = 1.0 / _577;
    float _617 = _593 * _607;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _623 = -_605;
    float _625 = _623 + 1.0;
    float _627 = fma(_617, _557, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _629 = _589 * _611;
    float _631 = -_589;
    float _633 = _631 + 1.0;
    float _635 = _573 * _625;
    float _637 = _621 * _615;
    float _639 = _627 * _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _643 = _553 + _641;
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[131].x, _639);
    float _647 = fma(_637, _643, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = fma(_647, _635, _645);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[133].x, _651);
    float _659 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _659;
    out.m_64.y = _661;
    out.m_64.z = _663;
    out.m_64.w = _665;
    bool _667 = !_613;
    float _669 = _657;
    int _671 = as_type<int>(_659);
    int _673 = as_type<int>(_639);
    float _675 = _645;
    float _677 = _573;
    float _679 = _653;
    if (!_667)
    {
        float _681 = in.m_58.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _669 = _689;
        _171 = _695;
    }
    float _697 = _669;
    float _699 = _171;
    float _701 = in.m_58.z;
    float _703 = in.m_58.w;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _711 = _697;
    if (_707)
    {
        float _713 = in.m_58.x;
        float _715 = in.m_58.y;
        _709 = _713;
        _711 = _715;
    }
    float _717 = _709;
    float _719 = _711;
    float _721 = 0.0;
    if (_707)
    {
        _721 = 1.0;
    }
    float _723 = _721;
    float _725 = 0.0;
    float _727 = _723;
    if (_707)
    {
        _725 = 1.0;
    }
    float _729 = _725;
    float _731 = _729;
    if (_707)
    {
        _671 = 0;
    }
    int _733 = _671;
    int _735 = _733;
    if (_707)
    {
        _673 = 0;
    }
    int _737 = _673;
    float _739 = _701 * 2.0;
    float _741 = floor(_739);
    float _743 = 0.0;
    float _745 = _717;
    float _747 = _719;
    int _749 = _737;
    if (_707)
    {
        _743 = _717;
    }
    float _751 = _743;
    float _753 = _751;
    if (_707)
    {
        _675 = _719;
    }
    float _755 = _675;
    float _757 = _755;
    if (_707)
    {
        _677 = _751;
    }
    float _759 = _677;
    float _761 = _759;
    if (_707)
    {
        _679 = _751;
    }
    float _763 = _679;
    float _765 = _763;
    if (!_707)
    {
        float _767 = in.m_58.x;
        float _769 = in.m_58.y;
        float _771 = in.m_58.z;
        float _773 = _767 * 3.1415927410125732421875;
        float _775 = _773 * 0.15915493667125701904296875;
        float _777 = _769 * 3.1415927410125732421875;
        float _779 = _777 * 0.15915493667125701904296875;
        float _781 = _775 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _779 * 6.283185482025146484375;
        float _787 = sin(_785);
        _745 = _767;
        _757 = _787;
        _747 = _769;
        _735 = 1;
        _749 = 2;
        _761 = _783;
        _731 = 5.839270114898681640625;
        _765 = _771;
        _727 = 7.345489978790283203125;
        _753 = _769;
    }
    float _789 = _745;
    float _791 = _757;
    float _793 = _747;
    int _795 = _735;
    int _797 = _749;
    float _799 = _761;
    float _801 = _731;
    float _803 = _765;
    float _805 = _727;
    float _807 = _753;
    float _809 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _811 = log2(_809);
    float _813 = _789 * 2.0;
    bool _815 = _741 > 0.0;
    float _817 = _791 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _819 = _741 >= 0.0;
    bool _821 = isnan(_741);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = _793 * 2.0;
    float _831 = _165 * _125;
    float _833 = floor(_813);
    int _835 = _827 ? 0 : 1;
    float _837 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _841 = ~_835;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _849 = _845;
    float _851 = _817;
    if (!_815)
    {
        int _853 = ~_835;
        int _855 = _853 + 1;
        _849 = _855;
    }
    int _857 = _849;
    float _859 = _811 * _125;
    bool _861 = _795 != 1;
    float _863 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[93].w, _839);
    bool _865 = _701 > 0.5;
    float _867 = floor(_829);
    float _869 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _863);
    float _871 = -_195;
    int _873 = _865 ? as_type<int>(_871) : as_type<int>(_195);
    bool _875 = _833 > 0.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _879 = _833 >= 0.0;
    bool _881 = isnan(_833);
    bool _883 = _879 || _881;
    bool _885 = isnan(0.0);
    bool _887 = _883 || _885;
    float _889 = exp2(_859);
    float _891 = _789 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _893 = _887 ? 0 : 1;
    float _895 = -_877;
    float _897 = fma(_891, 2.0, _895);
    bool _899 = _797 != 2;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _903 = ~_893;
    int _905 = _903 + 1;
    int _907 = _905 + 1;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _911 = int(_909);
    int _913 = _907;
    if (!_875)
    {
        int _915 = ~_893;
        int _917 = _915 + 1;
        _913 = _917;
    }
    int _919 = _913;
    float _921 = -_125;
    float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    bool _925 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _933 = _929 || _931;
    float _935 = -_889;
    float _937 = _935 + 1.0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _949 = _947 != 0;
    float _951 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[93].z, _901);
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _955 = _933 ? _937 : 0.0;
    float _957 = _799 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _959 = _793 > 0.5;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _963 = !_949;
    float _965 = _963 ? _195 : as_type<float>(_873);
    float _967 = -_953;
    float _969 = fma(_957, 2.0, _967);
    float _971 = -_191;
    int _973 = _959 ? as_type<int>(_971) : as_type<int>(_191);
    float _975 = fma(_817, -2.0, _961);
    float _977 = _793 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _979 = !_945;
    float _981 = _979 ? _191 : as_type<float>(_973);
    float _983 = _793 + _701;
    int _985 = int(_861);
    int _987 = _899 ? 2 : 0;
    int _989 = _985 | _987;
    int _991 = _959 ? 4 : 0;
    int _993 = _989 | _991;
    int _995 = _941 ? 8 : 0;
    int _997 = _993 | _995;
    int _999 = _945 ? 16 : 0;
    int _1001 = _997 | _999;
    int _1003 = _949 ? 32 : 0;
    int _1005 = _1001 | _1003;
    int _1007 = _865 ? 64 : 0;
    int _1009 = _1005 | _1007;
    int _1011 = _1009 & 64;
    float _1013 = _793 + _789;
    float _1015 = _983 + (-1.0);
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1027 = _1025 != 0;
    float _1029 = _1013 + (-1.0);
    float _1031 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1033 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _951);
    bool _1035 = !_1023;
    float _1037 = _1035 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1041 = !_1019;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1047 = !_1027;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = fma(_977, -2.0, _1039);
    float _1053 = -_125;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[91].x, _969);
    float _1057 = _961;
    float _1059 = _977;
    float _1061 = _953;
    float _1063 = _1037;
    if (!_861)
    {
        _1057 = _701;
    }
    float _1065 = _1057;
    float _1067 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1051);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1075 = _1073 != 0;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1079 = _1077 != 0;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1083 = _1065;
    if (!_861)
    {
        _851 = _793;
    }
    float _1085 = _851;
    float _1087 = _1085;
    if (_861)
    {
        _1083 = _793;
    }
    float _1089 = _1083;
    if (!_861)
    {
        _387 = _793;
    }
    float _1091 = _387;
    float _1093 = _1091;
    if (_861)
    {
        _1087 = _789;
    }
    float _1095 = _1087;
    float _1097 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1045);
    if (_861)
    {
        _1093 = _789;
    }
    float _1099 = _1093;
    float _1101 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1105 = 0.0;
    if (!_861)
    {
        _1105 = _701;
    }
    float _1107 = _1105;
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1081);
    float _1111 = _1107;
    if (_899)
    {
        _1059 = _793;
    }
    float _1113 = _1059;
    float _1115 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1117 = _1113;
    if (_899)
    {
        _1061 = _789;
    }
    float _1119 = _1061;
    float _1121 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1123 = int(_1121);
    bool _1125 = !_1075;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = -_1103;
    float _1131 = fma(_1101, 2.0, _1129);
    bool _1133 = !_1071;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1097);
    bool _1139 = !_1079;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = -_125;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1131);
    float _1147 = _1119;
    if (_861)
    {
        _1111 = _793;
    }
    float _1149 = _1111;
    if (!_899)
    {
        _1147 = _701;
    }
    float _1151 = _1147;
    if (!_899)
    {
        _1117 = _789;
    }
    float _1153 = _1117;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1165 = _1163 != 0;
    bool _1167 = _867 > 0.0;
    float _1169 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1171 = _867 >= 0.0;
    bool _1173 = isnan(_867);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan(0.0);
    bool _1179 = _1175 || _1177;
    float _1181 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1183 = int(_1181);
    bool _1185 = !_1157;
    int _1187 = _1185 ? 0 : 1;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1193 = abs(_1187);
    float _1195 = float(_911);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1199 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1201 = float(_1123);
    float _1203 = 1.0 / _1195;
    float _1205 = float(_1183);
    float _1207 = fma(_1199, -2.0, _1189);
    float _1209 = fma(_1169, -2.0, _1197);
    float _1211 = float(_857);
    float _1213 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1207);
    int _1215 = int(_1167);
    int _1217 = _1179 ? 2 : 0;
    int _1219 = _1215 | _1217;
    int _1221 = _959 ? 4 : 0;
    int _1223 = _1219 | _1221;
    int _1225 = _941 ? 8 : 0;
    int _1227 = _1223 | _1225;
    int _1229 = _1157 ? 16 : 0;
    int _1231 = _1227 | _1229;
    int _1233 = _1161 ? 32 : 0;
    int _1235 = _1231 | _1233;
    int _1237 = _1165 ? 64 : 0;
    int _1239 = _1235 | _1237;
    int _1241 = _1239 & 4;
    float _1243 = 1.0 / _1205;
    float _1245 = in.m_66.x;
    float _1247 = in.m_66.y;
    float _1249 = in.m_66.z;
    bool _1251 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1253 = isnan(1.0);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1259 = _1255 || _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1263 = 1.0 + _1261;
    float _1265 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1267 = float(_1193);
    float _1269 = 1.0 / _1201;
    float _1271 = -_1191;
    float _1273 = fma(_1265, 2.0, _1271);
    float _1275 = _1267 * _1211;
    float _1277 = _1203 * _125;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1281 = 1.0 / _1263;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1285 = !_1161;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1291 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1279);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1295 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1283);
    float _1297 = float(_919);
    float _1299 = _1243 * _125;
    float _1301 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1293);
    int _1303 = abs(_1287);
    float _1305 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1289);
    float _1307 = _1275 * (-2.0);
    float _1309 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1291);
    float _1311 = float(_1303);
    float _1313 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1295);
    float _1315 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1301);
    float _1317 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1109);
    float _1319 = _1269 * _125;
    float _1321 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1305);
    float _1323 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _975);
    float _1325 = -_125;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1273);
    float _1329 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1209);
    float _1331 = _1311 * _1297;
    if (_1259)
    {
        float _1333 = _955 * _1281;
        _135 = _1333;
    }
    float _1335 = _135;
    float _1337 = _789 + (-0.5);
    float _1339 = fma(_1307, _1245, _1245);
    int _1341 = _1179 ? 0 : 1;
    float _1343 = fma(_1115, _1307, _1115);
    bool _1345 = !_1165;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1339);
    int _1351 = ~_1341;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    float _1357 = _793 + (-0.5);
    int _1359 = abs(_1347);
    float _1361 = in.m_46.x;
    float _1363 = in.m_46.y;
    float _1365 = in.m_46.z;
    int _1367 = _1355;
    float _1369 = _1335;
    if (!_1167)
    {
        int _1371 = ~_1341;
        int _1373 = _1371 + 1;
        _1367 = _1373;
    }
    int _1375 = _1367;
    float _1377 = _1331 * (-2.0);
    float _1379 = fma(_1343, _1335, _1349);
    float _1381 = fma(_1377, _1247, _1247);
    float _1383 = float(_1375);
    float _1385 = fma(_1031, _1377, _1031);
    float _1387 = float(_1359);
    float _1389 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1381);
    float _1391 = _789 + _701;
    float _1393 = _1379 * 0.15915493667125701904296875;
    float _1395 = _1387 * _1383;
    float _1397 = fma(_1385, _1335, _1389);
    float _1399 = in.m_68.x;
    float _1401 = in.m_68.y;
    float _1403 = in.m_68.z;
    float _1405 = in.m_68.w;
    float _1407 = _1391 + (-1.0);
    float _1409 = _1395 * (-2.0);
    float _1411 = _701 + (-0.5);
    float _1413 = in.m_70.x;
    float _1415 = in.m_70.y;
    float _1417 = in.m_70.z;
    float _1419 = in.m_70.w;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1423 = fma(_1409, _1249, _1249);
    float _1425 = _1397 * 0.15915493667125701904296875;
    float _1427 = in.m_72.x;
    float _1429 = in.m_72.y;
    float _1431 = in.m_72.z;
    float _1433 = in.m_72.w;
    float _1435 = fma(_1421, _1409, _1421);
    float _1437 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1423);
    float _1439 = _1393 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1447 = fma(_1435, _1335, _1437);
    bool _1449 = _703 > 0.5;
    float _1451 = _837 * _1443;
    float _1453 = _847 * _1445;
    float _1455 = _1447 * 0.15915493667125701904296875;
    float _1457 = _1393 * 6.283185482025146484375;
    float _1459 = cos(_1457);
    float _1461 = _1363 * _1401;
    float _1463 = _1425 * 6.283185482025146484375;
    float _1465 = sin(_1463);
    float _1467 = _1363 * _1415;
    float _1469 = fma(_1361, _1399, _1461);
    float _1471 = _1363 * _1429;
    float _1473 = fma(_1361, _1413, _1467);
    float _1475 = fma(_1365, _1403, _1469);
    float _1477 = _1425 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = fma(_1361, _1427, _1471);
    float _1483 = fma(_1365, _1417, _1473);
    float _1485 = _1475 + _1405;
    float _1487 = fma(_1365, _1431, _1481);
    float _1489 = _1483 + _1419;
    float _1491 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1493 = _1455 * 6.283185482025146484375;
    float _1495 = cos(_1493);
    float _1497 = _1441 * _1465;
    float _1499 = _1487 + _1433;
    float _1501 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1491);
    float _1503 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1501);
    float _1505 = _1455 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = _1459 * _1479;
    float _1511 = _1441 * _1479;
    float _1513 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1515 = _1459 * _1495;
    float _1517 = _1459 * _1465;
    float _1519 = _1441 * _1495;
    float _1521 = _1479 * _1495;
    float _1523 = _1515 * _1451;
    float _1525 = _1465 * _1495;
    float _1527 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1529 = 1.0 / _1513;
    float _1531 = fma(_1507, _1509, _1497);
    float _1533 = -_1451;
    float _1535 = _1507 * _1533;
    float _1537 = -_1511;
    float _1539 = fma(_1507, _1517, _1537);
    float _1541 = -_1517;
    float _1543 = fma(_1507, _1511, _1541);
    float _1545 = fma(_1531, _1453, _1523);
    float _1547 = _1519 * _1451;
    float _1549 = fma(_1521, _1453, _1535);
    float _1551 = fma(_1507, _1497, _1509);
    float _1553 = fma(_1539, _1527, _1545);
    float _1555 = fma(_1543, _1453, _1547);
    float _1557 = fma(_1525, _1527, _1549);
    float _1559 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1561 = fma(_1551, _1527, _1555);
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1567 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1559);
    float _1569 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1563);
    float _1571 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1565);
    float _1573 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1567);
    float _1575 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1569);
    float _1577 = fma(_1561, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1571);
    float _1579 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1581 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1583 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1585 = _1499 + _1579;
    float _1587 = _1489 + _1581;
    float _1589 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1593 = _1585 + _1591;
    float _1595 = _1485 + _1583;
    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1599 = _1587 + _1597;
    float _1601 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1589);
    float _1603 = _1593 * _1593;
    float _1605 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1601);
    float _1607 = fma(_1599, _1599, _1603);
    float _1609 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1611 = sqrt(_1607);
    float _1613 = _1609 + _1513;
    float _1615 = -_195;
    int _1617 = _1449 ? as_type<int>(_1615) : as_type<int>(_195);
    float _1619 = _1613 * _1529;
    float _1621 = _1619 * 0.5;
    bool _1623 = !_941;
    float _1625 = _1623 ? _195 : as_type<float>(_1617);
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1629 = _1627 != 0;
    int _1631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1633 = _1631 != 0;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1637 = _1635 != 0;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1641 = _1639 != 0;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1643);
    float _1647 = 1.0 / _1645;
    bool _1649 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1651 = !_1633;
    int _1653 = _1651 ? 0 : 1;
    bool _1655 = !_1629;
    int _1657 = _1655 ? 0 : 1;
    bool _1659 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1661 = isnan(0.5);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1667 = _1663 || _1665;
    bool _1669 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1671 = isnan(0.5);
    bool _1673 = _1669 || _1671;
    bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1677 = _1673 || _1675;
    bool _1679 = !_1637;
    int _1681 = _1679 ? 0 : 1;
    bool _1683 = !_1641;
    int _1685 = _1683 ? 0 : 1;
    float _1687 = _1529;
    float _1689 = _1445;
    float _1691 = _1587;
    float _1693 = _1607;
    float _1695 = _1561;
    float _1697 = _1489;
    if (!_1649)
    {
        _1687 = _1585;
    }
    float _1699 = _1687;
    float _1701 = _1699;
    if (!_1649)
    {
        _1689 = _1595;
    }
    float _1703 = _1689;
    bool _1705 = !_1649;
    float _1707 = _1703;
    if (!_1705)
    {
        float _1709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1713 = _1611 + _1711;
        float _1715 = rsqrt(_1607);
        float _1717 = _1713 * _1709;
        float _1719 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = _1717 * 0.15915493667125701904296875;
        float _1723 = _1721 * 6.283185482025146484375;
        float _1725 = cos(_1723);
        float _1727 = _1721 * 6.283185482025146484375;
        float _1729 = sin(_1727);
        float _1731 = _1725 + (-1.0);
        float _1733 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1735 = fma(_1729, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1737 = fma(_1595, _1725, _1733);
        float _1739 = _1715 * _1735;
        float _1741 = fma(_1599, _1739, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1743 = fma(_1593, _1739, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1707 = _1737;
        _1691 = _1741;
        _1701 = _1743;
    }
    float _1745 = _1707;
    float _1747 = _1691;
    float _1749 = _1701;
    float _1751 = _1745;
    float _1753 = _1747;
    float _1755 = _1749;
    if (_1677)
    {
        _1693 = 1.0;
    }
    float _1757 = _1693;
    float _1759 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1761 = _1647 * _1759;
    float _1763 = _1757;
    if (!_1667)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1767 = _1485 + _1765;
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1771 = _1489 + _1769;
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1775 = -_1485;
        float _1777 = _1775 + _1745;
        float _1779 = _1767 * _1767;
        float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1783 = _1499 + _1781;
        float _1785 = -_1489;
        float _1787 = _1785 + _1747;
        float _1789 = fma(_1771, _1771, _1779);
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1793 = fma(_1783, _1783, _1789);
        float _1795 = sqrt(_1793);
        float _1797 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1799 = precise::min(_1795, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1801 = _1799 * _1791;
        float _1803 = _1797 * _1801;
        float _1805 = -_1499;
        float _1807 = _1805 + _1749;
        float _1809 = fma(_1777, _1803, _1485);
        float _1811 = fma(_1787, _1803, _1489);
        float _1813 = fma(_1807, _1803, _1499);
        _1751 = _1809;
        _1753 = _1811;
        _1755 = _1813;
    }
    float _1815 = _1751;
    float _1817 = _1753;
    float _1819 = _1755;
    if (!_1677)
    {
        float _1821 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1823 = _1821 * 0.15915493667125701904296875;
        float _1825 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1827 = _1823 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = _1825 * 0.15915493667125701904296875;
        float _1833 = _1823 * 6.283185482025146484375;
        float _1835 = sin(_1833);
        float _1837 = 1.0 / _1829;
        float _1839 = _1831 * 6.283185482025146484375;
        float _1841 = cos(_1839);
        float _1843 = _1835 * _1837;
        float _1845 = _1831 * 6.283185482025146484375;
        float _1847 = sin(_1845);
        float _1849 = _1841 * _1843;
        float _1851 = 1.0 / _1849;
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1855 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1853;
        float _1857 = 1.0 / _1855;
        float _1859 = _1847 * _1851;
        float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1863 = fma(_1761, _1859, _1861);
        float _1865 = _1863 * _1857;
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        _1695 = _1831;
        _1763 = _1867;
    }
    float _1869 = _1695;
    float _1871 = _1763;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1875 = _1815 + _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1879 = _1817 + _1877;
    float _1881 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1883 = _1819 + _1881;
    float _1885 = _1875 * _1875;
    bool _1887 = _1011 != 0;
    float _1889 = fma(_1879, _1879, _1885);
    float _1891 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1893 = fma(_1883, _1883, _1889);
    float _1895 = floor(_1891);
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1899 = rsqrt(_1893);
    float _1901 = sqrt(_1893);
    float _1903 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1905 = _1879 * _1903;
    float _1907 = _1883 * _1903;
    float _1909 = _1905 * _1905;
    float _1911 = _1907 * _1907;
    float _1913 = _1909 + _1911;
    float _1915 = sqrt(_1913);
    bool _1917 = _1915 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1921 = _1915 + _1919;
    float _1923 = _1899;
    float _1925 = _1913;
    float _1927 = _1921;
    float _1929 = _1869;
    float _1931 = _1875;
    if (_1917)
    {
        float _1933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1923 = _1933;
    }
    float _1935 = _1923;
    if (!_1917)
    {
        _1697 = _1909;
    }
    float _1937 = _1697;
    float _1939 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1941 = _1937;
    if (_1917)
    {
        float _1943 = rsqrt(_1913);
        _1925 = _1943;
    }
    float _1945 = _1925;
    if (_1917)
    {
        float _1947 = _1921 * _1935;
        _1927 = _1947;
    }
    float _1949 = _1927;
    if (_1917)
    {
        float _1951 = _1949 * 0.15915493667125701904296875;
        _1929 = _1951;
    }
    float _1953 = _1929;
    float _1955 = _1883;
    float _1957 = _1953;
    if (_1917)
    {
        float _1959 = _1953 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1967 = precise::max(0.0, _1965);
    float _1969 = _1935;
    float _1971 = _1967;
    if (_1917)
    {
        float _1973 = _1953 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        _1969 = _1975;
    }
    float _1977 = _1969;
    float _1979 = -_1903;
    float _1981 = -_1967;
    float _1983 = fma(_1875, _1979, _1981);
    if (_1917)
    {
        float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1985;
    }
    float _1987 = _1931;
    float _1989 = _1963;
    float _1991 = _1987;
    if (_1917)
    {
        float _1993 = fma(_1963, _1987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1989 = _1993;
    }
    float _1995 = _1989;
    float _1997 = _1995;
    if (!_1917)
    {
        _1991 = _1983;
    }
    float _1999 = _1991;
    float _2001 = _1999;
    float _2003 = _1977;
    if (_1917)
    {
        float _2005 = _1977 + (-1.0);
        _1971 = _2005;
    }
    float _2007 = _1971;
    float _2009 = _2007;
    if (_1917)
    {
        float _2011 = _1945 * _1995;
        _1369 = _2011;
    }
    float _2013 = _1369;
    if (!_1917)
    {
        _1997 = _1905;
    }
    float _2015 = _1997;
    float _2017 = _2015;
    if (_1917)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1957 = _2019;
    }
    float _2021 = _1957;
    if (_1917)
    {
        float _2023 = _1905 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1917)
    {
        _2009 = _1907;
    }
    float _2027 = _2009;
    float _2029 = _2027;
    if (_1917)
    {
        float _2031 = _1907 * _2013;
        _2029 = _2031;
    }
    float _2033 = _2029;
    if (_1917)
    {
        float _2035 = fma(_1983, _1977, _2021);
        _2001 = _2035;
    }
    float _2037 = _2001;
    if (_1917)
    {
        float _2039 = _2025 * _2025;
        _1941 = _2039;
    }
    float _2041 = _1941;
    if (!_1917)
    {
        _2003 = _1911;
    }
    float _2043 = _2003;
    float _2045 = _2043;
    if (_1917)
    {
        float _2047 = _2033 * _2033;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = fma(_2037, _2037, _2041);
    float _2053 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2055 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2057 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1939);
    float _2059 = _2051 + _2049;
    float _2061 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2063 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2065 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2053);
    float _2067 = rsqrt(_2059);
    float _2069 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2061);
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2073 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2055);
    float _2079 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2081 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2069);
    float _2083 = -_2075;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2077);
    float _2089 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2091 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2057);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2097 = abs(_2085);
    float _2099 = log2(_2097);
    float _2101 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2103 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2105 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2067 * _2025;
    float _2109 = _2067 * _2037;
    float _2111 = _2067 * _2033;
    float _2113 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2101);
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2117 = floor(_2063);
    float _2119 = -_1895;
    float _2121 = _1891 + _2119;
    float _2123 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2113);
    float _2125 = -_2115;
    float _2127 = fma(_2109, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2125);
    float _2129 = -_2105;
    float _2131 = fma(_2129, _1897, 1.0);
    float _2133 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2123);
    float _2135 = -_2111;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2127);
    float _2139 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2141 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2143 = log2(_2131);
    float _2145 = fma(_2137, -0.5, 0.5);
    float _2147 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2149 = fma(_2137, 0.5, 0.5);
    float _2151 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2141);
    float _2153 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2147);
    float _2155 = -_2117;
    float _2157 = _2063 + _2155;
    float _2159 = 1.0 / _2133;
    float _2161 = fma(_2149, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2163 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2151);
    float _2165 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2153);
    float _2167 = _2109 + 1.0;
    float _2169 = fma(_2149, _2161, -0.212114393711090087890625);
    float _2171 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2163);
    float _2173 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2165);
    float _2175 = exp2(_2139);
    float _2177 = fma(_2149, _2169, 1.570728778839111328125);
    float _2179 = _2143 * 0.693147182464599609375;
    float _2181 = sqrt(_2145);
    float _2183 = _2171 * _2159;
    float _2185 = _2173 * _2159;
    float _2187 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2189 = fma(_2185, -0.5, 0.5);
    float _2191 = -_2109;
    float _2193 = fma(_2175, _2167, _2191);
    float2 _8151 = float2(_2121, _2157);
    float _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8151, float2(0.0), isnan(_8151)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8151, float2(0.0), isnan(_8151)), level(0.0)).x;
    float _2197 = fma(_2193, 0.5, 0.5);
    float _2199 = _2181 * 0.636619746685028076171875;
    float _2201 = fma(_2183, 0.5, 0.5);
    float _2203 = -_2177;
    float _2205 = fma(_2199, _2203, 1.0);
    float3 _8174 = float3(_2201, _2189, _2187);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8174, float3(0.0), isnan(_8174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8174, float3(0.0), isnan(_8174)), level(0.0)).x;
    float3 _8185 = float3(_2201, _2189, _2187);
    float4 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8185, float3(0.0), isnan(_8185)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8185, float3(0.0), isnan(_8185)), level(0.0)).xyzw;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float _2218 = _2210.w;
    float2 _8201 = float2(_2205, _2197);
    float3 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8201, float2(0.0), isnan(_8201)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8201, float2(0.0), isnan(_8201)), level(0.0)).xyz;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2232 = int(_2230);
    float _2234 = _801 * _803;
    int _2236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2238 = _2236 != 0;
    float _2240 = -_1317;
    float _2242 = _2240 + 1.0;
    int _2244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2246 = _2244 != 0;
    float _2248 = -_1309;
    float _2250 = _2248 + 1.0;
    int _2252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2254 = _2252 != 0;
    float _2256 = -_1137;
    float _2258 = _2256 + 1.0;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2262 = int(_2260);
    int _2264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2266 = _2264 != 0;
    float _2268 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2270 = abs(_1135);
    float _2272 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2274 = abs(_1049);
    float _2276 = -_1313;
    float _2278 = _2276 + 1.0;
    bool _2280 = _1241 != 0;
    float _2282 = trunc(_1319);
    int _2284 = int(_2282);
    float _2286 = float(uint(_2232));
    float _2288 = -_1315;
    float _2290 = _2288 + 1.0;
    float _2292 = trunc(_1277);
    int _2294 = int(_2292);
    float _2296 = float(uint(_2262));
    float _2298 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2272);
    float _2300 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2302 = int(_2300);
    float _2304 = float(uint(_2284));
    float _2306 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2298);
    float _2308 = float(_2232);
    float _2310 = float(_2284);
    float _2312 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2314 = 1.0 / _2286;
    bool _2316 = _2310 >= _2308;
    bool _2318 = isnan(_2310);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan(_2308);
    bool _2324 = _2320 || _2322;
    float _2326 = float(_2324);
    float _2328 = float(_2294);
    out.gl_Position.x = _2171;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2312;
    out.gl_Position.w = _2133;
    bool _2330 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2332 = isnan(_699);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2338 = _2334 || _2336;
    float _2340 = float(_2338);
    float _2342 = 1.0 / _2296;
    float _2344 = float(uint(_2302));
    int _2346 = as_type<int>(_2314) + (-2);
    float _2348 = 1.0 / _2344;
    int _2350 = ~_2232;
    int _2352 = _2350 + 1;
    float _2354 = as_type<float>(_2346) * _2304;
    int _2356 = as_type<int>(_2342) + (-2);
    float _2358 = trunc(_2354);
    float _2360 = precise::max(_2358, 0.0);
    uint _2363 = uint(_2360);
    float _2365 = float(uint(_2294));
    float _2367 = as_type<float>(_2356) * _2365;
    float _2369 = _805 * _789;
    float _2371 = trunc(_1299);
    int _2373 = int(_2371);
    int _2375 = ~_2262;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2367);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = _2352 * int(_2363);
    int _2387 = _2385 + _2284;
    float _2389 = float(uint(_2387));
    float _2391 = trunc(_2326);
    int _2393 = int(_2391);
    float _2395 = float(uint(_2373));
    float _2397 = as_type<float>(_2346) * _2389;
    float _2399 = floor(_2369);
    int _2401 = _2377 * int(_2383);
    int _2403 = _2401 + _2294;
    float _2405 = float(uint(_2403));
    float _2407 = trunc(_2397);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    float _2413 = as_type<float>(_2356) * _2405;
    int _2415 = as_type<int>(_2348) + (-2);
    int _2417 = ~_2232;
    int _2419 = _2417 + 1;
    float _2421 = floor(_2234);
    float _2423 = as_type<float>(_2415) * _2395;
    float _2425 = -_2399;
    float _2427 = _2369 + _2425;
    float _2429 = _805 * _807;
    int _2431 = ~_2302;
    int _2433 = _2431 + 1;
    float _2435 = trunc(_2413);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = int(_2363) + int(_2411);
    float _2443 = float(_2262);
    float _2445 = as_type<float>(_2411);
    float _2447 = _2429;
    float _2449 = as_type<float>(_2356);
    float _2451 = _2173;
    float _2453 = _2171;
    if (_2266)
    {
        float _2455 = in.m_58.w;
        _2445 = _2455;
    }
    float _2457 = _2445;
    int _2459 = ~_2262;
    int _2461 = _2459 + 1;
    int _2463 = _2419 * _2441;
    int _2465 = _2463 + _2284;
    bool _2467 = _2328 >= _2443;
    bool _2469 = isnan(_2328);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan(_2443);
    bool _2475 = _2471 || _2473;
    float _2477 = float(_2475);
    float _2479 = trunc(_2423);
    float _2481 = precise::max(_2479, 0.0);
    uint _2483 = uint(_2481);
    float _2485 = -_2421;
    float _2487 = _2234 + _2485;
    float _2489 = _2427 * _2308;
    float _2491 = _2308 * _831;
    bool _2493 = uint(_2465) >= uint(_2232);
    float _2495 = _2487 * _2443;
    bool _2497 = !_2254;
    int _2499 = _2497 ? 0 : 1;
    float _2501 = trunc(_2489);
    int _2503 = int(_2501);
    int _2505 = int(_2383) + int(_2439);
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2509 = _2507 != 0;
    int _2511 = abs(_2499);
    int _2513 = _2461 * _2505;
    int _2515 = _2513 + _2294;
    bool _2517 = !_2509;
    int _2519 = _2517 ? 0 : 1;
    int _2521 = _2433 * int(_2483);
    int _2523 = _2521 + _2373;
    float _2525 = trunc(_2495);
    int _2527 = int(_2525);
    bool _2529 = _2232 == 0;
    float _2531 = float(uint(_2523));
    bool _2533 = !_2493;
    int _2535 = _2533 ? 0 : (-1);
    bool _2537 = uint(_2515) >= uint(_2262);
    float _2539 = trunc(_2477);
    int _2541 = int(_2539);
    int _2543 = ~_2441;
    int _2545 = _2543 + _2535;
    int _2547 = _2545 + 1;
    float _2549 = as_type<float>(_2415) * _2531;
    bool _2551 = !_2537;
    int _2553 = _2551 ? 0 : (-1);
    int _2555 = abs(_2519);
    int _2557 = _2503 * _2511;
    int _2559 = _2557 + _2284;
    int _2561 = ~_2505;
    int _2563 = _2561 + _2553;
    int _2565 = _2563 + 1;
    float _2567 = trunc(_2549);
    float _2569 = precise::max(_2567, 0.0);
    uint _2571 = uint(_2569);
    int _2573 = _2232 * _2547;
    int _2575 = _2573 + _2284;
    bool _2577 = _2262 == 0;
    int _2579 = _2262 * _2565;
    int _2581 = _2579 + _2294;
    bool _2583 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2585 = isnan(_699);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2591 = _2587 || _2589;
    float _2593 = float(_2591);
    int _2595 = _2527 * _2555;
    int _2597 = _2595 + _2294;
    bool _2599 = !_2529;
    int _2601 = _2599 ? _2575 : (-1);
    float _2603 = trunc(_2491);
    int _2605 = int(_2603);
    int _2607 = ~_2541;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2577;
    int _2615 = _2613 ? _2581 : (-1);
    int _2617 = ~_2393;
    int _2619 = _2617 + 1;
    int _2621 = _2619 + 1;
    int _2623 = _2262 + (-1);
    int _2625 = _2615 * _2611;
    int _2627 = ~_2302;
    int _2629 = _2627 + 1;
    int _2631 = _2601 * _2621;
    int _2633 = _2232 + (-1);
    int _2635 = _2541 * _2623;
    int _2637 = _2635 + _2625;
    int _2639 = int(_2483) + int(_2571);
    float _2641 = _2443 * _831;
    int _2643 = _2393 * _2633;
    int _2645 = _2643 + _2631;
    int _2647 = abs(_1127);
    float _2649 = exp2(_2268);
    int _2651 = abs(as_type<int>(_1037));
    int _2653 = _2629 * _2639;
    int _2655 = _2653 + _2373;
    float _2657 = as_type<float>(_2655);
    if (_2266)
    {
        float _2659 = _2457 * 3.1415927410125732421875;
        _1063 = _2659;
    }
    float _2661 = _1063;
    bool _2663 = !_2238;
    int _2665 = _2663 ? 0 : 1;
    int _2667 = _2637 * _2647;
    int _2669 = abs(_1043);
    int _2671 = _2645 * _2651;
    float _2673 = trunc(_2641);
    int _2675 = int(_2673);
    bool _2677 = uint(_2655) >= uint(_2302);
    bool _2679 = _2677;
    if (_2266)
    {
        float _2681 = _2661 * 0.15915493667125701904296875;
        _2657 = _2681;
    }
    float _2683 = _2657;
    float _2685 = float(_2302);
    float _2687 = float(_2373);
    int _2689 = abs(_1657);
    float _2691 = _2683;
    if (_2266)
    {
        float _2693 = _2683 * 6.283185482025146484375;
        float _2695 = sin(_2693);
        _2691 = _2695;
    }
    float _2697 = _2691;
    bool _2699 = _2687 >= _2685;
    bool _2701 = isnan(_2687);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(_2685);
    bool _2707 = _2703 || _2705;
    float _2709 = float(_2707);
    float _2711 = _2685 * _831;
    float _2713 = -_2649;
    float _2715 = _2713 + 1.0;
    int _2717 = abs(_2665);
    int _2719 = _2605 * _2669;
    int _2721 = _2719 + _2671;
    bool _2723 = !_2677;
    int _2725 = _2723 ? 0 : (-1);
    float _2727 = trunc(_2709);
    int _2729 = int(_2727);
    int _2731 = _2675 * _2270;
    int _2733 = _2731 + _2667;
    int _2735 = abs(_1141);
    int _2737 = _2559 * _2274;
    int _2739 = _2737 + _2721;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2743 = _2741 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2745 = ~_2639;
    int _2747 = _2745 + _2725;
    int _2749 = _2747 + 1;
    float _2751 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2753 = _2503 * _2717;
    int _2755 = _2753 + _2739;
    bool _2757 = !_2246;
    int _2759 = _2757 ? 0 : 1;
    float _2761 = floor(_2429);
    if (_2266)
    {
        bool _2763 = _2697 > 0.5;
        _2679 = _2763;
    }
    bool _2765 = _2679;
    int _2767 = _2597 * _2735;
    int _2769 = _2767 + _2733;
    int _2771 = abs(_2759);
    int _2773 = _2302 * _2749;
    int _2775 = _2773 + _2373;
    float _2777 = float(uint(_2755));
    float _2779 = trunc(_2711);
    int _2781 = int(_2779);
    bool _2783 = _2302 == 0;
    float _2785 = as_type<float>(_2346) * _2777;
    float _2787 = float(uint(_2559));
    int _2789 = _2527 * _2771;
    int _2791 = _2789 + _2769;
    int _2793 = ~_2729;
    int _2795 = _2793 + 1;
    int _2797 = _2795 + 1;
    bool _2799 = !_2783;
    int _2801 = _2799 ? _2775 : (-1);
    float _2803 = trunc(_2785);
    float _2805 = precise::max(_2803, 0.0);
    uint _2807 = uint(_2805);
    float _2809 = float(uint(_2791));
    float _2811 = -_2761;
    float _2813 = _2429 + _2811;
    if (!_2266)
    {
        _2447 = _191;
    }
    float _2815 = _2447;
    float _2817 = as_type<float>(_2346) * _2787;
    float _2819 = _2815;
    if (_2266)
    {
        float _2821 = -_191;
        float _2823 = _2765 ? _2821 : _191;
        _2819 = _2823;
    }
    float _2825 = _2819;
    float _2827 = as_type<float>(_2356) * _2809;
    int _2829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2831 = _2829 != 0;
    int _2833 = _2801 * _2797;
    int _2835 = ~_2232;
    int _2837 = _2835 + 1;
    float _2839 = trunc(_2817);
    float _2841 = precise::max(_2839, 0.0);
    uint _2843 = uint(_2841);
    int _2845 = _2302 + (-1);
    float _2847 = _2813 * _2685;
    int _2849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2851 = _2849 != 0;
    int _2853 = ~_2262;
    int _2855 = _2853 + 1;
    int _2857 = _2837 * int(_2807);
    int _2859 = _2857 + _2755;
    int _2861 = abs(_1653);
    float _2863 = trunc(_2827);
    float _2865 = precise::max(_2863, 0.0);
    uint _2867 = uint(_2865);
    int _2869 = _2729 * _2845;
    int _2871 = _2869 + _2833;
    bool _2873 = !_2851;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = as_type<float>(_2639);
    if (_2831)
    {
        float _2879 = in.m_58.x;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = float(uint(_2859));
    int _2885 = ~_2232;
    int _2887 = _2885 + 1;
    float _2889 = trunc(_2847);
    int _2891 = int(_2889);
    int _2893 = abs(_2875);
    float _2895 = as_type<float>(_2346) * _2883;
    int _2897 = _2887 * int(_2843);
    int _2899 = _2897 + _2559;
    int _2901 = _2855 * int(_2867);
    int _2903 = _2901 + _2791;
    float _2905 = trunc(_2895);
    float _2907 = precise::max(_2905, 0.0);
    uint _2909 = uint(_2907);
    float _2911 = float(uint(_2903));
    int _2913 = _2871 * _2861;
    float _2915 = float(uint(_2899));
    int _2917 = _2891 * _2893;
    int _2919 = _2917 + _2373;
    int _2921 = abs(_1681);
    float _2923 = as_type<float>(_2356) * _2911;
    int _2925 = _2781 * _2689;
    int _2927 = _2925 + _2913;
    float _2929 = float(uint(_2597));
    float _2931 = as_type<float>(_2346) * _2915;
    float _2933 = trunc(_2923);
    float _2935 = precise::max(_2933, 0.0);
    uint _2937 = uint(_2935);
    int _2939 = ~_2232;
    int _2941 = _2939 + 1;
    int _2943 = _2919 * _2921;
    int _2945 = _2943 + _2927;
    int _2947 = abs(_1685);
    float _2949 = as_type<float>(_2356) * _2929;
    float _2951 = _2929;
    if (_2831)
    {
        float _2953 = _2881 * 3.1415927410125732421875;
        _2951 = _2953;
    }
    float _2955 = _2951;
    float _2957 = 1.0 / _2743;
    int _2959 = int(_2807) + int(_2909);
    float _2961 = _2955;
    if (_2831)
    {
        float _2963 = _2955 * 0.15915493667125701904296875;
        _2961 = _2963;
    }
    float _2965 = _2961;
    int _2967 = ~_2262;
    int _2969 = _2967 + 1;
    int _2971 = _2891 * _2947;
    int _2973 = _2971 + _2945;
    int _2975 = _2941 * _2959;
    int _2977 = _2975 + _2755;
    float _2979 = trunc(_2949);
    float _2981 = precise::max(_2979, 0.0);
    uint _2983 = uint(_2981);
    float _2985 = float(uint(_2919));
    float _2987 = -_2195;
    float _2989 = _2987 + 1.0;
    int _2991 = int(_2867) + int(_2937);
    float _2993 = -_191;
    int _2995 = _1887 ? as_type<int>(_2993) : as_type<int>(_191);
    float _2997 = as_type<float>(_2415) * _2985;
    bool _2999 = uint(_2977) >= uint(_2232);
    float _3001 = _2965;
    if (_2831)
    {
        float _3003 = _2965 * 6.283185482025146484375;
        float _3005 = sin(_3003);
        _3001 = _3005;
    }
    float _3007 = _3001;
    int _3009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3011 = _3009 != 0;
    int _3013 = _2969 * _2991;
    int _3015 = _3013 + _2791;
    float _3017 = float(uint(_2973));
    int _3019 = ~_2262;
    int _3021 = _3019 + 1;
    bool _3023 = !_3011;
    float _3025 = _3023 ? _191 : as_type<float>(_2995);
    float _3027 = trunc(_2931);
    float _3029 = precise::max(_3027, 0.0);
    uint _3031 = uint(_3029);
    bool _3033 = uint(_3015) >= uint(_2262);
    float _3035 = as_type<float>(_2415) * _3017;
    int _3037 = _3021 * int(_2983);
    int _3039 = _3037 + _2597;
    bool _3041 = !_2999;
    int _3043 = _3041 ? 0 : (-1);
    int _3045 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3047 = _3045 != 0;
    float _3049 = trunc(_2997);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    float _3055 = float(uint(_3039));
    bool _3057 = !_3033;
    int _3059 = _3057 ? 0 : (-1);
    int _3061 = ~_2959;
    int _3063 = _3061 + _3043;
    int _3065 = _3063 + 1;
    float _3067 = as_type<float>(_2356) * _3055;
    bool _3069 = _3033;
    if (_2831)
    {
        bool _3071 = _3007 > 0.5;
        _3069 = _3071;
    }
    bool _3073 = _3069;
    float _3075 = trunc(_3035);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = ~_2302;
    int _3083 = _3081 + 1;
    int _3085 = _2232 * _3065;
    int _3087 = _3085 + _2755;
    int _3089 = ~_2991;
    int _3091 = _3089 + _3059;
    int _3093 = _3091 + 1;
    int _3095 = int(_2843) + int(_3031);
    int _3097 = ~_2302;
    int _3099 = _3097 + 1;
    int _3101 = _3083 * int(_3053);
    int _3103 = _3101 + _2919;
    if (!_2831)
    {
        _2449 = _195;
    }
    float _3105 = _2449;
    int _3107 = _2262 * _3093;
    int _3109 = _3107 + _2791;
    bool _3111 = !_2529;
    int _3113 = _3111 ? _3087 : (-1);
    float _3115 = trunc(_3067);
    float _3117 = precise::max(_3115, 0.0);
    uint _3119 = uint(_3117);
    float _3121 = float(uint(_3103));
    float _3123 = _3105;
    if (_2831)
    {
        float _3125 = -_195;
        float _3127 = _3073 ? _3125 : _195;
        _3123 = _3127;
    }
    float _3129 = _3123;
    int _3131 = _3099 * int(_3079);
    int _3133 = _3131 + _2973;
    int _3135 = _3113 & 3;
    bool _3137 = _3135 != 0;
    float _3139 = as_type<float>(_2415) * _3121;
    int _3141 = ~_2232;
    int _3143 = _3141 + 1;
    float _3145 = -_195;
    int _3147 = _2280 ? as_type<int>(_3145) : as_type<int>(_195);
    float _3149 = trunc(_3139);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    float _3155 = float(uint(_3133));
    int _3157 = _3143 * _3095;
    int _3159 = _3157 + _2559;
    bool _3161 = uint(_3135) > 1u;
    int _3163 = _3113 & 3;
    bool _3165 = _3163 != 0;
    float _3167 = as_type<float>(_2415) * _3155;
    bool _3169 = !_2577;
    int _3171 = _3169 ? _3109 : (-1);
    int _3173 = _3165 ? 0 : 1;
    int _3175 = _3171 & 3;
    bool _3177 = _3175 != 0;
    float _3179 = trunc(_3167);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    bool _3185 = !_3047;
    float _3187 = _3185 ? _195 : as_type<float>(_3147);
    bool _3189 = uint(_3159) >= uint(_2232);
    int _3191 = ~_3173;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3195;
    if (!_3161)
    {
        int _3199 = ~_3173;
        int _3201 = _3199 + 1;
        _3197 = _3201;
    }
    int _3203 = _3197;
    bool _3205 = uint(_3175) > 1u;
    bool _3207 = !_3189;
    int _3209 = _3207 ? 0 : (-1);
    int _3211 = _3171 & 3;
    bool _3213 = _3211 != 0;
    int _3215 = ~_2262;
    int _3217 = _3215 + 1;
    int _3219 = _3213 ? 0 : 1;
    int _3221 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3223 = _3221 != 0;
    int _3225 = int(_2983) + int(_3119);
    int _3227 = ~_3219;
    int _3229 = _3227 + 1;
    int _3231 = _3229 + 1;
    int _3233 = _3231;
    if (!_3205)
    {
        int _3235 = ~_3219;
        int _3237 = _3235 + 1;
        _3233 = _3237;
    }
    int _3239 = _3233;
    int _3241 = _3217 * _3225;
    int _3243 = _3241 + _2597;
    bool _3245 = !_3177;
    int _3247 = _3245 ? 0 : 1;
    bool _3249 = _3175 != 3;
    int _3251 = int(_3079) + int(_3183);
    int _3253 = int(_3053) + int(_3153);
    int _3255 = ~_2302;
    int _3257 = _3255 + 1;
    bool _3259 = uint(_3175) >= 2u;
    int _3261 = _3257 * _3251;
    int _3263 = _3261 + _2973;
    int _3265 = ~_2302;
    int _3267 = _3265 + 1;
    int _3269 = _3259 ? 0 : 1;
    float _3271 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3275 = uint(_3243) >= uint(_2262);
    int _3277 = _3267 * _3253;
    int _3279 = _3277 + _2919;
    float _3281 = 1.0 / _3273;
    int _3283 = ~_3269;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    int _3289 = _3287;
    if (_3249)
    {
        int _3291 = ~_3269;
        int _3293 = _3291 + 1;
        _3289 = _3293;
    }
    int _3295 = _3289;
    float _3297 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3299 = _3297 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3301 = uint(_3263) >= uint(_2302);
    bool _3303 = !_3275;
    int _3305 = _3303 ? 0 : (-1);
    float _3307 = 1.0 / _3299;
    bool _3309 = uint(_3279) >= uint(_2302);
    bool _3311 = !_3301;
    int _3313 = _3311 ? 0 : (-1);
    bool _3315 = _789 > 0.5;
    bool _3317 = !_3309;
    int _3319 = _3317 ? 0 : (-1);
    bool _3321 = _3175 != 3;
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3325 = _3323 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3327 = -_191;
    int _3329 = _3315 ? as_type<int>(_3327) : as_type<int>(_191);
    float _3331 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3333 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3331;
    bool _3335 = !_3321;
    int _3337 = _3335 ? 0 : (-1);
    float _3339 = 1.0 / _3325;
    bool _3341 = !_3223;
    float _3343 = _3341 ? _191 : as_type<float>(_3329);
    float _3345 = _3333 * _3281;
    int _3347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3349 = _3347 != 0;
    float _3351 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3353 = _3351 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3357 = _3355 != 0;
    int _3359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3361 = _3359 != 0;
    float _3363 = _3353 * _3307;
    bool _3365 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3367 = isnan(_699);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3373 = _3369 || _3371;
    float _3375 = float(_3373);
    float _3377 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3377;
    bool _3381 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3383 = isnan(_699);
    bool _3385 = _3381 || _3383;
    bool _3387 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3389 = _3385 || _3387;
    float _3391 = float(_3389);
    float _3393 = -_3375;
    float _3395 = _3393 + 1.0;
    bool _3397 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3399 = isnan(_699);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3405 = _3401 || _3403;
    float _3407 = float(_3405);
    float _3409 = -_3391;
    float _3411 = _3409 + 1.0;
    float _3413 = _3379 * _3339;
    float _3415 = _3391 * _3395;
    float _3417 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3419 = _3417 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3421 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3423 = isnan(_699);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3429 = _3425 || _3427;
    float _3431 = float(_3429);
    float _3433 = _3407 * _3411;
    float _3435 = -_3407;
    float _3437 = _3435 + 1.0;
    float _3439 = -_2593;
    float _3441 = _3439 + 1.0;
    float _3443 = 1.0 / _3419;
    float _3445 = -_3431;
    float _3447 = _3445 + 1.0;
    float _3449 = _3431 * _3437;
    float _3451 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3453 = _3451 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3455 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3457 = isnan(_699);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = _2340 * _3441;
    float _3469 = -_2340;
    float _3471 = _3469 + 1.0;
    bool _3473 = _699 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3475 = isnan(_699);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3481 = _3477 || _3479;
    float _3483 = float(_3481);
    float _3485 = 1.0 / _3453;
    float _3487 = _2593 * _3447;
    float _3489 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3491 = _699 + _3489;
    float _3493 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3495 = _3493 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3497 = _3465 * _3471;
    float _3499 = -_3465;
    float _3501 = _3499 + 1.0;
    float _3503 = fma(_3345, _3491, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3505 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3507 = _3505 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3509 = 1.0 / _3495;
    float _3511 = _3483 * _3501;
    float _3513 = _3507 * _3443;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3517 = _699 + _3515;
    float _3519 = _3503 * _3511;
    float _3521 = -_3483;
    float _3523 = _3521 + 1.0;
    float _3525 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3527 = _3525 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3529 = fma(_3363, _3517, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3533 = _699 + _3531;
    float _3535 = fma(_3523, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3519);
    float _3537 = _3527 * _3485;
    float _3539 = abs(_1761);
    float _3541 = log2(_3539);
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3545 = _699 + _3543;
    float _3547 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3549 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3547;
    float _3551 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3551;
    float _3555 = fma(_3529, _3497, _3535);
    float _3557 = fma(_3413, _3545, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3559 = fma(_3513, _3533, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3561 = _3549 * _3509;
    float _3563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3565 = _3553 * _2957;
    float _3567 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3569 = _699 + _3567;
    float _3571 = fma(_3557, _3467, _3555);
    float _3573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3575 = _699 + _3573;
    float _3577 = _2825 + 0.5;
    float _3579 = fma(_3565, _3569, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3581 = fma(_3559, _3487, _3571);
    float _3583 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3585 = _3129 + (-0.5);
    float _3587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3589 = _699 + _3587;
    float _3591 = fma(_3537, _3575, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3593 = fma(_3579, _3449, _3581);
    float _3595 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1055);
    float _3597 = -_3585;
    float _3599 = -_1323;
    float _3601 = fma(_3597, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3599);
    float _3603 = -_1033;
    float _3605 = _3603 + 1.0;
    float _3607 = _3343 + 0.5;
    float _3609 = exp2(_3583);
    float _3611 = -_869;
    float _3613 = _3611 + 1.0;
    float _3615 = _3187 + (-0.5);
    float _3617 = fma(_3591, _3433, _3593);
    float _3619 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[80].x, _923);
    float _3621 = -_3605;
    float _3623 = fma(_3621, _2825, _3595);
    float _3625 = fma(_3613, _3129, _3601);
    float _3627 = -_3615;
    float _3629 = -_1067;
    float _3631 = fma(_3627, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3629);
    float _3633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3635 = _3563 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3637 = _3025 + 0.5;
    int _3639 = _3171 >> 31;
    out.m_74.x = _3623;
    out.m_74.y = _3625;
    int _3641 = ~_3251;
    int _3643 = _3641 + _3313;
    int _3645 = _3643 + 1;
    float _3647 = fma(_3635, _3637, _1145);
    int _3649 = _3639 & 3;
    float _3651 = _1625 + (-0.5);
    float _3653 = -_2242;
    float _3655 = fma(_3025, _3653, _3647);
    int _3657 = _3171 + _3649;
    float _3659 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3661 = int(_3659);
    float _3663 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3665 = precise::clamp(_3663, 0.0, 1.0);
    int _3667 = _3657 >> 2;
    float _3669 = _3633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3671 = -_1321;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3665, -2.0, 3.0);
    float _3677 = _3665 * _3665;
    float _3679 = -_3669;
    float _3681 = -_1213;
    float _3683 = fma(_3679, _3651, _3681);
    int _3685 = _3667 << 4;
    int _3687 = _3685 + 656;
    float _3689 = -_2250;
    float _3691 = fma(_3343, _3689, _3619);
    float _3693 = _3677 * _3675;
    float _3695 = fma(_3187, _3673, _3631);
    uint _3697 = uint(int(uint(_3687) >> uint(2)));
    uint _3699 = uint(int(uint(int(_3697)) >> uint(2)));
    int _3701 = int(_3697) & 3;
    float _3703 = (*spvDescriptorSet0.vp_c9)._m0[int(_3699)][_3701];
    int _3705 = int(_3697) + 1;
    uint _3707 = uint(int(uint(_3705) >> uint(2)));
    int _3709 = _3705 & 3;
    float _3711 = (*spvDescriptorSet0.vp_c9)._m0[int(_3707)][_3709];
    float _3713 = fma(_1625, _2258, _3683);
    float _3715 = -_3693;
    float _3717 = _3715 + 1.0;
    float _3719 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3721 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3723 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3725 = fma(_3717, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3693);
    out.m_76.x = _3691;
    out.m_76.y = _3695;
    out.m_76.z = _3655;
    out.m_76.w = _3713;
    int _3727 = _3687 + 8;
    uint _3729 = uint(int(uint(_3727) >> uint(2)));
    uint _3731 = uint(int(uint(int(_3729)) >> uint(2)));
    int _3733 = int(_3729) & 3;
    float _3735 = (*spvDescriptorSet0.vp_c9)._m0[int(_3731)][_3733];
    int _3737 = int(_3729) + 1;
    uint _3739 = uint(int(uint(_3737) >> uint(2)));
    int _3741 = _3737 & 3;
    float _3743 = (*spvDescriptorSet0.vp_c9)._m0[int(_3739)][_3741];
    float _3745 = -_1507;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3719);
    float _3749 = -_1507;
    float _3751 = fma(_3749, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3721);
    float _3753 = -_1507;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3723);
    int _3757 = ~_3253;
    int _3759 = _3757 + _3319;
    int _3761 = _3759 + 1;
    float _3763 = fma(_3561, _3589, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3765 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3751);
    int _3767 = ~_3225;
    int _3769 = _3767 + _3305;
    int _3771 = _3769 + 1;
    int _3773 = _2302 * _3645;
    int _3775 = _3773 + _2973;
    float _3777 = fma(_3763, _3415, _3617);
    int _3779 = _2302 * _3761;
    int _3781 = _3779 + _2919;
    float _3783 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3785 = _2262 * _3771;
    int _3787 = _3785 + _2597;
    float _3789 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3791 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3793 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3795 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3797 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3789);
    int _3799 = abs(_3239);
    float _3801 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3791);
    float _3803 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3793);
    bool _3805 = !_3357;
    int _3807 = _3805 ? 0 : 1;
    float _3809 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3811 = ~_3799;
    int _3813 = _3811 + 1;
    int _3815 = _3813 + 1;
    float _3817 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3801);
    int _3819 = abs(_3247);
    float _3821 = _1539 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3823 = uint(_3135) >= 2u;
    float _3825 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3795);
    int _3827 = ~_3819;
    int _3829 = _3827 + 1;
    int _3831 = _3829 + 1;
    float _3833 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3809);
    int _3835 = abs(_3807);
    float _3837 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3821);
    int _3839 = abs(_3337);
    float _3841 = fma(_3375, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3777);
    int _3843 = _3823 ? 0 : 1;
    float _3845 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3833);
    bool _3847 = _3135 != 3;
    float _3849 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3837);
    int _3851 = ~_3839;
    int _3853 = _3851 + 1;
    int _3855 = _3853 + 1;
    int _3857 = _3815 * as_type<int>(_3711);
    int _3859 = abs(_3295);
    float _3861 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3747);
    bool _3863 = !_2783;
    int _3865 = _3863 ? _3775 : (-1);
    int _3867 = _3831 * as_type<int>(_3703);
    int _3869 = _3867 + _3857;
    int _3871 = ~_3859;
    int _3873 = _3871 + 1;
    int _3875 = _3873 + 1;
    float _3877 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3755);
    int _3879 = _3113 >> 31;
    out.m_78.x = _3841;
    int _3881 = ~_3843;
    int _3883 = _3881 + 1;
    int _3885 = _3883 + 1;
    int _3887 = _3875 * as_type<int>(_3735);
    int _3889 = _3887 + _3869;
    int _3891 = _3879 & 3;
    int _3893 = ~_3835;
    int _3895 = _3893 + 1;
    int _3897 = _3895 + 1;
    int _3899 = _3855 * as_type<int>(_3743);
    int _3901 = _3899 + _3889;
    int _3903 = _3113 + _3891;
    float _3905 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3797);
    int _3907 = abs(_3661);
    int _3909 = _3901 * _3897;
    float _3911 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3803);
    float _3913 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3825);
    float _3915 = float(uint(_3661));
    float _3917 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3919 = _3903 >> 2;
    float _3921 = _3917 * _3861;
    int _3923 = _3885;
    if (_3847)
    {
        int _3925 = ~_3843;
        int _3927 = _3925 + 1;
        _3923 = _3927;
    }
    int _3929 = _3923;
    float _3931 = 1.0 / _3915;
    int _3933 = _3865 >> 31;
    float _3935 = fma(_3783, _3911, _3921);
    bool _3937 = !_2577;
    int _3939 = _3937 ? _3787 : (-1);
    out.m_80.x = _3911;
    out.m_80.y = _3905;
    out.m_80.z = _3913;
    int _3941 = _3865 & 3;
    bool _3943 = _3941 != 0;
    float _3945 = _3817 + _3935;
    float _3947 = float(uint(_3907));
    int _3949 = _3939 * _3835;
    int _3951 = _3949 + _3909;
    int _3953 = _3919 << 4;
    int _3955 = _3953 + 368;
    float _3957 = _3917 * _3765;
    int _3959 = _3865 & 3;
    bool _3961 = _3959 != 0;
    int _3963 = _3933 & 3;
    uint _3965 = uint(int(uint(_3955) >> uint(2)));
    uint _3967 = uint(int(uint(int(_3965)) >> uint(2)));
    int _3969 = int(_3965) & 3;
    float _3971 = (*spvDescriptorSet0.vp_c9)._m0[int(_3967)][_3969];
    int _3973 = int(_3965) + 1;
    uint _3975 = uint(int(uint(_3973) >> uint(2)));
    int _3977 = _3973 & 3;
    float _3979 = (*spvDescriptorSet0.vp_c9)._m0[int(_3975)][_3977];
    int _3981 = _3943 ? 0 : 1;
    float _3983 = 1.0 / _3947;
    bool _3985 = uint(_3959) > 1u;
    float _3987 = fma(_3783, _3905, _3957);
    int _3989 = _3865 + _3963;
    int _3991 = abs(_3951);
    int _3993 = _3989 >> 2;
    int _3995 = ~_3981;
    int _3997 = _3995 + 1;
    int _3999 = _3997 + 1;
    int _4001 = _3993 << 4;
    int _4003 = _4001 + 800;
    bool _4005 = _1761 <= 8000.0;
    bool _4007 = isnan(_1761);
    bool _4009 = _4005 || _4007;
    bool _4011 = isnan(8000.0);
    bool _4013 = _4009 || _4011;
    float _4015 = float(_4013);
    int _4017 = _3999;
    if (!_3985)
    {
        int _4019 = ~_3981;
        int _4021 = _4019 + 1;
        _4017 = _4021;
    }
    int _4023 = _4017;
    uint _4025 = uint(int(uint(_4003) >> uint(2)));
    uint _4027 = uint(int(uint(int(_4025)) >> uint(2)));
    int _4029 = int(_4025) & 3;
    float _4031 = (*spvDescriptorSet0.vp_c9)._m0[int(_4027)][_4029];
    int _4033 = int(_4025) + 1;
    uint _4035 = uint(int(uint(_4033) >> uint(2)));
    int _4037 = _4033 & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = as_type<int>(_3931) + (-2);
    float _4043 = _4015 * _3725;
    float _4045 = float(uint(_3951));
    int _4047 = ~_3095;
    int _4049 = _4047 + _3209;
    int _4051 = _4049 + 1;
    float _4053 = as_type<float>(_4041) * _4045;
    int _4055 = as_type<int>(_3983) + (-2);
    int _4057 = _3955 + 8;
    uint _4059 = uint(int(uint(_4057) >> uint(2)));
    uint _4061 = uint(int(uint(int(_4059)) >> uint(2)));
    int _4063 = int(_4059) & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = int(_4059) + 1;
    uint _4069 = uint(int(uint(_4067) >> uint(2)));
    int _4071 = _4067 & 3;
    float _4073 = (*spvDescriptorSet0.vp_c9)._m0[int(_4069)][_4071];
    float _4075 = float(uint(_3991));
    int _4077 = _2232 * _4051;
    int _4079 = _4077 + _2559;
    float _4081 = _3917 * _3877;
    float _4083 = trunc(_4053);
    float _4085 = precise::max(_4083, 0.0);
    uint _4087 = uint(_4085);
    bool _4089 = !_3137;
    int _4091 = _4089 ? 0 : 1;
    float _4093 = as_type<float>(_4055) * _4075;
    bool _4095 = uint(_3959) >= 2u;
    int _4097 = _4003 + 8;
    uint _4099 = uint(int(uint(_4097) >> uint(2)));
    uint _4101 = uint(int(uint(int(_4099)) >> uint(2)));
    int _4103 = int(_4099) & 3;
    float _4105 = (*spvDescriptorSet0.vp_c9)._m0[int(_4101)][_4103];
    int _4107 = int(_4099) + 1;
    uint _4109 = uint(int(uint(_4107) >> uint(2)));
    int _4111 = _4107 & 3;
    float _4113 = (*spvDescriptorSet0.vp_c9)._m0[int(_4109)][_4111];
    bool _4115 = _3959 != 3;
    float _4117 = fma(_3783, _3913, _4081);
    int _4119 = ~_3661;
    int _4121 = _4119 + 1;
    float _4123 = trunc(_4093);
    float _4125 = precise::max(_4123, 0.0);
    uint _4127 = uint(_4125);
    int _4129 = _4095 ? 0 : 1;
    bool _4131 = _3135 != 3;
    int _4133 = ~_3907;
    int _4135 = _4133 + 1;
    int _4137 = abs(_3203);
    int _4139 = _4121 * int(_4087);
    int _4141 = _4139 + _3951;
    float _4143 = fma(_3917, _3917, 1.0);
    int _4145 = ~_4137;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    int _4151 = ~_4129;
    int _4153 = _4151 + 1;
    int _4155 = _4153 + 1;
    int _4157 = _4155;
    if (_4115)
    {
        int _4159 = ~_4129;
        int _4161 = _4159 + 1;
        _4157 = _4161;
    }
    int _4163 = _4157;
    int _4165 = _4135 * int(_4127);
    int _4167 = _4165 + _3991;
    float _4169 = float(uint(_4141));
    int _4171 = _4149 * as_type<int>(_3979);
    bool _4173 = !_3961;
    int _4175 = _4173 ? 0 : 1;
    float _4177 = rsqrt(_4143);
    int _4179 = abs(_4091);
    float _4181 = as_type<float>(_4041) * _4169;
    float _4183 = float(uint(_4167));
    int _4185 = abs(_4175);
    int _4187 = abs(_4023);
    float _4189 = trunc(_4181);
    float _4191 = precise::max(_4189, 0.0);
    uint _4193 = uint(_4191);
    float _4195 = as_type<float>(_4055) * _4183;
    int _4197 = abs(_3929);
    int _4199 = abs(_4163);
    float _4201 = _3917 * _4177;
    int _4203 = ~_4187;
    int _4205 = _4203 + 1;
    int _4207 = _4205 + 1;
    float _4209 = trunc(_4195);
    float _4211 = precise::max(_4209, 0.0);
    uint _4213 = uint(_4211);
    int _4215 = ~_4179;
    int _4217 = _4215 + 1;
    int _4219 = _4217 + 1;
    int _4221 = ~_4185;
    int _4223 = _4221 + 1;
    int _4225 = _4223 + 1;
    int _4227 = _4207 * as_type<int>(_4039);
    int _4229 = _4219 * as_type<int>(_3971);
    int _4231 = _4229 + _4171;
    int _4233 = _4225 * as_type<int>(_4031);
    int _4235 = _4233 + _4227;
    int _4237 = ~_4197;
    int _4239 = _4237 + 1;
    int _4241 = _4239 + 1;
    int _4243 = ~_4199;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    bool _4249 = _3959 != 3;
    int _4251 = _4241 * as_type<int>(_4065);
    int _4253 = _4251 + _4231;
    float _4255 = -_3817;
    float _4257 = _4201 * _4255;
    int _4259 = _4247 * as_type<int>(_4105);
    int _4261 = _4259 + _4235;
    float _4263 = -_3845;
    float _4265 = _4201 * _4263;
    bool _4267 = !_4131;
    int _4269 = _4267 ? 0 : (-1);
    float _4271 = fma(_4177, _3861, _4257);
    int _4273 = int(_4087) + int(_4193);
    float _4275 = fma(_4177, _3765, _4265);
    bool _4277 = !_4249;
    int _4279 = _4277 ? 0 : (-1);
    float _4281 = -_3849;
    float _4283 = _4201 * _4281;
    int _4285 = abs(_4269);
    int _4287 = ~_3661;
    int _4289 = _4287 + 1;
    int _4291 = abs(_4279);
    int _4293 = ~_3907;
    int _4295 = _4293 + 1;
    int _4297 = _4289 * _4273;
    int _4299 = _4297 + _3951;
    float _4301 = fma(_4177, _3877, _4283);
    int _4303 = int(_4127) + int(_4213);
    float _4305 = _3845 + _3987;
    float _4307 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _4309 = ~_4285;
    int _4311 = _4309 + 1;
    int _4313 = _4311 + 1;
    out.m_82.x = _4271;
    out.m_82.y = _4275;
    out.m_82.z = _4301;
    bool _4315 = uint(_4299) >= uint(_3661);
    int _4317 = _4295 * _4303;
    int _4319 = _4317 + _3991;
    int _4321 = ~_4291;
    int _4323 = _4321 + 1;
    int _4325 = _4323 + 1;
    int _4327 = _4313 * as_type<int>(_4073);
    int _4329 = _4327 + _4253;
    bool _4331 = !_3349;
    int _4333 = _4331 ? 0 : 1;
    float _4335 = _2989 * _4307;
    float _4337 = precise::clamp(_4335, 0.0, 1.0);
    bool _4339 = !_4315;
    int _4341 = _4339 ? 0 : (-1);
    int _4343 = _4325 * as_type<int>(_4113);
    int _4345 = _4343 + _4261;
    bool _4347 = uint(_4319) >= uint(_3907);
    int _4349 = _3951 ^ _3661;
    int _4351 = abs(_4333);
    float _4353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4355 = ~_4273;
    int _4357 = _4355 + _4341;
    int _4359 = _4357 + 1;
    bool _4361 = !_4347;
    int _4363 = _4361 ? 0 : (-1);
    uint _4365 = uint(int(uint(_4349) >> uint(31)));
    int _4367 = _3661 * _4359;
    int _4369 = _4367 + _3951;
    int _4371 = ~_4351;
    int _4373 = _4371 + 1;
    int _4375 = _4373 + 1;
    int _4377 = ~_4363;
    int _4379 = _4303 + _4377;
    int _4381 = _4379 + 1;
    int _4383 = ~int(_4365);
    int _4385 = _4383 + 1;
    int _4387 = _4329 * _4375;
    bool _4389 = _3661 == 0;
    float _4391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4393 = !_3361;
    int _4395 = _4393 ? 0 : 1;
    int _4397 = _4381 ^ _4385;
    bool _4399 = !_4389;
    int _4401 = _4399 ? _4369 : (-1);
    float _4403 = _3849 + _4117;
    int _4405 = abs(_4395);
    int _4407 = ~_4385;
    int _4409 = _4407 + _4397;
    int _4411 = _4409 + 1;
    float _4413 = float(_4401);
    float _4415 = _4353 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4417 = ~_4405;
    int _4419 = _4417 + 1;
    int _4421 = _4419 + 1;
    out.m_84.x = _3945;
    out.m_84.y = _4305;
    out.m_84.z = _4403;
    bool _4423 = _3661 == 0;
    float _4425 = fma(_4415, _4413, _1327);
    float _4427 = _981 + 0.5;
    int _4429 = _4345 * _4421;
    bool _4431 = !_4423;
    int _4433 = _4431 ? _4411 : (-1);
    float _4435 = fma(_4415, _4427, _4425);
    bool _4437 = !_2783;
    int _4439 = _4437 ? _3781 : (-1);
    float _4441 = in.m_86.x;
    float _4443 = float(_4433);
    float _4445 = _4391 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4447 = _965 + (-0.5);
    int _4449 = _4439 * _4405;
    int _4451 = _4449 + _4429;
    bool _4453 = !_2529;
    int _4455 = _4453 ? _4079 : (-1);
    float _4457 = -_1329;
    float _4459 = fma(_4445, _4443, _4457);
    float _4461 = -_2278;
    float _4463 = fma(_981, _4461, _4435);
    float _4465 = _2133 * 0.5;
    float _4467 = float(_4451);
    float _4469 = -_4445;
    float _4471 = fma(_4469, _4447, _4459);
    int _4473 = _4455 * _4351;
    int _4475 = _4473 + _4387;
    float _4477 = _2312 + _2133;
    float _4479 = fma(_2173, -0.5, _4465);
    float _4481 = fma(_965, _2290, _4471);
    out.m_88.w = _4467;
    float _4483 = float(_4475);
    float _4485 = _2171 + _2133;
    float _4487 = -_4337;
    float _4489 = fma(_4487, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4491 = _4477 * 0.5;
    float _4493 = _4485 * 0.5;
    out.m_90.x = _4463;
    out.m_90.y = _4481;
    float _4495 = _2751 * _2207;
    float _4497 = _4489 * _4441;
    float _4499 = -_2751;
    float _4501 = _4499 + 1.0;
    out.m_92.x = _4493;
    out.m_92.y = _4479;
    out.m_92.z = _4491;
    out.m_92.w = _2133;
    float _4503 = _2218 * _4495;
    float _4505 = _2228 * _4495;
    float _4507 = _4497 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4509 = _2218 * _4501;
    float _4511 = fma(_2224, _4503, _2212);
    float _4513 = fma(_2226, _4503, _2214);
    float _4515 = fma(_2218, _4505, _2216);
    out.m_94.x = _4507;
    bool _4517 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4519 = isnan(_1901);
    bool _4521 = _4517 || _4519;
    bool _4523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4525 = _4521 || _4523;
    float _4527 = _1871 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4511;
    out.m_96.y = _4513;
    out.m_96.z = _4515;
    out.m_96.w = _4509;
    out.m_88.x = _4483;
    float _4529 = _4497;
    float _4531 = _4495;
    float _4533 = _4483;
    float _4535 = _4503;
    if (!_4525)
    {
        _2451 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4537 = _2451;
    float _4539 = _4537;
    float _4541 = _4537;
    if (!_4525)
    {
        _2453 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4543 = _2453;
    float _4545 = _4543;
    float _4547 = _4543;
    if (!_4525)
    {
        _4529 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4549 = _4529;
    float _4551 = _4549;
    float _4553 = _4549;
    if (!_4525)
    {
        _4531 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4555 = _4531;
    float _4557 = _4555;
    float _4559 = _4555;
    if (!_4525)
    {
        _4533 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4561 = _4533;
    float _4563 = _4561;
    float _4565 = _4561;
    if (!_4525)
    {
        _4535 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4567 = _4535;
    bool _4569 = !_4525;
    float _4571 = _4567;
    float _4573 = _4567;
    if (!_4569)
    {
        bool _4575 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4577 = isnan(_1901);
        bool _4579 = _4575 || _4577;
        bool _4581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4583 = _4579 || _4581;
        if (!_4583)
        {
            float _4585 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4587 = _1901 + _4585;
            float _4589 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4591 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4589;
            float _4593 = 1.0 / _4591;
            float _4595 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4597 = _4595 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4599 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4601 = _4599 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4603 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4605 = _4603 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4607 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4609 = _4607 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4611 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4613 = _4611 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4615 = _4587 * _4593;
            float _4617 = precise::clamp(_4615, 0.0, 1.0);
            float _4619 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4621 = _4619 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4623 = fma(_4617, _4597, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4625 = fma(_4617, _4621, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4627 = fma(_4617, _4601, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4629 = fma(_4617, _4605, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4631 = fma(_4617, _4609, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4633 = fma(_4617, _4613, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4547 = _4625;
            _4565 = _4631;
            _4541 = _4623;
            _4559 = _4629;
            _4553 = _4627;
            _4573 = _4633;
            _4635 = true;
        }
        else
        {
            bool _4637 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4639 = isnan(_1901);
            bool _4641 = _4637 || _4639;
            bool _4643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4645 = _4641 || _4643;
            if (!_4645)
            {
                _4539 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4647 = _4539;
            _4541 = _4647;
            if (!_4645)
            {
                _4545 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4649 = _4545;
            _4547 = _4649;
            if (!_4645)
            {
                _4551 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4651 = _4551;
            _4553 = _4651;
            if (!_4645)
            {
                _4557 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4653 = _4557;
            _4559 = _4653;
            if (!_4645)
            {
                _4563 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4655 = _4563;
            _4565 = _4655;
            if (!_4645)
            {
                _4571 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4657 = _4571;
            bool _4659 = !_4645;
            _4573 = _4657;
            if (!_4659)
            {
                bool _4661 = _1901 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4663 = isnan(_1901);
                bool _4665 = _4661 || _4663;
                bool _4667 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4669 = _4665 || _4667;
                if (!_4669)
                {
                    float _4671 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4673 = _1901 + _4671;
                    float _4675 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4677 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4675;
                    float _4679 = 1.0 / _4677;
                    float _4681 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4683 = _4681 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4685 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4687 = _4685 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4689 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4691 = _4689 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4693 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4695 = _4693 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4697 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4699 = _4697 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4701 = _4673 * _4679;
                    float _4703 = precise::clamp(_4701, 0.0, 1.0);
                    float _4705 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4707 = _4705 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4709 = fma(_4703, _4683, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4711 = fma(_4703, _4707, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4713 = fma(_4703, _4687, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4715 = fma(_4703, _4691, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4717 = fma(_4703, _4695, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4719 = fma(_4703, _4699, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4547 = _4711;
                    _4565 = _4717;
                    _4541 = _4709;
                    _4559 = _4715;
                    _4553 = _4713;
                    _4573 = _4719;
                    _4635 = true;
                }
                else
                {
                    _4547 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4565 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4541 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4559 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4553 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4573 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4635 = false;
    float _4721 = _4547;
    float _4723 = _4565;
    float _4725 = _4541;
    float _4727 = _4559;
    float _4729 = _4553;
    float _4731 = _4573;
    float _4733 = fma(_4305, -0.5, 0.5);
    float _4735 = precise::clamp(_4733, 0.0, 1.0);
    float _4737 = -_4721;
    float _4739 = _4737 + _4723;
    float _4741 = -_4725;
    float _4743 = _4741 + _4727;
    out.m_98.x = 0.0;
    float _4745 = fma(_4735, _4739, _4721);
    float _4747 = -_4729;
    float _4749 = _4747 + _4731;
    float _4751 = fma(_4735, _4743, _4725);
    float _4753 = _4745 * 0.586610972881317138671875;
    bool _4755 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4757 = fma(_4735, _4749, _4729);
    float _4759 = _4527 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4761 = fma(_4751, 0.298911988735198974609375, _4753);
    bool _4763 = _1871 > 0.0;
    bool _4765 = isnan(_1871);
    bool _4767 = _4763 || _4765;
    bool _4769 = isnan(0.0);
    bool _4771 = _4767 || _4769;
    float _4773 = fma(_4757, 0.114477999508380889892578125, _4761);
    out.m_53.x = _4759;
    float _4775 = -_4773;
    float _4777 = _4751 + _4775;
    float _4779 = -_4773;
    float _4781 = _4745 + _4779;
    float _4783 = -_4773;
    float _4785 = _4757 + _4783;
    float _4787 = fma(_4777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    float _4789 = fma(_4781, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    float _4791 = fma(_4785, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4773);
    bool _4793 = !_4755;
    if (!_4793)
    {
        float _4795 = -_1815;
        float _4797 = _4795 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4799 = -_1817;
        float _4801 = _4799 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4803 = -_1819;
        float _4805 = _4803 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4807 = _4797 * _4797;
        float _4809 = fma(_4801, _4801, _4807);
        float _4811 = fma(_4805, _4805, _4809);
        float _4813 = sqrt(_4811);
        float _4815 = rsqrt(_4811);
        float _4817 = -_4813;
        float _4819 = _4817 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4821 = _4819 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4823 = precise::clamp(_4821, 0.0, 1.0);
        float _4825 = _4801 * _4815;
        float _4827 = _4797 * _4815;
        float _4829 = abs(_4823);
        float _4831 = log2(_4829);
        float _4833 = _4805 * _4815;
        float _4835 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4837 = _4305 * _4827;
        float _4839 = -_4827;
        float _4841 = -_4835;
        float _4843 = fma(_4839, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4841);
        float _4845 = fma(_3945, _4825, _4837);
        float _4847 = -_4833;
        float _4849 = fma(_4847, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4843);
        float _4851 = fma(_4403, _4833, _4845);
        float _4853 = precise::clamp(_4851, 0.0, 1.0);
        float _4855 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4857 = _4849 + _4855;
        float _4859 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4861 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4863 = precise::clamp(_4861, 0.0, 1.0);
        float _4865 = exp2(_4859);
        float _4867 = _4865 * _4863;
        float _4869 = _4853 * _4867;
        float _4871 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4873 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4875 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4871;
        out.m_98.y = _4873;
        out.m_98.z = _4875;
    }
    out.m_100.x = _4787;
    out.m_100.y = _4789;
    out.m_100.z = _4791;
    if (_4771)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4877 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4877;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

