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
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_98 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4925 = false;
    bool _631 = false;
    bool _449 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5235 = as_type<float>(_145);
        out.gl_Position.z = _5235;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5298 = as_type<float>(_177);
        out.gl_Position.z = _5298;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_211;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _183 * _189;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _219);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    bool _229 = !_207;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_181, _199, _225);
    float _235 = fma(_185, _191, _223);
    float _237 = fma(_185, _197, _227);
    float _239 = fma(_185, _203, _233);
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _279;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _305 = 1.0 / _287;
    float _307 = 1.0 / _283;
    float _309 = _267 * _301;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_299;
    float _325 = _323 + 1.0;
    float _327 = _321 * _325;
    float _329 = _271 * _305;
    bool _331 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_263);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_321;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _341 * _345;
    float _353 = -_341;
    float _355 = _353 + 1.0;
    float _357 = _275 * _307;
    bool _359 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_263);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = fma(_349, _357, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = fma(_373, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = _369 * _355;
    float _389 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_383, _357, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = -_369;
    float _395 = _393 + 1.0;
    float _397 = _385 * _387;
    float _399 = _389 * _387;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _413 = fma(_403, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _415 = fma(_375, _351, _405);
    float _417 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_391, _351, _411);
    float _421 = fma(_413, _327, _415);
    float _423 = fma(_417, _327, _419);
    float _425 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _421);
    float _427 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _423);
    bool _429 = !_303;
    float _447;
    if (!_429)
    {
        float _431 = in.m_66.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _171;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _467 = isnan(_451);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _481 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = isnan(_451);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _459;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -_475;
    float _501 = _499 + 1.0;
    bool _503 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_451);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _517 = 1.0 / _463;
    float _519 = 1.0 / _479;
    float _521 = _497 * _493;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _527 = _491 * _501;
    float _529 = -_491;
    float _531 = _529 + 1.0;
    float _533 = fma(_521, _455, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _535;
    float _539 = _513 * _531;
    float _541 = _525 * _517;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _451 + _543;
    bool _547 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = isnan(_451);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _533 * _539;
    float _561 = -_513;
    float _563 = _561 + 1.0;
    float _565 = fma(_541, _545, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _451 + _567;
    float _571 = _537 * _519;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _579 = fma(_571, _569, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _581 = _475 * _575;
    float _583 = fma(_565, _527, _577);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _587 = fma(_579, _581, _583);
    float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _591 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[118].x, _587);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _595 = in.m_68.x;
    float _597 = in.m_68.y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _601 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _603 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _589;
    out.m_70.y = _603;
    out.m_70.z = _605;
    out.m_70.w = _601;
    float _607 = _427 * _597;
    float _609 = _425 * _595;
    bool _611 = !_515;
    float _629;
    if (!_611)
    {
        float _613 = in.m_66.x;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _617 = _613 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        _629 = _171;
    }
    _631 = false;
    float _633 = _629;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _633 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _643 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _645 = isnan(_633);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _663 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _665 = isnan(_633);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = 1.0 / _641;
    float _677 = -_653;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _681;
    bool _685 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _687 = isnan(_633);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = _673 * _679;
    float _699 = -_673;
    float _701 = _699 + 1.0;
    bool _703 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _705 = 1.0 / _657;
    float _707 = _695 * _701;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _661;
    float _715 = _683 * _675;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _721 = fma(_715, _637, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _723 = _719 * _705;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _727 = _633 + _725;
    bool _729 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _731 = isnan(_633);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _741;
    float _745 = _721 * _707;
    float _747 = fma(_723, _727, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = _633 + _749;
    float _753 = -_739;
    float _755 = _753 + 1.0;
    float _757 = _743 * _713;
    float _759 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[131].x, _745);
    float _761 = _653 * _755;
    float _763 = fma(_757, _751, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _765 = fma(_747, _697, _759);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _769 = fma(_763, _761, _765);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _777 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[134].x, _769);
    float _779 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _773;
    out.m_72.y = _779;
    out.m_72.z = _781;
    out.m_72.w = _783;
    bool _785 = !_703;
    float _787 = _781;
    float _789 = _783;
    if (!_785)
    {
        float _791 = in.m_66.x;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _795 = _791 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _799 = _797 * _793;
        float _801 = floor(_799);
        float _803 = -_801;
        float _805 = _799 + _803;
        _173 = _805;
    }
    float _807 = _173;
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _811 = int(_809);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _819 = int(_817);
    float _821 = float(_811);
    float _823 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _825 = int(_823);
    if (_815)
    {
        _787 = 1.0;
    }
    float _827 = _787;
    float _829 = _827;
    if (_815)
    {
        _789 = 1.0;
    }
    float _831 = _789;
    int _833 = 0;
    float _835 = _831;
    if (_815)
    {
        _833 = 0;
    }
    int _837 = _833;
    float _839 = float(_819);
    float _841 = 1.0 / _821;
    float _843 = 1.0 / _839;
    float _845 = float(uint(_825));
    int _847 = ~_825;
    int _849 = _847 + 1;
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _853 = int(_851);
    float _855 = _841 * _127;
    float _857 = _841;
    float _859 = _839;
    int _861 = _837;
    if (_815)
    {
        float _863 = in.m_66.x;
        float _865 = in.m_66.y;
        _857 = _863;
        _859 = _865;
    }
    float _867 = _857;
    float _869 = _859;
    float _871 = _843 * _127;
    float _873 = 1.0 / _845;
    float _875 = float(uint(_853));
    float _877 = trunc(_855);
    int _879 = int(_877);
    float _881 = 1.0 / _875;
    int _883 = as_type<int>(_873) + (-2);
    float _885 = 0.0;
    float _887 = _867;
    float _889 = _869;
    if (_815)
    {
        _885 = _869;
    }
    float _891 = _885;
    float _893 = trunc(_871);
    int _895 = int(_893);
    float _897 = float(uint(_879));
    float _899 = as_type<float>(_883) * _897;
    float _901 = _897;
    float _903 = _891;
    if (_815)
    {
        _901 = _867;
    }
    float _905 = _901;
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _909 = int(_907);
    int _911 = as_type<int>(_881) + (-2);
    float _913 = 0.0;
    float _915 = _905;
    if (_815)
    {
        _913 = _905;
    }
    float _917 = _913;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _921 = int(_919);
    float _923 = float(uint(_895));
    float _925 = as_type<float>(_911) * _923;
    int _927 = as_type<int>(_923);
    float _929 = _917;
    if (_815)
    {
        _927 = 0;
    }
    int _931 = _927;
    float _933 = trunc(_899);
    float _935 = precise::max(_933, 0.0);
    uint _938 = uint(_935);
    float _940 = float(uint(_909));
    float _942 = 1.0 / _940;
    float _944 = float(_921);
    float _946 = trunc(_925);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    float _952 = 1.0 / _944;
    float _954 = _944;
    int _956 = _931;
    if (_815)
    {
        _954 = _905;
    }
    float _958 = _954;
    float _960 = _958;
    if (!_815)
    {
        float _962 = in.m_66.x;
        float _964 = in.m_66.y;
        float _966 = in.m_66.z;
        float _968 = _962 * 3.1415927410125732421875;
        float _970 = _968 * 0.15915493667125701904296875;
        float _972 = _964 * 3.1415927410125732421875;
        float _974 = _972 * 0.15915493667125701904296875;
        float _976 = _970 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = sin(_980);
        _829 = 7.345489978790283203125;
        _887 = _962;
        _835 = 5.839270114898681640625;
        _960 = _966;
        _915 = _964;
        _889 = _964;
        _956 = 1;
        _929 = _978;
        _903 = _982;
        _861 = 2;
    }
    float _984 = _829;
    float _986 = _887;
    float _988 = _835;
    float _990 = _960;
    float _992 = _915;
    float _994 = _889;
    int _996 = _956;
    float _998 = _929;
    float _1000 = _903;
    int _1002 = _861;
    int _1004 = _849 * int(_938);
    int _1006 = _1004 + _879;
    float _1008 = in.m_66.z;
    float _1010 = in.m_66.w;
    int _1012 = ~_853;
    int _1014 = _1012 + 1;
    float _1016 = _984 * _986;
    float _1018 = _988 * _990;
    float _1020 = float(uint(_1006));
    float _1022 = _984 * _992;
    int _1024 = _1014 * int(_950);
    int _1026 = _1024 + _895;
    float _1028 = floor(_1016);
    int _1030 = as_type<int>(_942) + (-2);
    float _1032 = as_type<float>(_883) * _1020;
    float _1034 = _952 * _127;
    float _1036 = float(uint(_1026));
    float _1038 = in.m_60.w;
    float _1040 = float(_825);
    float _1042 = floor(_1018);
    float _1044 = as_type<float>(_911) * _1036;
    float _1046 = float(_879);
    bool _1048 = _994 > 0.5;
    bool _1050 = _1046 >= _1040;
    bool _1052 = isnan(_1046);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(_1040);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = trunc(_1034);
    int _1064 = int(_1062);
    bool _1066 = _1010 > 0.5;
    float _1068 = -_1028;
    float _1070 = _1016 + _1068;
    bool _1072 = _1008 > 0.5;
    float _1074 = _1070 * _1040;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1078 = _1076 != 0;
    float _1080 = trunc(_1044);
    float _1082 = precise::max(_1080, 0.0);
    uint _1084 = uint(_1082);
    float _1086 = -_1042;
    float _1088 = _1018 + _1086;
    int _1090 = ~_853;
    int _1092 = _1090 + 1;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1100 = _1098 != 0;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1104 = _1102 != 0;
    float _1106 = -_217;
    int _1108 = _1072 ? as_type<int>(_1106) : as_type<int>(_217);
    float _1110 = trunc(_1032);
    float _1112 = precise::max(_1110, 0.0);
    uint _1114 = uint(_1112);
    float _1116 = float(uint(_1064));
    int _1118 = int(_1066);
    int _1120 = _1072 ? 2 : 0;
    int _1122 = _1118 | _1120;
    int _1124 = _1078 ? 4 : 0;
    int _1126 = _1122 | _1124;
    int _1128 = _1096 ? 8 : 0;
    int _1130 = _1126 | _1128;
    int _1132 = _1100 ? 16 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1104 ? 32 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1048 ? 64 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1142 & 64;
    float _1146 = as_type<float>(_1030) * _1116;
    float _1148 = -_231;
    int _1150 = _1048 ? as_type<int>(_1148) : as_type<int>(_231);
    float _1152 = trunc(_1060);
    int _1154 = int(_1152);
    int _1156 = int(_950) + int(_1084);
    bool _1158 = !_1104;
    float _1160 = _1158 ? _217 : as_type<float>(_1108);
    float _1162 = float(_853);
    bool _1164 = !_1078;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = trunc(_1146);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = !_1100;
    float _1176 = _1174 ? _231 : as_type<float>(_1150);
    int _1178 = int(_938) + int(_1114);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1190 = _1188 != 0;
    int _1192 = _1092 * _1156;
    int _1194 = _1192 + _895;
    int _1196 = ~_825;
    int _1198 = _1196 + 1;
    float _1200 = floor(_1022);
    float _1202 = float(_895);
    bool _1204 = !_1186;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = _1198 * _1178;
    int _1210 = _1208 + _879;
    bool _1212 = uint(_1194) >= uint(_853);
    float _1214 = _1088 * _1162;
    bool _1216 = !_1182;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1222 = log2(_1220);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1226 = _1224 != 0;
    bool _1228 = uint(_1210) >= uint(_825);
    bool _1230 = _1202 >= _1162;
    bool _1232 = isnan(_1202);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(_1162);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    bool _1242 = !_1190;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = trunc(_1214);
    int _1248 = int(_1246);
    bool _1250 = !_1226;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = -_1200;
    float _1256 = _1022 + _1254;
    bool _1258 = !_1212;
    int _1260 = _1258 ? 0 : (-1);
    bool _1262 = !_1228;
    int _1264 = _1262 ? 0 : (-1);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1276 = _1274 != 0;
    float _1278 = trunc(_1074);
    int _1280 = int(_1278);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1284 = _1282 != 0;
    int _1286 = ~_909;
    int _1288 = _1286 + 1;
    int _1290 = ~_1156;
    int _1292 = _1290 + _1260;
    int _1294 = _1292 + 1;
    int _1296 = ~_1178;
    int _1298 = _1296 + _1264;
    int _1300 = _1298 + 1;
    float _1302 = trunc(_1240);
    int _1304 = int(_1302);
    int _1306 = abs(_1166);
    int _1308 = _1288 * int(_1172);
    int _1310 = _1308 + _1064;
    bool _1312 = !_1284;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _853 * _1294;
    int _1318 = _1316 + _895;
    bool _1320 = _825 == 0;
    int _1322 = abs(_1314);
    int _1324 = _1280 * _1306;
    int _1326 = _1324 + _879;
    float _1328 = float(uint(_1310));
    int _1330 = _825 * _1300;
    int _1332 = _1330 + _879;
    bool _1334 = !_1272;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1248 * _1322;
    int _1340 = _1338 + _895;
    float _1342 = _167 * _127;
    bool _1344 = !_1268;
    int _1346 = _1344 ? 0 : 1;
    bool _1348 = _1144 != 0;
    float _1350 = _1040 * _1342;
    bool _1352 = _853 == 0;
    float _1354 = as_type<float>(_1030) * _1328;
    int _1356 = ~_1154;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = _1162 * _1342;
    bool _1364 = !_1320;
    int _1366 = _1364 ? _1332 : (-1);
    float _1368 = trunc(_1350);
    int _1370 = int(_1368);
    int _1372 = ~_1304;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1352;
    int _1380 = _1378 ? _1318 : (-1);
    int _1382 = _1366 * _1360;
    int _1384 = _825 + (-1);
    int _1386 = _853 + (-1);
    float _1388 = trunc(_1354);
    float _1390 = precise::max(_1388, 0.0);
    uint _1392 = uint(_1390);
    int _1394 = _1380 * _1376;
    int _1396 = abs(_1336);
    int _1398 = _1154 * _1384;
    int _1400 = _1398 + _1382;
    int _1402 = abs(_1206);
    int _1404 = _1304 * _1386;
    int _1406 = _1404 + _1394;
    int _1408 = abs(_1218);
    int _1410 = _1400 * _1402;
    float _1412 = trunc(_1362);
    int _1414 = int(_1412);
    int _1416 = ~_909;
    int _1418 = _1416 + 1;
    int _1420 = _1406 * _1396;
    int _1422 = abs(_1244);
    int _1424 = _1370 * _1408;
    int _1426 = _1424 + _1410;
    int _1428 = abs(_1252);
    int _1430 = int(_1172) + int(_1392);
    int _1432 = _1326 * _1422;
    int _1434 = _1432 + _1426;
    int _1436 = abs(_1346);
    int _1438 = _1418 * _1430;
    int _1440 = _1438 + _1064;
    float _1442 = -_217;
    int _1444 = _1066 ? as_type<int>(_1442) : as_type<int>(_217);
    int _1446 = _1280 * _1428;
    int _1448 = _1446 + _1434;
    bool _1450 = !_1276;
    int _1452 = _1450 ? 0 : 1;
    int _1454 = _1414 * _1436;
    int _1456 = _1454 + _1420;
    bool _1458 = uint(_1440) >= uint(_909);
    float _1460 = float(uint(_1448));
    float _1462 = float(_909);
    float _1464 = -_231;
    int _1466 = _1072 ? as_type<int>(_1464) : as_type<int>(_231);
    float _1468 = float(_1064);
    float _1470 = _1462 * _1342;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1474 = _1472 != 0;
    float _1476 = _1256 * _1462;
    int _1478 = abs(_1452);
    float _1480 = as_type<float>(_883) * _1460;
    bool _1482 = _1468 >= _1462;
    bool _1484 = isnan(_1468);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1462);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = trunc(_1470);
    int _1496 = int(_1494);
    bool _1498 = !_1474;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = _1340 * _1478;
    int _1504 = _1502 + _1456;
    bool _1506 = !_1096;
    float _1508 = _1506 ? _217 : as_type<float>(_1444);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1512 = _1510 != 0;
    int _1514 = abs(_1500);
    float _1516 = trunc(_1480);
    float _1518 = precise::max(_1516, 0.0);
    uint _1520 = uint(_1518);
    bool _1522 = !_1458;
    int _1524 = _1522 ? 0 : (-1);
    bool _1526 = !_1512;
    int _1528 = _1526 ? 0 : 1;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1544 = _1542 != 0;
    int _1546 = ~_1430;
    int _1548 = _1546 + _1524;
    int _1550 = _1548 + 1;
    float _1552 = trunc(_1492);
    int _1554 = int(_1552);
    bool _1556 = !_1536;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1562 = _1560 != 0;
    int _1564 = _1248 * _1514;
    int _1566 = _1564 + _1504;
    int _1568 = ~_825;
    int _1570 = _1568 + 1;
    int _1572 = _909 * _1550;
    int _1574 = _1572 + _1064;
    bool _1576 = !_1532;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = trunc(_1476);
    int _1582 = int(_1580);
    float _1584 = float(uint(_1566));
    int _1586 = _1570 * int(_1520);
    int _1588 = _1586 + _1448;
    bool _1590 = _909 == 0;
    int _1592 = abs(_1558);
    float _1594 = as_type<float>(_911) * _1584;
    float _1596 = float(uint(_1588));
    float _1598 = _1584;
    float _1600 = as_type<float>(_1520);
    float _1602 = _1354;
    float _1604 = as_type<float>(_1002);
    if (_1562)
    {
        float _1606 = in.m_66.w;
        _1598 = _1606;
    }
    float _1608 = _1598;
    int _1610 = ~_1554;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    float _1616 = trunc(_1594);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    bool _1622 = !_1590;
    int _1624 = _1622 ? _1574 : (-1);
    float _1626 = as_type<float>(_883) * _1596;
    int _1628 = abs(_1528);
    int _1630 = abs(_1578);
    int _1632 = _1624 * _1614;
    int _1634 = _909 + (-1);
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = _1582 * _1628;
    int _1644 = _1642 + _1064;
    bool _1646 = !_1540;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1554 * _1634;
    int _1652 = _1650 + _1632;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1656 = _1654 != 0;
    int _1658 = _1652 * _1592;
    int _1660 = ~_853;
    int _1662 = _1660 + 1;
    int _1664 = ~_825;
    int _1666 = _1664 + 1;
    int _1668 = _1496 * _1630;
    int _1670 = _1668 + _1658;
    int _1672 = abs(_1648);
    int _1674 = _1662 * int(_1620);
    int _1676 = _1674 + _1566;
    float _1678 = as_type<float>(_1658);
    if (_1562)
    {
        float _1680 = _1608 * 3.1415927410125732421875;
        _1678 = _1680;
    }
    float _1682 = _1678;
    int _1684 = int(_1520) + int(_1640);
    int _1686 = _1644 * _1672;
    int _1688 = _1686 + _1670;
    float _1690 = float(uint(_1676));
    if (_1562)
    {
        float _1692 = _1682 * 0.15915493667125701904296875;
        _1600 = _1692;
    }
    float _1694 = _1600;
    bool _1696 = !_1544;
    int _1698 = _1696 ? 0 : 1;
    int _1700 = _1666 * _1684;
    int _1702 = _1700 + _1448;
    float _1704 = _1608;
    if (_1656)
    {
        float _1706 = in.m_66.x;
        _1704 = _1706;
    }
    float _1708 = _1704;
    float _1710 = as_type<float>(_911) * _1690;
    int _1712 = abs(_1698);
    float _1714 = _1694;
    if (_1562)
    {
        float _1716 = _1694 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        _1714 = _1718;
    }
    float _1720 = _1714;
    bool _1722 = uint(_1702) >= uint(_825);
    bool _1724 = !_1722;
    int _1726 = _1724 ? 0 : (-1);
    float _1728 = float(uint(_1326));
    float _1730 = trunc(_1710);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1738 = _1736 != 0;
    int _1740 = _1582 * _1712;
    int _1742 = _1740 + _1688;
    int _1744 = ~_1684;
    int _1746 = _1744 + _1726;
    int _1748 = _1746 + 1;
    float _1750 = as_type<float>(_883) * _1728;
    bool _1752 = !_1738;
    float _1754 = _1752 ? _231 : as_type<float>(_1466);
    float _1756 = float(uint(_1742));
    int _1758 = _825 * _1748;
    int _1760 = _1758 + _1448;
    bool _1762 = _825 == 0;
    float _1764 = trunc(_1750);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    bool _1770 = _1738;
    float _1772 = _1756;
    if (_1562)
    {
        bool _1774 = _1720 > 0.5;
        _1770 = _1774;
    }
    bool _1776 = _1770;
    bool _1778 = !_1762;
    int _1780 = _1778 ? _1760 : (-1);
    float _1782 = 0.0;
    if (!_1562)
    {
        _1782 = _231;
    }
    float _1784 = _1782;
    int _1786 = int(_1620) + int(_1734);
    float _1788 = as_type<float>(_1030) * _1756;
    int _1790 = ~_825;
    int _1792 = _1790 + 1;
    float _1794 = _1784;
    if (_1656)
    {
        float _1796 = _1708 * 3.1415927410125732421875;
        _1772 = _1796;
    }
    float _1798 = _1772;
    float _1800 = _1798;
    if (_1562)
    {
        float _1802 = -_231;
        float _1804 = _1776 ? _1802 : _231;
        _1794 = _1804;
    }
    float _1806 = _1794;
    float _1808 = trunc(_1788);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    int _1814 = _1780 & 3;
    bool _1816 = _1814 != 0;
    if (_1656)
    {
        float _1818 = _1798 * 0.15915493667125701904296875;
        _1800 = _1818;
    }
    float _1820 = _1800;
    int _1822 = _1780 & 3;
    bool _1824 = _1822 != 0;
    int _1826 = _1816 ? 0 : 1;
    float _1828 = _1820;
    if (_1656)
    {
        float _1830 = _1820 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        _1828 = _1832;
    }
    float _1834 = _1828;
    bool _1836 = uint(_1822) > 1u;
    int _1838 = _1792 * int(_1768);
    int _1840 = _1838 + _1326;
    float _1842 = float(uint(_1340));
    int _1844 = ~_909;
    int _1846 = _1844 + 1;
    int _1848 = ~_853;
    int _1850 = _1848 + 1;
    float _1852 = as_type<float>(_911) * _1842;
    float _1854 = float(uint(_1840));
    int _1856 = _1846 * int(_1812);
    int _1858 = _1856 + _1742;
    int _1860 = ~_1826;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = ~_853;
    int _1868 = _1866 + 1;
    float _1870 = as_type<float>(_883) * _1854;
    int _1872 = _1864;
    if (!_1836)
    {
        int _1874 = ~_1826;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    int _1880 = _1850 * _1786;
    int _1882 = _1880 + _1566;
    float _1884 = -_217;
    int _1886 = _1348 ? as_type<int>(_1884) : as_type<int>(_217);
    float _1888 = trunc(_1852);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = float(uint(_1858));
    bool _1896 = uint(_1822) >= 2u;
    bool _1898 = uint(_1882) >= uint(_853);
    float _1900 = as_type<float>(_1030) * _1894;
    int _1902 = _1896 ? 0 : 1;
    float _1904 = trunc(_1870);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    bool _1910 = _1822 != 3;
    bool _1912 = !_1898;
    int _1914 = _1912 ? 0 : (-1);
    bool _1916 = _1910;
    if (!_1656)
    {
        _1602 = _217;
    }
    float _1918 = _1602;
    int _1920 = ~_1786;
    int _1922 = _1920 + _1914;
    int _1924 = _1922 + 1;
    float _1926 = trunc(_1900);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = _1868 * int(_1892);
    int _1934 = _1932 + _1340;
    int _1936 = ~_1902;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = _853 * _1924;
    int _1944 = _1942 + _1566;
    int _1946 = _1940;
    float _1948 = _1918;
    float _1950 = 2.8025969286496341418474591665798e-45;
    if (_1910)
    {
        int _1952 = ~_1902;
        int _1954 = _1952 + 1;
        _1946 = _1954;
    }
    int _1956 = _1946;
    if (_1656)
    {
        bool _1958 = _1834 > 0.5;
        _1916 = _1958;
    }
    bool _1960 = _1916;
    bool _1962 = !_1352;
    int _1964 = _1962 ? _1944 : (-1);
    float _1966 = float(uint(_1934));
    int _1968 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1970 = _1968 != 0;
    if (_1656)
    {
        float _1972 = -_217;
        float _1974 = _1960 ? _1972 : _217;
        _1948 = _1974;
    }
    float _1976 = _1948;
    float _1978 = as_type<float>(_911) * _1966;
    int _1980 = _1964 & 3;
    bool _1982 = _1980 != 0;
    int _1984 = int(_1812) + int(_1930);
    bool _1986 = !_1970;
    float _1988 = _1986 ? _217 : as_type<float>(_1886);
    float _1990 = trunc(_1978);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    int _1996 = int(_1768) + int(_1908);
    bool _1998 = uint(_1980) > 1u;
    int _2000 = ~_909;
    int _2002 = _2000 + 1;
    int _2004 = _1964 & 3;
    bool _2006 = _2004 != 0;
    int _2008 = ~_825;
    int _2010 = _2008 + 1;
    int _2012 = _2002 * _1984;
    int _2014 = _2012 + _1742;
    int _2016 = _2006 ? 0 : 1;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2020 = _2018 != 0;
    int _2022 = _2010 * _1996;
    int _2024 = _2022 + _1326;
    float _2026 = float(uint(_1644));
    bool _2028 = !_2020;
    int _2030 = _2028 ? 0 : 1;
    bool _2032 = uint(_2014) >= uint(_909);
    float _2034 = as_type<float>(_1030) * _2026;
    int _2036 = ~_2016;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2040;
    if (!_1998)
    {
        int _2044 = ~_2016;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = trunc(_2034);
    float _2052 = precise::max(_2050, 0.0);
    uint _2054 = uint(_2052);
    bool _2056 = uint(_2024) >= uint(_825);
    bool _2058 = !_2032;
    int _2060 = _2058 ? 0 : (-1);
    bool _2062 = _1980 != 3;
    bool _2064 = !_2056;
    int _2066 = _2064 ? 0 : (-1);
    bool _2068 = uint(_1980) >= 2u;
    int _2070 = ~_1984;
    int _2072 = _2070 + _2060;
    int _2074 = _2072 + 1;
    int _2076 = ~_853;
    int _2078 = _2076 + 1;
    int _2080 = int(_1892) + int(_1994);
    int _2082 = _909 * _2074;
    int _2084 = _2082 + _1742;
    int _2086 = ~_909;
    int _2088 = _2086 + 1;
    int _2090 = _2068 ? 0 : 1;
    int _2092 = _2078 * _2080;
    int _2094 = _2092 + _1340;
    int _2096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2098 = _2096 != 0;
    int _2100 = ~_2090;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = _2104;
    float _2108 = as_type<float>(_2088);
    if (_2062)
    {
        int _2110 = ~_2090;
        int _2112 = _2110 + 1;
        _2106 = _2112;
    }
    int _2114 = _2106;
    int _2116 = _2088 * int(_2054);
    int _2118 = _2116 + _1644;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2122 = _2120 != 0;
    bool _2124 = !_2098;
    int _2126 = _2124 ? 0 : 1;
    bool _2128 = uint(_2094) >= uint(_853);
    bool _2130 = !_1590;
    int _2132 = _2130 ? _2084 : (-1);
    bool _2134 = !_2122;
    int _2136 = _2134 ? 0 : 1;
    bool _2138 = !_2128;
    int _2140 = _2138 ? 0 : (-1);
    int _2142 = _2132 & 3;
    bool _2144 = _2142 != 0;
    int _2146 = _2132 & 3;
    bool _2148 = _2146 != 0;
    float _2150 = float(uint(_2118));
    int _2152 = _2144 ? 0 : 1;
    bool _2154 = uint(_2146) > 1u;
    float _2156 = as_type<float>(_1030) * _2150;
    int _2158 = ~_2152;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = trunc(_2156);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2176 = _2162;
    if (!_2154)
    {
        int _2178 = ~_2152;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    bool _2184 = uint(_2146) >= 2u;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2188 = ~_909;
    int _2190 = _2188 + 1;
    int _2192 = _2184 ? 0 : 1;
    bool _2194 = _2146 != 3;
    int _2196 = int(_2054) + int(_2168);
    int _2198 = ~_2192;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2190 * _2196;
    int _2206 = _2204 + _1644;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2210 = _2202;
    if (_2194)
    {
        int _2212 = ~_2192;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    bool _2218 = uint(_2206) >= uint(_909);
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2222 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2208);
    bool _2224 = !_2218;
    int _2226 = _2224 ? 0 : (-1);
    bool _2228 = _986 > 0.5;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2234 = -_231;
    int _2236 = _2228 ? as_type<int>(_2234) : as_type<int>(_231);
    bool _2238 = _996 != 1;
    float _2240 = 1.0 / _2232;
    float _2242 = in.m_46.x;
    float _2244 = in.m_46.y;
    float _2246 = in.m_46.z;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2252 = abs(_2048);
    int _2254 = abs(_2114);
    float _2256 = 1.0 / _2250;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2262 = ~_1996;
    int _2264 = _2262 + _2066;
    int _2266 = _2264 + 1;
    float _2268 = 0.0;
    int _2270 = _2252;
    if (!_2238)
    {
        _2268 = _994;
    }
    float _2272 = _2268;
    float _2274 = _2272;
    if (_2238)
    {
        _2274 = _986;
    }
    float _2276 = _2274;
    int _2278 = _825 * _2266;
    int _2280 = _2278 + _1326;
    float _2282 = 0.0;
    if (!_2238)
    {
        _2282 = _994;
    }
    float _2284 = _2282;
    float _2286 = 1.0 / _2260;
    float _2288 = _2284;
    if (!_2238)
    {
        _2108 = _1008;
    }
    float _2290 = _2108;
    float _2292 = 0.0;
    float _2294 = _2290;
    if (!_2238)
    {
        _2292 = _1008;
    }
    float _2296 = _2292;
    float _2298 = _2296;
    if (_2238)
    {
        _2288 = _986;
    }
    float _2300 = _2288;
    if (_2238)
    {
        _2294 = _994;
    }
    float _2302 = _2294;
    float _2304 = _189 * _2244;
    float _2306 = _195 * _2244;
    float _2308 = _201 * _2244;
    float _2310 = _986 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2312 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2172);
    float _2314 = _994 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2316 = -_2170;
    float _2318 = fma(_2310, 2.0, _2316);
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2322 = fma(_2314, -2.0, _2174);
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2326 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2320);
    float _2328 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_2238)
    {
        _2298 = _994;
    }
    float _2330 = _2298;
    float _2332 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2334 = _1002 != 2;
    float _2336 = fma(_2328, -2.0, _2324);
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2340 = _998 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2342 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2338);
    float _2344 = _1222 * _127;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2348 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2352 = -_2346;
    float _2354 = fma(_2332, 2.0, _2352);
    float _2356 = exp2(_2344);
    if (_2334)
    {
        _1604 = _986;
    }
    float _2358 = _1604;
    float _2360 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2350);
    float _2362 = _2358;
    if (_2334)
    {
        _1950 = _994;
    }
    float _2364 = _1950;
    float _2366 = -_127;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2354);
    float _2370 = _2364;
    if (!_2334)
    {
        _2362 = _1008;
    }
    float _2372 = _2362;
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2312);
    if (!_2334)
    {
        _2370 = _986;
    }
    float _2376 = _2370;
    float _2378 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2326);
    float _2380 = _2372 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2382 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2384 = _2382 != 0;
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2390 = -_2186;
    float _2392 = fma(_2380, 2.0, _2390);
    bool _2394 = !_2384;
    float _2396 = _2394 ? _231 : as_type<float>(_2236);
    float _2398 = -_2356;
    float _2400 = _2398 + 1.0;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2404 = fma(_2348, -2.0, _2388);
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2410 = -_2402;
    float _2412 = fma(_2340, 2.0, _2410);
    float _2414 = fma(_2386, -2.0, _2220);
    bool _2416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2418 = isnan(0.0);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2424 = _2420 || _2422;
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2428 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2432 = _2424 ? _2400 : 0.0;
    float _2434 = 1.0 / _2428;
    bool _2436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2438 = isnan(1.0);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2444 = _2440 || _2442;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2450 = 1.0 + _2448;
    float _2452 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2430);
    float _2454 = -_127;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2412);
    float _2458 = -_127;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2318);
    float _2462 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2452);
    float _2464 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2446);
    float _2466 = _986 * 2.0;
    float _2468 = 1.0 / _2450;
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2222);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2474 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2464);
    float _2476 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2322);
    float _2478 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2336);
    float _2480 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2472);
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2342);
    float _2484 = floor(_2466);
    float _2486 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2360);
    float _2488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2480);
    float _2490 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2404);
    float _2492 = -_127;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2392);
    float _2496 = fma(_193, _2242, _2306);
    float _2498 = fma(_199, _2242, _2308);
    float _2500 = 1.0 / _2408;
    float _2502 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2414);
    if (_2444)
    {
        float _2504 = _2432 * _2468;
        _137 = _2504;
    }
    float _2506 = _137;
    float _2508 = _994 * 2.0;
    float _2510 = fma(_187, _2242, _2304);
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2516 = fma(_203, _2246, _2498);
    float _2518 = fma(_197, _2246, _2496);
    bool _2520 = _2484 >= 0.0;
    bool _2522 = isnan(_2484);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(0.0);
    bool _2528 = _2524 || _2526;
    float _2530 = floor(_2508);
    float _2532 = fma(_191, _2246, _2510);
    float _2534 = _1008 * 2.0;
    int _2536 = _2528 ? 0 : 1;
    float _2538 = -_2462;
    float _2540 = _2538 + 1.0;
    bool _2542 = _2484 > 0.0;
    float _2544 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2544;
    float _2548 = 1.0 / _2514;
    int _2550 = ~_2536;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    float _2556 = -_2486;
    float _2558 = _2556 + 1.0;
    float _2560 = _2546 * _2240;
    float _2562 = -_2474;
    float _2564 = _2562 + 1.0;
    bool _2566 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2568 = isnan(_807);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2574 = _2570 || _2572;
    float _2576 = float(_2574);
    float _2578 = -_2488;
    float _2580 = _2578 + 1.0;
    bool _2582 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2584 = isnan(_807);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2594;
    int _2598 = _2554;
    if (!_2542)
    {
        int _2600 = ~_2536;
        int _2602 = _2600 + 1;
        _2598 = _2602;
    }
    int _2604 = _2598;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2608 = _2606 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2610 = _2530 >= 0.0;
    bool _2612 = isnan(_2530);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan(0.0);
    bool _2618 = _2614 || _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2622 = _2620 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2624 = _2608 * _2548;
    int _2626 = _2618 ? 0 : 1;
    float _2628 = _2622 * _2434;
    bool _2630 = _2530 > 0.0;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2632;
    float _2636 = floor(_2534);
    int _2638 = ~_2080;
    int _2640 = _2638 + _2140;
    int _2642 = _2640 + 1;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2648 = _2596 * _2500;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2652 = _807 + _2650;
    int _2654 = _853 * _2642;
    int _2656 = _2654 + _1340;
    int _2658 = ~_2626;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    float _2664 = 1.0 / _2646;
    bool _2666 = !_1824;
    int _2668 = _2666 ? 0 : 1;
    float _2670 = fma(_2560, _2652, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2672 = _2662;
    if (!_2630)
    {
        int _2674 = ~_2626;
        int _2676 = _2674 + 1;
        _2672 = _2676;
    }
    int _2678 = _2672;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2684 = !_1352;
    int _2686 = _2684 ? _2656 : (-1);
    float _2688 = -_2576;
    float _2690 = _2688 + 1.0;
    int _2692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2694 = _2692 != 0;
    int _2696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2698 = _2696 != 0;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2702 = _2700 != 0;
    float _2704 = _2682 * _2256;
    bool _2706 = _2636 >= 0.0;
    bool _2708 = isnan(_2636);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan(0.0);
    bool _2714 = _2710 || _2712;
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2718 = _807 + _2716;
    bool _2720 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2722 = isnan(_807);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2732;
    bool _2736 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2738 = isnan(_807);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2744 = _2740 || _2742;
    float _2746 = float(_2744);
    float _2748 = fma(_2624, _2718, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2750 = _2714 ? 0 : 1;
    float _2752 = _2634 * _2664;
    bool _2754 = _2636 > 0.0;
    float _2756 = _2730 * _2690;
    float _2758 = -_2730;
    float _2760 = _2758 + 1.0;
    bool _2762 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2764 = isnan(_807);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2770 = _2766 || _2768;
    float _2772 = float(_2770);
    float _2774 = -_2746;
    float _2776 = _2774 + 1.0;
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2780 = _807 + _2778;
    float _2782 = _2746 * _2760;
    bool _2784 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2786 = isnan(_807);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = _2772 * _2776;
    float _2798 = fma(_2648, _2780, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2802 = _807 + _2800;
    float _2804 = in.m_62.w;
    float _2806 = -_2772;
    float _2808 = _2806 + 1.0;
    bool _2810 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2812 = isnan(_807);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2818 = _2814 || _2816;
    float _2820 = float(_2818);
    float _2822 = fma(_2628, _2802, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2824 = -_2794;
    float _2826 = _2824 + 1.0;
    int _2828 = _1964 >> 31;
    float _2830 = _2794 * _2808;
    float _2832 = -_2820;
    float _2834 = _2832 + 1.0;
    float _2836 = in.m_64.w;
    float _2838 = _2820 * _2826;
    float _2840 = _2734 * _2286;
    bool _2842 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2844 = isnan(_807);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2856 = _807 + _2854;
    int _2858 = _2828 & 3;
    float _2860 = -_2592;
    float _2862 = _2860 + 1.0;
    float _2864 = _2592 * _2834;
    float _2866 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2868 = _807 + _2866;
    float _2870 = fma(_2840, _2856, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2872 = _1964 + _2858;
    float _2874 = _2852 * _2862;
    float _2876 = fma(_2704, _2868, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2878 = -_2852;
    float _2880 = _2878 + 1.0;
    int _2882 = _2872 >> 2;
    float _2884 = _2670 * _2874;
    float _2886 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2888 = _807 + _2886;
    float _2890 = _994 + _986;
    int _2892 = _2882 << 4;
    int _2894 = _2892 + 656;
    float _2896 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2884);
    float _2898 = fma(_2752, _2888, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2900 = _2518 + _2804;
    float _2902 = _2532 + _1038;
    float _2904 = fma(_2748, _2864, _2896);
    uint _2906 = uint(int(uint(_2894) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    float _2922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2924 = _2900 + _2922;
    float _2926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2928 = _2902 + _2926;
    int _2930 = ~_2750;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = _2516 + _2836;
    float _2938 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2940 = _2934;
    float _2942 = _2782;
    if (!_2754)
    {
        int _2944 = ~_2750;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = fma(_2798, _2838, _2904);
    bool _2952 = !_1982;
    int _2954 = _2952 ? 0 : 1;
    float _2956 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2938);
    bool _2958 = _1980 != 3;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2962 = _2936 + _2960;
    float _2964 = _986 + _1008;
    float _2966 = _986 + (-0.5);
    bool _2968 = !_2958;
    int _2970 = _2968 ? 0 : (-1);
    float _2972 = fma(_2962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2956);
    float _2974 = fma(_2822, _2830, _2950);
    int _2976 = _2894 + 8;
    uint _2978 = uint(int(uint(_2976) >> uint(2)));
    uint _2980 = uint(int(uint(int(_2978)) >> uint(2)));
    int _2982 = int(_2978) & 3;
    float _2984 = (*spvDescriptorSet0.vp_c9)._m0[int(_2980)][_2982];
    int _2986 = int(_2978) + 1;
    uint _2988 = uint(int(uint(_2986) >> uint(2)));
    int _2990 = _2986 & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    float _2994 = _2890 + (-1.0);
    bool _2996 = _2972 >= 0.0;
    float _2998 = _1806 + 0.5;
    float _3000 = fma(_2870, _2796, _2974);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3004 = _994 + _1008;
    float _3006 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2456);
    float _3008 = _994 + (-0.5);
    float _3010 = _2396 + 0.5;
    float _3012 = _1976 + (-0.5);
    float _3014 = fma(_2876, _2782, _3000);
    float _3016 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2460);
    float _3018 = -_3012;
    float _3020 = -_2478;
    float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3020);
    int _3024 = ~_2252;
    int _3026 = _3024 + 1;
    int _3028 = _3026 + 1;
    float _3030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2996)
    {
        _2942 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3032 = _2942;
    float _3034 = fma(_2898, _2756, _3014);
    int _3036 = abs(_2954);
    float _3038 = -_2374;
    float _3040 = _3038 + 1.0;
    if (_2996)
    {
        float _3042 = _3032 * 5.0;
        _2270 = as_type<int>(_3042);
    }
    int _3044 = _2270;
    bool _3046 = !_2694;
    int _3048 = _3046 ? 0 : 1;
    float _3050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3052 = -_3040;
    float _3054 = fma(_3052, _1806, _3006);
    float _3056 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_2996)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9482 = as_type<float>(_3044);
        out.gl_Position.z = _9482;
    }
    int _3058 = abs(_3048);
    float _3060 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3034);
    int _3062 = _3028 * as_type<int>(_2920);
    float _3064 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3066 = int(_3064);
    float _3068 = -_2378;
    float _3070 = _3068 + 1.0;
    float _3072 = _3030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3074 = ~_3036;
    int _3076 = _3074 + 1;
    int _3078 = _3076 + 1;
    float _3080 = _1988 + (-0.5);
    float _3082 = fma(_3070, _1976, _3022);
    int _3084 = ~_2196;
    int _3086 = _3084 + _2226;
    int _3088 = _3086 + 1;
    float _3090 = _1754 + 0.5;
    int _3092 = _3078 * as_type<int>(_2912);
    int _3094 = _3092 + _3062;
    float _3096 = _2924 * _2924;
    float _3098 = fma(_3072, _3090, _2368);
    int _3100 = ~_2254;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    out.m_74.x = _3054;
    out.m_74.y = _3082;
    int _3106 = abs(_2970);
    float _3108 = _3050 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3110 = abs(_3066);
    int _3112 = _3104 * as_type<int>(_2984);
    int _3114 = _3112 + _3094;
    float _3116 = float(uint(_3066));
    float _3118 = -_3080;
    float _3120 = -_2476;
    float _3122 = fma(_3118, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3120);
    int _3124 = abs(_2126);
    int _3126 = _909 * _3088;
    int _3128 = _3126 + _1644;
    int _3130 = ~_3106;
    int _3132 = _3130 + 1;
    int _3134 = _3132 + 1;
    float _3136 = fma(_2928, _2928, _3096);
    float _3138 = 1.0 / _3116;
    int _3140 = ~_3124;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    float _3146 = _1508 + (-0.5);
    float _3148 = fma(_2962, _2962, _3136);
    int _3150 = _3134 * as_type<int>(_2992);
    int _3152 = _3150 + _3114;
    int _3154 = _2132 >> 31;
    float _3156 = -_3108;
    float _3158 = -_2490;
    float _3160 = fma(_3156, _3146, _3158);
    float _3162 = float(uint(_3110));
    float _3164 = rsqrt(_3148);
    int _3166 = _3152 * _3144;
    int _3168 = _1780 >> 31;
    out.m_76.x = _3060;
    int _3170 = _3154 & 3;
    int _3172 = _2686 * _3124;
    int _3174 = _3172 + _3166;
    int _3176 = _3168 & 3;
    if (_2996)
    {
        out.m_53.x = 0.0;
    }
    float _3178 = 1.0 / _3162;
    int _3180 = as_type<int>(_3138) + (-2);
    float _3182 = float(uint(_3174));
    int _3184 = _1780 + _3176;
    float _3186 = _3056 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3188 = _2132 + _3170;
    float _3190 = as_type<float>(_3180) * _3182;
    float _3192 = float(_2948);
    float _3194 = _3186 * _3164;
    int _3196 = _3184 >> 2;
    float _3198 = in.m_78.x;
    float _3200 = in.m_78.y;
    float _3202 = in.m_78.z;
    int _3204 = abs(_3174);
    float _3206 = _2924 * _3194;
    float _3208 = trunc(_3190);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    float _3214 = _2928 * _3194;
    int _3216 = as_type<int>(_3178) + (-2);
    float _3218 = -_3206;
    float _3220 = _2924 + _3218;
    int _3222 = _3196 << 4;
    int _3224 = _3222 + 368;
    float _3226 = -_3214;
    float _3228 = _2928 + _3226;
    int _3230 = _3188 >> 2;
    float _3232 = _3220 * _3220;
    uint _3234 = uint(int(uint(_3224) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    float _3250 = float(uint(_3204));
    float _3252 = fma(_3228, _3228, _3232);
    int _3254 = ~_3066;
    int _3256 = _3254 + 1;
    float _3258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3260 = _3230 << 4;
    int _3262 = _3260 + 800;
    float _3264 = as_type<float>(_3216) * _3250;
    float _3266 = float(_3058);
    int _3268 = _3256 * int(_3212);
    int _3270 = _3268 + _3174;
    uint _3272 = uint(int(uint(_3262) >> uint(2)));
    uint _3274 = uint(int(uint(int(_3272)) >> uint(2)));
    int _3276 = int(_3272) & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = int(_3272) + 1;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    int _3284 = _3280 & 3;
    float _3286 = (*spvDescriptorSet0.vp_c9)._m0[int(_3282)][_3284];
    int _3288 = abs(_2668);
    float _3290 = _3266 * _3192;
    float _3292 = -_2470;
    float _3294 = _3292 + 1.0;
    float _3296 = float(uint(_3270));
    float _3298 = trunc(_3264);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    float _3304 = -_2482;
    float _3306 = _3304 + 1.0;
    float _3308 = fma(_1988, _3294, _3122);
    float _3310 = _2962 * _3194;
    float _3312 = as_type<float>(_3180) * _3296;
    float _3314 = -_2540;
    float _3316 = fma(_2396, _3314, _3016);
    float _3318 = -_3306;
    float _3320 = fma(_1754, _3318, _3098);
    float _3322 = fma(_1508, _2558, _3160);
    float _3324 = _3290 * (-2.0);
    int _3326 = ~_3110;
    int _3328 = _3326 + 1;
    float _3330 = trunc(_3312);
    float _3332 = precise::max(_3330, 0.0);
    uint _3334 = uint(_3332);
    int _3336 = abs(_2030);
    float _3338 = fma(_3324, _3198, _3198);
    out.m_80.x = _3316;
    out.m_80.y = _3308;
    out.m_80.z = _3320;
    out.m_80.w = _3322;
    int _3340 = abs(_2136);
    float _3342 = -_3310;
    float _3344 = _2962 + _3342;
    int _3346 = _3328 * int(_3302);
    int _3348 = _3346 + _3204;
    float _3350 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3338);
    bool _3352 = _825 == 0;
    int _3354 = _3224 + 8;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    uint _3358 = uint(int(uint(int(_3356)) >> uint(2)));
    int _3360 = int(_3356) & 3;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[int(_3358)][_3360];
    int _3364 = int(_3356) + 1;
    uint _3366 = uint(int(uint(_3364) >> uint(2)));
    int _3368 = _3364 & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    float _3372 = float(_2604);
    float _3374 = fma(_3002, _3324, _3002);
    bool _3376 = !_3352;
    int _3378 = _3376 ? _2280 : (-1);
    float _3380 = fma(_3344, _3344, _3252);
    float _3382 = fma(_3374, _2506, _3350);
    int _3384 = int(_3212) + int(_3334);
    int _3386 = _3262 + 8;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    float _3404 = float(uint(_3348));
    int _3406 = abs(_1878);
    int _3408 = abs(_2182);
    float _3410 = as_type<float>(_3216) * _3404;
    int _3412 = ~_3066;
    int _3414 = _3412 + 1;
    int _3416 = ~_3406;
    int _3418 = _3416 + 1;
    int _3420 = _3418 + 1;
    float _3422 = trunc(_3410);
    float _3424 = precise::max(_3422, 0.0);
    uint _3426 = uint(_3424);
    bool _3428 = !_2148;
    int _3430 = _3428 ? 0 : 1;
    int _3432 = _3414 * _3384;
    int _3434 = _3432 + _3174;
    bool _3436 = _1822 != 3;
    int _3438 = _3420 * as_type<int>(_3248);
    int _3440 = ~_3408;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    bool _3446 = !_3436;
    int _3448 = _3446 ? 0 : (-1);
    bool _3450 = uint(_3434) >= uint(_3066);
    int _3452 = _3444 * as_type<int>(_3286);
    int _3454 = abs(_3430);
    int _3456 = ~_3110;
    int _3458 = _3456 + 1;
    int _3460 = int(_3302) + int(_3426);
    int _3462 = ~_3288;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    bool _3468 = !_3450;
    int _3470 = _3468 ? 0 : (-1);
    int _3472 = _3458 * _3460;
    int _3474 = _3472 + _3204;
    bool _3476 = _2146 != 3;
    int _3478 = _3466 * as_type<int>(_3240);
    int _3480 = _3478 + _3438;
    int _3482 = ~_3384;
    int _3484 = _3482 + _3470;
    int _3486 = _3484 + 1;
    int _3488 = ~_3454;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = abs(_2216);
    int _3496 = _3066 * _3486;
    int _3498 = _3496 + _3174;
    bool _3500 = !_3476;
    int _3502 = _3500 ? 0 : (-1);
    int _3504 = _3492 * as_type<int>(_3278);
    int _3506 = _3504 + _3452;
    int _3508 = abs(_1956);
    float _3510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3512 = uint(_3474) >= uint(_3110);
    int _3514 = ~_3494;
    int _3516 = _3514 + 1;
    int _3518 = _3516 + 1;
    int _3520 = _3174 ^ _3066;
    int _3522 = ~_3508;
    int _3524 = _3522 + 1;
    int _3526 = _3524 + 1;
    int _3528 = _3518 * as_type<int>(_3394);
    int _3530 = _3528 + _3506;
    bool _3532 = !_3512;
    int _3534 = _3532 ? 0 : (-1);
    int _3536 = abs(_3448);
    int _3538 = _3526 * as_type<int>(_3362);
    int _3540 = _3538 + _3480;
    uint _3542 = uint(int(uint(_3520) >> uint(31)));
    int _3544 = abs(_3502);
    int _3546 = ~_3534;
    int _3548 = _3460 + _3546;
    int _3550 = _3548 + 1;
    int _3552 = ~_3536;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    int _3558 = ~int(_3542);
    int _3560 = _3558 + 1;
    int _3562 = _3556 * as_type<int>(_3370);
    int _3564 = _3562 + _3540;
    int _3566 = ~_3544;
    int _3568 = _3566 + 1;
    int _3570 = _3568 + 1;
    bool _3572 = _3066 == 0;
    int _3574 = _3550 ^ _3560;
    int _3576 = _3570 * as_type<int>(_3402);
    int _3578 = _3576 + _3530;
    int _3580 = ~_3336;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    float _3586 = _3510 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3588 = ~_3340;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    bool _3594 = !_3572;
    int _3596 = _3594 ? _3498 : (-1);
    int _3598 = _3564 * _3584;
    bool _3600 = _3066 == 0;
    int _3602 = _3578 * _3592;
    int _3604 = ~_3560;
    int _3606 = _3604 + _3574;
    int _3608 = _3606 + 1;
    int _3610 = _3378 * _3336;
    int _3612 = _3610 + _3598;
    float _3614 = float(_3596);
    float _3616 = _1160 + (-0.5);
    bool _3618 = !_3600;
    int _3620 = _3618 ? _3608 : (-1);
    bool _3622 = !_2698;
    int _3624 = _3622 ? 0 : 1;
    float _3626 = fma(_3586, _3614, _2494);
    float _3628 = float(_3620);
    float _3630 = _3258 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3632 = !_1590;
    int _3634 = _3632 ? _3128 : (-1);
    int _3636 = abs(_3624);
    float _3638 = -_2502;
    float _3640 = fma(_3630, _3628, _3638);
    float _3642 = _1176 + 0.5;
    int _3644 = _3634 * _3340;
    int _3646 = _3644 + _3602;
    float _3648 = float(_3612);
    float _3650 = -_3630;
    float _3652 = fma(_3650, _3616, _3640);
    float _3654 = fma(_3586, _3642, _3626);
    float _3656 = float(_3646);
    float _3658 = -_2564;
    float _3660 = fma(_1176, _3658, _3654);
    float _3662 = fma(_1160, _2580, _3652);
    float _3664 = float(_3636);
    out.m_82.x = _3648;
    out.m_82.w = _3656;
    float _3666 = _3664 * _3372;
    bool _3668 = !_2702;
    int _3670 = _3668 ? 0 : 1;
    out.m_84.x = _3660;
    out.m_84.y = _3662;
    float _3672 = _3202;
    if (_2996)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3674 = -_3206;
    float _3676 = _2900 + _3674;
    float _3678 = -_3214;
    float _3680 = _2902 + _3678;
    float _3682 = -_3310;
    float _3684 = _2936 + _3682;
    int _3686 = abs(_3670);
    float _3688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3690 = _3676 + _3688;
    float _3692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3694 = _3680 + _3692;
    float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3698 = _3684 + _3696;
    float _3700 = _3004 + (-1.0);
    float _3702 = _3690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3704 = float(_2678);
    float _3706 = _2964 + (-1.0);
    float _3708 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3710 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3702);
    float _3712 = float(_3686);
    float _3714 = _3666 * (-2.0);
    float _3716 = _3382 * 0.15915493667125701904296875;
    float _3718 = fma(_3698, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3710);
    float _3720 = sqrt(_3380);
    float _3722 = fma(_3714, _3200, _3200);
    float _3724 = fma(_3708, _3714, _3708);
    float _3726 = _3712 * _3704;
    bool _3728 = _3718 >= 0.0;
    float _3730 = fma(_3008, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3722);
    float _3732 = _3726 * (-2.0);
    float _3734 = _3716 * 6.283185482025146484375;
    float _3736 = sin(_3734);
    float _3738 = fma(_3724, _2506, _3730);
    float _3740 = _1008 + (-0.5);
    float _3742 = fma(_3706, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3744 = fma(_3732, _3202, _3202);
    float _3746 = _3738 * 0.15915493667125701904296875;
    float _3748 = fma(_3742, _3732, _3742);
    float _3750 = _3716 * 6.283185482025146484375;
    float _3752 = cos(_3750);
    float _3754 = _3698;
    float _3756 = _3680;
    if (_3728)
    {
        _3672 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3758 = _3672;
    float _3760 = fma(_3740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3744);
    int _3762 = as_type<int>(_3758);
    if (_3728)
    {
        out.m_53.x = 0.0;
    }
    if (_3728)
    {
        float _3764 = _3758 * 5.0;
        _3762 = as_type<int>(_3764);
    }
    int _3766 = _3762;
    float _3768 = fma(_3748, _2506, _3760);
    float _3770 = _3746 * 6.283185482025146484375;
    float _3772 = sin(_3770);
    if (_3728)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10512 = as_type<float>(_3766);
        out.gl_Position.z = _10512;
    }
    float _3774 = _3768 * 0.15915493667125701904296875;
    float _3776 = _3746 * 6.283185482025146484375;
    float _3778 = cos(_3776);
    if (_3728)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3780 = _3774 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3786 = _3164 * _3720;
    float _3788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3790 = _3752 * _3778;
    float _3792 = _3736 * _3778;
    float _3794 = _3786 * _3784;
    float _3796 = _3056 * _3786;
    float _3798 = _3774 * 6.283185482025146484375;
    float _3800 = sin(_3798);
    float _3802 = _3752 * _3772;
    float _3804 = _3788 * _3794;
    float _3806 = _3736 * _3772;
    float _3808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _3810 = _3752 * _3782;
    float _3812 = _3736 * _3782;
    float _3814 = _3808 * _3796;
    float _3816 = _3778 * _3782;
    float _3818 = _3810 * _3804;
    float _3820 = _3772 * _3782;
    float _3822 = _3786 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3824 = _3822 * 0.5;
    float _3826 = fma(_3800, _3790, _3806);
    float _3828 = -_3792;
    float _3830 = fma(_3800, _3802, _3828);
    float _3832 = -_3804;
    float _3834 = _3800 * _3832;
    float _3836 = -_3802;
    float _3838 = fma(_3800, _3792, _3836);
    float _3840 = fma(_3826, _3814, _3818);
    float _3842 = _3812 * _3804;
    float _3844 = fma(_3816, _3814, _3834);
    float _3846 = fma(_3800, _3806, _3790);
    float _3848 = fma(_3830, _3824, _3840);
    float _3850 = fma(_3838, _3814, _3842);
    float _3852 = fma(_3820, _3824, _3844);
    float _3854 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3856 = fma(_3846, _3824, _3850);
    float _3858 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3860 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3862 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3854);
    float _3864 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3858);
    float _3866 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3860);
    float _3868 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3862);
    float _3870 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3864);
    float _3872 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3866);
    float _3874 = _3868 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3876 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3878 = _3676 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3880 = _2936 + _3874;
    float _3882 = _2902 + _3876;
    float _3884 = fma(_3680, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3878);
    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3888 = _3880 + _3886;
    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3892 = _3882 + _3890;
    float _3894 = fma(_3684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3884);
    float _3896 = _3888 * _3888;
    float _3898 = fma(_3892, _3892, _3896);
    float _3900 = _3872 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3902 = sqrt(_3898);
    float _3904 = _2900 + _3900;
    bool _3906 = _3902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3908 = _3884;
    float _3910 = _3872;
    float _3912 = _3900;
    if (!_3906)
    {
        _3908 = _3882;
    }
    float _3914 = _3908;
    float _3916 = _3914;
    if (!_3906)
    {
        _3910 = _3880;
    }
    float _3918 = _3910;
    float _3920 = _3918;
    if (!_3906)
    {
        _3912 = _3904;
    }
    float _3922 = _3912;
    bool _3924 = !_3906;
    float _3926 = _3922;
    if (!_3924)
    {
        float _3928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3932 = _3902 + _3930;
        float _3934 = _3904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3936 = rsqrt(_3898);
        float _3938 = _3932 * _3928;
        float _3940 = _3938 * 0.15915493667125701904296875;
        float _3942 = _3940 * 6.283185482025146484375;
        float _3944 = cos(_3942);
        float _3946 = _3940 * 6.283185482025146484375;
        float _3948 = sin(_3946);
        float _3950 = _3944 + (-1.0);
        float _3952 = fma(_3948, _3934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3956 = _3936 * _3952;
        float _3958 = fma(_3904, _3944, _3954);
        float _3960 = fma(_3892, _3956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3962 = fma(_3888, _3956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3926 = _3958;
        _3916 = _3960;
        _3920 = _3962;
    }
    float _3964 = _3926;
    float _3966 = _3916;
    float _3968 = _3920;
    float _3970 = -_2900;
    float _3972 = _3970 + _3964;
    float _3974 = -_2902;
    float _3976 = _3974 + _3966;
    float _3978 = -_2936;
    float _3980 = _3978 + _3968;
    float _3982 = _3894 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3984 = _3972 * _3972;
    float _3986 = _3676 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3988 = 1.0 / _3982;
    float _3990 = fma(_3976, _3976, _3984);
    bool _3992 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3994 = isnan(0.5);
    bool _3996 = _3992 || _3994;
    bool _3998 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4000 = _3996 || _3998;
    bool _4002 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4004 = isnan(0.5);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4010 = _4006 || _4008;
    float _4012 = fma(_3980, _3980, _3990);
    float _4014 = fma(_3680, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3986);
    float _4016 = sqrt(_4012);
    float _4018 = fma(_3684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4014);
    float _4020 = _4018 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4022 = _4020 + _3982;
    float _4024 = _4022 * _3988;
    float _4026 = _4024 * 0.5;
    bool _4028 = _4016 > 0.0;
    float _4030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4032 = fma(_4026, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4030);
    float _4034 = 1.0 / _4032;
    bool _4036 = !_4028;
    float _4038 = _3966;
    float _4040 = _3964;
    float _4042 = _3968;
    float _4044 = _3976;
    float _4046 = _3982;
    if (!_4036)
    {
        float _4048 = _237 * _237;
        float _4050 = rsqrt(_4012);
        float _4052 = fma(_235, _235, _4048);
        float _4054 = fma(_239, _239, _4052);
        float _4056 = sqrt(_4054);
        float _4058 = _3976 * _4050;
        float _4060 = _3972 * _4050;
        float _4062 = _3980 * _4050;
        bool _4064 = _4056 > 0.0;
        bool _4066 = !_4064;
        _4046 = _4056;
        if (!_4066)
        {
            float _4068 = rsqrt(_4054);
            float _4070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4072 = _237 * _4068;
            float _4074 = _235 * _4068;
            float _4076 = _4060 * _4072;
            float _4078 = _239 * _4068;
            float _4080 = fma(_4058, _4074, _4076);
            float _4082 = _4070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4084 = fma(_4062, _4078, _4080);
            float _4086 = _4084 * _4082;
            float _4088 = fma(_235, _4086, _3966);
            float _4090 = fma(_237, _4086, _3964);
            float _4092 = fma(_239, _4086, _3968);
            _4038 = _4088;
            _4040 = _4090;
            _4042 = _4092;
            _4044 = _4086;
            _4046 = _4078;
        }
    }
    float _4094 = _4038;
    float _4096 = _4040;
    float _4098 = _4042;
    float _4100 = _4044;
    float _4102 = _4046;
    float _4104 = -_3214;
    float _4106 = _4104 + _4094;
    float _4108 = -_3206;
    float _4110 = _4108 + _4096;
    float _4112 = -_3310;
    float _4114 = _4112 + _4098;
    float _4116 = _4102;
    float _4118 = _4110;
    float _4120 = _4106;
    float _4122 = _4114;
    float _4124 = _4100;
    if (_4010)
    {
        _4116 = 1.0;
    }
    float _4126 = _4116;
    float _4128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4130 = _4034 * _4128;
    float _4132 = _4126;
    if (!_4000)
    {
        float _4134 = _3690 * _3690;
        float _4136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4138 = -_2936;
        float _4140 = _4138 + _4098;
        float _4142 = -_2900;
        float _4144 = _4142 + _4096;
        float _4146 = fma(_3694, _3694, _4134);
        float _4148 = -_2902;
        float _4150 = _4148 + _4094;
        float _4152 = fma(_3698, _3698, _4146);
        float _4154 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4156 = sqrt(_4152);
        float _4158 = 1.0 / _3786;
        float _4160 = _4154 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4162 = precise::min(_4156, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4164 = _4162 * _4136;
        float _4166 = _4164 * _4158;
        float _4168 = _4160 * _4166;
        float _4170 = _4140 * _4166;
        float _4172 = fma(_4144, _4168, _3676);
        float _4174 = fma(_4150, _4168, _3680);
        float _4176 = fma(_4160, _4170, _3684);
        _4118 = _4172;
        _4120 = _4174;
        _4122 = _4176;
        _3754 = _4168;
    }
    float _4178 = _4118;
    float _4180 = _4120;
    float _4182 = _4122;
    float _4184 = _3754;
    float _4186 = _4184;
    if (!_4010)
    {
        float _4188 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4190 = _4188 * 0.15915493667125701904296875;
        float _4192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4194 = _4190 * 6.283185482025146484375;
        float _4196 = cos(_4194);
        float _4198 = _4192 * 0.15915493667125701904296875;
        float _4200 = _4190 * 6.283185482025146484375;
        float _4202 = sin(_4200);
        float _4204 = 1.0 / _4196;
        float _4206 = _4198 * 6.283185482025146484375;
        float _4208 = cos(_4206);
        float _4210 = _4202 * _4204;
        float _4212 = _4198 * 6.283185482025146484375;
        float _4214 = sin(_4212);
        float _4216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4218 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4216;
        float _4220 = _4208 * _4210;
        float _4222 = 1.0 / _4218;
        float _4224 = 1.0 / _4220;
        float _4226 = _4214 * _4224;
        float _4228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4230 = fma(_4130, _4226, _4228);
        float _4232 = _4230 * _4222;
        float _4234 = precise::clamp(_4232, 0.0, 1.0);
        _4186 = _4190;
        _4132 = _4234;
    }
    float _4236 = _4186;
    float _4238 = _4132;
    float _4240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4242 = _4178 + _4240;
    float _4244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4246 = _4180 + _4244;
    float _4248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4250 = _4182 + _4248;
    float _4252 = _4242 * _4242;
    float _4254 = fma(_4246, _4246, _4252);
    float _4256 = fma(_4250, _4250, _4254);
    float _4258 = rsqrt(_4256);
    float _4260 = sqrt(_4256);
    float _4262 = _4258 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4264 = _4246 * _4262;
    float _4266 = _4250 * _4262;
    float _4268 = _4264 * _4264;
    float _4270 = _4266 * _4266;
    float _4272 = _4268 + _4270;
    float _4274 = sqrt(_4272);
    bool _4276 = _4274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4280 = _4274 + _4278;
    float _4282 = _4250;
    float _4284 = _4272;
    float _4286 = _4280;
    float _4288 = _4236;
    if (_4276)
    {
        float _4290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4282 = _4290;
    }
    float _4292 = _4282;
    if (_4276)
    {
        float _4294 = rsqrt(_4272);
        _4284 = _4294;
    }
    float _4296 = _4284;
    float _4298 = _4296;
    if (_4276)
    {
        float _4300 = _4280 * _4292;
        _4286 = _4300;
    }
    float _4302 = _4286;
    if (_4276)
    {
        float _4304 = _4302 * 0.15915493667125701904296875;
        _4288 = _4304;
    }
    float _4306 = _4288;
    float _4308 = _4292;
    float _4310 = _4306;
    if (_4276)
    {
        float _4312 = _4306 * 6.283185482025146484375;
        float _4314 = sin(_4312);
        _4308 = _4314;
    }
    float _4316 = _4308;
    float _4318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4320 = precise::max(0.0, _4318);
    float _4322 = _4252;
    float _4324 = _4320;
    if (_4276)
    {
        float _4326 = _4306 * 6.283185482025146484375;
        float _4328 = cos(_4326);
        _4322 = _4328;
    }
    float _4330 = _4322;
    float _4332 = -_4262;
    float _4334 = -_4320;
    float _4336 = fma(_4242, _4332, _4334);
    float _4338 = _4336;
    if (_4276)
    {
        float _4340 = _4336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4324 = _4340;
    }
    float _4342 = _4324;
    float _4344 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4346 = _4342;
    if (!_4276)
    {
        _3756 = _4270;
    }
    float _4348 = _3756;
    float _4350 = _4316;
    float _4352 = _4348;
    if (_4276)
    {
        float _4354 = fma(_4316, _4342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4350 = _4354;
    }
    float _4356 = _4350;
    float _4358 = floor(_4344);
    float _4360 = _4356;
    if (_4276)
    {
        float _4362 = _4330 + (-1.0);
        _4346 = _4362;
    }
    float _4364 = _4346;
    float _4366 = _4364;
    if (_4276)
    {
        float _4368 = _4296 * _4356;
        _4124 = _4368;
    }
    float _4370 = _4124;
    if (!_4276)
    {
        _4360 = _4264;
    }
    float _4372 = _4360;
    float _4374 = _4372;
    if (_4276)
    {
        float _4376 = _4364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4310 = _4376;
    }
    float _4378 = _4310;
    if (_4276)
    {
        float _4380 = _4264 * _4370;
        _4374 = _4380;
    }
    float _4382 = _4374;
    if (!_4276)
    {
        _4366 = _4266;
    }
    float _4384 = _4366;
    float _4386 = _4384;
    if (_4276)
    {
        float _4388 = _4266 * _4370;
        _4386 = _4388;
    }
    float _4390 = _4386;
    if (!_4276)
    {
        _4298 = _4268;
    }
    float _4392 = _4298;
    float _4394 = _4392;
    if (_4276)
    {
        float _4396 = fma(_4336, _4330, _4378);
        _4338 = _4396;
    }
    float _4398 = _4338;
    if (_4276)
    {
        float _4400 = _4382 * _4382;
        _4394 = _4400;
    }
    float _4402 = _4394;
    if (_4276)
    {
        float _4404 = _4390 * _4390;
        _4352 = _4404;
    }
    float _4406 = _4352;
    float _4408 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4410 = fma(_4398, _4398, _4402);
    float _4412 = _4410 + _4406;
    float _4414 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4408);
    float _4416 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4418 = fma(_4260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4416);
    float _4420 = precise::clamp(_4418, 0.0, 1.0);
    float _4422 = rsqrt(_4412);
    float _4424 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4414);
    float _4426 = -_4420;
    float _4428 = _4426 + 1.0;
    float _4430 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4432 = _4424 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4434 = fma(_3684, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4436 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4438 = _4432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4440 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4442 = abs(_4428);
    float _4444 = log2(_4442);
    float _4446 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4436);
    float _4448 = -_4438;
    float _4450 = fma(_4448, _4430, 1.0);
    float _4452 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4454 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4440);
    float _4456 = _4422 * _4390;
    float _4458 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4446);
    float _4460 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4452);
    float _4462 = _4422 * _4382;
    float _4464 = _4422 * _4398;
    float _4466 = _4458 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4468 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4460);
    float _4470 = _4462 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4472 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4454);
    float _4474 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4476 = _4468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4478 = -_4470;
    float _4480 = fma(_4464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4478);
    float _4482 = floor(_4434);
    float _4484 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4486 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4474);
    float _4488 = -_4456;
    float _4490 = fma(_4488, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4480);
    float _4492 = _4472 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4494 = _4464 + 1.0;
    float _4496 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4486);
    float _4498 = fma(_4490, -0.5, 0.5);
    float _4500 = log2(_4450);
    float _4502 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4504 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4496);
    float _4506 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4502);
    float _4508 = 1.0 / _4504;
    float _4510 = -_4358;
    float _4512 = _4344 + _4510;
    float _4514 = fma(_4490, 0.5, 0.5);
    float _4516 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4518 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4506);
    float _4520 = -_4482;
    float _4522 = _4434 + _4520;
    float _4524 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4516);
    float _4526 = exp2(_4484);
    float _4528 = fma(_4514, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4530 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4518);
    float _4532 = sqrt(_4498);
    float _4534 = fma(_4514, _4528, -0.212114393711090087890625);
    float2 _11721 = float2(_4512, _4522);
    float _4536 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11721, float2(0.0), isnan(_11721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11721, float2(0.0), isnan(_11721)), level(0.0)).x;
    float _4538 = fma(_4514, _4534, 1.570728778839111328125);
    float _4540 = -_4464;
    float _4542 = fma(_4526, _4494, _4540);
    float _4544 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4524);
    float _4546 = _4530 * _4508;
    float _4548 = fma(_4542, 0.5, 0.5);
    float _4550 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4544);
    float _4552 = _4500 * 0.693147182464599609375;
    float _4554 = fma(_4546, 0.5, 0.5);
    float _4556 = _4532 * 0.636619746685028076171875;
    float _4558 = _4550 * _4508;
    float _4560 = _4552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4562 = -_4538;
    float _4564 = fma(_4556, _4562, 1.0);
    float _4566 = fma(_4558, -0.5, 0.5);
    float3 _11779 = float3(_4554, _4566, _4560);
    float _4568 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11779, float3(0.0), isnan(_11779)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11779, float3(0.0), isnan(_11779)), level(0.0)).x;
    float3 _11790 = float3(_4554, _4566, _4560);
    float4 _4571 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11790, float3(0.0), isnan(_11790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11790, float3(0.0), isnan(_11790)), level(0.0)).xyzw;
    float _4573 = _4571.x;
    float _4575 = _4571.y;
    float _4577 = _4571.z;
    float _4579 = _4571.w;
    float2 _11806 = float2(_4564, _4548);
    float3 _4583 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11806, float2(0.0), isnan(_11806)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11806, float2(0.0), isnan(_11806)), level(0.0)).xyz;
    float _4585 = _4583.x;
    float _4587 = _4583.y;
    float _4589 = _4583.z;
    float _4591 = abs(_4130);
    float _4593 = log2(_4591);
    float _4595 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4597 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4599 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4601 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4603 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4595);
    float _4605 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4597);
    float _4607 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4599);
    float _4609 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4611 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4613 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4615 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4617 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4619 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4621 = -_3800;
    float _4623 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4601);
    float _4625 = -_3800;
    float _4627 = fma(_4625, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4615);
    float _4629 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4631 = -_3800;
    float _4633 = fma(_4631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4609);
    float _4635 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4611);
    float _4637 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4613);
    float _4639 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4617);
    float _4641 = fma(_4619, _4619, 1.0);
    float _4643 = exp2(_4629);
    float _4645 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4633);
    float _4647 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4623);
    float _4649 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4627);
    float _4651 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4603);
    float _4653 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4605);
    float _4655 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4607);
    float _4657 = rsqrt(_4641);
    float _4659 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4661 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4663 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4635);
    float _4665 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4637);
    float _4667 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4639);
    float _4669 = _4619 * _4647;
    out.m_86.x = _4651;
    out.m_86.y = _4653;
    out.m_86.z = _4655;
    float _4671 = fma(_4643, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4673 = precise::clamp(_4671, 0.0, 1.0);
    float _4675 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4677 = exp2(_4661);
    float _4679 = fma(_4659, _4651, _4669);
    bool _4681 = _4130 <= 8000.0;
    bool _4683 = isnan(_4130);
    bool _4685 = _4681 || _4683;
    bool _4687 = isnan(8000.0);
    bool _4689 = _4685 || _4687;
    float _4691 = float(_4689);
    float _4693 = fma(_4673, -2.0, 3.0);
    float _4695 = _4673 * _4673;
    float _4697 = _4619 * _4657;
    float _4699 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4675);
    bool _4701 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4703 = isnan(_4260);
    bool _4705 = _4701 || _4703;
    bool _4707 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4709 = _4705 || _4707;
    float _4711 = _4695 * _4693;
    float _4713 = _4619 * _4649;
    float _4715 = _4619 * _4645;
    float _4717 = -_4663;
    float _4719 = _4697 * _4717;
    float _4721 = -_4711;
    float _4723 = _4721 + 1.0;
    float _4725 = fma(_4659, _4653, _4713);
    float _4727 = -_4667;
    float _4729 = _4697 * _4727;
    float _4731 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4711);
    float _4733 = -_4665;
    float _4735 = _4697 * _4733;
    float _4737 = fma(_4657, _4645, _4729);
    float _4739 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4699);
    float _4741 = in.m_88.x;
    float _4743 = fma(_4657, _4647, _4719);
    float _4745 = _4691 * _4731;
    float _4747 = fma(_4657, _4649, _4735);
    float _4749 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4739);
    float _4751 = _4504 * 0.5;
    float _4753 = -_4677;
    float _4755 = _4753 + 1.0;
    float _4757 = _4745 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4759 = _4749 + _4504;
    float _4761 = _4530 + _4504;
    float _4763 = fma(_4550, -0.5, _4751);
    float _4765 = _4755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4767 = _4759 * 0.5;
    float _4769 = _4761 * 0.5;
    out.gl_Position.x = _4530;
    out.gl_Position.y = _4550;
    out.gl_Position.z = _4749;
    out.gl_Position.w = _4504;
    float _4771 = fma(_4659, _4655, _4715);
    float _4773 = _4663 + _4679;
    float _4775 = _4665 + _4725;
    out.m_90.x = _4769;
    out.m_90.y = _4763;
    out.m_90.z = _4767;
    out.m_90.w = _4504;
    float _4777 = _4667 + _4771;
    out.m_92.x = _4743;
    out.m_92.y = _4747;
    out.m_92.z = _4737;
    out.m_94.x = _4773;
    out.m_94.y = _4775;
    out.m_94.z = _4777;
    float _4779 = -_4765;
    float _4781 = _4779 + 1.0;
    float _4783 = _4504;
    float _4785 = _4749;
    float _4787 = _4550;
    float _4789 = _4781;
    if (!_4709)
    {
        _4783 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4791 = _4783;
    float _4793 = _4791;
    float _4795 = _4791;
    if (!_4709)
    {
        _4785 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4797 = _4785;
    float _4799 = _4797;
    float _4801 = _4797;
    if (!_4709)
    {
        _4787 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4803 = _4787;
    float _4805 = -_4536;
    float _4807 = _4805 + 1.0;
    float _4809 = _4807 * _4757;
    float _4811 = precise::clamp(_4809, 0.0, 1.0);
    float _4813 = -_4811;
    float _4815 = fma(_4813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4817 = _4815 * _4741;
    float _4819 = _4817 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4819;
    float _4821 = _4765 * _4568;
    float _4823 = _4579 * _4781;
    float _4825 = _4575;
    float _4827 = _4573;
    float _4829 = _4803;
    float _4831 = _4803;
    if (!_4709)
    {
        _4789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4833 = _4789;
    float _4835 = _4579 * _4821;
    float _4837 = _4589 * _4821;
    float _4839 = fma(_4585, _4835, _4573);
    float _4841 = fma(_4587, _4835, _4575);
    float _4843 = fma(_4579, _4837, _4577);
    float _4845 = _4238 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4847 = _4833;
    float _4849 = _4833;
    if (!_4709)
    {
        _4825 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4851 = _4825;
    float _4853 = _4851;
    float _4855 = _4851;
    if (!_4709)
    {
        _4827 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4857 = _4827;
    out.m_98.x = _4839;
    out.m_98.y = _4841;
    out.m_98.z = _4843;
    out.m_98.w = _4823;
    bool _4859 = !_4709;
    float _4861 = _4857;
    float _4863 = _4857;
    if (!_4859)
    {
        bool _4865 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4867 = isnan(_4260);
        bool _4869 = _4865 || _4867;
        bool _4871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4873 = _4869 || _4871;
        if (!_4873)
        {
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4877 = _4260 + _4875;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4881 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4879;
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4887 = 1.0 / _4881;
            float _4889 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4893 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4903 = _4901 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4905 = _4877 * _4887;
            float _4907 = precise::clamp(_4905, 0.0, 1.0);
            float _4909 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4913 = fma(_4907, _4885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4915 = fma(_4907, _4911, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4917 = fma(_4907, _4891, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4919 = fma(_4907, _4895, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4921 = fma(_4907, _4899, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4923 = fma(_4907, _4903, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4863 = _4917;
            _4831 = _4921;
            _4855 = _4913;
            _4801 = _4919;
            _4795 = _4915;
            _4849 = _4923;
            _4925 = true;
        }
        else
        {
            bool _4927 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4929 = isnan(_4260);
            bool _4931 = _4927 || _4929;
            bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4935 = _4931 || _4933;
            if (!_4935)
            {
                _4853 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4937 = _4853;
            _4855 = _4937;
            if (!_4935)
            {
                _4861 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4939 = _4861;
            _4863 = _4939;
            if (!_4935)
            {
                _4793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4941 = _4793;
            _4795 = _4941;
            if (!_4935)
            {
                _4799 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4943 = _4799;
            _4801 = _4943;
            if (!_4935)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4945 = _4829;
            _4831 = _4945;
            if (!_4935)
            {
                _4847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4947 = _4847;
            bool _4949 = !_4935;
            _4849 = _4947;
            if (!_4949)
            {
                bool _4951 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4953 = isnan(_4260);
                bool _4955 = _4951 || _4953;
                bool _4957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4959 = _4955 || _4957;
                if (!_4959)
                {
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4963 = _4260 + _4961;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4967 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4965;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4973 = 1.0 / _4967;
                    float _4975 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4977 = _4975 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4979 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4981 = _4979 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4991 = _4963 * _4973;
                    float _4993 = precise::clamp(_4991, 0.0, 1.0);
                    float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4999 = fma(_4993, _4971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5001 = fma(_4993, _4997, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5003 = fma(_4993, _4977, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5005 = fma(_4993, _4981, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5007 = fma(_4993, _4985, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5009 = fma(_4993, _4989, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4863 = _5003;
                    _4831 = _5007;
                    _4855 = _4999;
                    _4801 = _5005;
                    _4795 = _5001;
                    _4849 = _5009;
                    _4925 = true;
                }
                else
                {
                    _4863 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4855 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4801 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4925 = false;
    float _5011 = _4863;
    float _5013 = _4831;
    float _5015 = _4855;
    float _5017 = _4801;
    float _5019 = _4795;
    float _5021 = _4849;
    float _5023 = _4845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5025 = fma(_4775, -0.5, 0.5);
    float _5027 = precise::clamp(_5025, 0.0, 1.0);
    float _5029 = -_5011;
    float _5031 = _5029 + _5013;
    float _5033 = -_5015;
    float _5035 = _5033 + _5017;
    out.m_100.x = 0.0;
    float _5037 = fma(_5027, _5031, _5011);
    float _5039 = -_5019;
    float _5041 = _5039 + _5021;
    float _5043 = fma(_5027, _5035, _5015);
    float _5045 = _5037 * 0.586610972881317138671875;
    bool _5047 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5049 = fma(_5027, _5041, _5019);
    out.m_53.x = _5023;
    float _5051 = fma(_5043, 0.298911988735198974609375, _5045);
    bool _5053 = _4238 > 0.0;
    bool _5055 = isnan(_4238);
    bool _5057 = _5053 || _5055;
    bool _5059 = isnan(0.0);
    bool _5061 = _5057 || _5059;
    float _5063 = fma(_5049, 0.114477999508380889892578125, _5051);
    float _5065 = -_5063;
    float _5067 = _5043 + _5065;
    float _5069 = -_5063;
    float _5071 = _5037 + _5069;
    float _5073 = -_5063;
    float _5075 = _5049 + _5073;
    float _5077 = fma(_5067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    float _5079 = fma(_5071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    float _5081 = fma(_5075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    bool _5083 = !_5047;
    if (!_5083)
    {
        float _5085 = -_4178;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5089 = -_4180;
        float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5093 = -_4182;
        float _5095 = _5093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5097 = _5087 * _5087;
        float _5099 = fma(_5091, _5091, _5097);
        float _5101 = fma(_5095, _5095, _5099);
        float _5103 = sqrt(_5101);
        float _5105 = rsqrt(_5101);
        float _5107 = -_5103;
        float _5109 = _5107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5111 = _5109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5113 = precise::clamp(_5111, 0.0, 1.0);
        float _5115 = _5091 * _5105;
        float _5117 = _5087 * _5105;
        float _5119 = abs(_5113);
        float _5121 = log2(_5119);
        float _5123 = _5095 * _5105;
        float _5125 = _5115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5127 = _4775 * _5117;
        float _5129 = -_5117;
        float _5131 = -_5125;
        float _5133 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5131);
        float _5135 = fma(_4773, _5115, _5127);
        float _5137 = -_5123;
        float _5139 = fma(_5137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5133);
        float _5141 = fma(_4777, _5123, _5135);
        float _5143 = precise::clamp(_5141, 0.0, 1.0);
        float _5145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5147 = _5139 + _5145;
        float _5149 = _5121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5151 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5153 = precise::clamp(_5151, 0.0, 1.0);
        float _5155 = exp2(_5149);
        float _5157 = _5155 * _5153;
        float _5159 = _5143 * _5157;
        float _5161 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5163 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5165 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5161;
        out.m_100.y = _5163;
        out.m_100.z = _5165;
    }
    out.m_102.x = _5077;
    out.m_102.y = _5079;
    out.m_102.z = _5081;
    if (_5061)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5167;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4925 = false;
    bool _631 = false;
    bool _449 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5235 = as_type<float>(_145);
        out.gl_Position.z = _5235;
    }
    if (!_131)
    {
        return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5298 = as_type<float>(_177);
        out.gl_Position.z = _5298;
    }
    if (_165)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_211;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _183 * _189;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _219);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    bool _229 = !_207;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_181, _199, _225);
    float _235 = fma(_185, _191, _223);
    float _237 = fma(_185, _197, _227);
    float _239 = fma(_185, _203, _233);
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _279;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _305 = 1.0 / _287;
    float _307 = 1.0 / _283;
    float _309 = _267 * _301;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_299;
    float _325 = _323 + 1.0;
    float _327 = _321 * _325;
    float _329 = _271 * _305;
    bool _331 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_263);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_321;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _341 * _345;
    float _353 = -_341;
    float _355 = _353 + 1.0;
    float _357 = _275 * _307;
    bool _359 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_263);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = fma(_349, _357, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = fma(_373, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = _369 * _355;
    float _389 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_383, _357, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = -_369;
    float _395 = _393 + 1.0;
    float _397 = _385 * _387;
    float _399 = _389 * _387;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _413 = fma(_403, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _415 = fma(_375, _351, _405);
    float _417 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_391, _351, _411);
    float _421 = fma(_413, _327, _415);
    float _423 = fma(_417, _327, _419);
    float _425 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _421);
    float _427 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _423);
    bool _429 = !_303;
    float _447;
    if (!_429)
    {
        float _431 = in.m_66.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _171;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _467 = isnan(_451);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _481 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = isnan(_451);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _459;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -_475;
    float _501 = _499 + 1.0;
    bool _503 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_451);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _517 = 1.0 / _463;
    float _519 = 1.0 / _479;
    float _521 = _497 * _493;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _527 = _491 * _501;
    float _529 = -_491;
    float _531 = _529 + 1.0;
    float _533 = fma(_521, _455, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _535;
    float _539 = _513 * _531;
    float _541 = _525 * _517;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _451 + _543;
    bool _547 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = isnan(_451);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _533 * _539;
    float _561 = -_513;
    float _563 = _561 + 1.0;
    float _565 = fma(_541, _545, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _451 + _567;
    float _571 = _537 * _519;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _579 = fma(_571, _569, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _581 = _475 * _575;
    float _583 = fma(_565, _527, _577);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _587 = fma(_579, _581, _583);
    float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _591 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[118].x, _587);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _595 = in.m_68.x;
    float _597 = in.m_68.y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _601 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _603 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _589;
    out.m_70.y = _603;
    out.m_70.z = _605;
    out.m_70.w = _601;
    float _607 = _427 * _597;
    float _609 = _425 * _595;
    bool _611 = !_515;
    float _629;
    if (!_611)
    {
        float _613 = in.m_66.x;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _617 = _613 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        _629 = _171;
    }
    _631 = false;
    float _633 = _629;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _633 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _643 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _645 = isnan(_633);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _663 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _665 = isnan(_633);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = 1.0 / _641;
    float _677 = -_653;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _681;
    bool _685 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _687 = isnan(_633);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = _673 * _679;
    float _699 = -_673;
    float _701 = _699 + 1.0;
    bool _703 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _705 = 1.0 / _657;
    float _707 = _695 * _701;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _661;
    float _715 = _683 * _675;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _721 = fma(_715, _637, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _723 = _719 * _705;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _727 = _633 + _725;
    bool _729 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _731 = isnan(_633);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _741;
    float _745 = _721 * _707;
    float _747 = fma(_723, _727, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = _633 + _749;
    float _753 = -_739;
    float _755 = _753 + 1.0;
    float _757 = _743 * _713;
    float _759 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[131].x, _745);
    float _761 = _653 * _755;
    float _763 = fma(_757, _751, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _765 = fma(_747, _697, _759);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _769 = fma(_763, _761, _765);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _777 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[134].x, _769);
    float _779 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _773;
    out.m_72.y = _779;
    out.m_72.z = _781;
    out.m_72.w = _783;
    bool _785 = !_703;
    float _787 = _781;
    float _789 = _783;
    if (!_785)
    {
        float _791 = in.m_66.x;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _795 = _791 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _799 = _797 * _793;
        float _801 = floor(_799);
        float _803 = -_801;
        float _805 = _799 + _803;
        _173 = _805;
    }
    float _807 = _173;
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _811 = int(_809);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _819 = int(_817);
    float _821 = float(_811);
    float _823 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _825 = int(_823);
    if (_815)
    {
        _787 = 1.0;
    }
    float _827 = _787;
    float _829 = _827;
    if (_815)
    {
        _789 = 1.0;
    }
    float _831 = _789;
    int _833 = 0;
    float _835 = _831;
    if (_815)
    {
        _833 = 0;
    }
    int _837 = _833;
    float _839 = float(_819);
    float _841 = 1.0 / _821;
    float _843 = 1.0 / _839;
    float _845 = float(uint(_825));
    int _847 = ~_825;
    int _849 = _847 + 1;
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _853 = int(_851);
    float _855 = _841 * _127;
    float _857 = _841;
    float _859 = _839;
    int _861 = _837;
    if (_815)
    {
        float _863 = in.m_66.x;
        float _865 = in.m_66.y;
        _857 = _863;
        _859 = _865;
    }
    float _867 = _857;
    float _869 = _859;
    float _871 = _843 * _127;
    float _873 = 1.0 / _845;
    float _875 = float(uint(_853));
    float _877 = trunc(_855);
    int _879 = int(_877);
    float _881 = 1.0 / _875;
    int _883 = as_type<int>(_873) + (-2);
    float _885 = 0.0;
    float _887 = _867;
    float _889 = _869;
    if (_815)
    {
        _885 = _869;
    }
    float _891 = _885;
    float _893 = trunc(_871);
    int _895 = int(_893);
    float _897 = float(uint(_879));
    float _899 = as_type<float>(_883) * _897;
    float _901 = _897;
    float _903 = _891;
    if (_815)
    {
        _901 = _867;
    }
    float _905 = _901;
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _909 = int(_907);
    int _911 = as_type<int>(_881) + (-2);
    float _913 = 0.0;
    float _915 = _905;
    if (_815)
    {
        _913 = _905;
    }
    float _917 = _913;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _921 = int(_919);
    float _923 = float(uint(_895));
    float _925 = as_type<float>(_911) * _923;
    int _927 = as_type<int>(_923);
    float _929 = _917;
    if (_815)
    {
        _927 = 0;
    }
    int _931 = _927;
    float _933 = trunc(_899);
    float _935 = precise::max(_933, 0.0);
    uint _938 = uint(_935);
    float _940 = float(uint(_909));
    float _942 = 1.0 / _940;
    float _944 = float(_921);
    float _946 = trunc(_925);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    float _952 = 1.0 / _944;
    float _954 = _944;
    int _956 = _931;
    if (_815)
    {
        _954 = _905;
    }
    float _958 = _954;
    float _960 = _958;
    if (!_815)
    {
        float _962 = in.m_66.x;
        float _964 = in.m_66.y;
        float _966 = in.m_66.z;
        float _968 = _962 * 3.1415927410125732421875;
        float _970 = _968 * 0.15915493667125701904296875;
        float _972 = _964 * 3.1415927410125732421875;
        float _974 = _972 * 0.15915493667125701904296875;
        float _976 = _970 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = sin(_980);
        _829 = 7.345489978790283203125;
        _887 = _962;
        _835 = 5.839270114898681640625;
        _960 = _966;
        _915 = _964;
        _889 = _964;
        _956 = 1;
        _929 = _978;
        _903 = _982;
        _861 = 2;
    }
    float _984 = _829;
    float _986 = _887;
    float _988 = _835;
    float _990 = _960;
    float _992 = _915;
    float _994 = _889;
    int _996 = _956;
    float _998 = _929;
    float _1000 = _903;
    int _1002 = _861;
    int _1004 = _849 * int(_938);
    int _1006 = _1004 + _879;
    float _1008 = in.m_66.z;
    float _1010 = in.m_66.w;
    int _1012 = ~_853;
    int _1014 = _1012 + 1;
    float _1016 = _984 * _986;
    float _1018 = _988 * _990;
    float _1020 = float(uint(_1006));
    float _1022 = _984 * _992;
    int _1024 = _1014 * int(_950);
    int _1026 = _1024 + _895;
    float _1028 = floor(_1016);
    int _1030 = as_type<int>(_942) + (-2);
    float _1032 = as_type<float>(_883) * _1020;
    float _1034 = _952 * _127;
    float _1036 = float(uint(_1026));
    float _1038 = in.m_60.w;
    float _1040 = float(_825);
    float _1042 = floor(_1018);
    float _1044 = as_type<float>(_911) * _1036;
    float _1046 = float(_879);
    bool _1048 = _994 > 0.5;
    bool _1050 = _1046 >= _1040;
    bool _1052 = isnan(_1046);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(_1040);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = trunc(_1034);
    int _1064 = int(_1062);
    bool _1066 = _1010 > 0.5;
    float _1068 = -_1028;
    float _1070 = _1016 + _1068;
    bool _1072 = _1008 > 0.5;
    float _1074 = _1070 * _1040;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1078 = _1076 != 0;
    float _1080 = trunc(_1044);
    float _1082 = precise::max(_1080, 0.0);
    uint _1084 = uint(_1082);
    float _1086 = -_1042;
    float _1088 = _1018 + _1086;
    int _1090 = ~_853;
    int _1092 = _1090 + 1;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1100 = _1098 != 0;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1104 = _1102 != 0;
    float _1106 = -_217;
    int _1108 = _1072 ? as_type<int>(_1106) : as_type<int>(_217);
    float _1110 = trunc(_1032);
    float _1112 = precise::max(_1110, 0.0);
    uint _1114 = uint(_1112);
    float _1116 = float(uint(_1064));
    int _1118 = int(_1066);
    int _1120 = _1072 ? 2 : 0;
    int _1122 = _1118 | _1120;
    int _1124 = _1078 ? 4 : 0;
    int _1126 = _1122 | _1124;
    int _1128 = _1096 ? 8 : 0;
    int _1130 = _1126 | _1128;
    int _1132 = _1100 ? 16 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1104 ? 32 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1048 ? 64 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1142 & 64;
    float _1146 = as_type<float>(_1030) * _1116;
    float _1148 = -_231;
    int _1150 = _1048 ? as_type<int>(_1148) : as_type<int>(_231);
    float _1152 = trunc(_1060);
    int _1154 = int(_1152);
    int _1156 = int(_950) + int(_1084);
    bool _1158 = !_1104;
    float _1160 = _1158 ? _217 : as_type<float>(_1108);
    float _1162 = float(_853);
    bool _1164 = !_1078;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = trunc(_1146);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = !_1100;
    float _1176 = _1174 ? _231 : as_type<float>(_1150);
    int _1178 = int(_938) + int(_1114);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1190 = _1188 != 0;
    int _1192 = _1092 * _1156;
    int _1194 = _1192 + _895;
    int _1196 = ~_825;
    int _1198 = _1196 + 1;
    float _1200 = floor(_1022);
    float _1202 = float(_895);
    bool _1204 = !_1186;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = _1198 * _1178;
    int _1210 = _1208 + _879;
    bool _1212 = uint(_1194) >= uint(_853);
    float _1214 = _1088 * _1162;
    bool _1216 = !_1182;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1222 = log2(_1220);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1226 = _1224 != 0;
    bool _1228 = uint(_1210) >= uint(_825);
    bool _1230 = _1202 >= _1162;
    bool _1232 = isnan(_1202);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(_1162);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    bool _1242 = !_1190;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = trunc(_1214);
    int _1248 = int(_1246);
    bool _1250 = !_1226;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = -_1200;
    float _1256 = _1022 + _1254;
    bool _1258 = !_1212;
    int _1260 = _1258 ? 0 : (-1);
    bool _1262 = !_1228;
    int _1264 = _1262 ? 0 : (-1);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1276 = _1274 != 0;
    float _1278 = trunc(_1074);
    int _1280 = int(_1278);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1284 = _1282 != 0;
    int _1286 = ~_909;
    int _1288 = _1286 + 1;
    int _1290 = ~_1156;
    int _1292 = _1290 + _1260;
    int _1294 = _1292 + 1;
    int _1296 = ~_1178;
    int _1298 = _1296 + _1264;
    int _1300 = _1298 + 1;
    float _1302 = trunc(_1240);
    int _1304 = int(_1302);
    int _1306 = abs(_1166);
    int _1308 = _1288 * int(_1172);
    int _1310 = _1308 + _1064;
    bool _1312 = !_1284;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _853 * _1294;
    int _1318 = _1316 + _895;
    bool _1320 = _825 == 0;
    int _1322 = abs(_1314);
    int _1324 = _1280 * _1306;
    int _1326 = _1324 + _879;
    float _1328 = float(uint(_1310));
    int _1330 = _825 * _1300;
    int _1332 = _1330 + _879;
    bool _1334 = !_1272;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1248 * _1322;
    int _1340 = _1338 + _895;
    float _1342 = _167 * _127;
    bool _1344 = !_1268;
    int _1346 = _1344 ? 0 : 1;
    bool _1348 = _1144 != 0;
    float _1350 = _1040 * _1342;
    bool _1352 = _853 == 0;
    float _1354 = as_type<float>(_1030) * _1328;
    int _1356 = ~_1154;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = _1162 * _1342;
    bool _1364 = !_1320;
    int _1366 = _1364 ? _1332 : (-1);
    float _1368 = trunc(_1350);
    int _1370 = int(_1368);
    int _1372 = ~_1304;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1352;
    int _1380 = _1378 ? _1318 : (-1);
    int _1382 = _1366 * _1360;
    int _1384 = _825 + (-1);
    int _1386 = _853 + (-1);
    float _1388 = trunc(_1354);
    float _1390 = precise::max(_1388, 0.0);
    uint _1392 = uint(_1390);
    int _1394 = _1380 * _1376;
    int _1396 = abs(_1336);
    int _1398 = _1154 * _1384;
    int _1400 = _1398 + _1382;
    int _1402 = abs(_1206);
    int _1404 = _1304 * _1386;
    int _1406 = _1404 + _1394;
    int _1408 = abs(_1218);
    int _1410 = _1400 * _1402;
    float _1412 = trunc(_1362);
    int _1414 = int(_1412);
    int _1416 = ~_909;
    int _1418 = _1416 + 1;
    int _1420 = _1406 * _1396;
    int _1422 = abs(_1244);
    int _1424 = _1370 * _1408;
    int _1426 = _1424 + _1410;
    int _1428 = abs(_1252);
    int _1430 = int(_1172) + int(_1392);
    int _1432 = _1326 * _1422;
    int _1434 = _1432 + _1426;
    int _1436 = abs(_1346);
    int _1438 = _1418 * _1430;
    int _1440 = _1438 + _1064;
    float _1442 = -_217;
    int _1444 = _1066 ? as_type<int>(_1442) : as_type<int>(_217);
    int _1446 = _1280 * _1428;
    int _1448 = _1446 + _1434;
    bool _1450 = !_1276;
    int _1452 = _1450 ? 0 : 1;
    int _1454 = _1414 * _1436;
    int _1456 = _1454 + _1420;
    bool _1458 = uint(_1440) >= uint(_909);
    float _1460 = float(uint(_1448));
    float _1462 = float(_909);
    float _1464 = -_231;
    int _1466 = _1072 ? as_type<int>(_1464) : as_type<int>(_231);
    float _1468 = float(_1064);
    float _1470 = _1462 * _1342;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1474 = _1472 != 0;
    float _1476 = _1256 * _1462;
    int _1478 = abs(_1452);
    float _1480 = as_type<float>(_883) * _1460;
    bool _1482 = _1468 >= _1462;
    bool _1484 = isnan(_1468);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1462);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = trunc(_1470);
    int _1496 = int(_1494);
    bool _1498 = !_1474;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = _1340 * _1478;
    int _1504 = _1502 + _1456;
    bool _1506 = !_1096;
    float _1508 = _1506 ? _217 : as_type<float>(_1444);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1512 = _1510 != 0;
    int _1514 = abs(_1500);
    float _1516 = trunc(_1480);
    float _1518 = precise::max(_1516, 0.0);
    uint _1520 = uint(_1518);
    bool _1522 = !_1458;
    int _1524 = _1522 ? 0 : (-1);
    bool _1526 = !_1512;
    int _1528 = _1526 ? 0 : 1;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1544 = _1542 != 0;
    int _1546 = ~_1430;
    int _1548 = _1546 + _1524;
    int _1550 = _1548 + 1;
    float _1552 = trunc(_1492);
    int _1554 = int(_1552);
    bool _1556 = !_1536;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1562 = _1560 != 0;
    int _1564 = _1248 * _1514;
    int _1566 = _1564 + _1504;
    int _1568 = ~_825;
    int _1570 = _1568 + 1;
    int _1572 = _909 * _1550;
    int _1574 = _1572 + _1064;
    bool _1576 = !_1532;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = trunc(_1476);
    int _1582 = int(_1580);
    float _1584 = float(uint(_1566));
    int _1586 = _1570 * int(_1520);
    int _1588 = _1586 + _1448;
    bool _1590 = _909 == 0;
    int _1592 = abs(_1558);
    float _1594 = as_type<float>(_911) * _1584;
    float _1596 = float(uint(_1588));
    float _1598 = _1584;
    float _1600 = as_type<float>(_1520);
    float _1602 = _1354;
    float _1604 = as_type<float>(_1002);
    if (_1562)
    {
        float _1606 = in.m_66.w;
        _1598 = _1606;
    }
    float _1608 = _1598;
    int _1610 = ~_1554;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    float _1616 = trunc(_1594);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    bool _1622 = !_1590;
    int _1624 = _1622 ? _1574 : (-1);
    float _1626 = as_type<float>(_883) * _1596;
    int _1628 = abs(_1528);
    int _1630 = abs(_1578);
    int _1632 = _1624 * _1614;
    int _1634 = _909 + (-1);
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = _1582 * _1628;
    int _1644 = _1642 + _1064;
    bool _1646 = !_1540;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1554 * _1634;
    int _1652 = _1650 + _1632;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1656 = _1654 != 0;
    int _1658 = _1652 * _1592;
    int _1660 = ~_853;
    int _1662 = _1660 + 1;
    int _1664 = ~_825;
    int _1666 = _1664 + 1;
    int _1668 = _1496 * _1630;
    int _1670 = _1668 + _1658;
    int _1672 = abs(_1648);
    int _1674 = _1662 * int(_1620);
    int _1676 = _1674 + _1566;
    float _1678 = as_type<float>(_1658);
    if (_1562)
    {
        float _1680 = _1608 * 3.1415927410125732421875;
        _1678 = _1680;
    }
    float _1682 = _1678;
    int _1684 = int(_1520) + int(_1640);
    int _1686 = _1644 * _1672;
    int _1688 = _1686 + _1670;
    float _1690 = float(uint(_1676));
    if (_1562)
    {
        float _1692 = _1682 * 0.15915493667125701904296875;
        _1600 = _1692;
    }
    float _1694 = _1600;
    bool _1696 = !_1544;
    int _1698 = _1696 ? 0 : 1;
    int _1700 = _1666 * _1684;
    int _1702 = _1700 + _1448;
    float _1704 = _1608;
    if (_1656)
    {
        float _1706 = in.m_66.x;
        _1704 = _1706;
    }
    float _1708 = _1704;
    float _1710 = as_type<float>(_911) * _1690;
    int _1712 = abs(_1698);
    float _1714 = _1694;
    if (_1562)
    {
        float _1716 = _1694 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        _1714 = _1718;
    }
    float _1720 = _1714;
    bool _1722 = uint(_1702) >= uint(_825);
    bool _1724 = !_1722;
    int _1726 = _1724 ? 0 : (-1);
    float _1728 = float(uint(_1326));
    float _1730 = trunc(_1710);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1738 = _1736 != 0;
    int _1740 = _1582 * _1712;
    int _1742 = _1740 + _1688;
    int _1744 = ~_1684;
    int _1746 = _1744 + _1726;
    int _1748 = _1746 + 1;
    float _1750 = as_type<float>(_883) * _1728;
    bool _1752 = !_1738;
    float _1754 = _1752 ? _231 : as_type<float>(_1466);
    float _1756 = float(uint(_1742));
    int _1758 = _825 * _1748;
    int _1760 = _1758 + _1448;
    bool _1762 = _825 == 0;
    float _1764 = trunc(_1750);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    bool _1770 = _1738;
    float _1772 = _1756;
    if (_1562)
    {
        bool _1774 = _1720 > 0.5;
        _1770 = _1774;
    }
    bool _1776 = _1770;
    bool _1778 = !_1762;
    int _1780 = _1778 ? _1760 : (-1);
    float _1782 = 0.0;
    if (!_1562)
    {
        _1782 = _231;
    }
    float _1784 = _1782;
    int _1786 = int(_1620) + int(_1734);
    float _1788 = as_type<float>(_1030) * _1756;
    int _1790 = ~_825;
    int _1792 = _1790 + 1;
    float _1794 = _1784;
    if (_1656)
    {
        float _1796 = _1708 * 3.1415927410125732421875;
        _1772 = _1796;
    }
    float _1798 = _1772;
    float _1800 = _1798;
    if (_1562)
    {
        float _1802 = -_231;
        float _1804 = _1776 ? _1802 : _231;
        _1794 = _1804;
    }
    float _1806 = _1794;
    float _1808 = trunc(_1788);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    int _1814 = _1780 & 3;
    bool _1816 = _1814 != 0;
    if (_1656)
    {
        float _1818 = _1798 * 0.15915493667125701904296875;
        _1800 = _1818;
    }
    float _1820 = _1800;
    int _1822 = _1780 & 3;
    bool _1824 = _1822 != 0;
    int _1826 = _1816 ? 0 : 1;
    float _1828 = _1820;
    if (_1656)
    {
        float _1830 = _1820 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        _1828 = _1832;
    }
    float _1834 = _1828;
    bool _1836 = uint(_1822) > 1u;
    int _1838 = _1792 * int(_1768);
    int _1840 = _1838 + _1326;
    float _1842 = float(uint(_1340));
    int _1844 = ~_909;
    int _1846 = _1844 + 1;
    int _1848 = ~_853;
    int _1850 = _1848 + 1;
    float _1852 = as_type<float>(_911) * _1842;
    float _1854 = float(uint(_1840));
    int _1856 = _1846 * int(_1812);
    int _1858 = _1856 + _1742;
    int _1860 = ~_1826;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = ~_853;
    int _1868 = _1866 + 1;
    float _1870 = as_type<float>(_883) * _1854;
    int _1872 = _1864;
    if (!_1836)
    {
        int _1874 = ~_1826;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    int _1880 = _1850 * _1786;
    int _1882 = _1880 + _1566;
    float _1884 = -_217;
    int _1886 = _1348 ? as_type<int>(_1884) : as_type<int>(_217);
    float _1888 = trunc(_1852);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = float(uint(_1858));
    bool _1896 = uint(_1822) >= 2u;
    bool _1898 = uint(_1882) >= uint(_853);
    float _1900 = as_type<float>(_1030) * _1894;
    int _1902 = _1896 ? 0 : 1;
    float _1904 = trunc(_1870);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    bool _1910 = _1822 != 3;
    bool _1912 = !_1898;
    int _1914 = _1912 ? 0 : (-1);
    bool _1916 = _1910;
    if (!_1656)
    {
        _1602 = _217;
    }
    float _1918 = _1602;
    int _1920 = ~_1786;
    int _1922 = _1920 + _1914;
    int _1924 = _1922 + 1;
    float _1926 = trunc(_1900);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = _1868 * int(_1892);
    int _1934 = _1932 + _1340;
    int _1936 = ~_1902;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = _853 * _1924;
    int _1944 = _1942 + _1566;
    int _1946 = _1940;
    float _1948 = _1918;
    float _1950 = 2.8025969286496341418474591665798e-45;
    if (_1910)
    {
        int _1952 = ~_1902;
        int _1954 = _1952 + 1;
        _1946 = _1954;
    }
    int _1956 = _1946;
    if (_1656)
    {
        bool _1958 = _1834 > 0.5;
        _1916 = _1958;
    }
    bool _1960 = _1916;
    bool _1962 = !_1352;
    int _1964 = _1962 ? _1944 : (-1);
    float _1966 = float(uint(_1934));
    int _1968 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1970 = _1968 != 0;
    if (_1656)
    {
        float _1972 = -_217;
        float _1974 = _1960 ? _1972 : _217;
        _1948 = _1974;
    }
    float _1976 = _1948;
    float _1978 = as_type<float>(_911) * _1966;
    int _1980 = _1964 & 3;
    bool _1982 = _1980 != 0;
    int _1984 = int(_1812) + int(_1930);
    bool _1986 = !_1970;
    float _1988 = _1986 ? _217 : as_type<float>(_1886);
    float _1990 = trunc(_1978);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    int _1996 = int(_1768) + int(_1908);
    bool _1998 = uint(_1980) > 1u;
    int _2000 = ~_909;
    int _2002 = _2000 + 1;
    int _2004 = _1964 & 3;
    bool _2006 = _2004 != 0;
    int _2008 = ~_825;
    int _2010 = _2008 + 1;
    int _2012 = _2002 * _1984;
    int _2014 = _2012 + _1742;
    int _2016 = _2006 ? 0 : 1;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2020 = _2018 != 0;
    int _2022 = _2010 * _1996;
    int _2024 = _2022 + _1326;
    float _2026 = float(uint(_1644));
    bool _2028 = !_2020;
    int _2030 = _2028 ? 0 : 1;
    bool _2032 = uint(_2014) >= uint(_909);
    float _2034 = as_type<float>(_1030) * _2026;
    int _2036 = ~_2016;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2040;
    if (!_1998)
    {
        int _2044 = ~_2016;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = trunc(_2034);
    float _2052 = precise::max(_2050, 0.0);
    uint _2054 = uint(_2052);
    bool _2056 = uint(_2024) >= uint(_825);
    bool _2058 = !_2032;
    int _2060 = _2058 ? 0 : (-1);
    bool _2062 = _1980 != 3;
    bool _2064 = !_2056;
    int _2066 = _2064 ? 0 : (-1);
    bool _2068 = uint(_1980) >= 2u;
    int _2070 = ~_1984;
    int _2072 = _2070 + _2060;
    int _2074 = _2072 + 1;
    int _2076 = ~_853;
    int _2078 = _2076 + 1;
    int _2080 = int(_1892) + int(_1994);
    int _2082 = _909 * _2074;
    int _2084 = _2082 + _1742;
    int _2086 = ~_909;
    int _2088 = _2086 + 1;
    int _2090 = _2068 ? 0 : 1;
    int _2092 = _2078 * _2080;
    int _2094 = _2092 + _1340;
    int _2096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2098 = _2096 != 0;
    int _2100 = ~_2090;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = _2104;
    float _2108 = as_type<float>(_2088);
    if (_2062)
    {
        int _2110 = ~_2090;
        int _2112 = _2110 + 1;
        _2106 = _2112;
    }
    int _2114 = _2106;
    int _2116 = _2088 * int(_2054);
    int _2118 = _2116 + _1644;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2122 = _2120 != 0;
    bool _2124 = !_2098;
    int _2126 = _2124 ? 0 : 1;
    bool _2128 = uint(_2094) >= uint(_853);
    bool _2130 = !_1590;
    int _2132 = _2130 ? _2084 : (-1);
    bool _2134 = !_2122;
    int _2136 = _2134 ? 0 : 1;
    bool _2138 = !_2128;
    int _2140 = _2138 ? 0 : (-1);
    int _2142 = _2132 & 3;
    bool _2144 = _2142 != 0;
    int _2146 = _2132 & 3;
    bool _2148 = _2146 != 0;
    float _2150 = float(uint(_2118));
    int _2152 = _2144 ? 0 : 1;
    bool _2154 = uint(_2146) > 1u;
    float _2156 = as_type<float>(_1030) * _2150;
    int _2158 = ~_2152;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = trunc(_2156);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2176 = _2162;
    if (!_2154)
    {
        int _2178 = ~_2152;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    bool _2184 = uint(_2146) >= 2u;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2188 = ~_909;
    int _2190 = _2188 + 1;
    int _2192 = _2184 ? 0 : 1;
    bool _2194 = _2146 != 3;
    int _2196 = int(_2054) + int(_2168);
    int _2198 = ~_2192;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2190 * _2196;
    int _2206 = _2204 + _1644;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2210 = _2202;
    if (_2194)
    {
        int _2212 = ~_2192;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    bool _2218 = uint(_2206) >= uint(_909);
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2222 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2208);
    bool _2224 = !_2218;
    int _2226 = _2224 ? 0 : (-1);
    bool _2228 = _986 > 0.5;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2234 = -_231;
    int _2236 = _2228 ? as_type<int>(_2234) : as_type<int>(_231);
    bool _2238 = _996 != 1;
    float _2240 = 1.0 / _2232;
    float _2242 = in.m_46.x;
    float _2244 = in.m_46.y;
    float _2246 = in.m_46.z;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2252 = abs(_2048);
    int _2254 = abs(_2114);
    float _2256 = 1.0 / _2250;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2262 = ~_1996;
    int _2264 = _2262 + _2066;
    int _2266 = _2264 + 1;
    float _2268 = 0.0;
    int _2270 = _2252;
    if (!_2238)
    {
        _2268 = _994;
    }
    float _2272 = _2268;
    float _2274 = _2272;
    if (_2238)
    {
        _2274 = _986;
    }
    float _2276 = _2274;
    int _2278 = _825 * _2266;
    int _2280 = _2278 + _1326;
    float _2282 = 0.0;
    if (!_2238)
    {
        _2282 = _994;
    }
    float _2284 = _2282;
    float _2286 = 1.0 / _2260;
    float _2288 = _2284;
    if (!_2238)
    {
        _2108 = _1008;
    }
    float _2290 = _2108;
    float _2292 = 0.0;
    float _2294 = _2290;
    if (!_2238)
    {
        _2292 = _1008;
    }
    float _2296 = _2292;
    float _2298 = _2296;
    if (_2238)
    {
        _2288 = _986;
    }
    float _2300 = _2288;
    if (_2238)
    {
        _2294 = _994;
    }
    float _2302 = _2294;
    float _2304 = _189 * _2244;
    float _2306 = _195 * _2244;
    float _2308 = _201 * _2244;
    float _2310 = _986 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2312 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2172);
    float _2314 = _994 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2316 = -_2170;
    float _2318 = fma(_2310, 2.0, _2316);
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2322 = fma(_2314, -2.0, _2174);
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2326 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2320);
    float _2328 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_2238)
    {
        _2298 = _994;
    }
    float _2330 = _2298;
    float _2332 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2334 = _1002 != 2;
    float _2336 = fma(_2328, -2.0, _2324);
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2340 = _998 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2342 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2338);
    float _2344 = _1222 * _127;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2348 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2352 = -_2346;
    float _2354 = fma(_2332, 2.0, _2352);
    float _2356 = exp2(_2344);
    if (_2334)
    {
        _1604 = _986;
    }
    float _2358 = _1604;
    float _2360 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2350);
    float _2362 = _2358;
    if (_2334)
    {
        _1950 = _994;
    }
    float _2364 = _1950;
    float _2366 = -_127;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2354);
    float _2370 = _2364;
    if (!_2334)
    {
        _2362 = _1008;
    }
    float _2372 = _2362;
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2312);
    if (!_2334)
    {
        _2370 = _986;
    }
    float _2376 = _2370;
    float _2378 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2326);
    float _2380 = _2372 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2382 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2384 = _2382 != 0;
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2390 = -_2186;
    float _2392 = fma(_2380, 2.0, _2390);
    bool _2394 = !_2384;
    float _2396 = _2394 ? _231 : as_type<float>(_2236);
    float _2398 = -_2356;
    float _2400 = _2398 + 1.0;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2404 = fma(_2348, -2.0, _2388);
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2410 = -_2402;
    float _2412 = fma(_2340, 2.0, _2410);
    float _2414 = fma(_2386, -2.0, _2220);
    bool _2416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2418 = isnan(0.0);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2424 = _2420 || _2422;
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2428 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2432 = _2424 ? _2400 : 0.0;
    float _2434 = 1.0 / _2428;
    bool _2436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2438 = isnan(1.0);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2444 = _2440 || _2442;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2450 = 1.0 + _2448;
    float _2452 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2430);
    float _2454 = -_127;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2412);
    float _2458 = -_127;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2318);
    float _2462 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2452);
    float _2464 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2446);
    float _2466 = _986 * 2.0;
    float _2468 = 1.0 / _2450;
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2222);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2474 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2464);
    float _2476 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2322);
    float _2478 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2336);
    float _2480 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2472);
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2342);
    float _2484 = floor(_2466);
    float _2486 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2360);
    float _2488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2480);
    float _2490 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2404);
    float _2492 = -_127;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2392);
    float _2496 = fma(_193, _2242, _2306);
    float _2498 = fma(_199, _2242, _2308);
    float _2500 = 1.0 / _2408;
    float _2502 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2414);
    if (_2444)
    {
        float _2504 = _2432 * _2468;
        _137 = _2504;
    }
    float _2506 = _137;
    float _2508 = _994 * 2.0;
    float _2510 = fma(_187, _2242, _2304);
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2516 = fma(_203, _2246, _2498);
    float _2518 = fma(_197, _2246, _2496);
    bool _2520 = _2484 >= 0.0;
    bool _2522 = isnan(_2484);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(0.0);
    bool _2528 = _2524 || _2526;
    float _2530 = floor(_2508);
    float _2532 = fma(_191, _2246, _2510);
    float _2534 = _1008 * 2.0;
    int _2536 = _2528 ? 0 : 1;
    float _2538 = -_2462;
    float _2540 = _2538 + 1.0;
    bool _2542 = _2484 > 0.0;
    float _2544 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2544;
    float _2548 = 1.0 / _2514;
    int _2550 = ~_2536;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    float _2556 = -_2486;
    float _2558 = _2556 + 1.0;
    float _2560 = _2546 * _2240;
    float _2562 = -_2474;
    float _2564 = _2562 + 1.0;
    bool _2566 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2568 = isnan(_807);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2574 = _2570 || _2572;
    float _2576 = float(_2574);
    float _2578 = -_2488;
    float _2580 = _2578 + 1.0;
    bool _2582 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2584 = isnan(_807);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2594;
    int _2598 = _2554;
    if (!_2542)
    {
        int _2600 = ~_2536;
        int _2602 = _2600 + 1;
        _2598 = _2602;
    }
    int _2604 = _2598;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2608 = _2606 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2610 = _2530 >= 0.0;
    bool _2612 = isnan(_2530);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan(0.0);
    bool _2618 = _2614 || _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2622 = _2620 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2624 = _2608 * _2548;
    int _2626 = _2618 ? 0 : 1;
    float _2628 = _2622 * _2434;
    bool _2630 = _2530 > 0.0;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2632;
    float _2636 = floor(_2534);
    int _2638 = ~_2080;
    int _2640 = _2638 + _2140;
    int _2642 = _2640 + 1;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2648 = _2596 * _2500;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2652 = _807 + _2650;
    int _2654 = _853 * _2642;
    int _2656 = _2654 + _1340;
    int _2658 = ~_2626;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    float _2664 = 1.0 / _2646;
    bool _2666 = !_1824;
    int _2668 = _2666 ? 0 : 1;
    float _2670 = fma(_2560, _2652, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2672 = _2662;
    if (!_2630)
    {
        int _2674 = ~_2626;
        int _2676 = _2674 + 1;
        _2672 = _2676;
    }
    int _2678 = _2672;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2684 = !_1352;
    int _2686 = _2684 ? _2656 : (-1);
    float _2688 = -_2576;
    float _2690 = _2688 + 1.0;
    int _2692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2694 = _2692 != 0;
    int _2696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2698 = _2696 != 0;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2702 = _2700 != 0;
    float _2704 = _2682 * _2256;
    bool _2706 = _2636 >= 0.0;
    bool _2708 = isnan(_2636);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan(0.0);
    bool _2714 = _2710 || _2712;
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2718 = _807 + _2716;
    bool _2720 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2722 = isnan(_807);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2732;
    bool _2736 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2738 = isnan(_807);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2744 = _2740 || _2742;
    float _2746 = float(_2744);
    float _2748 = fma(_2624, _2718, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2750 = _2714 ? 0 : 1;
    float _2752 = _2634 * _2664;
    bool _2754 = _2636 > 0.0;
    float _2756 = _2730 * _2690;
    float _2758 = -_2730;
    float _2760 = _2758 + 1.0;
    bool _2762 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2764 = isnan(_807);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2770 = _2766 || _2768;
    float _2772 = float(_2770);
    float _2774 = -_2746;
    float _2776 = _2774 + 1.0;
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2780 = _807 + _2778;
    float _2782 = _2746 * _2760;
    bool _2784 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2786 = isnan(_807);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = _2772 * _2776;
    float _2798 = fma(_2648, _2780, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2802 = _807 + _2800;
    float _2804 = in.m_62.w;
    float _2806 = -_2772;
    float _2808 = _2806 + 1.0;
    bool _2810 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2812 = isnan(_807);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2818 = _2814 || _2816;
    float _2820 = float(_2818);
    float _2822 = fma(_2628, _2802, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2824 = -_2794;
    float _2826 = _2824 + 1.0;
    int _2828 = _1964 >> 31;
    float _2830 = _2794 * _2808;
    float _2832 = -_2820;
    float _2834 = _2832 + 1.0;
    float _2836 = in.m_64.w;
    float _2838 = _2820 * _2826;
    float _2840 = _2734 * _2286;
    bool _2842 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2844 = isnan(_807);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2856 = _807 + _2854;
    int _2858 = _2828 & 3;
    float _2860 = -_2592;
    float _2862 = _2860 + 1.0;
    float _2864 = _2592 * _2834;
    float _2866 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2868 = _807 + _2866;
    float _2870 = fma(_2840, _2856, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2872 = _1964 + _2858;
    float _2874 = _2852 * _2862;
    float _2876 = fma(_2704, _2868, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2878 = -_2852;
    float _2880 = _2878 + 1.0;
    int _2882 = _2872 >> 2;
    float _2884 = _2670 * _2874;
    float _2886 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2888 = _807 + _2886;
    float _2890 = _994 + _986;
    int _2892 = _2882 << 4;
    int _2894 = _2892 + 656;
    float _2896 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2884);
    float _2898 = fma(_2752, _2888, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2900 = _2518 + _2804;
    float _2902 = _2532 + _1038;
    float _2904 = fma(_2748, _2864, _2896);
    uint _2906 = uint(int(uint(_2894) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    float _2922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2924 = _2900 + _2922;
    float _2926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2928 = _2902 + _2926;
    int _2930 = ~_2750;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = _2516 + _2836;
    float _2938 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2940 = _2934;
    float _2942 = _2782;
    if (!_2754)
    {
        int _2944 = ~_2750;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = fma(_2798, _2838, _2904);
    bool _2952 = !_1982;
    int _2954 = _2952 ? 0 : 1;
    float _2956 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2938);
    bool _2958 = _1980 != 3;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2962 = _2936 + _2960;
    float _2964 = _986 + _1008;
    float _2966 = _986 + (-0.5);
    bool _2968 = !_2958;
    int _2970 = _2968 ? 0 : (-1);
    float _2972 = fma(_2962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2956);
    float _2974 = fma(_2822, _2830, _2950);
    int _2976 = _2894 + 8;
    uint _2978 = uint(int(uint(_2976) >> uint(2)));
    uint _2980 = uint(int(uint(int(_2978)) >> uint(2)));
    int _2982 = int(_2978) & 3;
    float _2984 = (*spvDescriptorSet0.vp_c9)._m0[int(_2980)][_2982];
    int _2986 = int(_2978) + 1;
    uint _2988 = uint(int(uint(_2986) >> uint(2)));
    int _2990 = _2986 & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    float _2994 = _2890 + (-1.0);
    bool _2996 = _2972 >= 0.0;
    float _2998 = _1806 + 0.5;
    float _3000 = fma(_2870, _2796, _2974);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3004 = _994 + _1008;
    float _3006 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2456);
    float _3008 = _994 + (-0.5);
    float _3010 = _2396 + 0.5;
    float _3012 = _1976 + (-0.5);
    float _3014 = fma(_2876, _2782, _3000);
    float _3016 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2460);
    float _3018 = -_3012;
    float _3020 = -_2478;
    float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3020);
    int _3024 = ~_2252;
    int _3026 = _3024 + 1;
    int _3028 = _3026 + 1;
    float _3030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2996)
    {
        _2942 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3032 = _2942;
    float _3034 = fma(_2898, _2756, _3014);
    int _3036 = abs(_2954);
    float _3038 = -_2374;
    float _3040 = _3038 + 1.0;
    if (_2996)
    {
        float _3042 = _3032 * 5.0;
        _2270 = as_type<int>(_3042);
    }
    int _3044 = _2270;
    bool _3046 = !_2694;
    int _3048 = _3046 ? 0 : 1;
    float _3050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3052 = -_3040;
    float _3054 = fma(_3052, _1806, _3006);
    float _3056 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_2996)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9482 = as_type<float>(_3044);
        out.gl_Position.z = _9482;
    }
    int _3058 = abs(_3048);
    float _3060 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3034);
    int _3062 = _3028 * as_type<int>(_2920);
    float _3064 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3066 = int(_3064);
    float _3068 = -_2378;
    float _3070 = _3068 + 1.0;
    float _3072 = _3030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3074 = ~_3036;
    int _3076 = _3074 + 1;
    int _3078 = _3076 + 1;
    float _3080 = _1988 + (-0.5);
    float _3082 = fma(_3070, _1976, _3022);
    int _3084 = ~_2196;
    int _3086 = _3084 + _2226;
    int _3088 = _3086 + 1;
    float _3090 = _1754 + 0.5;
    int _3092 = _3078 * as_type<int>(_2912);
    int _3094 = _3092 + _3062;
    float _3096 = _2924 * _2924;
    float _3098 = fma(_3072, _3090, _2368);
    int _3100 = ~_2254;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    out.m_74.x = _3054;
    out.m_74.y = _3082;
    int _3106 = abs(_2970);
    float _3108 = _3050 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3110 = abs(_3066);
    int _3112 = _3104 * as_type<int>(_2984);
    int _3114 = _3112 + _3094;
    float _3116 = float(uint(_3066));
    float _3118 = -_3080;
    float _3120 = -_2476;
    float _3122 = fma(_3118, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3120);
    int _3124 = abs(_2126);
    int _3126 = _909 * _3088;
    int _3128 = _3126 + _1644;
    int _3130 = ~_3106;
    int _3132 = _3130 + 1;
    int _3134 = _3132 + 1;
    float _3136 = fma(_2928, _2928, _3096);
    float _3138 = 1.0 / _3116;
    int _3140 = ~_3124;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    float _3146 = _1508 + (-0.5);
    float _3148 = fma(_2962, _2962, _3136);
    int _3150 = _3134 * as_type<int>(_2992);
    int _3152 = _3150 + _3114;
    int _3154 = _2132 >> 31;
    float _3156 = -_3108;
    float _3158 = -_2490;
    float _3160 = fma(_3156, _3146, _3158);
    float _3162 = float(uint(_3110));
    float _3164 = rsqrt(_3148);
    int _3166 = _3152 * _3144;
    int _3168 = _1780 >> 31;
    out.m_76.x = _3060;
    int _3170 = _3154 & 3;
    int _3172 = _2686 * _3124;
    int _3174 = _3172 + _3166;
    int _3176 = _3168 & 3;
    if (_2996)
    {
        out.m_53.x = 0.0;
    }
    float _3178 = 1.0 / _3162;
    int _3180 = as_type<int>(_3138) + (-2);
    float _3182 = float(uint(_3174));
    int _3184 = _1780 + _3176;
    float _3186 = _3056 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3188 = _2132 + _3170;
    float _3190 = as_type<float>(_3180) * _3182;
    float _3192 = float(_2948);
    float _3194 = _3186 * _3164;
    int _3196 = _3184 >> 2;
    float _3198 = in.m_78.x;
    float _3200 = in.m_78.y;
    float _3202 = in.m_78.z;
    int _3204 = abs(_3174);
    float _3206 = _2924 * _3194;
    float _3208 = trunc(_3190);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    float _3214 = _2928 * _3194;
    int _3216 = as_type<int>(_3178) + (-2);
    float _3218 = -_3206;
    float _3220 = _2924 + _3218;
    int _3222 = _3196 << 4;
    int _3224 = _3222 + 368;
    float _3226 = -_3214;
    float _3228 = _2928 + _3226;
    int _3230 = _3188 >> 2;
    float _3232 = _3220 * _3220;
    uint _3234 = uint(int(uint(_3224) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    float _3250 = float(uint(_3204));
    float _3252 = fma(_3228, _3228, _3232);
    int _3254 = ~_3066;
    int _3256 = _3254 + 1;
    float _3258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3260 = _3230 << 4;
    int _3262 = _3260 + 800;
    float _3264 = as_type<float>(_3216) * _3250;
    float _3266 = float(_3058);
    int _3268 = _3256 * int(_3212);
    int _3270 = _3268 + _3174;
    uint _3272 = uint(int(uint(_3262) >> uint(2)));
    uint _3274 = uint(int(uint(int(_3272)) >> uint(2)));
    int _3276 = int(_3272) & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = int(_3272) + 1;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    int _3284 = _3280 & 3;
    float _3286 = (*spvDescriptorSet0.vp_c9)._m0[int(_3282)][_3284];
    int _3288 = abs(_2668);
    float _3290 = _3266 * _3192;
    float _3292 = -_2470;
    float _3294 = _3292 + 1.0;
    float _3296 = float(uint(_3270));
    float _3298 = trunc(_3264);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    float _3304 = -_2482;
    float _3306 = _3304 + 1.0;
    float _3308 = fma(_1988, _3294, _3122);
    float _3310 = _2962 * _3194;
    float _3312 = as_type<float>(_3180) * _3296;
    float _3314 = -_2540;
    float _3316 = fma(_2396, _3314, _3016);
    float _3318 = -_3306;
    float _3320 = fma(_1754, _3318, _3098);
    float _3322 = fma(_1508, _2558, _3160);
    float _3324 = _3290 * (-2.0);
    int _3326 = ~_3110;
    int _3328 = _3326 + 1;
    float _3330 = trunc(_3312);
    float _3332 = precise::max(_3330, 0.0);
    uint _3334 = uint(_3332);
    int _3336 = abs(_2030);
    float _3338 = fma(_3324, _3198, _3198);
    out.m_80.x = _3316;
    out.m_80.y = _3308;
    out.m_80.z = _3320;
    out.m_80.w = _3322;
    int _3340 = abs(_2136);
    float _3342 = -_3310;
    float _3344 = _2962 + _3342;
    int _3346 = _3328 * int(_3302);
    int _3348 = _3346 + _3204;
    float _3350 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3338);
    bool _3352 = _825 == 0;
    int _3354 = _3224 + 8;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    uint _3358 = uint(int(uint(int(_3356)) >> uint(2)));
    int _3360 = int(_3356) & 3;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[int(_3358)][_3360];
    int _3364 = int(_3356) + 1;
    uint _3366 = uint(int(uint(_3364) >> uint(2)));
    int _3368 = _3364 & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    float _3372 = float(_2604);
    float _3374 = fma(_3002, _3324, _3002);
    bool _3376 = !_3352;
    int _3378 = _3376 ? _2280 : (-1);
    float _3380 = fma(_3344, _3344, _3252);
    float _3382 = fma(_3374, _2506, _3350);
    int _3384 = int(_3212) + int(_3334);
    int _3386 = _3262 + 8;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    float _3404 = float(uint(_3348));
    int _3406 = abs(_1878);
    int _3408 = abs(_2182);
    float _3410 = as_type<float>(_3216) * _3404;
    int _3412 = ~_3066;
    int _3414 = _3412 + 1;
    int _3416 = ~_3406;
    int _3418 = _3416 + 1;
    int _3420 = _3418 + 1;
    float _3422 = trunc(_3410);
    float _3424 = precise::max(_3422, 0.0);
    uint _3426 = uint(_3424);
    bool _3428 = !_2148;
    int _3430 = _3428 ? 0 : 1;
    int _3432 = _3414 * _3384;
    int _3434 = _3432 + _3174;
    bool _3436 = _1822 != 3;
    int _3438 = _3420 * as_type<int>(_3248);
    int _3440 = ~_3408;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    bool _3446 = !_3436;
    int _3448 = _3446 ? 0 : (-1);
    bool _3450 = uint(_3434) >= uint(_3066);
    int _3452 = _3444 * as_type<int>(_3286);
    int _3454 = abs(_3430);
    int _3456 = ~_3110;
    int _3458 = _3456 + 1;
    int _3460 = int(_3302) + int(_3426);
    int _3462 = ~_3288;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    bool _3468 = !_3450;
    int _3470 = _3468 ? 0 : (-1);
    int _3472 = _3458 * _3460;
    int _3474 = _3472 + _3204;
    bool _3476 = _2146 != 3;
    int _3478 = _3466 * as_type<int>(_3240);
    int _3480 = _3478 + _3438;
    int _3482 = ~_3384;
    int _3484 = _3482 + _3470;
    int _3486 = _3484 + 1;
    int _3488 = ~_3454;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = abs(_2216);
    int _3496 = _3066 * _3486;
    int _3498 = _3496 + _3174;
    bool _3500 = !_3476;
    int _3502 = _3500 ? 0 : (-1);
    int _3504 = _3492 * as_type<int>(_3278);
    int _3506 = _3504 + _3452;
    int _3508 = abs(_1956);
    float _3510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3512 = uint(_3474) >= uint(_3110);
    int _3514 = ~_3494;
    int _3516 = _3514 + 1;
    int _3518 = _3516 + 1;
    int _3520 = _3174 ^ _3066;
    int _3522 = ~_3508;
    int _3524 = _3522 + 1;
    int _3526 = _3524 + 1;
    int _3528 = _3518 * as_type<int>(_3394);
    int _3530 = _3528 + _3506;
    bool _3532 = !_3512;
    int _3534 = _3532 ? 0 : (-1);
    int _3536 = abs(_3448);
    int _3538 = _3526 * as_type<int>(_3362);
    int _3540 = _3538 + _3480;
    uint _3542 = uint(int(uint(_3520) >> uint(31)));
    int _3544 = abs(_3502);
    int _3546 = ~_3534;
    int _3548 = _3460 + _3546;
    int _3550 = _3548 + 1;
    int _3552 = ~_3536;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    int _3558 = ~int(_3542);
    int _3560 = _3558 + 1;
    int _3562 = _3556 * as_type<int>(_3370);
    int _3564 = _3562 + _3540;
    int _3566 = ~_3544;
    int _3568 = _3566 + 1;
    int _3570 = _3568 + 1;
    bool _3572 = _3066 == 0;
    int _3574 = _3550 ^ _3560;
    int _3576 = _3570 * as_type<int>(_3402);
    int _3578 = _3576 + _3530;
    int _3580 = ~_3336;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    float _3586 = _3510 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3588 = ~_3340;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    bool _3594 = !_3572;
    int _3596 = _3594 ? _3498 : (-1);
    int _3598 = _3564 * _3584;
    bool _3600 = _3066 == 0;
    int _3602 = _3578 * _3592;
    int _3604 = ~_3560;
    int _3606 = _3604 + _3574;
    int _3608 = _3606 + 1;
    int _3610 = _3378 * _3336;
    int _3612 = _3610 + _3598;
    float _3614 = float(_3596);
    float _3616 = _1160 + (-0.5);
    bool _3618 = !_3600;
    int _3620 = _3618 ? _3608 : (-1);
    bool _3622 = !_2698;
    int _3624 = _3622 ? 0 : 1;
    float _3626 = fma(_3586, _3614, _2494);
    float _3628 = float(_3620);
    float _3630 = _3258 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3632 = !_1590;
    int _3634 = _3632 ? _3128 : (-1);
    int _3636 = abs(_3624);
    float _3638 = -_2502;
    float _3640 = fma(_3630, _3628, _3638);
    float _3642 = _1176 + 0.5;
    int _3644 = _3634 * _3340;
    int _3646 = _3644 + _3602;
    float _3648 = float(_3612);
    float _3650 = -_3630;
    float _3652 = fma(_3650, _3616, _3640);
    float _3654 = fma(_3586, _3642, _3626);
    float _3656 = float(_3646);
    float _3658 = -_2564;
    float _3660 = fma(_1176, _3658, _3654);
    float _3662 = fma(_1160, _2580, _3652);
    float _3664 = float(_3636);
    out.m_82.x = _3648;
    out.m_82.w = _3656;
    float _3666 = _3664 * _3372;
    bool _3668 = !_2702;
    int _3670 = _3668 ? 0 : 1;
    out.m_84.x = _3660;
    out.m_84.y = _3662;
    float _3672 = _3202;
    if (_2996)
    {
        return out;
    }
    float _3674 = -_3206;
    float _3676 = _2900 + _3674;
    float _3678 = -_3214;
    float _3680 = _2902 + _3678;
    float _3682 = -_3310;
    float _3684 = _2936 + _3682;
    int _3686 = abs(_3670);
    float _3688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3690 = _3676 + _3688;
    float _3692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3694 = _3680 + _3692;
    float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3698 = _3684 + _3696;
    float _3700 = _3004 + (-1.0);
    float _3702 = _3690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3704 = float(_2678);
    float _3706 = _2964 + (-1.0);
    float _3708 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3710 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3702);
    float _3712 = float(_3686);
    float _3714 = _3666 * (-2.0);
    float _3716 = _3382 * 0.15915493667125701904296875;
    float _3718 = fma(_3698, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3710);
    float _3720 = sqrt(_3380);
    float _3722 = fma(_3714, _3200, _3200);
    float _3724 = fma(_3708, _3714, _3708);
    float _3726 = _3712 * _3704;
    bool _3728 = _3718 >= 0.0;
    float _3730 = fma(_3008, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3722);
    float _3732 = _3726 * (-2.0);
    float _3734 = _3716 * 6.283185482025146484375;
    float _3736 = sin(_3734);
    float _3738 = fma(_3724, _2506, _3730);
    float _3740 = _1008 + (-0.5);
    float _3742 = fma(_3706, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3744 = fma(_3732, _3202, _3202);
    float _3746 = _3738 * 0.15915493667125701904296875;
    float _3748 = fma(_3742, _3732, _3742);
    float _3750 = _3716 * 6.283185482025146484375;
    float _3752 = cos(_3750);
    float _3754 = _3698;
    float _3756 = _3680;
    if (_3728)
    {
        _3672 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3758 = _3672;
    float _3760 = fma(_3740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3744);
    int _3762 = as_type<int>(_3758);
    if (_3728)
    {
        out.m_53.x = 0.0;
    }
    if (_3728)
    {
        float _3764 = _3758 * 5.0;
        _3762 = as_type<int>(_3764);
    }
    int _3766 = _3762;
    float _3768 = fma(_3748, _2506, _3760);
    float _3770 = _3746 * 6.283185482025146484375;
    float _3772 = sin(_3770);
    if (_3728)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10512 = as_type<float>(_3766);
        out.gl_Position.z = _10512;
    }
    float _3774 = _3768 * 0.15915493667125701904296875;
    float _3776 = _3746 * 6.283185482025146484375;
    float _3778 = cos(_3776);
    if (_3728)
    {
        return out;
    }
    float _3780 = _3774 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3786 = _3164 * _3720;
    float _3788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3790 = _3752 * _3778;
    float _3792 = _3736 * _3778;
    float _3794 = _3786 * _3784;
    float _3796 = _3056 * _3786;
    float _3798 = _3774 * 6.283185482025146484375;
    float _3800 = sin(_3798);
    float _3802 = _3752 * _3772;
    float _3804 = _3788 * _3794;
    float _3806 = _3736 * _3772;
    float _3808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _3810 = _3752 * _3782;
    float _3812 = _3736 * _3782;
    float _3814 = _3808 * _3796;
    float _3816 = _3778 * _3782;
    float _3818 = _3810 * _3804;
    float _3820 = _3772 * _3782;
    float _3822 = _3786 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3824 = _3822 * 0.5;
    float _3826 = fma(_3800, _3790, _3806);
    float _3828 = -_3792;
    float _3830 = fma(_3800, _3802, _3828);
    float _3832 = -_3804;
    float _3834 = _3800 * _3832;
    float _3836 = -_3802;
    float _3838 = fma(_3800, _3792, _3836);
    float _3840 = fma(_3826, _3814, _3818);
    float _3842 = _3812 * _3804;
    float _3844 = fma(_3816, _3814, _3834);
    float _3846 = fma(_3800, _3806, _3790);
    float _3848 = fma(_3830, _3824, _3840);
    float _3850 = fma(_3838, _3814, _3842);
    float _3852 = fma(_3820, _3824, _3844);
    float _3854 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3856 = fma(_3846, _3824, _3850);
    float _3858 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3860 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3862 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3854);
    float _3864 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3858);
    float _3866 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3860);
    float _3868 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3862);
    float _3870 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3864);
    float _3872 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3866);
    float _3874 = _3868 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3876 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3878 = _3676 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3880 = _2936 + _3874;
    float _3882 = _2902 + _3876;
    float _3884 = fma(_3680, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3878);
    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3888 = _3880 + _3886;
    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3892 = _3882 + _3890;
    float _3894 = fma(_3684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3884);
    float _3896 = _3888 * _3888;
    float _3898 = fma(_3892, _3892, _3896);
    float _3900 = _3872 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3902 = sqrt(_3898);
    float _3904 = _2900 + _3900;
    bool _3906 = _3902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3908 = _3884;
    float _3910 = _3872;
    float _3912 = _3900;
    if (!_3906)
    {
        _3908 = _3882;
    }
    float _3914 = _3908;
    float _3916 = _3914;
    if (!_3906)
    {
        _3910 = _3880;
    }
    float _3918 = _3910;
    float _3920 = _3918;
    if (!_3906)
    {
        _3912 = _3904;
    }
    float _3922 = _3912;
    bool _3924 = !_3906;
    float _3926 = _3922;
    if (!_3924)
    {
        float _3928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3932 = _3902 + _3930;
        float _3934 = _3904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3936 = rsqrt(_3898);
        float _3938 = _3932 * _3928;
        float _3940 = _3938 * 0.15915493667125701904296875;
        float _3942 = _3940 * 6.283185482025146484375;
        float _3944 = cos(_3942);
        float _3946 = _3940 * 6.283185482025146484375;
        float _3948 = sin(_3946);
        float _3950 = _3944 + (-1.0);
        float _3952 = fma(_3948, _3934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3956 = _3936 * _3952;
        float _3958 = fma(_3904, _3944, _3954);
        float _3960 = fma(_3892, _3956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3962 = fma(_3888, _3956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3926 = _3958;
        _3916 = _3960;
        _3920 = _3962;
    }
    float _3964 = _3926;
    float _3966 = _3916;
    float _3968 = _3920;
    float _3970 = -_2900;
    float _3972 = _3970 + _3964;
    float _3974 = -_2902;
    float _3976 = _3974 + _3966;
    float _3978 = -_2936;
    float _3980 = _3978 + _3968;
    float _3982 = _3894 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3984 = _3972 * _3972;
    float _3986 = _3676 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3988 = 1.0 / _3982;
    float _3990 = fma(_3976, _3976, _3984);
    bool _3992 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3994 = isnan(0.5);
    bool _3996 = _3992 || _3994;
    bool _3998 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4000 = _3996 || _3998;
    bool _4002 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4004 = isnan(0.5);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4010 = _4006 || _4008;
    float _4012 = fma(_3980, _3980, _3990);
    float _4014 = fma(_3680, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3986);
    float _4016 = sqrt(_4012);
    float _4018 = fma(_3684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4014);
    float _4020 = _4018 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4022 = _4020 + _3982;
    float _4024 = _4022 * _3988;
    float _4026 = _4024 * 0.5;
    bool _4028 = _4016 > 0.0;
    float _4030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4032 = fma(_4026, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4030);
    float _4034 = 1.0 / _4032;
    bool _4036 = !_4028;
    float _4038 = _3966;
    float _4040 = _3964;
    float _4042 = _3968;
    float _4044 = _3976;
    float _4046 = _3982;
    if (!_4036)
    {
        float _4048 = _237 * _237;
        float _4050 = rsqrt(_4012);
        float _4052 = fma(_235, _235, _4048);
        float _4054 = fma(_239, _239, _4052);
        float _4056 = sqrt(_4054);
        float _4058 = _3976 * _4050;
        float _4060 = _3972 * _4050;
        float _4062 = _3980 * _4050;
        bool _4064 = _4056 > 0.0;
        bool _4066 = !_4064;
        _4046 = _4056;
        if (!_4066)
        {
            float _4068 = rsqrt(_4054);
            float _4070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4072 = _237 * _4068;
            float _4074 = _235 * _4068;
            float _4076 = _4060 * _4072;
            float _4078 = _239 * _4068;
            float _4080 = fma(_4058, _4074, _4076);
            float _4082 = _4070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4084 = fma(_4062, _4078, _4080);
            float _4086 = _4084 * _4082;
            float _4088 = fma(_235, _4086, _3966);
            float _4090 = fma(_237, _4086, _3964);
            float _4092 = fma(_239, _4086, _3968);
            _4038 = _4088;
            _4040 = _4090;
            _4042 = _4092;
            _4044 = _4086;
            _4046 = _4078;
        }
    }
    float _4094 = _4038;
    float _4096 = _4040;
    float _4098 = _4042;
    float _4100 = _4044;
    float _4102 = _4046;
    float _4104 = -_3214;
    float _4106 = _4104 + _4094;
    float _4108 = -_3206;
    float _4110 = _4108 + _4096;
    float _4112 = -_3310;
    float _4114 = _4112 + _4098;
    float _4116 = _4102;
    float _4118 = _4110;
    float _4120 = _4106;
    float _4122 = _4114;
    float _4124 = _4100;
    if (_4010)
    {
        _4116 = 1.0;
    }
    float _4126 = _4116;
    float _4128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4130 = _4034 * _4128;
    float _4132 = _4126;
    if (!_4000)
    {
        float _4134 = _3690 * _3690;
        float _4136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4138 = -_2936;
        float _4140 = _4138 + _4098;
        float _4142 = -_2900;
        float _4144 = _4142 + _4096;
        float _4146 = fma(_3694, _3694, _4134);
        float _4148 = -_2902;
        float _4150 = _4148 + _4094;
        float _4152 = fma(_3698, _3698, _4146);
        float _4154 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4156 = sqrt(_4152);
        float _4158 = 1.0 / _3786;
        float _4160 = _4154 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4162 = precise::min(_4156, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4164 = _4162 * _4136;
        float _4166 = _4164 * _4158;
        float _4168 = _4160 * _4166;
        float _4170 = _4140 * _4166;
        float _4172 = fma(_4144, _4168, _3676);
        float _4174 = fma(_4150, _4168, _3680);
        float _4176 = fma(_4160, _4170, _3684);
        _4118 = _4172;
        _4120 = _4174;
        _4122 = _4176;
        _3754 = _4168;
    }
    float _4178 = _4118;
    float _4180 = _4120;
    float _4182 = _4122;
    float _4184 = _3754;
    float _4186 = _4184;
    if (!_4010)
    {
        float _4188 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4190 = _4188 * 0.15915493667125701904296875;
        float _4192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4194 = _4190 * 6.283185482025146484375;
        float _4196 = cos(_4194);
        float _4198 = _4192 * 0.15915493667125701904296875;
        float _4200 = _4190 * 6.283185482025146484375;
        float _4202 = sin(_4200);
        float _4204 = 1.0 / _4196;
        float _4206 = _4198 * 6.283185482025146484375;
        float _4208 = cos(_4206);
        float _4210 = _4202 * _4204;
        float _4212 = _4198 * 6.283185482025146484375;
        float _4214 = sin(_4212);
        float _4216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4218 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4216;
        float _4220 = _4208 * _4210;
        float _4222 = 1.0 / _4218;
        float _4224 = 1.0 / _4220;
        float _4226 = _4214 * _4224;
        float _4228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4230 = fma(_4130, _4226, _4228);
        float _4232 = _4230 * _4222;
        float _4234 = precise::clamp(_4232, 0.0, 1.0);
        _4186 = _4190;
        _4132 = _4234;
    }
    float _4236 = _4186;
    float _4238 = _4132;
    float _4240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4242 = _4178 + _4240;
    float _4244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4246 = _4180 + _4244;
    float _4248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4250 = _4182 + _4248;
    float _4252 = _4242 * _4242;
    float _4254 = fma(_4246, _4246, _4252);
    float _4256 = fma(_4250, _4250, _4254);
    float _4258 = rsqrt(_4256);
    float _4260 = sqrt(_4256);
    float _4262 = _4258 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4264 = _4246 * _4262;
    float _4266 = _4250 * _4262;
    float _4268 = _4264 * _4264;
    float _4270 = _4266 * _4266;
    float _4272 = _4268 + _4270;
    float _4274 = sqrt(_4272);
    bool _4276 = _4274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4280 = _4274 + _4278;
    float _4282 = _4250;
    float _4284 = _4272;
    float _4286 = _4280;
    float _4288 = _4236;
    if (_4276)
    {
        float _4290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4282 = _4290;
    }
    float _4292 = _4282;
    if (_4276)
    {
        float _4294 = rsqrt(_4272);
        _4284 = _4294;
    }
    float _4296 = _4284;
    float _4298 = _4296;
    if (_4276)
    {
        float _4300 = _4280 * _4292;
        _4286 = _4300;
    }
    float _4302 = _4286;
    if (_4276)
    {
        float _4304 = _4302 * 0.15915493667125701904296875;
        _4288 = _4304;
    }
    float _4306 = _4288;
    float _4308 = _4292;
    float _4310 = _4306;
    if (_4276)
    {
        float _4312 = _4306 * 6.283185482025146484375;
        float _4314 = sin(_4312);
        _4308 = _4314;
    }
    float _4316 = _4308;
    float _4318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4320 = precise::max(0.0, _4318);
    float _4322 = _4252;
    float _4324 = _4320;
    if (_4276)
    {
        float _4326 = _4306 * 6.283185482025146484375;
        float _4328 = cos(_4326);
        _4322 = _4328;
    }
    float _4330 = _4322;
    float _4332 = -_4262;
    float _4334 = -_4320;
    float _4336 = fma(_4242, _4332, _4334);
    float _4338 = _4336;
    if (_4276)
    {
        float _4340 = _4336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4324 = _4340;
    }
    float _4342 = _4324;
    float _4344 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4346 = _4342;
    if (!_4276)
    {
        _3756 = _4270;
    }
    float _4348 = _3756;
    float _4350 = _4316;
    float _4352 = _4348;
    if (_4276)
    {
        float _4354 = fma(_4316, _4342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4350 = _4354;
    }
    float _4356 = _4350;
    float _4358 = floor(_4344);
    float _4360 = _4356;
    if (_4276)
    {
        float _4362 = _4330 + (-1.0);
        _4346 = _4362;
    }
    float _4364 = _4346;
    float _4366 = _4364;
    if (_4276)
    {
        float _4368 = _4296 * _4356;
        _4124 = _4368;
    }
    float _4370 = _4124;
    if (!_4276)
    {
        _4360 = _4264;
    }
    float _4372 = _4360;
    float _4374 = _4372;
    if (_4276)
    {
        float _4376 = _4364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4310 = _4376;
    }
    float _4378 = _4310;
    if (_4276)
    {
        float _4380 = _4264 * _4370;
        _4374 = _4380;
    }
    float _4382 = _4374;
    if (!_4276)
    {
        _4366 = _4266;
    }
    float _4384 = _4366;
    float _4386 = _4384;
    if (_4276)
    {
        float _4388 = _4266 * _4370;
        _4386 = _4388;
    }
    float _4390 = _4386;
    if (!_4276)
    {
        _4298 = _4268;
    }
    float _4392 = _4298;
    float _4394 = _4392;
    if (_4276)
    {
        float _4396 = fma(_4336, _4330, _4378);
        _4338 = _4396;
    }
    float _4398 = _4338;
    if (_4276)
    {
        float _4400 = _4382 * _4382;
        _4394 = _4400;
    }
    float _4402 = _4394;
    if (_4276)
    {
        float _4404 = _4390 * _4390;
        _4352 = _4404;
    }
    float _4406 = _4352;
    float _4408 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4410 = fma(_4398, _4398, _4402);
    float _4412 = _4410 + _4406;
    float _4414 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4408);
    float _4416 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4418 = fma(_4260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4416);
    float _4420 = precise::clamp(_4418, 0.0, 1.0);
    float _4422 = rsqrt(_4412);
    float _4424 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4414);
    float _4426 = -_4420;
    float _4428 = _4426 + 1.0;
    float _4430 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4432 = _4424 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4434 = fma(_3684, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4436 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4438 = _4432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4440 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4442 = abs(_4428);
    float _4444 = log2(_4442);
    float _4446 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4436);
    float _4448 = -_4438;
    float _4450 = fma(_4448, _4430, 1.0);
    float _4452 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4454 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4440);
    float _4456 = _4422 * _4390;
    float _4458 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4446);
    float _4460 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4452);
    float _4462 = _4422 * _4382;
    float _4464 = _4422 * _4398;
    float _4466 = _4458 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4468 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4460);
    float _4470 = _4462 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4472 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4454);
    float _4474 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4476 = _4468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4478 = -_4470;
    float _4480 = fma(_4464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4478);
    float _4482 = floor(_4434);
    float _4484 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4486 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4474);
    float _4488 = -_4456;
    float _4490 = fma(_4488, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4480);
    float _4492 = _4472 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4494 = _4464 + 1.0;
    float _4496 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4486);
    float _4498 = fma(_4490, -0.5, 0.5);
    float _4500 = log2(_4450);
    float _4502 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4504 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4496);
    float _4506 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4502);
    float _4508 = 1.0 / _4504;
    float _4510 = -_4358;
    float _4512 = _4344 + _4510;
    float _4514 = fma(_4490, 0.5, 0.5);
    float _4516 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4518 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4506);
    float _4520 = -_4482;
    float _4522 = _4434 + _4520;
    float _4524 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4516);
    float _4526 = exp2(_4484);
    float _4528 = fma(_4514, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4530 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4518);
    float _4532 = sqrt(_4498);
    float _4534 = fma(_4514, _4528, -0.212114393711090087890625);
    float2 _11721 = float2(_4512, _4522);
    float _4536 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11721, float2(0.0), isnan(_11721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11721, float2(0.0), isnan(_11721)), level(0.0)).x;
    float _4538 = fma(_4514, _4534, 1.570728778839111328125);
    float _4540 = -_4464;
    float _4542 = fma(_4526, _4494, _4540);
    float _4544 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4524);
    float _4546 = _4530 * _4508;
    float _4548 = fma(_4542, 0.5, 0.5);
    float _4550 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4544);
    float _4552 = _4500 * 0.693147182464599609375;
    float _4554 = fma(_4546, 0.5, 0.5);
    float _4556 = _4532 * 0.636619746685028076171875;
    float _4558 = _4550 * _4508;
    float _4560 = _4552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4562 = -_4538;
    float _4564 = fma(_4556, _4562, 1.0);
    float _4566 = fma(_4558, -0.5, 0.5);
    float3 _11779 = float3(_4554, _4566, _4560);
    float _4568 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11779, float3(0.0), isnan(_11779)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11779, float3(0.0), isnan(_11779)), level(0.0)).x;
    float3 _11790 = float3(_4554, _4566, _4560);
    float4 _4571 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11790, float3(0.0), isnan(_11790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11790, float3(0.0), isnan(_11790)), level(0.0)).xyzw;
    float _4573 = _4571.x;
    float _4575 = _4571.y;
    float _4577 = _4571.z;
    float _4579 = _4571.w;
    float2 _11806 = float2(_4564, _4548);
    float3 _4583 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11806, float2(0.0), isnan(_11806)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11806, float2(0.0), isnan(_11806)), level(0.0)).xyz;
    float _4585 = _4583.x;
    float _4587 = _4583.y;
    float _4589 = _4583.z;
    float _4591 = abs(_4130);
    float _4593 = log2(_4591);
    float _4595 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4597 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4599 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4601 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4603 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4595);
    float _4605 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4597);
    float _4607 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4599);
    float _4609 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4611 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4613 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4615 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4617 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4619 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4621 = -_3800;
    float _4623 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4601);
    float _4625 = -_3800;
    float _4627 = fma(_4625, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4615);
    float _4629 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4631 = -_3800;
    float _4633 = fma(_4631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4609);
    float _4635 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4611);
    float _4637 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4613);
    float _4639 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4617);
    float _4641 = fma(_4619, _4619, 1.0);
    float _4643 = exp2(_4629);
    float _4645 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4633);
    float _4647 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4623);
    float _4649 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4627);
    float _4651 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4603);
    float _4653 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4605);
    float _4655 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4607);
    float _4657 = rsqrt(_4641);
    float _4659 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4661 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4663 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4635);
    float _4665 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4637);
    float _4667 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4639);
    float _4669 = _4619 * _4647;
    out.m_86.x = _4651;
    out.m_86.y = _4653;
    out.m_86.z = _4655;
    float _4671 = fma(_4643, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4673 = precise::clamp(_4671, 0.0, 1.0);
    float _4675 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4677 = exp2(_4661);
    float _4679 = fma(_4659, _4651, _4669);
    bool _4681 = _4130 <= 8000.0;
    bool _4683 = isnan(_4130);
    bool _4685 = _4681 || _4683;
    bool _4687 = isnan(8000.0);
    bool _4689 = _4685 || _4687;
    float _4691 = float(_4689);
    float _4693 = fma(_4673, -2.0, 3.0);
    float _4695 = _4673 * _4673;
    float _4697 = _4619 * _4657;
    float _4699 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4675);
    bool _4701 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4703 = isnan(_4260);
    bool _4705 = _4701 || _4703;
    bool _4707 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4709 = _4705 || _4707;
    float _4711 = _4695 * _4693;
    float _4713 = _4619 * _4649;
    float _4715 = _4619 * _4645;
    float _4717 = -_4663;
    float _4719 = _4697 * _4717;
    float _4721 = -_4711;
    float _4723 = _4721 + 1.0;
    float _4725 = fma(_4659, _4653, _4713);
    float _4727 = -_4667;
    float _4729 = _4697 * _4727;
    float _4731 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4711);
    float _4733 = -_4665;
    float _4735 = _4697 * _4733;
    float _4737 = fma(_4657, _4645, _4729);
    float _4739 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4699);
    float _4741 = in.m_88.x;
    float _4743 = fma(_4657, _4647, _4719);
    float _4745 = _4691 * _4731;
    float _4747 = fma(_4657, _4649, _4735);
    float _4749 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4739);
    float _4751 = _4504 * 0.5;
    float _4753 = -_4677;
    float _4755 = _4753 + 1.0;
    float _4757 = _4745 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4759 = _4749 + _4504;
    float _4761 = _4530 + _4504;
    float _4763 = fma(_4550, -0.5, _4751);
    float _4765 = _4755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4767 = _4759 * 0.5;
    float _4769 = _4761 * 0.5;
    out.gl_Position.x = _4530;
    out.gl_Position.y = _4550;
    out.gl_Position.z = _4749;
    out.gl_Position.w = _4504;
    float _4771 = fma(_4659, _4655, _4715);
    float _4773 = _4663 + _4679;
    float _4775 = _4665 + _4725;
    out.m_90.x = _4769;
    out.m_90.y = _4763;
    out.m_90.z = _4767;
    out.m_90.w = _4504;
    float _4777 = _4667 + _4771;
    out.m_92.x = _4743;
    out.m_92.y = _4747;
    out.m_92.z = _4737;
    out.m_94.x = _4773;
    out.m_94.y = _4775;
    out.m_94.z = _4777;
    float _4779 = -_4765;
    float _4781 = _4779 + 1.0;
    float _4783 = _4504;
    float _4785 = _4749;
    float _4787 = _4550;
    float _4789 = _4781;
    if (!_4709)
    {
        _4783 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4791 = _4783;
    float _4793 = _4791;
    float _4795 = _4791;
    if (!_4709)
    {
        _4785 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4797 = _4785;
    float _4799 = _4797;
    float _4801 = _4797;
    if (!_4709)
    {
        _4787 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4803 = _4787;
    float _4805 = -_4536;
    float _4807 = _4805 + 1.0;
    float _4809 = _4807 * _4757;
    float _4811 = precise::clamp(_4809, 0.0, 1.0);
    float _4813 = -_4811;
    float _4815 = fma(_4813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4817 = _4815 * _4741;
    float _4819 = _4817 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4819;
    float _4821 = _4765 * _4568;
    float _4823 = _4579 * _4781;
    float _4825 = _4575;
    float _4827 = _4573;
    float _4829 = _4803;
    float _4831 = _4803;
    if (!_4709)
    {
        _4789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4833 = _4789;
    float _4835 = _4579 * _4821;
    float _4837 = _4589 * _4821;
    float _4839 = fma(_4585, _4835, _4573);
    float _4841 = fma(_4587, _4835, _4575);
    float _4843 = fma(_4579, _4837, _4577);
    float _4845 = _4238 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4847 = _4833;
    float _4849 = _4833;
    if (!_4709)
    {
        _4825 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4851 = _4825;
    float _4853 = _4851;
    float _4855 = _4851;
    if (!_4709)
    {
        _4827 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4857 = _4827;
    out.m_98.x = _4839;
    out.m_98.y = _4841;
    out.m_98.z = _4843;
    out.m_98.w = _4823;
    bool _4859 = !_4709;
    float _4861 = _4857;
    float _4863 = _4857;
    if (!_4859)
    {
        bool _4865 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4867 = isnan(_4260);
        bool _4869 = _4865 || _4867;
        bool _4871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4873 = _4869 || _4871;
        if (!_4873)
        {
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4877 = _4260 + _4875;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4881 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4879;
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4887 = 1.0 / _4881;
            float _4889 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4893 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4903 = _4901 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4905 = _4877 * _4887;
            float _4907 = precise::clamp(_4905, 0.0, 1.0);
            float _4909 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4913 = fma(_4907, _4885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4915 = fma(_4907, _4911, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4917 = fma(_4907, _4891, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4919 = fma(_4907, _4895, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4921 = fma(_4907, _4899, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4923 = fma(_4907, _4903, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4863 = _4917;
            _4831 = _4921;
            _4855 = _4913;
            _4801 = _4919;
            _4795 = _4915;
            _4849 = _4923;
            _4925 = true;
        }
        else
        {
            bool _4927 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4929 = isnan(_4260);
            bool _4931 = _4927 || _4929;
            bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4935 = _4931 || _4933;
            if (!_4935)
            {
                _4853 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4937 = _4853;
            _4855 = _4937;
            if (!_4935)
            {
                _4861 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4939 = _4861;
            _4863 = _4939;
            if (!_4935)
            {
                _4793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4941 = _4793;
            _4795 = _4941;
            if (!_4935)
            {
                _4799 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4943 = _4799;
            _4801 = _4943;
            if (!_4935)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4945 = _4829;
            _4831 = _4945;
            if (!_4935)
            {
                _4847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4947 = _4847;
            bool _4949 = !_4935;
            _4849 = _4947;
            if (!_4949)
            {
                bool _4951 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4953 = isnan(_4260);
                bool _4955 = _4951 || _4953;
                bool _4957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4959 = _4955 || _4957;
                if (!_4959)
                {
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4963 = _4260 + _4961;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4967 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4965;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4973 = 1.0 / _4967;
                    float _4975 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4977 = _4975 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4979 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4981 = _4979 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4991 = _4963 * _4973;
                    float _4993 = precise::clamp(_4991, 0.0, 1.0);
                    float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4999 = fma(_4993, _4971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5001 = fma(_4993, _4997, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5003 = fma(_4993, _4977, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5005 = fma(_4993, _4981, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5007 = fma(_4993, _4985, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5009 = fma(_4993, _4989, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4863 = _5003;
                    _4831 = _5007;
                    _4855 = _4999;
                    _4801 = _5005;
                    _4795 = _5001;
                    _4849 = _5009;
                    _4925 = true;
                }
                else
                {
                    _4863 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4855 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4801 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4925 = false;
    float _5011 = _4863;
    float _5013 = _4831;
    float _5015 = _4855;
    float _5017 = _4801;
    float _5019 = _4795;
    float _5021 = _4849;
    float _5023 = _4845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5025 = fma(_4775, -0.5, 0.5);
    float _5027 = precise::clamp(_5025, 0.0, 1.0);
    float _5029 = -_5011;
    float _5031 = _5029 + _5013;
    float _5033 = -_5015;
    float _5035 = _5033 + _5017;
    out.m_100.x = 0.0;
    float _5037 = fma(_5027, _5031, _5011);
    float _5039 = -_5019;
    float _5041 = _5039 + _5021;
    float _5043 = fma(_5027, _5035, _5015);
    float _5045 = _5037 * 0.586610972881317138671875;
    bool _5047 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5049 = fma(_5027, _5041, _5019);
    out.m_53.x = _5023;
    float _5051 = fma(_5043, 0.298911988735198974609375, _5045);
    bool _5053 = _4238 > 0.0;
    bool _5055 = isnan(_4238);
    bool _5057 = _5053 || _5055;
    bool _5059 = isnan(0.0);
    bool _5061 = _5057 || _5059;
    float _5063 = fma(_5049, 0.114477999508380889892578125, _5051);
    float _5065 = -_5063;
    float _5067 = _5043 + _5065;
    float _5069 = -_5063;
    float _5071 = _5037 + _5069;
    float _5073 = -_5063;
    float _5075 = _5049 + _5073;
    float _5077 = fma(_5067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    float _5079 = fma(_5071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    float _5081 = fma(_5075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    bool _5083 = !_5047;
    if (!_5083)
    {
        float _5085 = -_4178;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5089 = -_4180;
        float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5093 = -_4182;
        float _5095 = _5093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5097 = _5087 * _5087;
        float _5099 = fma(_5091, _5091, _5097);
        float _5101 = fma(_5095, _5095, _5099);
        float _5103 = sqrt(_5101);
        float _5105 = rsqrt(_5101);
        float _5107 = -_5103;
        float _5109 = _5107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5111 = _5109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5113 = precise::clamp(_5111, 0.0, 1.0);
        float _5115 = _5091 * _5105;
        float _5117 = _5087 * _5105;
        float _5119 = abs(_5113);
        float _5121 = log2(_5119);
        float _5123 = _5095 * _5105;
        float _5125 = _5115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5127 = _4775 * _5117;
        float _5129 = -_5117;
        float _5131 = -_5125;
        float _5133 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5131);
        float _5135 = fma(_4773, _5115, _5127);
        float _5137 = -_5123;
        float _5139 = fma(_5137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5133);
        float _5141 = fma(_4777, _5123, _5135);
        float _5143 = precise::clamp(_5141, 0.0, 1.0);
        float _5145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5147 = _5139 + _5145;
        float _5149 = _5121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5151 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5153 = precise::clamp(_5151, 0.0, 1.0);
        float _5155 = exp2(_5149);
        float _5157 = _5155 * _5153;
        float _5159 = _5143 * _5157;
        float _5161 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5163 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5165 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5161;
        out.m_100.y = _5163;
        out.m_100.z = _5165;
    }
    out.m_102.x = _5077;
    out.m_102.y = _5079;
    out.m_102.z = _5081;
    if (_5061)
    {
        return out;
    }
    float _5167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5167;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4925 = false;
    bool _631 = false;
    bool _449 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5235 = as_type<float>(_145);
        out.gl_Position.z = _5235;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5298 = as_type<float>(_177);
        out.gl_Position.z = _5298;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_211;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _183 * _189;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _219);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    bool _229 = !_207;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = fma(_181, _199, _225);
    float _235 = fma(_185, _191, _223);
    float _237 = fma(_185, _197, _227);
    float _239 = fma(_185, _203, _233);
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _263 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _279;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _305 = 1.0 / _287;
    float _307 = 1.0 / _283;
    float _309 = _267 * _301;
    bool _311 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_263);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -_299;
    float _325 = _323 + 1.0;
    float _327 = _321 * _325;
    float _329 = _271 * _305;
    bool _331 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_263);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_321;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _341 * _345;
    float _353 = -_341;
    float _355 = _353 + 1.0;
    float _357 = _275 * _307;
    bool _359 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _361 = isnan(_263);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = fma(_349, _357, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = fma(_373, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = _369 * _355;
    float _389 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_383, _357, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = -_369;
    float _395 = _393 + 1.0;
    float _397 = _385 * _387;
    float _399 = _389 * _387;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _413 = fma(_403, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _415 = fma(_375, _351, _405);
    float _417 = fma(_409, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_391, _351, _411);
    float _421 = fma(_413, _327, _415);
    float _423 = fma(_417, _327, _419);
    float _425 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _421);
    float _427 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _423);
    bool _429 = !_303;
    float _447;
    if (!_429)
    {
        float _431 = in.m_66.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _171;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _467 = isnan(_451);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _481 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = isnan(_451);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _459;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -_475;
    float _501 = _499 + 1.0;
    bool _503 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _505 = isnan(_451);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _517 = 1.0 / _463;
    float _519 = 1.0 / _479;
    float _521 = _497 * _493;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _527 = _491 * _501;
    float _529 = -_491;
    float _531 = _529 + 1.0;
    float _533 = fma(_521, _455, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _535;
    float _539 = _513 * _531;
    float _541 = _525 * _517;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _451 + _543;
    bool _547 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _549 = isnan(_451);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = _533 * _539;
    float _561 = -_513;
    float _563 = _561 + 1.0;
    float _565 = fma(_541, _545, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _451 + _567;
    float _571 = _537 * _519;
    float _573 = -_557;
    float _575 = _573 + 1.0;
    float _577 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[115].x, _559);
    float _579 = fma(_571, _569, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _581 = _475 * _575;
    float _583 = fma(_565, _527, _577);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _587 = fma(_579, _581, _583);
    float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _591 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[118].x, _587);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _595 = in.m_68.x;
    float _597 = in.m_68.y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _601 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _603 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _589;
    out.m_70.y = _603;
    out.m_70.z = _605;
    out.m_70.w = _601;
    float _607 = _427 * _597;
    float _609 = _425 * _595;
    bool _611 = !_515;
    float _629;
    if (!_611)
    {
        float _613 = in.m_66.x;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _617 = _613 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        _629 = _171;
    }
    _631 = false;
    float _633 = _629;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _637 = _633 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _643 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _645 = isnan(_633);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _663 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _665 = isnan(_633);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = 1.0 / _641;
    float _677 = -_653;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _681;
    bool _685 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _687 = isnan(_633);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = _673 * _679;
    float _699 = -_673;
    float _701 = _699 + 1.0;
    bool _703 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _705 = 1.0 / _657;
    float _707 = _695 * _701;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _661;
    float _715 = _683 * _675;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _719 = _717 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _721 = fma(_715, _637, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _723 = _719 * _705;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _727 = _633 + _725;
    bool _729 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _731 = isnan(_633);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _741;
    float _745 = _721 * _707;
    float _747 = fma(_723, _727, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = _633 + _749;
    float _753 = -_739;
    float _755 = _753 + 1.0;
    float _757 = _743 * _713;
    float _759 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[131].x, _745);
    float _761 = _653 * _755;
    float _763 = fma(_757, _751, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _765 = fma(_747, _697, _759);
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _769 = fma(_763, _761, _765);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _777 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[134].x, _769);
    float _779 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _777 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _773;
    out.m_72.y = _779;
    out.m_72.z = _781;
    out.m_72.w = _783;
    bool _785 = !_703;
    float _787 = _781;
    float _789 = _783;
    if (!_785)
    {
        float _791 = in.m_66.x;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _795 = _791 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _799 = _797 * _793;
        float _801 = floor(_799);
        float _803 = -_801;
        float _805 = _799 + _803;
        _173 = _805;
    }
    float _807 = _173;
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _811 = int(_809);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _819 = int(_817);
    float _821 = float(_811);
    float _823 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _825 = int(_823);
    if (_815)
    {
        _787 = 1.0;
    }
    float _827 = _787;
    float _829 = _827;
    if (_815)
    {
        _789 = 1.0;
    }
    float _831 = _789;
    int _833 = 0;
    float _835 = _831;
    if (_815)
    {
        _833 = 0;
    }
    int _837 = _833;
    float _839 = float(_819);
    float _841 = 1.0 / _821;
    float _843 = 1.0 / _839;
    float _845 = float(uint(_825));
    int _847 = ~_825;
    int _849 = _847 + 1;
    float _851 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _853 = int(_851);
    float _855 = _841 * _127;
    float _857 = _841;
    float _859 = _839;
    int _861 = _837;
    if (_815)
    {
        float _863 = in.m_66.x;
        float _865 = in.m_66.y;
        _857 = _863;
        _859 = _865;
    }
    float _867 = _857;
    float _869 = _859;
    float _871 = _843 * _127;
    float _873 = 1.0 / _845;
    float _875 = float(uint(_853));
    float _877 = trunc(_855);
    int _879 = int(_877);
    float _881 = 1.0 / _875;
    int _883 = as_type<int>(_873) + (-2);
    float _885 = 0.0;
    float _887 = _867;
    float _889 = _869;
    if (_815)
    {
        _885 = _869;
    }
    float _891 = _885;
    float _893 = trunc(_871);
    int _895 = int(_893);
    float _897 = float(uint(_879));
    float _899 = as_type<float>(_883) * _897;
    float _901 = _897;
    float _903 = _891;
    if (_815)
    {
        _901 = _867;
    }
    float _905 = _901;
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _909 = int(_907);
    int _911 = as_type<int>(_881) + (-2);
    float _913 = 0.0;
    float _915 = _905;
    if (_815)
    {
        _913 = _905;
    }
    float _917 = _913;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _921 = int(_919);
    float _923 = float(uint(_895));
    float _925 = as_type<float>(_911) * _923;
    int _927 = as_type<int>(_923);
    float _929 = _917;
    if (_815)
    {
        _927 = 0;
    }
    int _931 = _927;
    float _933 = trunc(_899);
    float _935 = precise::max(_933, 0.0);
    uint _938 = uint(_935);
    float _940 = float(uint(_909));
    float _942 = 1.0 / _940;
    float _944 = float(_921);
    float _946 = trunc(_925);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    float _952 = 1.0 / _944;
    float _954 = _944;
    int _956 = _931;
    if (_815)
    {
        _954 = _905;
    }
    float _958 = _954;
    float _960 = _958;
    if (!_815)
    {
        float _962 = in.m_66.x;
        float _964 = in.m_66.y;
        float _966 = in.m_66.z;
        float _968 = _962 * 3.1415927410125732421875;
        float _970 = _968 * 0.15915493667125701904296875;
        float _972 = _964 * 3.1415927410125732421875;
        float _974 = _972 * 0.15915493667125701904296875;
        float _976 = _970 * 6.283185482025146484375;
        float _978 = sin(_976);
        float _980 = _974 * 6.283185482025146484375;
        float _982 = sin(_980);
        _829 = 7.345489978790283203125;
        _887 = _962;
        _835 = 5.839270114898681640625;
        _960 = _966;
        _915 = _964;
        _889 = _964;
        _956 = 1;
        _929 = _978;
        _903 = _982;
        _861 = 2;
    }
    float _984 = _829;
    float _986 = _887;
    float _988 = _835;
    float _990 = _960;
    float _992 = _915;
    float _994 = _889;
    int _996 = _956;
    float _998 = _929;
    float _1000 = _903;
    int _1002 = _861;
    int _1004 = _849 * int(_938);
    int _1006 = _1004 + _879;
    float _1008 = in.m_66.z;
    float _1010 = in.m_66.w;
    int _1012 = ~_853;
    int _1014 = _1012 + 1;
    float _1016 = _984 * _986;
    float _1018 = _988 * _990;
    float _1020 = float(uint(_1006));
    float _1022 = _984 * _992;
    int _1024 = _1014 * int(_950);
    int _1026 = _1024 + _895;
    float _1028 = floor(_1016);
    int _1030 = as_type<int>(_942) + (-2);
    float _1032 = as_type<float>(_883) * _1020;
    float _1034 = _952 * _127;
    float _1036 = float(uint(_1026));
    float _1038 = in.m_60.w;
    float _1040 = float(_825);
    float _1042 = floor(_1018);
    float _1044 = as_type<float>(_911) * _1036;
    float _1046 = float(_879);
    bool _1048 = _994 > 0.5;
    bool _1050 = _1046 >= _1040;
    bool _1052 = isnan(_1046);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(_1040);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    float _1062 = trunc(_1034);
    int _1064 = int(_1062);
    bool _1066 = _1010 > 0.5;
    float _1068 = -_1028;
    float _1070 = _1016 + _1068;
    bool _1072 = _1008 > 0.5;
    float _1074 = _1070 * _1040;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1078 = _1076 != 0;
    float _1080 = trunc(_1044);
    float _1082 = precise::max(_1080, 0.0);
    uint _1084 = uint(_1082);
    float _1086 = -_1042;
    float _1088 = _1018 + _1086;
    int _1090 = ~_853;
    int _1092 = _1090 + 1;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1100 = _1098 != 0;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1104 = _1102 != 0;
    float _1106 = -_217;
    int _1108 = _1072 ? as_type<int>(_1106) : as_type<int>(_217);
    float _1110 = trunc(_1032);
    float _1112 = precise::max(_1110, 0.0);
    uint _1114 = uint(_1112);
    float _1116 = float(uint(_1064));
    int _1118 = int(_1066);
    int _1120 = _1072 ? 2 : 0;
    int _1122 = _1118 | _1120;
    int _1124 = _1078 ? 4 : 0;
    int _1126 = _1122 | _1124;
    int _1128 = _1096 ? 8 : 0;
    int _1130 = _1126 | _1128;
    int _1132 = _1100 ? 16 : 0;
    int _1134 = _1130 | _1132;
    int _1136 = _1104 ? 32 : 0;
    int _1138 = _1134 | _1136;
    int _1140 = _1048 ? 64 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _1142 & 64;
    float _1146 = as_type<float>(_1030) * _1116;
    float _1148 = -_231;
    int _1150 = _1048 ? as_type<int>(_1148) : as_type<int>(_231);
    float _1152 = trunc(_1060);
    int _1154 = int(_1152);
    int _1156 = int(_950) + int(_1084);
    bool _1158 = !_1104;
    float _1160 = _1158 ? _217 : as_type<float>(_1108);
    float _1162 = float(_853);
    bool _1164 = !_1078;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = trunc(_1146);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    bool _1174 = !_1100;
    float _1176 = _1174 ? _231 : as_type<float>(_1150);
    int _1178 = int(_938) + int(_1114);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1190 = _1188 != 0;
    int _1192 = _1092 * _1156;
    int _1194 = _1192 + _895;
    int _1196 = ~_825;
    int _1198 = _1196 + 1;
    float _1200 = floor(_1022);
    float _1202 = float(_895);
    bool _1204 = !_1186;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = _1198 * _1178;
    int _1210 = _1208 + _879;
    bool _1212 = uint(_1194) >= uint(_853);
    float _1214 = _1088 * _1162;
    bool _1216 = !_1182;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1222 = log2(_1220);
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1226 = _1224 != 0;
    bool _1228 = uint(_1210) >= uint(_825);
    bool _1230 = _1202 >= _1162;
    bool _1232 = isnan(_1202);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(_1162);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    bool _1242 = !_1190;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = trunc(_1214);
    int _1248 = int(_1246);
    bool _1250 = !_1226;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = -_1200;
    float _1256 = _1022 + _1254;
    bool _1258 = !_1212;
    int _1260 = _1258 ? 0 : (-1);
    bool _1262 = !_1228;
    int _1264 = _1262 ? 0 : (-1);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1276 = _1274 != 0;
    float _1278 = trunc(_1074);
    int _1280 = int(_1278);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1284 = _1282 != 0;
    int _1286 = ~_909;
    int _1288 = _1286 + 1;
    int _1290 = ~_1156;
    int _1292 = _1290 + _1260;
    int _1294 = _1292 + 1;
    int _1296 = ~_1178;
    int _1298 = _1296 + _1264;
    int _1300 = _1298 + 1;
    float _1302 = trunc(_1240);
    int _1304 = int(_1302);
    int _1306 = abs(_1166);
    int _1308 = _1288 * int(_1172);
    int _1310 = _1308 + _1064;
    bool _1312 = !_1284;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _853 * _1294;
    int _1318 = _1316 + _895;
    bool _1320 = _825 == 0;
    int _1322 = abs(_1314);
    int _1324 = _1280 * _1306;
    int _1326 = _1324 + _879;
    float _1328 = float(uint(_1310));
    int _1330 = _825 * _1300;
    int _1332 = _1330 + _879;
    bool _1334 = !_1272;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1248 * _1322;
    int _1340 = _1338 + _895;
    float _1342 = _167 * _127;
    bool _1344 = !_1268;
    int _1346 = _1344 ? 0 : 1;
    bool _1348 = _1144 != 0;
    float _1350 = _1040 * _1342;
    bool _1352 = _853 == 0;
    float _1354 = as_type<float>(_1030) * _1328;
    int _1356 = ~_1154;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = _1162 * _1342;
    bool _1364 = !_1320;
    int _1366 = _1364 ? _1332 : (-1);
    float _1368 = trunc(_1350);
    int _1370 = int(_1368);
    int _1372 = ~_1304;
    int _1374 = _1372 + 1;
    int _1376 = _1374 + 1;
    bool _1378 = !_1352;
    int _1380 = _1378 ? _1318 : (-1);
    int _1382 = _1366 * _1360;
    int _1384 = _825 + (-1);
    int _1386 = _853 + (-1);
    float _1388 = trunc(_1354);
    float _1390 = precise::max(_1388, 0.0);
    uint _1392 = uint(_1390);
    int _1394 = _1380 * _1376;
    int _1396 = abs(_1336);
    int _1398 = _1154 * _1384;
    int _1400 = _1398 + _1382;
    int _1402 = abs(_1206);
    int _1404 = _1304 * _1386;
    int _1406 = _1404 + _1394;
    int _1408 = abs(_1218);
    int _1410 = _1400 * _1402;
    float _1412 = trunc(_1362);
    int _1414 = int(_1412);
    int _1416 = ~_909;
    int _1418 = _1416 + 1;
    int _1420 = _1406 * _1396;
    int _1422 = abs(_1244);
    int _1424 = _1370 * _1408;
    int _1426 = _1424 + _1410;
    int _1428 = abs(_1252);
    int _1430 = int(_1172) + int(_1392);
    int _1432 = _1326 * _1422;
    int _1434 = _1432 + _1426;
    int _1436 = abs(_1346);
    int _1438 = _1418 * _1430;
    int _1440 = _1438 + _1064;
    float _1442 = -_217;
    int _1444 = _1066 ? as_type<int>(_1442) : as_type<int>(_217);
    int _1446 = _1280 * _1428;
    int _1448 = _1446 + _1434;
    bool _1450 = !_1276;
    int _1452 = _1450 ? 0 : 1;
    int _1454 = _1414 * _1436;
    int _1456 = _1454 + _1420;
    bool _1458 = uint(_1440) >= uint(_909);
    float _1460 = float(uint(_1448));
    float _1462 = float(_909);
    float _1464 = -_231;
    int _1466 = _1072 ? as_type<int>(_1464) : as_type<int>(_231);
    float _1468 = float(_1064);
    float _1470 = _1462 * _1342;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1474 = _1472 != 0;
    float _1476 = _1256 * _1462;
    int _1478 = abs(_1452);
    float _1480 = as_type<float>(_883) * _1460;
    bool _1482 = _1468 >= _1462;
    bool _1484 = isnan(_1468);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1462);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = trunc(_1470);
    int _1496 = int(_1494);
    bool _1498 = !_1474;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = _1340 * _1478;
    int _1504 = _1502 + _1456;
    bool _1506 = !_1096;
    float _1508 = _1506 ? _217 : as_type<float>(_1444);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1512 = _1510 != 0;
    int _1514 = abs(_1500);
    float _1516 = trunc(_1480);
    float _1518 = precise::max(_1516, 0.0);
    uint _1520 = uint(_1518);
    bool _1522 = !_1458;
    int _1524 = _1522 ? 0 : (-1);
    bool _1526 = !_1512;
    int _1528 = _1526 ? 0 : 1;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1544 = _1542 != 0;
    int _1546 = ~_1430;
    int _1548 = _1546 + _1524;
    int _1550 = _1548 + 1;
    float _1552 = trunc(_1492);
    int _1554 = int(_1552);
    bool _1556 = !_1536;
    int _1558 = _1556 ? 0 : 1;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1562 = _1560 != 0;
    int _1564 = _1248 * _1514;
    int _1566 = _1564 + _1504;
    int _1568 = ~_825;
    int _1570 = _1568 + 1;
    int _1572 = _909 * _1550;
    int _1574 = _1572 + _1064;
    bool _1576 = !_1532;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = trunc(_1476);
    int _1582 = int(_1580);
    float _1584 = float(uint(_1566));
    int _1586 = _1570 * int(_1520);
    int _1588 = _1586 + _1448;
    bool _1590 = _909 == 0;
    int _1592 = abs(_1558);
    float _1594 = as_type<float>(_911) * _1584;
    float _1596 = float(uint(_1588));
    float _1598 = _1584;
    float _1600 = as_type<float>(_1520);
    float _1602 = _1354;
    float _1604 = as_type<float>(_1002);
    if (_1562)
    {
        float _1606 = in.m_66.w;
        _1598 = _1606;
    }
    float _1608 = _1598;
    int _1610 = ~_1554;
    int _1612 = _1610 + 1;
    int _1614 = _1612 + 1;
    float _1616 = trunc(_1594);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    bool _1622 = !_1590;
    int _1624 = _1622 ? _1574 : (-1);
    float _1626 = as_type<float>(_883) * _1596;
    int _1628 = abs(_1528);
    int _1630 = abs(_1578);
    int _1632 = _1624 * _1614;
    int _1634 = _909 + (-1);
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = _1582 * _1628;
    int _1644 = _1642 + _1064;
    bool _1646 = !_1540;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1554 * _1634;
    int _1652 = _1650 + _1632;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1656 = _1654 != 0;
    int _1658 = _1652 * _1592;
    int _1660 = ~_853;
    int _1662 = _1660 + 1;
    int _1664 = ~_825;
    int _1666 = _1664 + 1;
    int _1668 = _1496 * _1630;
    int _1670 = _1668 + _1658;
    int _1672 = abs(_1648);
    int _1674 = _1662 * int(_1620);
    int _1676 = _1674 + _1566;
    float _1678 = as_type<float>(_1658);
    if (_1562)
    {
        float _1680 = _1608 * 3.1415927410125732421875;
        _1678 = _1680;
    }
    float _1682 = _1678;
    int _1684 = int(_1520) + int(_1640);
    int _1686 = _1644 * _1672;
    int _1688 = _1686 + _1670;
    float _1690 = float(uint(_1676));
    if (_1562)
    {
        float _1692 = _1682 * 0.15915493667125701904296875;
        _1600 = _1692;
    }
    float _1694 = _1600;
    bool _1696 = !_1544;
    int _1698 = _1696 ? 0 : 1;
    int _1700 = _1666 * _1684;
    int _1702 = _1700 + _1448;
    float _1704 = _1608;
    if (_1656)
    {
        float _1706 = in.m_66.x;
        _1704 = _1706;
    }
    float _1708 = _1704;
    float _1710 = as_type<float>(_911) * _1690;
    int _1712 = abs(_1698);
    float _1714 = _1694;
    if (_1562)
    {
        float _1716 = _1694 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        _1714 = _1718;
    }
    float _1720 = _1714;
    bool _1722 = uint(_1702) >= uint(_825);
    bool _1724 = !_1722;
    int _1726 = _1724 ? 0 : (-1);
    float _1728 = float(uint(_1326));
    float _1730 = trunc(_1710);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1738 = _1736 != 0;
    int _1740 = _1582 * _1712;
    int _1742 = _1740 + _1688;
    int _1744 = ~_1684;
    int _1746 = _1744 + _1726;
    int _1748 = _1746 + 1;
    float _1750 = as_type<float>(_883) * _1728;
    bool _1752 = !_1738;
    float _1754 = _1752 ? _231 : as_type<float>(_1466);
    float _1756 = float(uint(_1742));
    int _1758 = _825 * _1748;
    int _1760 = _1758 + _1448;
    bool _1762 = _825 == 0;
    float _1764 = trunc(_1750);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    bool _1770 = _1738;
    float _1772 = _1756;
    if (_1562)
    {
        bool _1774 = _1720 > 0.5;
        _1770 = _1774;
    }
    bool _1776 = _1770;
    bool _1778 = !_1762;
    int _1780 = _1778 ? _1760 : (-1);
    float _1782 = 0.0;
    if (!_1562)
    {
        _1782 = _231;
    }
    float _1784 = _1782;
    int _1786 = int(_1620) + int(_1734);
    float _1788 = as_type<float>(_1030) * _1756;
    int _1790 = ~_825;
    int _1792 = _1790 + 1;
    float _1794 = _1784;
    if (_1656)
    {
        float _1796 = _1708 * 3.1415927410125732421875;
        _1772 = _1796;
    }
    float _1798 = _1772;
    float _1800 = _1798;
    if (_1562)
    {
        float _1802 = -_231;
        float _1804 = _1776 ? _1802 : _231;
        _1794 = _1804;
    }
    float _1806 = _1794;
    float _1808 = trunc(_1788);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    int _1814 = _1780 & 3;
    bool _1816 = _1814 != 0;
    if (_1656)
    {
        float _1818 = _1798 * 0.15915493667125701904296875;
        _1800 = _1818;
    }
    float _1820 = _1800;
    int _1822 = _1780 & 3;
    bool _1824 = _1822 != 0;
    int _1826 = _1816 ? 0 : 1;
    float _1828 = _1820;
    if (_1656)
    {
        float _1830 = _1820 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        _1828 = _1832;
    }
    float _1834 = _1828;
    bool _1836 = uint(_1822) > 1u;
    int _1838 = _1792 * int(_1768);
    int _1840 = _1838 + _1326;
    float _1842 = float(uint(_1340));
    int _1844 = ~_909;
    int _1846 = _1844 + 1;
    int _1848 = ~_853;
    int _1850 = _1848 + 1;
    float _1852 = as_type<float>(_911) * _1842;
    float _1854 = float(uint(_1840));
    int _1856 = _1846 * int(_1812);
    int _1858 = _1856 + _1742;
    int _1860 = ~_1826;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    int _1866 = ~_853;
    int _1868 = _1866 + 1;
    float _1870 = as_type<float>(_883) * _1854;
    int _1872 = _1864;
    if (!_1836)
    {
        int _1874 = ~_1826;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    int _1880 = _1850 * _1786;
    int _1882 = _1880 + _1566;
    float _1884 = -_217;
    int _1886 = _1348 ? as_type<int>(_1884) : as_type<int>(_217);
    float _1888 = trunc(_1852);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = float(uint(_1858));
    bool _1896 = uint(_1822) >= 2u;
    bool _1898 = uint(_1882) >= uint(_853);
    float _1900 = as_type<float>(_1030) * _1894;
    int _1902 = _1896 ? 0 : 1;
    float _1904 = trunc(_1870);
    float _1906 = precise::max(_1904, 0.0);
    uint _1908 = uint(_1906);
    bool _1910 = _1822 != 3;
    bool _1912 = !_1898;
    int _1914 = _1912 ? 0 : (-1);
    bool _1916 = _1910;
    if (!_1656)
    {
        _1602 = _217;
    }
    float _1918 = _1602;
    int _1920 = ~_1786;
    int _1922 = _1920 + _1914;
    int _1924 = _1922 + 1;
    float _1926 = trunc(_1900);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = _1868 * int(_1892);
    int _1934 = _1932 + _1340;
    int _1936 = ~_1902;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = _853 * _1924;
    int _1944 = _1942 + _1566;
    int _1946 = _1940;
    float _1948 = _1918;
    float _1950 = 2.8025969286496341418474591665798e-45;
    if (_1910)
    {
        int _1952 = ~_1902;
        int _1954 = _1952 + 1;
        _1946 = _1954;
    }
    int _1956 = _1946;
    if (_1656)
    {
        bool _1958 = _1834 > 0.5;
        _1916 = _1958;
    }
    bool _1960 = _1916;
    bool _1962 = !_1352;
    int _1964 = _1962 ? _1944 : (-1);
    float _1966 = float(uint(_1934));
    int _1968 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1970 = _1968 != 0;
    if (_1656)
    {
        float _1972 = -_217;
        float _1974 = _1960 ? _1972 : _217;
        _1948 = _1974;
    }
    float _1976 = _1948;
    float _1978 = as_type<float>(_911) * _1966;
    int _1980 = _1964 & 3;
    bool _1982 = _1980 != 0;
    int _1984 = int(_1812) + int(_1930);
    bool _1986 = !_1970;
    float _1988 = _1986 ? _217 : as_type<float>(_1886);
    float _1990 = trunc(_1978);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    int _1996 = int(_1768) + int(_1908);
    bool _1998 = uint(_1980) > 1u;
    int _2000 = ~_909;
    int _2002 = _2000 + 1;
    int _2004 = _1964 & 3;
    bool _2006 = _2004 != 0;
    int _2008 = ~_825;
    int _2010 = _2008 + 1;
    int _2012 = _2002 * _1984;
    int _2014 = _2012 + _1742;
    int _2016 = _2006 ? 0 : 1;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2020 = _2018 != 0;
    int _2022 = _2010 * _1996;
    int _2024 = _2022 + _1326;
    float _2026 = float(uint(_1644));
    bool _2028 = !_2020;
    int _2030 = _2028 ? 0 : 1;
    bool _2032 = uint(_2014) >= uint(_909);
    float _2034 = as_type<float>(_1030) * _2026;
    int _2036 = ~_2016;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2040;
    if (!_1998)
    {
        int _2044 = ~_2016;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = trunc(_2034);
    float _2052 = precise::max(_2050, 0.0);
    uint _2054 = uint(_2052);
    bool _2056 = uint(_2024) >= uint(_825);
    bool _2058 = !_2032;
    int _2060 = _2058 ? 0 : (-1);
    bool _2062 = _1980 != 3;
    bool _2064 = !_2056;
    int _2066 = _2064 ? 0 : (-1);
    bool _2068 = uint(_1980) >= 2u;
    int _2070 = ~_1984;
    int _2072 = _2070 + _2060;
    int _2074 = _2072 + 1;
    int _2076 = ~_853;
    int _2078 = _2076 + 1;
    int _2080 = int(_1892) + int(_1994);
    int _2082 = _909 * _2074;
    int _2084 = _2082 + _1742;
    int _2086 = ~_909;
    int _2088 = _2086 + 1;
    int _2090 = _2068 ? 0 : 1;
    int _2092 = _2078 * _2080;
    int _2094 = _2092 + _1340;
    int _2096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2098 = _2096 != 0;
    int _2100 = ~_2090;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = _2104;
    float _2108 = as_type<float>(_2088);
    if (_2062)
    {
        int _2110 = ~_2090;
        int _2112 = _2110 + 1;
        _2106 = _2112;
    }
    int _2114 = _2106;
    int _2116 = _2088 * int(_2054);
    int _2118 = _2116 + _1644;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2122 = _2120 != 0;
    bool _2124 = !_2098;
    int _2126 = _2124 ? 0 : 1;
    bool _2128 = uint(_2094) >= uint(_853);
    bool _2130 = !_1590;
    int _2132 = _2130 ? _2084 : (-1);
    bool _2134 = !_2122;
    int _2136 = _2134 ? 0 : 1;
    bool _2138 = !_2128;
    int _2140 = _2138 ? 0 : (-1);
    int _2142 = _2132 & 3;
    bool _2144 = _2142 != 0;
    int _2146 = _2132 & 3;
    bool _2148 = _2146 != 0;
    float _2150 = float(uint(_2118));
    int _2152 = _2144 ? 0 : 1;
    bool _2154 = uint(_2146) > 1u;
    float _2156 = as_type<float>(_1030) * _2150;
    int _2158 = ~_2152;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = trunc(_2156);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2176 = _2162;
    if (!_2154)
    {
        int _2178 = ~_2152;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    bool _2184 = uint(_2146) >= 2u;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2188 = ~_909;
    int _2190 = _2188 + 1;
    int _2192 = _2184 ? 0 : 1;
    bool _2194 = _2146 != 3;
    int _2196 = int(_2054) + int(_2168);
    int _2198 = ~_2192;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2190 * _2196;
    int _2206 = _2204 + _1644;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2210 = _2202;
    if (_2194)
    {
        int _2212 = ~_2192;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    bool _2218 = uint(_2206) >= uint(_909);
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2222 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2208);
    bool _2224 = !_2218;
    int _2226 = _2224 ? 0 : (-1);
    bool _2228 = _986 > 0.5;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2234 = -_231;
    int _2236 = _2228 ? as_type<int>(_2234) : as_type<int>(_231);
    bool _2238 = _996 != 1;
    float _2240 = 1.0 / _2232;
    float _2242 = in.m_46.x;
    float _2244 = in.m_46.y;
    float _2246 = in.m_46.z;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2252 = abs(_2048);
    int _2254 = abs(_2114);
    float _2256 = 1.0 / _2250;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2262 = ~_1996;
    int _2264 = _2262 + _2066;
    int _2266 = _2264 + 1;
    float _2268 = 0.0;
    int _2270 = _2252;
    if (!_2238)
    {
        _2268 = _994;
    }
    float _2272 = _2268;
    float _2274 = _2272;
    if (_2238)
    {
        _2274 = _986;
    }
    float _2276 = _2274;
    int _2278 = _825 * _2266;
    int _2280 = _2278 + _1326;
    float _2282 = 0.0;
    if (!_2238)
    {
        _2282 = _994;
    }
    float _2284 = _2282;
    float _2286 = 1.0 / _2260;
    float _2288 = _2284;
    if (!_2238)
    {
        _2108 = _1008;
    }
    float _2290 = _2108;
    float _2292 = 0.0;
    float _2294 = _2290;
    if (!_2238)
    {
        _2292 = _1008;
    }
    float _2296 = _2292;
    float _2298 = _2296;
    if (_2238)
    {
        _2288 = _986;
    }
    float _2300 = _2288;
    if (_2238)
    {
        _2294 = _994;
    }
    float _2302 = _2294;
    float _2304 = _189 * _2244;
    float _2306 = _195 * _2244;
    float _2308 = _201 * _2244;
    float _2310 = _986 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2312 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2172);
    float _2314 = _994 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2316 = -_2170;
    float _2318 = fma(_2310, 2.0, _2316);
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2322 = fma(_2314, -2.0, _2174);
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2326 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2320);
    float _2328 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_2238)
    {
        _2298 = _994;
    }
    float _2330 = _2298;
    float _2332 = _2300 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2334 = _1002 != 2;
    float _2336 = fma(_2328, -2.0, _2324);
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2340 = _998 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2342 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2338);
    float _2344 = _1222 * _127;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2348 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2352 = -_2346;
    float _2354 = fma(_2332, 2.0, _2352);
    float _2356 = exp2(_2344);
    if (_2334)
    {
        _1604 = _986;
    }
    float _2358 = _1604;
    float _2360 = fma(_2330, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2350);
    float _2362 = _2358;
    if (_2334)
    {
        _1950 = _994;
    }
    float _2364 = _1950;
    float _2366 = -_127;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2354);
    float _2370 = _2364;
    if (!_2334)
    {
        _2362 = _1008;
    }
    float _2372 = _2362;
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2312);
    if (!_2334)
    {
        _2370 = _986;
    }
    float _2376 = _2370;
    float _2378 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2326);
    float _2380 = _2372 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2382 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2384 = _2382 != 0;
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2390 = -_2186;
    float _2392 = fma(_2380, 2.0, _2390);
    bool _2394 = !_2384;
    float _2396 = _2394 ? _231 : as_type<float>(_2236);
    float _2398 = -_2356;
    float _2400 = _2398 + 1.0;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2404 = fma(_2348, -2.0, _2388);
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2410 = -_2402;
    float _2412 = fma(_2340, 2.0, _2410);
    float _2414 = fma(_2386, -2.0, _2220);
    bool _2416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2418 = isnan(0.0);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2424 = _2420 || _2422;
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2428 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2432 = _2424 ? _2400 : 0.0;
    float _2434 = 1.0 / _2428;
    bool _2436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2438 = isnan(1.0);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2444 = _2440 || _2442;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2450 = 1.0 + _2448;
    float _2452 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2430);
    float _2454 = -_127;
    float _2456 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2412);
    float _2458 = -_127;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2318);
    float _2462 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2452);
    float _2464 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2446);
    float _2466 = _986 * 2.0;
    float _2468 = 1.0 / _2450;
    float _2470 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2222);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2474 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2464);
    float _2476 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2322);
    float _2478 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2336);
    float _2480 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2472);
    float _2482 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2342);
    float _2484 = floor(_2466);
    float _2486 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2360);
    float _2488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2480);
    float _2490 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2404);
    float _2492 = -_127;
    float _2494 = fma(_2492, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2392);
    float _2496 = fma(_193, _2242, _2306);
    float _2498 = fma(_199, _2242, _2308);
    float _2500 = 1.0 / _2408;
    float _2502 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2414);
    if (_2444)
    {
        float _2504 = _2432 * _2468;
        _137 = _2504;
    }
    float _2506 = _137;
    float _2508 = _994 * 2.0;
    float _2510 = fma(_187, _2242, _2304);
    float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2514 = _2512 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2516 = fma(_203, _2246, _2498);
    float _2518 = fma(_197, _2246, _2496);
    bool _2520 = _2484 >= 0.0;
    bool _2522 = isnan(_2484);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(0.0);
    bool _2528 = _2524 || _2526;
    float _2530 = floor(_2508);
    float _2532 = fma(_191, _2246, _2510);
    float _2534 = _1008 * 2.0;
    int _2536 = _2528 ? 0 : 1;
    float _2538 = -_2462;
    float _2540 = _2538 + 1.0;
    bool _2542 = _2484 > 0.0;
    float _2544 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2544;
    float _2548 = 1.0 / _2514;
    int _2550 = ~_2536;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    float _2556 = -_2486;
    float _2558 = _2556 + 1.0;
    float _2560 = _2546 * _2240;
    float _2562 = -_2474;
    float _2564 = _2562 + 1.0;
    bool _2566 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2568 = isnan(_807);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2574 = _2570 || _2572;
    float _2576 = float(_2574);
    float _2578 = -_2488;
    float _2580 = _2578 + 1.0;
    bool _2582 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2584 = isnan(_807);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2590 = _2586 || _2588;
    float _2592 = float(_2590);
    float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2596 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2594;
    int _2598 = _2554;
    if (!_2542)
    {
        int _2600 = ~_2536;
        int _2602 = _2600 + 1;
        _2598 = _2602;
    }
    int _2604 = _2598;
    float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2608 = _2606 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2610 = _2530 >= 0.0;
    bool _2612 = isnan(_2530);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan(0.0);
    bool _2618 = _2614 || _2616;
    float _2620 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2622 = _2620 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2624 = _2608 * _2548;
    int _2626 = _2618 ? 0 : 1;
    float _2628 = _2622 * _2434;
    bool _2630 = _2530 > 0.0;
    float _2632 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2632;
    float _2636 = floor(_2534);
    int _2638 = ~_2080;
    int _2640 = _2638 + _2140;
    int _2642 = _2640 + 1;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2648 = _2596 * _2500;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2652 = _807 + _2650;
    int _2654 = _853 * _2642;
    int _2656 = _2654 + _1340;
    int _2658 = ~_2626;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    float _2664 = 1.0 / _2646;
    bool _2666 = !_1824;
    int _2668 = _2666 ? 0 : 1;
    float _2670 = fma(_2560, _2652, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2672 = _2662;
    if (!_2630)
    {
        int _2674 = ~_2626;
        int _2676 = _2674 + 1;
        _2672 = _2676;
    }
    int _2678 = _2672;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2684 = !_1352;
    int _2686 = _2684 ? _2656 : (-1);
    float _2688 = -_2576;
    float _2690 = _2688 + 1.0;
    int _2692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2694 = _2692 != 0;
    int _2696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2698 = _2696 != 0;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2702 = _2700 != 0;
    float _2704 = _2682 * _2256;
    bool _2706 = _2636 >= 0.0;
    bool _2708 = isnan(_2636);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan(0.0);
    bool _2714 = _2710 || _2712;
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2718 = _807 + _2716;
    bool _2720 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2722 = isnan(_807);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2732;
    bool _2736 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2738 = isnan(_807);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2744 = _2740 || _2742;
    float _2746 = float(_2744);
    float _2748 = fma(_2624, _2718, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2750 = _2714 ? 0 : 1;
    float _2752 = _2634 * _2664;
    bool _2754 = _2636 > 0.0;
    float _2756 = _2730 * _2690;
    float _2758 = -_2730;
    float _2760 = _2758 + 1.0;
    bool _2762 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2764 = isnan(_807);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2770 = _2766 || _2768;
    float _2772 = float(_2770);
    float _2774 = -_2746;
    float _2776 = _2774 + 1.0;
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2780 = _807 + _2778;
    float _2782 = _2746 * _2760;
    bool _2784 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2786 = isnan(_807);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = _2772 * _2776;
    float _2798 = fma(_2648, _2780, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2802 = _807 + _2800;
    float _2804 = in.m_62.w;
    float _2806 = -_2772;
    float _2808 = _2806 + 1.0;
    bool _2810 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2812 = isnan(_807);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2818 = _2814 || _2816;
    float _2820 = float(_2818);
    float _2822 = fma(_2628, _2802, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2824 = -_2794;
    float _2826 = _2824 + 1.0;
    int _2828 = _1964 >> 31;
    float _2830 = _2794 * _2808;
    float _2832 = -_2820;
    float _2834 = _2832 + 1.0;
    float _2836 = in.m_64.w;
    float _2838 = _2820 * _2826;
    float _2840 = _2734 * _2286;
    bool _2842 = _807 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2844 = isnan(_807);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2856 = _807 + _2854;
    int _2858 = _2828 & 3;
    float _2860 = -_2592;
    float _2862 = _2860 + 1.0;
    float _2864 = _2592 * _2834;
    float _2866 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2868 = _807 + _2866;
    float _2870 = fma(_2840, _2856, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2872 = _1964 + _2858;
    float _2874 = _2852 * _2862;
    float _2876 = fma(_2704, _2868, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2878 = -_2852;
    float _2880 = _2878 + 1.0;
    int _2882 = _2872 >> 2;
    float _2884 = _2670 * _2874;
    float _2886 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2888 = _807 + _2886;
    float _2890 = _994 + _986;
    int _2892 = _2882 << 4;
    int _2894 = _2892 + 656;
    float _2896 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2884);
    float _2898 = fma(_2752, _2888, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2900 = _2518 + _2804;
    float _2902 = _2532 + _1038;
    float _2904 = fma(_2748, _2864, _2896);
    uint _2906 = uint(int(uint(_2894) >> uint(2)));
    uint _2908 = uint(int(uint(int(_2906)) >> uint(2)));
    int _2910 = int(_2906) & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    int _2914 = int(_2906) + 1;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    int _2918 = _2914 & 3;
    float _2920 = (*spvDescriptorSet0.vp_c9)._m0[int(_2916)][_2918];
    float _2922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2924 = _2900 + _2922;
    float _2926 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2928 = _2902 + _2926;
    int _2930 = ~_2750;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = _2516 + _2836;
    float _2938 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2940 = _2934;
    float _2942 = _2782;
    if (!_2754)
    {
        int _2944 = ~_2750;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = fma(_2798, _2838, _2904);
    bool _2952 = !_1982;
    int _2954 = _2952 ? 0 : 1;
    float _2956 = fma(_2928, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2938);
    bool _2958 = _1980 != 3;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2962 = _2936 + _2960;
    float _2964 = _986 + _1008;
    float _2966 = _986 + (-0.5);
    bool _2968 = !_2958;
    int _2970 = _2968 ? 0 : (-1);
    float _2972 = fma(_2962, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2956);
    float _2974 = fma(_2822, _2830, _2950);
    int _2976 = _2894 + 8;
    uint _2978 = uint(int(uint(_2976) >> uint(2)));
    uint _2980 = uint(int(uint(int(_2978)) >> uint(2)));
    int _2982 = int(_2978) & 3;
    float _2984 = (*spvDescriptorSet0.vp_c9)._m0[int(_2980)][_2982];
    int _2986 = int(_2978) + 1;
    uint _2988 = uint(int(uint(_2986) >> uint(2)));
    int _2990 = _2986 & 3;
    float _2992 = (*spvDescriptorSet0.vp_c9)._m0[int(_2988)][_2990];
    float _2994 = _2890 + (-1.0);
    bool _2996 = _2972 >= 0.0;
    float _2998 = _1806 + 0.5;
    float _3000 = fma(_2870, _2796, _2974);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3004 = _994 + _1008;
    float _3006 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2456);
    float _3008 = _994 + (-0.5);
    float _3010 = _2396 + 0.5;
    float _3012 = _1976 + (-0.5);
    float _3014 = fma(_2876, _2782, _3000);
    float _3016 = fma(_3010, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2460);
    float _3018 = -_3012;
    float _3020 = -_2478;
    float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3020);
    int _3024 = ~_2252;
    int _3026 = _3024 + 1;
    int _3028 = _3026 + 1;
    float _3030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2996)
    {
        _2942 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3032 = _2942;
    float _3034 = fma(_2898, _2756, _3014);
    int _3036 = abs(_2954);
    float _3038 = -_2374;
    float _3040 = _3038 + 1.0;
    if (_2996)
    {
        float _3042 = _3032 * 5.0;
        _2270 = as_type<int>(_3042);
    }
    int _3044 = _2270;
    bool _3046 = !_2694;
    int _3048 = _3046 ? 0 : 1;
    float _3050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3052 = -_3040;
    float _3054 = fma(_3052, _1806, _3006);
    float _3056 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_2996)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9482 = as_type<float>(_3044);
        out.gl_Position.z = _9482;
    }
    int _3058 = abs(_3048);
    float _3060 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3034);
    int _3062 = _3028 * as_type<int>(_2920);
    float _3064 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3066 = int(_3064);
    float _3068 = -_2378;
    float _3070 = _3068 + 1.0;
    float _3072 = _3030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3074 = ~_3036;
    int _3076 = _3074 + 1;
    int _3078 = _3076 + 1;
    float _3080 = _1988 + (-0.5);
    float _3082 = fma(_3070, _1976, _3022);
    int _3084 = ~_2196;
    int _3086 = _3084 + _2226;
    int _3088 = _3086 + 1;
    float _3090 = _1754 + 0.5;
    int _3092 = _3078 * as_type<int>(_2912);
    int _3094 = _3092 + _3062;
    float _3096 = _2924 * _2924;
    float _3098 = fma(_3072, _3090, _2368);
    int _3100 = ~_2254;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    out.m_74.x = _3054;
    out.m_74.y = _3082;
    int _3106 = abs(_2970);
    float _3108 = _3050 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3110 = abs(_3066);
    int _3112 = _3104 * as_type<int>(_2984);
    int _3114 = _3112 + _3094;
    float _3116 = float(uint(_3066));
    float _3118 = -_3080;
    float _3120 = -_2476;
    float _3122 = fma(_3118, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3120);
    int _3124 = abs(_2126);
    int _3126 = _909 * _3088;
    int _3128 = _3126 + _1644;
    int _3130 = ~_3106;
    int _3132 = _3130 + 1;
    int _3134 = _3132 + 1;
    float _3136 = fma(_2928, _2928, _3096);
    float _3138 = 1.0 / _3116;
    int _3140 = ~_3124;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    float _3146 = _1508 + (-0.5);
    float _3148 = fma(_2962, _2962, _3136);
    int _3150 = _3134 * as_type<int>(_2992);
    int _3152 = _3150 + _3114;
    int _3154 = _2132 >> 31;
    float _3156 = -_3108;
    float _3158 = -_2490;
    float _3160 = fma(_3156, _3146, _3158);
    float _3162 = float(uint(_3110));
    float _3164 = rsqrt(_3148);
    int _3166 = _3152 * _3144;
    int _3168 = _1780 >> 31;
    out.m_76.x = _3060;
    int _3170 = _3154 & 3;
    int _3172 = _2686 * _3124;
    int _3174 = _3172 + _3166;
    int _3176 = _3168 & 3;
    if (_2996)
    {
        out.m_53.x = 0.0;
    }
    float _3178 = 1.0 / _3162;
    int _3180 = as_type<int>(_3138) + (-2);
    float _3182 = float(uint(_3174));
    int _3184 = _1780 + _3176;
    float _3186 = _3056 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3188 = _2132 + _3170;
    float _3190 = as_type<float>(_3180) * _3182;
    float _3192 = float(_2948);
    float _3194 = _3186 * _3164;
    int _3196 = _3184 >> 2;
    float _3198 = in.m_78.x;
    float _3200 = in.m_78.y;
    float _3202 = in.m_78.z;
    int _3204 = abs(_3174);
    float _3206 = _2924 * _3194;
    float _3208 = trunc(_3190);
    float _3210 = precise::max(_3208, 0.0);
    uint _3212 = uint(_3210);
    float _3214 = _2928 * _3194;
    int _3216 = as_type<int>(_3178) + (-2);
    float _3218 = -_3206;
    float _3220 = _2924 + _3218;
    int _3222 = _3196 << 4;
    int _3224 = _3222 + 368;
    float _3226 = -_3214;
    float _3228 = _2928 + _3226;
    int _3230 = _3188 >> 2;
    float _3232 = _3220 * _3220;
    uint _3234 = uint(int(uint(_3224) >> uint(2)));
    uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
    int _3238 = int(_3234) & 3;
    float _3240 = (*spvDescriptorSet0.vp_c9)._m0[int(_3236)][_3238];
    int _3242 = int(_3234) + 1;
    uint _3244 = uint(int(uint(_3242) >> uint(2)));
    int _3246 = _3242 & 3;
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[int(_3244)][_3246];
    float _3250 = float(uint(_3204));
    float _3252 = fma(_3228, _3228, _3232);
    int _3254 = ~_3066;
    int _3256 = _3254 + 1;
    float _3258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3260 = _3230 << 4;
    int _3262 = _3260 + 800;
    float _3264 = as_type<float>(_3216) * _3250;
    float _3266 = float(_3058);
    int _3268 = _3256 * int(_3212);
    int _3270 = _3268 + _3174;
    uint _3272 = uint(int(uint(_3262) >> uint(2)));
    uint _3274 = uint(int(uint(int(_3272)) >> uint(2)));
    int _3276 = int(_3272) & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    int _3280 = int(_3272) + 1;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    int _3284 = _3280 & 3;
    float _3286 = (*spvDescriptorSet0.vp_c9)._m0[int(_3282)][_3284];
    int _3288 = abs(_2668);
    float _3290 = _3266 * _3192;
    float _3292 = -_2470;
    float _3294 = _3292 + 1.0;
    float _3296 = float(uint(_3270));
    float _3298 = trunc(_3264);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    float _3304 = -_2482;
    float _3306 = _3304 + 1.0;
    float _3308 = fma(_1988, _3294, _3122);
    float _3310 = _2962 * _3194;
    float _3312 = as_type<float>(_3180) * _3296;
    float _3314 = -_2540;
    float _3316 = fma(_2396, _3314, _3016);
    float _3318 = -_3306;
    float _3320 = fma(_1754, _3318, _3098);
    float _3322 = fma(_1508, _2558, _3160);
    float _3324 = _3290 * (-2.0);
    int _3326 = ~_3110;
    int _3328 = _3326 + 1;
    float _3330 = trunc(_3312);
    float _3332 = precise::max(_3330, 0.0);
    uint _3334 = uint(_3332);
    int _3336 = abs(_2030);
    float _3338 = fma(_3324, _3198, _3198);
    out.m_80.x = _3316;
    out.m_80.y = _3308;
    out.m_80.z = _3320;
    out.m_80.w = _3322;
    int _3340 = abs(_2136);
    float _3342 = -_3310;
    float _3344 = _2962 + _3342;
    int _3346 = _3328 * int(_3302);
    int _3348 = _3346 + _3204;
    float _3350 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3338);
    bool _3352 = _825 == 0;
    int _3354 = _3224 + 8;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    uint _3358 = uint(int(uint(int(_3356)) >> uint(2)));
    int _3360 = int(_3356) & 3;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[int(_3358)][_3360];
    int _3364 = int(_3356) + 1;
    uint _3366 = uint(int(uint(_3364) >> uint(2)));
    int _3368 = _3364 & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    float _3372 = float(_2604);
    float _3374 = fma(_3002, _3324, _3002);
    bool _3376 = !_3352;
    int _3378 = _3376 ? _2280 : (-1);
    float _3380 = fma(_3344, _3344, _3252);
    float _3382 = fma(_3374, _2506, _3350);
    int _3384 = int(_3212) + int(_3334);
    int _3386 = _3262 + 8;
    uint _3388 = uint(int(uint(_3386) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    float _3404 = float(uint(_3348));
    int _3406 = abs(_1878);
    int _3408 = abs(_2182);
    float _3410 = as_type<float>(_3216) * _3404;
    int _3412 = ~_3066;
    int _3414 = _3412 + 1;
    int _3416 = ~_3406;
    int _3418 = _3416 + 1;
    int _3420 = _3418 + 1;
    float _3422 = trunc(_3410);
    float _3424 = precise::max(_3422, 0.0);
    uint _3426 = uint(_3424);
    bool _3428 = !_2148;
    int _3430 = _3428 ? 0 : 1;
    int _3432 = _3414 * _3384;
    int _3434 = _3432 + _3174;
    bool _3436 = _1822 != 3;
    int _3438 = _3420 * as_type<int>(_3248);
    int _3440 = ~_3408;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    bool _3446 = !_3436;
    int _3448 = _3446 ? 0 : (-1);
    bool _3450 = uint(_3434) >= uint(_3066);
    int _3452 = _3444 * as_type<int>(_3286);
    int _3454 = abs(_3430);
    int _3456 = ~_3110;
    int _3458 = _3456 + 1;
    int _3460 = int(_3302) + int(_3426);
    int _3462 = ~_3288;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    bool _3468 = !_3450;
    int _3470 = _3468 ? 0 : (-1);
    int _3472 = _3458 * _3460;
    int _3474 = _3472 + _3204;
    bool _3476 = _2146 != 3;
    int _3478 = _3466 * as_type<int>(_3240);
    int _3480 = _3478 + _3438;
    int _3482 = ~_3384;
    int _3484 = _3482 + _3470;
    int _3486 = _3484 + 1;
    int _3488 = ~_3454;
    int _3490 = _3488 + 1;
    int _3492 = _3490 + 1;
    int _3494 = abs(_2216);
    int _3496 = _3066 * _3486;
    int _3498 = _3496 + _3174;
    bool _3500 = !_3476;
    int _3502 = _3500 ? 0 : (-1);
    int _3504 = _3492 * as_type<int>(_3278);
    int _3506 = _3504 + _3452;
    int _3508 = abs(_1956);
    float _3510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3512 = uint(_3474) >= uint(_3110);
    int _3514 = ~_3494;
    int _3516 = _3514 + 1;
    int _3518 = _3516 + 1;
    int _3520 = _3174 ^ _3066;
    int _3522 = ~_3508;
    int _3524 = _3522 + 1;
    int _3526 = _3524 + 1;
    int _3528 = _3518 * as_type<int>(_3394);
    int _3530 = _3528 + _3506;
    bool _3532 = !_3512;
    int _3534 = _3532 ? 0 : (-1);
    int _3536 = abs(_3448);
    int _3538 = _3526 * as_type<int>(_3362);
    int _3540 = _3538 + _3480;
    uint _3542 = uint(int(uint(_3520) >> uint(31)));
    int _3544 = abs(_3502);
    int _3546 = ~_3534;
    int _3548 = _3460 + _3546;
    int _3550 = _3548 + 1;
    int _3552 = ~_3536;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    int _3558 = ~int(_3542);
    int _3560 = _3558 + 1;
    int _3562 = _3556 * as_type<int>(_3370);
    int _3564 = _3562 + _3540;
    int _3566 = ~_3544;
    int _3568 = _3566 + 1;
    int _3570 = _3568 + 1;
    bool _3572 = _3066 == 0;
    int _3574 = _3550 ^ _3560;
    int _3576 = _3570 * as_type<int>(_3402);
    int _3578 = _3576 + _3530;
    int _3580 = ~_3336;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    float _3586 = _3510 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3588 = ~_3340;
    int _3590 = _3588 + 1;
    int _3592 = _3590 + 1;
    bool _3594 = !_3572;
    int _3596 = _3594 ? _3498 : (-1);
    int _3598 = _3564 * _3584;
    bool _3600 = _3066 == 0;
    int _3602 = _3578 * _3592;
    int _3604 = ~_3560;
    int _3606 = _3604 + _3574;
    int _3608 = _3606 + 1;
    int _3610 = _3378 * _3336;
    int _3612 = _3610 + _3598;
    float _3614 = float(_3596);
    float _3616 = _1160 + (-0.5);
    bool _3618 = !_3600;
    int _3620 = _3618 ? _3608 : (-1);
    bool _3622 = !_2698;
    int _3624 = _3622 ? 0 : 1;
    float _3626 = fma(_3586, _3614, _2494);
    float _3628 = float(_3620);
    float _3630 = _3258 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3632 = !_1590;
    int _3634 = _3632 ? _3128 : (-1);
    int _3636 = abs(_3624);
    float _3638 = -_2502;
    float _3640 = fma(_3630, _3628, _3638);
    float _3642 = _1176 + 0.5;
    int _3644 = _3634 * _3340;
    int _3646 = _3644 + _3602;
    float _3648 = float(_3612);
    float _3650 = -_3630;
    float _3652 = fma(_3650, _3616, _3640);
    float _3654 = fma(_3586, _3642, _3626);
    float _3656 = float(_3646);
    float _3658 = -_2564;
    float _3660 = fma(_1176, _3658, _3654);
    float _3662 = fma(_1160, _2580, _3652);
    float _3664 = float(_3636);
    out.m_82.x = _3648;
    out.m_82.w = _3656;
    float _3666 = _3664 * _3372;
    bool _3668 = !_2702;
    int _3670 = _3668 ? 0 : 1;
    out.m_84.x = _3660;
    out.m_84.y = _3662;
    float _3672 = _3202;
    if (_2996)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3674 = -_3206;
    float _3676 = _2900 + _3674;
    float _3678 = -_3214;
    float _3680 = _2902 + _3678;
    float _3682 = -_3310;
    float _3684 = _2936 + _3682;
    int _3686 = abs(_3670);
    float _3688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3690 = _3676 + _3688;
    float _3692 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3694 = _3680 + _3692;
    float _3696 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3698 = _3684 + _3696;
    float _3700 = _3004 + (-1.0);
    float _3702 = _3690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3704 = float(_2678);
    float _3706 = _2964 + (-1.0);
    float _3708 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3710 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3702);
    float _3712 = float(_3686);
    float _3714 = _3666 * (-2.0);
    float _3716 = _3382 * 0.15915493667125701904296875;
    float _3718 = fma(_3698, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3710);
    float _3720 = sqrt(_3380);
    float _3722 = fma(_3714, _3200, _3200);
    float _3724 = fma(_3708, _3714, _3708);
    float _3726 = _3712 * _3704;
    bool _3728 = _3718 >= 0.0;
    float _3730 = fma(_3008, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3722);
    float _3732 = _3726 * (-2.0);
    float _3734 = _3716 * 6.283185482025146484375;
    float _3736 = sin(_3734);
    float _3738 = fma(_3724, _2506, _3730);
    float _3740 = _1008 + (-0.5);
    float _3742 = fma(_3706, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3744 = fma(_3732, _3202, _3202);
    float _3746 = _3738 * 0.15915493667125701904296875;
    float _3748 = fma(_3742, _3732, _3742);
    float _3750 = _3716 * 6.283185482025146484375;
    float _3752 = cos(_3750);
    float _3754 = _3698;
    float _3756 = _3680;
    if (_3728)
    {
        _3672 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3758 = _3672;
    float _3760 = fma(_3740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3744);
    int _3762 = as_type<int>(_3758);
    if (_3728)
    {
        out.m_53.x = 0.0;
    }
    if (_3728)
    {
        float _3764 = _3758 * 5.0;
        _3762 = as_type<int>(_3764);
    }
    int _3766 = _3762;
    float _3768 = fma(_3748, _2506, _3760);
    float _3770 = _3746 * 6.283185482025146484375;
    float _3772 = sin(_3770);
    if (_3728)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10512 = as_type<float>(_3766);
        out.gl_Position.z = _10512;
    }
    float _3774 = _3768 * 0.15915493667125701904296875;
    float _3776 = _3746 * 6.283185482025146484375;
    float _3778 = cos(_3776);
    if (_3728)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3780 = _3774 * 6.283185482025146484375;
    float _3782 = cos(_3780);
    float _3784 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3786 = _3164 * _3720;
    float _3788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3790 = _3752 * _3778;
    float _3792 = _3736 * _3778;
    float _3794 = _3786 * _3784;
    float _3796 = _3056 * _3786;
    float _3798 = _3774 * 6.283185482025146484375;
    float _3800 = sin(_3798);
    float _3802 = _3752 * _3772;
    float _3804 = _3788 * _3794;
    float _3806 = _3736 * _3772;
    float _3808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _231);
    float _3810 = _3752 * _3782;
    float _3812 = _3736 * _3782;
    float _3814 = _3808 * _3796;
    float _3816 = _3778 * _3782;
    float _3818 = _3810 * _3804;
    float _3820 = _3772 * _3782;
    float _3822 = _3786 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3824 = _3822 * 0.5;
    float _3826 = fma(_3800, _3790, _3806);
    float _3828 = -_3792;
    float _3830 = fma(_3800, _3802, _3828);
    float _3832 = -_3804;
    float _3834 = _3800 * _3832;
    float _3836 = -_3802;
    float _3838 = fma(_3800, _3792, _3836);
    float _3840 = fma(_3826, _3814, _3818);
    float _3842 = _3812 * _3804;
    float _3844 = fma(_3816, _3814, _3834);
    float _3846 = fma(_3800, _3806, _3790);
    float _3848 = fma(_3830, _3824, _3840);
    float _3850 = fma(_3838, _3814, _3842);
    float _3852 = fma(_3820, _3824, _3844);
    float _3854 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3856 = fma(_3846, _3824, _3850);
    float _3858 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3860 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3862 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3854);
    float _3864 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3858);
    float _3866 = fma(_3852, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3860);
    float _3868 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3862);
    float _3870 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3864);
    float _3872 = fma(_3856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3866);
    float _3874 = _3868 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3876 = _3870 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3878 = _3676 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3880 = _2936 + _3874;
    float _3882 = _2902 + _3876;
    float _3884 = fma(_3680, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3878);
    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3888 = _3880 + _3886;
    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3892 = _3882 + _3890;
    float _3894 = fma(_3684, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3884);
    float _3896 = _3888 * _3888;
    float _3898 = fma(_3892, _3892, _3896);
    float _3900 = _3872 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3902 = sqrt(_3898);
    float _3904 = _2900 + _3900;
    bool _3906 = _3902 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3908 = _3884;
    float _3910 = _3872;
    float _3912 = _3900;
    if (!_3906)
    {
        _3908 = _3882;
    }
    float _3914 = _3908;
    float _3916 = _3914;
    if (!_3906)
    {
        _3910 = _3880;
    }
    float _3918 = _3910;
    float _3920 = _3918;
    if (!_3906)
    {
        _3912 = _3904;
    }
    float _3922 = _3912;
    bool _3924 = !_3906;
    float _3926 = _3922;
    if (!_3924)
    {
        float _3928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3932 = _3902 + _3930;
        float _3934 = _3904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3936 = rsqrt(_3898);
        float _3938 = _3932 * _3928;
        float _3940 = _3938 * 0.15915493667125701904296875;
        float _3942 = _3940 * 6.283185482025146484375;
        float _3944 = cos(_3942);
        float _3946 = _3940 * 6.283185482025146484375;
        float _3948 = sin(_3946);
        float _3950 = _3944 + (-1.0);
        float _3952 = fma(_3948, _3934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3956 = _3936 * _3952;
        float _3958 = fma(_3904, _3944, _3954);
        float _3960 = fma(_3892, _3956, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3962 = fma(_3888, _3956, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3926 = _3958;
        _3916 = _3960;
        _3920 = _3962;
    }
    float _3964 = _3926;
    float _3966 = _3916;
    float _3968 = _3920;
    float _3970 = -_2900;
    float _3972 = _3970 + _3964;
    float _3974 = -_2902;
    float _3976 = _3974 + _3966;
    float _3978 = -_2936;
    float _3980 = _3978 + _3968;
    float _3982 = _3894 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3984 = _3972 * _3972;
    float _3986 = _3676 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3988 = 1.0 / _3982;
    float _3990 = fma(_3976, _3976, _3984);
    bool _3992 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3994 = isnan(0.5);
    bool _3996 = _3992 || _3994;
    bool _3998 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4000 = _3996 || _3998;
    bool _4002 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4004 = isnan(0.5);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4010 = _4006 || _4008;
    float _4012 = fma(_3980, _3980, _3990);
    float _4014 = fma(_3680, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3986);
    float _4016 = sqrt(_4012);
    float _4018 = fma(_3684, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4014);
    float _4020 = _4018 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4022 = _4020 + _3982;
    float _4024 = _4022 * _3988;
    float _4026 = _4024 * 0.5;
    bool _4028 = _4016 > 0.0;
    float _4030 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4032 = fma(_4026, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4030);
    float _4034 = 1.0 / _4032;
    bool _4036 = !_4028;
    float _4038 = _3966;
    float _4040 = _3964;
    float _4042 = _3968;
    float _4044 = _3976;
    float _4046 = _3982;
    if (!_4036)
    {
        float _4048 = _237 * _237;
        float _4050 = rsqrt(_4012);
        float _4052 = fma(_235, _235, _4048);
        float _4054 = fma(_239, _239, _4052);
        float _4056 = sqrt(_4054);
        float _4058 = _3976 * _4050;
        float _4060 = _3972 * _4050;
        float _4062 = _3980 * _4050;
        bool _4064 = _4056 > 0.0;
        bool _4066 = !_4064;
        _4046 = _4056;
        if (!_4066)
        {
            float _4068 = rsqrt(_4054);
            float _4070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4072 = _237 * _4068;
            float _4074 = _235 * _4068;
            float _4076 = _4060 * _4072;
            float _4078 = _239 * _4068;
            float _4080 = fma(_4058, _4074, _4076);
            float _4082 = _4070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4084 = fma(_4062, _4078, _4080);
            float _4086 = _4084 * _4082;
            float _4088 = fma(_235, _4086, _3966);
            float _4090 = fma(_237, _4086, _3964);
            float _4092 = fma(_239, _4086, _3968);
            _4038 = _4088;
            _4040 = _4090;
            _4042 = _4092;
            _4044 = _4086;
            _4046 = _4078;
        }
    }
    float _4094 = _4038;
    float _4096 = _4040;
    float _4098 = _4042;
    float _4100 = _4044;
    float _4102 = _4046;
    float _4104 = -_3214;
    float _4106 = _4104 + _4094;
    float _4108 = -_3206;
    float _4110 = _4108 + _4096;
    float _4112 = -_3310;
    float _4114 = _4112 + _4098;
    float _4116 = _4102;
    float _4118 = _4110;
    float _4120 = _4106;
    float _4122 = _4114;
    float _4124 = _4100;
    if (_4010)
    {
        _4116 = 1.0;
    }
    float _4126 = _4116;
    float _4128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4130 = _4034 * _4128;
    float _4132 = _4126;
    if (!_4000)
    {
        float _4134 = _3690 * _3690;
        float _4136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4138 = -_2936;
        float _4140 = _4138 + _4098;
        float _4142 = -_2900;
        float _4144 = _4142 + _4096;
        float _4146 = fma(_3694, _3694, _4134);
        float _4148 = -_2902;
        float _4150 = _4148 + _4094;
        float _4152 = fma(_3698, _3698, _4146);
        float _4154 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4156 = sqrt(_4152);
        float _4158 = 1.0 / _3786;
        float _4160 = _4154 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4162 = precise::min(_4156, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4164 = _4162 * _4136;
        float _4166 = _4164 * _4158;
        float _4168 = _4160 * _4166;
        float _4170 = _4140 * _4166;
        float _4172 = fma(_4144, _4168, _3676);
        float _4174 = fma(_4150, _4168, _3680);
        float _4176 = fma(_4160, _4170, _3684);
        _4118 = _4172;
        _4120 = _4174;
        _4122 = _4176;
        _3754 = _4168;
    }
    float _4178 = _4118;
    float _4180 = _4120;
    float _4182 = _4122;
    float _4184 = _3754;
    float _4186 = _4184;
    if (!_4010)
    {
        float _4188 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4190 = _4188 * 0.15915493667125701904296875;
        float _4192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4194 = _4190 * 6.283185482025146484375;
        float _4196 = cos(_4194);
        float _4198 = _4192 * 0.15915493667125701904296875;
        float _4200 = _4190 * 6.283185482025146484375;
        float _4202 = sin(_4200);
        float _4204 = 1.0 / _4196;
        float _4206 = _4198 * 6.283185482025146484375;
        float _4208 = cos(_4206);
        float _4210 = _4202 * _4204;
        float _4212 = _4198 * 6.283185482025146484375;
        float _4214 = sin(_4212);
        float _4216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4218 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4216;
        float _4220 = _4208 * _4210;
        float _4222 = 1.0 / _4218;
        float _4224 = 1.0 / _4220;
        float _4226 = _4214 * _4224;
        float _4228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4230 = fma(_4130, _4226, _4228);
        float _4232 = _4230 * _4222;
        float _4234 = precise::clamp(_4232, 0.0, 1.0);
        _4186 = _4190;
        _4132 = _4234;
    }
    float _4236 = _4186;
    float _4238 = _4132;
    float _4240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4242 = _4178 + _4240;
    float _4244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4246 = _4180 + _4244;
    float _4248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4250 = _4182 + _4248;
    float _4252 = _4242 * _4242;
    float _4254 = fma(_4246, _4246, _4252);
    float _4256 = fma(_4250, _4250, _4254);
    float _4258 = rsqrt(_4256);
    float _4260 = sqrt(_4256);
    float _4262 = _4258 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4264 = _4246 * _4262;
    float _4266 = _4250 * _4262;
    float _4268 = _4264 * _4264;
    float _4270 = _4266 * _4266;
    float _4272 = _4268 + _4270;
    float _4274 = sqrt(_4272);
    bool _4276 = _4274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4280 = _4274 + _4278;
    float _4282 = _4250;
    float _4284 = _4272;
    float _4286 = _4280;
    float _4288 = _4236;
    if (_4276)
    {
        float _4290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4282 = _4290;
    }
    float _4292 = _4282;
    if (_4276)
    {
        float _4294 = rsqrt(_4272);
        _4284 = _4294;
    }
    float _4296 = _4284;
    float _4298 = _4296;
    if (_4276)
    {
        float _4300 = _4280 * _4292;
        _4286 = _4300;
    }
    float _4302 = _4286;
    if (_4276)
    {
        float _4304 = _4302 * 0.15915493667125701904296875;
        _4288 = _4304;
    }
    float _4306 = _4288;
    float _4308 = _4292;
    float _4310 = _4306;
    if (_4276)
    {
        float _4312 = _4306 * 6.283185482025146484375;
        float _4314 = sin(_4312);
        _4308 = _4314;
    }
    float _4316 = _4308;
    float _4318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4320 = precise::max(0.0, _4318);
    float _4322 = _4252;
    float _4324 = _4320;
    if (_4276)
    {
        float _4326 = _4306 * 6.283185482025146484375;
        float _4328 = cos(_4326);
        _4322 = _4328;
    }
    float _4330 = _4322;
    float _4332 = -_4262;
    float _4334 = -_4320;
    float _4336 = fma(_4242, _4332, _4334);
    float _4338 = _4336;
    if (_4276)
    {
        float _4340 = _4336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4324 = _4340;
    }
    float _4342 = _4324;
    float _4344 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4346 = _4342;
    if (!_4276)
    {
        _3756 = _4270;
    }
    float _4348 = _3756;
    float _4350 = _4316;
    float _4352 = _4348;
    if (_4276)
    {
        float _4354 = fma(_4316, _4342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4350 = _4354;
    }
    float _4356 = _4350;
    float _4358 = floor(_4344);
    float _4360 = _4356;
    if (_4276)
    {
        float _4362 = _4330 + (-1.0);
        _4346 = _4362;
    }
    float _4364 = _4346;
    float _4366 = _4364;
    if (_4276)
    {
        float _4368 = _4296 * _4356;
        _4124 = _4368;
    }
    float _4370 = _4124;
    if (!_4276)
    {
        _4360 = _4264;
    }
    float _4372 = _4360;
    float _4374 = _4372;
    if (_4276)
    {
        float _4376 = _4364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4310 = _4376;
    }
    float _4378 = _4310;
    if (_4276)
    {
        float _4380 = _4264 * _4370;
        _4374 = _4380;
    }
    float _4382 = _4374;
    if (!_4276)
    {
        _4366 = _4266;
    }
    float _4384 = _4366;
    float _4386 = _4384;
    if (_4276)
    {
        float _4388 = _4266 * _4370;
        _4386 = _4388;
    }
    float _4390 = _4386;
    if (!_4276)
    {
        _4298 = _4268;
    }
    float _4392 = _4298;
    float _4394 = _4392;
    if (_4276)
    {
        float _4396 = fma(_4336, _4330, _4378);
        _4338 = _4396;
    }
    float _4398 = _4338;
    if (_4276)
    {
        float _4400 = _4382 * _4382;
        _4394 = _4400;
    }
    float _4402 = _4394;
    if (_4276)
    {
        float _4404 = _4390 * _4390;
        _4352 = _4404;
    }
    float _4406 = _4352;
    float _4408 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4410 = fma(_4398, _4398, _4402);
    float _4412 = _4410 + _4406;
    float _4414 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4408);
    float _4416 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4418 = fma(_4260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4416);
    float _4420 = precise::clamp(_4418, 0.0, 1.0);
    float _4422 = rsqrt(_4412);
    float _4424 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4414);
    float _4426 = -_4420;
    float _4428 = _4426 + 1.0;
    float _4430 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4432 = _4424 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4434 = fma(_3684, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4436 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4438 = _4432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4440 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4442 = abs(_4428);
    float _4444 = log2(_4442);
    float _4446 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4436);
    float _4448 = -_4438;
    float _4450 = fma(_4448, _4430, 1.0);
    float _4452 = _4178 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4454 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4440);
    float _4456 = _4422 * _4390;
    float _4458 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4446);
    float _4460 = fma(_4180, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4452);
    float _4462 = _4422 * _4382;
    float _4464 = _4422 * _4398;
    float _4466 = _4458 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4468 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4460);
    float _4470 = _4462 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4472 = fma(_4182, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4454);
    float _4474 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4476 = _4468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4478 = -_4470;
    float _4480 = fma(_4464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4478);
    float _4482 = floor(_4434);
    float _4484 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4486 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4474);
    float _4488 = -_4456;
    float _4490 = fma(_4488, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4480);
    float _4492 = _4472 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4494 = _4464 + 1.0;
    float _4496 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4486);
    float _4498 = fma(_4490, -0.5, 0.5);
    float _4500 = log2(_4450);
    float _4502 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4504 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4496);
    float _4506 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4502);
    float _4508 = 1.0 / _4504;
    float _4510 = -_4358;
    float _4512 = _4344 + _4510;
    float _4514 = fma(_4490, 0.5, 0.5);
    float _4516 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4518 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4506);
    float _4520 = -_4482;
    float _4522 = _4434 + _4520;
    float _4524 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4516);
    float _4526 = exp2(_4484);
    float _4528 = fma(_4514, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4530 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4518);
    float _4532 = sqrt(_4498);
    float _4534 = fma(_4514, _4528, -0.212114393711090087890625);
    float2 _11721 = float2(_4512, _4522);
    float _4536 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11721, float2(0.0), isnan(_11721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11721, float2(0.0), isnan(_11721)), level(0.0)).x;
    float _4538 = fma(_4514, _4534, 1.570728778839111328125);
    float _4540 = -_4464;
    float _4542 = fma(_4526, _4494, _4540);
    float _4544 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4524);
    float _4546 = _4530 * _4508;
    float _4548 = fma(_4542, 0.5, 0.5);
    float _4550 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4544);
    float _4552 = _4500 * 0.693147182464599609375;
    float _4554 = fma(_4546, 0.5, 0.5);
    float _4556 = _4532 * 0.636619746685028076171875;
    float _4558 = _4550 * _4508;
    float _4560 = _4552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4562 = -_4538;
    float _4564 = fma(_4556, _4562, 1.0);
    float _4566 = fma(_4558, -0.5, 0.5);
    float3 _11779 = float3(_4554, _4566, _4560);
    float _4568 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11779, float3(0.0), isnan(_11779)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11779, float3(0.0), isnan(_11779)), level(0.0)).x;
    float3 _11790 = float3(_4554, _4566, _4560);
    float4 _4571 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11790, float3(0.0), isnan(_11790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11790, float3(0.0), isnan(_11790)), level(0.0)).xyzw;
    float _4573 = _4571.x;
    float _4575 = _4571.y;
    float _4577 = _4571.z;
    float _4579 = _4571.w;
    float2 _11806 = float2(_4564, _4548);
    float3 _4583 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11806, float2(0.0), isnan(_11806)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11806, float2(0.0), isnan(_11806)), level(0.0)).xyz;
    float _4585 = _4583.x;
    float _4587 = _4583.y;
    float _4589 = _4583.z;
    float _4591 = abs(_4130);
    float _4593 = log2(_4591);
    float _4595 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4597 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4599 = _3826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4601 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4603 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4595);
    float _4605 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4597);
    float _4607 = fma(_3816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4599);
    float _4609 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4611 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4613 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4615 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4617 = _3830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4619 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4621 = -_3800;
    float _4623 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4601);
    float _4625 = -_3800;
    float _4627 = fma(_4625, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4615);
    float _4629 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4631 = -_3800;
    float _4633 = fma(_4631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4609);
    float _4635 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4611);
    float _4637 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4613);
    float _4639 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4617);
    float _4641 = fma(_4619, _4619, 1.0);
    float _4643 = exp2(_4629);
    float _4645 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4633);
    float _4647 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4623);
    float _4649 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4627);
    float _4651 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4603);
    float _4653 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4605);
    float _4655 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4607);
    float _4657 = rsqrt(_4641);
    float _4659 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4661 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4663 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4635);
    float _4665 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4637);
    float _4667 = fma(_3846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4639);
    float _4669 = _4619 * _4647;
    out.m_86.x = _4651;
    out.m_86.y = _4653;
    out.m_86.z = _4655;
    float _4671 = fma(_4643, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4673 = precise::clamp(_4671, 0.0, 1.0);
    float _4675 = _4466 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4677 = exp2(_4661);
    float _4679 = fma(_4659, _4651, _4669);
    bool _4681 = _4130 <= 8000.0;
    bool _4683 = isnan(_4130);
    bool _4685 = _4681 || _4683;
    bool _4687 = isnan(8000.0);
    bool _4689 = _4685 || _4687;
    float _4691 = float(_4689);
    float _4693 = fma(_4673, -2.0, 3.0);
    float _4695 = _4673 * _4673;
    float _4697 = _4619 * _4657;
    float _4699 = fma(_4476, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4675);
    bool _4701 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4703 = isnan(_4260);
    bool _4705 = _4701 || _4703;
    bool _4707 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4709 = _4705 || _4707;
    float _4711 = _4695 * _4693;
    float _4713 = _4619 * _4649;
    float _4715 = _4619 * _4645;
    float _4717 = -_4663;
    float _4719 = _4697 * _4717;
    float _4721 = -_4711;
    float _4723 = _4721 + 1.0;
    float _4725 = fma(_4659, _4653, _4713);
    float _4727 = -_4667;
    float _4729 = _4697 * _4727;
    float _4731 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4711);
    float _4733 = -_4665;
    float _4735 = _4697 * _4733;
    float _4737 = fma(_4657, _4645, _4729);
    float _4739 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4699);
    float _4741 = in.m_88.x;
    float _4743 = fma(_4657, _4647, _4719);
    float _4745 = _4691 * _4731;
    float _4747 = fma(_4657, _4649, _4735);
    float _4749 = fma(_4492, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4739);
    float _4751 = _4504 * 0.5;
    float _4753 = -_4677;
    float _4755 = _4753 + 1.0;
    float _4757 = _4745 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4759 = _4749 + _4504;
    float _4761 = _4530 + _4504;
    float _4763 = fma(_4550, -0.5, _4751);
    float _4765 = _4755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4767 = _4759 * 0.5;
    float _4769 = _4761 * 0.5;
    out.gl_Position.x = _4530;
    out.gl_Position.y = _4550;
    out.gl_Position.z = _4749;
    out.gl_Position.w = _4504;
    float _4771 = fma(_4659, _4655, _4715);
    float _4773 = _4663 + _4679;
    float _4775 = _4665 + _4725;
    out.m_90.x = _4769;
    out.m_90.y = _4763;
    out.m_90.z = _4767;
    out.m_90.w = _4504;
    float _4777 = _4667 + _4771;
    out.m_92.x = _4743;
    out.m_92.y = _4747;
    out.m_92.z = _4737;
    out.m_94.x = _4773;
    out.m_94.y = _4775;
    out.m_94.z = _4777;
    float _4779 = -_4765;
    float _4781 = _4779 + 1.0;
    float _4783 = _4504;
    float _4785 = _4749;
    float _4787 = _4550;
    float _4789 = _4781;
    if (!_4709)
    {
        _4783 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4791 = _4783;
    float _4793 = _4791;
    float _4795 = _4791;
    if (!_4709)
    {
        _4785 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4797 = _4785;
    float _4799 = _4797;
    float _4801 = _4797;
    if (!_4709)
    {
        _4787 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4803 = _4787;
    float _4805 = -_4536;
    float _4807 = _4805 + 1.0;
    float _4809 = _4807 * _4757;
    float _4811 = precise::clamp(_4809, 0.0, 1.0);
    float _4813 = -_4811;
    float _4815 = fma(_4813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4817 = _4815 * _4741;
    float _4819 = _4817 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_96.x = _4819;
    float _4821 = _4765 * _4568;
    float _4823 = _4579 * _4781;
    float _4825 = _4575;
    float _4827 = _4573;
    float _4829 = _4803;
    float _4831 = _4803;
    if (!_4709)
    {
        _4789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4833 = _4789;
    float _4835 = _4579 * _4821;
    float _4837 = _4589 * _4821;
    float _4839 = fma(_4585, _4835, _4573);
    float _4841 = fma(_4587, _4835, _4575);
    float _4843 = fma(_4579, _4837, _4577);
    float _4845 = _4238 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4847 = _4833;
    float _4849 = _4833;
    if (!_4709)
    {
        _4825 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4851 = _4825;
    float _4853 = _4851;
    float _4855 = _4851;
    if (!_4709)
    {
        _4827 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4857 = _4827;
    out.m_98.x = _4839;
    out.m_98.y = _4841;
    out.m_98.z = _4843;
    out.m_98.w = _4823;
    bool _4859 = !_4709;
    float _4861 = _4857;
    float _4863 = _4857;
    if (!_4859)
    {
        bool _4865 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4867 = isnan(_4260);
        bool _4869 = _4865 || _4867;
        bool _4871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4873 = _4869 || _4871;
        if (!_4873)
        {
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4877 = _4260 + _4875;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4881 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4879;
            float _4883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4885 = _4883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4887 = 1.0 / _4881;
            float _4889 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4891 = _4889 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4893 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4895 = _4893 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4897 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4901 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4903 = _4901 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4905 = _4877 * _4887;
            float _4907 = precise::clamp(_4905, 0.0, 1.0);
            float _4909 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4911 = _4909 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4913 = fma(_4907, _4885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4915 = fma(_4907, _4911, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4917 = fma(_4907, _4891, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4919 = fma(_4907, _4895, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4921 = fma(_4907, _4899, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4923 = fma(_4907, _4903, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4863 = _4917;
            _4831 = _4921;
            _4855 = _4913;
            _4801 = _4919;
            _4795 = _4915;
            _4849 = _4923;
            _4925 = true;
        }
        else
        {
            bool _4927 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4929 = isnan(_4260);
            bool _4931 = _4927 || _4929;
            bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4935 = _4931 || _4933;
            if (!_4935)
            {
                _4853 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4937 = _4853;
            _4855 = _4937;
            if (!_4935)
            {
                _4861 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4939 = _4861;
            _4863 = _4939;
            if (!_4935)
            {
                _4793 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4941 = _4793;
            _4795 = _4941;
            if (!_4935)
            {
                _4799 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4943 = _4799;
            _4801 = _4943;
            if (!_4935)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4945 = _4829;
            _4831 = _4945;
            if (!_4935)
            {
                _4847 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4947 = _4847;
            bool _4949 = !_4935;
            _4849 = _4947;
            if (!_4949)
            {
                bool _4951 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4953 = isnan(_4260);
                bool _4955 = _4951 || _4953;
                bool _4957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4959 = _4955 || _4957;
                if (!_4959)
                {
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4963 = _4260 + _4961;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4967 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4965;
                    float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4971 = _4969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4973 = 1.0 / _4967;
                    float _4975 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4977 = _4975 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4979 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4981 = _4979 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4991 = _4963 * _4973;
                    float _4993 = precise::clamp(_4991, 0.0, 1.0);
                    float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4999 = fma(_4993, _4971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5001 = fma(_4993, _4997, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5003 = fma(_4993, _4977, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5005 = fma(_4993, _4981, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5007 = fma(_4993, _4985, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5009 = fma(_4993, _4989, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4863 = _5003;
                    _4831 = _5007;
                    _4855 = _4999;
                    _4801 = _5005;
                    _4795 = _5001;
                    _4849 = _5009;
                    _4925 = true;
                }
                else
                {
                    _4863 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4855 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4801 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4795 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4849 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4925 = false;
    float _5011 = _4863;
    float _5013 = _4831;
    float _5015 = _4855;
    float _5017 = _4801;
    float _5019 = _4795;
    float _5021 = _4849;
    float _5023 = _4845 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5025 = fma(_4775, -0.5, 0.5);
    float _5027 = precise::clamp(_5025, 0.0, 1.0);
    float _5029 = -_5011;
    float _5031 = _5029 + _5013;
    float _5033 = -_5015;
    float _5035 = _5033 + _5017;
    out.m_100.x = 0.0;
    float _5037 = fma(_5027, _5031, _5011);
    float _5039 = -_5019;
    float _5041 = _5039 + _5021;
    float _5043 = fma(_5027, _5035, _5015);
    float _5045 = _5037 * 0.586610972881317138671875;
    bool _5047 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5049 = fma(_5027, _5041, _5019);
    out.m_53.x = _5023;
    float _5051 = fma(_5043, 0.298911988735198974609375, _5045);
    bool _5053 = _4238 > 0.0;
    bool _5055 = isnan(_4238);
    bool _5057 = _5053 || _5055;
    bool _5059 = isnan(0.0);
    bool _5061 = _5057 || _5059;
    float _5063 = fma(_5049, 0.114477999508380889892578125, _5051);
    float _5065 = -_5063;
    float _5067 = _5043 + _5065;
    float _5069 = -_5063;
    float _5071 = _5037 + _5069;
    float _5073 = -_5063;
    float _5075 = _5049 + _5073;
    float _5077 = fma(_5067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    float _5079 = fma(_5071, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    float _5081 = fma(_5075, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5063);
    bool _5083 = !_5047;
    if (!_5083)
    {
        float _5085 = -_4178;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5089 = -_4180;
        float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5093 = -_4182;
        float _5095 = _5093 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5097 = _5087 * _5087;
        float _5099 = fma(_5091, _5091, _5097);
        float _5101 = fma(_5095, _5095, _5099);
        float _5103 = sqrt(_5101);
        float _5105 = rsqrt(_5101);
        float _5107 = -_5103;
        float _5109 = _5107 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5111 = _5109 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5113 = precise::clamp(_5111, 0.0, 1.0);
        float _5115 = _5091 * _5105;
        float _5117 = _5087 * _5105;
        float _5119 = abs(_5113);
        float _5121 = log2(_5119);
        float _5123 = _5095 * _5105;
        float _5125 = _5115 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5127 = _4775 * _5117;
        float _5129 = -_5117;
        float _5131 = -_5125;
        float _5133 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5131);
        float _5135 = fma(_4773, _5115, _5127);
        float _5137 = -_5123;
        float _5139 = fma(_5137, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5133);
        float _5141 = fma(_4777, _5123, _5135);
        float _5143 = precise::clamp(_5141, 0.0, 1.0);
        float _5145 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5147 = _5139 + _5145;
        float _5149 = _5121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5151 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5153 = precise::clamp(_5151, 0.0, 1.0);
        float _5155 = exp2(_5149);
        float _5157 = _5155 * _5153;
        float _5159 = _5143 * _5157;
        float _5161 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5163 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5165 = _5159 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5161;
        out.m_100.y = _5163;
        out.m_100.z = _5165;
    }
    out.m_102.x = _5077;
    out.m_102.y = _5079;
    out.m_102.z = _5081;
    if (_5061)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5167;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

