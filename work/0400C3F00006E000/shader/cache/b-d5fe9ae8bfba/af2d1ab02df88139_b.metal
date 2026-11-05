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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_74 [[user(locn0)]];
    float4 m_88 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_100 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_84 [[user(locn14)]];
    float4 m_94 [[user(locn15)]];
    float4 m_92 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_90 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3163 = false;
    bool _547 = false;
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
        float _3421 = as_type<float>(_145);
        out.gl_Position.z = _3421;
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
    float _159 = in.m_55.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    float _173 = _127 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _147 = as_type<int>(_177);
    }
    int _179 = _147;
    out.m_57.x = _159;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3486 = as_type<float>(_179);
        out.gl_Position.z = _3486;
    }
    out.m_51.x = _173;
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    float _201 = in.m_68.x;
    float _203 = in.m_68.y;
    float _205 = in.m_68.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _259 = _173;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = 1.0 / _271;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = 1.0 / _275;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _263 + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _279;
    float _301 = _295 * _285;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = _263 + _303;
    float _307 = 1.0 / _283;
    float _309 = _267 * _291;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _263 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = _263 + _315;
    bool _319 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _321 = isnan(_263);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _289;
    float _333 = _305 * _299;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_345;
    float _349 = _347 + 1.0;
    float _351 = _313 * _307;
    float _353 = -_329;
    float _355 = _353 + 1.0;
    bool _357 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_263);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _345 * _355;
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _383;
    float _387 = _317 * _331;
    float _389 = _367 * _349;
    float _391 = -_367;
    float _393 = _391 + 1.0;
    bool _395 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_263);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = fma(_385, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _409;
    bool _413 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _415 = isnan(_263);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_381;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = fma(_411, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _435 = _381 * _393;
    float _437 = -_405;
    float _439 = _437 + 1.0;
    float _441 = _405 * _427;
    float _443 = fma(_431, _309, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _423 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -_423;
    float _457 = _455 + 1.0;
    float _459 = fma(_447, _309, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _461 = _407 * _449;
    float _463 = _433 * _449;
    float _465 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _473 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _475 = in.m_70.x;
    float _477 = in.m_70.y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = fma(_443, _441, _471);
    float _485 = fma(_469, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = fma(_459, _441, _473);
    float _493 = fma(_481, _351, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _495;
    float _499 = fma(_465, _435, _483);
    float _501 = fma(_489, _351, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _503;
    float _507 = fma(_485, _435, _491);
    float _509 = fma(_497, _387, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _511 = fma(_493, _389, _499);
    float _513 = fma(_505, _387, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _515 = fma(_501, _389, _507);
    float _517 = fma(_509, _369, _511);
    float _519 = fma(_513, _369, _515);
    float _521 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[148].x, _517);
    float _523 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[148].y, _519);
    float _525 = _521 * _475;
    float _527 = _523 * _477;
    bool _529 = !_297;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _533 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        _545 = _173;
    }
    _547 = false;
    float _549 = _545;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _553 = _549 + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = isnan(_549);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _579 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _581 = isnan(_549);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _557;
    float _593 = -_569;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _597;
    bool _601 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _603 = isnan(_549);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _589 * _595;
    float _615 = -_589;
    float _617 = _615 + 1.0;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _621 = 1.0 / _573;
    float _623 = _611 * _617;
    float _625 = -_611;
    float _627 = _625 + 1.0;
    float _629 = 1.0 / _577;
    float _631 = _599 * _591;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = fma(_631, _553, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _639 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _641 = isnan(_549);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _635 * _621;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = _549 + _657;
    float _661 = _637 * _623;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _665 = _549 + _663;
    float _667 = fma(_651, _659, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _669 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[115].x, _661);
    float _671 = _655 * _629;
    float _673 = -_649;
    float _675 = _673 + 1.0;
    float _677 = fma(_667, _613, _669);
    float _679 = fma(_671, _665, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = _569 * _675;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _685 = fma(_679, _681, _677);
    float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[118].x, _685);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _703 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _689 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _715 = !_619;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _175 = _729;
    }
    float _731 = _175;
    float _733 = in.m_46.x;
    float _735 = in.m_46.y;
    float _737 = in.m_46.z;
    float _739 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _741 = log2(_739);
    float _743 = _159 * 2.0;
    bool _745 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = in.m_55.y;
    float _757 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = in.m_68.w;
    float _761 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _763 = int(_761);
    float _765 = _741 * _127;
    float _767 = floor(_743);
    float _769 = _197 * _735;
    float _771 = _191 * _735;
    float _773 = in.m_55.z;
    float _775 = _203 * _735;
    float _777 = fma(_189, _733, _771);
    float _779 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _781 = fma(_195, _733, _769);
    float _783 = fma(_193, _737, _777);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = fma(_201, _733, _775);
    float _791 = exp2(_765);
    float _793 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _795 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _797 = isnan(1.0);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _803 = _799 || _801;
    float _805 = -_785;
    float _807 = fma(_779, 2.0, _805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = float(_763);
    float _815 = fma(_199, _737, _781);
    float _817 = _159 + _755;
    float _819 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _821 = int(_819);
    float _823 = fma(_205, _737, _789);
    float _825 = fma(_793, -2.0, _787);
    float _827 = _755 * 2.0;
    float _829 = _755 + _773;
    float _831 = _817 + (-1.0);
    float _833 = 1.0 / _811;
    float _835 = _829 + (-1.0);
    float _837 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _839 = _767 > 0.0;
    float _841 = -_791;
    float _843 = _841 + 1.0;
    float _845 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _847 = _767 >= 0.0;
    bool _849 = isnan(_767);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = in.m_64.w;
    float _859 = 1.0 / _813;
    float _861 = _773 * 2.0;
    float _863 = in.m_66.w;
    float _865 = -_127;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[76].x, _807);
    float _869 = float(_821);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _873 = floor(_827);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _877 = _753 ? _843 : 0.0;
    float _879 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _871);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _891 = _889 != 0;
    float _893 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _875);
    float _895 = _869 * _127;
    float _897 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _879);
    float _899 = floor(_861);
    float _901 = _859 * _127;
    float _903 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _825);
    float _905 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    if (_803)
    {
        float _907 = _877 * _833;
        _137 = _907;
    }
    float _909 = _137;
    int _911 = _855 ? 0 : 1;
    float _913 = _823 + _759;
    bool _915 = !_887;
    int _917 = _915 ? 0 : 1;
    float _919 = _783 + _857;
    bool _921 = _873 > 0.0;
    bool _923 = _873 >= 0.0;
    bool _925 = isnan(_873);
    bool _927 = _923 || _925;
    bool _929 = isnan(0.0);
    bool _931 = _927 || _929;
    float _933 = _815 + _863;
    bool _935 = !_883;
    int _937 = _935 ? 0 : 1;
    bool _939 = !_891;
    int _941 = _939 ? 0 : 1;
    bool _943 = _899 >= 0.0;
    bool _945 = isnan(_899);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    int _953 = ~_911;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _969 = _967 != 0;
    int _971 = _957;
    if (!_839)
    {
        int _973 = ~_911;
        int _975 = _973 + 1;
        _971 = _975;
    }
    int _977 = _971;
    float _979 = in.m_72.x;
    float _981 = in.m_72.y;
    float _983 = in.m_72.z;
    bool _985 = !_961;
    int _987 = _985 ? 0 : 1;
    bool _989 = _899 > 0.0;
    bool _991 = !_965;
    int _993 = _991 ? 0 : 1;
    int _995 = abs(_987);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _933 + _997;
    int _1001 = abs(_993);
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1005 = _919 + _1003;
    int _1007 = _931 ? 0 : 1;
    float _1009 = _999 * _999;
    int _1011 = _951 ? 0 : 1;
    float _1013 = float(_977);
    float _1015 = float(_1001);
    int _1017 = ~_1007;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    int _1023 = _1021;
    if (!_921)
    {
        int _1025 = ~_1007;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _913 + _1031;
    float _1035 = fma(_1005, _1005, _1009);
    int _1037 = ~_1011;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    float _1043 = _1015 * _1013;
    int _1045 = _1041;
    if (!_989)
    {
        int _1047 = ~_1011;
        int _1049 = _1047 + 1;
        _1045 = _1049;
    }
    int _1051 = _1045;
    float _1053 = fma(_1033, _1033, _1035);
    float _1055 = float(_995);
    float _1057 = float(_1051);
    float _1059 = _1043 * (-2.0);
    float _1061 = sqrt(_1053);
    bool _1063 = !_969;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = _755 + (-0.5);
    float _1069 = fma(_1059, _981, _981);
    float _1071 = fma(_845, _1059, _845);
    int _1073 = abs(_1065);
    float _1075 = _159 + _773;
    float _1077 = _1055 * _1057;
    float _1079 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1081 = _1075 + (-1.0);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1069);
    float _1085 = rsqrt(_1053);
    float _1087 = float(_1029);
    float _1089 = _1079 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1091 = float(_1073);
    float _1093 = _1061 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1095 = fma(_1071, _909, _1083);
    float _1097 = _1077 * (-2.0);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1101 = _1091 * _1087;
    float _1103 = precise::min(_1089, _1093);
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = fma(_1097, _979, _979);
    float _1109 = _1101 * (-2.0);
    float _1111 = fma(_837, _1097, _837);
    float _1113 = _159 + (-0.5);
    float _1115 = _773 + (-0.5);
    float _1117 = _1085 * _1103;
    float _1119 = fma(_1099, _1109, _1099);
    float _1121 = fma(_1109, _983, _983);
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1107);
    float _1125 = _999 * _1117;
    float _1127 = _1005 * _1117;
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1121);
    float _1131 = fma(_1111, _909, _1123);
    float _1133 = -_1125;
    float _1135 = _999 + _1133;
    float _1137 = -_1127;
    float _1139 = _1005 + _1137;
    float _1141 = fma(_1119, _909, _1129);
    float _1143 = _1135 * _1135;
    float _1145 = _1033 * _1117;
    float _1147 = _1131 * 0.15915493667125701904296875;
    float _1149 = _1141 * 0.15915493667125701904296875;
    float _1151 = fma(_1139, _1139, _1143);
    float _1153 = -_1145;
    float _1155 = _1033 + _1153;
    float _1157 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1159 = _1105 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = fma(_1155, _1155, _1151);
    float _1165 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1167 = _933 + _1165;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1157);
    float _1171 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1173 = _919 + _1171;
    float _1175 = _1167 * _1167;
    float _1177 = sqrt(_1163);
    float _1179 = fma(_1173, _1173, _1175);
    float _1181 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1183 = _913 + _1181;
    float _1185 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1169);
    float _1187 = fma(_1183, _1183, _1179);
    float _1189 = _1105 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1195 = _1147 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = _1085 * _1177;
    float _1201 = _757 * _1199;
    float _1203 = _1079 * _1199;
    float _1205 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1205 * 0.5;
    float _1209 = _1147 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1201 * _1193;
    float _1215 = _1149 * 6.283185482025146484375;
    float _1217 = cos(_1215);
    float _1219 = _1197 * _1161;
    float _1221 = _1197 * _1191;
    float _1223 = _1149 * 6.283185482025146484375;
    float _1225 = sin(_1223);
    float _1227 = _1211 * _1191;
    float _1229 = _1211 * _1161;
    float _1231 = _1197 * _1217;
    float _1233 = _1191 * _1217;
    float _1235 = _1211 * _1217;
    float _1237 = _1161 * _1217;
    float _1239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _1241 = sqrt(_1185);
    float _1243 = _1235 * _1213;
    float _1245 = fma(_1225, _1227, _1219);
    float _1247 = _1203 * _1239;
    float _1249 = -_1229;
    float _1251 = fma(_1225, _1221, _1249);
    float _1253 = -_1221;
    float _1255 = fma(_1225, _1229, _1253);
    float _1257 = -_1213;
    float _1259 = _1225 * _1257;
    float _1261 = fma(_1245, _1247, _1243);
    float _1263 = sqrt(_1187);
    float _1265 = _1231 * _1213;
    float _1267 = fma(_1233, _1247, _1259);
    float _1269 = fma(_1255, _1207, _1261);
    float _1271 = fma(_1225, _1219, _1227);
    float _1273 = fma(_1251, _1247, _1265);
    float _1275 = fma(_1237, _1207, _1267);
    float _1277 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1281 = fma(_1271, _1207, _1273);
    float _1283 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1285 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1277);
    float _1287 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1279);
    float _1289 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1285);
    bool _1291 = _1263 < _1283;
    float _1293 = float(_1291);
    float _1295 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1287);
    float _1297 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1299 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1301 = fma(_1297, _1293, _913);
    float _1303 = fma(_1299, _1293, _919);
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1303 + _1309;
    float _1313 = _1307 * _1307;
    float _1315 = fma(_1311, _1311, _1313);
    float _1317 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1319 = sqrt(_1315);
    float _1321 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1317);
    float _1323 = -_1125;
    float _1325 = _933 + _1323;
    float _1327 = -_1127;
    float _1329 = _919 + _1327;
    float _1331 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1321);
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1335 = -_1145;
    float _1337 = _913 + _1335;
    float _1339 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1333);
    float _1343 = fma(_1339, _1293, _933);
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1341);
    bool _1347 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1349 = _1269;
    float _1351 = _1293;
    float _1353 = _1339;
    float _1355 = _1125;
    float _1357 = _1127;
    if (!_1347)
    {
        _1349 = _1303;
    }
    float _1359 = _1349;
    float _1361 = _1359;
    if (!_1347)
    {
        _1351 = _1301;
    }
    float _1363 = _1351;
    float _1365 = _1363;
    if (!_1347)
    {
        _1353 = _1343;
    }
    float _1367 = _1353;
    bool _1369 = !_1347;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1319 + _1375;
        float _1379 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = rsqrt(_1315);
        float _1383 = _1377 * _1373;
        float _1385 = _1383 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = _1389 + (-1.0);
        float _1397 = fma(_1393, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1399 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1401 = _1381 * _1397;
        float _1403 = fma(_1343, _1389, _1399);
        float _1405 = fma(_1311, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1407 = fma(_1307, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1371 = _1403;
        _1361 = _1405;
        _1365 = _1407;
    }
    float _1409 = _1371;
    float _1411 = _1361;
    float _1413 = _1365;
    float _1415 = -_933;
    float _1417 = _1415 + _1409;
    float _1419 = -_919;
    float _1421 = _1419 + _1411;
    float _1423 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1425 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1427 = _1417 * _1417;
    float _1429 = -_913;
    float _1431 = _1429 + _1413;
    float _1433 = 1.0 / _1423;
    float _1435 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1425);
    float _1437 = fma(_1421, _1421, _1427);
    float _1439 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1435);
    float _1441 = fma(_1431, _1431, _1437);
    float _1443 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1445 = sqrt(_1441);
    float _1447 = _1443 + _1423;
    float _1449 = _1447 * _1433;
    float _1451 = _1449 * 0.5;
    bool _1453 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan(0.5);
    bool _1461 = _1457 || _1459;
    float _1463 = -_1145;
    float _1465 = _1463 + _1413;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1469 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
    float _1471 = 1.0 / _1469;
    bool _1473 = _1445 > 0.0;
    bool _1475 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan(0.5);
    bool _1483 = _1479 || _1481;
    float _1485 = -_1127;
    float _1487 = _1485 + _1411;
    float _1489 = -_1125;
    float _1491 = _1489 + _1409;
    float _1493 = _1487;
    float _1495 = _1421;
    float _1497 = _1431;
    float _1499 = _1433;
    float _1501 = _1413;
    float _1503 = _1441;
    float _1505 = _1491;
    if (!_1473)
    {
        _1355 = _1491;
    }
    float _1507 = _1355;
    float _1509 = _1507;
    if (!_1473)
    {
        _1357 = _1465;
    }
    float _1511 = _1357;
    bool _1513 = !_1473;
    float _1515 = _1511;
    if (!_1513)
    {
        float _1517 = _239 * _239;
        float _1519 = fma(_235, _235, _1517);
        float _1521 = rsqrt(_1441);
        float _1523 = fma(_241, _241, _1519);
        float _1525 = sqrt(_1523);
        float _1527 = _1421 * _1521;
        float _1529 = _1417 * _1521;
        float _1531 = _1431 * _1521;
        bool _1533 = _1525 > 0.0;
        float _1535 = _1521;
        float _1537 = _1525;
        _1499 = _1527;
        if (!_1533)
        {
            _1535 = _1491;
        }
        float _1539 = _1535;
        _1509 = _1539;
        if (!_1533)
        {
            _1537 = _1465;
        }
        float _1541 = _1537;
        bool _1543 = !_1533;
        _1515 = _1541;
        if (!_1543)
        {
            float _1545 = rsqrt(_1523);
            float _1547 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1549 = _239 * _1545;
            float _1551 = _235 * _1545;
            float _1553 = _1529 * _1549;
            float _1555 = _241 * _1545;
            float _1557 = fma(_1527, _1551, _1553);
            float _1559 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1561 = fma(_1531, _1555, _1557);
            float _1563 = _1561 * _1559;
            float _1565 = fma(_235, _1563, _1487);
            float _1567 = fma(_239, _1563, _1491);
            float _1569 = fma(_241, _1563, _1465);
            _1493 = _1565;
            _1515 = _1569;
            _1509 = _1567;
            _1495 = _1561;
            _1497 = _1547;
        }
    }
    float _1571 = _1493;
    float _1573 = _1515;
    float _1575 = _1509;
    float _1577 = _1495;
    float _1579 = _1497;
    float _1581 = _1499;
    float _1583 = _1577;
    float _1585 = _1579;
    float _1587 = _1575;
    float _1589 = _1573;
    float _1591 = _1571;
    float _1593 = _1581;
    if (_1461)
    {
        _1501 = 1.0;
    }
    float _1595 = _1501;
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1599 = _1471 * _1597;
    float _1601 = _1595;
    if (_1483)
    {
        _1583 = _1571;
    }
    float _1603 = _1583;
    float _1605 = _1603;
    if (_1483)
    {
        _1585 = _1573;
    }
    float _1607 = _1585;
    float _1609 = _1607;
    if (!_1483)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1613 = _1325 + _1611;
        float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1617 = _1329 + _1615;
        float _1619 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1621 = -_1329;
        float _1623 = _1621 + _1571;
        float _1625 = _1613 * _1613;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1629 = _1337 + _1627;
        float _1631 = -_1337;
        float _1633 = _1631 + _1573;
        float _1635 = fma(_1617, _1617, _1625);
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1639 = fma(_1629, _1629, _1635);
        float _1641 = sqrt(_1639);
        float _1643 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1645 = precise::min(_1641, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1647 = _1645 * _1637;
        float _1649 = -_1325;
        float _1651 = _1649 + _1575;
        float _1653 = _1643 * _1647;
        float _1655 = fma(_1651, _1653, _1325);
        float _1657 = fma(_1623, _1653, _1329);
        float _1659 = fma(_1633, _1653, _1337);
        _1587 = _1655;
        _1605 = _1657;
        _1609 = _1659;
        _1589 = _1633;
        _1591 = _1623;
    }
    float _1661 = _1587;
    float _1663 = _1605;
    float _1665 = _1609;
    float _1667 = _1589;
    float _1669 = _1591;
    float _1671 = _1667;
    float _1673 = _1669;
    if (!_1461)
    {
        float _1675 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1677 = _1675 * 0.15915493667125701904296875;
        float _1679 = _1677 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1685 = _1683 * 0.15915493667125701904296875;
        float _1687 = _1677 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = 1.0 / _1681;
        float _1693 = _1685 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        float _1697 = _1689 * _1691;
        float _1699 = _1685 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = _1695 * _1697;
        float _1709 = 1.0 / _1705;
        float _1711 = 1.0 / _1707;
        float _1713 = _1701 * _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1717 = fma(_1599, _1713, _1715);
        float _1719 = _1717 * _1709;
        float _1721 = precise::clamp(_1719, 0.0, 1.0);
        _1671 = _1685;
        _1503 = _1677;
        _1601 = _1721;
    }
    float _1723 = _1671;
    float _1725 = _1503;
    float _1727 = _1601;
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1731 = _1661 + _1729;
    float _1733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1735 = _1663 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1739 = _1665 + _1737;
    float _1741 = _1731 * _1731;
    float _1743 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1745 = fma(_1735, _1735, _1741);
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1749 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1743);
    float _1751 = fma(_1739, _1739, _1745);
    float _1753 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1749);
    float _1755 = rsqrt(_1751);
    float _1757 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1759 = sqrt(_1751);
    float _1761 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1763 = _1735 * _1761;
    float _1765 = _1739 * _1761;
    float _1767 = _1763 * _1763;
    float _1769 = _1765 * _1765;
    float _1771 = _1767 + _1769;
    float _1773 = sqrt(_1771);
    bool _1775 = _1773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1779 = _1773 + _1777;
    float _1781 = _1723;
    float _1783 = _1779;
    float _1785 = _1731;
    float _1787 = _1765;
    if (_1775)
    {
        float _1789 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1781 = _1789;
    }
    float _1791 = _1781;
    if (_1775)
    {
        float _1793 = rsqrt(_1771);
        _1673 = _1793;
    }
    float _1795 = _1673;
    if (_1775)
    {
        float _1797 = _1779 * _1791;
        _1783 = _1797;
    }
    float _1799 = _1783;
    if (_1775)
    {
        float _1801 = _1799 * 0.15915493667125701904296875;
        _1505 = _1801;
    }
    float _1803 = _1505;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = _1725;
    float _1813 = _1803;
    if (_1775)
    {
        float _1815 = _1803 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = -_1809;
    float _1825 = _1823 + 1.0;
    float _1827 = precise::max(0.0, _1821);
    float _1829 = _1791;
    float _1831 = _1827;
    if (_1775)
    {
        float _1833 = _1803 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = -_1761;
    float _1841 = -_1827;
    float _1843 = fma(_1731, _1839, _1841);
    if (_1775)
    {
        float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1785 = _1845;
    }
    float _1847 = _1785;
    float _1849 = _1847;
    if (!_1775)
    {
        _1813 = _1767;
    }
    float _1851 = _1813;
    float _1853 = _1819;
    float _1855 = _1851;
    if (_1775)
    {
        float _1857 = fma(_1819, _1847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1853 = _1857;
    }
    float _1859 = _1853;
    float _1861 = _1859;
    if (!_1775)
    {
        _1849 = _1843;
    }
    float _1863 = _1849;
    float _1865 = _1863;
    if (_1775)
    {
        float _1867 = _1837 + (-1.0);
        _1831 = _1867;
    }
    float _1869 = _1831;
    float _1871 = _1869;
    if (_1775)
    {
        float _1873 = _1795 * _1859;
        _1593 = _1873;
    }
    float _1875 = _1593;
    if (!_1775)
    {
        _1861 = _1763;
    }
    float _1877 = _1861;
    float _1879 = _1877;
    if (_1775)
    {
        float _1881 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _1881;
    }
    float _1883 = _1871;
    if (_1775)
    {
        float _1885 = _1763 * _1875;
        _1879 = _1885;
    }
    float _1887 = _1879;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1775)
    {
        float _1891 = _1765 * _1875;
        _1787 = _1891;
    }
    float _1893 = _1787;
    if (_1775)
    {
        float _1895 = fma(_1843, _1837, _1883);
        _1865 = _1895;
    }
    float _1897 = _1865;
    if (_1775)
    {
        float _1899 = _1887 * _1887;
        _1855 = _1899;
    }
    float _1901 = _1855;
    float _1903 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1905 = fma(_1329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1775)
    {
        _1889 = _1769;
    }
    float _1907 = _1889;
    float _1909 = _1907;
    if (_1775)
    {
        float _1911 = _1893 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = fma(_1897, _1897, _1901);
    float _1917 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1919 = floor(_1905);
    float _1921 = _1915 + _1913;
    float _1923 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1903);
    float _1925 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1927 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1931 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1933 = rsqrt(_1921);
    float _1935 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1925);
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1939 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1931);
    float _1941 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1939);
    float _1945 = floor(_1927);
    float _1947 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1949 = -_1919;
    float _1951 = _1905 + _1949;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1955 = -_1947;
    float _1957 = fma(_1955, _1747, 1.0);
    float _1959 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1963 = abs(_1825);
    float _1965 = log2(_1963);
    float _1967 = _1933 * _1893;
    float _1969 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1953);
    float _1971 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1961);
    float _1973 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1969);
    float _1975 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1971);
    float _1977 = log2(_1957);
    float _1979 = _1933 * _1887;
    float _1981 = _1933 * _1897;
    float _1983 = -_1945;
    float _1985 = _1927 + _1983;
    float _1987 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1973);
    float _1989 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1991 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1993 = -_1989;
    float _1995 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1993);
    float _1997 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1999 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2001 = exp2(_1991);
    float _2003 = -_1967;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1995);
    float _2007 = _1981 + 1.0;
    float _2009 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1999);
    float _2011 = _1977 * 0.693147182464599609375;
    float _2013 = fma(_2005, -0.5, 0.5);
    float _2015 = fma(_2005, 0.5, 0.5);
    float _2017 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2009);
    float _2019 = 1.0 / _1997;
    float _2021 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2023 = fma(_2015, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2025 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2017);
    float _2027 = fma(_2015, _2023, -0.212114393711090087890625);
    float _2029 = sqrt(_2013);
    float _2031 = -_1981;
    float _2033 = fma(_2001, _2007, _2031);
    float _2035 = fma(_2015, _2027, 1.570728778839111328125);
    float _2037 = fma(_2033, 0.5, 0.5);
    float _2039 = _1987 * _2019;
    float _2041 = _2025 * _2019;
    float _2043 = fma(_2039, 0.5, 0.5);
    float _2045 = fma(_2041, -0.5, 0.5);
    float _2047 = _2029 * 0.636619746685028076171875;
    float2 _6401 = float2(_1951, _1985);
    float _2049 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6401, float2(0.0), isnan(_6401)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6401, float2(0.0), isnan(_6401)), level(0.0)).x;
    float3 _6412 = float3(_2043, _2045, _2021);
    float _2051 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6412, float3(0.0), isnan(_6412)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6412, float3(0.0), isnan(_6412)), level(0.0)).x;
    float _2053 = -_2035;
    float _2055 = fma(_2047, _2053, 1.0);
    float3 _6428 = float3(_2043, _2045, _2021);
    float4 _2058 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6428, float3(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6428, float3(0.0), isnan(_6428)), level(0.0)).xyzw;
    float _2060 = _2058.x;
    float _2062 = _2058.y;
    float _2064 = _2058.z;
    float _2066 = _2058.w;
    float2 _6444 = float2(_2055, _2037);
    float3 _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6444, float2(0.0), isnan(_6444)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6444, float2(0.0), isnan(_6444)), level(0.0)).xyz;
    float _2072 = _2070.x;
    float _2074 = _2070.y;
    float _2076 = _2070.z;
    float _2078 = float(uint(_821));
    float _2080 = trunc(_901);
    int _2082 = int(_2080);
    out.m_74.x = _703;
    out.m_74.y = _707;
    out.m_74.z = _687;
    out.m_74.w = _713;
    float _2084 = _895 * _169;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2088 = _2086 != 0;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2094 = ~_821;
    int _2096 = _2094 + 1;
    float _2098 = 1.0 / _2078;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2104 = -_905;
    float _2106 = _2104 + 1.0;
    float _2108 = -_897;
    float _2110 = _2108 + 1.0;
    out.m_76.x = _1329;
    out.m_76.y = _1325;
    out.m_76.z = _1337;
    float _2112 = float(uint(_2082));
    float _2114 = 1.0 / _2092;
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2118 = _2116 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2120 = float(_2082);
    float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2122;
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2128 = _2126 != 0;
    out.m_78.w = _1103;
    int _2130 = as_type<int>(_2098) + (-2);
    float _2132 = 1.0 / _2102;
    float _2134 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2136 = _2120 >= _869;
    bool _2138 = isnan(_2120);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan(_869);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = as_type<float>(_2130) * _2112;
    int _2150 = ~_821;
    int _2152 = _2150 + 1;
    float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2156 = _2154 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2158 = _755 > 0.5;
    float _2160 = 1.0 / _2118;
    float _2162 = _2124 * _2114;
    float _2164 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2166 = _159 > 0.5;
    float _2168 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2134);
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2170;
    float _2174 = trunc(_2148);
    float _2176 = precise::max(_2174, 0.0);
    uint _2179 = uint(_2176);
    float _2181 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _1203;
    float _2185 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    out.m_82.x = _1663;
    out.m_82.y = _1661;
    out.m_82.z = _1665;
    float _2187 = trunc(_2146);
    int _2189 = int(_2187);
    int _2191 = _2096 * int(_2179);
    int _2193 = _2191 + _2082;
    float _2195 = trunc(_2084);
    int _2197 = int(_2195);
    int _2199 = ~_821;
    int _2201 = _2199 + 1;
    float _2203 = float(uint(_2193));
    int _2205 = ~_2189;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = as_type<float>(_2130) * _2203;
    bool _2213 = !_2128;
    float _2215 = _2213 ? 7.345489978790283203125 : 1.0;
    float _2217 = exp2(_2181);
    float _2219 = _2215 * _159;
    float _2221 = trunc(_2211);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = floor(_2219);
    float _2229 = -_2217;
    float _2231 = _2229 + 1.0;
    float _2233 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2235 = int(_2179) + int(_2225);
    float _2237 = 1.0 / _2156;
    int _2239 = _2152 * _2235;
    int _2241 = _2239 + _2082;
    float _2243 = -_2227;
    float _2245 = _2219 + _2243;
    float _2247 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2249 = _2247 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2253 = _731 + _2251;
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2255;
    bool _2259 = uint(_2241) >= uint(_821);
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2265 = _2245 * _869;
    float _2267 = 1.0 / _2249;
    bool _2269 = !_2259;
    int _2271 = _2269 ? 0 : (-1);
    float _2273 = _2263 * _2132;
    float _2275 = _2172 * _2160;
    float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2279 = _2277 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2281 = ~_2235;
    int _2283 = _2281 + _2271;
    int _2285 = _2283 + 1;
    float _2287 = fma(_2162, _2253, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2289 = _821 == 0;
    float _2291 = trunc(_2265);
    int _2293 = int(_2291);
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2297 = _2295 != 0;
    int _2299 = _821 * _2285;
    int _2301 = _2299 + _2082;
    float _2303 = _2279 * _2237;
    bool _2305 = !_2289;
    int _2307 = _2305 ? _2301 : (-1);
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2311 = _2309 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2313 = !_2297;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2317;
    int _2321 = abs(_917);
    int _2323 = _2307 * _2209;
    int _2325 = abs(_2315);
    float _2327 = 1.0 / _2311;
    int _2329 = _821 + (-1);
    float _2331 = _2319 * _2267;
    int _2333 = abs(_937);
    int _2335 = _2189 * _2329;
    int _2337 = _2335 + _2323;
    int _2339 = _2293 * _2325;
    int _2341 = _2339 + _2082;
    int _2343 = abs(_941);
    int _2345 = _2337 * _2321;
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2351 = !_2088;
    int _2353 = _2351 ? 0 : 1;
    int _2355 = _2197 * _2333;
    int _2357 = _2355 + _2345;
    bool _2359 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2361 = isnan(_731);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2367 = _2363 || _2365;
    float _2369 = float(_2367);
    float _2371 = _2349 * _2327;
    bool _2373 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2375 = isnan(_731);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2381 = _2377 || _2379;
    float _2383 = float(_2381);
    float _2385 = -_2369;
    float _2387 = _2385 + 1.0;
    int _2389 = abs(_2353);
    int _2391 = _2341 * _2343;
    int _2393 = _2391 + _2357;
    bool _2395 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2397 = isnan(_731);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2403 = _2399 || _2401;
    float _2405 = float(_2403);
    float _2407 = _2383 * _2387;
    float _2409 = -_2383;
    float _2411 = _2409 + 1.0;
    int _2413 = _2293 * _2389;
    int _2415 = _2413 + _2393;
    float _2417 = -_2405;
    float _2419 = _2417 + 1.0;
    bool _2421 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2423 = isnan(_731);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    float _2433 = _2405 * _2411;
    float _2435 = float(uint(_2415));
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2441 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2443 = isnan(_731);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = -_2431;
    float _2455 = _2453 + 1.0;
    float _2457 = _2431 * _2419;
    float _2459 = as_type<float>(_2130) * _2435;
    bool _2461 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2463 = isnan(_731);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = _2451 * _2455;
    float _2475 = 1.0 / _2439;
    float _2477 = -_2451;
    float _2479 = _2477 + 1.0;
    bool _2481 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2483 = isnan(_731);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2495 = _731 + _2493;
    bool _2497 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2499 = isnan(_731);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2471 * _2479;
    float _2511 = -_2471;
    float _2513 = _2511 + 1.0;
    float _2515 = -_2491;
    float _2517 = _2515 + 1.0;
    float _2519 = trunc(_2459);
    float _2521 = precise::max(_2519, 0.0);
    uint _2523 = uint(_2521);
    float _2525 = fma(_2273, _2495, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2527 = _2491 * _2513;
    float _2529 = _2507 * _2517;
    float _2531 = -_2507;
    float _2533 = _2531 + 1.0;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2537 = _2535 != 0;
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2541 = _731 + _2539;
    float _2543 = _2257 * _2475;
    float _2545 = _2287 * _2529;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2549 = _731 + _2547;
    float _2551 = fma(_2275, _2541, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2553 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2545);
    float _2555 = float(uint(_2341));
    int _2557 = _2201 * int(_2523);
    int _2559 = _2557 + _2415;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2563 = _731 + _2561;
    float _2565 = fma(_2525, _2527, _2553);
    float _2567 = fma(_2331, _2549, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2571 = _731 + _2569;
    float _2573 = fma(_2303, _2563, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2575 = -_219;
    int _2577 = _2166 ? as_type<int>(_2575) : as_type<int>(_219);
    float _2579 = float(uint(_2559));
    bool _2581 = !_2537;
    float _2583 = _2581 ? _219 : as_type<float>(_2577);
    float _2585 = as_type<float>(_2130) * _2555;
    int _2587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2589 = _2587 != 0;
    float _2591 = as_type<float>(_2130) * _2579;
    float _2593 = fma(_2551, _2509, _2565);
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2597 = _731 + _2595;
    float _2599 = _2583 + 0.5;
    float _2601 = trunc(_2585);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = fma(_2573, _2473, _2593);
    float _2609 = fma(_2543, _2571, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2611 = fma(_2371, _2597, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2613 = fma(_2599, (*spvDescriptorSet0.vp_c9)._m0[80].x, _867);
    int _2615 = ~_821;
    int _2617 = _2615 + 1;
    float _2619 = fma(_2567, _2457, _2607);
    float _2621 = -_223;
    int _2623 = _2158 ? as_type<int>(_2621) : as_type<int>(_223);
    float _2625 = trunc(_2591);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = ~_821;
    int _2633 = _2631 + 1;
    float _2635 = fma(_2611, _2433, _2619);
    bool _2637 = !_2589;
    float _2639 = _2637 ? _223 : as_type<float>(_2623);
    float _2641 = _1283 + (-10.0);
    float _2643 = -_2110;
    float _2645 = fma(_2583, _2643, _2613);
    float _2647 = fma(_2609, _2407, _2635);
    int _2649 = _2617 * int(_2605);
    int _2651 = _2649 + _2341;
    float _2653 = precise::max(_1263, _2641);
    float _2655 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2647);
    float _2657 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2661 = float(uint(_2651));
    float _2663 = precise::min(_1283, _2653);
    float _2665 = -_1225;
    float _2667 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    int _2669 = int(_2523) + int(_2629);
    float _2671 = _2639 + (-0.5);
    float _2673 = as_type<float>(_2130) * _2661;
    float _2675 = -_2641;
    float _2677 = _2675 + _2663;
    out.m_84.x = _2655;
    int _2679 = _2633 * _2669;
    int _2681 = _2679 + _2415;
    float _2683 = -_2671;
    float _2685 = -_903;
    float _2687 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2685);
    float _2689 = fma(_2677, -0.100000001490116119384765625, 1.0);
    float _2691 = trunc(_2673);
    float _2693 = precise::max(_2691, 0.0);
    uint _2695 = uint(_2693);
    int _2697 = ~_821;
    int _2699 = _2697 + 1;
    float _2701 = fma(_2639, _2106, _2687);
    bool _2703 = uint(_2681) >= uint(_821);
    float _2705 = _701 * _2689;
    float _2707 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2709 = !_2703;
    int _2711 = _2709 ? 0 : (-1);
    out.m_86.x = _2645;
    out.m_86.y = _2701;
    int _2713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2715 = _2713 != 0;
    float _2717 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2719 = ~_2669;
    int _2721 = _2719 + _2711;
    int _2723 = _2721 + 1;
    out.m_88.x = _705;
    out.m_88.y = _709;
    out.m_88.z = _711;
    out.m_88.w = _2705;
    float _2725 = -_1225;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2717);
    int _2729 = _821 * _2723;
    int _2731 = _2729 + _2415;
    int _2733 = int(_2605) + int(_2695);
    float _2735 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2737 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2739 = !_2289;
    int _2741 = _2739 ? _2731 : (-1);
    float _2743 = -_1225;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2735);
    float _2747 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2707);
    float _2749 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2737);
    int _2751 = _2741 >> 31;
    int _2753 = _2699 * _2733;
    int _2755 = _2753 + _2341;
    float _2757 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2759 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2667);
    int _2761 = _2751 & 3;
    float _2763 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2765 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2757);
    bool _2767 = uint(_2755) >= uint(_821);
    float _2769 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2771 = _2741 + _2761;
    float _2773 = abs(_1599);
    float _2775 = log2(_2773);
    int _2777 = _2741 & 3;
    bool _2779 = _2777 != 0;
    float _2781 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2769);
    int _2783 = _2771 >> 2;
    float _2785 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2745);
    int _2787 = _2741 & 3;
    bool _2789 = _2787 != 0;
    float _2791 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2765);
    int _2793 = _2783 << 4;
    int _2795 = _2793 + 368;
    float _2797 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2727);
    bool _2799 = uint(_2777) > 1u;
    float _2801 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2763);
    uint _2803 = uint(int(uint(_2795) >> uint(2)));
    uint _2805 = uint(int(uint(int(_2803)) >> uint(2)));
    int _2807 = int(_2803) & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    int _2811 = int(_2803) + 1;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    int _2815 = _2811 & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = _2789 ? 0 : 1;
    float _2821 = _2164 * _2785;
    bool _2823 = !_2767;
    int _2825 = _2823 ? 0 : (-1);
    float _2827 = _2164 * _2797;
    int _2829 = ~_2819;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    float _2835 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2837 = uint(_2777) >= 2u;
    int _2839 = _2795 + 8;
    uint _2841 = uint(int(uint(_2839) >> uint(2)));
    uint _2843 = uint(int(uint(int(_2841)) >> uint(2)));
    int _2845 = int(_2841) & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    int _2849 = int(_2841) + 1;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    int _2853 = _2849 & 3;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[int(_2851)][_2853];
    int _2857 = ~_2733;
    int _2859 = _2857 + _2825;
    int _2861 = _2859 + 1;
    float _2863 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2168);
    int _2865 = _2833;
    if (!_2799)
    {
        int _2867 = ~_2819;
        int _2869 = _2867 + 1;
        _2865 = _2869;
    }
    int _2871 = _2865;
    float _2873 = fma(_2659, _2791, _2821);
    bool _2875 = _2777 != 3;
    float _2877 = exp2(_2835);
    int _2879 = abs(_2871);
    int _2881 = _821 * _2861;
    int _2883 = _2881 + _2341;
    int _2885 = _2837 ? 0 : 1;
    float _2887 = fma(_2659, _2863, _2827);
    int _2889 = ~_2879;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    float _2895 = _2164 * _2759;
    bool _2897 = !_2779;
    int _2899 = _2897 ? 0 : 1;
    float _2901 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2801);
    int _2903 = ~_2885;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2781);
    bool _2911 = _2777 != 3;
    float _2913 = -_2049;
    float _2915 = _2913 + 1.0;
    int _2917 = _2907;
    if (_2875)
    {
        int _2919 = ~_2885;
        int _2921 = _2919 + 1;
        _2917 = _2921;
    }
    int _2923 = _2917;
    float _2925 = _2909 + _2873;
    int _2927 = abs(_2899);
    float _2929 = _2233 * _2051;
    int _2931 = abs(_2923);
    float _2933 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2749);
    int _2935 = ~_2927;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2747);
    bool _2943 = _1599 <= 8000.0;
    bool _2945 = isnan(_1599);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(8000.0);
    bool _2951 = _2947 || _2949;
    float _2953 = float(_2951);
    float _2955 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    int _2959 = _2893 * as_type<int>(_2817);
    bool _2961 = !_2911;
    int _2963 = _2961 ? 0 : (-1);
    float _2965 = _2076 * _2929;
    bool _2967 = !_2715;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = _2939 * as_type<int>(_2809);
    int _2973 = _2971 + _2959;
    int _2975 = abs(_2963);
    float _2977 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2185);
    float _2979 = _2933 + _2887;
    int _2981 = abs(_2969);
    float _2983 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2977);
    float _2985 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2987 = ~_2931;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    float _2993 = fma(_2957, -2.0, 3.0);
    int _2995 = ~_2975;
    int _2997 = _2995 + 1;
    int _2999 = _2997 + 1;
    float _3001 = _2957 * _2957;
    out.gl_Position.x = _1987;
    out.gl_Position.y = _2025;
    out.gl_Position.z = _2983;
    out.gl_Position.w = _1997;
    int _3003 = _2991 * as_type<int>(_2847);
    int _3005 = _3003 + _2973;
    int _3007 = ~_2981;
    int _3009 = _3007 + 1;
    int _3011 = _3009 + 1;
    float _3013 = _3001 * _2993;
    float _3015 = fma(_2659, _2901, _2895);
    int _3017 = _2999 * as_type<int>(_2855);
    int _3019 = _3017 + _3005;
    bool _3021 = !_2289;
    int _3023 = _3021 ? _2883 : (-1);
    float _3025 = -_3013;
    float _3027 = _3025 + 1.0;
    int _3029 = _3019 * _3011;
    float _3031 = _2941 + _3015;
    float _3033 = in.m_90.x;
    float _3035 = fma(_3027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3013);
    int _3037 = _3023 * _2981;
    int _3039 = _3037 + _3029;
    float _3041 = _2983 + _1997;
    float _3043 = _1997 * 0.5;
    float _3045 = _2953 * _3035;
    out.m_92.x = _2925;
    out.m_92.y = _2979;
    out.m_92.z = _3031;
    float _3047 = float(_3039);
    float _3049 = _1987 + _1997;
    float _3051 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3053 = _3041 * 0.5;
    float _3055 = fma(_2025, -0.5, _3043);
    float _3057 = _3049 * 0.5;
    float _3059 = _2915 * _3051;
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = fma(_2066, _2965, _2064);
    out.m_94.x = _3047;
    bool _3065 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3067 = isnan(_1759);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3073 = _3069 || _3071;
    float _3075 = -_3061;
    float _3077 = fma(_3075, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_96.x = _3057;
    out.m_96.y = _3055;
    out.m_96.z = _3053;
    out.m_96.w = _1997;
    float _3079 = _3077 * _3033;
    float _3081 = _3079 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3083 = _2066 * _2929;
    float _3085 = -_2233;
    float _3087 = _3085 + 1.0;
    out.m_98.x = _3081;
    float _3089 = _3053;
    float _3091 = _3083;
    float _3093 = _3087;
    if (!_3073)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3095 = _3089;
    float _3097 = fma(_2072, _3083, _2060);
    float _3099 = fma(_2074, _3083, _2062);
    float _3101 = _2066 * _3087;
    float _3103 = _3095;
    float _3105 = _3095;
    if (!_3073)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3107 = _3091;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3073)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3113 = _3093;
    out.m_100.x = _3097;
    out.m_100.y = _3099;
    out.m_100.z = _3063;
    out.m_100.w = _3101;
    bool _3115 = !_3073;
    float _3117 = _3113;
    float _3119 = _3113;
    if (!_3115)
    {
        bool _3121 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3123 = isnan(_1759);
        bool _3125 = _3121 || _3123;
        bool _3127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3129 = _3125 || _3127;
        if (!_3129)
        {
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3133 = _1759 + _3131;
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3137 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3135;
            float _3139 = 1.0 / _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3149 = _3133 * _3139;
            float _3151 = precise::clamp(_3149, 0.0, 1.0);
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3157 = fma(_3151, _3147, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3159 = fma(_3151, _3155, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3161 = fma(_3151, _3143, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3111 = _3161;
            _3105 = _3159;
            _3119 = _3157;
            _3163 = true;
        }
        else
        {
            bool _3165 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3167 = isnan(_1759);
            bool _3169 = _3165 || _3167;
            bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3173 = _3169 || _3171;
            if (!_3173)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3175 = _3103;
            _3105 = _3175;
            if (!_3173)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3177 = _3109;
            _3111 = _3177;
            if (!_3173)
            {
                _3117 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3179 = _3117;
            bool _3181 = !_3173;
            _3119 = _3179;
            if (!_3181)
            {
                bool _3183 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3185 = isnan(_1759);
                bool _3187 = _3183 || _3185;
                bool _3189 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3191 = _3187 || _3189;
                if (!_3191)
                {
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3195 = _1759 + _3193;
                    float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3199 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3197;
                    float _3201 = 1.0 / _3199;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3211 = _3195 * _3201;
                    float _3213 = precise::clamp(_3211, 0.0, 1.0);
                    float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3219 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3221 = fma(_3213, _3217, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3223 = fma(_3213, _3205, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3111 = _3223;
                    _3105 = _3221;
                    _3119 = _3219;
                    _3163 = true;
                }
                else
                {
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3119 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3163 = false;
    float _3225 = _3111;
    float _3227 = _3105;
    float _3229 = _3119;
    float _3231 = _2985 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_102.x = 0.0;
    float _3233 = _3225 * 0.586610972881317138671875;
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _3231;
    float _3237 = fma(_3227, 0.298911988735198974609375, _3233);
    bool _3239 = _1727 > 0.0;
    bool _3241 = isnan(_1727);
    bool _3243 = _3239 || _3241;
    bool _3245 = isnan(0.0);
    bool _3247 = _3243 || _3245;
    float _3249 = fma(_3229, 0.114477999508380889892578125, _3237);
    float _3251 = -_3249;
    float _3253 = _3251 + _3227;
    float _3255 = -_3249;
    float _3257 = _3255 + _3225;
    float _3259 = -_3249;
    float _3261 = _3259 + _3229;
    float _3263 = fma(_3253, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    float _3265 = fma(_3257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    float _3267 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    bool _3269 = !_3235;
    if (!_3269)
    {
        float _3271 = -_1661;
        float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3275 = -_1663;
        float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3279 = -_1665;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3283 = _3273 * _3273;
        float _3285 = fma(_3277, _3277, _3283);
        float _3287 = fma(_3281, _3281, _3285);
        float _3289 = sqrt(_3287);
        float _3291 = rsqrt(_3287);
        float _3293 = -_3289;
        float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3297 = _3295 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3299 = precise::clamp(_3297, 0.0, 1.0);
        float _3301 = _3277 * _3291;
        float _3303 = _3273 * _3291;
        float _3305 = abs(_3299);
        float _3307 = log2(_3305);
        float _3309 = _3281 * _3291;
        float _3311 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3313 = _2979 * _3303;
        float _3315 = -_3303;
        float _3317 = -_3311;
        float _3319 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3317);
        float _3321 = fma(_2925, _3301, _3313);
        float _3323 = -_3309;
        float _3325 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3319);
        float _3327 = fma(_3031, _3309, _3321);
        float _3329 = precise::clamp(_3327, 0.0, 1.0);
        float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3333 = _3325 + _3331;
        float _3335 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3337 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3339 = precise::clamp(_3337, 0.0, 1.0);
        float _3341 = exp2(_3335);
        float _3343 = _3341 * _3339;
        float _3345 = _3329 * _3343;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3347;
        out.m_102.y = _3349;
        out.m_102.z = _3351;
    }
    out.m_78.x = _3263;
    out.m_78.y = _3265;
    out.m_78.z = _3267;
    if (_3247)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3353;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3163 = false;
    bool _547 = false;
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
        float _3421 = as_type<float>(_145);
        out.gl_Position.z = _3421;
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
    float _159 = in.m_55.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    float _173 = _127 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _147 = as_type<int>(_177);
    }
    int _179 = _147;
    out.m_57.x = _159;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3486 = as_type<float>(_179);
        out.gl_Position.z = _3486;
    }
    out.m_51.x = _173;
    if (_167)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    float _201 = in.m_68.x;
    float _203 = in.m_68.y;
    float _205 = in.m_68.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _259 = _173;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = 1.0 / _271;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = 1.0 / _275;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _263 + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _279;
    float _301 = _295 * _285;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = _263 + _303;
    float _307 = 1.0 / _283;
    float _309 = _267 * _291;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _263 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = _263 + _315;
    bool _319 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _321 = isnan(_263);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _289;
    float _333 = _305 * _299;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_345;
    float _349 = _347 + 1.0;
    float _351 = _313 * _307;
    float _353 = -_329;
    float _355 = _353 + 1.0;
    bool _357 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_263);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _345 * _355;
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _383;
    float _387 = _317 * _331;
    float _389 = _367 * _349;
    float _391 = -_367;
    float _393 = _391 + 1.0;
    bool _395 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_263);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = fma(_385, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _409;
    bool _413 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _415 = isnan(_263);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_381;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = fma(_411, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _435 = _381 * _393;
    float _437 = -_405;
    float _439 = _437 + 1.0;
    float _441 = _405 * _427;
    float _443 = fma(_431, _309, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _423 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -_423;
    float _457 = _455 + 1.0;
    float _459 = fma(_447, _309, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _461 = _407 * _449;
    float _463 = _433 * _449;
    float _465 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _473 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _475 = in.m_70.x;
    float _477 = in.m_70.y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = fma(_443, _441, _471);
    float _485 = fma(_469, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = fma(_459, _441, _473);
    float _493 = fma(_481, _351, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _495;
    float _499 = fma(_465, _435, _483);
    float _501 = fma(_489, _351, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _503;
    float _507 = fma(_485, _435, _491);
    float _509 = fma(_497, _387, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _511 = fma(_493, _389, _499);
    float _513 = fma(_505, _387, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _515 = fma(_501, _389, _507);
    float _517 = fma(_509, _369, _511);
    float _519 = fma(_513, _369, _515);
    float _521 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[148].x, _517);
    float _523 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[148].y, _519);
    float _525 = _521 * _475;
    float _527 = _523 * _477;
    bool _529 = !_297;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _533 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        _545 = _173;
    }
    _547 = false;
    float _549 = _545;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _553 = _549 + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = isnan(_549);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _579 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _581 = isnan(_549);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _557;
    float _593 = -_569;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _597;
    bool _601 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _603 = isnan(_549);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _589 * _595;
    float _615 = -_589;
    float _617 = _615 + 1.0;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _621 = 1.0 / _573;
    float _623 = _611 * _617;
    float _625 = -_611;
    float _627 = _625 + 1.0;
    float _629 = 1.0 / _577;
    float _631 = _599 * _591;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = fma(_631, _553, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _639 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _641 = isnan(_549);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _635 * _621;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = _549 + _657;
    float _661 = _637 * _623;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _665 = _549 + _663;
    float _667 = fma(_651, _659, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _669 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[115].x, _661);
    float _671 = _655 * _629;
    float _673 = -_649;
    float _675 = _673 + 1.0;
    float _677 = fma(_667, _613, _669);
    float _679 = fma(_671, _665, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = _569 * _675;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _685 = fma(_679, _681, _677);
    float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[118].x, _685);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _703 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _689 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _715 = !_619;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _175 = _729;
    }
    float _731 = _175;
    float _733 = in.m_46.x;
    float _735 = in.m_46.y;
    float _737 = in.m_46.z;
    float _739 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _741 = log2(_739);
    float _743 = _159 * 2.0;
    bool _745 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = in.m_55.y;
    float _757 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = in.m_68.w;
    float _761 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _763 = int(_761);
    float _765 = _741 * _127;
    float _767 = floor(_743);
    float _769 = _197 * _735;
    float _771 = _191 * _735;
    float _773 = in.m_55.z;
    float _775 = _203 * _735;
    float _777 = fma(_189, _733, _771);
    float _779 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _781 = fma(_195, _733, _769);
    float _783 = fma(_193, _737, _777);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = fma(_201, _733, _775);
    float _791 = exp2(_765);
    float _793 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _795 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _797 = isnan(1.0);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _803 = _799 || _801;
    float _805 = -_785;
    float _807 = fma(_779, 2.0, _805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = float(_763);
    float _815 = fma(_199, _737, _781);
    float _817 = _159 + _755;
    float _819 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _821 = int(_819);
    float _823 = fma(_205, _737, _789);
    float _825 = fma(_793, -2.0, _787);
    float _827 = _755 * 2.0;
    float _829 = _755 + _773;
    float _831 = _817 + (-1.0);
    float _833 = 1.0 / _811;
    float _835 = _829 + (-1.0);
    float _837 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _839 = _767 > 0.0;
    float _841 = -_791;
    float _843 = _841 + 1.0;
    float _845 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _847 = _767 >= 0.0;
    bool _849 = isnan(_767);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = in.m_64.w;
    float _859 = 1.0 / _813;
    float _861 = _773 * 2.0;
    float _863 = in.m_66.w;
    float _865 = -_127;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[76].x, _807);
    float _869 = float(_821);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _873 = floor(_827);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _877 = _753 ? _843 : 0.0;
    float _879 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _871);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _891 = _889 != 0;
    float _893 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _875);
    float _895 = _869 * _127;
    float _897 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _879);
    float _899 = floor(_861);
    float _901 = _859 * _127;
    float _903 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _825);
    float _905 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    if (_803)
    {
        float _907 = _877 * _833;
        _137 = _907;
    }
    float _909 = _137;
    int _911 = _855 ? 0 : 1;
    float _913 = _823 + _759;
    bool _915 = !_887;
    int _917 = _915 ? 0 : 1;
    float _919 = _783 + _857;
    bool _921 = _873 > 0.0;
    bool _923 = _873 >= 0.0;
    bool _925 = isnan(_873);
    bool _927 = _923 || _925;
    bool _929 = isnan(0.0);
    bool _931 = _927 || _929;
    float _933 = _815 + _863;
    bool _935 = !_883;
    int _937 = _935 ? 0 : 1;
    bool _939 = !_891;
    int _941 = _939 ? 0 : 1;
    bool _943 = _899 >= 0.0;
    bool _945 = isnan(_899);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    int _953 = ~_911;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _969 = _967 != 0;
    int _971 = _957;
    if (!_839)
    {
        int _973 = ~_911;
        int _975 = _973 + 1;
        _971 = _975;
    }
    int _977 = _971;
    float _979 = in.m_72.x;
    float _981 = in.m_72.y;
    float _983 = in.m_72.z;
    bool _985 = !_961;
    int _987 = _985 ? 0 : 1;
    bool _989 = _899 > 0.0;
    bool _991 = !_965;
    int _993 = _991 ? 0 : 1;
    int _995 = abs(_987);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _933 + _997;
    int _1001 = abs(_993);
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1005 = _919 + _1003;
    int _1007 = _931 ? 0 : 1;
    float _1009 = _999 * _999;
    int _1011 = _951 ? 0 : 1;
    float _1013 = float(_977);
    float _1015 = float(_1001);
    int _1017 = ~_1007;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    int _1023 = _1021;
    if (!_921)
    {
        int _1025 = ~_1007;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _913 + _1031;
    float _1035 = fma(_1005, _1005, _1009);
    int _1037 = ~_1011;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    float _1043 = _1015 * _1013;
    int _1045 = _1041;
    if (!_989)
    {
        int _1047 = ~_1011;
        int _1049 = _1047 + 1;
        _1045 = _1049;
    }
    int _1051 = _1045;
    float _1053 = fma(_1033, _1033, _1035);
    float _1055 = float(_995);
    float _1057 = float(_1051);
    float _1059 = _1043 * (-2.0);
    float _1061 = sqrt(_1053);
    bool _1063 = !_969;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = _755 + (-0.5);
    float _1069 = fma(_1059, _981, _981);
    float _1071 = fma(_845, _1059, _845);
    int _1073 = abs(_1065);
    float _1075 = _159 + _773;
    float _1077 = _1055 * _1057;
    float _1079 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1081 = _1075 + (-1.0);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1069);
    float _1085 = rsqrt(_1053);
    float _1087 = float(_1029);
    float _1089 = _1079 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1091 = float(_1073);
    float _1093 = _1061 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1095 = fma(_1071, _909, _1083);
    float _1097 = _1077 * (-2.0);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1101 = _1091 * _1087;
    float _1103 = precise::min(_1089, _1093);
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = fma(_1097, _979, _979);
    float _1109 = _1101 * (-2.0);
    float _1111 = fma(_837, _1097, _837);
    float _1113 = _159 + (-0.5);
    float _1115 = _773 + (-0.5);
    float _1117 = _1085 * _1103;
    float _1119 = fma(_1099, _1109, _1099);
    float _1121 = fma(_1109, _983, _983);
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1107);
    float _1125 = _999 * _1117;
    float _1127 = _1005 * _1117;
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1121);
    float _1131 = fma(_1111, _909, _1123);
    float _1133 = -_1125;
    float _1135 = _999 + _1133;
    float _1137 = -_1127;
    float _1139 = _1005 + _1137;
    float _1141 = fma(_1119, _909, _1129);
    float _1143 = _1135 * _1135;
    float _1145 = _1033 * _1117;
    float _1147 = _1131 * 0.15915493667125701904296875;
    float _1149 = _1141 * 0.15915493667125701904296875;
    float _1151 = fma(_1139, _1139, _1143);
    float _1153 = -_1145;
    float _1155 = _1033 + _1153;
    float _1157 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1159 = _1105 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = fma(_1155, _1155, _1151);
    float _1165 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1167 = _933 + _1165;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1157);
    float _1171 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1173 = _919 + _1171;
    float _1175 = _1167 * _1167;
    float _1177 = sqrt(_1163);
    float _1179 = fma(_1173, _1173, _1175);
    float _1181 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1183 = _913 + _1181;
    float _1185 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1169);
    float _1187 = fma(_1183, _1183, _1179);
    float _1189 = _1105 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1195 = _1147 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = _1085 * _1177;
    float _1201 = _757 * _1199;
    float _1203 = _1079 * _1199;
    float _1205 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1205 * 0.5;
    float _1209 = _1147 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1201 * _1193;
    float _1215 = _1149 * 6.283185482025146484375;
    float _1217 = cos(_1215);
    float _1219 = _1197 * _1161;
    float _1221 = _1197 * _1191;
    float _1223 = _1149 * 6.283185482025146484375;
    float _1225 = sin(_1223);
    float _1227 = _1211 * _1191;
    float _1229 = _1211 * _1161;
    float _1231 = _1197 * _1217;
    float _1233 = _1191 * _1217;
    float _1235 = _1211 * _1217;
    float _1237 = _1161 * _1217;
    float _1239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _1241 = sqrt(_1185);
    float _1243 = _1235 * _1213;
    float _1245 = fma(_1225, _1227, _1219);
    float _1247 = _1203 * _1239;
    float _1249 = -_1229;
    float _1251 = fma(_1225, _1221, _1249);
    float _1253 = -_1221;
    float _1255 = fma(_1225, _1229, _1253);
    float _1257 = -_1213;
    float _1259 = _1225 * _1257;
    float _1261 = fma(_1245, _1247, _1243);
    float _1263 = sqrt(_1187);
    float _1265 = _1231 * _1213;
    float _1267 = fma(_1233, _1247, _1259);
    float _1269 = fma(_1255, _1207, _1261);
    float _1271 = fma(_1225, _1219, _1227);
    float _1273 = fma(_1251, _1247, _1265);
    float _1275 = fma(_1237, _1207, _1267);
    float _1277 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1281 = fma(_1271, _1207, _1273);
    float _1283 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1285 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1277);
    float _1287 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1279);
    float _1289 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1285);
    bool _1291 = _1263 < _1283;
    float _1293 = float(_1291);
    float _1295 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1287);
    float _1297 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1299 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1301 = fma(_1297, _1293, _913);
    float _1303 = fma(_1299, _1293, _919);
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1303 + _1309;
    float _1313 = _1307 * _1307;
    float _1315 = fma(_1311, _1311, _1313);
    float _1317 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1319 = sqrt(_1315);
    float _1321 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1317);
    float _1323 = -_1125;
    float _1325 = _933 + _1323;
    float _1327 = -_1127;
    float _1329 = _919 + _1327;
    float _1331 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1321);
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1335 = -_1145;
    float _1337 = _913 + _1335;
    float _1339 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1333);
    float _1343 = fma(_1339, _1293, _933);
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1341);
    bool _1347 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1349 = _1269;
    float _1351 = _1293;
    float _1353 = _1339;
    float _1355 = _1125;
    float _1357 = _1127;
    if (!_1347)
    {
        _1349 = _1303;
    }
    float _1359 = _1349;
    float _1361 = _1359;
    if (!_1347)
    {
        _1351 = _1301;
    }
    float _1363 = _1351;
    float _1365 = _1363;
    if (!_1347)
    {
        _1353 = _1343;
    }
    float _1367 = _1353;
    bool _1369 = !_1347;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1319 + _1375;
        float _1379 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = rsqrt(_1315);
        float _1383 = _1377 * _1373;
        float _1385 = _1383 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = _1389 + (-1.0);
        float _1397 = fma(_1393, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1399 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1401 = _1381 * _1397;
        float _1403 = fma(_1343, _1389, _1399);
        float _1405 = fma(_1311, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1407 = fma(_1307, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1371 = _1403;
        _1361 = _1405;
        _1365 = _1407;
    }
    float _1409 = _1371;
    float _1411 = _1361;
    float _1413 = _1365;
    float _1415 = -_933;
    float _1417 = _1415 + _1409;
    float _1419 = -_919;
    float _1421 = _1419 + _1411;
    float _1423 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1425 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1427 = _1417 * _1417;
    float _1429 = -_913;
    float _1431 = _1429 + _1413;
    float _1433 = 1.0 / _1423;
    float _1435 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1425);
    float _1437 = fma(_1421, _1421, _1427);
    float _1439 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1435);
    float _1441 = fma(_1431, _1431, _1437);
    float _1443 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1445 = sqrt(_1441);
    float _1447 = _1443 + _1423;
    float _1449 = _1447 * _1433;
    float _1451 = _1449 * 0.5;
    bool _1453 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan(0.5);
    bool _1461 = _1457 || _1459;
    float _1463 = -_1145;
    float _1465 = _1463 + _1413;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1469 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
    float _1471 = 1.0 / _1469;
    bool _1473 = _1445 > 0.0;
    bool _1475 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan(0.5);
    bool _1483 = _1479 || _1481;
    float _1485 = -_1127;
    float _1487 = _1485 + _1411;
    float _1489 = -_1125;
    float _1491 = _1489 + _1409;
    float _1493 = _1487;
    float _1495 = _1421;
    float _1497 = _1431;
    float _1499 = _1433;
    float _1501 = _1413;
    float _1503 = _1441;
    float _1505 = _1491;
    if (!_1473)
    {
        _1355 = _1491;
    }
    float _1507 = _1355;
    float _1509 = _1507;
    if (!_1473)
    {
        _1357 = _1465;
    }
    float _1511 = _1357;
    bool _1513 = !_1473;
    float _1515 = _1511;
    if (!_1513)
    {
        float _1517 = _239 * _239;
        float _1519 = fma(_235, _235, _1517);
        float _1521 = rsqrt(_1441);
        float _1523 = fma(_241, _241, _1519);
        float _1525 = sqrt(_1523);
        float _1527 = _1421 * _1521;
        float _1529 = _1417 * _1521;
        float _1531 = _1431 * _1521;
        bool _1533 = _1525 > 0.0;
        float _1535 = _1521;
        float _1537 = _1525;
        _1499 = _1527;
        if (!_1533)
        {
            _1535 = _1491;
        }
        float _1539 = _1535;
        _1509 = _1539;
        if (!_1533)
        {
            _1537 = _1465;
        }
        float _1541 = _1537;
        bool _1543 = !_1533;
        _1515 = _1541;
        if (!_1543)
        {
            float _1545 = rsqrt(_1523);
            float _1547 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1549 = _239 * _1545;
            float _1551 = _235 * _1545;
            float _1553 = _1529 * _1549;
            float _1555 = _241 * _1545;
            float _1557 = fma(_1527, _1551, _1553);
            float _1559 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1561 = fma(_1531, _1555, _1557);
            float _1563 = _1561 * _1559;
            float _1565 = fma(_235, _1563, _1487);
            float _1567 = fma(_239, _1563, _1491);
            float _1569 = fma(_241, _1563, _1465);
            _1493 = _1565;
            _1515 = _1569;
            _1509 = _1567;
            _1495 = _1561;
            _1497 = _1547;
        }
    }
    float _1571 = _1493;
    float _1573 = _1515;
    float _1575 = _1509;
    float _1577 = _1495;
    float _1579 = _1497;
    float _1581 = _1499;
    float _1583 = _1577;
    float _1585 = _1579;
    float _1587 = _1575;
    float _1589 = _1573;
    float _1591 = _1571;
    float _1593 = _1581;
    if (_1461)
    {
        _1501 = 1.0;
    }
    float _1595 = _1501;
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1599 = _1471 * _1597;
    float _1601 = _1595;
    if (_1483)
    {
        _1583 = _1571;
    }
    float _1603 = _1583;
    float _1605 = _1603;
    if (_1483)
    {
        _1585 = _1573;
    }
    float _1607 = _1585;
    float _1609 = _1607;
    if (!_1483)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1613 = _1325 + _1611;
        float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1617 = _1329 + _1615;
        float _1619 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1621 = -_1329;
        float _1623 = _1621 + _1571;
        float _1625 = _1613 * _1613;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1629 = _1337 + _1627;
        float _1631 = -_1337;
        float _1633 = _1631 + _1573;
        float _1635 = fma(_1617, _1617, _1625);
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1639 = fma(_1629, _1629, _1635);
        float _1641 = sqrt(_1639);
        float _1643 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1645 = precise::min(_1641, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1647 = _1645 * _1637;
        float _1649 = -_1325;
        float _1651 = _1649 + _1575;
        float _1653 = _1643 * _1647;
        float _1655 = fma(_1651, _1653, _1325);
        float _1657 = fma(_1623, _1653, _1329);
        float _1659 = fma(_1633, _1653, _1337);
        _1587 = _1655;
        _1605 = _1657;
        _1609 = _1659;
        _1589 = _1633;
        _1591 = _1623;
    }
    float _1661 = _1587;
    float _1663 = _1605;
    float _1665 = _1609;
    float _1667 = _1589;
    float _1669 = _1591;
    float _1671 = _1667;
    float _1673 = _1669;
    if (!_1461)
    {
        float _1675 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1677 = _1675 * 0.15915493667125701904296875;
        float _1679 = _1677 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1685 = _1683 * 0.15915493667125701904296875;
        float _1687 = _1677 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = 1.0 / _1681;
        float _1693 = _1685 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        float _1697 = _1689 * _1691;
        float _1699 = _1685 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = _1695 * _1697;
        float _1709 = 1.0 / _1705;
        float _1711 = 1.0 / _1707;
        float _1713 = _1701 * _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1717 = fma(_1599, _1713, _1715);
        float _1719 = _1717 * _1709;
        float _1721 = precise::clamp(_1719, 0.0, 1.0);
        _1671 = _1685;
        _1503 = _1677;
        _1601 = _1721;
    }
    float _1723 = _1671;
    float _1725 = _1503;
    float _1727 = _1601;
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1731 = _1661 + _1729;
    float _1733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1735 = _1663 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1739 = _1665 + _1737;
    float _1741 = _1731 * _1731;
    float _1743 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1745 = fma(_1735, _1735, _1741);
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1749 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1743);
    float _1751 = fma(_1739, _1739, _1745);
    float _1753 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1749);
    float _1755 = rsqrt(_1751);
    float _1757 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1759 = sqrt(_1751);
    float _1761 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1763 = _1735 * _1761;
    float _1765 = _1739 * _1761;
    float _1767 = _1763 * _1763;
    float _1769 = _1765 * _1765;
    float _1771 = _1767 + _1769;
    float _1773 = sqrt(_1771);
    bool _1775 = _1773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1779 = _1773 + _1777;
    float _1781 = _1723;
    float _1783 = _1779;
    float _1785 = _1731;
    float _1787 = _1765;
    if (_1775)
    {
        float _1789 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1781 = _1789;
    }
    float _1791 = _1781;
    if (_1775)
    {
        float _1793 = rsqrt(_1771);
        _1673 = _1793;
    }
    float _1795 = _1673;
    if (_1775)
    {
        float _1797 = _1779 * _1791;
        _1783 = _1797;
    }
    float _1799 = _1783;
    if (_1775)
    {
        float _1801 = _1799 * 0.15915493667125701904296875;
        _1505 = _1801;
    }
    float _1803 = _1505;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = _1725;
    float _1813 = _1803;
    if (_1775)
    {
        float _1815 = _1803 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = -_1809;
    float _1825 = _1823 + 1.0;
    float _1827 = precise::max(0.0, _1821);
    float _1829 = _1791;
    float _1831 = _1827;
    if (_1775)
    {
        float _1833 = _1803 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = -_1761;
    float _1841 = -_1827;
    float _1843 = fma(_1731, _1839, _1841);
    if (_1775)
    {
        float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1785 = _1845;
    }
    float _1847 = _1785;
    float _1849 = _1847;
    if (!_1775)
    {
        _1813 = _1767;
    }
    float _1851 = _1813;
    float _1853 = _1819;
    float _1855 = _1851;
    if (_1775)
    {
        float _1857 = fma(_1819, _1847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1853 = _1857;
    }
    float _1859 = _1853;
    float _1861 = _1859;
    if (!_1775)
    {
        _1849 = _1843;
    }
    float _1863 = _1849;
    float _1865 = _1863;
    if (_1775)
    {
        float _1867 = _1837 + (-1.0);
        _1831 = _1867;
    }
    float _1869 = _1831;
    float _1871 = _1869;
    if (_1775)
    {
        float _1873 = _1795 * _1859;
        _1593 = _1873;
    }
    float _1875 = _1593;
    if (!_1775)
    {
        _1861 = _1763;
    }
    float _1877 = _1861;
    float _1879 = _1877;
    if (_1775)
    {
        float _1881 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _1881;
    }
    float _1883 = _1871;
    if (_1775)
    {
        float _1885 = _1763 * _1875;
        _1879 = _1885;
    }
    float _1887 = _1879;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1775)
    {
        float _1891 = _1765 * _1875;
        _1787 = _1891;
    }
    float _1893 = _1787;
    if (_1775)
    {
        float _1895 = fma(_1843, _1837, _1883);
        _1865 = _1895;
    }
    float _1897 = _1865;
    if (_1775)
    {
        float _1899 = _1887 * _1887;
        _1855 = _1899;
    }
    float _1901 = _1855;
    float _1903 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1905 = fma(_1329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1775)
    {
        _1889 = _1769;
    }
    float _1907 = _1889;
    float _1909 = _1907;
    if (_1775)
    {
        float _1911 = _1893 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = fma(_1897, _1897, _1901);
    float _1917 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1919 = floor(_1905);
    float _1921 = _1915 + _1913;
    float _1923 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1903);
    float _1925 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1927 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1931 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1933 = rsqrt(_1921);
    float _1935 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1925);
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1939 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1931);
    float _1941 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1939);
    float _1945 = floor(_1927);
    float _1947 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1949 = -_1919;
    float _1951 = _1905 + _1949;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1955 = -_1947;
    float _1957 = fma(_1955, _1747, 1.0);
    float _1959 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1963 = abs(_1825);
    float _1965 = log2(_1963);
    float _1967 = _1933 * _1893;
    float _1969 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1953);
    float _1971 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1961);
    float _1973 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1969);
    float _1975 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1971);
    float _1977 = log2(_1957);
    float _1979 = _1933 * _1887;
    float _1981 = _1933 * _1897;
    float _1983 = -_1945;
    float _1985 = _1927 + _1983;
    float _1987 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1973);
    float _1989 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1991 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1993 = -_1989;
    float _1995 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1993);
    float _1997 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1999 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2001 = exp2(_1991);
    float _2003 = -_1967;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1995);
    float _2007 = _1981 + 1.0;
    float _2009 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1999);
    float _2011 = _1977 * 0.693147182464599609375;
    float _2013 = fma(_2005, -0.5, 0.5);
    float _2015 = fma(_2005, 0.5, 0.5);
    float _2017 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2009);
    float _2019 = 1.0 / _1997;
    float _2021 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2023 = fma(_2015, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2025 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2017);
    float _2027 = fma(_2015, _2023, -0.212114393711090087890625);
    float _2029 = sqrt(_2013);
    float _2031 = -_1981;
    float _2033 = fma(_2001, _2007, _2031);
    float _2035 = fma(_2015, _2027, 1.570728778839111328125);
    float _2037 = fma(_2033, 0.5, 0.5);
    float _2039 = _1987 * _2019;
    float _2041 = _2025 * _2019;
    float _2043 = fma(_2039, 0.5, 0.5);
    float _2045 = fma(_2041, -0.5, 0.5);
    float _2047 = _2029 * 0.636619746685028076171875;
    float2 _6401 = float2(_1951, _1985);
    float _2049 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6401, float2(0.0), isnan(_6401)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6401, float2(0.0), isnan(_6401)), level(0.0)).x;
    float3 _6412 = float3(_2043, _2045, _2021);
    float _2051 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6412, float3(0.0), isnan(_6412)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6412, float3(0.0), isnan(_6412)), level(0.0)).x;
    float _2053 = -_2035;
    float _2055 = fma(_2047, _2053, 1.0);
    float3 _6428 = float3(_2043, _2045, _2021);
    float4 _2058 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6428, float3(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6428, float3(0.0), isnan(_6428)), level(0.0)).xyzw;
    float _2060 = _2058.x;
    float _2062 = _2058.y;
    float _2064 = _2058.z;
    float _2066 = _2058.w;
    float2 _6444 = float2(_2055, _2037);
    float3 _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6444, float2(0.0), isnan(_6444)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6444, float2(0.0), isnan(_6444)), level(0.0)).xyz;
    float _2072 = _2070.x;
    float _2074 = _2070.y;
    float _2076 = _2070.z;
    float _2078 = float(uint(_821));
    float _2080 = trunc(_901);
    int _2082 = int(_2080);
    out.m_74.x = _703;
    out.m_74.y = _707;
    out.m_74.z = _687;
    out.m_74.w = _713;
    float _2084 = _895 * _169;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2088 = _2086 != 0;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2094 = ~_821;
    int _2096 = _2094 + 1;
    float _2098 = 1.0 / _2078;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2104 = -_905;
    float _2106 = _2104 + 1.0;
    float _2108 = -_897;
    float _2110 = _2108 + 1.0;
    out.m_76.x = _1329;
    out.m_76.y = _1325;
    out.m_76.z = _1337;
    float _2112 = float(uint(_2082));
    float _2114 = 1.0 / _2092;
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2118 = _2116 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2120 = float(_2082);
    float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2122;
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2128 = _2126 != 0;
    out.m_78.w = _1103;
    int _2130 = as_type<int>(_2098) + (-2);
    float _2132 = 1.0 / _2102;
    float _2134 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2136 = _2120 >= _869;
    bool _2138 = isnan(_2120);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan(_869);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = as_type<float>(_2130) * _2112;
    int _2150 = ~_821;
    int _2152 = _2150 + 1;
    float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2156 = _2154 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2158 = _755 > 0.5;
    float _2160 = 1.0 / _2118;
    float _2162 = _2124 * _2114;
    float _2164 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2166 = _159 > 0.5;
    float _2168 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2134);
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2170;
    float _2174 = trunc(_2148);
    float _2176 = precise::max(_2174, 0.0);
    uint _2179 = uint(_2176);
    float _2181 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _1203;
    float _2185 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    out.m_82.x = _1663;
    out.m_82.y = _1661;
    out.m_82.z = _1665;
    float _2187 = trunc(_2146);
    int _2189 = int(_2187);
    int _2191 = _2096 * int(_2179);
    int _2193 = _2191 + _2082;
    float _2195 = trunc(_2084);
    int _2197 = int(_2195);
    int _2199 = ~_821;
    int _2201 = _2199 + 1;
    float _2203 = float(uint(_2193));
    int _2205 = ~_2189;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = as_type<float>(_2130) * _2203;
    bool _2213 = !_2128;
    float _2215 = _2213 ? 7.345489978790283203125 : 1.0;
    float _2217 = exp2(_2181);
    float _2219 = _2215 * _159;
    float _2221 = trunc(_2211);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = floor(_2219);
    float _2229 = -_2217;
    float _2231 = _2229 + 1.0;
    float _2233 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2235 = int(_2179) + int(_2225);
    float _2237 = 1.0 / _2156;
    int _2239 = _2152 * _2235;
    int _2241 = _2239 + _2082;
    float _2243 = -_2227;
    float _2245 = _2219 + _2243;
    float _2247 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2249 = _2247 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2253 = _731 + _2251;
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2255;
    bool _2259 = uint(_2241) >= uint(_821);
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2265 = _2245 * _869;
    float _2267 = 1.0 / _2249;
    bool _2269 = !_2259;
    int _2271 = _2269 ? 0 : (-1);
    float _2273 = _2263 * _2132;
    float _2275 = _2172 * _2160;
    float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2279 = _2277 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2281 = ~_2235;
    int _2283 = _2281 + _2271;
    int _2285 = _2283 + 1;
    float _2287 = fma(_2162, _2253, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2289 = _821 == 0;
    float _2291 = trunc(_2265);
    int _2293 = int(_2291);
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2297 = _2295 != 0;
    int _2299 = _821 * _2285;
    int _2301 = _2299 + _2082;
    float _2303 = _2279 * _2237;
    bool _2305 = !_2289;
    int _2307 = _2305 ? _2301 : (-1);
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2311 = _2309 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2313 = !_2297;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2317;
    int _2321 = abs(_917);
    int _2323 = _2307 * _2209;
    int _2325 = abs(_2315);
    float _2327 = 1.0 / _2311;
    int _2329 = _821 + (-1);
    float _2331 = _2319 * _2267;
    int _2333 = abs(_937);
    int _2335 = _2189 * _2329;
    int _2337 = _2335 + _2323;
    int _2339 = _2293 * _2325;
    int _2341 = _2339 + _2082;
    int _2343 = abs(_941);
    int _2345 = _2337 * _2321;
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2351 = !_2088;
    int _2353 = _2351 ? 0 : 1;
    int _2355 = _2197 * _2333;
    int _2357 = _2355 + _2345;
    bool _2359 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2361 = isnan(_731);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2367 = _2363 || _2365;
    float _2369 = float(_2367);
    float _2371 = _2349 * _2327;
    bool _2373 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2375 = isnan(_731);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2381 = _2377 || _2379;
    float _2383 = float(_2381);
    float _2385 = -_2369;
    float _2387 = _2385 + 1.0;
    int _2389 = abs(_2353);
    int _2391 = _2341 * _2343;
    int _2393 = _2391 + _2357;
    bool _2395 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2397 = isnan(_731);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2403 = _2399 || _2401;
    float _2405 = float(_2403);
    float _2407 = _2383 * _2387;
    float _2409 = -_2383;
    float _2411 = _2409 + 1.0;
    int _2413 = _2293 * _2389;
    int _2415 = _2413 + _2393;
    float _2417 = -_2405;
    float _2419 = _2417 + 1.0;
    bool _2421 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2423 = isnan(_731);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    float _2433 = _2405 * _2411;
    float _2435 = float(uint(_2415));
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2441 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2443 = isnan(_731);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = -_2431;
    float _2455 = _2453 + 1.0;
    float _2457 = _2431 * _2419;
    float _2459 = as_type<float>(_2130) * _2435;
    bool _2461 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2463 = isnan(_731);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = _2451 * _2455;
    float _2475 = 1.0 / _2439;
    float _2477 = -_2451;
    float _2479 = _2477 + 1.0;
    bool _2481 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2483 = isnan(_731);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2495 = _731 + _2493;
    bool _2497 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2499 = isnan(_731);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2471 * _2479;
    float _2511 = -_2471;
    float _2513 = _2511 + 1.0;
    float _2515 = -_2491;
    float _2517 = _2515 + 1.0;
    float _2519 = trunc(_2459);
    float _2521 = precise::max(_2519, 0.0);
    uint _2523 = uint(_2521);
    float _2525 = fma(_2273, _2495, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2527 = _2491 * _2513;
    float _2529 = _2507 * _2517;
    float _2531 = -_2507;
    float _2533 = _2531 + 1.0;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2537 = _2535 != 0;
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2541 = _731 + _2539;
    float _2543 = _2257 * _2475;
    float _2545 = _2287 * _2529;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2549 = _731 + _2547;
    float _2551 = fma(_2275, _2541, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2553 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2545);
    float _2555 = float(uint(_2341));
    int _2557 = _2201 * int(_2523);
    int _2559 = _2557 + _2415;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2563 = _731 + _2561;
    float _2565 = fma(_2525, _2527, _2553);
    float _2567 = fma(_2331, _2549, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2571 = _731 + _2569;
    float _2573 = fma(_2303, _2563, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2575 = -_219;
    int _2577 = _2166 ? as_type<int>(_2575) : as_type<int>(_219);
    float _2579 = float(uint(_2559));
    bool _2581 = !_2537;
    float _2583 = _2581 ? _219 : as_type<float>(_2577);
    float _2585 = as_type<float>(_2130) * _2555;
    int _2587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2589 = _2587 != 0;
    float _2591 = as_type<float>(_2130) * _2579;
    float _2593 = fma(_2551, _2509, _2565);
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2597 = _731 + _2595;
    float _2599 = _2583 + 0.5;
    float _2601 = trunc(_2585);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = fma(_2573, _2473, _2593);
    float _2609 = fma(_2543, _2571, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2611 = fma(_2371, _2597, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2613 = fma(_2599, (*spvDescriptorSet0.vp_c9)._m0[80].x, _867);
    int _2615 = ~_821;
    int _2617 = _2615 + 1;
    float _2619 = fma(_2567, _2457, _2607);
    float _2621 = -_223;
    int _2623 = _2158 ? as_type<int>(_2621) : as_type<int>(_223);
    float _2625 = trunc(_2591);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = ~_821;
    int _2633 = _2631 + 1;
    float _2635 = fma(_2611, _2433, _2619);
    bool _2637 = !_2589;
    float _2639 = _2637 ? _223 : as_type<float>(_2623);
    float _2641 = _1283 + (-10.0);
    float _2643 = -_2110;
    float _2645 = fma(_2583, _2643, _2613);
    float _2647 = fma(_2609, _2407, _2635);
    int _2649 = _2617 * int(_2605);
    int _2651 = _2649 + _2341;
    float _2653 = precise::max(_1263, _2641);
    float _2655 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2647);
    float _2657 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2661 = float(uint(_2651));
    float _2663 = precise::min(_1283, _2653);
    float _2665 = -_1225;
    float _2667 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    int _2669 = int(_2523) + int(_2629);
    float _2671 = _2639 + (-0.5);
    float _2673 = as_type<float>(_2130) * _2661;
    float _2675 = -_2641;
    float _2677 = _2675 + _2663;
    out.m_84.x = _2655;
    int _2679 = _2633 * _2669;
    int _2681 = _2679 + _2415;
    float _2683 = -_2671;
    float _2685 = -_903;
    float _2687 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2685);
    float _2689 = fma(_2677, -0.100000001490116119384765625, 1.0);
    float _2691 = trunc(_2673);
    float _2693 = precise::max(_2691, 0.0);
    uint _2695 = uint(_2693);
    int _2697 = ~_821;
    int _2699 = _2697 + 1;
    float _2701 = fma(_2639, _2106, _2687);
    bool _2703 = uint(_2681) >= uint(_821);
    float _2705 = _701 * _2689;
    float _2707 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2709 = !_2703;
    int _2711 = _2709 ? 0 : (-1);
    out.m_86.x = _2645;
    out.m_86.y = _2701;
    int _2713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2715 = _2713 != 0;
    float _2717 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2719 = ~_2669;
    int _2721 = _2719 + _2711;
    int _2723 = _2721 + 1;
    out.m_88.x = _705;
    out.m_88.y = _709;
    out.m_88.z = _711;
    out.m_88.w = _2705;
    float _2725 = -_1225;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2717);
    int _2729 = _821 * _2723;
    int _2731 = _2729 + _2415;
    int _2733 = int(_2605) + int(_2695);
    float _2735 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2737 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2739 = !_2289;
    int _2741 = _2739 ? _2731 : (-1);
    float _2743 = -_1225;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2735);
    float _2747 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2707);
    float _2749 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2737);
    int _2751 = _2741 >> 31;
    int _2753 = _2699 * _2733;
    int _2755 = _2753 + _2341;
    float _2757 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2759 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2667);
    int _2761 = _2751 & 3;
    float _2763 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2765 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2757);
    bool _2767 = uint(_2755) >= uint(_821);
    float _2769 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2771 = _2741 + _2761;
    float _2773 = abs(_1599);
    float _2775 = log2(_2773);
    int _2777 = _2741 & 3;
    bool _2779 = _2777 != 0;
    float _2781 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2769);
    int _2783 = _2771 >> 2;
    float _2785 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2745);
    int _2787 = _2741 & 3;
    bool _2789 = _2787 != 0;
    float _2791 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2765);
    int _2793 = _2783 << 4;
    int _2795 = _2793 + 368;
    float _2797 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2727);
    bool _2799 = uint(_2777) > 1u;
    float _2801 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2763);
    uint _2803 = uint(int(uint(_2795) >> uint(2)));
    uint _2805 = uint(int(uint(int(_2803)) >> uint(2)));
    int _2807 = int(_2803) & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    int _2811 = int(_2803) + 1;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    int _2815 = _2811 & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = _2789 ? 0 : 1;
    float _2821 = _2164 * _2785;
    bool _2823 = !_2767;
    int _2825 = _2823 ? 0 : (-1);
    float _2827 = _2164 * _2797;
    int _2829 = ~_2819;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    float _2835 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2837 = uint(_2777) >= 2u;
    int _2839 = _2795 + 8;
    uint _2841 = uint(int(uint(_2839) >> uint(2)));
    uint _2843 = uint(int(uint(int(_2841)) >> uint(2)));
    int _2845 = int(_2841) & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    int _2849 = int(_2841) + 1;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    int _2853 = _2849 & 3;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[int(_2851)][_2853];
    int _2857 = ~_2733;
    int _2859 = _2857 + _2825;
    int _2861 = _2859 + 1;
    float _2863 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2168);
    int _2865 = _2833;
    if (!_2799)
    {
        int _2867 = ~_2819;
        int _2869 = _2867 + 1;
        _2865 = _2869;
    }
    int _2871 = _2865;
    float _2873 = fma(_2659, _2791, _2821);
    bool _2875 = _2777 != 3;
    float _2877 = exp2(_2835);
    int _2879 = abs(_2871);
    int _2881 = _821 * _2861;
    int _2883 = _2881 + _2341;
    int _2885 = _2837 ? 0 : 1;
    float _2887 = fma(_2659, _2863, _2827);
    int _2889 = ~_2879;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    float _2895 = _2164 * _2759;
    bool _2897 = !_2779;
    int _2899 = _2897 ? 0 : 1;
    float _2901 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2801);
    int _2903 = ~_2885;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2781);
    bool _2911 = _2777 != 3;
    float _2913 = -_2049;
    float _2915 = _2913 + 1.0;
    int _2917 = _2907;
    if (_2875)
    {
        int _2919 = ~_2885;
        int _2921 = _2919 + 1;
        _2917 = _2921;
    }
    int _2923 = _2917;
    float _2925 = _2909 + _2873;
    int _2927 = abs(_2899);
    float _2929 = _2233 * _2051;
    int _2931 = abs(_2923);
    float _2933 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2749);
    int _2935 = ~_2927;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2747);
    bool _2943 = _1599 <= 8000.0;
    bool _2945 = isnan(_1599);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(8000.0);
    bool _2951 = _2947 || _2949;
    float _2953 = float(_2951);
    float _2955 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    int _2959 = _2893 * as_type<int>(_2817);
    bool _2961 = !_2911;
    int _2963 = _2961 ? 0 : (-1);
    float _2965 = _2076 * _2929;
    bool _2967 = !_2715;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = _2939 * as_type<int>(_2809);
    int _2973 = _2971 + _2959;
    int _2975 = abs(_2963);
    float _2977 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2185);
    float _2979 = _2933 + _2887;
    int _2981 = abs(_2969);
    float _2983 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2977);
    float _2985 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2987 = ~_2931;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    float _2993 = fma(_2957, -2.0, 3.0);
    int _2995 = ~_2975;
    int _2997 = _2995 + 1;
    int _2999 = _2997 + 1;
    float _3001 = _2957 * _2957;
    out.gl_Position.x = _1987;
    out.gl_Position.y = _2025;
    out.gl_Position.z = _2983;
    out.gl_Position.w = _1997;
    int _3003 = _2991 * as_type<int>(_2847);
    int _3005 = _3003 + _2973;
    int _3007 = ~_2981;
    int _3009 = _3007 + 1;
    int _3011 = _3009 + 1;
    float _3013 = _3001 * _2993;
    float _3015 = fma(_2659, _2901, _2895);
    int _3017 = _2999 * as_type<int>(_2855);
    int _3019 = _3017 + _3005;
    bool _3021 = !_2289;
    int _3023 = _3021 ? _2883 : (-1);
    float _3025 = -_3013;
    float _3027 = _3025 + 1.0;
    int _3029 = _3019 * _3011;
    float _3031 = _2941 + _3015;
    float _3033 = in.m_90.x;
    float _3035 = fma(_3027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3013);
    int _3037 = _3023 * _2981;
    int _3039 = _3037 + _3029;
    float _3041 = _2983 + _1997;
    float _3043 = _1997 * 0.5;
    float _3045 = _2953 * _3035;
    out.m_92.x = _2925;
    out.m_92.y = _2979;
    out.m_92.z = _3031;
    float _3047 = float(_3039);
    float _3049 = _1987 + _1997;
    float _3051 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3053 = _3041 * 0.5;
    float _3055 = fma(_2025, -0.5, _3043);
    float _3057 = _3049 * 0.5;
    float _3059 = _2915 * _3051;
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = fma(_2066, _2965, _2064);
    out.m_94.x = _3047;
    bool _3065 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3067 = isnan(_1759);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3073 = _3069 || _3071;
    float _3075 = -_3061;
    float _3077 = fma(_3075, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_96.x = _3057;
    out.m_96.y = _3055;
    out.m_96.z = _3053;
    out.m_96.w = _1997;
    float _3079 = _3077 * _3033;
    float _3081 = _3079 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3083 = _2066 * _2929;
    float _3085 = -_2233;
    float _3087 = _3085 + 1.0;
    out.m_98.x = _3081;
    float _3089 = _3053;
    float _3091 = _3083;
    float _3093 = _3087;
    if (!_3073)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3095 = _3089;
    float _3097 = fma(_2072, _3083, _2060);
    float _3099 = fma(_2074, _3083, _2062);
    float _3101 = _2066 * _3087;
    float _3103 = _3095;
    float _3105 = _3095;
    if (!_3073)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3107 = _3091;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3073)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3113 = _3093;
    out.m_100.x = _3097;
    out.m_100.y = _3099;
    out.m_100.z = _3063;
    out.m_100.w = _3101;
    bool _3115 = !_3073;
    float _3117 = _3113;
    float _3119 = _3113;
    if (!_3115)
    {
        bool _3121 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3123 = isnan(_1759);
        bool _3125 = _3121 || _3123;
        bool _3127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3129 = _3125 || _3127;
        if (!_3129)
        {
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3133 = _1759 + _3131;
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3137 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3135;
            float _3139 = 1.0 / _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3149 = _3133 * _3139;
            float _3151 = precise::clamp(_3149, 0.0, 1.0);
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3157 = fma(_3151, _3147, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3159 = fma(_3151, _3155, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3161 = fma(_3151, _3143, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3111 = _3161;
            _3105 = _3159;
            _3119 = _3157;
            _3163 = true;
        }
        else
        {
            bool _3165 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3167 = isnan(_1759);
            bool _3169 = _3165 || _3167;
            bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3173 = _3169 || _3171;
            if (!_3173)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3175 = _3103;
            _3105 = _3175;
            if (!_3173)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3177 = _3109;
            _3111 = _3177;
            if (!_3173)
            {
                _3117 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3179 = _3117;
            bool _3181 = !_3173;
            _3119 = _3179;
            if (!_3181)
            {
                bool _3183 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3185 = isnan(_1759);
                bool _3187 = _3183 || _3185;
                bool _3189 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3191 = _3187 || _3189;
                if (!_3191)
                {
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3195 = _1759 + _3193;
                    float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3199 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3197;
                    float _3201 = 1.0 / _3199;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3211 = _3195 * _3201;
                    float _3213 = precise::clamp(_3211, 0.0, 1.0);
                    float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3219 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3221 = fma(_3213, _3217, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3223 = fma(_3213, _3205, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3111 = _3223;
                    _3105 = _3221;
                    _3119 = _3219;
                    _3163 = true;
                }
                else
                {
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3119 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3163 = false;
    float _3225 = _3111;
    float _3227 = _3105;
    float _3229 = _3119;
    float _3231 = _2985 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_102.x = 0.0;
    float _3233 = _3225 * 0.586610972881317138671875;
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _3231;
    float _3237 = fma(_3227, 0.298911988735198974609375, _3233);
    bool _3239 = _1727 > 0.0;
    bool _3241 = isnan(_1727);
    bool _3243 = _3239 || _3241;
    bool _3245 = isnan(0.0);
    bool _3247 = _3243 || _3245;
    float _3249 = fma(_3229, 0.114477999508380889892578125, _3237);
    float _3251 = -_3249;
    float _3253 = _3251 + _3227;
    float _3255 = -_3249;
    float _3257 = _3255 + _3225;
    float _3259 = -_3249;
    float _3261 = _3259 + _3229;
    float _3263 = fma(_3253, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    float _3265 = fma(_3257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    float _3267 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    bool _3269 = !_3235;
    if (!_3269)
    {
        float _3271 = -_1661;
        float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3275 = -_1663;
        float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3279 = -_1665;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3283 = _3273 * _3273;
        float _3285 = fma(_3277, _3277, _3283);
        float _3287 = fma(_3281, _3281, _3285);
        float _3289 = sqrt(_3287);
        float _3291 = rsqrt(_3287);
        float _3293 = -_3289;
        float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3297 = _3295 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3299 = precise::clamp(_3297, 0.0, 1.0);
        float _3301 = _3277 * _3291;
        float _3303 = _3273 * _3291;
        float _3305 = abs(_3299);
        float _3307 = log2(_3305);
        float _3309 = _3281 * _3291;
        float _3311 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3313 = _2979 * _3303;
        float _3315 = -_3303;
        float _3317 = -_3311;
        float _3319 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3317);
        float _3321 = fma(_2925, _3301, _3313);
        float _3323 = -_3309;
        float _3325 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3319);
        float _3327 = fma(_3031, _3309, _3321);
        float _3329 = precise::clamp(_3327, 0.0, 1.0);
        float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3333 = _3325 + _3331;
        float _3335 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3337 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3339 = precise::clamp(_3337, 0.0, 1.0);
        float _3341 = exp2(_3335);
        float _3343 = _3341 * _3339;
        float _3345 = _3329 * _3343;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3347;
        out.m_102.y = _3349;
        out.m_102.z = _3351;
    }
    out.m_78.x = _3263;
    out.m_78.y = _3265;
    out.m_78.z = _3267;
    if (_3247)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3353;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3163 = false;
    bool _547 = false;
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
        float _3421 = as_type<float>(_145);
        out.gl_Position.z = _3421;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = in.m_55.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    float _173 = _127 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _147 = as_type<int>(_177);
    }
    int _179 = _147;
    out.m_57.x = _159;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3486 = as_type<float>(_179);
        out.gl_Position.z = _3486;
    }
    out.m_51.x = _173;
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    float _201 = in.m_68.x;
    float _203 = in.m_68.y;
    float _205 = in.m_68.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _259 = _173;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = 1.0 / _271;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    float _291 = 1.0 / _275;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _263 + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _279;
    float _301 = _295 * _285;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = _263 + _303;
    float _307 = 1.0 / _283;
    float _309 = _267 * _291;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _263 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = _263 + _315;
    bool _319 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _321 = isnan(_263);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = 1.0 / _289;
    float _333 = _305 * _299;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_345;
    float _349 = _347 + 1.0;
    float _351 = _313 * _307;
    float _353 = -_329;
    float _355 = _353 + 1.0;
    bool _357 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_263);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _345 * _355;
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _383;
    float _387 = _317 * _331;
    float _389 = _367 * _349;
    float _391 = -_367;
    float _393 = _391 + 1.0;
    bool _395 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_263);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = fma(_385, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _409;
    bool _413 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _415 = isnan(_263);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_381;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = fma(_411, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _435 = _381 * _393;
    float _437 = -_405;
    float _439 = _437 + 1.0;
    float _441 = _405 * _427;
    float _443 = fma(_431, _309, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = _423 * _439;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -_423;
    float _457 = _455 + 1.0;
    float _459 = fma(_447, _309, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _461 = _407 * _449;
    float _463 = _433 * _449;
    float _465 = fma(_453, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].x, _461);
    float _473 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].y, _463);
    float _475 = in.m_70.x;
    float _477 = in.m_70.y;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = fma(_443, _441, _471);
    float _485 = fma(_469, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = fma(_459, _441, _473);
    float _493 = fma(_481, _351, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _495;
    float _499 = fma(_465, _435, _483);
    float _501 = fma(_489, _351, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _503;
    float _507 = fma(_485, _435, _491);
    float _509 = fma(_497, _387, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _511 = fma(_493, _389, _499);
    float _513 = fma(_505, _387, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _515 = fma(_501, _389, _507);
    float _517 = fma(_509, _369, _511);
    float _519 = fma(_513, _369, _515);
    float _521 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[148].x, _517);
    float _523 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[148].y, _519);
    float _525 = _521 * _475;
    float _527 = _523 * _477;
    bool _529 = !_297;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _533 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        _545 = _173;
    }
    _547 = false;
    float _549 = _545;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _553 = _549 + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = isnan(_549);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _579 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _581 = isnan(_549);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _557;
    float _593 = -_569;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _597;
    bool _601 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _603 = isnan(_549);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _589 * _595;
    float _615 = -_589;
    float _617 = _615 + 1.0;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _621 = 1.0 / _573;
    float _623 = _611 * _617;
    float _625 = -_611;
    float _627 = _625 + 1.0;
    float _629 = 1.0 / _577;
    float _631 = _599 * _591;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = fma(_631, _553, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _639 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _641 = isnan(_549);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = _635 * _621;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = _549 + _657;
    float _661 = _637 * _623;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _665 = _549 + _663;
    float _667 = fma(_651, _659, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _669 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[115].x, _661);
    float _671 = _655 * _629;
    float _673 = -_649;
    float _675 = _673 + 1.0;
    float _677 = fma(_667, _613, _669);
    float _679 = fma(_671, _665, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _681 = _569 * _675;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _685 = fma(_679, _681, _677);
    float _687 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[118].x, _685);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _703 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _689 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _715 = !_619;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _159 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _175 = _729;
    }
    float _731 = _175;
    float _733 = in.m_46.x;
    float _735 = in.m_46.y;
    float _737 = in.m_46.z;
    float _739 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _741 = log2(_739);
    float _743 = _159 * 2.0;
    bool _745 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = in.m_55.y;
    float _757 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = in.m_68.w;
    float _761 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _763 = int(_761);
    float _765 = _741 * _127;
    float _767 = floor(_743);
    float _769 = _197 * _735;
    float _771 = _191 * _735;
    float _773 = in.m_55.z;
    float _775 = _203 * _735;
    float _777 = fma(_189, _733, _771);
    float _779 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _781 = fma(_195, _733, _769);
    float _783 = fma(_193, _737, _777);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = fma(_201, _733, _775);
    float _791 = exp2(_765);
    float _793 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _795 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _797 = isnan(1.0);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _803 = _799 || _801;
    float _805 = -_785;
    float _807 = fma(_779, 2.0, _805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = float(_763);
    float _815 = fma(_199, _737, _781);
    float _817 = _159 + _755;
    float _819 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _821 = int(_819);
    float _823 = fma(_205, _737, _789);
    float _825 = fma(_793, -2.0, _787);
    float _827 = _755 * 2.0;
    float _829 = _755 + _773;
    float _831 = _817 + (-1.0);
    float _833 = 1.0 / _811;
    float _835 = _829 + (-1.0);
    float _837 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _839 = _767 > 0.0;
    float _841 = -_791;
    float _843 = _841 + 1.0;
    float _845 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _847 = _767 >= 0.0;
    bool _849 = isnan(_767);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = in.m_64.w;
    float _859 = 1.0 / _813;
    float _861 = _773 * 2.0;
    float _863 = in.m_66.w;
    float _865 = -_127;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[76].x, _807);
    float _869 = float(_821);
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _873 = floor(_827);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _877 = _753 ? _843 : 0.0;
    float _879 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _871);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _891 = _889 != 0;
    float _893 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _875);
    float _895 = _869 * _127;
    float _897 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _879);
    float _899 = floor(_861);
    float _901 = _859 * _127;
    float _903 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _825);
    float _905 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _893);
    if (_803)
    {
        float _907 = _877 * _833;
        _137 = _907;
    }
    float _909 = _137;
    int _911 = _855 ? 0 : 1;
    float _913 = _823 + _759;
    bool _915 = !_887;
    int _917 = _915 ? 0 : 1;
    float _919 = _783 + _857;
    bool _921 = _873 > 0.0;
    bool _923 = _873 >= 0.0;
    bool _925 = isnan(_873);
    bool _927 = _923 || _925;
    bool _929 = isnan(0.0);
    bool _931 = _927 || _929;
    float _933 = _815 + _863;
    bool _935 = !_883;
    int _937 = _935 ? 0 : 1;
    bool _939 = !_891;
    int _941 = _939 ? 0 : 1;
    bool _943 = _899 >= 0.0;
    bool _945 = isnan(_899);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    int _953 = ~_911;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _969 = _967 != 0;
    int _971 = _957;
    if (!_839)
    {
        int _973 = ~_911;
        int _975 = _973 + 1;
        _971 = _975;
    }
    int _977 = _971;
    float _979 = in.m_72.x;
    float _981 = in.m_72.y;
    float _983 = in.m_72.z;
    bool _985 = !_961;
    int _987 = _985 ? 0 : 1;
    bool _989 = _899 > 0.0;
    bool _991 = !_965;
    int _993 = _991 ? 0 : 1;
    int _995 = abs(_987);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _933 + _997;
    int _1001 = abs(_993);
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1005 = _919 + _1003;
    int _1007 = _931 ? 0 : 1;
    float _1009 = _999 * _999;
    int _1011 = _951 ? 0 : 1;
    float _1013 = float(_977);
    float _1015 = float(_1001);
    int _1017 = ~_1007;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    int _1023 = _1021;
    if (!_921)
    {
        int _1025 = ~_1007;
        int _1027 = _1025 + 1;
        _1023 = _1027;
    }
    int _1029 = _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _913 + _1031;
    float _1035 = fma(_1005, _1005, _1009);
    int _1037 = ~_1011;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    float _1043 = _1015 * _1013;
    int _1045 = _1041;
    if (!_989)
    {
        int _1047 = ~_1011;
        int _1049 = _1047 + 1;
        _1045 = _1049;
    }
    int _1051 = _1045;
    float _1053 = fma(_1033, _1033, _1035);
    float _1055 = float(_995);
    float _1057 = float(_1051);
    float _1059 = _1043 * (-2.0);
    float _1061 = sqrt(_1053);
    bool _1063 = !_969;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = _755 + (-0.5);
    float _1069 = fma(_1059, _981, _981);
    float _1071 = fma(_845, _1059, _845);
    int _1073 = abs(_1065);
    float _1075 = _159 + _773;
    float _1077 = _1055 * _1057;
    float _1079 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1081 = _1075 + (-1.0);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1069);
    float _1085 = rsqrt(_1053);
    float _1087 = float(_1029);
    float _1089 = _1079 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1091 = float(_1073);
    float _1093 = _1061 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1095 = fma(_1071, _909, _1083);
    float _1097 = _1077 * (-2.0);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1101 = _1091 * _1087;
    float _1103 = precise::min(_1089, _1093);
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = fma(_1097, _979, _979);
    float _1109 = _1101 * (-2.0);
    float _1111 = fma(_837, _1097, _837);
    float _1113 = _159 + (-0.5);
    float _1115 = _773 + (-0.5);
    float _1117 = _1085 * _1103;
    float _1119 = fma(_1099, _1109, _1099);
    float _1121 = fma(_1109, _983, _983);
    float _1123 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1107);
    float _1125 = _999 * _1117;
    float _1127 = _1005 * _1117;
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1121);
    float _1131 = fma(_1111, _909, _1123);
    float _1133 = -_1125;
    float _1135 = _999 + _1133;
    float _1137 = -_1127;
    float _1139 = _1005 + _1137;
    float _1141 = fma(_1119, _909, _1129);
    float _1143 = _1135 * _1135;
    float _1145 = _1033 * _1117;
    float _1147 = _1131 * 0.15915493667125701904296875;
    float _1149 = _1141 * 0.15915493667125701904296875;
    float _1151 = fma(_1139, _1139, _1143);
    float _1153 = -_1145;
    float _1155 = _1033 + _1153;
    float _1157 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1159 = _1105 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = fma(_1155, _1155, _1151);
    float _1165 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1167 = _933 + _1165;
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1157);
    float _1171 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1173 = _919 + _1171;
    float _1175 = _1167 * _1167;
    float _1177 = sqrt(_1163);
    float _1179 = fma(_1173, _1173, _1175);
    float _1181 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1183 = _913 + _1181;
    float _1185 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1169);
    float _1187 = fma(_1183, _1183, _1179);
    float _1189 = _1105 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _1195 = _1147 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = _1085 * _1177;
    float _1201 = _757 * _1199;
    float _1203 = _1079 * _1199;
    float _1205 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1207 = _1205 * 0.5;
    float _1209 = _1147 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1201 * _1193;
    float _1215 = _1149 * 6.283185482025146484375;
    float _1217 = cos(_1215);
    float _1219 = _1197 * _1161;
    float _1221 = _1197 * _1191;
    float _1223 = _1149 * 6.283185482025146484375;
    float _1225 = sin(_1223);
    float _1227 = _1211 * _1191;
    float _1229 = _1211 * _1161;
    float _1231 = _1197 * _1217;
    float _1233 = _1191 * _1217;
    float _1235 = _1211 * _1217;
    float _1237 = _1161 * _1217;
    float _1239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _1241 = sqrt(_1185);
    float _1243 = _1235 * _1213;
    float _1245 = fma(_1225, _1227, _1219);
    float _1247 = _1203 * _1239;
    float _1249 = -_1229;
    float _1251 = fma(_1225, _1221, _1249);
    float _1253 = -_1221;
    float _1255 = fma(_1225, _1229, _1253);
    float _1257 = -_1213;
    float _1259 = _1225 * _1257;
    float _1261 = fma(_1245, _1247, _1243);
    float _1263 = sqrt(_1187);
    float _1265 = _1231 * _1213;
    float _1267 = fma(_1233, _1247, _1259);
    float _1269 = fma(_1255, _1207, _1261);
    float _1271 = fma(_1225, _1219, _1227);
    float _1273 = fma(_1251, _1247, _1265);
    float _1275 = fma(_1237, _1207, _1267);
    float _1277 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1279 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1281 = fma(_1271, _1207, _1273);
    float _1283 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1285 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1277);
    float _1287 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1279);
    float _1289 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1285);
    bool _1291 = _1263 < _1283;
    float _1293 = float(_1291);
    float _1295 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1287);
    float _1297 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1299 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1301 = fma(_1297, _1293, _913);
    float _1303 = fma(_1299, _1293, _919);
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1301 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1303 + _1309;
    float _1313 = _1307 * _1307;
    float _1315 = fma(_1311, _1311, _1313);
    float _1317 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1319 = sqrt(_1315);
    float _1321 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1317);
    float _1323 = -_1125;
    float _1325 = _933 + _1323;
    float _1327 = -_1127;
    float _1329 = _919 + _1327;
    float _1331 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1321);
    float _1333 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1335 = -_1145;
    float _1337 = _913 + _1335;
    float _1339 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1333);
    float _1343 = fma(_1339, _1293, _933);
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1341);
    bool _1347 = _1319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1349 = _1269;
    float _1351 = _1293;
    float _1353 = _1339;
    float _1355 = _1125;
    float _1357 = _1127;
    if (!_1347)
    {
        _1349 = _1303;
    }
    float _1359 = _1349;
    float _1361 = _1359;
    if (!_1347)
    {
        _1351 = _1301;
    }
    float _1363 = _1351;
    float _1365 = _1363;
    if (!_1347)
    {
        _1353 = _1343;
    }
    float _1367 = _1353;
    bool _1369 = !_1347;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1319 + _1375;
        float _1379 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = rsqrt(_1315);
        float _1383 = _1377 * _1373;
        float _1385 = _1383 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = _1389 + (-1.0);
        float _1397 = fma(_1393, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1399 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1401 = _1381 * _1397;
        float _1403 = fma(_1343, _1389, _1399);
        float _1405 = fma(_1311, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1407 = fma(_1307, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1371 = _1403;
        _1361 = _1405;
        _1365 = _1407;
    }
    float _1409 = _1371;
    float _1411 = _1361;
    float _1413 = _1365;
    float _1415 = -_933;
    float _1417 = _1415 + _1409;
    float _1419 = -_919;
    float _1421 = _1419 + _1411;
    float _1423 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1425 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1427 = _1417 * _1417;
    float _1429 = -_913;
    float _1431 = _1429 + _1413;
    float _1433 = 1.0 / _1423;
    float _1435 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1425);
    float _1437 = fma(_1421, _1421, _1427);
    float _1439 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1435);
    float _1441 = fma(_1431, _1431, _1437);
    float _1443 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1445 = sqrt(_1441);
    float _1447 = _1443 + _1423;
    float _1449 = _1447 * _1433;
    float _1451 = _1449 * 0.5;
    bool _1453 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan(0.5);
    bool _1461 = _1457 || _1459;
    float _1463 = -_1145;
    float _1465 = _1463 + _1413;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1469 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
    float _1471 = 1.0 / _1469;
    bool _1473 = _1445 > 0.0;
    bool _1475 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan(0.5);
    bool _1483 = _1479 || _1481;
    float _1485 = -_1127;
    float _1487 = _1485 + _1411;
    float _1489 = -_1125;
    float _1491 = _1489 + _1409;
    float _1493 = _1487;
    float _1495 = _1421;
    float _1497 = _1431;
    float _1499 = _1433;
    float _1501 = _1413;
    float _1503 = _1441;
    float _1505 = _1491;
    if (!_1473)
    {
        _1355 = _1491;
    }
    float _1507 = _1355;
    float _1509 = _1507;
    if (!_1473)
    {
        _1357 = _1465;
    }
    float _1511 = _1357;
    bool _1513 = !_1473;
    float _1515 = _1511;
    if (!_1513)
    {
        float _1517 = _239 * _239;
        float _1519 = fma(_235, _235, _1517);
        float _1521 = rsqrt(_1441);
        float _1523 = fma(_241, _241, _1519);
        float _1525 = sqrt(_1523);
        float _1527 = _1421 * _1521;
        float _1529 = _1417 * _1521;
        float _1531 = _1431 * _1521;
        bool _1533 = _1525 > 0.0;
        float _1535 = _1521;
        float _1537 = _1525;
        _1499 = _1527;
        if (!_1533)
        {
            _1535 = _1491;
        }
        float _1539 = _1535;
        _1509 = _1539;
        if (!_1533)
        {
            _1537 = _1465;
        }
        float _1541 = _1537;
        bool _1543 = !_1533;
        _1515 = _1541;
        if (!_1543)
        {
            float _1545 = rsqrt(_1523);
            float _1547 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1549 = _239 * _1545;
            float _1551 = _235 * _1545;
            float _1553 = _1529 * _1549;
            float _1555 = _241 * _1545;
            float _1557 = fma(_1527, _1551, _1553);
            float _1559 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1561 = fma(_1531, _1555, _1557);
            float _1563 = _1561 * _1559;
            float _1565 = fma(_235, _1563, _1487);
            float _1567 = fma(_239, _1563, _1491);
            float _1569 = fma(_241, _1563, _1465);
            _1493 = _1565;
            _1515 = _1569;
            _1509 = _1567;
            _1495 = _1561;
            _1497 = _1547;
        }
    }
    float _1571 = _1493;
    float _1573 = _1515;
    float _1575 = _1509;
    float _1577 = _1495;
    float _1579 = _1497;
    float _1581 = _1499;
    float _1583 = _1577;
    float _1585 = _1579;
    float _1587 = _1575;
    float _1589 = _1573;
    float _1591 = _1571;
    float _1593 = _1581;
    if (_1461)
    {
        _1501 = 1.0;
    }
    float _1595 = _1501;
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1599 = _1471 * _1597;
    float _1601 = _1595;
    if (_1483)
    {
        _1583 = _1571;
    }
    float _1603 = _1583;
    float _1605 = _1603;
    if (_1483)
    {
        _1585 = _1573;
    }
    float _1607 = _1585;
    float _1609 = _1607;
    if (!_1483)
    {
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1613 = _1325 + _1611;
        float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1617 = _1329 + _1615;
        float _1619 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1621 = -_1329;
        float _1623 = _1621 + _1571;
        float _1625 = _1613 * _1613;
        float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1629 = _1337 + _1627;
        float _1631 = -_1337;
        float _1633 = _1631 + _1573;
        float _1635 = fma(_1617, _1617, _1625);
        float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1639 = fma(_1629, _1629, _1635);
        float _1641 = sqrt(_1639);
        float _1643 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1645 = precise::min(_1641, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1647 = _1645 * _1637;
        float _1649 = -_1325;
        float _1651 = _1649 + _1575;
        float _1653 = _1643 * _1647;
        float _1655 = fma(_1651, _1653, _1325);
        float _1657 = fma(_1623, _1653, _1329);
        float _1659 = fma(_1633, _1653, _1337);
        _1587 = _1655;
        _1605 = _1657;
        _1609 = _1659;
        _1589 = _1633;
        _1591 = _1623;
    }
    float _1661 = _1587;
    float _1663 = _1605;
    float _1665 = _1609;
    float _1667 = _1589;
    float _1669 = _1591;
    float _1671 = _1667;
    float _1673 = _1669;
    if (!_1461)
    {
        float _1675 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1677 = _1675 * 0.15915493667125701904296875;
        float _1679 = _1677 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1685 = _1683 * 0.15915493667125701904296875;
        float _1687 = _1677 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = 1.0 / _1681;
        float _1693 = _1685 * 6.283185482025146484375;
        float _1695 = cos(_1693);
        float _1697 = _1689 * _1691;
        float _1699 = _1685 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = _1695 * _1697;
        float _1709 = 1.0 / _1705;
        float _1711 = 1.0 / _1707;
        float _1713 = _1701 * _1711;
        float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1717 = fma(_1599, _1713, _1715);
        float _1719 = _1717 * _1709;
        float _1721 = precise::clamp(_1719, 0.0, 1.0);
        _1671 = _1685;
        _1503 = _1677;
        _1601 = _1721;
    }
    float _1723 = _1671;
    float _1725 = _1503;
    float _1727 = _1601;
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1731 = _1661 + _1729;
    float _1733 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1735 = _1663 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1739 = _1665 + _1737;
    float _1741 = _1731 * _1731;
    float _1743 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1745 = fma(_1735, _1735, _1741);
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1749 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1743);
    float _1751 = fma(_1739, _1739, _1745);
    float _1753 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1749);
    float _1755 = rsqrt(_1751);
    float _1757 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1759 = sqrt(_1751);
    float _1761 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1763 = _1735 * _1761;
    float _1765 = _1739 * _1761;
    float _1767 = _1763 * _1763;
    float _1769 = _1765 * _1765;
    float _1771 = _1767 + _1769;
    float _1773 = sqrt(_1771);
    bool _1775 = _1773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1779 = _1773 + _1777;
    float _1781 = _1723;
    float _1783 = _1779;
    float _1785 = _1731;
    float _1787 = _1765;
    if (_1775)
    {
        float _1789 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1781 = _1789;
    }
    float _1791 = _1781;
    if (_1775)
    {
        float _1793 = rsqrt(_1771);
        _1673 = _1793;
    }
    float _1795 = _1673;
    if (_1775)
    {
        float _1797 = _1779 * _1791;
        _1783 = _1797;
    }
    float _1799 = _1783;
    if (_1775)
    {
        float _1801 = _1799 * 0.15915493667125701904296875;
        _1505 = _1801;
    }
    float _1803 = _1505;
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = _1725;
    float _1813 = _1803;
    if (_1775)
    {
        float _1815 = _1803 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = -_1809;
    float _1825 = _1823 + 1.0;
    float _1827 = precise::max(0.0, _1821);
    float _1829 = _1791;
    float _1831 = _1827;
    if (_1775)
    {
        float _1833 = _1803 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = -_1761;
    float _1841 = -_1827;
    float _1843 = fma(_1731, _1839, _1841);
    if (_1775)
    {
        float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1785 = _1845;
    }
    float _1847 = _1785;
    float _1849 = _1847;
    if (!_1775)
    {
        _1813 = _1767;
    }
    float _1851 = _1813;
    float _1853 = _1819;
    float _1855 = _1851;
    if (_1775)
    {
        float _1857 = fma(_1819, _1847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1853 = _1857;
    }
    float _1859 = _1853;
    float _1861 = _1859;
    if (!_1775)
    {
        _1849 = _1843;
    }
    float _1863 = _1849;
    float _1865 = _1863;
    if (_1775)
    {
        float _1867 = _1837 + (-1.0);
        _1831 = _1867;
    }
    float _1869 = _1831;
    float _1871 = _1869;
    if (_1775)
    {
        float _1873 = _1795 * _1859;
        _1593 = _1873;
    }
    float _1875 = _1593;
    if (!_1775)
    {
        _1861 = _1763;
    }
    float _1877 = _1861;
    float _1879 = _1877;
    if (_1775)
    {
        float _1881 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1871 = _1881;
    }
    float _1883 = _1871;
    if (_1775)
    {
        float _1885 = _1763 * _1875;
        _1879 = _1885;
    }
    float _1887 = _1879;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1775)
    {
        float _1891 = _1765 * _1875;
        _1787 = _1891;
    }
    float _1893 = _1787;
    if (_1775)
    {
        float _1895 = fma(_1843, _1837, _1883);
        _1865 = _1895;
    }
    float _1897 = _1865;
    if (_1775)
    {
        float _1899 = _1887 * _1887;
        _1855 = _1899;
    }
    float _1901 = _1855;
    float _1903 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1905 = fma(_1329, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1775)
    {
        _1889 = _1769;
    }
    float _1907 = _1889;
    float _1909 = _1907;
    if (_1775)
    {
        float _1911 = _1893 * _1893;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = fma(_1897, _1897, _1901);
    float _1917 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1919 = floor(_1905);
    float _1921 = _1915 + _1913;
    float _1923 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1903);
    float _1925 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1927 = fma(_1337, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1931 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1933 = rsqrt(_1921);
    float _1935 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1925);
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1939 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1931);
    float _1941 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1939);
    float _1945 = floor(_1927);
    float _1947 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1949 = -_1919;
    float _1951 = _1905 + _1949;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1955 = -_1947;
    float _1957 = fma(_1955, _1747, 1.0);
    float _1959 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1963 = abs(_1825);
    float _1965 = log2(_1963);
    float _1967 = _1933 * _1893;
    float _1969 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1953);
    float _1971 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1961);
    float _1973 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1969);
    float _1975 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1971);
    float _1977 = log2(_1957);
    float _1979 = _1933 * _1887;
    float _1981 = _1933 * _1897;
    float _1983 = -_1945;
    float _1985 = _1927 + _1983;
    float _1987 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1973);
    float _1989 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1991 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1993 = -_1989;
    float _1995 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1993);
    float _1997 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1999 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2001 = exp2(_1991);
    float _2003 = -_1967;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1995);
    float _2007 = _1981 + 1.0;
    float _2009 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1999);
    float _2011 = _1977 * 0.693147182464599609375;
    float _2013 = fma(_2005, -0.5, 0.5);
    float _2015 = fma(_2005, 0.5, 0.5);
    float _2017 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2009);
    float _2019 = 1.0 / _1997;
    float _2021 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2023 = fma(_2015, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2025 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2017);
    float _2027 = fma(_2015, _2023, -0.212114393711090087890625);
    float _2029 = sqrt(_2013);
    float _2031 = -_1981;
    float _2033 = fma(_2001, _2007, _2031);
    float _2035 = fma(_2015, _2027, 1.570728778839111328125);
    float _2037 = fma(_2033, 0.5, 0.5);
    float _2039 = _1987 * _2019;
    float _2041 = _2025 * _2019;
    float _2043 = fma(_2039, 0.5, 0.5);
    float _2045 = fma(_2041, -0.5, 0.5);
    float _2047 = _2029 * 0.636619746685028076171875;
    float2 _6401 = float2(_1951, _1985);
    float _2049 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6401, float2(0.0), isnan(_6401)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6401, float2(0.0), isnan(_6401)), level(0.0)).x;
    float3 _6412 = float3(_2043, _2045, _2021);
    float _2051 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6412, float3(0.0), isnan(_6412)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6412, float3(0.0), isnan(_6412)), level(0.0)).x;
    float _2053 = -_2035;
    float _2055 = fma(_2047, _2053, 1.0);
    float3 _6428 = float3(_2043, _2045, _2021);
    float4 _2058 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6428, float3(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6428, float3(0.0), isnan(_6428)), level(0.0)).xyzw;
    float _2060 = _2058.x;
    float _2062 = _2058.y;
    float _2064 = _2058.z;
    float _2066 = _2058.w;
    float2 _6444 = float2(_2055, _2037);
    float3 _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6444, float2(0.0), isnan(_6444)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6444, float2(0.0), isnan(_6444)), level(0.0)).xyz;
    float _2072 = _2070.x;
    float _2074 = _2070.y;
    float _2076 = _2070.z;
    float _2078 = float(uint(_821));
    float _2080 = trunc(_901);
    int _2082 = int(_2080);
    out.m_74.x = _703;
    out.m_74.y = _707;
    out.m_74.z = _687;
    out.m_74.w = _713;
    float _2084 = _895 * _169;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2088 = _2086 != 0;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2092 = _2090 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2094 = ~_821;
    int _2096 = _2094 + 1;
    float _2098 = 1.0 / _2078;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2104 = -_905;
    float _2106 = _2104 + 1.0;
    float _2108 = -_897;
    float _2110 = _2108 + 1.0;
    out.m_76.x = _1329;
    out.m_76.y = _1325;
    out.m_76.z = _1337;
    float _2112 = float(uint(_2082));
    float _2114 = 1.0 / _2092;
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2118 = _2116 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2120 = float(_2082);
    float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2122;
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2128 = _2126 != 0;
    out.m_78.w = _1103;
    int _2130 = as_type<int>(_2098) + (-2);
    float _2132 = 1.0 / _2102;
    float _2134 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2136 = _2120 >= _869;
    bool _2138 = isnan(_2120);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan(_869);
    bool _2144 = _2140 || _2142;
    float _2146 = float(_2144);
    float _2148 = as_type<float>(_2130) * _2112;
    int _2150 = ~_821;
    int _2152 = _2150 + 1;
    float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2156 = _2154 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2158 = _755 > 0.5;
    float _2160 = 1.0 / _2118;
    float _2162 = _2124 * _2114;
    float _2164 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2166 = _159 > 0.5;
    float _2168 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2134);
    float _2170 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2170;
    float _2174 = trunc(_2148);
    float _2176 = precise::max(_2174, 0.0);
    uint _2179 = uint(_2176);
    float _2181 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _1203;
    float _2185 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    out.m_82.x = _1663;
    out.m_82.y = _1661;
    out.m_82.z = _1665;
    float _2187 = trunc(_2146);
    int _2189 = int(_2187);
    int _2191 = _2096 * int(_2179);
    int _2193 = _2191 + _2082;
    float _2195 = trunc(_2084);
    int _2197 = int(_2195);
    int _2199 = ~_821;
    int _2201 = _2199 + 1;
    float _2203 = float(uint(_2193));
    int _2205 = ~_2189;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = as_type<float>(_2130) * _2203;
    bool _2213 = !_2128;
    float _2215 = _2213 ? 7.345489978790283203125 : 1.0;
    float _2217 = exp2(_2181);
    float _2219 = _2215 * _159;
    float _2221 = trunc(_2211);
    float _2223 = precise::max(_2221, 0.0);
    uint _2225 = uint(_2223);
    float _2227 = floor(_2219);
    float _2229 = -_2217;
    float _2231 = _2229 + 1.0;
    float _2233 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2235 = int(_2179) + int(_2225);
    float _2237 = 1.0 / _2156;
    int _2239 = _2152 * _2235;
    int _2241 = _2239 + _2082;
    float _2243 = -_2227;
    float _2245 = _2219 + _2243;
    float _2247 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2249 = _2247 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2253 = _731 + _2251;
    float _2255 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2255;
    bool _2259 = uint(_2241) >= uint(_821);
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2265 = _2245 * _869;
    float _2267 = 1.0 / _2249;
    bool _2269 = !_2259;
    int _2271 = _2269 ? 0 : (-1);
    float _2273 = _2263 * _2132;
    float _2275 = _2172 * _2160;
    float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2279 = _2277 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2281 = ~_2235;
    int _2283 = _2281 + _2271;
    int _2285 = _2283 + 1;
    float _2287 = fma(_2162, _2253, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2289 = _821 == 0;
    float _2291 = trunc(_2265);
    int _2293 = int(_2291);
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2297 = _2295 != 0;
    int _2299 = _821 * _2285;
    int _2301 = _2299 + _2082;
    float _2303 = _2279 * _2237;
    bool _2305 = !_2289;
    int _2307 = _2305 ? _2301 : (-1);
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2311 = _2309 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2313 = !_2297;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2317;
    int _2321 = abs(_917);
    int _2323 = _2307 * _2209;
    int _2325 = abs(_2315);
    float _2327 = 1.0 / _2311;
    int _2329 = _821 + (-1);
    float _2331 = _2319 * _2267;
    int _2333 = abs(_937);
    int _2335 = _2189 * _2329;
    int _2337 = _2335 + _2323;
    int _2339 = _2293 * _2325;
    int _2341 = _2339 + _2082;
    int _2343 = abs(_941);
    int _2345 = _2337 * _2321;
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2349 = _2347 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2351 = !_2088;
    int _2353 = _2351 ? 0 : 1;
    int _2355 = _2197 * _2333;
    int _2357 = _2355 + _2345;
    bool _2359 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2361 = isnan(_731);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2367 = _2363 || _2365;
    float _2369 = float(_2367);
    float _2371 = _2349 * _2327;
    bool _2373 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2375 = isnan(_731);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2381 = _2377 || _2379;
    float _2383 = float(_2381);
    float _2385 = -_2369;
    float _2387 = _2385 + 1.0;
    int _2389 = abs(_2353);
    int _2391 = _2341 * _2343;
    int _2393 = _2391 + _2357;
    bool _2395 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2397 = isnan(_731);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2403 = _2399 || _2401;
    float _2405 = float(_2403);
    float _2407 = _2383 * _2387;
    float _2409 = -_2383;
    float _2411 = _2409 + 1.0;
    int _2413 = _2293 * _2389;
    int _2415 = _2413 + _2393;
    float _2417 = -_2405;
    float _2419 = _2417 + 1.0;
    bool _2421 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2423 = isnan(_731);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2429 = _2425 || _2427;
    float _2431 = float(_2429);
    float _2433 = _2405 * _2411;
    float _2435 = float(uint(_2415));
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2441 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2443 = isnan(_731);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = -_2431;
    float _2455 = _2453 + 1.0;
    float _2457 = _2431 * _2419;
    float _2459 = as_type<float>(_2130) * _2435;
    bool _2461 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2463 = isnan(_731);
    bool _2465 = _2461 || _2463;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2469 = _2465 || _2467;
    float _2471 = float(_2469);
    float _2473 = _2451 * _2455;
    float _2475 = 1.0 / _2439;
    float _2477 = -_2451;
    float _2479 = _2477 + 1.0;
    bool _2481 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2483 = isnan(_731);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2495 = _731 + _2493;
    bool _2497 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2499 = isnan(_731);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2471 * _2479;
    float _2511 = -_2471;
    float _2513 = _2511 + 1.0;
    float _2515 = -_2491;
    float _2517 = _2515 + 1.0;
    float _2519 = trunc(_2459);
    float _2521 = precise::max(_2519, 0.0);
    uint _2523 = uint(_2521);
    float _2525 = fma(_2273, _2495, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2527 = _2491 * _2513;
    float _2529 = _2507 * _2517;
    float _2531 = -_2507;
    float _2533 = _2531 + 1.0;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2537 = _2535 != 0;
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2541 = _731 + _2539;
    float _2543 = _2257 * _2475;
    float _2545 = _2287 * _2529;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2549 = _731 + _2547;
    float _2551 = fma(_2275, _2541, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2553 = fma(_2533, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2545);
    float _2555 = float(uint(_2341));
    int _2557 = _2201 * int(_2523);
    int _2559 = _2557 + _2415;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2563 = _731 + _2561;
    float _2565 = fma(_2525, _2527, _2553);
    float _2567 = fma(_2331, _2549, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2571 = _731 + _2569;
    float _2573 = fma(_2303, _2563, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2575 = -_219;
    int _2577 = _2166 ? as_type<int>(_2575) : as_type<int>(_219);
    float _2579 = float(uint(_2559));
    bool _2581 = !_2537;
    float _2583 = _2581 ? _219 : as_type<float>(_2577);
    float _2585 = as_type<float>(_2130) * _2555;
    int _2587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2589 = _2587 != 0;
    float _2591 = as_type<float>(_2130) * _2579;
    float _2593 = fma(_2551, _2509, _2565);
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2597 = _731 + _2595;
    float _2599 = _2583 + 0.5;
    float _2601 = trunc(_2585);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    float _2607 = fma(_2573, _2473, _2593);
    float _2609 = fma(_2543, _2571, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2611 = fma(_2371, _2597, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2613 = fma(_2599, (*spvDescriptorSet0.vp_c9)._m0[80].x, _867);
    int _2615 = ~_821;
    int _2617 = _2615 + 1;
    float _2619 = fma(_2567, _2457, _2607);
    float _2621 = -_223;
    int _2623 = _2158 ? as_type<int>(_2621) : as_type<int>(_223);
    float _2625 = trunc(_2591);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    int _2631 = ~_821;
    int _2633 = _2631 + 1;
    float _2635 = fma(_2611, _2433, _2619);
    bool _2637 = !_2589;
    float _2639 = _2637 ? _223 : as_type<float>(_2623);
    float _2641 = _1283 + (-10.0);
    float _2643 = -_2110;
    float _2645 = fma(_2583, _2643, _2613);
    float _2647 = fma(_2609, _2407, _2635);
    int _2649 = _2617 * int(_2605);
    int _2651 = _2649 + _2341;
    float _2653 = precise::max(_1263, _2641);
    float _2655 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2647);
    float _2657 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2661 = float(uint(_2651));
    float _2663 = precise::min(_1283, _2653);
    float _2665 = -_1225;
    float _2667 = fma(_2665, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    int _2669 = int(_2523) + int(_2629);
    float _2671 = _2639 + (-0.5);
    float _2673 = as_type<float>(_2130) * _2661;
    float _2675 = -_2641;
    float _2677 = _2675 + _2663;
    out.m_84.x = _2655;
    int _2679 = _2633 * _2669;
    int _2681 = _2679 + _2415;
    float _2683 = -_2671;
    float _2685 = -_903;
    float _2687 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2685);
    float _2689 = fma(_2677, -0.100000001490116119384765625, 1.0);
    float _2691 = trunc(_2673);
    float _2693 = precise::max(_2691, 0.0);
    uint _2695 = uint(_2693);
    int _2697 = ~_821;
    int _2699 = _2697 + 1;
    float _2701 = fma(_2639, _2106, _2687);
    bool _2703 = uint(_2681) >= uint(_821);
    float _2705 = _701 * _2689;
    float _2707 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2709 = !_2703;
    int _2711 = _2709 ? 0 : (-1);
    out.m_86.x = _2645;
    out.m_86.y = _2701;
    int _2713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2715 = _2713 != 0;
    float _2717 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2719 = ~_2669;
    int _2721 = _2719 + _2711;
    int _2723 = _2721 + 1;
    out.m_88.x = _705;
    out.m_88.y = _709;
    out.m_88.z = _711;
    out.m_88.w = _2705;
    float _2725 = -_1225;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2717);
    int _2729 = _821 * _2723;
    int _2731 = _2729 + _2415;
    int _2733 = int(_2605) + int(_2695);
    float _2735 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2737 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2739 = !_2289;
    int _2741 = _2739 ? _2731 : (-1);
    float _2743 = -_1225;
    float _2745 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2735);
    float _2747 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2707);
    float _2749 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2737);
    int _2751 = _2741 >> 31;
    int _2753 = _2699 * _2733;
    int _2755 = _2753 + _2341;
    float _2757 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2759 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2667);
    int _2761 = _2751 & 3;
    float _2763 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2765 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2757);
    bool _2767 = uint(_2755) >= uint(_821);
    float _2769 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2771 = _2741 + _2761;
    float _2773 = abs(_1599);
    float _2775 = log2(_2773);
    int _2777 = _2741 & 3;
    bool _2779 = _2777 != 0;
    float _2781 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2769);
    int _2783 = _2771 >> 2;
    float _2785 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2745);
    int _2787 = _2741 & 3;
    bool _2789 = _2787 != 0;
    float _2791 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2765);
    int _2793 = _2783 << 4;
    int _2795 = _2793 + 368;
    float _2797 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2727);
    bool _2799 = uint(_2777) > 1u;
    float _2801 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2763);
    uint _2803 = uint(int(uint(_2795) >> uint(2)));
    uint _2805 = uint(int(uint(int(_2803)) >> uint(2)));
    int _2807 = int(_2803) & 3;
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[int(_2805)][_2807];
    int _2811 = int(_2803) + 1;
    uint _2813 = uint(int(uint(_2811) >> uint(2)));
    int _2815 = _2811 & 3;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[int(_2813)][_2815];
    int _2819 = _2789 ? 0 : 1;
    float _2821 = _2164 * _2785;
    bool _2823 = !_2767;
    int _2825 = _2823 ? 0 : (-1);
    float _2827 = _2164 * _2797;
    int _2829 = ~_2819;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    float _2835 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2837 = uint(_2777) >= 2u;
    int _2839 = _2795 + 8;
    uint _2841 = uint(int(uint(_2839) >> uint(2)));
    uint _2843 = uint(int(uint(int(_2841)) >> uint(2)));
    int _2845 = int(_2841) & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    int _2849 = int(_2841) + 1;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    int _2853 = _2849 & 3;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[int(_2851)][_2853];
    int _2857 = ~_2733;
    int _2859 = _2857 + _2825;
    int _2861 = _2859 + 1;
    float _2863 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2168);
    int _2865 = _2833;
    if (!_2799)
    {
        int _2867 = ~_2819;
        int _2869 = _2867 + 1;
        _2865 = _2869;
    }
    int _2871 = _2865;
    float _2873 = fma(_2659, _2791, _2821);
    bool _2875 = _2777 != 3;
    float _2877 = exp2(_2835);
    int _2879 = abs(_2871);
    int _2881 = _821 * _2861;
    int _2883 = _2881 + _2341;
    int _2885 = _2837 ? 0 : 1;
    float _2887 = fma(_2659, _2863, _2827);
    int _2889 = ~_2879;
    int _2891 = _2889 + 1;
    int _2893 = _2891 + 1;
    float _2895 = _2164 * _2759;
    bool _2897 = !_2779;
    int _2899 = _2897 ? 0 : 1;
    float _2901 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2801);
    int _2903 = ~_2885;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2781);
    bool _2911 = _2777 != 3;
    float _2913 = -_2049;
    float _2915 = _2913 + 1.0;
    int _2917 = _2907;
    if (_2875)
    {
        int _2919 = ~_2885;
        int _2921 = _2919 + 1;
        _2917 = _2921;
    }
    int _2923 = _2917;
    float _2925 = _2909 + _2873;
    int _2927 = abs(_2899);
    float _2929 = _2233 * _2051;
    int _2931 = abs(_2923);
    float _2933 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2749);
    int _2935 = ~_2927;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2747);
    bool _2943 = _1599 <= 8000.0;
    bool _2945 = isnan(_1599);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(8000.0);
    bool _2951 = _2947 || _2949;
    float _2953 = float(_2951);
    float _2955 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    int _2959 = _2893 * as_type<int>(_2817);
    bool _2961 = !_2911;
    int _2963 = _2961 ? 0 : (-1);
    float _2965 = _2076 * _2929;
    bool _2967 = !_2715;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = _2939 * as_type<int>(_2809);
    int _2973 = _2971 + _2959;
    int _2975 = abs(_2963);
    float _2977 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2185);
    float _2979 = _2933 + _2887;
    int _2981 = abs(_2969);
    float _2983 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2977);
    float _2985 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2987 = ~_2931;
    int _2989 = _2987 + 1;
    int _2991 = _2989 + 1;
    float _2993 = fma(_2957, -2.0, 3.0);
    int _2995 = ~_2975;
    int _2997 = _2995 + 1;
    int _2999 = _2997 + 1;
    float _3001 = _2957 * _2957;
    out.gl_Position.x = _1987;
    out.gl_Position.y = _2025;
    out.gl_Position.z = _2983;
    out.gl_Position.w = _1997;
    int _3003 = _2991 * as_type<int>(_2847);
    int _3005 = _3003 + _2973;
    int _3007 = ~_2981;
    int _3009 = _3007 + 1;
    int _3011 = _3009 + 1;
    float _3013 = _3001 * _2993;
    float _3015 = fma(_2659, _2901, _2895);
    int _3017 = _2999 * as_type<int>(_2855);
    int _3019 = _3017 + _3005;
    bool _3021 = !_2289;
    int _3023 = _3021 ? _2883 : (-1);
    float _3025 = -_3013;
    float _3027 = _3025 + 1.0;
    int _3029 = _3019 * _3011;
    float _3031 = _2941 + _3015;
    float _3033 = in.m_90.x;
    float _3035 = fma(_3027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3013);
    int _3037 = _3023 * _2981;
    int _3039 = _3037 + _3029;
    float _3041 = _2983 + _1997;
    float _3043 = _1997 * 0.5;
    float _3045 = _2953 * _3035;
    out.m_92.x = _2925;
    out.m_92.y = _2979;
    out.m_92.z = _3031;
    float _3047 = float(_3039);
    float _3049 = _1987 + _1997;
    float _3051 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3053 = _3041 * 0.5;
    float _3055 = fma(_2025, -0.5, _3043);
    float _3057 = _3049 * 0.5;
    float _3059 = _2915 * _3051;
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = fma(_2066, _2965, _2064);
    out.m_94.x = _3047;
    bool _3065 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3067 = isnan(_1759);
    bool _3069 = _3065 || _3067;
    bool _3071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3073 = _3069 || _3071;
    float _3075 = -_3061;
    float _3077 = fma(_3075, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_96.x = _3057;
    out.m_96.y = _3055;
    out.m_96.z = _3053;
    out.m_96.w = _1997;
    float _3079 = _3077 * _3033;
    float _3081 = _3079 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3083 = _2066 * _2929;
    float _3085 = -_2233;
    float _3087 = _3085 + 1.0;
    out.m_98.x = _3081;
    float _3089 = _3053;
    float _3091 = _3083;
    float _3093 = _3087;
    if (!_3073)
    {
        _3089 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3095 = _3089;
    float _3097 = fma(_2072, _3083, _2060);
    float _3099 = fma(_2074, _3083, _2062);
    float _3101 = _2066 * _3087;
    float _3103 = _3095;
    float _3105 = _3095;
    if (!_3073)
    {
        _3091 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3107 = _3091;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3073)
    {
        _3093 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3113 = _3093;
    out.m_100.x = _3097;
    out.m_100.y = _3099;
    out.m_100.z = _3063;
    out.m_100.w = _3101;
    bool _3115 = !_3073;
    float _3117 = _3113;
    float _3119 = _3113;
    if (!_3115)
    {
        bool _3121 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3123 = isnan(_1759);
        bool _3125 = _3121 || _3123;
        bool _3127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3129 = _3125 || _3127;
        if (!_3129)
        {
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3133 = _1759 + _3131;
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3137 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3135;
            float _3139 = 1.0 / _3137;
            float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3143 = _3141 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3149 = _3133 * _3139;
            float _3151 = precise::clamp(_3149, 0.0, 1.0);
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3157 = fma(_3151, _3147, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3159 = fma(_3151, _3155, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3161 = fma(_3151, _3143, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3111 = _3161;
            _3105 = _3159;
            _3119 = _3157;
            _3163 = true;
        }
        else
        {
            bool _3165 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3167 = isnan(_1759);
            bool _3169 = _3165 || _3167;
            bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3173 = _3169 || _3171;
            if (!_3173)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3175 = _3103;
            _3105 = _3175;
            if (!_3173)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3177 = _3109;
            _3111 = _3177;
            if (!_3173)
            {
                _3117 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3179 = _3117;
            bool _3181 = !_3173;
            _3119 = _3179;
            if (!_3181)
            {
                bool _3183 = _1759 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3185 = isnan(_1759);
                bool _3187 = _3183 || _3185;
                bool _3189 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3191 = _3187 || _3189;
                if (!_3191)
                {
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3195 = _1759 + _3193;
                    float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3199 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3197;
                    float _3201 = 1.0 / _3199;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3211 = _3195 * _3201;
                    float _3213 = precise::clamp(_3211, 0.0, 1.0);
                    float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3219 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3221 = fma(_3213, _3217, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3223 = fma(_3213, _3205, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3111 = _3223;
                    _3105 = _3221;
                    _3119 = _3219;
                    _3163 = true;
                }
                else
                {
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3119 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3163 = false;
    float _3225 = _3111;
    float _3227 = _3105;
    float _3229 = _3119;
    float _3231 = _2985 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_102.x = 0.0;
    float _3233 = _3225 * 0.586610972881317138671875;
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_53.x = _3231;
    float _3237 = fma(_3227, 0.298911988735198974609375, _3233);
    bool _3239 = _1727 > 0.0;
    bool _3241 = isnan(_1727);
    bool _3243 = _3239 || _3241;
    bool _3245 = isnan(0.0);
    bool _3247 = _3243 || _3245;
    float _3249 = fma(_3229, 0.114477999508380889892578125, _3237);
    float _3251 = -_3249;
    float _3253 = _3251 + _3227;
    float _3255 = -_3249;
    float _3257 = _3255 + _3225;
    float _3259 = -_3249;
    float _3261 = _3259 + _3229;
    float _3263 = fma(_3253, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    float _3265 = fma(_3257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    float _3267 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3249);
    bool _3269 = !_3235;
    if (!_3269)
    {
        float _3271 = -_1661;
        float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3275 = -_1663;
        float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3279 = -_1665;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3283 = _3273 * _3273;
        float _3285 = fma(_3277, _3277, _3283);
        float _3287 = fma(_3281, _3281, _3285);
        float _3289 = sqrt(_3287);
        float _3291 = rsqrt(_3287);
        float _3293 = -_3289;
        float _3295 = _3293 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3297 = _3295 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3299 = precise::clamp(_3297, 0.0, 1.0);
        float _3301 = _3277 * _3291;
        float _3303 = _3273 * _3291;
        float _3305 = abs(_3299);
        float _3307 = log2(_3305);
        float _3309 = _3281 * _3291;
        float _3311 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3313 = _2979 * _3303;
        float _3315 = -_3303;
        float _3317 = -_3311;
        float _3319 = fma(_3315, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3317);
        float _3321 = fma(_2925, _3301, _3313);
        float _3323 = -_3309;
        float _3325 = fma(_3323, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3319);
        float _3327 = fma(_3031, _3309, _3321);
        float _3329 = precise::clamp(_3327, 0.0, 1.0);
        float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3333 = _3325 + _3331;
        float _3335 = _3307 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3337 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3339 = precise::clamp(_3337, 0.0, 1.0);
        float _3341 = exp2(_3335);
        float _3343 = _3341 * _3339;
        float _3345 = _3329 * _3343;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3351 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _3347;
        out.m_102.y = _3349;
        out.m_102.z = _3351;
    }
    out.m_78.x = _3263;
    out.m_78.y = _3265;
    out.m_78.z = _3267;
    if (_3247)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3353;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

