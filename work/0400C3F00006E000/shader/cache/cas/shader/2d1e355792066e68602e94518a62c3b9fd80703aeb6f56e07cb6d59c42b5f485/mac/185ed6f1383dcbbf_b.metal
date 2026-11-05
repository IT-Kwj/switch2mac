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
    bool _4673 = false;
    bool _589 = false;
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
        float _4984 = as_type<float>(_143);
        out.gl_Position.z = _4984;
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
        float _5047 = as_type<float>(_175);
        out.gl_Position.z = _5047;
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
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _439 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_409);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = 1.0 / _417;
    float _453 = -_429;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _457;
    bool _461 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _463 = isnan(_409);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _449 * _455;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _481 = 1.0 / _433;
    float _483 = _471 * _477;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _437;
    float _491 = _459 * _451;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _497 = fma(_491, _413, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _499 = _495 * _481;
    bool _501 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_409);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _409 + _517;
    float _521 = _497 * _483;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _409 + _523;
    float _527 = -_511;
    float _529 = _527 + 1.0;
    float _531 = fma(_499, _519, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _533 = _515 * _489;
    float _535 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _537 = _429 * _529;
    float _539 = fma(_533, _525, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _541 = fma(_531, _473, _535);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = fma(_539, _537, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _549 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[118].x, _545);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _559 = in.m_60.x;
    float _561 = in.m_60.y;
    float _563 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _549;
    out.m_62.y = _563;
    out.m_62.z = _555;
    out.m_62.w = _557;
    float _565 = _383 * _561;
    float _567 = _381 * _559;
    bool _569 = !_479;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _169;
    }
    _589 = false;
    float _591 = _587;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _595 = _591 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _601 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _603 = isnan(_591);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _617 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_591);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _635 = isnan(_591);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _599;
    float _647 = -_611;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _653 = 1.0 / _615;
    float _655 = _631 * _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _661 = -_643;
    float _663 = _661 + 1.0;
    float _665 = fma(_655, _595, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _667 = _627 * _649;
    float _669 = -_627;
    float _671 = _669 + 1.0;
    float _673 = _611 * _663;
    float _675 = _659 * _653;
    float _677 = _665 * _667;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _681 = _591 + _679;
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[131].x, _677);
    float _685 = fma(_675, _681, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _689 = fma(_685, _673, _683);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[133].x, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _697;
    out.m_64.y = _699;
    out.m_64.z = _701;
    out.m_64.w = _703;
    bool _705 = !_651;
    float _707 = _695;
    int _709 = as_type<int>(_697);
    int _711 = as_type<int>(_677);
    float _713 = _683;
    float _715 = _611;
    float _717 = _691;
    if (!_705)
    {
        float _719 = in.m_58.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _707 = _727;
        _171 = _733;
    }
    float _735 = _707;
    float _737 = _171;
    float _739 = in.m_58.z;
    float _741 = in.m_58.w;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _745 = _743 != 0;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _749 = _735;
    if (_745)
    {
        float _751 = in.m_58.x;
        float _753 = in.m_58.y;
        _747 = _751;
        _749 = _753;
    }
    float _755 = _747;
    float _757 = _749;
    float _759 = 0.0;
    if (_745)
    {
        _759 = 1.0;
    }
    float _761 = _759;
    float _763 = 0.0;
    float _765 = _761;
    if (_745)
    {
        _763 = 1.0;
    }
    float _767 = _763;
    float _769 = _767;
    if (_745)
    {
        _709 = 0;
    }
    int _771 = _709;
    int _773 = _771;
    if (_745)
    {
        _711 = 0;
    }
    int _775 = _711;
    float _777 = _739 * 2.0;
    float _779 = floor(_777);
    float _781 = 0.0;
    float _783 = _755;
    float _785 = _757;
    int _787 = _775;
    if (_745)
    {
        _781 = _755;
    }
    float _789 = _781;
    float _791 = _789;
    if (_745)
    {
        _713 = _757;
    }
    float _793 = _713;
    float _795 = _793;
    if (_745)
    {
        _715 = _789;
    }
    float _797 = _715;
    float _799 = _797;
    if (_745)
    {
        _717 = _789;
    }
    float _801 = _717;
    float _803 = _801;
    if (!_745)
    {
        float _805 = in.m_58.x;
        float _807 = in.m_58.y;
        float _809 = in.m_58.z;
        float _811 = _805 * 3.1415927410125732421875;
        float _813 = _811 * 0.15915493667125701904296875;
        float _815 = _807 * 3.1415927410125732421875;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = sin(_823);
        _783 = _805;
        _795 = _825;
        _785 = _807;
        _773 = 1;
        _787 = 2;
        _799 = _821;
        _769 = 5.839270114898681640625;
        _803 = _809;
        _765 = 7.345489978790283203125;
        _791 = _807;
    }
    float _827 = _783;
    float _829 = _795;
    float _831 = _785;
    int _833 = _773;
    int _835 = _787;
    float _837 = _799;
    float _839 = _769;
    float _841 = _803;
    float _843 = _765;
    float _845 = _791;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    float _851 = _827 * 2.0;
    bool _853 = _779 > 0.0;
    float _855 = _829 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _857 = _779 >= 0.0;
    bool _859 = isnan(_779);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = _831 * 2.0;
    float _869 = _165 * _125;
    float _871 = floor(_851);
    int _873 = _865 ? 0 : 1;
    float _875 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _879 = ~_873;
    int _881 = _879 + 1;
    int _883 = _881 + 1;
    float _885 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _887 = _883;
    float _889 = _855;
    if (!_853)
    {
        int _891 = ~_873;
        int _893 = _891 + 1;
        _887 = _893;
    }
    int _895 = _887;
    float _897 = _849 * _125;
    bool _899 = _833 != 1;
    float _901 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[93].w, _877);
    bool _903 = _739 > 0.5;
    float _905 = floor(_867);
    float _907 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _901);
    float _909 = -_195;
    int _911 = _903 ? as_type<int>(_909) : as_type<int>(_195);
    bool _913 = _871 > 0.0;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _917 = _871 >= 0.0;
    bool _919 = isnan(_871);
    bool _921 = _917 || _919;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    float _927 = exp2(_897);
    float _929 = _827 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _931 = _925 ? 0 : 1;
    float _933 = -_915;
    float _935 = fma(_929, 2.0, _933);
    bool _937 = _835 != 2;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _941 = ~_931;
    int _943 = _941 + 1;
    int _945 = _943 + 1;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _949 = int(_947);
    int _951 = _945;
    if (!_913)
    {
        int _953 = ~_931;
        int _955 = _953 + 1;
        _951 = _955;
    }
    int _957 = _951;
    float _959 = -_125;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[76].x, _935);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = -_927;
    float _975 = _973 + 1.0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _987 = _985 != 0;
    float _989 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[93].z, _939);
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _993 = _971 ? _975 : 0.0;
    float _995 = _837 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _997 = _831 > 0.5;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1001 = !_987;
    float _1003 = _1001 ? _195 : as_type<float>(_911);
    float _1005 = -_991;
    float _1007 = fma(_995, 2.0, _1005);
    float _1009 = -_191;
    int _1011 = _997 ? as_type<int>(_1009) : as_type<int>(_191);
    float _1013 = fma(_855, -2.0, _999);
    float _1015 = _831 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1017 = !_983;
    float _1019 = _1017 ? _191 : as_type<float>(_1011);
    float _1021 = _831 + _739;
    int _1023 = int(_899);
    int _1025 = _937 ? 2 : 0;
    int _1027 = _1023 | _1025;
    int _1029 = _997 ? 4 : 0;
    int _1031 = _1027 | _1029;
    int _1033 = _979 ? 8 : 0;
    int _1035 = _1031 | _1033;
    int _1037 = _983 ? 16 : 0;
    int _1039 = _1035 | _1037;
    int _1041 = _987 ? 32 : 0;
    int _1043 = _1039 | _1041;
    int _1045 = _903 ? 64 : 0;
    int _1047 = _1043 | _1045;
    int _1049 = _1047 & 64;
    float _1051 = _831 + _827;
    float _1053 = _1021 + (-1.0);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1065 = _1063 != 0;
    float _1067 = _1051 + (-1.0);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1071 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _989);
    bool _1073 = !_1061;
    float _1075 = _1073 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1079 = !_1057;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1085 = !_1065;
    int _1087 = _1085 ? 0 : 1;
    float _1089 = fma(_1015, -2.0, _1077);
    float _1091 = -_125;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1007);
    float _1095 = _999;
    float _1097 = _1015;
    float _1099 = _991;
    float _1101 = _1075;
    if (!_899)
    {
        _1095 = _739;
    }
    float _1103 = _1095;
    float _1105 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1089);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1117 = _1115 != 0;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1121 = _1103;
    if (!_899)
    {
        _889 = _831;
    }
    float _1123 = _889;
    float _1125 = _1123;
    if (_899)
    {
        _1121 = _831;
    }
    float _1127 = _1121;
    if (!_899)
    {
        _387 = _831;
    }
    float _1129 = _387;
    float _1131 = _1129;
    if (_899)
    {
        _1125 = _827;
    }
    float _1133 = _1125;
    float _1135 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1083);
    if (_899)
    {
        _1131 = _827;
    }
    float _1137 = _1131;
    float _1139 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = 0.0;
    if (!_899)
    {
        _1143 = _739;
    }
    float _1145 = _1143;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1119);
    float _1149 = _1145;
    if (_937)
    {
        _1097 = _831;
    }
    float _1151 = _1097;
    float _1153 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1155 = _1151;
    if (_937)
    {
        _1099 = _827;
    }
    float _1157 = _1099;
    float _1159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1161 = int(_1159);
    bool _1163 = !_1113;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = -_1141;
    float _1169 = fma(_1139, 2.0, _1167);
    bool _1171 = !_1109;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1135);
    bool _1177 = !_1117;
    int _1179 = _1177 ? 0 : 1;
    float _1181 = -_125;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1169);
    float _1185 = _1157;
    if (_899)
    {
        _1149 = _831;
    }
    float _1187 = _1149;
    if (!_937)
    {
        _1185 = _739;
    }
    float _1189 = _1185;
    if (!_937)
    {
        _1155 = _827;
    }
    float _1191 = _1155;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1203 = _1201 != 0;
    bool _1205 = _905 > 0.0;
    float _1207 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1209 = _905 >= 0.0;
    bool _1211 = isnan(_905);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1221 = int(_1219);
    bool _1223 = !_1195;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1231 = abs(_1225);
    float _1233 = float(_949);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1237 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1239 = float(_1161);
    float _1241 = 1.0 / _1233;
    float _1243 = float(_1221);
    float _1245 = fma(_1237, -2.0, _1227);
    float _1247 = fma(_1207, -2.0, _1235);
    float _1249 = float(_895);
    float _1251 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1245);
    int _1253 = int(_1205);
    int _1255 = _1217 ? 2 : 0;
    int _1257 = _1253 | _1255;
    int _1259 = _997 ? 4 : 0;
    int _1261 = _1257 | _1259;
    int _1263 = _979 ? 8 : 0;
    int _1265 = _1261 | _1263;
    int _1267 = _1195 ? 16 : 0;
    int _1269 = _1265 | _1267;
    int _1271 = _1199 ? 32 : 0;
    int _1273 = _1269 | _1271;
    int _1275 = _1203 ? 64 : 0;
    int _1277 = _1273 | _1275;
    int _1279 = _1277 & 4;
    float _1281 = 1.0 / _1243;
    float _1283 = in.m_66.x;
    float _1285 = in.m_66.y;
    float _1287 = in.m_66.z;
    bool _1289 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1291 = isnan(1.0);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1297 = _1293 || _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    float _1303 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1305 = float(_1231);
    float _1307 = 1.0 / _1239;
    float _1309 = -_1229;
    float _1311 = fma(_1303, 2.0, _1309);
    float _1313 = _1305 * _1249;
    float _1315 = _1241 * _125;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1319 = 1.0 / _1301;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1323 = !_1199;
    int _1325 = _1323 ? 0 : 1;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1329 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1317);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1333 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1321);
    float _1335 = float(_957);
    float _1337 = _1281 * _125;
    float _1339 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1331);
    int _1341 = abs(_1325);
    float _1343 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1327);
    float _1345 = _1313 * (-2.0);
    float _1347 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1329);
    float _1349 = float(_1341);
    float _1351 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1333);
    float _1353 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1339);
    float _1355 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1147);
    float _1357 = _1307 * _125;
    float _1359 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1343);
    float _1361 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1013);
    float _1363 = -_125;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1311);
    float _1367 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1247);
    float _1369 = _1349 * _1335;
    if (_1297)
    {
        float _1371 = _993 * _1319;
        _135 = _1371;
    }
    float _1373 = _135;
    float _1375 = _827 + (-0.5);
    float _1377 = fma(_1345, _1283, _1283);
    int _1379 = _1217 ? 0 : 1;
    float _1381 = fma(_1153, _1345, _1153);
    bool _1383 = !_1203;
    int _1385 = _1383 ? 0 : 1;
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1377);
    int _1389 = ~_1379;
    int _1391 = _1389 + 1;
    int _1393 = _1391 + 1;
    float _1395 = _831 + (-0.5);
    int _1397 = abs(_1385);
    float _1399 = in.m_46.x;
    float _1401 = in.m_46.y;
    float _1403 = in.m_46.z;
    int _1405 = _1393;
    float _1407 = _1373;
    if (!_1205)
    {
        int _1409 = ~_1379;
        int _1411 = _1409 + 1;
        _1405 = _1411;
    }
    int _1413 = _1405;
    float _1415 = _1369 * (-2.0);
    float _1417 = fma(_1381, _1373, _1387);
    float _1419 = fma(_1415, _1285, _1285);
    float _1421 = float(_1413);
    float _1423 = fma(_1069, _1415, _1069);
    float _1425 = float(_1397);
    float _1427 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1419);
    float _1429 = _827 + _739;
    float _1431 = _1417 * 0.15915493667125701904296875;
    float _1433 = _1425 * _1421;
    float _1435 = fma(_1423, _1373, _1427);
    float _1437 = in.m_68.x;
    float _1439 = in.m_68.y;
    float _1441 = in.m_68.z;
    float _1443 = in.m_68.w;
    float _1445 = _1429 + (-1.0);
    float _1447 = _1433 * (-2.0);
    float _1449 = _739 + (-0.5);
    float _1451 = in.m_70.x;
    float _1453 = in.m_70.y;
    float _1455 = in.m_70.z;
    float _1457 = in.m_70.w;
    float _1459 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1461 = fma(_1447, _1287, _1287);
    float _1463 = _1435 * 0.15915493667125701904296875;
    float _1465 = in.m_72.x;
    float _1467 = in.m_72.y;
    float _1469 = in.m_72.z;
    float _1471 = in.m_72.w;
    float _1473 = fma(_1459, _1447, _1459);
    float _1475 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1461);
    float _1477 = _1431 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1485 = fma(_1473, _1373, _1475);
    bool _1487 = _741 > 0.5;
    float _1489 = _875 * _1481;
    float _1491 = _885 * _1483;
    float _1493 = _1485 * 0.15915493667125701904296875;
    float _1495 = _1431 * 6.283185482025146484375;
    float _1497 = cos(_1495);
    float _1499 = _1401 * _1439;
    float _1501 = _1463 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    float _1505 = _1401 * _1453;
    float _1507 = fma(_1399, _1437, _1499);
    float _1509 = _1401 * _1467;
    float _1511 = fma(_1399, _1451, _1505);
    float _1513 = fma(_1403, _1441, _1507);
    float _1515 = _1463 * 6.283185482025146484375;
    float _1517 = cos(_1515);
    float _1519 = fma(_1399, _1465, _1509);
    float _1521 = fma(_1403, _1455, _1511);
    float _1523 = _1513 + _1443;
    float _1525 = fma(_1403, _1469, _1519);
    float _1527 = _1521 + _1457;
    float _1529 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1531 = _1493 * 6.283185482025146484375;
    float _1533 = cos(_1531);
    float _1535 = _1479 * _1503;
    float _1537 = _1525 + _1471;
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1529);
    float _1541 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1539);
    float _1543 = _1493 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = _1497 * _1517;
    float _1549 = _1479 * _1517;
    float _1551 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1553 = _1497 * _1533;
    float _1555 = _1497 * _1503;
    float _1557 = _1479 * _1533;
    float _1559 = _1517 * _1533;
    float _1561 = _1553 * _1489;
    float _1563 = _1503 * _1533;
    float _1565 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1567 = 1.0 / _1551;
    float _1569 = fma(_1545, _1547, _1535);
    float _1571 = -_1489;
    float _1573 = _1545 * _1571;
    float _1575 = -_1549;
    float _1577 = fma(_1545, _1555, _1575);
    float _1579 = -_1555;
    float _1581 = fma(_1545, _1549, _1579);
    float _1583 = fma(_1569, _1491, _1561);
    float _1585 = _1557 * _1489;
    float _1587 = fma(_1559, _1491, _1573);
    float _1589 = fma(_1545, _1535, _1547);
    float _1591 = fma(_1577, _1565, _1583);
    float _1593 = fma(_1581, _1491, _1585);
    float _1595 = fma(_1563, _1565, _1587);
    float _1597 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1599 = fma(_1589, _1565, _1593);
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1605 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1597);
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1601);
    float _1609 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1603);
    float _1611 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1605);
    float _1613 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1607);
    float _1615 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1609);
    float _1617 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1621 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1623 = _1537 + _1617;
    float _1625 = _1527 + _1619;
    float _1627 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1623 + _1629;
    float _1633 = _1523 + _1621;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1637 = _1625 + _1635;
    float _1639 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1627);
    float _1641 = _1631 * _1631;
    float _1643 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1639);
    float _1645 = fma(_1637, _1637, _1641);
    float _1647 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1649 = sqrt(_1645);
    float _1651 = _1647 + _1551;
    float _1653 = -_195;
    int _1655 = _1487 ? as_type<int>(_1653) : as_type<int>(_195);
    float _1657 = _1651 * _1567;
    float _1659 = _1657 * 0.5;
    bool _1661 = !_979;
    float _1663 = _1661 ? _195 : as_type<float>(_1655);
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1667 = _1665 != 0;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1671 = _1669 != 0;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1675 = _1673 != 0;
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1679 = _1677 != 0;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1683 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1681);
    float _1685 = 1.0 / _1683;
    bool _1687 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1689 = !_1671;
    int _1691 = _1689 ? 0 : 1;
    bool _1693 = !_1667;
    int _1695 = _1693 ? 0 : 1;
    bool _1697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1699 = isnan(0.5);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1705 = _1701 || _1703;
    bool _1707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1709 = isnan(0.5);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1715 = _1711 || _1713;
    bool _1717 = !_1675;
    int _1719 = _1717 ? 0 : 1;
    bool _1721 = !_1679;
    int _1723 = _1721 ? 0 : 1;
    float _1725 = _1567;
    float _1727 = _1483;
    float _1729 = _1625;
    float _1731 = _1645;
    float _1733 = _1599;
    float _1735 = _1527;
    if (!_1687)
    {
        _1725 = _1623;
    }
    float _1737 = _1725;
    float _1739 = _1737;
    if (!_1687)
    {
        _1727 = _1633;
    }
    float _1741 = _1727;
    bool _1743 = !_1687;
    float _1745 = _1741;
    if (!_1743)
    {
        float _1747 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1751 = _1649 + _1749;
        float _1753 = rsqrt(_1645);
        float _1755 = _1751 * _1747;
        float _1757 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = _1755 * 0.15915493667125701904296875;
        float _1761 = _1759 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1759 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = _1763 + (-1.0);
        float _1771 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1773 = fma(_1767, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1775 = fma(_1633, _1763, _1771);
        float _1777 = _1753 * _1773;
        float _1779 = fma(_1637, _1777, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1781 = fma(_1631, _1777, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1745 = _1775;
        _1729 = _1779;
        _1739 = _1781;
    }
    float _1783 = _1745;
    float _1785 = _1729;
    float _1787 = _1739;
    float _1789 = _1783;
    float _1791 = _1785;
    float _1793 = _1787;
    if (_1715)
    {
        _1731 = 1.0;
    }
    float _1795 = _1731;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1799 = _1685 * _1797;
    float _1801 = _1795;
    if (!_1705)
    {
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1805 = _1523 + _1803;
        float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1809 = _1527 + _1807;
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1813 = -_1523;
        float _1815 = _1813 + _1783;
        float _1817 = _1805 * _1805;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1821 = _1537 + _1819;
        float _1823 = -_1527;
        float _1825 = _1823 + _1785;
        float _1827 = fma(_1809, _1809, _1817);
        float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1831 = fma(_1821, _1821, _1827);
        float _1833 = sqrt(_1831);
        float _1835 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1829;
        float _1841 = _1835 * _1839;
        float _1843 = -_1537;
        float _1845 = _1843 + _1787;
        float _1847 = fma(_1815, _1841, _1523);
        float _1849 = fma(_1825, _1841, _1527);
        float _1851 = fma(_1845, _1841, _1537);
        _1789 = _1847;
        _1791 = _1849;
        _1793 = _1851;
    }
    float _1853 = _1789;
    float _1855 = _1791;
    float _1857 = _1793;
    if (!_1715)
    {
        float _1859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = _1859 * 0.15915493667125701904296875;
        float _1863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = _1861 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1863 * 0.15915493667125701904296875;
        float _1871 = _1861 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = 1.0 / _1867;
        float _1877 = _1869 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = _1869 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = _1879 * _1881;
        float _1889 = 1.0 / _1887;
        float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1891;
        float _1895 = 1.0 / _1893;
        float _1897 = _1885 * _1889;
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1901 = fma(_1799, _1897, _1899);
        float _1903 = _1901 * _1895;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1733 = _1869;
        _1801 = _1905;
    }
    float _1907 = _1733;
    float _1909 = _1801;
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1913 = _1853 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1917 = _1855 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1921 = _1857 + _1919;
    float _1923 = _1913 * _1913;
    bool _1925 = _1049 != 0;
    float _1927 = fma(_1917, _1917, _1923);
    float _1929 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1931 = fma(_1921, _1921, _1927);
    float _1933 = floor(_1929);
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1937 = rsqrt(_1931);
    float _1939 = sqrt(_1931);
    float _1941 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1943 = _1917 * _1941;
    float _1945 = _1921 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 * _1945;
    float _1951 = _1947 + _1949;
    float _1953 = sqrt(_1951);
    bool _1955 = _1953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1959 = _1953 + _1957;
    float _1961 = _1937;
    float _1963 = _1951;
    float _1965 = _1959;
    float _1967 = _1907;
    float _1969 = _1913;
    if (_1955)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1961 = _1971;
    }
    float _1973 = _1961;
    if (!_1955)
    {
        _1735 = _1947;
    }
    float _1975 = _1735;
    float _1977 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1979 = _1975;
    if (_1955)
    {
        float _1981 = rsqrt(_1951);
        _1963 = _1981;
    }
    float _1983 = _1963;
    if (_1955)
    {
        float _1985 = _1959 * _1973;
        _1965 = _1985;
    }
    float _1987 = _1965;
    if (_1955)
    {
        float _1989 = _1987 * 0.15915493667125701904296875;
        _1967 = _1989;
    }
    float _1991 = _1967;
    float _1993 = _1921;
    float _1995 = _1991;
    if (_1955)
    {
        float _1997 = _1991 * 6.283185482025146484375;
        float _1999 = sin(_1997);
        _1993 = _1999;
    }
    float _2001 = _1993;
    float _2003 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2005 = precise::max(0.0, _2003);
    float _2007 = _1973;
    float _2009 = _2005;
    if (_1955)
    {
        float _2011 = _1991 * 6.283185482025146484375;
        float _2013 = cos(_2011);
        _2007 = _2013;
    }
    float _2015 = _2007;
    float _2017 = -_1941;
    float _2019 = -_2005;
    float _2021 = fma(_1913, _2017, _2019);
    if (_1955)
    {
        float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2023;
    }
    float _2025 = _1969;
    float _2027 = _2001;
    float _2029 = _2025;
    if (_1955)
    {
        float _2031 = fma(_2001, _2025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2027 = _2031;
    }
    float _2033 = _2027;
    float _2035 = _2033;
    if (!_1955)
    {
        _2029 = _2021;
    }
    float _2037 = _2029;
    float _2039 = _2037;
    float _2041 = _2015;
    if (_1955)
    {
        float _2043 = _2015 + (-1.0);
        _2009 = _2043;
    }
    float _2045 = _2009;
    float _2047 = _2045;
    if (_1955)
    {
        float _2049 = _1983 * _2033;
        _1407 = _2049;
    }
    float _2051 = _1407;
    if (!_1955)
    {
        _2035 = _1943;
    }
    float _2053 = _2035;
    float _2055 = _2053;
    if (_1955)
    {
        float _2057 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2057;
    }
    float _2059 = _1995;
    if (_1955)
    {
        float _2061 = _1943 * _2051;
        _2055 = _2061;
    }
    float _2063 = _2055;
    if (!_1955)
    {
        _2047 = _1945;
    }
    float _2065 = _2047;
    float _2067 = _2065;
    if (_1955)
    {
        float _2069 = _1945 * _2051;
        _2067 = _2069;
    }
    float _2071 = _2067;
    if (_1955)
    {
        float _2073 = fma(_2021, _2015, _2059);
        _2039 = _2073;
    }
    float _2075 = _2039;
    if (_1955)
    {
        float _2077 = _2063 * _2063;
        _1979 = _2077;
    }
    float _2079 = _1979;
    if (!_1955)
    {
        _2041 = _1949;
    }
    float _2081 = _2041;
    float _2083 = _2081;
    if (_1955)
    {
        float _2085 = _2071 * _2071;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2093 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2095 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1977);
    float _2097 = _2089 + _2087;
    float _2099 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2101 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2103 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2091);
    float _2105 = rsqrt(_2097);
    float _2107 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2099);
    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2111 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2109);
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2093);
    float _2117 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2103);
    float _2119 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2121 = -_2113;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2115);
    float _2127 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2129 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2131 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2095);
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2135 = abs(_2123);
    float _2137 = log2(_2135);
    float _2139 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2141 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = _2105 * _2063;
    float _2147 = _2105 * _2075;
    float _2149 = _2105 * _2071;
    float _2151 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2139);
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = floor(_2101);
    float _2157 = -_1933;
    float _2159 = _1929 + _2157;
    float _2161 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2151);
    float _2163 = -_2153;
    float _2165 = fma(_2147, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2163);
    float _2167 = -_2143;
    float _2169 = fma(_2167, _1935, 1.0);
    float _2171 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2161);
    float _2173 = -_2149;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2165);
    float _2177 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2179 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = log2(_2169);
    float _2183 = fma(_2175, -0.5, 0.5);
    float _2185 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2187 = fma(_2175, 0.5, 0.5);
    float _2189 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    float _2191 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2185);
    float _2193 = -_2155;
    float _2195 = _2101 + _2193;
    float _2197 = 1.0 / _2171;
    float _2199 = fma(_2187, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2201 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2189);
    float _2203 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2191);
    float _2205 = _2147 + 1.0;
    float _2207 = fma(_2187, _2199, -0.212114393711090087890625);
    float _2209 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2201);
    float _2211 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2203);
    float _2213 = exp2(_2177);
    float _2215 = fma(_2187, _2207, 1.570728778839111328125);
    float _2217 = _2181 * 0.693147182464599609375;
    float _2219 = sqrt(_2183);
    float _2221 = _2209 * _2197;
    float _2223 = _2211 * _2197;
    float _2225 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = -_2147;
    float _2231 = fma(_2213, _2205, _2229);
    float2 _8248 = float2(_2159, _2195);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8248, float2(0.0), isnan(_8248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8248, float2(0.0), isnan(_8248)), level(0.0)).x;
    float _2235 = fma(_2231, 0.5, 0.5);
    float _2237 = _2219 * 0.636619746685028076171875;
    float _2239 = fma(_2221, 0.5, 0.5);
    float _2241 = -_2215;
    float _2243 = fma(_2237, _2241, 1.0);
    float3 _8271 = float3(_2239, _2227, _2225);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8271, float3(0.0), isnan(_8271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8271, float3(0.0), isnan(_8271)), level(0.0)).x;
    float3 _8282 = float3(_2239, _2227, _2225);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8282, float3(0.0), isnan(_8282)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8282, float3(0.0), isnan(_8282)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _8298 = float2(_2243, _2235);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8298, float2(0.0), isnan(_8298)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8298, float2(0.0), isnan(_8298)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2270 = int(_2268);
    float _2272 = _839 * _841;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    float _2278 = -_1355;
    float _2280 = _2278 + 1.0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2284 = _2282 != 0;
    float _2286 = -_1347;
    float _2288 = _2286 + 1.0;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2292 = _2290 != 0;
    float _2294 = -_1175;
    float _2296 = _2294 + 1.0;
    float _2298 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2300 = int(_2298);
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2304 = _2302 != 0;
    float _2306 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2308 = abs(_1173);
    float _2310 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2312 = abs(_1087);
    float _2314 = -_1351;
    float _2316 = _2314 + 1.0;
    bool _2318 = _1279 != 0;
    float _2320 = trunc(_1357);
    int _2322 = int(_2320);
    float _2324 = float(uint(_2270));
    float _2326 = -_1353;
    float _2328 = _2326 + 1.0;
    float _2330 = trunc(_1315);
    int _2332 = int(_2330);
    float _2334 = float(uint(_2300));
    float _2336 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2310);
    float _2338 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2340 = int(_2338);
    float _2342 = float(uint(_2322));
    float _2344 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2336);
    float _2346 = float(_2270);
    float _2348 = float(_2322);
    float _2350 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2344);
    float _2352 = 1.0 / _2324;
    bool _2354 = _2348 >= _2346;
    bool _2356 = isnan(_2348);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(_2346);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    float _2366 = float(_2332);
    out.gl_Position.x = _2209;
    out.gl_Position.y = _2211;
    out.gl_Position.z = _2350;
    out.gl_Position.w = _2171;
    bool _2368 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2370 = isnan(_737);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = 1.0 / _2334;
    float _2382 = float(uint(_2340));
    int _2384 = as_type<int>(_2352) + (-2);
    float _2386 = 1.0 / _2382;
    int _2388 = ~_2270;
    int _2390 = _2388 + 1;
    float _2392 = as_type<float>(_2384) * _2342;
    int _2394 = as_type<int>(_2380) + (-2);
    float _2396 = trunc(_2392);
    float _2398 = precise::max(_2396, 0.0);
    uint _2401 = uint(_2398);
    float _2403 = float(uint(_2332));
    float _2405 = as_type<float>(_2394) * _2403;
    float _2407 = _843 * _827;
    float _2409 = trunc(_1337);
    int _2411 = int(_2409);
    int _2413 = ~_2300;
    int _2415 = _2413 + 1;
    float _2417 = trunc(_2405);
    float _2419 = precise::max(_2417, 0.0);
    uint _2421 = uint(_2419);
    int _2423 = _2390 * int(_2401);
    int _2425 = _2423 + _2322;
    float _2427 = float(uint(_2425));
    float _2429 = trunc(_2364);
    int _2431 = int(_2429);
    float _2433 = float(uint(_2411));
    float _2435 = as_type<float>(_2384) * _2427;
    float _2437 = floor(_2407);
    int _2439 = _2415 * int(_2421);
    int _2441 = _2439 + _2332;
    float _2443 = float(uint(_2441));
    float _2445 = trunc(_2435);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    float _2451 = as_type<float>(_2394) * _2443;
    int _2453 = as_type<int>(_2386) + (-2);
    int _2455 = ~_2270;
    int _2457 = _2455 + 1;
    float _2459 = floor(_2272);
    float _2461 = as_type<float>(_2453) * _2433;
    float _2463 = -_2437;
    float _2465 = _2407 + _2463;
    float _2467 = _843 * _845;
    int _2469 = ~_2340;
    int _2471 = _2469 + 1;
    float _2473 = trunc(_2451);
    float _2475 = precise::max(_2473, 0.0);
    uint _2477 = uint(_2475);
    int _2479 = int(_2401) + int(_2449);
    float _2481 = float(_2300);
    float _2483 = as_type<float>(_2449);
    float _2485 = _2467;
    float _2487 = as_type<float>(_2394);
    float _2489 = _2211;
    float _2491 = _2209;
    if (_2304)
    {
        float _2493 = in.m_58.w;
        _2483 = _2493;
    }
    float _2495 = _2483;
    int _2497 = ~_2300;
    int _2499 = _2497 + 1;
    int _2501 = _2457 * _2479;
    int _2503 = _2501 + _2322;
    bool _2505 = _2366 >= _2481;
    bool _2507 = isnan(_2366);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan(_2481);
    bool _2513 = _2509 || _2511;
    float _2515 = float(_2513);
    float _2517 = trunc(_2461);
    float _2519 = precise::max(_2517, 0.0);
    uint _2521 = uint(_2519);
    float _2523 = -_2459;
    float _2525 = _2272 + _2523;
    float _2527 = _2465 * _2346;
    float _2529 = _2346 * _869;
    bool _2531 = uint(_2503) >= uint(_2270);
    float _2533 = _2525 * _2481;
    bool _2535 = !_2292;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = trunc(_2527);
    int _2541 = int(_2539);
    int _2543 = int(_2421) + int(_2477);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2547 = _2545 != 0;
    int _2549 = abs(_2537);
    int _2551 = _2499 * _2543;
    int _2553 = _2551 + _2332;
    bool _2555 = !_2547;
    int _2557 = _2555 ? 0 : 1;
    int _2559 = _2471 * int(_2521);
    int _2561 = _2559 + _2411;
    float _2563 = trunc(_2533);
    int _2565 = int(_2563);
    bool _2567 = _2270 == 0;
    float _2569 = float(uint(_2561));
    bool _2571 = !_2531;
    int _2573 = _2571 ? 0 : (-1);
    bool _2575 = uint(_2553) >= uint(_2300);
    float _2577 = trunc(_2515);
    int _2579 = int(_2577);
    int _2581 = ~_2479;
    int _2583 = _2581 + _2573;
    int _2585 = _2583 + 1;
    float _2587 = as_type<float>(_2453) * _2569;
    bool _2589 = !_2575;
    int _2591 = _2589 ? 0 : (-1);
    int _2593 = abs(_2557);
    int _2595 = _2541 * _2549;
    int _2597 = _2595 + _2322;
    int _2599 = ~_2543;
    int _2601 = _2599 + _2591;
    int _2603 = _2601 + 1;
    float _2605 = trunc(_2587);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    int _2611 = _2270 * _2585;
    int _2613 = _2611 + _2322;
    bool _2615 = _2300 == 0;
    int _2617 = _2300 * _2603;
    int _2619 = _2617 + _2332;
    bool _2621 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2623 = isnan(_737);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2629 = _2625 || _2627;
    float _2631 = float(_2629);
    int _2633 = _2565 * _2593;
    int _2635 = _2633 + _2332;
    bool _2637 = !_2567;
    int _2639 = _2637 ? _2613 : (-1);
    float _2641 = trunc(_2529);
    int _2643 = int(_2641);
    int _2645 = ~_2579;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    bool _2651 = !_2615;
    int _2653 = _2651 ? _2619 : (-1);
    int _2655 = ~_2431;
    int _2657 = _2655 + 1;
    int _2659 = _2657 + 1;
    int _2661 = _2300 + (-1);
    int _2663 = _2653 * _2649;
    int _2665 = ~_2340;
    int _2667 = _2665 + 1;
    int _2669 = _2639 * _2659;
    int _2671 = _2270 + (-1);
    int _2673 = _2579 * _2661;
    int _2675 = _2673 + _2663;
    int _2677 = int(_2521) + int(_2609);
    float _2679 = _2481 * _869;
    int _2681 = _2431 * _2671;
    int _2683 = _2681 + _2669;
    int _2685 = abs(_1165);
    float _2687 = exp2(_2306);
    int _2689 = abs(as_type<int>(_1075));
    int _2691 = _2667 * _2677;
    int _2693 = _2691 + _2411;
    float _2695 = as_type<float>(_2693);
    if (_2304)
    {
        float _2697 = _2495 * 3.1415927410125732421875;
        _1101 = _2697;
    }
    float _2699 = _1101;
    bool _2701 = !_2276;
    int _2703 = _2701 ? 0 : 1;
    int _2705 = _2675 * _2685;
    int _2707 = abs(_1081);
    int _2709 = _2683 * _2689;
    float _2711 = trunc(_2679);
    int _2713 = int(_2711);
    bool _2715 = uint(_2693) >= uint(_2340);
    bool _2717 = _2715;
    if (_2304)
    {
        float _2719 = _2699 * 0.15915493667125701904296875;
        _2695 = _2719;
    }
    float _2721 = _2695;
    float _2723 = float(_2340);
    float _2725 = float(_2411);
    int _2727 = abs(_1695);
    float _2729 = _2721;
    if (_2304)
    {
        float _2731 = _2721 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        _2729 = _2733;
    }
    float _2735 = _2729;
    bool _2737 = _2725 >= _2723;
    bool _2739 = isnan(_2725);
    bool _2741 = _2737 || _2739;
    bool _2743 = isnan(_2723);
    bool _2745 = _2741 || _2743;
    float _2747 = float(_2745);
    float _2749 = _2723 * _869;
    float _2751 = -_2687;
    float _2753 = _2751 + 1.0;
    int _2755 = abs(_2703);
    int _2757 = _2643 * _2707;
    int _2759 = _2757 + _2709;
    bool _2761 = !_2715;
    int _2763 = _2761 ? 0 : (-1);
    float _2765 = trunc(_2747);
    int _2767 = int(_2765);
    int _2769 = _2713 * _2308;
    int _2771 = _2769 + _2705;
    int _2773 = abs(_1179);
    int _2775 = _2597 * _2312;
    int _2777 = _2775 + _2759;
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2783 = ~_2677;
    int _2785 = _2783 + _2763;
    int _2787 = _2785 + 1;
    float _2789 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2791 = _2541 * _2755;
    int _2793 = _2791 + _2777;
    bool _2795 = !_2284;
    int _2797 = _2795 ? 0 : 1;
    float _2799 = floor(_2467);
    if (_2304)
    {
        bool _2801 = _2735 > 0.5;
        _2717 = _2801;
    }
    bool _2803 = _2717;
    int _2805 = _2635 * _2773;
    int _2807 = _2805 + _2771;
    int _2809 = abs(_2797);
    int _2811 = _2340 * _2787;
    int _2813 = _2811 + _2411;
    float _2815 = float(uint(_2793));
    float _2817 = trunc(_2749);
    int _2819 = int(_2817);
    bool _2821 = _2340 == 0;
    float _2823 = as_type<float>(_2384) * _2815;
    float _2825 = float(uint(_2597));
    int _2827 = _2565 * _2809;
    int _2829 = _2827 + _2807;
    int _2831 = ~_2767;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = !_2821;
    int _2839 = _2837 ? _2813 : (-1);
    float _2841 = trunc(_2823);
    float _2843 = precise::max(_2841, 0.0);
    uint _2845 = uint(_2843);
    float _2847 = float(uint(_2829));
    float _2849 = -_2799;
    float _2851 = _2467 + _2849;
    if (!_2304)
    {
        _2485 = _191;
    }
    float _2853 = _2485;
    float _2855 = as_type<float>(_2384) * _2825;
    float _2857 = _2853;
    if (_2304)
    {
        float _2859 = -_191;
        float _2861 = _2803 ? _2859 : _191;
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = as_type<float>(_2394) * _2847;
    int _2867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2869 = _2867 != 0;
    int _2871 = _2839 * _2835;
    int _2873 = ~_2270;
    int _2875 = _2873 + 1;
    float _2877 = trunc(_2855);
    float _2879 = precise::max(_2877, 0.0);
    uint _2881 = uint(_2879);
    int _2883 = _2340 + (-1);
    float _2885 = _2851 * _2723;
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2889 = _2887 != 0;
    int _2891 = ~_2300;
    int _2893 = _2891 + 1;
    int _2895 = _2875 * int(_2845);
    int _2897 = _2895 + _2793;
    int _2899 = abs(_1691);
    float _2901 = trunc(_2865);
    float _2903 = precise::max(_2901, 0.0);
    uint _2905 = uint(_2903);
    int _2907 = _2767 * _2883;
    int _2909 = _2907 + _2871;
    bool _2911 = !_2889;
    int _2913 = _2911 ? 0 : 1;
    float _2915 = as_type<float>(_2677);
    if (_2869)
    {
        float _2917 = in.m_58.x;
        _2915 = _2917;
    }
    float _2919 = _2915;
    float _2921 = float(uint(_2897));
    int _2923 = ~_2270;
    int _2925 = _2923 + 1;
    float _2927 = trunc(_2885);
    int _2929 = int(_2927);
    int _2931 = abs(_2913);
    float _2933 = as_type<float>(_2384) * _2921;
    int _2935 = _2925 * int(_2881);
    int _2937 = _2935 + _2597;
    int _2939 = _2893 * int(_2905);
    int _2941 = _2939 + _2829;
    float _2943 = trunc(_2933);
    float _2945 = precise::max(_2943, 0.0);
    uint _2947 = uint(_2945);
    float _2949 = float(uint(_2941));
    int _2951 = _2909 * _2899;
    float _2953 = float(uint(_2937));
    int _2955 = _2929 * _2931;
    int _2957 = _2955 + _2411;
    int _2959 = abs(_1719);
    float _2961 = as_type<float>(_2394) * _2949;
    int _2963 = _2819 * _2727;
    int _2965 = _2963 + _2951;
    float _2967 = float(uint(_2635));
    float _2969 = as_type<float>(_2384) * _2953;
    float _2971 = trunc(_2961);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    int _2977 = ~_2270;
    int _2979 = _2977 + 1;
    int _2981 = _2957 * _2959;
    int _2983 = _2981 + _2965;
    int _2985 = abs(_1723);
    float _2987 = as_type<float>(_2394) * _2967;
    float _2989 = _2967;
    if (_2869)
    {
        float _2991 = _2919 * 3.1415927410125732421875;
        _2989 = _2991;
    }
    float _2993 = _2989;
    float _2995 = 1.0 / _2781;
    int _2997 = int(_2845) + int(_2947);
    float _2999 = _2993;
    if (_2869)
    {
        float _3001 = _2993 * 0.15915493667125701904296875;
        _2999 = _3001;
    }
    float _3003 = _2999;
    int _3005 = ~_2300;
    int _3007 = _3005 + 1;
    int _3009 = _2929 * _2985;
    int _3011 = _3009 + _2983;
    int _3013 = _2979 * _2997;
    int _3015 = _3013 + _2793;
    float _3017 = trunc(_2987);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_2957));
    float _3025 = -_2233;
    float _3027 = _3025 + 1.0;
    int _3029 = int(_2905) + int(_2975);
    float _3031 = -_191;
    int _3033 = _1925 ? as_type<int>(_3031) : as_type<int>(_191);
    float _3035 = as_type<float>(_2453) * _3023;
    bool _3037 = uint(_3015) >= uint(_2270);
    float _3039 = _3003;
    if (_2869)
    {
        float _3041 = _3003 * 6.283185482025146484375;
        float _3043 = sin(_3041);
        _3039 = _3043;
    }
    float _3045 = _3039;
    int _3047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3049 = _3047 != 0;
    int _3051 = _3007 * _3029;
    int _3053 = _3051 + _2829;
    float _3055 = float(uint(_3011));
    int _3057 = ~_2300;
    int _3059 = _3057 + 1;
    bool _3061 = !_3049;
    float _3063 = _3061 ? _191 : as_type<float>(_3033);
    float _3065 = trunc(_2969);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    bool _3071 = uint(_3053) >= uint(_2300);
    float _3073 = as_type<float>(_2453) * _3055;
    int _3075 = _3059 * int(_3021);
    int _3077 = _3075 + _2635;
    bool _3079 = !_3037;
    int _3081 = _3079 ? 0 : (-1);
    int _3083 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3085 = _3083 != 0;
    float _3087 = trunc(_3035);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    float _3093 = float(uint(_3077));
    bool _3095 = !_3071;
    int _3097 = _3095 ? 0 : (-1);
    int _3099 = ~_2997;
    int _3101 = _3099 + _3081;
    int _3103 = _3101 + 1;
    float _3105 = as_type<float>(_2394) * _3093;
    bool _3107 = _3071;
    if (_2869)
    {
        bool _3109 = _3045 > 0.5;
        _3107 = _3109;
    }
    bool _3111 = _3107;
    float _3113 = trunc(_3073);
    float _3115 = precise::max(_3113, 0.0);
    uint _3117 = uint(_3115);
    int _3119 = ~_2340;
    int _3121 = _3119 + 1;
    int _3123 = _2270 * _3103;
    int _3125 = _3123 + _2793;
    int _3127 = ~_3029;
    int _3129 = _3127 + _3097;
    int _3131 = _3129 + 1;
    int _3133 = int(_2881) + int(_3069);
    int _3135 = ~_2340;
    int _3137 = _3135 + 1;
    int _3139 = _3121 * int(_3091);
    int _3141 = _3139 + _2957;
    if (!_2869)
    {
        _2487 = _195;
    }
    float _3143 = _2487;
    int _3145 = _2300 * _3131;
    int _3147 = _3145 + _2829;
    bool _3149 = !_2567;
    int _3151 = _3149 ? _3125 : (-1);
    float _3153 = trunc(_3105);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    float _3159 = float(uint(_3141));
    float _3161 = _3143;
    if (_2869)
    {
        float _3163 = -_195;
        float _3165 = _3111 ? _3163 : _195;
        _3161 = _3165;
    }
    float _3167 = _3161;
    int _3169 = _3137 * int(_3117);
    int _3171 = _3169 + _3011;
    int _3173 = _3151 & 3;
    bool _3175 = _3173 != 0;
    float _3177 = as_type<float>(_2453) * _3159;
    int _3179 = ~_2270;
    int _3181 = _3179 + 1;
    float _3183 = -_195;
    int _3185 = _2318 ? as_type<int>(_3183) : as_type<int>(_195);
    float _3187 = trunc(_3177);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    float _3193 = float(uint(_3171));
    int _3195 = _3181 * _3133;
    int _3197 = _3195 + _2597;
    bool _3199 = uint(_3173) > 1u;
    int _3201 = _3151 & 3;
    bool _3203 = _3201 != 0;
    float _3205 = as_type<float>(_2453) * _3193;
    bool _3207 = !_2615;
    int _3209 = _3207 ? _3147 : (-1);
    int _3211 = _3203 ? 0 : 1;
    int _3213 = _3209 & 3;
    bool _3215 = _3213 != 0;
    float _3217 = trunc(_3205);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    bool _3223 = !_3085;
    float _3225 = _3223 ? _195 : as_type<float>(_3185);
    bool _3227 = uint(_3197) >= uint(_2270);
    int _3229 = ~_3211;
    int _3231 = _3229 + 1;
    int _3233 = _3231 + 1;
    int _3235 = _3233;
    if (!_3199)
    {
        int _3237 = ~_3211;
        int _3239 = _3237 + 1;
        _3235 = _3239;
    }
    int _3241 = _3235;
    bool _3243 = uint(_3213) > 1u;
    bool _3245 = !_3227;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3209 & 3;
    bool _3251 = _3249 != 0;
    int _3253 = ~_2300;
    int _3255 = _3253 + 1;
    int _3257 = _3251 ? 0 : 1;
    int _3259 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3261 = _3259 != 0;
    int _3263 = int(_3021) + int(_3157);
    int _3265 = ~_3257;
    int _3267 = _3265 + 1;
    int _3269 = _3267 + 1;
    int _3271 = _3269;
    if (!_3243)
    {
        int _3273 = ~_3257;
        int _3275 = _3273 + 1;
        _3271 = _3275;
    }
    int _3277 = _3271;
    int _3279 = _3255 * _3263;
    int _3281 = _3279 + _2635;
    bool _3283 = !_3215;
    int _3285 = _3283 ? 0 : 1;
    bool _3287 = _3213 != 3;
    int _3289 = int(_3117) + int(_3221);
    int _3291 = int(_3091) + int(_3191);
    int _3293 = ~_2340;
    int _3295 = _3293 + 1;
    bool _3297 = uint(_3213) >= 2u;
    int _3299 = _3295 * _3289;
    int _3301 = _3299 + _3011;
    int _3303 = ~_2340;
    int _3305 = _3303 + 1;
    int _3307 = _3297 ? 0 : 1;
    float _3309 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3311 = _3309 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3313 = uint(_3281) >= uint(_2300);
    int _3315 = _3305 * _3291;
    int _3317 = _3315 + _2957;
    float _3319 = 1.0 / _3311;
    int _3321 = ~_3307;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    int _3327 = _3325;
    if (_3287)
    {
        int _3329 = ~_3307;
        int _3331 = _3329 + 1;
        _3327 = _3331;
    }
    int _3333 = _3327;
    float _3335 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3337 = _3335 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3339 = uint(_3301) >= uint(_2340);
    bool _3341 = !_3313;
    int _3343 = _3341 ? 0 : (-1);
    float _3345 = 1.0 / _3337;
    bool _3347 = uint(_3317) >= uint(_2340);
    bool _3349 = !_3339;
    int _3351 = _3349 ? 0 : (-1);
    bool _3353 = _827 > 0.5;
    bool _3355 = !_3347;
    int _3357 = _3355 ? 0 : (-1);
    bool _3359 = _3213 != 3;
    float _3361 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3363 = _3361 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3365 = -_191;
    int _3367 = _3353 ? as_type<int>(_3365) : as_type<int>(_191);
    float _3369 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3371 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3369;
    bool _3373 = !_3359;
    int _3375 = _3373 ? 0 : (-1);
    float _3377 = 1.0 / _3363;
    bool _3379 = !_3261;
    float _3381 = _3379 ? _191 : as_type<float>(_3367);
    float _3383 = _3371 * _3319;
    int _3385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3387 = _3385 != 0;
    float _3389 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3391 = _3389 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3395 = _3393 != 0;
    int _3397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3399 = _3397 != 0;
    float _3401 = _3391 * _3345;
    bool _3403 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3405 = isnan(_737);
    bool _3407 = _3403 || _3405;
    bool _3409 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3411 = _3407 || _3409;
    float _3413 = float(_3411);
    float _3415 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3417 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3415;
    bool _3419 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3421 = isnan(_737);
    bool _3423 = _3419 || _3421;
    bool _3425 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3427 = _3423 || _3425;
    float _3429 = float(_3427);
    float _3431 = -_3413;
    float _3433 = _3431 + 1.0;
    bool _3435 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3437 = isnan(_737);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3443 = _3439 || _3441;
    float _3445 = float(_3443);
    float _3447 = -_3429;
    float _3449 = _3447 + 1.0;
    float _3451 = _3417 * _3377;
    float _3453 = _3429 * _3433;
    float _3455 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3457 = _3455 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3459 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3461 = isnan(_737);
    bool _3463 = _3459 || _3461;
    bool _3465 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3467 = _3463 || _3465;
    float _3469 = float(_3467);
    float _3471 = _3445 * _3449;
    float _3473 = -_3445;
    float _3475 = _3473 + 1.0;
    float _3477 = -_2631;
    float _3479 = _3477 + 1.0;
    float _3481 = 1.0 / _3457;
    float _3483 = -_3469;
    float _3485 = _3483 + 1.0;
    float _3487 = _3469 * _3475;
    float _3489 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3491 = _3489 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3493 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3495 = isnan(_737);
    bool _3497 = _3493 || _3495;
    bool _3499 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3501 = _3497 || _3499;
    float _3503 = float(_3501);
    float _3505 = _2378 * _3479;
    float _3507 = -_2378;
    float _3509 = _3507 + 1.0;
    bool _3511 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3513 = isnan(_737);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3519 = _3515 || _3517;
    float _3521 = float(_3519);
    float _3523 = 1.0 / _3491;
    float _3525 = _2631 * _3485;
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3529 = _737 + _3527;
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3535 = _3503 * _3509;
    float _3537 = -_3503;
    float _3539 = _3537 + 1.0;
    float _3541 = fma(_3383, _3529, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3545 = _3543 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3547 = 1.0 / _3533;
    float _3549 = _3521 * _3539;
    float _3551 = _3545 * _3481;
    float _3553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3555 = _737 + _3553;
    float _3557 = _3541 * _3549;
    float _3559 = -_3521;
    float _3561 = _3559 + 1.0;
    float _3563 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3565 = _3563 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3567 = fma(_3401, _3555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3569 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3571 = _737 + _3569;
    float _3573 = fma(_3561, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3557);
    float _3575 = _3565 * _3523;
    float _3577 = abs(_1799);
    float _3579 = log2(_3577);
    float _3581 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3583 = _737 + _3581;
    float _3585 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3585;
    float _3589 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3591 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3589;
    float _3593 = fma(_3567, _3535, _3573);
    float _3595 = fma(_3451, _3583, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3597 = fma(_3551, _3571, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3599 = _3587 * _3547;
    float _3601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3603 = _3591 * _2995;
    float _3605 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3607 = _737 + _3605;
    float _3609 = fma(_3595, _3505, _3593);
    float _3611 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3613 = _737 + _3611;
    float _3615 = _2863 + 0.5;
    float _3617 = fma(_3603, _3607, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3619 = fma(_3597, _3525, _3609);
    float _3621 = _3579 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3623 = _3167 + (-0.5);
    float _3625 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3627 = _737 + _3625;
    float _3629 = fma(_3575, _3613, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3631 = fma(_3617, _3487, _3619);
    float _3633 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1093);
    float _3635 = -_3623;
    float _3637 = -_1361;
    float _3639 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3637);
    float _3641 = -_1071;
    float _3643 = _3641 + 1.0;
    float _3645 = _3381 + 0.5;
    float _3647 = exp2(_3621);
    float _3649 = -_907;
    float _3651 = _3649 + 1.0;
    float _3653 = _3225 + (-0.5);
    float _3655 = fma(_3629, _3471, _3631);
    float _3657 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[80].x, _961);
    float _3659 = -_3643;
    float _3661 = fma(_3659, _2863, _3633);
    float _3663 = fma(_3651, _3167, _3639);
    float _3665 = -_3653;
    float _3667 = -_1105;
    float _3669 = fma(_3665, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3667);
    float _3671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3673 = _3601 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3675 = _3063 + 0.5;
    int _3677 = _3209 >> 31;
    out.m_74.x = _3661;
    out.m_74.y = _3663;
    int _3679 = ~_3289;
    int _3681 = _3679 + _3351;
    int _3683 = _3681 + 1;
    float _3685 = fma(_3673, _3675, _1183);
    int _3687 = _3677 & 3;
    float _3689 = _1663 + (-0.5);
    float _3691 = -_2280;
    float _3693 = fma(_3063, _3691, _3685);
    int _3695 = _3209 + _3687;
    float _3697 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3699 = int(_3697);
    float _3701 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3703 = precise::clamp(_3701, 0.0, 1.0);
    int _3705 = _3695 >> 2;
    float _3707 = _3671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3709 = -_1359;
    float _3711 = _3709 + 1.0;
    float _3713 = fma(_3703, -2.0, 3.0);
    float _3715 = _3703 * _3703;
    float _3717 = -_3707;
    float _3719 = -_1251;
    float _3721 = fma(_3717, _3689, _3719);
    int _3723 = _3705 << 4;
    int _3725 = _3723 + 656;
    float _3727 = -_2288;
    float _3729 = fma(_3381, _3727, _3657);
    float _3731 = _3715 * _3713;
    float _3733 = fma(_3225, _3711, _3669);
    uint _3735 = uint(int(uint(_3725) >> uint(2)));
    uint _3737 = uint(int(uint(int(_3735)) >> uint(2)));
    int _3739 = int(_3735) & 3;
    float _3741 = (*spvDescriptorSet0.vp_c9)._m0[int(_3737)][_3739];
    int _3743 = int(_3735) + 1;
    uint _3745 = uint(int(uint(_3743) >> uint(2)));
    int _3747 = _3743 & 3;
    float _3749 = (*spvDescriptorSet0.vp_c9)._m0[int(_3745)][_3747];
    float _3751 = fma(_1663, _2296, _3721);
    float _3753 = -_3731;
    float _3755 = _3753 + 1.0;
    float _3757 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3759 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3761 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3763 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3731);
    out.m_76.x = _3729;
    out.m_76.y = _3733;
    out.m_76.z = _3693;
    out.m_76.w = _3751;
    int _3765 = _3725 + 8;
    uint _3767 = uint(int(uint(_3765) >> uint(2)));
    uint _3769 = uint(int(uint(int(_3767)) >> uint(2)));
    int _3771 = int(_3767) & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = int(_3767) + 1;
    uint _3777 = uint(int(uint(_3775) >> uint(2)));
    int _3779 = _3775 & 3;
    float _3781 = (*spvDescriptorSet0.vp_c9)._m0[int(_3777)][_3779];
    float _3783 = -_1545;
    float _3785 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3757);
    float _3787 = -_1545;
    float _3789 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3759);
    float _3791 = -_1545;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3761);
    int _3795 = ~_3291;
    int _3797 = _3795 + _3357;
    int _3799 = _3797 + 1;
    float _3801 = fma(_3599, _3627, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3803 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3789);
    int _3805 = ~_3263;
    int _3807 = _3805 + _3343;
    int _3809 = _3807 + 1;
    int _3811 = _2340 * _3683;
    int _3813 = _3811 + _3011;
    float _3815 = fma(_3801, _3453, _3655);
    int _3817 = _2340 * _3799;
    int _3819 = _3817 + _2957;
    float _3821 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3823 = _2300 * _3809;
    int _3825 = _3823 + _2635;
    float _3827 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3829 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3831 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3833 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3835 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3827);
    int _3837 = abs(_3277);
    float _3839 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3829);
    float _3841 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3831);
    bool _3843 = !_3395;
    int _3845 = _3843 ? 0 : 1;
    float _3847 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3849 = ~_3837;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    float _3855 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3839);
    int _3857 = abs(_3285);
    float _3859 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3861 = uint(_3173) >= 2u;
    float _3863 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3833);
    int _3865 = ~_3857;
    int _3867 = _3865 + 1;
    int _3869 = _3867 + 1;
    float _3871 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3847);
    int _3873 = abs(_3845);
    float _3875 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3859);
    int _3877 = abs(_3375);
    float _3879 = fma(_3413, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3815);
    int _3881 = _3861 ? 0 : 1;
    float _3883 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3871);
    bool _3885 = _3173 != 3;
    float _3887 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3875);
    int _3889 = ~_3877;
    int _3891 = _3889 + 1;
    int _3893 = _3891 + 1;
    int _3895 = _3853 * as_type<int>(_3749);
    int _3897 = abs(_3333);
    float _3899 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3785);
    bool _3901 = !_2821;
    int _3903 = _3901 ? _3813 : (-1);
    int _3905 = _3869 * as_type<int>(_3741);
    int _3907 = _3905 + _3895;
    int _3909 = ~_3897;
    int _3911 = _3909 + 1;
    int _3913 = _3911 + 1;
    float _3915 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3793);
    int _3917 = _3151 >> 31;
    out.m_78.x = _3879;
    int _3919 = ~_3881;
    int _3921 = _3919 + 1;
    int _3923 = _3921 + 1;
    int _3925 = _3913 * as_type<int>(_3773);
    int _3927 = _3925 + _3907;
    int _3929 = _3917 & 3;
    int _3931 = ~_3873;
    int _3933 = _3931 + 1;
    int _3935 = _3933 + 1;
    int _3937 = _3893 * as_type<int>(_3781);
    int _3939 = _3937 + _3927;
    int _3941 = _3151 + _3929;
    float _3943 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3835);
    int _3945 = abs(_3699);
    int _3947 = _3939 * _3935;
    float _3949 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3841);
    float _3951 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3863);
    float _3953 = float(uint(_3699));
    float _3955 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3957 = _3941 >> 2;
    float _3959 = _3955 * _3899;
    int _3961 = _3923;
    if (_3885)
    {
        int _3963 = ~_3881;
        int _3965 = _3963 + 1;
        _3961 = _3965;
    }
    int _3967 = _3961;
    float _3969 = 1.0 / _3953;
    int _3971 = _3903 >> 31;
    float _3973 = fma(_3821, _3949, _3959);
    bool _3975 = !_2615;
    int _3977 = _3975 ? _3825 : (-1);
    out.m_80.x = _3949;
    out.m_80.y = _3943;
    out.m_80.z = _3951;
    int _3979 = _3903 & 3;
    bool _3981 = _3979 != 0;
    float _3983 = _3855 + _3973;
    float _3985 = float(uint(_3945));
    int _3987 = _3977 * _3873;
    int _3989 = _3987 + _3947;
    int _3991 = _3957 << 4;
    int _3993 = _3991 + 368;
    float _3995 = _3955 * _3803;
    int _3997 = _3903 & 3;
    bool _3999 = _3997 != 0;
    int _4001 = _3971 & 3;
    uint _4003 = uint(int(uint(_3993) >> uint(2)));
    uint _4005 = uint(int(uint(int(_4003)) >> uint(2)));
    int _4007 = int(_4003) & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = int(_4003) + 1;
    uint _4013 = uint(int(uint(_4011) >> uint(2)));
    int _4015 = _4011 & 3;
    float _4017 = (*spvDescriptorSet0.vp_c9)._m0[int(_4013)][_4015];
    int _4019 = _3981 ? 0 : 1;
    float _4021 = 1.0 / _3985;
    bool _4023 = uint(_3997) > 1u;
    float _4025 = fma(_3821, _3943, _3995);
    int _4027 = _3903 + _4001;
    int _4029 = abs(_3989);
    int _4031 = _4027 >> 2;
    int _4033 = ~_4019;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = _4031 << 4;
    int _4041 = _4039 + 800;
    bool _4043 = _1799 <= 8000.0;
    bool _4045 = isnan(_1799);
    bool _4047 = _4043 || _4045;
    bool _4049 = isnan(8000.0);
    bool _4051 = _4047 || _4049;
    float _4053 = float(_4051);
    int _4055 = _4037;
    if (!_4023)
    {
        int _4057 = ~_4019;
        int _4059 = _4057 + 1;
        _4055 = _4059;
    }
    int _4061 = _4055;
    uint _4063 = uint(int(uint(_4041) >> uint(2)));
    uint _4065 = uint(int(uint(int(_4063)) >> uint(2)));
    int _4067 = int(_4063) & 3;
    float _4069 = (*spvDescriptorSet0.vp_c9)._m0[int(_4065)][_4067];
    int _4071 = int(_4063) + 1;
    uint _4073 = uint(int(uint(_4071) >> uint(2)));
    int _4075 = _4071 & 3;
    float _4077 = (*spvDescriptorSet0.vp_c9)._m0[int(_4073)][_4075];
    int _4079 = as_type<int>(_3969) + (-2);
    float _4081 = _4053 * _3763;
    float _4083 = float(uint(_3989));
    int _4085 = ~_3133;
    int _4087 = _4085 + _3247;
    int _4089 = _4087 + 1;
    float _4091 = as_type<float>(_4079) * _4083;
    int _4093 = as_type<int>(_4021) + (-2);
    int _4095 = _3993 + 8;
    uint _4097 = uint(int(uint(_4095) >> uint(2)));
    uint _4099 = uint(int(uint(int(_4097)) >> uint(2)));
    int _4101 = int(_4097) & 3;
    float _4103 = (*spvDescriptorSet0.vp_c9)._m0[int(_4099)][_4101];
    int _4105 = int(_4097) + 1;
    uint _4107 = uint(int(uint(_4105) >> uint(2)));
    int _4109 = _4105 & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    float _4113 = float(uint(_4029));
    int _4115 = _2270 * _4089;
    int _4117 = _4115 + _2597;
    float _4119 = _3955 * _3915;
    float _4121 = trunc(_4091);
    float _4123 = precise::max(_4121, 0.0);
    uint _4125 = uint(_4123);
    bool _4127 = !_3175;
    int _4129 = _4127 ? 0 : 1;
    float _4131 = as_type<float>(_4093) * _4113;
    bool _4133 = uint(_3997) >= 2u;
    int _4135 = _4041 + 8;
    uint _4137 = uint(int(uint(_4135) >> uint(2)));
    uint _4139 = uint(int(uint(int(_4137)) >> uint(2)));
    int _4141 = int(_4137) & 3;
    float _4143 = (*spvDescriptorSet0.vp_c9)._m0[int(_4139)][_4141];
    int _4145 = int(_4137) + 1;
    uint _4147 = uint(int(uint(_4145) >> uint(2)));
    int _4149 = _4145 & 3;
    float _4151 = (*spvDescriptorSet0.vp_c9)._m0[int(_4147)][_4149];
    bool _4153 = _3997 != 3;
    float _4155 = fma(_3821, _3951, _4119);
    int _4157 = ~_3699;
    int _4159 = _4157 + 1;
    float _4161 = trunc(_4131);
    float _4163 = precise::max(_4161, 0.0);
    uint _4165 = uint(_4163);
    int _4167 = _4133 ? 0 : 1;
    bool _4169 = _3173 != 3;
    int _4171 = ~_3945;
    int _4173 = _4171 + 1;
    int _4175 = abs(_3241);
    int _4177 = _4159 * int(_4125);
    int _4179 = _4177 + _3989;
    float _4181 = fma(_3955, _3955, 1.0);
    int _4183 = ~_4175;
    int _4185 = _4183 + 1;
    int _4187 = _4185 + 1;
    int _4189 = ~_4167;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    int _4195 = _4193;
    if (_4153)
    {
        int _4197 = ~_4167;
        int _4199 = _4197 + 1;
        _4195 = _4199;
    }
    int _4201 = _4195;
    int _4203 = _4173 * int(_4165);
    int _4205 = _4203 + _4029;
    float _4207 = float(uint(_4179));
    int _4209 = _4187 * as_type<int>(_4017);
    bool _4211 = !_3999;
    int _4213 = _4211 ? 0 : 1;
    float _4215 = rsqrt(_4181);
    int _4217 = abs(_4129);
    float _4219 = as_type<float>(_4079) * _4207;
    float _4221 = float(uint(_4205));
    int _4223 = abs(_4213);
    int _4225 = abs(_4061);
    float _4227 = trunc(_4219);
    float _4229 = precise::max(_4227, 0.0);
    uint _4231 = uint(_4229);
    float _4233 = as_type<float>(_4093) * _4221;
    int _4235 = abs(_3967);
    int _4237 = abs(_4201);
    float _4239 = _3955 * _4215;
    int _4241 = ~_4225;
    int _4243 = _4241 + 1;
    int _4245 = _4243 + 1;
    float _4247 = trunc(_4233);
    float _4249 = precise::max(_4247, 0.0);
    uint _4251 = uint(_4249);
    int _4253 = ~_4217;
    int _4255 = _4253 + 1;
    int _4257 = _4255 + 1;
    int _4259 = ~_4223;
    int _4261 = _4259 + 1;
    int _4263 = _4261 + 1;
    int _4265 = _4245 * as_type<int>(_4077);
    int _4267 = _4257 * as_type<int>(_4009);
    int _4269 = _4267 + _4209;
    int _4271 = _4263 * as_type<int>(_4069);
    int _4273 = _4271 + _4265;
    int _4275 = ~_4235;
    int _4277 = _4275 + 1;
    int _4279 = _4277 + 1;
    int _4281 = ~_4237;
    int _4283 = _4281 + 1;
    int _4285 = _4283 + 1;
    bool _4287 = _3997 != 3;
    int _4289 = _4279 * as_type<int>(_4103);
    int _4291 = _4289 + _4269;
    float _4293 = -_3855;
    float _4295 = _4239 * _4293;
    int _4297 = _4285 * as_type<int>(_4143);
    int _4299 = _4297 + _4273;
    float _4301 = -_3883;
    float _4303 = _4239 * _4301;
    bool _4305 = !_4169;
    int _4307 = _4305 ? 0 : (-1);
    float _4309 = fma(_4215, _3899, _4295);
    int _4311 = int(_4125) + int(_4231);
    float _4313 = fma(_4215, _3803, _4303);
    bool _4315 = !_4287;
    int _4317 = _4315 ? 0 : (-1);
    float _4319 = -_3887;
    float _4321 = _4239 * _4319;
    int _4323 = abs(_4307);
    int _4325 = ~_3699;
    int _4327 = _4325 + 1;
    int _4329 = abs(_4317);
    int _4331 = ~_3945;
    int _4333 = _4331 + 1;
    int _4335 = _4327 * _4311;
    int _4337 = _4335 + _3989;
    float _4339 = fma(_4215, _3915, _4321);
    int _4341 = int(_4165) + int(_4251);
    float _4343 = _3883 + _4025;
    float _4345 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _4347 = ~_4323;
    int _4349 = _4347 + 1;
    int _4351 = _4349 + 1;
    out.m_82.x = _4309;
    out.m_82.y = _4313;
    out.m_82.z = _4339;
    bool _4353 = uint(_4337) >= uint(_3699);
    int _4355 = _4333 * _4341;
    int _4357 = _4355 + _4029;
    int _4359 = ~_4329;
    int _4361 = _4359 + 1;
    int _4363 = _4361 + 1;
    int _4365 = _4351 * as_type<int>(_4111);
    int _4367 = _4365 + _4291;
    bool _4369 = !_3387;
    int _4371 = _4369 ? 0 : 1;
    float _4373 = _3027 * _4345;
    float _4375 = precise::clamp(_4373, 0.0, 1.0);
    bool _4377 = !_4353;
    int _4379 = _4377 ? 0 : (-1);
    int _4381 = _4363 * as_type<int>(_4151);
    int _4383 = _4381 + _4299;
    bool _4385 = uint(_4357) >= uint(_3945);
    int _4387 = _3989 ^ _3699;
    int _4389 = abs(_4371);
    float _4391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4393 = ~_4311;
    int _4395 = _4393 + _4379;
    int _4397 = _4395 + 1;
    bool _4399 = !_4385;
    int _4401 = _4399 ? 0 : (-1);
    uint _4403 = uint(int(uint(_4387) >> uint(31)));
    int _4405 = _3699 * _4397;
    int _4407 = _4405 + _3989;
    int _4409 = ~_4389;
    int _4411 = _4409 + 1;
    int _4413 = _4411 + 1;
    int _4415 = ~_4401;
    int _4417 = _4341 + _4415;
    int _4419 = _4417 + 1;
    int _4421 = ~int(_4403);
    int _4423 = _4421 + 1;
    int _4425 = _4367 * _4413;
    bool _4427 = _3699 == 0;
    float _4429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4431 = !_3399;
    int _4433 = _4431 ? 0 : 1;
    int _4435 = _4419 ^ _4423;
    bool _4437 = !_4427;
    int _4439 = _4437 ? _4407 : (-1);
    float _4441 = _3887 + _4155;
    int _4443 = abs(_4433);
    int _4445 = ~_4423;
    int _4447 = _4445 + _4435;
    int _4449 = _4447 + 1;
    float _4451 = float(_4439);
    float _4453 = _4391 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4455 = ~_4443;
    int _4457 = _4455 + 1;
    int _4459 = _4457 + 1;
    out.m_84.x = _3983;
    out.m_84.y = _4343;
    out.m_84.z = _4441;
    bool _4461 = _3699 == 0;
    float _4463 = fma(_4453, _4451, _1365);
    float _4465 = _1019 + 0.5;
    int _4467 = _4383 * _4459;
    bool _4469 = !_4461;
    int _4471 = _4469 ? _4449 : (-1);
    float _4473 = fma(_4453, _4465, _4463);
    bool _4475 = !_2821;
    int _4477 = _4475 ? _3819 : (-1);
    float _4479 = in.m_86.x;
    float _4481 = float(_4471);
    float _4483 = _4429 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4485 = _1003 + (-0.5);
    int _4487 = _4477 * _4443;
    int _4489 = _4487 + _4467;
    bool _4491 = !_2567;
    int _4493 = _4491 ? _4117 : (-1);
    float _4495 = -_1367;
    float _4497 = fma(_4483, _4481, _4495);
    float _4499 = -_2316;
    float _4501 = fma(_1019, _4499, _4473);
    float _4503 = _2171 * 0.5;
    float _4505 = float(_4489);
    float _4507 = -_4483;
    float _4509 = fma(_4507, _4485, _4497);
    int _4511 = _4493 * _4389;
    int _4513 = _4511 + _4425;
    float _4515 = _2350 + _2171;
    float _4517 = fma(_2211, -0.5, _4503);
    float _4519 = fma(_1003, _2328, _4509);
    out.m_88.w = _4505;
    float _4521 = float(_4513);
    float _4523 = _2209 + _2171;
    float _4525 = -_4375;
    float _4527 = fma(_4525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4529 = _4515 * 0.5;
    float _4531 = _4523 * 0.5;
    out.m_90.x = _4501;
    out.m_90.y = _4519;
    float _4533 = _2789 * _2245;
    float _4535 = _4527 * _4479;
    float _4537 = -_2789;
    float _4539 = _4537 + 1.0;
    out.m_92.x = _4531;
    out.m_92.y = _4517;
    out.m_92.z = _4529;
    out.m_92.w = _2171;
    float _4541 = _2256 * _4533;
    float _4543 = _2266 * _4533;
    float _4545 = _4535 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4547 = _2256 * _4539;
    float _4549 = fma(_2262, _4541, _2250);
    float _4551 = fma(_2264, _4541, _2252);
    float _4553 = fma(_2256, _4543, _2254);
    out.m_94.x = _4545;
    bool _4555 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4557 = isnan(_1939);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4563 = _4559 || _4561;
    float _4565 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4549;
    out.m_96.y = _4551;
    out.m_96.z = _4553;
    out.m_96.w = _4547;
    out.m_88.x = _4521;
    float _4567 = _4535;
    float _4569 = _4533;
    float _4571 = _4521;
    float _4573 = _4541;
    if (!_4563)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4575 = _2489;
    float _4577 = _4575;
    float _4579 = _4575;
    if (!_4563)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4581 = _2491;
    float _4583 = _4581;
    float _4585 = _4581;
    if (!_4563)
    {
        _4567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4587 = _4567;
    float _4589 = _4587;
    float _4591 = _4587;
    if (!_4563)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4593 = _4569;
    float _4595 = _4593;
    float _4597 = _4593;
    if (!_4563)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4599 = _4571;
    float _4601 = _4599;
    float _4603 = _4599;
    if (!_4563)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4605 = _4573;
    bool _4607 = !_4563;
    float _4609 = _4605;
    float _4611 = _4605;
    if (!_4607)
    {
        bool _4613 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4615 = isnan(_1939);
        bool _4617 = _4613 || _4615;
        bool _4619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4621 = _4617 || _4619;
        if (!_4621)
        {
            float _4623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4625 = _1939 + _4623;
            float _4627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4627;
            float _4631 = 1.0 / _4629;
            float _4633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4635 = _4633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4637 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4639 = _4637 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4643 = _4641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4647 = _4645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4653 = _4625 * _4631;
            float _4655 = precise::clamp(_4653, 0.0, 1.0);
            float _4657 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4659 = _4657 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4661 = fma(_4655, _4635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4663 = fma(_4655, _4659, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4665 = fma(_4655, _4639, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4667 = fma(_4655, _4643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4669 = fma(_4655, _4647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4671 = fma(_4655, _4651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4585 = _4663;
            _4603 = _4669;
            _4579 = _4661;
            _4597 = _4667;
            _4591 = _4665;
            _4611 = _4671;
            _4673 = true;
        }
        else
        {
            bool _4675 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4677 = isnan(_1939);
            bool _4679 = _4675 || _4677;
            bool _4681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4683 = _4679 || _4681;
            if (!_4683)
            {
                _4577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4685 = _4577;
            _4579 = _4685;
            if (!_4683)
            {
                _4583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4687 = _4583;
            _4585 = _4687;
            if (!_4683)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4689 = _4589;
            _4591 = _4689;
            if (!_4683)
            {
                _4595 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4691 = _4595;
            _4597 = _4691;
            if (!_4683)
            {
                _4601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4693 = _4601;
            _4603 = _4693;
            if (!_4683)
            {
                _4609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4695 = _4609;
            bool _4697 = !_4683;
            _4611 = _4695;
            if (!_4697)
            {
                bool _4699 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4701 = isnan(_1939);
                bool _4703 = _4699 || _4701;
                bool _4705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4707 = _4703 || _4705;
                if (!_4707)
                {
                    float _4709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4711 = _1939 + _4709;
                    float _4713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4713;
                    float _4717 = 1.0 / _4715;
                    float _4719 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4721 = _4719 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4723 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4725 = _4723 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4729 = _4727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4733 = _4731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4739 = _4711 * _4717;
                    float _4741 = precise::clamp(_4739, 0.0, 1.0);
                    float _4743 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4745 = _4743 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4747 = fma(_4741, _4721, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4749 = fma(_4741, _4745, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4751 = fma(_4741, _4725, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4753 = fma(_4741, _4729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4755 = fma(_4741, _4733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4757 = fma(_4741, _4737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4585 = _4749;
                    _4603 = _4755;
                    _4579 = _4747;
                    _4597 = _4753;
                    _4591 = _4751;
                    _4611 = _4757;
                    _4673 = true;
                }
                else
                {
                    _4585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4597 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4673 = false;
    float _4759 = _4585;
    float _4761 = _4603;
    float _4763 = _4579;
    float _4765 = _4597;
    float _4767 = _4591;
    float _4769 = _4611;
    float _4771 = fma(_4343, -0.5, 0.5);
    float _4773 = precise::clamp(_4771, 0.0, 1.0);
    float _4775 = -_4759;
    float _4777 = _4775 + _4761;
    float _4779 = -_4763;
    float _4781 = _4779 + _4765;
    out.m_98.x = 0.0;
    float _4783 = fma(_4773, _4777, _4759);
    float _4785 = -_4767;
    float _4787 = _4785 + _4769;
    float _4789 = fma(_4773, _4781, _4763);
    float _4791 = _4783 * 0.586610972881317138671875;
    bool _4793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4795 = fma(_4773, _4787, _4767);
    float _4797 = _4565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4799 = fma(_4789, 0.298911988735198974609375, _4791);
    bool _4801 = _1909 > 0.0;
    bool _4803 = isnan(_1909);
    bool _4805 = _4801 || _4803;
    bool _4807 = isnan(0.0);
    bool _4809 = _4805 || _4807;
    float _4811 = fma(_4795, 0.114477999508380889892578125, _4799);
    out.m_53.x = _4797;
    float _4813 = -_4811;
    float _4815 = _4789 + _4813;
    float _4817 = -_4811;
    float _4819 = _4783 + _4817;
    float _4821 = -_4811;
    float _4823 = _4795 + _4821;
    float _4825 = fma(_4815, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    float _4827 = fma(_4819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    float _4829 = fma(_4823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    bool _4831 = !_4793;
    if (!_4831)
    {
        float _4833 = -_1853;
        float _4835 = _4833 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4837 = -_1855;
        float _4839 = _4837 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4841 = -_1857;
        float _4843 = _4841 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4845 = _4835 * _4835;
        float _4847 = fma(_4839, _4839, _4845);
        float _4849 = fma(_4843, _4843, _4847);
        float _4851 = sqrt(_4849);
        float _4853 = rsqrt(_4849);
        float _4855 = -_4851;
        float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4859 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4861 = precise::clamp(_4859, 0.0, 1.0);
        float _4863 = _4839 * _4853;
        float _4865 = _4835 * _4853;
        float _4867 = abs(_4861);
        float _4869 = log2(_4867);
        float _4871 = _4843 * _4853;
        float _4873 = _4863 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4875 = _4343 * _4865;
        float _4877 = -_4865;
        float _4879 = -_4873;
        float _4881 = fma(_4877, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4879);
        float _4883 = fma(_3983, _4863, _4875);
        float _4885 = -_4871;
        float _4887 = fma(_4885, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4881);
        float _4889 = fma(_4441, _4871, _4883);
        float _4891 = precise::clamp(_4889, 0.0, 1.0);
        float _4893 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4895 = _4887 + _4893;
        float _4897 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4899 = _4895 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4901 = precise::clamp(_4899, 0.0, 1.0);
        float _4903 = exp2(_4897);
        float _4905 = _4903 * _4901;
        float _4907 = _4891 * _4905;
        float _4909 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4911 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4913 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4909;
        out.m_98.y = _4911;
        out.m_98.z = _4913;
    }
    out.m_100.x = _4825;
    out.m_100.y = _4827;
    out.m_100.z = _4829;
    if (_4809)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4915 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4915;
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
    bool _4673 = false;
    bool _589 = false;
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
        float _4984 = as_type<float>(_143);
        out.gl_Position.z = _4984;
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
        float _5047 = as_type<float>(_175);
        out.gl_Position.z = _5047;
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
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _439 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_409);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = 1.0 / _417;
    float _453 = -_429;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _457;
    bool _461 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _463 = isnan(_409);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _449 * _455;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _481 = 1.0 / _433;
    float _483 = _471 * _477;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _437;
    float _491 = _459 * _451;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _497 = fma(_491, _413, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _499 = _495 * _481;
    bool _501 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_409);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _409 + _517;
    float _521 = _497 * _483;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _409 + _523;
    float _527 = -_511;
    float _529 = _527 + 1.0;
    float _531 = fma(_499, _519, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _533 = _515 * _489;
    float _535 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _537 = _429 * _529;
    float _539 = fma(_533, _525, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _541 = fma(_531, _473, _535);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = fma(_539, _537, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _549 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[118].x, _545);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _559 = in.m_60.x;
    float _561 = in.m_60.y;
    float _563 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _549;
    out.m_62.y = _563;
    out.m_62.z = _555;
    out.m_62.w = _557;
    float _565 = _383 * _561;
    float _567 = _381 * _559;
    bool _569 = !_479;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _169;
    }
    _589 = false;
    float _591 = _587;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _595 = _591 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _601 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _603 = isnan(_591);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _617 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_591);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _635 = isnan(_591);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _599;
    float _647 = -_611;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _653 = 1.0 / _615;
    float _655 = _631 * _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _661 = -_643;
    float _663 = _661 + 1.0;
    float _665 = fma(_655, _595, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _667 = _627 * _649;
    float _669 = -_627;
    float _671 = _669 + 1.0;
    float _673 = _611 * _663;
    float _675 = _659 * _653;
    float _677 = _665 * _667;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _681 = _591 + _679;
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[131].x, _677);
    float _685 = fma(_675, _681, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _689 = fma(_685, _673, _683);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[133].x, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _697;
    out.m_64.y = _699;
    out.m_64.z = _701;
    out.m_64.w = _703;
    bool _705 = !_651;
    float _707 = _695;
    int _709 = as_type<int>(_697);
    int _711 = as_type<int>(_677);
    float _713 = _683;
    float _715 = _611;
    float _717 = _691;
    if (!_705)
    {
        float _719 = in.m_58.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _707 = _727;
        _171 = _733;
    }
    float _735 = _707;
    float _737 = _171;
    float _739 = in.m_58.z;
    float _741 = in.m_58.w;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _745 = _743 != 0;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _749 = _735;
    if (_745)
    {
        float _751 = in.m_58.x;
        float _753 = in.m_58.y;
        _747 = _751;
        _749 = _753;
    }
    float _755 = _747;
    float _757 = _749;
    float _759 = 0.0;
    if (_745)
    {
        _759 = 1.0;
    }
    float _761 = _759;
    float _763 = 0.0;
    float _765 = _761;
    if (_745)
    {
        _763 = 1.0;
    }
    float _767 = _763;
    float _769 = _767;
    if (_745)
    {
        _709 = 0;
    }
    int _771 = _709;
    int _773 = _771;
    if (_745)
    {
        _711 = 0;
    }
    int _775 = _711;
    float _777 = _739 * 2.0;
    float _779 = floor(_777);
    float _781 = 0.0;
    float _783 = _755;
    float _785 = _757;
    int _787 = _775;
    if (_745)
    {
        _781 = _755;
    }
    float _789 = _781;
    float _791 = _789;
    if (_745)
    {
        _713 = _757;
    }
    float _793 = _713;
    float _795 = _793;
    if (_745)
    {
        _715 = _789;
    }
    float _797 = _715;
    float _799 = _797;
    if (_745)
    {
        _717 = _789;
    }
    float _801 = _717;
    float _803 = _801;
    if (!_745)
    {
        float _805 = in.m_58.x;
        float _807 = in.m_58.y;
        float _809 = in.m_58.z;
        float _811 = _805 * 3.1415927410125732421875;
        float _813 = _811 * 0.15915493667125701904296875;
        float _815 = _807 * 3.1415927410125732421875;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = sin(_823);
        _783 = _805;
        _795 = _825;
        _785 = _807;
        _773 = 1;
        _787 = 2;
        _799 = _821;
        _769 = 5.839270114898681640625;
        _803 = _809;
        _765 = 7.345489978790283203125;
        _791 = _807;
    }
    float _827 = _783;
    float _829 = _795;
    float _831 = _785;
    int _833 = _773;
    int _835 = _787;
    float _837 = _799;
    float _839 = _769;
    float _841 = _803;
    float _843 = _765;
    float _845 = _791;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    float _851 = _827 * 2.0;
    bool _853 = _779 > 0.0;
    float _855 = _829 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _857 = _779 >= 0.0;
    bool _859 = isnan(_779);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = _831 * 2.0;
    float _869 = _165 * _125;
    float _871 = floor(_851);
    int _873 = _865 ? 0 : 1;
    float _875 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _879 = ~_873;
    int _881 = _879 + 1;
    int _883 = _881 + 1;
    float _885 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _887 = _883;
    float _889 = _855;
    if (!_853)
    {
        int _891 = ~_873;
        int _893 = _891 + 1;
        _887 = _893;
    }
    int _895 = _887;
    float _897 = _849 * _125;
    bool _899 = _833 != 1;
    float _901 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[93].w, _877);
    bool _903 = _739 > 0.5;
    float _905 = floor(_867);
    float _907 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _901);
    float _909 = -_195;
    int _911 = _903 ? as_type<int>(_909) : as_type<int>(_195);
    bool _913 = _871 > 0.0;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _917 = _871 >= 0.0;
    bool _919 = isnan(_871);
    bool _921 = _917 || _919;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    float _927 = exp2(_897);
    float _929 = _827 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _931 = _925 ? 0 : 1;
    float _933 = -_915;
    float _935 = fma(_929, 2.0, _933);
    bool _937 = _835 != 2;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _941 = ~_931;
    int _943 = _941 + 1;
    int _945 = _943 + 1;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _949 = int(_947);
    int _951 = _945;
    if (!_913)
    {
        int _953 = ~_931;
        int _955 = _953 + 1;
        _951 = _955;
    }
    int _957 = _951;
    float _959 = -_125;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[76].x, _935);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = -_927;
    float _975 = _973 + 1.0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _987 = _985 != 0;
    float _989 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[93].z, _939);
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _993 = _971 ? _975 : 0.0;
    float _995 = _837 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _997 = _831 > 0.5;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1001 = !_987;
    float _1003 = _1001 ? _195 : as_type<float>(_911);
    float _1005 = -_991;
    float _1007 = fma(_995, 2.0, _1005);
    float _1009 = -_191;
    int _1011 = _997 ? as_type<int>(_1009) : as_type<int>(_191);
    float _1013 = fma(_855, -2.0, _999);
    float _1015 = _831 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1017 = !_983;
    float _1019 = _1017 ? _191 : as_type<float>(_1011);
    float _1021 = _831 + _739;
    int _1023 = int(_899);
    int _1025 = _937 ? 2 : 0;
    int _1027 = _1023 | _1025;
    int _1029 = _997 ? 4 : 0;
    int _1031 = _1027 | _1029;
    int _1033 = _979 ? 8 : 0;
    int _1035 = _1031 | _1033;
    int _1037 = _983 ? 16 : 0;
    int _1039 = _1035 | _1037;
    int _1041 = _987 ? 32 : 0;
    int _1043 = _1039 | _1041;
    int _1045 = _903 ? 64 : 0;
    int _1047 = _1043 | _1045;
    int _1049 = _1047 & 64;
    float _1051 = _831 + _827;
    float _1053 = _1021 + (-1.0);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1065 = _1063 != 0;
    float _1067 = _1051 + (-1.0);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1071 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _989);
    bool _1073 = !_1061;
    float _1075 = _1073 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1079 = !_1057;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1085 = !_1065;
    int _1087 = _1085 ? 0 : 1;
    float _1089 = fma(_1015, -2.0, _1077);
    float _1091 = -_125;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1007);
    float _1095 = _999;
    float _1097 = _1015;
    float _1099 = _991;
    float _1101 = _1075;
    if (!_899)
    {
        _1095 = _739;
    }
    float _1103 = _1095;
    float _1105 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1089);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1117 = _1115 != 0;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1121 = _1103;
    if (!_899)
    {
        _889 = _831;
    }
    float _1123 = _889;
    float _1125 = _1123;
    if (_899)
    {
        _1121 = _831;
    }
    float _1127 = _1121;
    if (!_899)
    {
        _387 = _831;
    }
    float _1129 = _387;
    float _1131 = _1129;
    if (_899)
    {
        _1125 = _827;
    }
    float _1133 = _1125;
    float _1135 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1083);
    if (_899)
    {
        _1131 = _827;
    }
    float _1137 = _1131;
    float _1139 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = 0.0;
    if (!_899)
    {
        _1143 = _739;
    }
    float _1145 = _1143;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1119);
    float _1149 = _1145;
    if (_937)
    {
        _1097 = _831;
    }
    float _1151 = _1097;
    float _1153 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1155 = _1151;
    if (_937)
    {
        _1099 = _827;
    }
    float _1157 = _1099;
    float _1159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1161 = int(_1159);
    bool _1163 = !_1113;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = -_1141;
    float _1169 = fma(_1139, 2.0, _1167);
    bool _1171 = !_1109;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1135);
    bool _1177 = !_1117;
    int _1179 = _1177 ? 0 : 1;
    float _1181 = -_125;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1169);
    float _1185 = _1157;
    if (_899)
    {
        _1149 = _831;
    }
    float _1187 = _1149;
    if (!_937)
    {
        _1185 = _739;
    }
    float _1189 = _1185;
    if (!_937)
    {
        _1155 = _827;
    }
    float _1191 = _1155;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1203 = _1201 != 0;
    bool _1205 = _905 > 0.0;
    float _1207 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1209 = _905 >= 0.0;
    bool _1211 = isnan(_905);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1221 = int(_1219);
    bool _1223 = !_1195;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1231 = abs(_1225);
    float _1233 = float(_949);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1237 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1239 = float(_1161);
    float _1241 = 1.0 / _1233;
    float _1243 = float(_1221);
    float _1245 = fma(_1237, -2.0, _1227);
    float _1247 = fma(_1207, -2.0, _1235);
    float _1249 = float(_895);
    float _1251 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1245);
    int _1253 = int(_1205);
    int _1255 = _1217 ? 2 : 0;
    int _1257 = _1253 | _1255;
    int _1259 = _997 ? 4 : 0;
    int _1261 = _1257 | _1259;
    int _1263 = _979 ? 8 : 0;
    int _1265 = _1261 | _1263;
    int _1267 = _1195 ? 16 : 0;
    int _1269 = _1265 | _1267;
    int _1271 = _1199 ? 32 : 0;
    int _1273 = _1269 | _1271;
    int _1275 = _1203 ? 64 : 0;
    int _1277 = _1273 | _1275;
    int _1279 = _1277 & 4;
    float _1281 = 1.0 / _1243;
    float _1283 = in.m_66.x;
    float _1285 = in.m_66.y;
    float _1287 = in.m_66.z;
    bool _1289 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1291 = isnan(1.0);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1297 = _1293 || _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    float _1303 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1305 = float(_1231);
    float _1307 = 1.0 / _1239;
    float _1309 = -_1229;
    float _1311 = fma(_1303, 2.0, _1309);
    float _1313 = _1305 * _1249;
    float _1315 = _1241 * _125;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1319 = 1.0 / _1301;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1323 = !_1199;
    int _1325 = _1323 ? 0 : 1;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1329 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1317);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1333 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1321);
    float _1335 = float(_957);
    float _1337 = _1281 * _125;
    float _1339 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1331);
    int _1341 = abs(_1325);
    float _1343 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1327);
    float _1345 = _1313 * (-2.0);
    float _1347 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1329);
    float _1349 = float(_1341);
    float _1351 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1333);
    float _1353 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1339);
    float _1355 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1147);
    float _1357 = _1307 * _125;
    float _1359 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1343);
    float _1361 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1013);
    float _1363 = -_125;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1311);
    float _1367 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1247);
    float _1369 = _1349 * _1335;
    if (_1297)
    {
        float _1371 = _993 * _1319;
        _135 = _1371;
    }
    float _1373 = _135;
    float _1375 = _827 + (-0.5);
    float _1377 = fma(_1345, _1283, _1283);
    int _1379 = _1217 ? 0 : 1;
    float _1381 = fma(_1153, _1345, _1153);
    bool _1383 = !_1203;
    int _1385 = _1383 ? 0 : 1;
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1377);
    int _1389 = ~_1379;
    int _1391 = _1389 + 1;
    int _1393 = _1391 + 1;
    float _1395 = _831 + (-0.5);
    int _1397 = abs(_1385);
    float _1399 = in.m_46.x;
    float _1401 = in.m_46.y;
    float _1403 = in.m_46.z;
    int _1405 = _1393;
    float _1407 = _1373;
    if (!_1205)
    {
        int _1409 = ~_1379;
        int _1411 = _1409 + 1;
        _1405 = _1411;
    }
    int _1413 = _1405;
    float _1415 = _1369 * (-2.0);
    float _1417 = fma(_1381, _1373, _1387);
    float _1419 = fma(_1415, _1285, _1285);
    float _1421 = float(_1413);
    float _1423 = fma(_1069, _1415, _1069);
    float _1425 = float(_1397);
    float _1427 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1419);
    float _1429 = _827 + _739;
    float _1431 = _1417 * 0.15915493667125701904296875;
    float _1433 = _1425 * _1421;
    float _1435 = fma(_1423, _1373, _1427);
    float _1437 = in.m_68.x;
    float _1439 = in.m_68.y;
    float _1441 = in.m_68.z;
    float _1443 = in.m_68.w;
    float _1445 = _1429 + (-1.0);
    float _1447 = _1433 * (-2.0);
    float _1449 = _739 + (-0.5);
    float _1451 = in.m_70.x;
    float _1453 = in.m_70.y;
    float _1455 = in.m_70.z;
    float _1457 = in.m_70.w;
    float _1459 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1461 = fma(_1447, _1287, _1287);
    float _1463 = _1435 * 0.15915493667125701904296875;
    float _1465 = in.m_72.x;
    float _1467 = in.m_72.y;
    float _1469 = in.m_72.z;
    float _1471 = in.m_72.w;
    float _1473 = fma(_1459, _1447, _1459);
    float _1475 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1461);
    float _1477 = _1431 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1485 = fma(_1473, _1373, _1475);
    bool _1487 = _741 > 0.5;
    float _1489 = _875 * _1481;
    float _1491 = _885 * _1483;
    float _1493 = _1485 * 0.15915493667125701904296875;
    float _1495 = _1431 * 6.283185482025146484375;
    float _1497 = cos(_1495);
    float _1499 = _1401 * _1439;
    float _1501 = _1463 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    float _1505 = _1401 * _1453;
    float _1507 = fma(_1399, _1437, _1499);
    float _1509 = _1401 * _1467;
    float _1511 = fma(_1399, _1451, _1505);
    float _1513 = fma(_1403, _1441, _1507);
    float _1515 = _1463 * 6.283185482025146484375;
    float _1517 = cos(_1515);
    float _1519 = fma(_1399, _1465, _1509);
    float _1521 = fma(_1403, _1455, _1511);
    float _1523 = _1513 + _1443;
    float _1525 = fma(_1403, _1469, _1519);
    float _1527 = _1521 + _1457;
    float _1529 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1531 = _1493 * 6.283185482025146484375;
    float _1533 = cos(_1531);
    float _1535 = _1479 * _1503;
    float _1537 = _1525 + _1471;
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1529);
    float _1541 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1539);
    float _1543 = _1493 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = _1497 * _1517;
    float _1549 = _1479 * _1517;
    float _1551 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1553 = _1497 * _1533;
    float _1555 = _1497 * _1503;
    float _1557 = _1479 * _1533;
    float _1559 = _1517 * _1533;
    float _1561 = _1553 * _1489;
    float _1563 = _1503 * _1533;
    float _1565 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1567 = 1.0 / _1551;
    float _1569 = fma(_1545, _1547, _1535);
    float _1571 = -_1489;
    float _1573 = _1545 * _1571;
    float _1575 = -_1549;
    float _1577 = fma(_1545, _1555, _1575);
    float _1579 = -_1555;
    float _1581 = fma(_1545, _1549, _1579);
    float _1583 = fma(_1569, _1491, _1561);
    float _1585 = _1557 * _1489;
    float _1587 = fma(_1559, _1491, _1573);
    float _1589 = fma(_1545, _1535, _1547);
    float _1591 = fma(_1577, _1565, _1583);
    float _1593 = fma(_1581, _1491, _1585);
    float _1595 = fma(_1563, _1565, _1587);
    float _1597 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1599 = fma(_1589, _1565, _1593);
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1605 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1597);
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1601);
    float _1609 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1603);
    float _1611 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1605);
    float _1613 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1607);
    float _1615 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1609);
    float _1617 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1621 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1623 = _1537 + _1617;
    float _1625 = _1527 + _1619;
    float _1627 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1623 + _1629;
    float _1633 = _1523 + _1621;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1637 = _1625 + _1635;
    float _1639 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1627);
    float _1641 = _1631 * _1631;
    float _1643 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1639);
    float _1645 = fma(_1637, _1637, _1641);
    float _1647 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1649 = sqrt(_1645);
    float _1651 = _1647 + _1551;
    float _1653 = -_195;
    int _1655 = _1487 ? as_type<int>(_1653) : as_type<int>(_195);
    float _1657 = _1651 * _1567;
    float _1659 = _1657 * 0.5;
    bool _1661 = !_979;
    float _1663 = _1661 ? _195 : as_type<float>(_1655);
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1667 = _1665 != 0;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1671 = _1669 != 0;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1675 = _1673 != 0;
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1679 = _1677 != 0;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1683 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1681);
    float _1685 = 1.0 / _1683;
    bool _1687 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1689 = !_1671;
    int _1691 = _1689 ? 0 : 1;
    bool _1693 = !_1667;
    int _1695 = _1693 ? 0 : 1;
    bool _1697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1699 = isnan(0.5);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1705 = _1701 || _1703;
    bool _1707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1709 = isnan(0.5);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1715 = _1711 || _1713;
    bool _1717 = !_1675;
    int _1719 = _1717 ? 0 : 1;
    bool _1721 = !_1679;
    int _1723 = _1721 ? 0 : 1;
    float _1725 = _1567;
    float _1727 = _1483;
    float _1729 = _1625;
    float _1731 = _1645;
    float _1733 = _1599;
    float _1735 = _1527;
    if (!_1687)
    {
        _1725 = _1623;
    }
    float _1737 = _1725;
    float _1739 = _1737;
    if (!_1687)
    {
        _1727 = _1633;
    }
    float _1741 = _1727;
    bool _1743 = !_1687;
    float _1745 = _1741;
    if (!_1743)
    {
        float _1747 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1751 = _1649 + _1749;
        float _1753 = rsqrt(_1645);
        float _1755 = _1751 * _1747;
        float _1757 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = _1755 * 0.15915493667125701904296875;
        float _1761 = _1759 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1759 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = _1763 + (-1.0);
        float _1771 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1773 = fma(_1767, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1775 = fma(_1633, _1763, _1771);
        float _1777 = _1753 * _1773;
        float _1779 = fma(_1637, _1777, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1781 = fma(_1631, _1777, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1745 = _1775;
        _1729 = _1779;
        _1739 = _1781;
    }
    float _1783 = _1745;
    float _1785 = _1729;
    float _1787 = _1739;
    float _1789 = _1783;
    float _1791 = _1785;
    float _1793 = _1787;
    if (_1715)
    {
        _1731 = 1.0;
    }
    float _1795 = _1731;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1799 = _1685 * _1797;
    float _1801 = _1795;
    if (!_1705)
    {
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1805 = _1523 + _1803;
        float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1809 = _1527 + _1807;
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1813 = -_1523;
        float _1815 = _1813 + _1783;
        float _1817 = _1805 * _1805;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1821 = _1537 + _1819;
        float _1823 = -_1527;
        float _1825 = _1823 + _1785;
        float _1827 = fma(_1809, _1809, _1817);
        float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1831 = fma(_1821, _1821, _1827);
        float _1833 = sqrt(_1831);
        float _1835 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1829;
        float _1841 = _1835 * _1839;
        float _1843 = -_1537;
        float _1845 = _1843 + _1787;
        float _1847 = fma(_1815, _1841, _1523);
        float _1849 = fma(_1825, _1841, _1527);
        float _1851 = fma(_1845, _1841, _1537);
        _1789 = _1847;
        _1791 = _1849;
        _1793 = _1851;
    }
    float _1853 = _1789;
    float _1855 = _1791;
    float _1857 = _1793;
    if (!_1715)
    {
        float _1859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = _1859 * 0.15915493667125701904296875;
        float _1863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = _1861 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1863 * 0.15915493667125701904296875;
        float _1871 = _1861 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = 1.0 / _1867;
        float _1877 = _1869 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = _1869 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = _1879 * _1881;
        float _1889 = 1.0 / _1887;
        float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1891;
        float _1895 = 1.0 / _1893;
        float _1897 = _1885 * _1889;
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1901 = fma(_1799, _1897, _1899);
        float _1903 = _1901 * _1895;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1733 = _1869;
        _1801 = _1905;
    }
    float _1907 = _1733;
    float _1909 = _1801;
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1913 = _1853 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1917 = _1855 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1921 = _1857 + _1919;
    float _1923 = _1913 * _1913;
    bool _1925 = _1049 != 0;
    float _1927 = fma(_1917, _1917, _1923);
    float _1929 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1931 = fma(_1921, _1921, _1927);
    float _1933 = floor(_1929);
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1937 = rsqrt(_1931);
    float _1939 = sqrt(_1931);
    float _1941 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1943 = _1917 * _1941;
    float _1945 = _1921 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 * _1945;
    float _1951 = _1947 + _1949;
    float _1953 = sqrt(_1951);
    bool _1955 = _1953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1959 = _1953 + _1957;
    float _1961 = _1937;
    float _1963 = _1951;
    float _1965 = _1959;
    float _1967 = _1907;
    float _1969 = _1913;
    if (_1955)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1961 = _1971;
    }
    float _1973 = _1961;
    if (!_1955)
    {
        _1735 = _1947;
    }
    float _1975 = _1735;
    float _1977 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1979 = _1975;
    if (_1955)
    {
        float _1981 = rsqrt(_1951);
        _1963 = _1981;
    }
    float _1983 = _1963;
    if (_1955)
    {
        float _1985 = _1959 * _1973;
        _1965 = _1985;
    }
    float _1987 = _1965;
    if (_1955)
    {
        float _1989 = _1987 * 0.15915493667125701904296875;
        _1967 = _1989;
    }
    float _1991 = _1967;
    float _1993 = _1921;
    float _1995 = _1991;
    if (_1955)
    {
        float _1997 = _1991 * 6.283185482025146484375;
        float _1999 = sin(_1997);
        _1993 = _1999;
    }
    float _2001 = _1993;
    float _2003 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2005 = precise::max(0.0, _2003);
    float _2007 = _1973;
    float _2009 = _2005;
    if (_1955)
    {
        float _2011 = _1991 * 6.283185482025146484375;
        float _2013 = cos(_2011);
        _2007 = _2013;
    }
    float _2015 = _2007;
    float _2017 = -_1941;
    float _2019 = -_2005;
    float _2021 = fma(_1913, _2017, _2019);
    if (_1955)
    {
        float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2023;
    }
    float _2025 = _1969;
    float _2027 = _2001;
    float _2029 = _2025;
    if (_1955)
    {
        float _2031 = fma(_2001, _2025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2027 = _2031;
    }
    float _2033 = _2027;
    float _2035 = _2033;
    if (!_1955)
    {
        _2029 = _2021;
    }
    float _2037 = _2029;
    float _2039 = _2037;
    float _2041 = _2015;
    if (_1955)
    {
        float _2043 = _2015 + (-1.0);
        _2009 = _2043;
    }
    float _2045 = _2009;
    float _2047 = _2045;
    if (_1955)
    {
        float _2049 = _1983 * _2033;
        _1407 = _2049;
    }
    float _2051 = _1407;
    if (!_1955)
    {
        _2035 = _1943;
    }
    float _2053 = _2035;
    float _2055 = _2053;
    if (_1955)
    {
        float _2057 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2057;
    }
    float _2059 = _1995;
    if (_1955)
    {
        float _2061 = _1943 * _2051;
        _2055 = _2061;
    }
    float _2063 = _2055;
    if (!_1955)
    {
        _2047 = _1945;
    }
    float _2065 = _2047;
    float _2067 = _2065;
    if (_1955)
    {
        float _2069 = _1945 * _2051;
        _2067 = _2069;
    }
    float _2071 = _2067;
    if (_1955)
    {
        float _2073 = fma(_2021, _2015, _2059);
        _2039 = _2073;
    }
    float _2075 = _2039;
    if (_1955)
    {
        float _2077 = _2063 * _2063;
        _1979 = _2077;
    }
    float _2079 = _1979;
    if (!_1955)
    {
        _2041 = _1949;
    }
    float _2081 = _2041;
    float _2083 = _2081;
    if (_1955)
    {
        float _2085 = _2071 * _2071;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2093 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2095 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1977);
    float _2097 = _2089 + _2087;
    float _2099 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2101 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2103 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2091);
    float _2105 = rsqrt(_2097);
    float _2107 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2099);
    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2111 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2109);
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2093);
    float _2117 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2103);
    float _2119 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2121 = -_2113;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2115);
    float _2127 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2129 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2131 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2095);
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2135 = abs(_2123);
    float _2137 = log2(_2135);
    float _2139 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2141 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = _2105 * _2063;
    float _2147 = _2105 * _2075;
    float _2149 = _2105 * _2071;
    float _2151 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2139);
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = floor(_2101);
    float _2157 = -_1933;
    float _2159 = _1929 + _2157;
    float _2161 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2151);
    float _2163 = -_2153;
    float _2165 = fma(_2147, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2163);
    float _2167 = -_2143;
    float _2169 = fma(_2167, _1935, 1.0);
    float _2171 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2161);
    float _2173 = -_2149;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2165);
    float _2177 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2179 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = log2(_2169);
    float _2183 = fma(_2175, -0.5, 0.5);
    float _2185 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2187 = fma(_2175, 0.5, 0.5);
    float _2189 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    float _2191 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2185);
    float _2193 = -_2155;
    float _2195 = _2101 + _2193;
    float _2197 = 1.0 / _2171;
    float _2199 = fma(_2187, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2201 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2189);
    float _2203 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2191);
    float _2205 = _2147 + 1.0;
    float _2207 = fma(_2187, _2199, -0.212114393711090087890625);
    float _2209 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2201);
    float _2211 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2203);
    float _2213 = exp2(_2177);
    float _2215 = fma(_2187, _2207, 1.570728778839111328125);
    float _2217 = _2181 * 0.693147182464599609375;
    float _2219 = sqrt(_2183);
    float _2221 = _2209 * _2197;
    float _2223 = _2211 * _2197;
    float _2225 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = -_2147;
    float _2231 = fma(_2213, _2205, _2229);
    float2 _8248 = float2(_2159, _2195);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8248, float2(0.0), isnan(_8248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8248, float2(0.0), isnan(_8248)), level(0.0)).x;
    float _2235 = fma(_2231, 0.5, 0.5);
    float _2237 = _2219 * 0.636619746685028076171875;
    float _2239 = fma(_2221, 0.5, 0.5);
    float _2241 = -_2215;
    float _2243 = fma(_2237, _2241, 1.0);
    float3 _8271 = float3(_2239, _2227, _2225);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8271, float3(0.0), isnan(_8271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8271, float3(0.0), isnan(_8271)), level(0.0)).x;
    float3 _8282 = float3(_2239, _2227, _2225);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8282, float3(0.0), isnan(_8282)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8282, float3(0.0), isnan(_8282)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _8298 = float2(_2243, _2235);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8298, float2(0.0), isnan(_8298)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8298, float2(0.0), isnan(_8298)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2270 = int(_2268);
    float _2272 = _839 * _841;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    float _2278 = -_1355;
    float _2280 = _2278 + 1.0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2284 = _2282 != 0;
    float _2286 = -_1347;
    float _2288 = _2286 + 1.0;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2292 = _2290 != 0;
    float _2294 = -_1175;
    float _2296 = _2294 + 1.0;
    float _2298 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2300 = int(_2298);
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2304 = _2302 != 0;
    float _2306 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2308 = abs(_1173);
    float _2310 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2312 = abs(_1087);
    float _2314 = -_1351;
    float _2316 = _2314 + 1.0;
    bool _2318 = _1279 != 0;
    float _2320 = trunc(_1357);
    int _2322 = int(_2320);
    float _2324 = float(uint(_2270));
    float _2326 = -_1353;
    float _2328 = _2326 + 1.0;
    float _2330 = trunc(_1315);
    int _2332 = int(_2330);
    float _2334 = float(uint(_2300));
    float _2336 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2310);
    float _2338 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2340 = int(_2338);
    float _2342 = float(uint(_2322));
    float _2344 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2336);
    float _2346 = float(_2270);
    float _2348 = float(_2322);
    float _2350 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2344);
    float _2352 = 1.0 / _2324;
    bool _2354 = _2348 >= _2346;
    bool _2356 = isnan(_2348);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(_2346);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    float _2366 = float(_2332);
    out.gl_Position.x = _2209;
    out.gl_Position.y = _2211;
    out.gl_Position.z = _2350;
    out.gl_Position.w = _2171;
    bool _2368 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2370 = isnan(_737);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = 1.0 / _2334;
    float _2382 = float(uint(_2340));
    int _2384 = as_type<int>(_2352) + (-2);
    float _2386 = 1.0 / _2382;
    int _2388 = ~_2270;
    int _2390 = _2388 + 1;
    float _2392 = as_type<float>(_2384) * _2342;
    int _2394 = as_type<int>(_2380) + (-2);
    float _2396 = trunc(_2392);
    float _2398 = precise::max(_2396, 0.0);
    uint _2401 = uint(_2398);
    float _2403 = float(uint(_2332));
    float _2405 = as_type<float>(_2394) * _2403;
    float _2407 = _843 * _827;
    float _2409 = trunc(_1337);
    int _2411 = int(_2409);
    int _2413 = ~_2300;
    int _2415 = _2413 + 1;
    float _2417 = trunc(_2405);
    float _2419 = precise::max(_2417, 0.0);
    uint _2421 = uint(_2419);
    int _2423 = _2390 * int(_2401);
    int _2425 = _2423 + _2322;
    float _2427 = float(uint(_2425));
    float _2429 = trunc(_2364);
    int _2431 = int(_2429);
    float _2433 = float(uint(_2411));
    float _2435 = as_type<float>(_2384) * _2427;
    float _2437 = floor(_2407);
    int _2439 = _2415 * int(_2421);
    int _2441 = _2439 + _2332;
    float _2443 = float(uint(_2441));
    float _2445 = trunc(_2435);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    float _2451 = as_type<float>(_2394) * _2443;
    int _2453 = as_type<int>(_2386) + (-2);
    int _2455 = ~_2270;
    int _2457 = _2455 + 1;
    float _2459 = floor(_2272);
    float _2461 = as_type<float>(_2453) * _2433;
    float _2463 = -_2437;
    float _2465 = _2407 + _2463;
    float _2467 = _843 * _845;
    int _2469 = ~_2340;
    int _2471 = _2469 + 1;
    float _2473 = trunc(_2451);
    float _2475 = precise::max(_2473, 0.0);
    uint _2477 = uint(_2475);
    int _2479 = int(_2401) + int(_2449);
    float _2481 = float(_2300);
    float _2483 = as_type<float>(_2449);
    float _2485 = _2467;
    float _2487 = as_type<float>(_2394);
    float _2489 = _2211;
    float _2491 = _2209;
    if (_2304)
    {
        float _2493 = in.m_58.w;
        _2483 = _2493;
    }
    float _2495 = _2483;
    int _2497 = ~_2300;
    int _2499 = _2497 + 1;
    int _2501 = _2457 * _2479;
    int _2503 = _2501 + _2322;
    bool _2505 = _2366 >= _2481;
    bool _2507 = isnan(_2366);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan(_2481);
    bool _2513 = _2509 || _2511;
    float _2515 = float(_2513);
    float _2517 = trunc(_2461);
    float _2519 = precise::max(_2517, 0.0);
    uint _2521 = uint(_2519);
    float _2523 = -_2459;
    float _2525 = _2272 + _2523;
    float _2527 = _2465 * _2346;
    float _2529 = _2346 * _869;
    bool _2531 = uint(_2503) >= uint(_2270);
    float _2533 = _2525 * _2481;
    bool _2535 = !_2292;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = trunc(_2527);
    int _2541 = int(_2539);
    int _2543 = int(_2421) + int(_2477);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2547 = _2545 != 0;
    int _2549 = abs(_2537);
    int _2551 = _2499 * _2543;
    int _2553 = _2551 + _2332;
    bool _2555 = !_2547;
    int _2557 = _2555 ? 0 : 1;
    int _2559 = _2471 * int(_2521);
    int _2561 = _2559 + _2411;
    float _2563 = trunc(_2533);
    int _2565 = int(_2563);
    bool _2567 = _2270 == 0;
    float _2569 = float(uint(_2561));
    bool _2571 = !_2531;
    int _2573 = _2571 ? 0 : (-1);
    bool _2575 = uint(_2553) >= uint(_2300);
    float _2577 = trunc(_2515);
    int _2579 = int(_2577);
    int _2581 = ~_2479;
    int _2583 = _2581 + _2573;
    int _2585 = _2583 + 1;
    float _2587 = as_type<float>(_2453) * _2569;
    bool _2589 = !_2575;
    int _2591 = _2589 ? 0 : (-1);
    int _2593 = abs(_2557);
    int _2595 = _2541 * _2549;
    int _2597 = _2595 + _2322;
    int _2599 = ~_2543;
    int _2601 = _2599 + _2591;
    int _2603 = _2601 + 1;
    float _2605 = trunc(_2587);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    int _2611 = _2270 * _2585;
    int _2613 = _2611 + _2322;
    bool _2615 = _2300 == 0;
    int _2617 = _2300 * _2603;
    int _2619 = _2617 + _2332;
    bool _2621 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2623 = isnan(_737);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2629 = _2625 || _2627;
    float _2631 = float(_2629);
    int _2633 = _2565 * _2593;
    int _2635 = _2633 + _2332;
    bool _2637 = !_2567;
    int _2639 = _2637 ? _2613 : (-1);
    float _2641 = trunc(_2529);
    int _2643 = int(_2641);
    int _2645 = ~_2579;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    bool _2651 = !_2615;
    int _2653 = _2651 ? _2619 : (-1);
    int _2655 = ~_2431;
    int _2657 = _2655 + 1;
    int _2659 = _2657 + 1;
    int _2661 = _2300 + (-1);
    int _2663 = _2653 * _2649;
    int _2665 = ~_2340;
    int _2667 = _2665 + 1;
    int _2669 = _2639 * _2659;
    int _2671 = _2270 + (-1);
    int _2673 = _2579 * _2661;
    int _2675 = _2673 + _2663;
    int _2677 = int(_2521) + int(_2609);
    float _2679 = _2481 * _869;
    int _2681 = _2431 * _2671;
    int _2683 = _2681 + _2669;
    int _2685 = abs(_1165);
    float _2687 = exp2(_2306);
    int _2689 = abs(as_type<int>(_1075));
    int _2691 = _2667 * _2677;
    int _2693 = _2691 + _2411;
    float _2695 = as_type<float>(_2693);
    if (_2304)
    {
        float _2697 = _2495 * 3.1415927410125732421875;
        _1101 = _2697;
    }
    float _2699 = _1101;
    bool _2701 = !_2276;
    int _2703 = _2701 ? 0 : 1;
    int _2705 = _2675 * _2685;
    int _2707 = abs(_1081);
    int _2709 = _2683 * _2689;
    float _2711 = trunc(_2679);
    int _2713 = int(_2711);
    bool _2715 = uint(_2693) >= uint(_2340);
    bool _2717 = _2715;
    if (_2304)
    {
        float _2719 = _2699 * 0.15915493667125701904296875;
        _2695 = _2719;
    }
    float _2721 = _2695;
    float _2723 = float(_2340);
    float _2725 = float(_2411);
    int _2727 = abs(_1695);
    float _2729 = _2721;
    if (_2304)
    {
        float _2731 = _2721 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        _2729 = _2733;
    }
    float _2735 = _2729;
    bool _2737 = _2725 >= _2723;
    bool _2739 = isnan(_2725);
    bool _2741 = _2737 || _2739;
    bool _2743 = isnan(_2723);
    bool _2745 = _2741 || _2743;
    float _2747 = float(_2745);
    float _2749 = _2723 * _869;
    float _2751 = -_2687;
    float _2753 = _2751 + 1.0;
    int _2755 = abs(_2703);
    int _2757 = _2643 * _2707;
    int _2759 = _2757 + _2709;
    bool _2761 = !_2715;
    int _2763 = _2761 ? 0 : (-1);
    float _2765 = trunc(_2747);
    int _2767 = int(_2765);
    int _2769 = _2713 * _2308;
    int _2771 = _2769 + _2705;
    int _2773 = abs(_1179);
    int _2775 = _2597 * _2312;
    int _2777 = _2775 + _2759;
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2783 = ~_2677;
    int _2785 = _2783 + _2763;
    int _2787 = _2785 + 1;
    float _2789 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2791 = _2541 * _2755;
    int _2793 = _2791 + _2777;
    bool _2795 = !_2284;
    int _2797 = _2795 ? 0 : 1;
    float _2799 = floor(_2467);
    if (_2304)
    {
        bool _2801 = _2735 > 0.5;
        _2717 = _2801;
    }
    bool _2803 = _2717;
    int _2805 = _2635 * _2773;
    int _2807 = _2805 + _2771;
    int _2809 = abs(_2797);
    int _2811 = _2340 * _2787;
    int _2813 = _2811 + _2411;
    float _2815 = float(uint(_2793));
    float _2817 = trunc(_2749);
    int _2819 = int(_2817);
    bool _2821 = _2340 == 0;
    float _2823 = as_type<float>(_2384) * _2815;
    float _2825 = float(uint(_2597));
    int _2827 = _2565 * _2809;
    int _2829 = _2827 + _2807;
    int _2831 = ~_2767;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = !_2821;
    int _2839 = _2837 ? _2813 : (-1);
    float _2841 = trunc(_2823);
    float _2843 = precise::max(_2841, 0.0);
    uint _2845 = uint(_2843);
    float _2847 = float(uint(_2829));
    float _2849 = -_2799;
    float _2851 = _2467 + _2849;
    if (!_2304)
    {
        _2485 = _191;
    }
    float _2853 = _2485;
    float _2855 = as_type<float>(_2384) * _2825;
    float _2857 = _2853;
    if (_2304)
    {
        float _2859 = -_191;
        float _2861 = _2803 ? _2859 : _191;
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = as_type<float>(_2394) * _2847;
    int _2867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2869 = _2867 != 0;
    int _2871 = _2839 * _2835;
    int _2873 = ~_2270;
    int _2875 = _2873 + 1;
    float _2877 = trunc(_2855);
    float _2879 = precise::max(_2877, 0.0);
    uint _2881 = uint(_2879);
    int _2883 = _2340 + (-1);
    float _2885 = _2851 * _2723;
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2889 = _2887 != 0;
    int _2891 = ~_2300;
    int _2893 = _2891 + 1;
    int _2895 = _2875 * int(_2845);
    int _2897 = _2895 + _2793;
    int _2899 = abs(_1691);
    float _2901 = trunc(_2865);
    float _2903 = precise::max(_2901, 0.0);
    uint _2905 = uint(_2903);
    int _2907 = _2767 * _2883;
    int _2909 = _2907 + _2871;
    bool _2911 = !_2889;
    int _2913 = _2911 ? 0 : 1;
    float _2915 = as_type<float>(_2677);
    if (_2869)
    {
        float _2917 = in.m_58.x;
        _2915 = _2917;
    }
    float _2919 = _2915;
    float _2921 = float(uint(_2897));
    int _2923 = ~_2270;
    int _2925 = _2923 + 1;
    float _2927 = trunc(_2885);
    int _2929 = int(_2927);
    int _2931 = abs(_2913);
    float _2933 = as_type<float>(_2384) * _2921;
    int _2935 = _2925 * int(_2881);
    int _2937 = _2935 + _2597;
    int _2939 = _2893 * int(_2905);
    int _2941 = _2939 + _2829;
    float _2943 = trunc(_2933);
    float _2945 = precise::max(_2943, 0.0);
    uint _2947 = uint(_2945);
    float _2949 = float(uint(_2941));
    int _2951 = _2909 * _2899;
    float _2953 = float(uint(_2937));
    int _2955 = _2929 * _2931;
    int _2957 = _2955 + _2411;
    int _2959 = abs(_1719);
    float _2961 = as_type<float>(_2394) * _2949;
    int _2963 = _2819 * _2727;
    int _2965 = _2963 + _2951;
    float _2967 = float(uint(_2635));
    float _2969 = as_type<float>(_2384) * _2953;
    float _2971 = trunc(_2961);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    int _2977 = ~_2270;
    int _2979 = _2977 + 1;
    int _2981 = _2957 * _2959;
    int _2983 = _2981 + _2965;
    int _2985 = abs(_1723);
    float _2987 = as_type<float>(_2394) * _2967;
    float _2989 = _2967;
    if (_2869)
    {
        float _2991 = _2919 * 3.1415927410125732421875;
        _2989 = _2991;
    }
    float _2993 = _2989;
    float _2995 = 1.0 / _2781;
    int _2997 = int(_2845) + int(_2947);
    float _2999 = _2993;
    if (_2869)
    {
        float _3001 = _2993 * 0.15915493667125701904296875;
        _2999 = _3001;
    }
    float _3003 = _2999;
    int _3005 = ~_2300;
    int _3007 = _3005 + 1;
    int _3009 = _2929 * _2985;
    int _3011 = _3009 + _2983;
    int _3013 = _2979 * _2997;
    int _3015 = _3013 + _2793;
    float _3017 = trunc(_2987);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_2957));
    float _3025 = -_2233;
    float _3027 = _3025 + 1.0;
    int _3029 = int(_2905) + int(_2975);
    float _3031 = -_191;
    int _3033 = _1925 ? as_type<int>(_3031) : as_type<int>(_191);
    float _3035 = as_type<float>(_2453) * _3023;
    bool _3037 = uint(_3015) >= uint(_2270);
    float _3039 = _3003;
    if (_2869)
    {
        float _3041 = _3003 * 6.283185482025146484375;
        float _3043 = sin(_3041);
        _3039 = _3043;
    }
    float _3045 = _3039;
    int _3047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3049 = _3047 != 0;
    int _3051 = _3007 * _3029;
    int _3053 = _3051 + _2829;
    float _3055 = float(uint(_3011));
    int _3057 = ~_2300;
    int _3059 = _3057 + 1;
    bool _3061 = !_3049;
    float _3063 = _3061 ? _191 : as_type<float>(_3033);
    float _3065 = trunc(_2969);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    bool _3071 = uint(_3053) >= uint(_2300);
    float _3073 = as_type<float>(_2453) * _3055;
    int _3075 = _3059 * int(_3021);
    int _3077 = _3075 + _2635;
    bool _3079 = !_3037;
    int _3081 = _3079 ? 0 : (-1);
    int _3083 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3085 = _3083 != 0;
    float _3087 = trunc(_3035);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    float _3093 = float(uint(_3077));
    bool _3095 = !_3071;
    int _3097 = _3095 ? 0 : (-1);
    int _3099 = ~_2997;
    int _3101 = _3099 + _3081;
    int _3103 = _3101 + 1;
    float _3105 = as_type<float>(_2394) * _3093;
    bool _3107 = _3071;
    if (_2869)
    {
        bool _3109 = _3045 > 0.5;
        _3107 = _3109;
    }
    bool _3111 = _3107;
    float _3113 = trunc(_3073);
    float _3115 = precise::max(_3113, 0.0);
    uint _3117 = uint(_3115);
    int _3119 = ~_2340;
    int _3121 = _3119 + 1;
    int _3123 = _2270 * _3103;
    int _3125 = _3123 + _2793;
    int _3127 = ~_3029;
    int _3129 = _3127 + _3097;
    int _3131 = _3129 + 1;
    int _3133 = int(_2881) + int(_3069);
    int _3135 = ~_2340;
    int _3137 = _3135 + 1;
    int _3139 = _3121 * int(_3091);
    int _3141 = _3139 + _2957;
    if (!_2869)
    {
        _2487 = _195;
    }
    float _3143 = _2487;
    int _3145 = _2300 * _3131;
    int _3147 = _3145 + _2829;
    bool _3149 = !_2567;
    int _3151 = _3149 ? _3125 : (-1);
    float _3153 = trunc(_3105);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    float _3159 = float(uint(_3141));
    float _3161 = _3143;
    if (_2869)
    {
        float _3163 = -_195;
        float _3165 = _3111 ? _3163 : _195;
        _3161 = _3165;
    }
    float _3167 = _3161;
    int _3169 = _3137 * int(_3117);
    int _3171 = _3169 + _3011;
    int _3173 = _3151 & 3;
    bool _3175 = _3173 != 0;
    float _3177 = as_type<float>(_2453) * _3159;
    int _3179 = ~_2270;
    int _3181 = _3179 + 1;
    float _3183 = -_195;
    int _3185 = _2318 ? as_type<int>(_3183) : as_type<int>(_195);
    float _3187 = trunc(_3177);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    float _3193 = float(uint(_3171));
    int _3195 = _3181 * _3133;
    int _3197 = _3195 + _2597;
    bool _3199 = uint(_3173) > 1u;
    int _3201 = _3151 & 3;
    bool _3203 = _3201 != 0;
    float _3205 = as_type<float>(_2453) * _3193;
    bool _3207 = !_2615;
    int _3209 = _3207 ? _3147 : (-1);
    int _3211 = _3203 ? 0 : 1;
    int _3213 = _3209 & 3;
    bool _3215 = _3213 != 0;
    float _3217 = trunc(_3205);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    bool _3223 = !_3085;
    float _3225 = _3223 ? _195 : as_type<float>(_3185);
    bool _3227 = uint(_3197) >= uint(_2270);
    int _3229 = ~_3211;
    int _3231 = _3229 + 1;
    int _3233 = _3231 + 1;
    int _3235 = _3233;
    if (!_3199)
    {
        int _3237 = ~_3211;
        int _3239 = _3237 + 1;
        _3235 = _3239;
    }
    int _3241 = _3235;
    bool _3243 = uint(_3213) > 1u;
    bool _3245 = !_3227;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3209 & 3;
    bool _3251 = _3249 != 0;
    int _3253 = ~_2300;
    int _3255 = _3253 + 1;
    int _3257 = _3251 ? 0 : 1;
    int _3259 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3261 = _3259 != 0;
    int _3263 = int(_3021) + int(_3157);
    int _3265 = ~_3257;
    int _3267 = _3265 + 1;
    int _3269 = _3267 + 1;
    int _3271 = _3269;
    if (!_3243)
    {
        int _3273 = ~_3257;
        int _3275 = _3273 + 1;
        _3271 = _3275;
    }
    int _3277 = _3271;
    int _3279 = _3255 * _3263;
    int _3281 = _3279 + _2635;
    bool _3283 = !_3215;
    int _3285 = _3283 ? 0 : 1;
    bool _3287 = _3213 != 3;
    int _3289 = int(_3117) + int(_3221);
    int _3291 = int(_3091) + int(_3191);
    int _3293 = ~_2340;
    int _3295 = _3293 + 1;
    bool _3297 = uint(_3213) >= 2u;
    int _3299 = _3295 * _3289;
    int _3301 = _3299 + _3011;
    int _3303 = ~_2340;
    int _3305 = _3303 + 1;
    int _3307 = _3297 ? 0 : 1;
    float _3309 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3311 = _3309 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3313 = uint(_3281) >= uint(_2300);
    int _3315 = _3305 * _3291;
    int _3317 = _3315 + _2957;
    float _3319 = 1.0 / _3311;
    int _3321 = ~_3307;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    int _3327 = _3325;
    if (_3287)
    {
        int _3329 = ~_3307;
        int _3331 = _3329 + 1;
        _3327 = _3331;
    }
    int _3333 = _3327;
    float _3335 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3337 = _3335 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3339 = uint(_3301) >= uint(_2340);
    bool _3341 = !_3313;
    int _3343 = _3341 ? 0 : (-1);
    float _3345 = 1.0 / _3337;
    bool _3347 = uint(_3317) >= uint(_2340);
    bool _3349 = !_3339;
    int _3351 = _3349 ? 0 : (-1);
    bool _3353 = _827 > 0.5;
    bool _3355 = !_3347;
    int _3357 = _3355 ? 0 : (-1);
    bool _3359 = _3213 != 3;
    float _3361 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3363 = _3361 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3365 = -_191;
    int _3367 = _3353 ? as_type<int>(_3365) : as_type<int>(_191);
    float _3369 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3371 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3369;
    bool _3373 = !_3359;
    int _3375 = _3373 ? 0 : (-1);
    float _3377 = 1.0 / _3363;
    bool _3379 = !_3261;
    float _3381 = _3379 ? _191 : as_type<float>(_3367);
    float _3383 = _3371 * _3319;
    int _3385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3387 = _3385 != 0;
    float _3389 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3391 = _3389 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3395 = _3393 != 0;
    int _3397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3399 = _3397 != 0;
    float _3401 = _3391 * _3345;
    bool _3403 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3405 = isnan(_737);
    bool _3407 = _3403 || _3405;
    bool _3409 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3411 = _3407 || _3409;
    float _3413 = float(_3411);
    float _3415 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3417 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3415;
    bool _3419 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3421 = isnan(_737);
    bool _3423 = _3419 || _3421;
    bool _3425 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3427 = _3423 || _3425;
    float _3429 = float(_3427);
    float _3431 = -_3413;
    float _3433 = _3431 + 1.0;
    bool _3435 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3437 = isnan(_737);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3443 = _3439 || _3441;
    float _3445 = float(_3443);
    float _3447 = -_3429;
    float _3449 = _3447 + 1.0;
    float _3451 = _3417 * _3377;
    float _3453 = _3429 * _3433;
    float _3455 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3457 = _3455 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3459 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3461 = isnan(_737);
    bool _3463 = _3459 || _3461;
    bool _3465 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3467 = _3463 || _3465;
    float _3469 = float(_3467);
    float _3471 = _3445 * _3449;
    float _3473 = -_3445;
    float _3475 = _3473 + 1.0;
    float _3477 = -_2631;
    float _3479 = _3477 + 1.0;
    float _3481 = 1.0 / _3457;
    float _3483 = -_3469;
    float _3485 = _3483 + 1.0;
    float _3487 = _3469 * _3475;
    float _3489 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3491 = _3489 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3493 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3495 = isnan(_737);
    bool _3497 = _3493 || _3495;
    bool _3499 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3501 = _3497 || _3499;
    float _3503 = float(_3501);
    float _3505 = _2378 * _3479;
    float _3507 = -_2378;
    float _3509 = _3507 + 1.0;
    bool _3511 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3513 = isnan(_737);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3519 = _3515 || _3517;
    float _3521 = float(_3519);
    float _3523 = 1.0 / _3491;
    float _3525 = _2631 * _3485;
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3529 = _737 + _3527;
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3535 = _3503 * _3509;
    float _3537 = -_3503;
    float _3539 = _3537 + 1.0;
    float _3541 = fma(_3383, _3529, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3545 = _3543 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3547 = 1.0 / _3533;
    float _3549 = _3521 * _3539;
    float _3551 = _3545 * _3481;
    float _3553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3555 = _737 + _3553;
    float _3557 = _3541 * _3549;
    float _3559 = -_3521;
    float _3561 = _3559 + 1.0;
    float _3563 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3565 = _3563 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3567 = fma(_3401, _3555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3569 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3571 = _737 + _3569;
    float _3573 = fma(_3561, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3557);
    float _3575 = _3565 * _3523;
    float _3577 = abs(_1799);
    float _3579 = log2(_3577);
    float _3581 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3583 = _737 + _3581;
    float _3585 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3585;
    float _3589 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3591 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3589;
    float _3593 = fma(_3567, _3535, _3573);
    float _3595 = fma(_3451, _3583, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3597 = fma(_3551, _3571, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3599 = _3587 * _3547;
    float _3601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3603 = _3591 * _2995;
    float _3605 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3607 = _737 + _3605;
    float _3609 = fma(_3595, _3505, _3593);
    float _3611 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3613 = _737 + _3611;
    float _3615 = _2863 + 0.5;
    float _3617 = fma(_3603, _3607, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3619 = fma(_3597, _3525, _3609);
    float _3621 = _3579 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3623 = _3167 + (-0.5);
    float _3625 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3627 = _737 + _3625;
    float _3629 = fma(_3575, _3613, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3631 = fma(_3617, _3487, _3619);
    float _3633 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1093);
    float _3635 = -_3623;
    float _3637 = -_1361;
    float _3639 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3637);
    float _3641 = -_1071;
    float _3643 = _3641 + 1.0;
    float _3645 = _3381 + 0.5;
    float _3647 = exp2(_3621);
    float _3649 = -_907;
    float _3651 = _3649 + 1.0;
    float _3653 = _3225 + (-0.5);
    float _3655 = fma(_3629, _3471, _3631);
    float _3657 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[80].x, _961);
    float _3659 = -_3643;
    float _3661 = fma(_3659, _2863, _3633);
    float _3663 = fma(_3651, _3167, _3639);
    float _3665 = -_3653;
    float _3667 = -_1105;
    float _3669 = fma(_3665, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3667);
    float _3671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3673 = _3601 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3675 = _3063 + 0.5;
    int _3677 = _3209 >> 31;
    out.m_74.x = _3661;
    out.m_74.y = _3663;
    int _3679 = ~_3289;
    int _3681 = _3679 + _3351;
    int _3683 = _3681 + 1;
    float _3685 = fma(_3673, _3675, _1183);
    int _3687 = _3677 & 3;
    float _3689 = _1663 + (-0.5);
    float _3691 = -_2280;
    float _3693 = fma(_3063, _3691, _3685);
    int _3695 = _3209 + _3687;
    float _3697 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3699 = int(_3697);
    float _3701 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3703 = precise::clamp(_3701, 0.0, 1.0);
    int _3705 = _3695 >> 2;
    float _3707 = _3671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3709 = -_1359;
    float _3711 = _3709 + 1.0;
    float _3713 = fma(_3703, -2.0, 3.0);
    float _3715 = _3703 * _3703;
    float _3717 = -_3707;
    float _3719 = -_1251;
    float _3721 = fma(_3717, _3689, _3719);
    int _3723 = _3705 << 4;
    int _3725 = _3723 + 656;
    float _3727 = -_2288;
    float _3729 = fma(_3381, _3727, _3657);
    float _3731 = _3715 * _3713;
    float _3733 = fma(_3225, _3711, _3669);
    uint _3735 = uint(int(uint(_3725) >> uint(2)));
    uint _3737 = uint(int(uint(int(_3735)) >> uint(2)));
    int _3739 = int(_3735) & 3;
    float _3741 = (*spvDescriptorSet0.vp_c9)._m0[int(_3737)][_3739];
    int _3743 = int(_3735) + 1;
    uint _3745 = uint(int(uint(_3743) >> uint(2)));
    int _3747 = _3743 & 3;
    float _3749 = (*spvDescriptorSet0.vp_c9)._m0[int(_3745)][_3747];
    float _3751 = fma(_1663, _2296, _3721);
    float _3753 = -_3731;
    float _3755 = _3753 + 1.0;
    float _3757 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3759 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3761 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3763 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3731);
    out.m_76.x = _3729;
    out.m_76.y = _3733;
    out.m_76.z = _3693;
    out.m_76.w = _3751;
    int _3765 = _3725 + 8;
    uint _3767 = uint(int(uint(_3765) >> uint(2)));
    uint _3769 = uint(int(uint(int(_3767)) >> uint(2)));
    int _3771 = int(_3767) & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = int(_3767) + 1;
    uint _3777 = uint(int(uint(_3775) >> uint(2)));
    int _3779 = _3775 & 3;
    float _3781 = (*spvDescriptorSet0.vp_c9)._m0[int(_3777)][_3779];
    float _3783 = -_1545;
    float _3785 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3757);
    float _3787 = -_1545;
    float _3789 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3759);
    float _3791 = -_1545;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3761);
    int _3795 = ~_3291;
    int _3797 = _3795 + _3357;
    int _3799 = _3797 + 1;
    float _3801 = fma(_3599, _3627, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3803 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3789);
    int _3805 = ~_3263;
    int _3807 = _3805 + _3343;
    int _3809 = _3807 + 1;
    int _3811 = _2340 * _3683;
    int _3813 = _3811 + _3011;
    float _3815 = fma(_3801, _3453, _3655);
    int _3817 = _2340 * _3799;
    int _3819 = _3817 + _2957;
    float _3821 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3823 = _2300 * _3809;
    int _3825 = _3823 + _2635;
    float _3827 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3829 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3831 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3833 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3835 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3827);
    int _3837 = abs(_3277);
    float _3839 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3829);
    float _3841 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3831);
    bool _3843 = !_3395;
    int _3845 = _3843 ? 0 : 1;
    float _3847 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3849 = ~_3837;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    float _3855 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3839);
    int _3857 = abs(_3285);
    float _3859 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3861 = uint(_3173) >= 2u;
    float _3863 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3833);
    int _3865 = ~_3857;
    int _3867 = _3865 + 1;
    int _3869 = _3867 + 1;
    float _3871 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3847);
    int _3873 = abs(_3845);
    float _3875 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3859);
    int _3877 = abs(_3375);
    float _3879 = fma(_3413, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3815);
    int _3881 = _3861 ? 0 : 1;
    float _3883 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3871);
    bool _3885 = _3173 != 3;
    float _3887 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3875);
    int _3889 = ~_3877;
    int _3891 = _3889 + 1;
    int _3893 = _3891 + 1;
    int _3895 = _3853 * as_type<int>(_3749);
    int _3897 = abs(_3333);
    float _3899 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3785);
    bool _3901 = !_2821;
    int _3903 = _3901 ? _3813 : (-1);
    int _3905 = _3869 * as_type<int>(_3741);
    int _3907 = _3905 + _3895;
    int _3909 = ~_3897;
    int _3911 = _3909 + 1;
    int _3913 = _3911 + 1;
    float _3915 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3793);
    int _3917 = _3151 >> 31;
    out.m_78.x = _3879;
    int _3919 = ~_3881;
    int _3921 = _3919 + 1;
    int _3923 = _3921 + 1;
    int _3925 = _3913 * as_type<int>(_3773);
    int _3927 = _3925 + _3907;
    int _3929 = _3917 & 3;
    int _3931 = ~_3873;
    int _3933 = _3931 + 1;
    int _3935 = _3933 + 1;
    int _3937 = _3893 * as_type<int>(_3781);
    int _3939 = _3937 + _3927;
    int _3941 = _3151 + _3929;
    float _3943 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3835);
    int _3945 = abs(_3699);
    int _3947 = _3939 * _3935;
    float _3949 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3841);
    float _3951 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3863);
    float _3953 = float(uint(_3699));
    float _3955 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3957 = _3941 >> 2;
    float _3959 = _3955 * _3899;
    int _3961 = _3923;
    if (_3885)
    {
        int _3963 = ~_3881;
        int _3965 = _3963 + 1;
        _3961 = _3965;
    }
    int _3967 = _3961;
    float _3969 = 1.0 / _3953;
    int _3971 = _3903 >> 31;
    float _3973 = fma(_3821, _3949, _3959);
    bool _3975 = !_2615;
    int _3977 = _3975 ? _3825 : (-1);
    out.m_80.x = _3949;
    out.m_80.y = _3943;
    out.m_80.z = _3951;
    int _3979 = _3903 & 3;
    bool _3981 = _3979 != 0;
    float _3983 = _3855 + _3973;
    float _3985 = float(uint(_3945));
    int _3987 = _3977 * _3873;
    int _3989 = _3987 + _3947;
    int _3991 = _3957 << 4;
    int _3993 = _3991 + 368;
    float _3995 = _3955 * _3803;
    int _3997 = _3903 & 3;
    bool _3999 = _3997 != 0;
    int _4001 = _3971 & 3;
    uint _4003 = uint(int(uint(_3993) >> uint(2)));
    uint _4005 = uint(int(uint(int(_4003)) >> uint(2)));
    int _4007 = int(_4003) & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = int(_4003) + 1;
    uint _4013 = uint(int(uint(_4011) >> uint(2)));
    int _4015 = _4011 & 3;
    float _4017 = (*spvDescriptorSet0.vp_c9)._m0[int(_4013)][_4015];
    int _4019 = _3981 ? 0 : 1;
    float _4021 = 1.0 / _3985;
    bool _4023 = uint(_3997) > 1u;
    float _4025 = fma(_3821, _3943, _3995);
    int _4027 = _3903 + _4001;
    int _4029 = abs(_3989);
    int _4031 = _4027 >> 2;
    int _4033 = ~_4019;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = _4031 << 4;
    int _4041 = _4039 + 800;
    bool _4043 = _1799 <= 8000.0;
    bool _4045 = isnan(_1799);
    bool _4047 = _4043 || _4045;
    bool _4049 = isnan(8000.0);
    bool _4051 = _4047 || _4049;
    float _4053 = float(_4051);
    int _4055 = _4037;
    if (!_4023)
    {
        int _4057 = ~_4019;
        int _4059 = _4057 + 1;
        _4055 = _4059;
    }
    int _4061 = _4055;
    uint _4063 = uint(int(uint(_4041) >> uint(2)));
    uint _4065 = uint(int(uint(int(_4063)) >> uint(2)));
    int _4067 = int(_4063) & 3;
    float _4069 = (*spvDescriptorSet0.vp_c9)._m0[int(_4065)][_4067];
    int _4071 = int(_4063) + 1;
    uint _4073 = uint(int(uint(_4071) >> uint(2)));
    int _4075 = _4071 & 3;
    float _4077 = (*spvDescriptorSet0.vp_c9)._m0[int(_4073)][_4075];
    int _4079 = as_type<int>(_3969) + (-2);
    float _4081 = _4053 * _3763;
    float _4083 = float(uint(_3989));
    int _4085 = ~_3133;
    int _4087 = _4085 + _3247;
    int _4089 = _4087 + 1;
    float _4091 = as_type<float>(_4079) * _4083;
    int _4093 = as_type<int>(_4021) + (-2);
    int _4095 = _3993 + 8;
    uint _4097 = uint(int(uint(_4095) >> uint(2)));
    uint _4099 = uint(int(uint(int(_4097)) >> uint(2)));
    int _4101 = int(_4097) & 3;
    float _4103 = (*spvDescriptorSet0.vp_c9)._m0[int(_4099)][_4101];
    int _4105 = int(_4097) + 1;
    uint _4107 = uint(int(uint(_4105) >> uint(2)));
    int _4109 = _4105 & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    float _4113 = float(uint(_4029));
    int _4115 = _2270 * _4089;
    int _4117 = _4115 + _2597;
    float _4119 = _3955 * _3915;
    float _4121 = trunc(_4091);
    float _4123 = precise::max(_4121, 0.0);
    uint _4125 = uint(_4123);
    bool _4127 = !_3175;
    int _4129 = _4127 ? 0 : 1;
    float _4131 = as_type<float>(_4093) * _4113;
    bool _4133 = uint(_3997) >= 2u;
    int _4135 = _4041 + 8;
    uint _4137 = uint(int(uint(_4135) >> uint(2)));
    uint _4139 = uint(int(uint(int(_4137)) >> uint(2)));
    int _4141 = int(_4137) & 3;
    float _4143 = (*spvDescriptorSet0.vp_c9)._m0[int(_4139)][_4141];
    int _4145 = int(_4137) + 1;
    uint _4147 = uint(int(uint(_4145) >> uint(2)));
    int _4149 = _4145 & 3;
    float _4151 = (*spvDescriptorSet0.vp_c9)._m0[int(_4147)][_4149];
    bool _4153 = _3997 != 3;
    float _4155 = fma(_3821, _3951, _4119);
    int _4157 = ~_3699;
    int _4159 = _4157 + 1;
    float _4161 = trunc(_4131);
    float _4163 = precise::max(_4161, 0.0);
    uint _4165 = uint(_4163);
    int _4167 = _4133 ? 0 : 1;
    bool _4169 = _3173 != 3;
    int _4171 = ~_3945;
    int _4173 = _4171 + 1;
    int _4175 = abs(_3241);
    int _4177 = _4159 * int(_4125);
    int _4179 = _4177 + _3989;
    float _4181 = fma(_3955, _3955, 1.0);
    int _4183 = ~_4175;
    int _4185 = _4183 + 1;
    int _4187 = _4185 + 1;
    int _4189 = ~_4167;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    int _4195 = _4193;
    if (_4153)
    {
        int _4197 = ~_4167;
        int _4199 = _4197 + 1;
        _4195 = _4199;
    }
    int _4201 = _4195;
    int _4203 = _4173 * int(_4165);
    int _4205 = _4203 + _4029;
    float _4207 = float(uint(_4179));
    int _4209 = _4187 * as_type<int>(_4017);
    bool _4211 = !_3999;
    int _4213 = _4211 ? 0 : 1;
    float _4215 = rsqrt(_4181);
    int _4217 = abs(_4129);
    float _4219 = as_type<float>(_4079) * _4207;
    float _4221 = float(uint(_4205));
    int _4223 = abs(_4213);
    int _4225 = abs(_4061);
    float _4227 = trunc(_4219);
    float _4229 = precise::max(_4227, 0.0);
    uint _4231 = uint(_4229);
    float _4233 = as_type<float>(_4093) * _4221;
    int _4235 = abs(_3967);
    int _4237 = abs(_4201);
    float _4239 = _3955 * _4215;
    int _4241 = ~_4225;
    int _4243 = _4241 + 1;
    int _4245 = _4243 + 1;
    float _4247 = trunc(_4233);
    float _4249 = precise::max(_4247, 0.0);
    uint _4251 = uint(_4249);
    int _4253 = ~_4217;
    int _4255 = _4253 + 1;
    int _4257 = _4255 + 1;
    int _4259 = ~_4223;
    int _4261 = _4259 + 1;
    int _4263 = _4261 + 1;
    int _4265 = _4245 * as_type<int>(_4077);
    int _4267 = _4257 * as_type<int>(_4009);
    int _4269 = _4267 + _4209;
    int _4271 = _4263 * as_type<int>(_4069);
    int _4273 = _4271 + _4265;
    int _4275 = ~_4235;
    int _4277 = _4275 + 1;
    int _4279 = _4277 + 1;
    int _4281 = ~_4237;
    int _4283 = _4281 + 1;
    int _4285 = _4283 + 1;
    bool _4287 = _3997 != 3;
    int _4289 = _4279 * as_type<int>(_4103);
    int _4291 = _4289 + _4269;
    float _4293 = -_3855;
    float _4295 = _4239 * _4293;
    int _4297 = _4285 * as_type<int>(_4143);
    int _4299 = _4297 + _4273;
    float _4301 = -_3883;
    float _4303 = _4239 * _4301;
    bool _4305 = !_4169;
    int _4307 = _4305 ? 0 : (-1);
    float _4309 = fma(_4215, _3899, _4295);
    int _4311 = int(_4125) + int(_4231);
    float _4313 = fma(_4215, _3803, _4303);
    bool _4315 = !_4287;
    int _4317 = _4315 ? 0 : (-1);
    float _4319 = -_3887;
    float _4321 = _4239 * _4319;
    int _4323 = abs(_4307);
    int _4325 = ~_3699;
    int _4327 = _4325 + 1;
    int _4329 = abs(_4317);
    int _4331 = ~_3945;
    int _4333 = _4331 + 1;
    int _4335 = _4327 * _4311;
    int _4337 = _4335 + _3989;
    float _4339 = fma(_4215, _3915, _4321);
    int _4341 = int(_4165) + int(_4251);
    float _4343 = _3883 + _4025;
    float _4345 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _4347 = ~_4323;
    int _4349 = _4347 + 1;
    int _4351 = _4349 + 1;
    out.m_82.x = _4309;
    out.m_82.y = _4313;
    out.m_82.z = _4339;
    bool _4353 = uint(_4337) >= uint(_3699);
    int _4355 = _4333 * _4341;
    int _4357 = _4355 + _4029;
    int _4359 = ~_4329;
    int _4361 = _4359 + 1;
    int _4363 = _4361 + 1;
    int _4365 = _4351 * as_type<int>(_4111);
    int _4367 = _4365 + _4291;
    bool _4369 = !_3387;
    int _4371 = _4369 ? 0 : 1;
    float _4373 = _3027 * _4345;
    float _4375 = precise::clamp(_4373, 0.0, 1.0);
    bool _4377 = !_4353;
    int _4379 = _4377 ? 0 : (-1);
    int _4381 = _4363 * as_type<int>(_4151);
    int _4383 = _4381 + _4299;
    bool _4385 = uint(_4357) >= uint(_3945);
    int _4387 = _3989 ^ _3699;
    int _4389 = abs(_4371);
    float _4391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4393 = ~_4311;
    int _4395 = _4393 + _4379;
    int _4397 = _4395 + 1;
    bool _4399 = !_4385;
    int _4401 = _4399 ? 0 : (-1);
    uint _4403 = uint(int(uint(_4387) >> uint(31)));
    int _4405 = _3699 * _4397;
    int _4407 = _4405 + _3989;
    int _4409 = ~_4389;
    int _4411 = _4409 + 1;
    int _4413 = _4411 + 1;
    int _4415 = ~_4401;
    int _4417 = _4341 + _4415;
    int _4419 = _4417 + 1;
    int _4421 = ~int(_4403);
    int _4423 = _4421 + 1;
    int _4425 = _4367 * _4413;
    bool _4427 = _3699 == 0;
    float _4429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4431 = !_3399;
    int _4433 = _4431 ? 0 : 1;
    int _4435 = _4419 ^ _4423;
    bool _4437 = !_4427;
    int _4439 = _4437 ? _4407 : (-1);
    float _4441 = _3887 + _4155;
    int _4443 = abs(_4433);
    int _4445 = ~_4423;
    int _4447 = _4445 + _4435;
    int _4449 = _4447 + 1;
    float _4451 = float(_4439);
    float _4453 = _4391 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4455 = ~_4443;
    int _4457 = _4455 + 1;
    int _4459 = _4457 + 1;
    out.m_84.x = _3983;
    out.m_84.y = _4343;
    out.m_84.z = _4441;
    bool _4461 = _3699 == 0;
    float _4463 = fma(_4453, _4451, _1365);
    float _4465 = _1019 + 0.5;
    int _4467 = _4383 * _4459;
    bool _4469 = !_4461;
    int _4471 = _4469 ? _4449 : (-1);
    float _4473 = fma(_4453, _4465, _4463);
    bool _4475 = !_2821;
    int _4477 = _4475 ? _3819 : (-1);
    float _4479 = in.m_86.x;
    float _4481 = float(_4471);
    float _4483 = _4429 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4485 = _1003 + (-0.5);
    int _4487 = _4477 * _4443;
    int _4489 = _4487 + _4467;
    bool _4491 = !_2567;
    int _4493 = _4491 ? _4117 : (-1);
    float _4495 = -_1367;
    float _4497 = fma(_4483, _4481, _4495);
    float _4499 = -_2316;
    float _4501 = fma(_1019, _4499, _4473);
    float _4503 = _2171 * 0.5;
    float _4505 = float(_4489);
    float _4507 = -_4483;
    float _4509 = fma(_4507, _4485, _4497);
    int _4511 = _4493 * _4389;
    int _4513 = _4511 + _4425;
    float _4515 = _2350 + _2171;
    float _4517 = fma(_2211, -0.5, _4503);
    float _4519 = fma(_1003, _2328, _4509);
    out.m_88.w = _4505;
    float _4521 = float(_4513);
    float _4523 = _2209 + _2171;
    float _4525 = -_4375;
    float _4527 = fma(_4525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4529 = _4515 * 0.5;
    float _4531 = _4523 * 0.5;
    out.m_90.x = _4501;
    out.m_90.y = _4519;
    float _4533 = _2789 * _2245;
    float _4535 = _4527 * _4479;
    float _4537 = -_2789;
    float _4539 = _4537 + 1.0;
    out.m_92.x = _4531;
    out.m_92.y = _4517;
    out.m_92.z = _4529;
    out.m_92.w = _2171;
    float _4541 = _2256 * _4533;
    float _4543 = _2266 * _4533;
    float _4545 = _4535 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4547 = _2256 * _4539;
    float _4549 = fma(_2262, _4541, _2250);
    float _4551 = fma(_2264, _4541, _2252);
    float _4553 = fma(_2256, _4543, _2254);
    out.m_94.x = _4545;
    bool _4555 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4557 = isnan(_1939);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4563 = _4559 || _4561;
    float _4565 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4549;
    out.m_96.y = _4551;
    out.m_96.z = _4553;
    out.m_96.w = _4547;
    out.m_88.x = _4521;
    float _4567 = _4535;
    float _4569 = _4533;
    float _4571 = _4521;
    float _4573 = _4541;
    if (!_4563)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4575 = _2489;
    float _4577 = _4575;
    float _4579 = _4575;
    if (!_4563)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4581 = _2491;
    float _4583 = _4581;
    float _4585 = _4581;
    if (!_4563)
    {
        _4567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4587 = _4567;
    float _4589 = _4587;
    float _4591 = _4587;
    if (!_4563)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4593 = _4569;
    float _4595 = _4593;
    float _4597 = _4593;
    if (!_4563)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4599 = _4571;
    float _4601 = _4599;
    float _4603 = _4599;
    if (!_4563)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4605 = _4573;
    bool _4607 = !_4563;
    float _4609 = _4605;
    float _4611 = _4605;
    if (!_4607)
    {
        bool _4613 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4615 = isnan(_1939);
        bool _4617 = _4613 || _4615;
        bool _4619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4621 = _4617 || _4619;
        if (!_4621)
        {
            float _4623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4625 = _1939 + _4623;
            float _4627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4627;
            float _4631 = 1.0 / _4629;
            float _4633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4635 = _4633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4637 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4639 = _4637 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4643 = _4641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4647 = _4645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4653 = _4625 * _4631;
            float _4655 = precise::clamp(_4653, 0.0, 1.0);
            float _4657 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4659 = _4657 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4661 = fma(_4655, _4635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4663 = fma(_4655, _4659, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4665 = fma(_4655, _4639, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4667 = fma(_4655, _4643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4669 = fma(_4655, _4647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4671 = fma(_4655, _4651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4585 = _4663;
            _4603 = _4669;
            _4579 = _4661;
            _4597 = _4667;
            _4591 = _4665;
            _4611 = _4671;
            _4673 = true;
        }
        else
        {
            bool _4675 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4677 = isnan(_1939);
            bool _4679 = _4675 || _4677;
            bool _4681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4683 = _4679 || _4681;
            if (!_4683)
            {
                _4577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4685 = _4577;
            _4579 = _4685;
            if (!_4683)
            {
                _4583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4687 = _4583;
            _4585 = _4687;
            if (!_4683)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4689 = _4589;
            _4591 = _4689;
            if (!_4683)
            {
                _4595 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4691 = _4595;
            _4597 = _4691;
            if (!_4683)
            {
                _4601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4693 = _4601;
            _4603 = _4693;
            if (!_4683)
            {
                _4609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4695 = _4609;
            bool _4697 = !_4683;
            _4611 = _4695;
            if (!_4697)
            {
                bool _4699 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4701 = isnan(_1939);
                bool _4703 = _4699 || _4701;
                bool _4705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4707 = _4703 || _4705;
                if (!_4707)
                {
                    float _4709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4711 = _1939 + _4709;
                    float _4713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4713;
                    float _4717 = 1.0 / _4715;
                    float _4719 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4721 = _4719 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4723 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4725 = _4723 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4729 = _4727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4733 = _4731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4739 = _4711 * _4717;
                    float _4741 = precise::clamp(_4739, 0.0, 1.0);
                    float _4743 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4745 = _4743 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4747 = fma(_4741, _4721, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4749 = fma(_4741, _4745, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4751 = fma(_4741, _4725, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4753 = fma(_4741, _4729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4755 = fma(_4741, _4733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4757 = fma(_4741, _4737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4585 = _4749;
                    _4603 = _4755;
                    _4579 = _4747;
                    _4597 = _4753;
                    _4591 = _4751;
                    _4611 = _4757;
                    _4673 = true;
                }
                else
                {
                    _4585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4597 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4673 = false;
    float _4759 = _4585;
    float _4761 = _4603;
    float _4763 = _4579;
    float _4765 = _4597;
    float _4767 = _4591;
    float _4769 = _4611;
    float _4771 = fma(_4343, -0.5, 0.5);
    float _4773 = precise::clamp(_4771, 0.0, 1.0);
    float _4775 = -_4759;
    float _4777 = _4775 + _4761;
    float _4779 = -_4763;
    float _4781 = _4779 + _4765;
    out.m_98.x = 0.0;
    float _4783 = fma(_4773, _4777, _4759);
    float _4785 = -_4767;
    float _4787 = _4785 + _4769;
    float _4789 = fma(_4773, _4781, _4763);
    float _4791 = _4783 * 0.586610972881317138671875;
    bool _4793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4795 = fma(_4773, _4787, _4767);
    float _4797 = _4565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4799 = fma(_4789, 0.298911988735198974609375, _4791);
    bool _4801 = _1909 > 0.0;
    bool _4803 = isnan(_1909);
    bool _4805 = _4801 || _4803;
    bool _4807 = isnan(0.0);
    bool _4809 = _4805 || _4807;
    float _4811 = fma(_4795, 0.114477999508380889892578125, _4799);
    out.m_53.x = _4797;
    float _4813 = -_4811;
    float _4815 = _4789 + _4813;
    float _4817 = -_4811;
    float _4819 = _4783 + _4817;
    float _4821 = -_4811;
    float _4823 = _4795 + _4821;
    float _4825 = fma(_4815, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    float _4827 = fma(_4819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    float _4829 = fma(_4823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    bool _4831 = !_4793;
    if (!_4831)
    {
        float _4833 = -_1853;
        float _4835 = _4833 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4837 = -_1855;
        float _4839 = _4837 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4841 = -_1857;
        float _4843 = _4841 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4845 = _4835 * _4835;
        float _4847 = fma(_4839, _4839, _4845);
        float _4849 = fma(_4843, _4843, _4847);
        float _4851 = sqrt(_4849);
        float _4853 = rsqrt(_4849);
        float _4855 = -_4851;
        float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4859 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4861 = precise::clamp(_4859, 0.0, 1.0);
        float _4863 = _4839 * _4853;
        float _4865 = _4835 * _4853;
        float _4867 = abs(_4861);
        float _4869 = log2(_4867);
        float _4871 = _4843 * _4853;
        float _4873 = _4863 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4875 = _4343 * _4865;
        float _4877 = -_4865;
        float _4879 = -_4873;
        float _4881 = fma(_4877, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4879);
        float _4883 = fma(_3983, _4863, _4875);
        float _4885 = -_4871;
        float _4887 = fma(_4885, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4881);
        float _4889 = fma(_4441, _4871, _4883);
        float _4891 = precise::clamp(_4889, 0.0, 1.0);
        float _4893 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4895 = _4887 + _4893;
        float _4897 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4899 = _4895 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4901 = precise::clamp(_4899, 0.0, 1.0);
        float _4903 = exp2(_4897);
        float _4905 = _4903 * _4901;
        float _4907 = _4891 * _4905;
        float _4909 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4911 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4913 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4909;
        out.m_98.y = _4911;
        out.m_98.z = _4913;
    }
    out.m_100.x = _4825;
    out.m_100.y = _4827;
    out.m_100.z = _4829;
    if (_4809)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4915 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4915;
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
    bool _4673 = false;
    bool _589 = false;
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
        float _4984 = as_type<float>(_143);
        out.gl_Position.z = _4984;
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
        float _5047 = as_type<float>(_175);
        out.gl_Position.z = _5047;
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
    bool _419 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _421 = isnan(_409);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _439 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_409);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = 1.0 / _417;
    float _453 = -_429;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _457;
    bool _461 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _463 = isnan(_409);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = _449 * _455;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _481 = 1.0 / _433;
    float _483 = _471 * _477;
    float _485 = -_471;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _437;
    float _491 = _459 * _451;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _497 = fma(_491, _413, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _499 = _495 * _481;
    bool _501 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_409);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _519 = _409 + _517;
    float _521 = _497 * _483;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _409 + _523;
    float _527 = -_511;
    float _529 = _527 + 1.0;
    float _531 = fma(_499, _519, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _533 = _515 * _489;
    float _535 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _537 = _429 * _529;
    float _539 = fma(_533, _525, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _541 = fma(_531, _473, _535);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = fma(_539, _537, _541);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _549 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _551 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[118].x, _545);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _559 = in.m_60.x;
    float _561 = in.m_60.y;
    float _563 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _549;
    out.m_62.y = _563;
    out.m_62.z = _555;
    out.m_62.w = _557;
    float _565 = _383 * _561;
    float _567 = _381 * _559;
    bool _569 = !_479;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _169;
    }
    _589 = false;
    float _591 = _587;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _595 = _591 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _601 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _603 = isnan(_591);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _617 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_591);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _635 = isnan(_591);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _599;
    float _647 = -_611;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _653 = 1.0 / _615;
    float _655 = _631 * _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _661 = -_643;
    float _663 = _661 + 1.0;
    float _665 = fma(_655, _595, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _667 = _627 * _649;
    float _669 = -_627;
    float _671 = _669 + 1.0;
    float _673 = _611 * _663;
    float _675 = _659 * _653;
    float _677 = _665 * _667;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _681 = _591 + _679;
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[131].x, _677);
    float _685 = fma(_675, _681, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _689 = fma(_685, _673, _683);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[133].x, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_64.x = _697;
    out.m_64.y = _699;
    out.m_64.z = _701;
    out.m_64.w = _703;
    bool _705 = !_651;
    float _707 = _695;
    int _709 = as_type<int>(_697);
    int _711 = as_type<int>(_677);
    float _713 = _683;
    float _715 = _611;
    float _717 = _691;
    if (!_705)
    {
        float _719 = in.m_58.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _707 = _727;
        _171 = _733;
    }
    float _735 = _707;
    float _737 = _171;
    float _739 = in.m_58.z;
    float _741 = in.m_58.w;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _745 = _743 != 0;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _749 = _735;
    if (_745)
    {
        float _751 = in.m_58.x;
        float _753 = in.m_58.y;
        _747 = _751;
        _749 = _753;
    }
    float _755 = _747;
    float _757 = _749;
    float _759 = 0.0;
    if (_745)
    {
        _759 = 1.0;
    }
    float _761 = _759;
    float _763 = 0.0;
    float _765 = _761;
    if (_745)
    {
        _763 = 1.0;
    }
    float _767 = _763;
    float _769 = _767;
    if (_745)
    {
        _709 = 0;
    }
    int _771 = _709;
    int _773 = _771;
    if (_745)
    {
        _711 = 0;
    }
    int _775 = _711;
    float _777 = _739 * 2.0;
    float _779 = floor(_777);
    float _781 = 0.0;
    float _783 = _755;
    float _785 = _757;
    int _787 = _775;
    if (_745)
    {
        _781 = _755;
    }
    float _789 = _781;
    float _791 = _789;
    if (_745)
    {
        _713 = _757;
    }
    float _793 = _713;
    float _795 = _793;
    if (_745)
    {
        _715 = _789;
    }
    float _797 = _715;
    float _799 = _797;
    if (_745)
    {
        _717 = _789;
    }
    float _801 = _717;
    float _803 = _801;
    if (!_745)
    {
        float _805 = in.m_58.x;
        float _807 = in.m_58.y;
        float _809 = in.m_58.z;
        float _811 = _805 * 3.1415927410125732421875;
        float _813 = _811 * 0.15915493667125701904296875;
        float _815 = _807 * 3.1415927410125732421875;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _813 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = sin(_823);
        _783 = _805;
        _795 = _825;
        _785 = _807;
        _773 = 1;
        _787 = 2;
        _799 = _821;
        _769 = 5.839270114898681640625;
        _803 = _809;
        _765 = 7.345489978790283203125;
        _791 = _807;
    }
    float _827 = _783;
    float _829 = _795;
    float _831 = _785;
    int _833 = _773;
    int _835 = _787;
    float _837 = _799;
    float _839 = _769;
    float _841 = _803;
    float _843 = _765;
    float _845 = _791;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    float _851 = _827 * 2.0;
    bool _853 = _779 > 0.0;
    float _855 = _829 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _857 = _779 >= 0.0;
    bool _859 = isnan(_779);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = _831 * 2.0;
    float _869 = _165 * _125;
    float _871 = floor(_851);
    int _873 = _865 ? 0 : 1;
    float _875 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _879 = ~_873;
    int _881 = _879 + 1;
    int _883 = _881 + 1;
    float _885 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _887 = _883;
    float _889 = _855;
    if (!_853)
    {
        int _891 = ~_873;
        int _893 = _891 + 1;
        _887 = _893;
    }
    int _895 = _887;
    float _897 = _849 * _125;
    bool _899 = _833 != 1;
    float _901 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[93].w, _877);
    bool _903 = _739 > 0.5;
    float _905 = floor(_867);
    float _907 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].w, _901);
    float _909 = -_195;
    int _911 = _903 ? as_type<int>(_909) : as_type<int>(_195);
    bool _913 = _871 > 0.0;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _917 = _871 >= 0.0;
    bool _919 = isnan(_871);
    bool _921 = _917 || _919;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    float _927 = exp2(_897);
    float _929 = _827 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _931 = _925 ? 0 : 1;
    float _933 = -_915;
    float _935 = fma(_929, 2.0, _933);
    bool _937 = _835 != 2;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _941 = ~_931;
    int _943 = _941 + 1;
    int _945 = _943 + 1;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _949 = int(_947);
    int _951 = _945;
    if (!_913)
    {
        int _953 = ~_931;
        int _955 = _953 + 1;
        _951 = _955;
    }
    int _957 = _951;
    float _959 = -_125;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[76].x, _935);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = -_927;
    float _975 = _973 + 1.0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _987 = _985 != 0;
    float _989 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[93].z, _939);
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _993 = _971 ? _975 : 0.0;
    float _995 = _837 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _997 = _831 > 0.5;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1001 = !_987;
    float _1003 = _1001 ? _195 : as_type<float>(_911);
    float _1005 = -_991;
    float _1007 = fma(_995, 2.0, _1005);
    float _1009 = -_191;
    int _1011 = _997 ? as_type<int>(_1009) : as_type<int>(_191);
    float _1013 = fma(_855, -2.0, _999);
    float _1015 = _831 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1017 = !_983;
    float _1019 = _1017 ? _191 : as_type<float>(_1011);
    float _1021 = _831 + _739;
    int _1023 = int(_899);
    int _1025 = _937 ? 2 : 0;
    int _1027 = _1023 | _1025;
    int _1029 = _997 ? 4 : 0;
    int _1031 = _1027 | _1029;
    int _1033 = _979 ? 8 : 0;
    int _1035 = _1031 | _1033;
    int _1037 = _983 ? 16 : 0;
    int _1039 = _1035 | _1037;
    int _1041 = _987 ? 32 : 0;
    int _1043 = _1039 | _1041;
    int _1045 = _903 ? 64 : 0;
    int _1047 = _1043 | _1045;
    int _1049 = _1047 & 64;
    float _1051 = _831 + _827;
    float _1053 = _1021 + (-1.0);
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1061 = _1059 != 0;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1065 = _1063 != 0;
    float _1067 = _1051 + (-1.0);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1071 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[92].z, _989);
    bool _1073 = !_1061;
    float _1075 = _1073 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1079 = !_1057;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1085 = !_1065;
    int _1087 = _1085 ? 0 : 1;
    float _1089 = fma(_1015, -2.0, _1077);
    float _1091 = -_125;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1007);
    float _1095 = _999;
    float _1097 = _1015;
    float _1099 = _991;
    float _1101 = _1075;
    if (!_899)
    {
        _1095 = _739;
    }
    float _1103 = _1095;
    float _1105 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1089);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1117 = _1115 != 0;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1121 = _1103;
    if (!_899)
    {
        _889 = _831;
    }
    float _1123 = _889;
    float _1125 = _1123;
    if (_899)
    {
        _1121 = _831;
    }
    float _1127 = _1121;
    if (!_899)
    {
        _387 = _831;
    }
    float _1129 = _387;
    float _1131 = _1129;
    if (_899)
    {
        _1125 = _827;
    }
    float _1133 = _1125;
    float _1135 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1083);
    if (_899)
    {
        _1131 = _827;
    }
    float _1137 = _1131;
    float _1139 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = 0.0;
    if (!_899)
    {
        _1143 = _739;
    }
    float _1145 = _1143;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1119);
    float _1149 = _1145;
    if (_937)
    {
        _1097 = _831;
    }
    float _1151 = _1097;
    float _1153 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1155 = _1151;
    if (_937)
    {
        _1099 = _827;
    }
    float _1157 = _1099;
    float _1159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1161 = int(_1159);
    bool _1163 = !_1113;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = -_1141;
    float _1169 = fma(_1139, 2.0, _1167);
    bool _1171 = !_1109;
    int _1173 = _1171 ? 0 : 1;
    float _1175 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1135);
    bool _1177 = !_1117;
    int _1179 = _1177 ? 0 : 1;
    float _1181 = -_125;
    float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1169);
    float _1185 = _1157;
    if (_899)
    {
        _1149 = _831;
    }
    float _1187 = _1149;
    if (!_937)
    {
        _1185 = _739;
    }
    float _1189 = _1185;
    if (!_937)
    {
        _1155 = _827;
    }
    float _1191 = _1155;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1195 = _1193 != 0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1199 = _1197 != 0;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1203 = _1201 != 0;
    bool _1205 = _905 > 0.0;
    float _1207 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1209 = _905 >= 0.0;
    bool _1211 = isnan(_905);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1221 = int(_1219);
    bool _1223 = !_1195;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1231 = abs(_1225);
    float _1233 = float(_949);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1237 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1239 = float(_1161);
    float _1241 = 1.0 / _1233;
    float _1243 = float(_1221);
    float _1245 = fma(_1237, -2.0, _1227);
    float _1247 = fma(_1207, -2.0, _1235);
    float _1249 = float(_895);
    float _1251 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1245);
    int _1253 = int(_1205);
    int _1255 = _1217 ? 2 : 0;
    int _1257 = _1253 | _1255;
    int _1259 = _997 ? 4 : 0;
    int _1261 = _1257 | _1259;
    int _1263 = _979 ? 8 : 0;
    int _1265 = _1261 | _1263;
    int _1267 = _1195 ? 16 : 0;
    int _1269 = _1265 | _1267;
    int _1271 = _1199 ? 32 : 0;
    int _1273 = _1269 | _1271;
    int _1275 = _1203 ? 64 : 0;
    int _1277 = _1273 | _1275;
    int _1279 = _1277 & 4;
    float _1281 = 1.0 / _1243;
    float _1283 = in.m_66.x;
    float _1285 = in.m_66.y;
    float _1287 = in.m_66.z;
    bool _1289 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1291 = isnan(1.0);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1297 = _1293 || _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    float _1303 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1305 = float(_1231);
    float _1307 = 1.0 / _1239;
    float _1309 = -_1229;
    float _1311 = fma(_1303, 2.0, _1309);
    float _1313 = _1305 * _1249;
    float _1315 = _1241 * _125;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1319 = 1.0 / _1301;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1323 = !_1199;
    int _1325 = _1323 ? 0 : 1;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1329 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1317);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1333 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1321);
    float _1335 = float(_957);
    float _1337 = _1281 * _125;
    float _1339 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1331);
    int _1341 = abs(_1325);
    float _1343 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1327);
    float _1345 = _1313 * (-2.0);
    float _1347 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1329);
    float _1349 = float(_1341);
    float _1351 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1333);
    float _1353 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1339);
    float _1355 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1147);
    float _1357 = _1307 * _125;
    float _1359 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1343);
    float _1361 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1013);
    float _1363 = -_125;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1311);
    float _1367 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1247);
    float _1369 = _1349 * _1335;
    if (_1297)
    {
        float _1371 = _993 * _1319;
        _135 = _1371;
    }
    float _1373 = _135;
    float _1375 = _827 + (-0.5);
    float _1377 = fma(_1345, _1283, _1283);
    int _1379 = _1217 ? 0 : 1;
    float _1381 = fma(_1153, _1345, _1153);
    bool _1383 = !_1203;
    int _1385 = _1383 ? 0 : 1;
    float _1387 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1377);
    int _1389 = ~_1379;
    int _1391 = _1389 + 1;
    int _1393 = _1391 + 1;
    float _1395 = _831 + (-0.5);
    int _1397 = abs(_1385);
    float _1399 = in.m_46.x;
    float _1401 = in.m_46.y;
    float _1403 = in.m_46.z;
    int _1405 = _1393;
    float _1407 = _1373;
    if (!_1205)
    {
        int _1409 = ~_1379;
        int _1411 = _1409 + 1;
        _1405 = _1411;
    }
    int _1413 = _1405;
    float _1415 = _1369 * (-2.0);
    float _1417 = fma(_1381, _1373, _1387);
    float _1419 = fma(_1415, _1285, _1285);
    float _1421 = float(_1413);
    float _1423 = fma(_1069, _1415, _1069);
    float _1425 = float(_1397);
    float _1427 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1419);
    float _1429 = _827 + _739;
    float _1431 = _1417 * 0.15915493667125701904296875;
    float _1433 = _1425 * _1421;
    float _1435 = fma(_1423, _1373, _1427);
    float _1437 = in.m_68.x;
    float _1439 = in.m_68.y;
    float _1441 = in.m_68.z;
    float _1443 = in.m_68.w;
    float _1445 = _1429 + (-1.0);
    float _1447 = _1433 * (-2.0);
    float _1449 = _739 + (-0.5);
    float _1451 = in.m_70.x;
    float _1453 = in.m_70.y;
    float _1455 = in.m_70.z;
    float _1457 = in.m_70.w;
    float _1459 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1461 = fma(_1447, _1287, _1287);
    float _1463 = _1435 * 0.15915493667125701904296875;
    float _1465 = in.m_72.x;
    float _1467 = in.m_72.y;
    float _1469 = in.m_72.z;
    float _1471 = in.m_72.w;
    float _1473 = fma(_1459, _1447, _1459);
    float _1475 = fma(_1449, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1461);
    float _1477 = _1431 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1485 = fma(_1473, _1373, _1475);
    bool _1487 = _741 > 0.5;
    float _1489 = _875 * _1481;
    float _1491 = _885 * _1483;
    float _1493 = _1485 * 0.15915493667125701904296875;
    float _1495 = _1431 * 6.283185482025146484375;
    float _1497 = cos(_1495);
    float _1499 = _1401 * _1439;
    float _1501 = _1463 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    float _1505 = _1401 * _1453;
    float _1507 = fma(_1399, _1437, _1499);
    float _1509 = _1401 * _1467;
    float _1511 = fma(_1399, _1451, _1505);
    float _1513 = fma(_1403, _1441, _1507);
    float _1515 = _1463 * 6.283185482025146484375;
    float _1517 = cos(_1515);
    float _1519 = fma(_1399, _1465, _1509);
    float _1521 = fma(_1403, _1455, _1511);
    float _1523 = _1513 + _1443;
    float _1525 = fma(_1403, _1469, _1519);
    float _1527 = _1521 + _1457;
    float _1529 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1531 = _1493 * 6.283185482025146484375;
    float _1533 = cos(_1531);
    float _1535 = _1479 * _1503;
    float _1537 = _1525 + _1471;
    float _1539 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1529);
    float _1541 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1539);
    float _1543 = _1493 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = _1497 * _1517;
    float _1549 = _1479 * _1517;
    float _1551 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1553 = _1497 * _1533;
    float _1555 = _1497 * _1503;
    float _1557 = _1479 * _1533;
    float _1559 = _1517 * _1533;
    float _1561 = _1553 * _1489;
    float _1563 = _1503 * _1533;
    float _1565 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1567 = 1.0 / _1551;
    float _1569 = fma(_1545, _1547, _1535);
    float _1571 = -_1489;
    float _1573 = _1545 * _1571;
    float _1575 = -_1549;
    float _1577 = fma(_1545, _1555, _1575);
    float _1579 = -_1555;
    float _1581 = fma(_1545, _1549, _1579);
    float _1583 = fma(_1569, _1491, _1561);
    float _1585 = _1557 * _1489;
    float _1587 = fma(_1559, _1491, _1573);
    float _1589 = fma(_1545, _1535, _1547);
    float _1591 = fma(_1577, _1565, _1583);
    float _1593 = fma(_1581, _1491, _1585);
    float _1595 = fma(_1563, _1565, _1587);
    float _1597 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1599 = fma(_1589, _1565, _1593);
    float _1601 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1603 = _1591 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1605 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1597);
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1601);
    float _1609 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1603);
    float _1611 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1605);
    float _1613 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1607);
    float _1615 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1609);
    float _1617 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1619 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1621 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1623 = _1537 + _1617;
    float _1625 = _1527 + _1619;
    float _1627 = _1523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1623 + _1629;
    float _1633 = _1523 + _1621;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1637 = _1625 + _1635;
    float _1639 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1627);
    float _1641 = _1631 * _1631;
    float _1643 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1639);
    float _1645 = fma(_1637, _1637, _1641);
    float _1647 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1649 = sqrt(_1645);
    float _1651 = _1647 + _1551;
    float _1653 = -_195;
    int _1655 = _1487 ? as_type<int>(_1653) : as_type<int>(_195);
    float _1657 = _1651 * _1567;
    float _1659 = _1657 * 0.5;
    bool _1661 = !_979;
    float _1663 = _1661 ? _195 : as_type<float>(_1655);
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1667 = _1665 != 0;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1671 = _1669 != 0;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1675 = _1673 != 0;
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1679 = _1677 != 0;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1683 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1681);
    float _1685 = 1.0 / _1683;
    bool _1687 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1689 = !_1671;
    int _1691 = _1689 ? 0 : 1;
    bool _1693 = !_1667;
    int _1695 = _1693 ? 0 : 1;
    bool _1697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1699 = isnan(0.5);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1705 = _1701 || _1703;
    bool _1707 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1709 = isnan(0.5);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1715 = _1711 || _1713;
    bool _1717 = !_1675;
    int _1719 = _1717 ? 0 : 1;
    bool _1721 = !_1679;
    int _1723 = _1721 ? 0 : 1;
    float _1725 = _1567;
    float _1727 = _1483;
    float _1729 = _1625;
    float _1731 = _1645;
    float _1733 = _1599;
    float _1735 = _1527;
    if (!_1687)
    {
        _1725 = _1623;
    }
    float _1737 = _1725;
    float _1739 = _1737;
    if (!_1687)
    {
        _1727 = _1633;
    }
    float _1741 = _1727;
    bool _1743 = !_1687;
    float _1745 = _1741;
    if (!_1743)
    {
        float _1747 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1751 = _1649 + _1749;
        float _1753 = rsqrt(_1645);
        float _1755 = _1751 * _1747;
        float _1757 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = _1755 * 0.15915493667125701904296875;
        float _1761 = _1759 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1759 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = _1763 + (-1.0);
        float _1771 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1773 = fma(_1767, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1775 = fma(_1633, _1763, _1771);
        float _1777 = _1753 * _1773;
        float _1779 = fma(_1637, _1777, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1781 = fma(_1631, _1777, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1745 = _1775;
        _1729 = _1779;
        _1739 = _1781;
    }
    float _1783 = _1745;
    float _1785 = _1729;
    float _1787 = _1739;
    float _1789 = _1783;
    float _1791 = _1785;
    float _1793 = _1787;
    if (_1715)
    {
        _1731 = 1.0;
    }
    float _1795 = _1731;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1799 = _1685 * _1797;
    float _1801 = _1795;
    if (!_1705)
    {
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1805 = _1523 + _1803;
        float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1809 = _1527 + _1807;
        float _1811 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1813 = -_1523;
        float _1815 = _1813 + _1783;
        float _1817 = _1805 * _1805;
        float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1821 = _1537 + _1819;
        float _1823 = -_1527;
        float _1825 = _1823 + _1785;
        float _1827 = fma(_1809, _1809, _1817);
        float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1831 = fma(_1821, _1821, _1827);
        float _1833 = sqrt(_1831);
        float _1835 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1829;
        float _1841 = _1835 * _1839;
        float _1843 = -_1537;
        float _1845 = _1843 + _1787;
        float _1847 = fma(_1815, _1841, _1523);
        float _1849 = fma(_1825, _1841, _1527);
        float _1851 = fma(_1845, _1841, _1537);
        _1789 = _1847;
        _1791 = _1849;
        _1793 = _1851;
    }
    float _1853 = _1789;
    float _1855 = _1791;
    float _1857 = _1793;
    if (!_1715)
    {
        float _1859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = _1859 * 0.15915493667125701904296875;
        float _1863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1865 = _1861 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1863 * 0.15915493667125701904296875;
        float _1871 = _1861 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = 1.0 / _1867;
        float _1877 = _1869 * 6.283185482025146484375;
        float _1879 = cos(_1877);
        float _1881 = _1873 * _1875;
        float _1883 = _1869 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = _1879 * _1881;
        float _1889 = 1.0 / _1887;
        float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1891;
        float _1895 = 1.0 / _1893;
        float _1897 = _1885 * _1889;
        float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1901 = fma(_1799, _1897, _1899);
        float _1903 = _1901 * _1895;
        float _1905 = precise::clamp(_1903, 0.0, 1.0);
        _1733 = _1869;
        _1801 = _1905;
    }
    float _1907 = _1733;
    float _1909 = _1801;
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1913 = _1853 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1917 = _1855 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1921 = _1857 + _1919;
    float _1923 = _1913 * _1913;
    bool _1925 = _1049 != 0;
    float _1927 = fma(_1917, _1917, _1923);
    float _1929 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1931 = fma(_1921, _1921, _1927);
    float _1933 = floor(_1929);
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1937 = rsqrt(_1931);
    float _1939 = sqrt(_1931);
    float _1941 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1943 = _1917 * _1941;
    float _1945 = _1921 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 * _1945;
    float _1951 = _1947 + _1949;
    float _1953 = sqrt(_1951);
    bool _1955 = _1953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1959 = _1953 + _1957;
    float _1961 = _1937;
    float _1963 = _1951;
    float _1965 = _1959;
    float _1967 = _1907;
    float _1969 = _1913;
    if (_1955)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1961 = _1971;
    }
    float _1973 = _1961;
    if (!_1955)
    {
        _1735 = _1947;
    }
    float _1975 = _1735;
    float _1977 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1979 = _1975;
    if (_1955)
    {
        float _1981 = rsqrt(_1951);
        _1963 = _1981;
    }
    float _1983 = _1963;
    if (_1955)
    {
        float _1985 = _1959 * _1973;
        _1965 = _1985;
    }
    float _1987 = _1965;
    if (_1955)
    {
        float _1989 = _1987 * 0.15915493667125701904296875;
        _1967 = _1989;
    }
    float _1991 = _1967;
    float _1993 = _1921;
    float _1995 = _1991;
    if (_1955)
    {
        float _1997 = _1991 * 6.283185482025146484375;
        float _1999 = sin(_1997);
        _1993 = _1999;
    }
    float _2001 = _1993;
    float _2003 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2005 = precise::max(0.0, _2003);
    float _2007 = _1973;
    float _2009 = _2005;
    if (_1955)
    {
        float _2011 = _1991 * 6.283185482025146484375;
        float _2013 = cos(_2011);
        _2007 = _2013;
    }
    float _2015 = _2007;
    float _2017 = -_1941;
    float _2019 = -_2005;
    float _2021 = fma(_1913, _2017, _2019);
    if (_1955)
    {
        float _2023 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2023;
    }
    float _2025 = _1969;
    float _2027 = _2001;
    float _2029 = _2025;
    if (_1955)
    {
        float _2031 = fma(_2001, _2025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2027 = _2031;
    }
    float _2033 = _2027;
    float _2035 = _2033;
    if (!_1955)
    {
        _2029 = _2021;
    }
    float _2037 = _2029;
    float _2039 = _2037;
    float _2041 = _2015;
    if (_1955)
    {
        float _2043 = _2015 + (-1.0);
        _2009 = _2043;
    }
    float _2045 = _2009;
    float _2047 = _2045;
    if (_1955)
    {
        float _2049 = _1983 * _2033;
        _1407 = _2049;
    }
    float _2051 = _1407;
    if (!_1955)
    {
        _2035 = _1943;
    }
    float _2053 = _2035;
    float _2055 = _2053;
    if (_1955)
    {
        float _2057 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2057;
    }
    float _2059 = _1995;
    if (_1955)
    {
        float _2061 = _1943 * _2051;
        _2055 = _2061;
    }
    float _2063 = _2055;
    if (!_1955)
    {
        _2047 = _1945;
    }
    float _2065 = _2047;
    float _2067 = _2065;
    if (_1955)
    {
        float _2069 = _1945 * _2051;
        _2067 = _2069;
    }
    float _2071 = _2067;
    if (_1955)
    {
        float _2073 = fma(_2021, _2015, _2059);
        _2039 = _2073;
    }
    float _2075 = _2039;
    if (_1955)
    {
        float _2077 = _2063 * _2063;
        _1979 = _2077;
    }
    float _2079 = _1979;
    if (!_1955)
    {
        _2041 = _1949;
    }
    float _2081 = _2041;
    float _2083 = _2081;
    if (_1955)
    {
        float _2085 = _2071 * _2071;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2093 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2095 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1977);
    float _2097 = _2089 + _2087;
    float _2099 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2101 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2103 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2091);
    float _2105 = rsqrt(_2097);
    float _2107 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2099);
    float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2111 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2109);
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2093);
    float _2117 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2103);
    float _2119 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2121 = -_2113;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2115);
    float _2127 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2129 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2131 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2095);
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2135 = abs(_2123);
    float _2137 = log2(_2135);
    float _2139 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2141 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = _2105 * _2063;
    float _2147 = _2105 * _2075;
    float _2149 = _2105 * _2071;
    float _2151 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2139);
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = floor(_2101);
    float _2157 = -_1933;
    float _2159 = _1929 + _2157;
    float _2161 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2151);
    float _2163 = -_2153;
    float _2165 = fma(_2147, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2163);
    float _2167 = -_2143;
    float _2169 = fma(_2167, _1935, 1.0);
    float _2171 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2161);
    float _2173 = -_2149;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2165);
    float _2177 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2179 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = log2(_2169);
    float _2183 = fma(_2175, -0.5, 0.5);
    float _2185 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2187 = fma(_2175, 0.5, 0.5);
    float _2189 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    float _2191 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2185);
    float _2193 = -_2155;
    float _2195 = _2101 + _2193;
    float _2197 = 1.0 / _2171;
    float _2199 = fma(_2187, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2201 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2189);
    float _2203 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2191);
    float _2205 = _2147 + 1.0;
    float _2207 = fma(_2187, _2199, -0.212114393711090087890625);
    float _2209 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2201);
    float _2211 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2203);
    float _2213 = exp2(_2177);
    float _2215 = fma(_2187, _2207, 1.570728778839111328125);
    float _2217 = _2181 * 0.693147182464599609375;
    float _2219 = sqrt(_2183);
    float _2221 = _2209 * _2197;
    float _2223 = _2211 * _2197;
    float _2225 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = -_2147;
    float _2231 = fma(_2213, _2205, _2229);
    float2 _8248 = float2(_2159, _2195);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8248, float2(0.0), isnan(_8248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8248, float2(0.0), isnan(_8248)), level(0.0)).x;
    float _2235 = fma(_2231, 0.5, 0.5);
    float _2237 = _2219 * 0.636619746685028076171875;
    float _2239 = fma(_2221, 0.5, 0.5);
    float _2241 = -_2215;
    float _2243 = fma(_2237, _2241, 1.0);
    float3 _8271 = float3(_2239, _2227, _2225);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8271, float3(0.0), isnan(_8271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8271, float3(0.0), isnan(_8271)), level(0.0)).x;
    float3 _8282 = float3(_2239, _2227, _2225);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8282, float3(0.0), isnan(_8282)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8282, float3(0.0), isnan(_8282)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _8298 = float2(_2243, _2235);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8298, float2(0.0), isnan(_8298)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8298, float2(0.0), isnan(_8298)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2270 = int(_2268);
    float _2272 = _839 * _841;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    float _2278 = -_1355;
    float _2280 = _2278 + 1.0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2284 = _2282 != 0;
    float _2286 = -_1347;
    float _2288 = _2286 + 1.0;
    int _2290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2292 = _2290 != 0;
    float _2294 = -_1175;
    float _2296 = _2294 + 1.0;
    float _2298 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2300 = int(_2298);
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2304 = _2302 != 0;
    float _2306 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2308 = abs(_1173);
    float _2310 = _2127 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2312 = abs(_1087);
    float _2314 = -_1351;
    float _2316 = _2314 + 1.0;
    bool _2318 = _1279 != 0;
    float _2320 = trunc(_1357);
    int _2322 = int(_2320);
    float _2324 = float(uint(_2270));
    float _2326 = -_1353;
    float _2328 = _2326 + 1.0;
    float _2330 = trunc(_1315);
    int _2332 = int(_2330);
    float _2334 = float(uint(_2300));
    float _2336 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2310);
    float _2338 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2340 = int(_2338);
    float _2342 = float(uint(_2322));
    float _2344 = fma(_2133, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2336);
    float _2346 = float(_2270);
    float _2348 = float(_2322);
    float _2350 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2344);
    float _2352 = 1.0 / _2324;
    bool _2354 = _2348 >= _2346;
    bool _2356 = isnan(_2348);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(_2346);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    float _2366 = float(_2332);
    out.gl_Position.x = _2209;
    out.gl_Position.y = _2211;
    out.gl_Position.z = _2350;
    out.gl_Position.w = _2171;
    bool _2368 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2370 = isnan(_737);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = 1.0 / _2334;
    float _2382 = float(uint(_2340));
    int _2384 = as_type<int>(_2352) + (-2);
    float _2386 = 1.0 / _2382;
    int _2388 = ~_2270;
    int _2390 = _2388 + 1;
    float _2392 = as_type<float>(_2384) * _2342;
    int _2394 = as_type<int>(_2380) + (-2);
    float _2396 = trunc(_2392);
    float _2398 = precise::max(_2396, 0.0);
    uint _2401 = uint(_2398);
    float _2403 = float(uint(_2332));
    float _2405 = as_type<float>(_2394) * _2403;
    float _2407 = _843 * _827;
    float _2409 = trunc(_1337);
    int _2411 = int(_2409);
    int _2413 = ~_2300;
    int _2415 = _2413 + 1;
    float _2417 = trunc(_2405);
    float _2419 = precise::max(_2417, 0.0);
    uint _2421 = uint(_2419);
    int _2423 = _2390 * int(_2401);
    int _2425 = _2423 + _2322;
    float _2427 = float(uint(_2425));
    float _2429 = trunc(_2364);
    int _2431 = int(_2429);
    float _2433 = float(uint(_2411));
    float _2435 = as_type<float>(_2384) * _2427;
    float _2437 = floor(_2407);
    int _2439 = _2415 * int(_2421);
    int _2441 = _2439 + _2332;
    float _2443 = float(uint(_2441));
    float _2445 = trunc(_2435);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    float _2451 = as_type<float>(_2394) * _2443;
    int _2453 = as_type<int>(_2386) + (-2);
    int _2455 = ~_2270;
    int _2457 = _2455 + 1;
    float _2459 = floor(_2272);
    float _2461 = as_type<float>(_2453) * _2433;
    float _2463 = -_2437;
    float _2465 = _2407 + _2463;
    float _2467 = _843 * _845;
    int _2469 = ~_2340;
    int _2471 = _2469 + 1;
    float _2473 = trunc(_2451);
    float _2475 = precise::max(_2473, 0.0);
    uint _2477 = uint(_2475);
    int _2479 = int(_2401) + int(_2449);
    float _2481 = float(_2300);
    float _2483 = as_type<float>(_2449);
    float _2485 = _2467;
    float _2487 = as_type<float>(_2394);
    float _2489 = _2211;
    float _2491 = _2209;
    if (_2304)
    {
        float _2493 = in.m_58.w;
        _2483 = _2493;
    }
    float _2495 = _2483;
    int _2497 = ~_2300;
    int _2499 = _2497 + 1;
    int _2501 = _2457 * _2479;
    int _2503 = _2501 + _2322;
    bool _2505 = _2366 >= _2481;
    bool _2507 = isnan(_2366);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan(_2481);
    bool _2513 = _2509 || _2511;
    float _2515 = float(_2513);
    float _2517 = trunc(_2461);
    float _2519 = precise::max(_2517, 0.0);
    uint _2521 = uint(_2519);
    float _2523 = -_2459;
    float _2525 = _2272 + _2523;
    float _2527 = _2465 * _2346;
    float _2529 = _2346 * _869;
    bool _2531 = uint(_2503) >= uint(_2270);
    float _2533 = _2525 * _2481;
    bool _2535 = !_2292;
    int _2537 = _2535 ? 0 : 1;
    float _2539 = trunc(_2527);
    int _2541 = int(_2539);
    int _2543 = int(_2421) + int(_2477);
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2547 = _2545 != 0;
    int _2549 = abs(_2537);
    int _2551 = _2499 * _2543;
    int _2553 = _2551 + _2332;
    bool _2555 = !_2547;
    int _2557 = _2555 ? 0 : 1;
    int _2559 = _2471 * int(_2521);
    int _2561 = _2559 + _2411;
    float _2563 = trunc(_2533);
    int _2565 = int(_2563);
    bool _2567 = _2270 == 0;
    float _2569 = float(uint(_2561));
    bool _2571 = !_2531;
    int _2573 = _2571 ? 0 : (-1);
    bool _2575 = uint(_2553) >= uint(_2300);
    float _2577 = trunc(_2515);
    int _2579 = int(_2577);
    int _2581 = ~_2479;
    int _2583 = _2581 + _2573;
    int _2585 = _2583 + 1;
    float _2587 = as_type<float>(_2453) * _2569;
    bool _2589 = !_2575;
    int _2591 = _2589 ? 0 : (-1);
    int _2593 = abs(_2557);
    int _2595 = _2541 * _2549;
    int _2597 = _2595 + _2322;
    int _2599 = ~_2543;
    int _2601 = _2599 + _2591;
    int _2603 = _2601 + 1;
    float _2605 = trunc(_2587);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    int _2611 = _2270 * _2585;
    int _2613 = _2611 + _2322;
    bool _2615 = _2300 == 0;
    int _2617 = _2300 * _2603;
    int _2619 = _2617 + _2332;
    bool _2621 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2623 = isnan(_737);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2629 = _2625 || _2627;
    float _2631 = float(_2629);
    int _2633 = _2565 * _2593;
    int _2635 = _2633 + _2332;
    bool _2637 = !_2567;
    int _2639 = _2637 ? _2613 : (-1);
    float _2641 = trunc(_2529);
    int _2643 = int(_2641);
    int _2645 = ~_2579;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    bool _2651 = !_2615;
    int _2653 = _2651 ? _2619 : (-1);
    int _2655 = ~_2431;
    int _2657 = _2655 + 1;
    int _2659 = _2657 + 1;
    int _2661 = _2300 + (-1);
    int _2663 = _2653 * _2649;
    int _2665 = ~_2340;
    int _2667 = _2665 + 1;
    int _2669 = _2639 * _2659;
    int _2671 = _2270 + (-1);
    int _2673 = _2579 * _2661;
    int _2675 = _2673 + _2663;
    int _2677 = int(_2521) + int(_2609);
    float _2679 = _2481 * _869;
    int _2681 = _2431 * _2671;
    int _2683 = _2681 + _2669;
    int _2685 = abs(_1165);
    float _2687 = exp2(_2306);
    int _2689 = abs(as_type<int>(_1075));
    int _2691 = _2667 * _2677;
    int _2693 = _2691 + _2411;
    float _2695 = as_type<float>(_2693);
    if (_2304)
    {
        float _2697 = _2495 * 3.1415927410125732421875;
        _1101 = _2697;
    }
    float _2699 = _1101;
    bool _2701 = !_2276;
    int _2703 = _2701 ? 0 : 1;
    int _2705 = _2675 * _2685;
    int _2707 = abs(_1081);
    int _2709 = _2683 * _2689;
    float _2711 = trunc(_2679);
    int _2713 = int(_2711);
    bool _2715 = uint(_2693) >= uint(_2340);
    bool _2717 = _2715;
    if (_2304)
    {
        float _2719 = _2699 * 0.15915493667125701904296875;
        _2695 = _2719;
    }
    float _2721 = _2695;
    float _2723 = float(_2340);
    float _2725 = float(_2411);
    int _2727 = abs(_1695);
    float _2729 = _2721;
    if (_2304)
    {
        float _2731 = _2721 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        _2729 = _2733;
    }
    float _2735 = _2729;
    bool _2737 = _2725 >= _2723;
    bool _2739 = isnan(_2725);
    bool _2741 = _2737 || _2739;
    bool _2743 = isnan(_2723);
    bool _2745 = _2741 || _2743;
    float _2747 = float(_2745);
    float _2749 = _2723 * _869;
    float _2751 = -_2687;
    float _2753 = _2751 + 1.0;
    int _2755 = abs(_2703);
    int _2757 = _2643 * _2707;
    int _2759 = _2757 + _2709;
    bool _2761 = !_2715;
    int _2763 = _2761 ? 0 : (-1);
    float _2765 = trunc(_2747);
    int _2767 = int(_2765);
    int _2769 = _2713 * _2308;
    int _2771 = _2769 + _2705;
    int _2773 = abs(_1179);
    int _2775 = _2597 * _2312;
    int _2777 = _2775 + _2759;
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2783 = ~_2677;
    int _2785 = _2783 + _2763;
    int _2787 = _2785 + 1;
    float _2789 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2791 = _2541 * _2755;
    int _2793 = _2791 + _2777;
    bool _2795 = !_2284;
    int _2797 = _2795 ? 0 : 1;
    float _2799 = floor(_2467);
    if (_2304)
    {
        bool _2801 = _2735 > 0.5;
        _2717 = _2801;
    }
    bool _2803 = _2717;
    int _2805 = _2635 * _2773;
    int _2807 = _2805 + _2771;
    int _2809 = abs(_2797);
    int _2811 = _2340 * _2787;
    int _2813 = _2811 + _2411;
    float _2815 = float(uint(_2793));
    float _2817 = trunc(_2749);
    int _2819 = int(_2817);
    bool _2821 = _2340 == 0;
    float _2823 = as_type<float>(_2384) * _2815;
    float _2825 = float(uint(_2597));
    int _2827 = _2565 * _2809;
    int _2829 = _2827 + _2807;
    int _2831 = ~_2767;
    int _2833 = _2831 + 1;
    int _2835 = _2833 + 1;
    bool _2837 = !_2821;
    int _2839 = _2837 ? _2813 : (-1);
    float _2841 = trunc(_2823);
    float _2843 = precise::max(_2841, 0.0);
    uint _2845 = uint(_2843);
    float _2847 = float(uint(_2829));
    float _2849 = -_2799;
    float _2851 = _2467 + _2849;
    if (!_2304)
    {
        _2485 = _191;
    }
    float _2853 = _2485;
    float _2855 = as_type<float>(_2384) * _2825;
    float _2857 = _2853;
    if (_2304)
    {
        float _2859 = -_191;
        float _2861 = _2803 ? _2859 : _191;
        _2857 = _2861;
    }
    float _2863 = _2857;
    float _2865 = as_type<float>(_2394) * _2847;
    int _2867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2869 = _2867 != 0;
    int _2871 = _2839 * _2835;
    int _2873 = ~_2270;
    int _2875 = _2873 + 1;
    float _2877 = trunc(_2855);
    float _2879 = precise::max(_2877, 0.0);
    uint _2881 = uint(_2879);
    int _2883 = _2340 + (-1);
    float _2885 = _2851 * _2723;
    int _2887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2889 = _2887 != 0;
    int _2891 = ~_2300;
    int _2893 = _2891 + 1;
    int _2895 = _2875 * int(_2845);
    int _2897 = _2895 + _2793;
    int _2899 = abs(_1691);
    float _2901 = trunc(_2865);
    float _2903 = precise::max(_2901, 0.0);
    uint _2905 = uint(_2903);
    int _2907 = _2767 * _2883;
    int _2909 = _2907 + _2871;
    bool _2911 = !_2889;
    int _2913 = _2911 ? 0 : 1;
    float _2915 = as_type<float>(_2677);
    if (_2869)
    {
        float _2917 = in.m_58.x;
        _2915 = _2917;
    }
    float _2919 = _2915;
    float _2921 = float(uint(_2897));
    int _2923 = ~_2270;
    int _2925 = _2923 + 1;
    float _2927 = trunc(_2885);
    int _2929 = int(_2927);
    int _2931 = abs(_2913);
    float _2933 = as_type<float>(_2384) * _2921;
    int _2935 = _2925 * int(_2881);
    int _2937 = _2935 + _2597;
    int _2939 = _2893 * int(_2905);
    int _2941 = _2939 + _2829;
    float _2943 = trunc(_2933);
    float _2945 = precise::max(_2943, 0.0);
    uint _2947 = uint(_2945);
    float _2949 = float(uint(_2941));
    int _2951 = _2909 * _2899;
    float _2953 = float(uint(_2937));
    int _2955 = _2929 * _2931;
    int _2957 = _2955 + _2411;
    int _2959 = abs(_1719);
    float _2961 = as_type<float>(_2394) * _2949;
    int _2963 = _2819 * _2727;
    int _2965 = _2963 + _2951;
    float _2967 = float(uint(_2635));
    float _2969 = as_type<float>(_2384) * _2953;
    float _2971 = trunc(_2961);
    float _2973 = precise::max(_2971, 0.0);
    uint _2975 = uint(_2973);
    int _2977 = ~_2270;
    int _2979 = _2977 + 1;
    int _2981 = _2957 * _2959;
    int _2983 = _2981 + _2965;
    int _2985 = abs(_1723);
    float _2987 = as_type<float>(_2394) * _2967;
    float _2989 = _2967;
    if (_2869)
    {
        float _2991 = _2919 * 3.1415927410125732421875;
        _2989 = _2991;
    }
    float _2993 = _2989;
    float _2995 = 1.0 / _2781;
    int _2997 = int(_2845) + int(_2947);
    float _2999 = _2993;
    if (_2869)
    {
        float _3001 = _2993 * 0.15915493667125701904296875;
        _2999 = _3001;
    }
    float _3003 = _2999;
    int _3005 = ~_2300;
    int _3007 = _3005 + 1;
    int _3009 = _2929 * _2985;
    int _3011 = _3009 + _2983;
    int _3013 = _2979 * _2997;
    int _3015 = _3013 + _2793;
    float _3017 = trunc(_2987);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    float _3023 = float(uint(_2957));
    float _3025 = -_2233;
    float _3027 = _3025 + 1.0;
    int _3029 = int(_2905) + int(_2975);
    float _3031 = -_191;
    int _3033 = _1925 ? as_type<int>(_3031) : as_type<int>(_191);
    float _3035 = as_type<float>(_2453) * _3023;
    bool _3037 = uint(_3015) >= uint(_2270);
    float _3039 = _3003;
    if (_2869)
    {
        float _3041 = _3003 * 6.283185482025146484375;
        float _3043 = sin(_3041);
        _3039 = _3043;
    }
    float _3045 = _3039;
    int _3047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3049 = _3047 != 0;
    int _3051 = _3007 * _3029;
    int _3053 = _3051 + _2829;
    float _3055 = float(uint(_3011));
    int _3057 = ~_2300;
    int _3059 = _3057 + 1;
    bool _3061 = !_3049;
    float _3063 = _3061 ? _191 : as_type<float>(_3033);
    float _3065 = trunc(_2969);
    float _3067 = precise::max(_3065, 0.0);
    uint _3069 = uint(_3067);
    bool _3071 = uint(_3053) >= uint(_2300);
    float _3073 = as_type<float>(_2453) * _3055;
    int _3075 = _3059 * int(_3021);
    int _3077 = _3075 + _2635;
    bool _3079 = !_3037;
    int _3081 = _3079 ? 0 : (-1);
    int _3083 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3085 = _3083 != 0;
    float _3087 = trunc(_3035);
    float _3089 = precise::max(_3087, 0.0);
    uint _3091 = uint(_3089);
    float _3093 = float(uint(_3077));
    bool _3095 = !_3071;
    int _3097 = _3095 ? 0 : (-1);
    int _3099 = ~_2997;
    int _3101 = _3099 + _3081;
    int _3103 = _3101 + 1;
    float _3105 = as_type<float>(_2394) * _3093;
    bool _3107 = _3071;
    if (_2869)
    {
        bool _3109 = _3045 > 0.5;
        _3107 = _3109;
    }
    bool _3111 = _3107;
    float _3113 = trunc(_3073);
    float _3115 = precise::max(_3113, 0.0);
    uint _3117 = uint(_3115);
    int _3119 = ~_2340;
    int _3121 = _3119 + 1;
    int _3123 = _2270 * _3103;
    int _3125 = _3123 + _2793;
    int _3127 = ~_3029;
    int _3129 = _3127 + _3097;
    int _3131 = _3129 + 1;
    int _3133 = int(_2881) + int(_3069);
    int _3135 = ~_2340;
    int _3137 = _3135 + 1;
    int _3139 = _3121 * int(_3091);
    int _3141 = _3139 + _2957;
    if (!_2869)
    {
        _2487 = _195;
    }
    float _3143 = _2487;
    int _3145 = _2300 * _3131;
    int _3147 = _3145 + _2829;
    bool _3149 = !_2567;
    int _3151 = _3149 ? _3125 : (-1);
    float _3153 = trunc(_3105);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    float _3159 = float(uint(_3141));
    float _3161 = _3143;
    if (_2869)
    {
        float _3163 = -_195;
        float _3165 = _3111 ? _3163 : _195;
        _3161 = _3165;
    }
    float _3167 = _3161;
    int _3169 = _3137 * int(_3117);
    int _3171 = _3169 + _3011;
    int _3173 = _3151 & 3;
    bool _3175 = _3173 != 0;
    float _3177 = as_type<float>(_2453) * _3159;
    int _3179 = ~_2270;
    int _3181 = _3179 + 1;
    float _3183 = -_195;
    int _3185 = _2318 ? as_type<int>(_3183) : as_type<int>(_195);
    float _3187 = trunc(_3177);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    float _3193 = float(uint(_3171));
    int _3195 = _3181 * _3133;
    int _3197 = _3195 + _2597;
    bool _3199 = uint(_3173) > 1u;
    int _3201 = _3151 & 3;
    bool _3203 = _3201 != 0;
    float _3205 = as_type<float>(_2453) * _3193;
    bool _3207 = !_2615;
    int _3209 = _3207 ? _3147 : (-1);
    int _3211 = _3203 ? 0 : 1;
    int _3213 = _3209 & 3;
    bool _3215 = _3213 != 0;
    float _3217 = trunc(_3205);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    bool _3223 = !_3085;
    float _3225 = _3223 ? _195 : as_type<float>(_3185);
    bool _3227 = uint(_3197) >= uint(_2270);
    int _3229 = ~_3211;
    int _3231 = _3229 + 1;
    int _3233 = _3231 + 1;
    int _3235 = _3233;
    if (!_3199)
    {
        int _3237 = ~_3211;
        int _3239 = _3237 + 1;
        _3235 = _3239;
    }
    int _3241 = _3235;
    bool _3243 = uint(_3213) > 1u;
    bool _3245 = !_3227;
    int _3247 = _3245 ? 0 : (-1);
    int _3249 = _3209 & 3;
    bool _3251 = _3249 != 0;
    int _3253 = ~_2300;
    int _3255 = _3253 + 1;
    int _3257 = _3251 ? 0 : 1;
    int _3259 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3261 = _3259 != 0;
    int _3263 = int(_3021) + int(_3157);
    int _3265 = ~_3257;
    int _3267 = _3265 + 1;
    int _3269 = _3267 + 1;
    int _3271 = _3269;
    if (!_3243)
    {
        int _3273 = ~_3257;
        int _3275 = _3273 + 1;
        _3271 = _3275;
    }
    int _3277 = _3271;
    int _3279 = _3255 * _3263;
    int _3281 = _3279 + _2635;
    bool _3283 = !_3215;
    int _3285 = _3283 ? 0 : 1;
    bool _3287 = _3213 != 3;
    int _3289 = int(_3117) + int(_3221);
    int _3291 = int(_3091) + int(_3191);
    int _3293 = ~_2340;
    int _3295 = _3293 + 1;
    bool _3297 = uint(_3213) >= 2u;
    int _3299 = _3295 * _3289;
    int _3301 = _3299 + _3011;
    int _3303 = ~_2340;
    int _3305 = _3303 + 1;
    int _3307 = _3297 ? 0 : 1;
    float _3309 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3311 = _3309 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3313 = uint(_3281) >= uint(_2300);
    int _3315 = _3305 * _3291;
    int _3317 = _3315 + _2957;
    float _3319 = 1.0 / _3311;
    int _3321 = ~_3307;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    int _3327 = _3325;
    if (_3287)
    {
        int _3329 = ~_3307;
        int _3331 = _3329 + 1;
        _3327 = _3331;
    }
    int _3333 = _3327;
    float _3335 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3337 = _3335 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3339 = uint(_3301) >= uint(_2340);
    bool _3341 = !_3313;
    int _3343 = _3341 ? 0 : (-1);
    float _3345 = 1.0 / _3337;
    bool _3347 = uint(_3317) >= uint(_2340);
    bool _3349 = !_3339;
    int _3351 = _3349 ? 0 : (-1);
    bool _3353 = _827 > 0.5;
    bool _3355 = !_3347;
    int _3357 = _3355 ? 0 : (-1);
    bool _3359 = _3213 != 3;
    float _3361 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3363 = _3361 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3365 = -_191;
    int _3367 = _3353 ? as_type<int>(_3365) : as_type<int>(_191);
    float _3369 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3371 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3369;
    bool _3373 = !_3359;
    int _3375 = _3373 ? 0 : (-1);
    float _3377 = 1.0 / _3363;
    bool _3379 = !_3261;
    float _3381 = _3379 ? _191 : as_type<float>(_3367);
    float _3383 = _3371 * _3319;
    int _3385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3387 = _3385 != 0;
    float _3389 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3391 = _3389 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3395 = _3393 != 0;
    int _3397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3399 = _3397 != 0;
    float _3401 = _3391 * _3345;
    bool _3403 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3405 = isnan(_737);
    bool _3407 = _3403 || _3405;
    bool _3409 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3411 = _3407 || _3409;
    float _3413 = float(_3411);
    float _3415 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3417 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3415;
    bool _3419 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3421 = isnan(_737);
    bool _3423 = _3419 || _3421;
    bool _3425 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3427 = _3423 || _3425;
    float _3429 = float(_3427);
    float _3431 = -_3413;
    float _3433 = _3431 + 1.0;
    bool _3435 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3437 = isnan(_737);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3443 = _3439 || _3441;
    float _3445 = float(_3443);
    float _3447 = -_3429;
    float _3449 = _3447 + 1.0;
    float _3451 = _3417 * _3377;
    float _3453 = _3429 * _3433;
    float _3455 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3457 = _3455 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3459 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3461 = isnan(_737);
    bool _3463 = _3459 || _3461;
    bool _3465 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3467 = _3463 || _3465;
    float _3469 = float(_3467);
    float _3471 = _3445 * _3449;
    float _3473 = -_3445;
    float _3475 = _3473 + 1.0;
    float _3477 = -_2631;
    float _3479 = _3477 + 1.0;
    float _3481 = 1.0 / _3457;
    float _3483 = -_3469;
    float _3485 = _3483 + 1.0;
    float _3487 = _3469 * _3475;
    float _3489 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3491 = _3489 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3493 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3495 = isnan(_737);
    bool _3497 = _3493 || _3495;
    bool _3499 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3501 = _3497 || _3499;
    float _3503 = float(_3501);
    float _3505 = _2378 * _3479;
    float _3507 = -_2378;
    float _3509 = _3507 + 1.0;
    bool _3511 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3513 = isnan(_737);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3519 = _3515 || _3517;
    float _3521 = float(_3519);
    float _3523 = 1.0 / _3491;
    float _3525 = _2631 * _3485;
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3529 = _737 + _3527;
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3533 = _3531 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3535 = _3503 * _3509;
    float _3537 = -_3503;
    float _3539 = _3537 + 1.0;
    float _3541 = fma(_3383, _3529, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3545 = _3543 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3547 = 1.0 / _3533;
    float _3549 = _3521 * _3539;
    float _3551 = _3545 * _3481;
    float _3553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3555 = _737 + _3553;
    float _3557 = _3541 * _3549;
    float _3559 = -_3521;
    float _3561 = _3559 + 1.0;
    float _3563 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3565 = _3563 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3567 = fma(_3401, _3555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3569 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3571 = _737 + _3569;
    float _3573 = fma(_3561, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3557);
    float _3575 = _3565 * _3523;
    float _3577 = abs(_1799);
    float _3579 = log2(_3577);
    float _3581 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3583 = _737 + _3581;
    float _3585 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3585;
    float _3589 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3591 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3589;
    float _3593 = fma(_3567, _3535, _3573);
    float _3595 = fma(_3451, _3583, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3597 = fma(_3551, _3571, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3599 = _3587 * _3547;
    float _3601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3603 = _3591 * _2995;
    float _3605 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3607 = _737 + _3605;
    float _3609 = fma(_3595, _3505, _3593);
    float _3611 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3613 = _737 + _3611;
    float _3615 = _2863 + 0.5;
    float _3617 = fma(_3603, _3607, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3619 = fma(_3597, _3525, _3609);
    float _3621 = _3579 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3623 = _3167 + (-0.5);
    float _3625 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3627 = _737 + _3625;
    float _3629 = fma(_3575, _3613, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3631 = fma(_3617, _3487, _3619);
    float _3633 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1093);
    float _3635 = -_3623;
    float _3637 = -_1361;
    float _3639 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3637);
    float _3641 = -_1071;
    float _3643 = _3641 + 1.0;
    float _3645 = _3381 + 0.5;
    float _3647 = exp2(_3621);
    float _3649 = -_907;
    float _3651 = _3649 + 1.0;
    float _3653 = _3225 + (-0.5);
    float _3655 = fma(_3629, _3471, _3631);
    float _3657 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[80].x, _961);
    float _3659 = -_3643;
    float _3661 = fma(_3659, _2863, _3633);
    float _3663 = fma(_3651, _3167, _3639);
    float _3665 = -_3653;
    float _3667 = -_1105;
    float _3669 = fma(_3665, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3667);
    float _3671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3673 = _3601 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3675 = _3063 + 0.5;
    int _3677 = _3209 >> 31;
    out.m_74.x = _3661;
    out.m_74.y = _3663;
    int _3679 = ~_3289;
    int _3681 = _3679 + _3351;
    int _3683 = _3681 + 1;
    float _3685 = fma(_3673, _3675, _1183);
    int _3687 = _3677 & 3;
    float _3689 = _1663 + (-0.5);
    float _3691 = -_2280;
    float _3693 = fma(_3063, _3691, _3685);
    int _3695 = _3209 + _3687;
    float _3697 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3699 = int(_3697);
    float _3701 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3703 = precise::clamp(_3701, 0.0, 1.0);
    int _3705 = _3695 >> 2;
    float _3707 = _3671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3709 = -_1359;
    float _3711 = _3709 + 1.0;
    float _3713 = fma(_3703, -2.0, 3.0);
    float _3715 = _3703 * _3703;
    float _3717 = -_3707;
    float _3719 = -_1251;
    float _3721 = fma(_3717, _3689, _3719);
    int _3723 = _3705 << 4;
    int _3725 = _3723 + 656;
    float _3727 = -_2288;
    float _3729 = fma(_3381, _3727, _3657);
    float _3731 = _3715 * _3713;
    float _3733 = fma(_3225, _3711, _3669);
    uint _3735 = uint(int(uint(_3725) >> uint(2)));
    uint _3737 = uint(int(uint(int(_3735)) >> uint(2)));
    int _3739 = int(_3735) & 3;
    float _3741 = (*spvDescriptorSet0.vp_c9)._m0[int(_3737)][_3739];
    int _3743 = int(_3735) + 1;
    uint _3745 = uint(int(uint(_3743) >> uint(2)));
    int _3747 = _3743 & 3;
    float _3749 = (*spvDescriptorSet0.vp_c9)._m0[int(_3745)][_3747];
    float _3751 = fma(_1663, _2296, _3721);
    float _3753 = -_3731;
    float _3755 = _3753 + 1.0;
    float _3757 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3759 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3761 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3763 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3731);
    out.m_76.x = _3729;
    out.m_76.y = _3733;
    out.m_76.z = _3693;
    out.m_76.w = _3751;
    int _3765 = _3725 + 8;
    uint _3767 = uint(int(uint(_3765) >> uint(2)));
    uint _3769 = uint(int(uint(int(_3767)) >> uint(2)));
    int _3771 = int(_3767) & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = int(_3767) + 1;
    uint _3777 = uint(int(uint(_3775) >> uint(2)));
    int _3779 = _3775 & 3;
    float _3781 = (*spvDescriptorSet0.vp_c9)._m0[int(_3777)][_3779];
    float _3783 = -_1545;
    float _3785 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3757);
    float _3787 = -_1545;
    float _3789 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3759);
    float _3791 = -_1545;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3761);
    int _3795 = ~_3291;
    int _3797 = _3795 + _3357;
    int _3799 = _3797 + 1;
    float _3801 = fma(_3599, _3627, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3803 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3789);
    int _3805 = ~_3263;
    int _3807 = _3805 + _3343;
    int _3809 = _3807 + 1;
    int _3811 = _2340 * _3683;
    int _3813 = _3811 + _3011;
    float _3815 = fma(_3801, _3453, _3655);
    int _3817 = _2340 * _3799;
    int _3819 = _3817 + _2957;
    float _3821 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3823 = _2300 * _3809;
    int _3825 = _3823 + _2635;
    float _3827 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3829 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3831 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3833 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3835 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3827);
    int _3837 = abs(_3277);
    float _3839 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3829);
    float _3841 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3831);
    bool _3843 = !_3395;
    int _3845 = _3843 ? 0 : 1;
    float _3847 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3849 = ~_3837;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    float _3855 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3839);
    int _3857 = abs(_3285);
    float _3859 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3861 = uint(_3173) >= 2u;
    float _3863 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3833);
    int _3865 = ~_3857;
    int _3867 = _3865 + 1;
    int _3869 = _3867 + 1;
    float _3871 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3847);
    int _3873 = abs(_3845);
    float _3875 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3859);
    int _3877 = abs(_3375);
    float _3879 = fma(_3413, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3815);
    int _3881 = _3861 ? 0 : 1;
    float _3883 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3871);
    bool _3885 = _3173 != 3;
    float _3887 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3875);
    int _3889 = ~_3877;
    int _3891 = _3889 + 1;
    int _3893 = _3891 + 1;
    int _3895 = _3853 * as_type<int>(_3749);
    int _3897 = abs(_3333);
    float _3899 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3785);
    bool _3901 = !_2821;
    int _3903 = _3901 ? _3813 : (-1);
    int _3905 = _3869 * as_type<int>(_3741);
    int _3907 = _3905 + _3895;
    int _3909 = ~_3897;
    int _3911 = _3909 + 1;
    int _3913 = _3911 + 1;
    float _3915 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3793);
    int _3917 = _3151 >> 31;
    out.m_78.x = _3879;
    int _3919 = ~_3881;
    int _3921 = _3919 + 1;
    int _3923 = _3921 + 1;
    int _3925 = _3913 * as_type<int>(_3773);
    int _3927 = _3925 + _3907;
    int _3929 = _3917 & 3;
    int _3931 = ~_3873;
    int _3933 = _3931 + 1;
    int _3935 = _3933 + 1;
    int _3937 = _3893 * as_type<int>(_3781);
    int _3939 = _3937 + _3927;
    int _3941 = _3151 + _3929;
    float _3943 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3835);
    int _3945 = abs(_3699);
    int _3947 = _3939 * _3935;
    float _3949 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3841);
    float _3951 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3863);
    float _3953 = float(uint(_3699));
    float _3955 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3957 = _3941 >> 2;
    float _3959 = _3955 * _3899;
    int _3961 = _3923;
    if (_3885)
    {
        int _3963 = ~_3881;
        int _3965 = _3963 + 1;
        _3961 = _3965;
    }
    int _3967 = _3961;
    float _3969 = 1.0 / _3953;
    int _3971 = _3903 >> 31;
    float _3973 = fma(_3821, _3949, _3959);
    bool _3975 = !_2615;
    int _3977 = _3975 ? _3825 : (-1);
    out.m_80.x = _3949;
    out.m_80.y = _3943;
    out.m_80.z = _3951;
    int _3979 = _3903 & 3;
    bool _3981 = _3979 != 0;
    float _3983 = _3855 + _3973;
    float _3985 = float(uint(_3945));
    int _3987 = _3977 * _3873;
    int _3989 = _3987 + _3947;
    int _3991 = _3957 << 4;
    int _3993 = _3991 + 368;
    float _3995 = _3955 * _3803;
    int _3997 = _3903 & 3;
    bool _3999 = _3997 != 0;
    int _4001 = _3971 & 3;
    uint _4003 = uint(int(uint(_3993) >> uint(2)));
    uint _4005 = uint(int(uint(int(_4003)) >> uint(2)));
    int _4007 = int(_4003) & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = int(_4003) + 1;
    uint _4013 = uint(int(uint(_4011) >> uint(2)));
    int _4015 = _4011 & 3;
    float _4017 = (*spvDescriptorSet0.vp_c9)._m0[int(_4013)][_4015];
    int _4019 = _3981 ? 0 : 1;
    float _4021 = 1.0 / _3985;
    bool _4023 = uint(_3997) > 1u;
    float _4025 = fma(_3821, _3943, _3995);
    int _4027 = _3903 + _4001;
    int _4029 = abs(_3989);
    int _4031 = _4027 >> 2;
    int _4033 = ~_4019;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = _4031 << 4;
    int _4041 = _4039 + 800;
    bool _4043 = _1799 <= 8000.0;
    bool _4045 = isnan(_1799);
    bool _4047 = _4043 || _4045;
    bool _4049 = isnan(8000.0);
    bool _4051 = _4047 || _4049;
    float _4053 = float(_4051);
    int _4055 = _4037;
    if (!_4023)
    {
        int _4057 = ~_4019;
        int _4059 = _4057 + 1;
        _4055 = _4059;
    }
    int _4061 = _4055;
    uint _4063 = uint(int(uint(_4041) >> uint(2)));
    uint _4065 = uint(int(uint(int(_4063)) >> uint(2)));
    int _4067 = int(_4063) & 3;
    float _4069 = (*spvDescriptorSet0.vp_c9)._m0[int(_4065)][_4067];
    int _4071 = int(_4063) + 1;
    uint _4073 = uint(int(uint(_4071) >> uint(2)));
    int _4075 = _4071 & 3;
    float _4077 = (*spvDescriptorSet0.vp_c9)._m0[int(_4073)][_4075];
    int _4079 = as_type<int>(_3969) + (-2);
    float _4081 = _4053 * _3763;
    float _4083 = float(uint(_3989));
    int _4085 = ~_3133;
    int _4087 = _4085 + _3247;
    int _4089 = _4087 + 1;
    float _4091 = as_type<float>(_4079) * _4083;
    int _4093 = as_type<int>(_4021) + (-2);
    int _4095 = _3993 + 8;
    uint _4097 = uint(int(uint(_4095) >> uint(2)));
    uint _4099 = uint(int(uint(int(_4097)) >> uint(2)));
    int _4101 = int(_4097) & 3;
    float _4103 = (*spvDescriptorSet0.vp_c9)._m0[int(_4099)][_4101];
    int _4105 = int(_4097) + 1;
    uint _4107 = uint(int(uint(_4105) >> uint(2)));
    int _4109 = _4105 & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    float _4113 = float(uint(_4029));
    int _4115 = _2270 * _4089;
    int _4117 = _4115 + _2597;
    float _4119 = _3955 * _3915;
    float _4121 = trunc(_4091);
    float _4123 = precise::max(_4121, 0.0);
    uint _4125 = uint(_4123);
    bool _4127 = !_3175;
    int _4129 = _4127 ? 0 : 1;
    float _4131 = as_type<float>(_4093) * _4113;
    bool _4133 = uint(_3997) >= 2u;
    int _4135 = _4041 + 8;
    uint _4137 = uint(int(uint(_4135) >> uint(2)));
    uint _4139 = uint(int(uint(int(_4137)) >> uint(2)));
    int _4141 = int(_4137) & 3;
    float _4143 = (*spvDescriptorSet0.vp_c9)._m0[int(_4139)][_4141];
    int _4145 = int(_4137) + 1;
    uint _4147 = uint(int(uint(_4145) >> uint(2)));
    int _4149 = _4145 & 3;
    float _4151 = (*spvDescriptorSet0.vp_c9)._m0[int(_4147)][_4149];
    bool _4153 = _3997 != 3;
    float _4155 = fma(_3821, _3951, _4119);
    int _4157 = ~_3699;
    int _4159 = _4157 + 1;
    float _4161 = trunc(_4131);
    float _4163 = precise::max(_4161, 0.0);
    uint _4165 = uint(_4163);
    int _4167 = _4133 ? 0 : 1;
    bool _4169 = _3173 != 3;
    int _4171 = ~_3945;
    int _4173 = _4171 + 1;
    int _4175 = abs(_3241);
    int _4177 = _4159 * int(_4125);
    int _4179 = _4177 + _3989;
    float _4181 = fma(_3955, _3955, 1.0);
    int _4183 = ~_4175;
    int _4185 = _4183 + 1;
    int _4187 = _4185 + 1;
    int _4189 = ~_4167;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    int _4195 = _4193;
    if (_4153)
    {
        int _4197 = ~_4167;
        int _4199 = _4197 + 1;
        _4195 = _4199;
    }
    int _4201 = _4195;
    int _4203 = _4173 * int(_4165);
    int _4205 = _4203 + _4029;
    float _4207 = float(uint(_4179));
    int _4209 = _4187 * as_type<int>(_4017);
    bool _4211 = !_3999;
    int _4213 = _4211 ? 0 : 1;
    float _4215 = rsqrt(_4181);
    int _4217 = abs(_4129);
    float _4219 = as_type<float>(_4079) * _4207;
    float _4221 = float(uint(_4205));
    int _4223 = abs(_4213);
    int _4225 = abs(_4061);
    float _4227 = trunc(_4219);
    float _4229 = precise::max(_4227, 0.0);
    uint _4231 = uint(_4229);
    float _4233 = as_type<float>(_4093) * _4221;
    int _4235 = abs(_3967);
    int _4237 = abs(_4201);
    float _4239 = _3955 * _4215;
    int _4241 = ~_4225;
    int _4243 = _4241 + 1;
    int _4245 = _4243 + 1;
    float _4247 = trunc(_4233);
    float _4249 = precise::max(_4247, 0.0);
    uint _4251 = uint(_4249);
    int _4253 = ~_4217;
    int _4255 = _4253 + 1;
    int _4257 = _4255 + 1;
    int _4259 = ~_4223;
    int _4261 = _4259 + 1;
    int _4263 = _4261 + 1;
    int _4265 = _4245 * as_type<int>(_4077);
    int _4267 = _4257 * as_type<int>(_4009);
    int _4269 = _4267 + _4209;
    int _4271 = _4263 * as_type<int>(_4069);
    int _4273 = _4271 + _4265;
    int _4275 = ~_4235;
    int _4277 = _4275 + 1;
    int _4279 = _4277 + 1;
    int _4281 = ~_4237;
    int _4283 = _4281 + 1;
    int _4285 = _4283 + 1;
    bool _4287 = _3997 != 3;
    int _4289 = _4279 * as_type<int>(_4103);
    int _4291 = _4289 + _4269;
    float _4293 = -_3855;
    float _4295 = _4239 * _4293;
    int _4297 = _4285 * as_type<int>(_4143);
    int _4299 = _4297 + _4273;
    float _4301 = -_3883;
    float _4303 = _4239 * _4301;
    bool _4305 = !_4169;
    int _4307 = _4305 ? 0 : (-1);
    float _4309 = fma(_4215, _3899, _4295);
    int _4311 = int(_4125) + int(_4231);
    float _4313 = fma(_4215, _3803, _4303);
    bool _4315 = !_4287;
    int _4317 = _4315 ? 0 : (-1);
    float _4319 = -_3887;
    float _4321 = _4239 * _4319;
    int _4323 = abs(_4307);
    int _4325 = ~_3699;
    int _4327 = _4325 + 1;
    int _4329 = abs(_4317);
    int _4331 = ~_3945;
    int _4333 = _4331 + 1;
    int _4335 = _4327 * _4311;
    int _4337 = _4335 + _3989;
    float _4339 = fma(_4215, _3915, _4321);
    int _4341 = int(_4165) + int(_4251);
    float _4343 = _3883 + _4025;
    float _4345 = _4081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _4347 = ~_4323;
    int _4349 = _4347 + 1;
    int _4351 = _4349 + 1;
    out.m_82.x = _4309;
    out.m_82.y = _4313;
    out.m_82.z = _4339;
    bool _4353 = uint(_4337) >= uint(_3699);
    int _4355 = _4333 * _4341;
    int _4357 = _4355 + _4029;
    int _4359 = ~_4329;
    int _4361 = _4359 + 1;
    int _4363 = _4361 + 1;
    int _4365 = _4351 * as_type<int>(_4111);
    int _4367 = _4365 + _4291;
    bool _4369 = !_3387;
    int _4371 = _4369 ? 0 : 1;
    float _4373 = _3027 * _4345;
    float _4375 = precise::clamp(_4373, 0.0, 1.0);
    bool _4377 = !_4353;
    int _4379 = _4377 ? 0 : (-1);
    int _4381 = _4363 * as_type<int>(_4151);
    int _4383 = _4381 + _4299;
    bool _4385 = uint(_4357) >= uint(_3945);
    int _4387 = _3989 ^ _3699;
    int _4389 = abs(_4371);
    float _4391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4393 = ~_4311;
    int _4395 = _4393 + _4379;
    int _4397 = _4395 + 1;
    bool _4399 = !_4385;
    int _4401 = _4399 ? 0 : (-1);
    uint _4403 = uint(int(uint(_4387) >> uint(31)));
    int _4405 = _3699 * _4397;
    int _4407 = _4405 + _3989;
    int _4409 = ~_4389;
    int _4411 = _4409 + 1;
    int _4413 = _4411 + 1;
    int _4415 = ~_4401;
    int _4417 = _4341 + _4415;
    int _4419 = _4417 + 1;
    int _4421 = ~int(_4403);
    int _4423 = _4421 + 1;
    int _4425 = _4367 * _4413;
    bool _4427 = _3699 == 0;
    float _4429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4431 = !_3399;
    int _4433 = _4431 ? 0 : 1;
    int _4435 = _4419 ^ _4423;
    bool _4437 = !_4427;
    int _4439 = _4437 ? _4407 : (-1);
    float _4441 = _3887 + _4155;
    int _4443 = abs(_4433);
    int _4445 = ~_4423;
    int _4447 = _4445 + _4435;
    int _4449 = _4447 + 1;
    float _4451 = float(_4439);
    float _4453 = _4391 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4455 = ~_4443;
    int _4457 = _4455 + 1;
    int _4459 = _4457 + 1;
    out.m_84.x = _3983;
    out.m_84.y = _4343;
    out.m_84.z = _4441;
    bool _4461 = _3699 == 0;
    float _4463 = fma(_4453, _4451, _1365);
    float _4465 = _1019 + 0.5;
    int _4467 = _4383 * _4459;
    bool _4469 = !_4461;
    int _4471 = _4469 ? _4449 : (-1);
    float _4473 = fma(_4453, _4465, _4463);
    bool _4475 = !_2821;
    int _4477 = _4475 ? _3819 : (-1);
    float _4479 = in.m_86.x;
    float _4481 = float(_4471);
    float _4483 = _4429 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4485 = _1003 + (-0.5);
    int _4487 = _4477 * _4443;
    int _4489 = _4487 + _4467;
    bool _4491 = !_2567;
    int _4493 = _4491 ? _4117 : (-1);
    float _4495 = -_1367;
    float _4497 = fma(_4483, _4481, _4495);
    float _4499 = -_2316;
    float _4501 = fma(_1019, _4499, _4473);
    float _4503 = _2171 * 0.5;
    float _4505 = float(_4489);
    float _4507 = -_4483;
    float _4509 = fma(_4507, _4485, _4497);
    int _4511 = _4493 * _4389;
    int _4513 = _4511 + _4425;
    float _4515 = _2350 + _2171;
    float _4517 = fma(_2211, -0.5, _4503);
    float _4519 = fma(_1003, _2328, _4509);
    out.m_88.w = _4505;
    float _4521 = float(_4513);
    float _4523 = _2209 + _2171;
    float _4525 = -_4375;
    float _4527 = fma(_4525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4529 = _4515 * 0.5;
    float _4531 = _4523 * 0.5;
    out.m_90.x = _4501;
    out.m_90.y = _4519;
    float _4533 = _2789 * _2245;
    float _4535 = _4527 * _4479;
    float _4537 = -_2789;
    float _4539 = _4537 + 1.0;
    out.m_92.x = _4531;
    out.m_92.y = _4517;
    out.m_92.z = _4529;
    out.m_92.w = _2171;
    float _4541 = _2256 * _4533;
    float _4543 = _2266 * _4533;
    float _4545 = _4535 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4547 = _2256 * _4539;
    float _4549 = fma(_2262, _4541, _2250);
    float _4551 = fma(_2264, _4541, _2252);
    float _4553 = fma(_2256, _4543, _2254);
    out.m_94.x = _4545;
    bool _4555 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4557 = isnan(_1939);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4563 = _4559 || _4561;
    float _4565 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_96.x = _4549;
    out.m_96.y = _4551;
    out.m_96.z = _4553;
    out.m_96.w = _4547;
    out.m_88.x = _4521;
    float _4567 = _4535;
    float _4569 = _4533;
    float _4571 = _4521;
    float _4573 = _4541;
    if (!_4563)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4575 = _2489;
    float _4577 = _4575;
    float _4579 = _4575;
    if (!_4563)
    {
        _2491 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4581 = _2491;
    float _4583 = _4581;
    float _4585 = _4581;
    if (!_4563)
    {
        _4567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4587 = _4567;
    float _4589 = _4587;
    float _4591 = _4587;
    if (!_4563)
    {
        _4569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4593 = _4569;
    float _4595 = _4593;
    float _4597 = _4593;
    if (!_4563)
    {
        _4571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4599 = _4571;
    float _4601 = _4599;
    float _4603 = _4599;
    if (!_4563)
    {
        _4573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4605 = _4573;
    bool _4607 = !_4563;
    float _4609 = _4605;
    float _4611 = _4605;
    if (!_4607)
    {
        bool _4613 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4615 = isnan(_1939);
        bool _4617 = _4613 || _4615;
        bool _4619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4621 = _4617 || _4619;
        if (!_4621)
        {
            float _4623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4625 = _1939 + _4623;
            float _4627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4627;
            float _4631 = 1.0 / _4629;
            float _4633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4635 = _4633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4637 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4639 = _4637 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4643 = _4641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4647 = _4645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4651 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4653 = _4625 * _4631;
            float _4655 = precise::clamp(_4653, 0.0, 1.0);
            float _4657 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4659 = _4657 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4661 = fma(_4655, _4635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4663 = fma(_4655, _4659, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4665 = fma(_4655, _4639, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4667 = fma(_4655, _4643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4669 = fma(_4655, _4647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4671 = fma(_4655, _4651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4585 = _4663;
            _4603 = _4669;
            _4579 = _4661;
            _4597 = _4667;
            _4591 = _4665;
            _4611 = _4671;
            _4673 = true;
        }
        else
        {
            bool _4675 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4677 = isnan(_1939);
            bool _4679 = _4675 || _4677;
            bool _4681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4683 = _4679 || _4681;
            if (!_4683)
            {
                _4577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4685 = _4577;
            _4579 = _4685;
            if (!_4683)
            {
                _4583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4687 = _4583;
            _4585 = _4687;
            if (!_4683)
            {
                _4589 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4689 = _4589;
            _4591 = _4689;
            if (!_4683)
            {
                _4595 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4691 = _4595;
            _4597 = _4691;
            if (!_4683)
            {
                _4601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4693 = _4601;
            _4603 = _4693;
            if (!_4683)
            {
                _4609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4695 = _4609;
            bool _4697 = !_4683;
            _4611 = _4695;
            if (!_4697)
            {
                bool _4699 = _1939 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4701 = isnan(_1939);
                bool _4703 = _4699 || _4701;
                bool _4705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4707 = _4703 || _4705;
                if (!_4707)
                {
                    float _4709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4711 = _1939 + _4709;
                    float _4713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4713;
                    float _4717 = 1.0 / _4715;
                    float _4719 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4721 = _4719 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4723 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4725 = _4723 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4729 = _4727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4733 = _4731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4737 = _4735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4739 = _4711 * _4717;
                    float _4741 = precise::clamp(_4739, 0.0, 1.0);
                    float _4743 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4745 = _4743 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4747 = fma(_4741, _4721, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4749 = fma(_4741, _4745, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4751 = fma(_4741, _4725, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4753 = fma(_4741, _4729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4755 = fma(_4741, _4733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4757 = fma(_4741, _4737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4585 = _4749;
                    _4603 = _4755;
                    _4579 = _4747;
                    _4597 = _4753;
                    _4591 = _4751;
                    _4611 = _4757;
                    _4673 = true;
                }
                else
                {
                    _4585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4597 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4591 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4673 = false;
    float _4759 = _4585;
    float _4761 = _4603;
    float _4763 = _4579;
    float _4765 = _4597;
    float _4767 = _4591;
    float _4769 = _4611;
    float _4771 = fma(_4343, -0.5, 0.5);
    float _4773 = precise::clamp(_4771, 0.0, 1.0);
    float _4775 = -_4759;
    float _4777 = _4775 + _4761;
    float _4779 = -_4763;
    float _4781 = _4779 + _4765;
    out.m_98.x = 0.0;
    float _4783 = fma(_4773, _4777, _4759);
    float _4785 = -_4767;
    float _4787 = _4785 + _4769;
    float _4789 = fma(_4773, _4781, _4763);
    float _4791 = _4783 * 0.586610972881317138671875;
    bool _4793 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4795 = fma(_4773, _4787, _4767);
    float _4797 = _4565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4799 = fma(_4789, 0.298911988735198974609375, _4791);
    bool _4801 = _1909 > 0.0;
    bool _4803 = isnan(_1909);
    bool _4805 = _4801 || _4803;
    bool _4807 = isnan(0.0);
    bool _4809 = _4805 || _4807;
    float _4811 = fma(_4795, 0.114477999508380889892578125, _4799);
    out.m_53.x = _4797;
    float _4813 = -_4811;
    float _4815 = _4789 + _4813;
    float _4817 = -_4811;
    float _4819 = _4783 + _4817;
    float _4821 = -_4811;
    float _4823 = _4795 + _4821;
    float _4825 = fma(_4815, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    float _4827 = fma(_4819, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    float _4829 = fma(_4823, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4811);
    bool _4831 = !_4793;
    if (!_4831)
    {
        float _4833 = -_1853;
        float _4835 = _4833 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4837 = -_1855;
        float _4839 = _4837 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4841 = -_1857;
        float _4843 = _4841 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4845 = _4835 * _4835;
        float _4847 = fma(_4839, _4839, _4845);
        float _4849 = fma(_4843, _4843, _4847);
        float _4851 = sqrt(_4849);
        float _4853 = rsqrt(_4849);
        float _4855 = -_4851;
        float _4857 = _4855 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4859 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4861 = precise::clamp(_4859, 0.0, 1.0);
        float _4863 = _4839 * _4853;
        float _4865 = _4835 * _4853;
        float _4867 = abs(_4861);
        float _4869 = log2(_4867);
        float _4871 = _4843 * _4853;
        float _4873 = _4863 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4875 = _4343 * _4865;
        float _4877 = -_4865;
        float _4879 = -_4873;
        float _4881 = fma(_4877, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4879);
        float _4883 = fma(_3983, _4863, _4875);
        float _4885 = -_4871;
        float _4887 = fma(_4885, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4881);
        float _4889 = fma(_4441, _4871, _4883);
        float _4891 = precise::clamp(_4889, 0.0, 1.0);
        float _4893 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4895 = _4887 + _4893;
        float _4897 = _4869 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4899 = _4895 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4901 = precise::clamp(_4899, 0.0, 1.0);
        float _4903 = exp2(_4897);
        float _4905 = _4903 * _4901;
        float _4907 = _4891 * _4905;
        float _4909 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4911 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4913 = _4907 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _4909;
        out.m_98.y = _4911;
        out.m_98.z = _4913;
    }
    out.m_100.x = _4825;
    out.m_100.y = _4827;
    out.m_100.z = _4829;
    if (_4809)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4915 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4915;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

