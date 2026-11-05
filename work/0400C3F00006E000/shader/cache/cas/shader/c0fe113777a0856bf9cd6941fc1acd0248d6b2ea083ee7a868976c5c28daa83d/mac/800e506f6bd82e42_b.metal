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
    float4 m_84 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_100 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_98 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 m_94 [[user(locn15)]];
    float4 m_90 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2481 = false;
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
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2791 = as_type<float>(_143);
        out.gl_Position.z = _2791;
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
    float _157 = in.m_55.x;
    float _159 = float(_121);
    bool _161 = _125 >= _159;
    bool _163 = !_155;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _133;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _125 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _145 = as_type<int>(_175);
    }
    int _177 = _145;
    out.m_57.x = _157;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2856 = as_type<float>(_177);
        out.gl_Position.z = _2856;
    }
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _215;
    if (!_199)
    {
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _215 = _171;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = in.m_62.x;
    float _227 = in.m_62.y;
    bool _229 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_219);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_239;
    float _259 = _257 + 1.0;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    float _265 = 1.0 / _243;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = _255 * _259;
    float _271 = -_255;
    float _273 = _271 + 1.0;
    float _275 = _223 * _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    float _297 = _293 * _225;
    float _299 = _295 * _227;
    bool _301 = !_267;
    if (!_301)
    {
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _305 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _173 = _315;
    }
    float _317 = _173;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = _157 * 2.0;
    float _331 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _333 = in.m_64.x;
    float _335 = in.m_64.y;
    float _337 = in.m_64.z;
    float _339 = in.m_64.w;
    float _341 = _299 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = in.m_66.x;
    float _355 = in.m_66.y;
    float _357 = in.m_66.z;
    float _359 = in.m_66.w;
    float _361 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _363 = log2(_361);
    float _365 = in.m_68.x;
    float _367 = in.m_68.y;
    float _369 = in.m_68.z;
    float _371 = in.m_68.w;
    float _373 = in.m_55.y;
    float _375 = floor(_329);
    float _377 = float(_327);
    float _379 = in.m_55.z;
    float _381 = _363 * _125;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _387 = int(_385);
    float _389 = _321 * _335;
    float _391 = _321 * _355;
    float _393 = fma(_319, _333, _389);
    float _395 = exp2(_381);
    float _397 = _321 * _367;
    float _399 = fma(_319, _353, _391);
    bool _401 = _375 > 0.0;
    float _403 = _373 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _405 = _375 >= 0.0;
    bool _407 = isnan(_375);
    bool _409 = _405 || _407;
    bool _411 = isnan(0.0);
    bool _413 = _409 || _411;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _417 = 1.0 / _377;
    float _419 = fma(_403, -2.0, _383);
    float _421 = _373 * 2.0;
    float _423 = -_415;
    float _425 = fma(_331, 2.0, _423);
    float _427 = _157 + _373;
    float _429 = fma(_319, _365, _397);
    float _431 = fma(_323, _337, _393);
    float _433 = _427 + (-1.0);
    float _435 = _373 + _379;
    bool _437 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _439 = isnan(1.0);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _449 = 1.0 + _447;
    float _451 = fma(_323, _357, _399);
    float _453 = _435 + (-1.0);
    float _455 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _457 = _379 * 2.0;
    float _459 = 1.0 / _449;
    float _461 = fma(_323, _369, _429);
    float _463 = -_395;
    float _465 = _463 + 1.0;
    float _467 = _417 * _125;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = floor(_421);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _475 = float(_387);
    float _477 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _479 = _351 ? _465 : 0.0;
    float _481 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[78].w, _473);
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _495 = _493 != 0;
    float _497 = floor(_457);
    float _499 = _475 * _125;
    float _501 = -_125;
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[76].x, _425);
    float _505 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _477);
    float _507 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    float _509 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _481);
    if (_445)
    {
        float _511 = _479 * _459;
        _135 = _511;
    }
    float _513 = _135;
    int _515 = _413 ? 0 : 1;
    float _517 = _431 + _339;
    bool _519 = _471 > 0.0;
    float _521 = _451 + _359;
    bool _523 = _471 >= 0.0;
    bool _525 = isnan(_471);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = _461 + _371;
    bool _535 = !_491;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_487;
    int _541 = _539 ? 0 : 1;
    bool _543 = _497 >= 0.0;
    bool _545 = isnan(_497);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    bool _553 = !_495;
    int _555 = _553 ? 0 : 1;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    int _569 = ~_515;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    int _575 = _573;
    float _577 = _521;
    if (!_401)
    {
        int _579 = ~_515;
        int _581 = _579 + 1;
        _575 = _581;
    }
    int _583 = _575;
    bool _585 = !_559;
    int _587 = _585 ? 0 : 1;
    float _589 = in.m_70.x;
    float _591 = in.m_70.y;
    float _593 = in.m_70.z;
    int _595 = _531 ? 0 : 1;
    bool _597 = !_563;
    int _599 = _597 ? 0 : 1;
    int _601 = abs(_587);
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _521 + _603;
    int _607 = ~_595;
    int _609 = _607 + 1;
    int _611 = _609 + 1;
    int _613 = _611;
    if (!_519)
    {
        int _615 = ~_595;
        int _617 = _615 + 1;
        _613 = _617;
    }
    int _619 = _613;
    bool _621 = _497 > 0.0;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _625 = _533 + _623;
    int _627 = abs(_599);
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _631 = _517 + _629;
    float _633 = float(_583);
    float _635 = _605 * _605;
    float _637 = float(_627);
    int _639 = _551 ? 0 : 1;
    float _641 = fma(_631, _631, _635);
    float _643 = float(_601);
    float _645 = _637 * _633;
    int _647 = ~_639;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = fma(_625, _625, _641);
    int _655 = _651;
    if (!_621)
    {
        int _657 = ~_639;
        int _659 = _657 + 1;
        _655 = _659;
    }
    int _661 = _655;
    float _663 = _645 * (-2.0);
    float _665 = _373 + (-0.5);
    float _667 = sqrt(_653);
    float _669 = float(_661);
    float _671 = fma(_663, _591, _591);
    bool _673 = !_567;
    int _675 = _673 ? 0 : 1;
    float _677 = fma(_483, _663, _483);
    float _679 = _297 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _681 = _643 * _669;
    int _683 = abs(_675);
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[196].y, _671);
    float _687 = _157 + _379;
    float _689 = rsqrt(_653);
    float _691 = float(_619);
    float _693 = _679 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _695 = float(_683);
    float _697 = _687 + (-1.0);
    float _699 = _667 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _701 = _681 * (-2.0);
    float _703 = _695 * _691;
    float _705 = _379 + (-0.5);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = precise::min(_693, _699);
    float _711 = _157 + (-0.5);
    float _713 = fma(_701, _589, _589);
    float _715 = _703 * (-2.0);
    float _717 = fma(_455, _701, _455);
    float _719 = _689 * _709;
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].x, _713);
    float _723 = fma(_707, _715, _707);
    float _725 = fma(_715, _593, _593);
    float _727 = _605 * _719;
    float _729 = fma(_677, _513, _685);
    float _731 = fma(_717, _513, _721);
    float _733 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _735 = _631 * _719;
    float _737 = -_727;
    float _739 = _605 + _737;
    float _741 = _729 * 0.15915493667125701904296875;
    float _743 = fma(_723, _513, _733);
    float _745 = -_735;
    float _747 = _631 + _745;
    float _749 = _739 * _739;
    float _751 = _625 * _719;
    float _753 = _731 * 0.15915493667125701904296875;
    float _755 = _743 * 0.15915493667125701904296875;
    float _757 = fma(_747, _747, _749);
    float _759 = -_751;
    float _761 = _625 + _759;
    float _763 = _741 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _777 = _773 || _775;
    float _779 = fma(_761, _761, _757);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _741 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = sqrt(_779);
    float _797 = _753 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _753 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = _689 * _795;
    float _807 = _341 * _805;
    float _809 = _679 * _805;
    float _811 = _755 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = _799 * _793;
    float _817 = _799 * _765;
    float _819 = _807 * _767;
    float _821 = _805 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = _821 * 0.5;
    float _825 = _755 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = _803 * _765;
    float _831 = _803 * _793;
    float _833 = _799 * _813;
    float _835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _837 = _803 * _813;
    float _839 = _793 * _813;
    float _841 = _765 * _813;
    float _843 = _809 * _835;
    float _845 = _833 * _819;
    float _847 = _837 * _819;
    float _849 = fma(_827, _815, _829);
    float _851 = -_817;
    float _853 = fma(_827, _831, _851);
    float _855 = -_831;
    float _857 = fma(_827, _817, _855);
    float _859 = -_819;
    float _861 = _827 * _859;
    float _863 = fma(_849, _843, _845);
    float _865 = fma(_827, _829, _815);
    float _867 = fma(_853, _843, _847);
    float _869 = fma(_839, _843, _861);
    float _871 = fma(_857, _823, _863);
    float _873 = -_727;
    float _875 = _521 + _873;
    float _877 = fma(_865, _823, _867);
    float _879 = fma(_841, _823, _869);
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _885 = -_735;
    float _887 = _517 + _885;
    float _889 = _875 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].x, _881);
    float _893 = _875 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].x, _883);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _889);
    float _899 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].z, _891);
    float _901 = -_751;
    float _903 = _533 + _901;
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].z, _895);
    float _909 = _899 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _911 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[10].z, _897);
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[11].z, _905);
    float _915 = _907 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _917 = _533 + _909;
    float _919 = _911 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _923 = _517 + _915;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _927 = _917 + _925;
    float _929 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _931 = 1.0 / _921;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _935 = _923 + _933;
    float _937 = _927 * _927;
    float _939 = _919 + _921;
    float _941 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].x, _929);
    float _943 = fma(_935, _935, _937);
    float _945 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _947 = sqrt(_943);
    float _949 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _951 = _939 * _931;
    float _953 = _951 * 0.5;
    float _955 = _521 + _949;
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _957);
    float _961 = 1.0 / _959;
    bool _963 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = _877;
    float _967 = _949;
    float _969 = _929;
    float _971 = _943;
    float _973 = _947;
    float _975 = _959;
    float _977 = _751;
    float _979 = _955;
    float _981 = _699;
    if (!_963)
    {
        _965 = _923;
    }
    float _983 = _965;
    float _985 = _983;
    if (!_963)
    {
        _967 = _917;
    }
    float _987 = _967;
    float _989 = _987;
    if (!_963)
    {
        _969 = _955;
    }
    float _991 = _969;
    bool _993 = !_963;
    float _995 = _991;
    if (!_993)
    {
        float _997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _999 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1001 = _947 + _999;
        float _1003 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = rsqrt(_943);
        float _1007 = _1001 * _997;
        float _1009 = _1007 * 0.15915493667125701904296875;
        float _1011 = _1009 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        float _1015 = _1009 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        float _1019 = _1013 + (-1.0);
        float _1021 = fma(_1017, _1003, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1023 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1025 = _1005 * _1021;
        float _1027 = fma(_955, _1013, _1023);
        float _1029 = fma(_935, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1031 = fma(_927, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _985 = _1029;
        _995 = _1027;
        _989 = _1031;
        _971 = _1005;
        _973 = _1009;
    }
    float _1033 = _985;
    float _1035 = _995;
    float _1037 = _989;
    float _1039 = _971;
    float _1041 = _973;
    float _1043 = -_735;
    float _1045 = _1043 + _1033;
    float _1047 = -_727;
    float _1049 = _1047 + _1035;
    float _1051 = -_751;
    float _1053 = _1051 + _1037;
    float _1055 = _1049;
    float _1057 = _1045;
    float _1059 = _1039;
    float _1061 = _1041;
    if (_789)
    {
        _975 = 1.0;
    }
    float _1063 = _975;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1067 = _961 * _1065;
    float _1069 = _1063;
    if (_777)
    {
        _977 = _1049;
    }
    float _1071 = _977;
    float _1073 = _1071;
    if (_777)
    {
        _1055 = _1053;
    }
    float _1075 = _1055;
    float _1077 = _1075;
    if (!_777)
    {
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1081 = _875 + _1079;
        float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1085 = _887 + _1083;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = -_517;
        float _1091 = _1089 + _1033;
        float _1093 = _1081 * _1081;
        float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1097 = _903 + _1095;
        float _1099 = -_533;
        float _1101 = _1099 + _1037;
        float _1103 = fma(_1085, _1085, _1093);
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = fma(_1097, _1097, _1103);
        float _1109 = sqrt(_1107);
        float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1113 = -_521;
        float _1115 = _1113 + _1035;
        float _1117 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1119 = _1117 * _1105;
        float _1121 = _1111 * _1119;
        float _1123 = fma(_1091, _1121, _887);
        float _1125 = fma(_1115, _1121, _875);
        float _1127 = fma(_1101, _1121, _903);
        _1073 = _1125;
        _1057 = _1123;
        _1077 = _1127;
        _1059 = _1105;
    }
    float _1129 = _1073;
    float _1131 = _1057;
    float _1133 = _1077;
    float _1135 = _1059;
    float _1137 = _1135;
    if (!_789)
    {
        float _1139 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1147 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1145;
        float _1149 = _1141 * 6.283185482025146484375;
        float _1151 = cos(_1149);
        float _1153 = _1143 * 0.15915493667125701904296875;
        float _1155 = _1141 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = 1.0 / _1151;
        float _1161 = _1153 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = _1153 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = _1163 * _1165;
        float _1173 = 1.0 / _1147;
        float _1175 = 1.0 / _1171;
        float _1177 = _1169 * _1175;
        float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1181 = fma(_1067, _1177, _1179);
        float _1183 = _1181 * _1173;
        float _1185 = precise::clamp(_1183, 0.0, 1.0);
        _1137 = _1173;
        _1061 = _1141;
        _1069 = _1185;
    }
    float _1187 = _1137;
    float _1189 = _1061;
    float _1191 = _1069;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1129 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1131 + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1203 = _1133 + _1201;
    float _1205 = _1195 * _1195;
    float _1207 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1209 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1211 = fma(_1199, _1199, _1205);
    float _1213 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1207);
    float _1215 = fma(_1203, _1203, _1211);
    float _1217 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1213);
    float _1219 = rsqrt(_1215);
    float _1221 = sqrt(_1215);
    float _1223 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1225 = _1199 * _1223;
    float _1227 = _1203 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 * _1227;
    float _1233 = _1229 + _1231;
    float _1235 = sqrt(_1233);
    bool _1237 = _1235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1241 = _1235 + _1239;
    float _1243 = _1187;
    float _1245 = _1233;
    float _1247 = _1241;
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1251 = _1225;
    float _1253 = _1227;
    float _1255 = _1229;
    float _1257 = _1231;
    if (_1237)
    {
        float _1259 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1259;
    }
    float _1261 = _1243;
    if (_1237)
    {
        float _1263 = rsqrt(_1233);
        _1245 = _1263;
    }
    float _1265 = _1245;
    if (_1237)
    {
        float _1267 = _1241 * _1261;
        _1247 = _1267;
    }
    float _1269 = _1247;
    if (_1237)
    {
        float _1271 = _1269 * 0.15915493667125701904296875;
        _577 = _1271;
    }
    float _1273 = _577;
    float _1275 = _1261;
    if (_1237)
    {
        float _1277 = _1273 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        _1275 = _1279;
    }
    float _1281 = _1275;
    float _1283 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1285 = precise::max(0.0, _1283);
    float _1287 = _1189;
    float _1289 = _1285;
    if (_1237)
    {
        float _1291 = _1273 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        _1287 = _1293;
    }
    float _1295 = _1287;
    float _1297 = -_1223;
    float _1299 = -_1285;
    float _1301 = fma(_1195, _1297, _1299);
    float _1303 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1237)
    {
        float _1305 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1289 = _1305;
    }
    float _1307 = _1289;
    float _1309 = _1281;
    if (_1237)
    {
        float _1311 = fma(_1281, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _979 = _1311;
    }
    float _1313 = _979;
    if (!_1237)
    {
        _1309 = _1301;
    }
    float _1315 = _1309;
    float _1317 = floor(_1303);
    float _1319 = _1315;
    if (_1237)
    {
        float _1321 = _1295 + (-1.0);
        _1249 = _1321;
    }
    float _1323 = _1249;
    float _1325 = _1323;
    if (_1237)
    {
        float _1327 = _1265 * _1313;
        _981 = _1327;
    }
    float _1329 = _981;
    if (_1237)
    {
        float _1331 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1331;
    }
    float _1333 = _1325;
    if (_1237)
    {
        float _1335 = _1225 * _1329;
        _1251 = _1335;
    }
    float _1337 = _1251;
    if (_1237)
    {
        float _1339 = _1227 * _1329;
        _1253 = _1339;
    }
    float _1341 = _1253;
    if (_1237)
    {
        float _1343 = fma(_1301, _1295, _1333);
        _1319 = _1343;
    }
    float _1345 = _1319;
    if (_1237)
    {
        float _1347 = _1337 * _1337;
        _1255 = _1347;
    }
    float _1349 = _1255;
    if (_1237)
    {
        float _1351 = _1341 * _1341;
        _1257 = _1351;
    }
    float _1353 = _1257;
    float _1355 = fma(_1345, _1345, _1349);
    float _1357 = fma(_903, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1359 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1363 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1361);
    float _1365 = precise::clamp(_1363, 0.0, 1.0);
    float _1367 = _1355 + _1353;
    float _1369 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1371 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1359);
    float _1373 = -_1365;
    float _1375 = _1373 + 1.0;
    float _1377 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1369);
    float _1379 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1371);
    float _1381 = rsqrt(_1367);
    float _1383 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1209);
    float _1385 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1377);
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1391 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = abs(_1375);
    float _1399 = log2(_1397);
    float _1401 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1403 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1405 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    float _1407 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1409 = -_1317;
    float _1411 = _1303 + _1409;
    float _1413 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1405);
    float _1417 = _1381 * _1337;
    float _1419 = _1381 * _1345;
    float _1421 = floor(_1357);
    float _1423 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1415);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1427 = _1381 * _1341;
    float _1429 = -_1407;
    float _1431 = fma(_1429, _1403, 1.0);
    float _1433 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1435 = -_1425;
    float _1437 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1435);
    float _1439 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1441 = 1.0 / _1423;
    float _1443 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1445 = -_1427;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1437);
    float _1449 = _1419 + 1.0;
    float _1451 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1443);
    float _1453 = fma(_1447, -0.5, 0.5);
    float _1455 = fma(_1447, 0.5, 0.5);
    float _1457 = exp2(_1439);
    float _1459 = -_1421;
    float _1461 = _1357 + _1459;
    float _1463 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1433);
    float _1465 = fma(_1455, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1467 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1451);
    float _1469 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1463);
    float _1471 = fma(_1455, _1465, -0.212114393711090087890625);
    float _1473 = log2(_1431);
    float _1475 = fma(_1455, _1471, 1.570728778839111328125);
    float _1477 = _1467 * _1441;
    float _1479 = sqrt(_1453);
    float _1481 = -_1419;
    float _1483 = fma(_1457, _1449, _1481);
    float _1485 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1487 = fma(_1483, 0.5, 0.5);
    float _1489 = _1485 * _1441;
    float _1491 = _1473 * 0.693147182464599609375;
    float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1495 = fma(_1477, 0.5, 0.5);
    float _1497 = _1479 * 0.636619746685028076171875;
    float _1499 = fma(_1489, -0.5, 0.5);
    float _1501 = -_1475;
    float _1503 = fma(_1497, _1501, 1.0);
    float2 _4880 = float2(_1411, _1461);
    float _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4880, float2(0.0), isnan(_4880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4880, float2(0.0), isnan(_4880)), level(0.0)).x;
    float3 _4891 = float3(_1495, _1499, _1493);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4891, float3(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4891, float3(0.0), isnan(_4891)), level(0.0)).x;
    float3 _4902 = float3(_1495, _1499, _1493);
    float4 _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4902, float3(0.0), isnan(_4902)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4902, float3(0.0), isnan(_4902)), level(0.0)).xyzw;
    float _1512 = _1510.x;
    float _1514 = _1510.y;
    float _1516 = _1510.z;
    float _1518 = _1510.w;
    float2 _4918 = float2(_1503, _1487);
    float3 _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4918, float2(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4918, float2(0.0), isnan(_4918)), level(0.0)).xyz;
    float _1524 = _1522.x;
    float _1526 = _1522.y;
    float _1528 = _1522.z;
    float _1530 = float(uint(_387));
    float _1532 = trunc(_467);
    int _1534 = int(_1532);
    float _1536 = _499 * _167;
    int _1538 = abs(_537);
    float _1540 = -_509;
    float _1542 = _1540 + 1.0;
    int _1544 = ~_387;
    int _1546 = _1544 + 1;
    out.m_72.x = _887;
    out.m_72.y = _875;
    out.m_72.z = _903;
    int _1548 = abs(_555);
    float _1550 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1552 = 1.0 / _1530;
    bool _1554 = _157 > 0.5;
    out.m_74.w = _709;
    bool _1556 = _373 > 0.5;
    out.m_76.x = _809;
    bool _1558 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1560 = isnan(_317);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = trunc(_1536);
    int _1572 = int(_1570);
    float _1574 = float(uint(_1534));
    float _1576 = _849 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1580 = _1578 != 0;
    out.m_78.x = _1131;
    out.m_78.y = _1129;
    out.m_78.z = _1133;
    int _1582 = ~_387;
    int _1584 = _1582 + 1;
    float _1586 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    int _1588 = as_type<int>(_1552) + (-2);
    float _1590 = exp2(_1550);
    float _1592 = as_type<float>(_1588) * _1574;
    float _1594 = trunc(_1592);
    float _1596 = precise::max(_1594, 0.0);
    uint _1599 = uint(_1596);
    float _1601 = -_1590;
    float _1603 = _1601 + 1.0;
    int _1605 = _1546 * int(_1599);
    int _1607 = _1605 + _1534;
    float _1609 = float(uint(_1607));
    bool _1611 = !_1580;
    float _1613 = _1611 ? 7.345489978790283203125 : 1.0;
    float _1615 = as_type<float>(_1588) * _1609;
    float _1617 = _1613 * _157;
    float _1619 = trunc(_1615);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    float _1625 = floor(_1617);
    int _1627 = int(_1599) + int(_1623);
    float _1629 = float(_1534);
    int _1631 = _1584 * _1627;
    int _1633 = _1631 + _1534;
    bool _1635 = _1629 >= _475;
    bool _1637 = isnan(_1629);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan(_475);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = -_1625;
    float _1649 = _1617 + _1647;
    bool _1651 = uint(_1633) >= uint(_387);
    float _1653 = trunc(_1645);
    int _1655 = int(_1653);
    float _1657 = _1649 * _475;
    float _1659 = trunc(_1657);
    int _1661 = int(_1659);
    bool _1663 = !_1651;
    int _1665 = _1663 ? 0 : (-1);
    bool _1667 = _387 == 0;
    int _1669 = ~_1627;
    int _1671 = _1669 + _1665;
    int _1673 = _1671 + 1;
    int _1675 = ~_1655;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _387 * _1673;
    int _1683 = _1681 + _1534;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1687 = _1685 != 0;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1691 = _1689 != 0;
    bool _1693 = !_1667;
    int _1695 = _1693 ? _1683 : (-1);
    int _1697 = _387 + (-1);
    bool _1699 = !_1687;
    int _1701 = _1699 ? 0 : 1;
    int _1703 = _1695 * _1679;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1707 = _1705 != 0;
    int _1709 = abs(_1701);
    int _1711 = _1655 * _1697;
    int _1713 = _1711 + _1703;
    int _1715 = abs(_541);
    int _1717 = _1661 * _1709;
    int _1719 = _1717 + _1534;
    bool _1721 = !_1707;
    int _1723 = _1721 ? 0 : 1;
    int _1725 = _1713 * _1538;
    int _1727 = abs(_1723);
    int _1729 = _1572 * _1715;
    int _1731 = _1729 + _1725;
    int _1733 = ~_387;
    int _1735 = _1733 + 1;
    int _1737 = _1719 * _1548;
    int _1739 = _1737 + _1731;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1743 = _1741 != 0;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1747 = _317 + _1745;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1751 = _1749 != 0;
    int _1753 = _1661 * _1727;
    int _1755 = _1753 + _1739;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1765 = float(uint(_1719));
    float _1767 = float(uint(_1755));
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1771 = _1769 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1773 = as_type<float>(_1588) * _1765;
    float _1775 = -_197;
    int _1777 = _1556 ? as_type<int>(_1775) : as_type<int>(_197);
    float _1779 = as_type<float>(_1588) * _1767;
    float _1781 = 1.0 / _1771;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1787 = trunc(_1779);
    float _1789 = precise::max(_1787, 0.0);
    uint _1791 = uint(_1789);
    float _1793 = 1.0 / _1785;
    float _1795 = _1759 * _1781;
    bool _1797 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1799 = isnan(_317);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    bool _1809 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1811 = isnan(_317);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1817 = _1813 || _1815;
    float _1819 = float(_1817);
    float _1821 = fma(_1795, _1747, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1825 = _317 + _1823;
    float _1827 = -_1807;
    float _1829 = _1827 + 1.0;
    int _1831 = _1735 * int(_1791);
    int _1833 = _1831 + _1755;
    float _1835 = _1568 * _1829;
    float _1837 = float(uint(_1833));
    float _1839 = _1821 * _1835;
    float _1841 = _1763 * _1793;
    int _1843 = ~_387;
    int _1845 = _1843 + 1;
    float _1847 = as_type<float>(_1588) * _1837;
    float _1849 = -_1819;
    float _1851 = _1849 + 1.0;
    float _1853 = fma(_1841, _1825, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1855 = ~_387;
    int _1857 = _1855 + 1;
    float _1859 = _1807 * _1851;
    float _1861 = trunc(_1847);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    float _1867 = trunc(_1773);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = int(_1791) + int(_1865);
    float _1875 = -_1568;
    float _1877 = _1875 + 1.0;
    float _1879 = -_193;
    int _1881 = _1554 ? as_type<int>(_1879) : as_type<int>(_193);
    float _1883 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1839);
    bool _1885 = !_1691;
    float _1887 = _1885 ? _193 : as_type<float>(_1881);
    int _1889 = _1845 * _1873;
    int _1891 = _1889 + _1755;
    bool _1893 = !_1751;
    float _1895 = _1893 ? _197 : as_type<float>(_1777);
    float _1897 = fma(_1853, _1859, _1883);
    int _1899 = _1857 * int(_1871);
    int _1901 = _1899 + _1719;
    float _1903 = _1887 + 0.5;
    bool _1905 = uint(_1891) >= uint(_387);
    float _1907 = _1895 + (-0.5);
    float _1909 = fma(_1903, (*spvDescriptorSet0.vp_c9)._m0[80].x, _503);
    float _1911 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1897);
    bool _1913 = !_1905;
    int _1915 = _1913 ? 0 : (-1);
    float _1917 = -_1907;
    float _1919 = -_507;
    float _1921 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1919);
    float _1923 = -_505;
    float _1925 = _1923 + 1.0;
    float _1927 = float(uint(_1901));
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1931 = ~_1873;
    int _1933 = _1931 + _1915;
    int _1935 = _1933 + 1;
    float _1937 = -_1925;
    float _1939 = fma(_1887, _1937, _1909);
    float _1941 = as_type<float>(_1588) * _1927;
    float _1943 = fma(_1895, _1542, _1921);
    int _1945 = _387 * _1935;
    int _1947 = _1945 + _1755;
    float _1949 = _1911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    bool _1959 = !_1667;
    int _1961 = _1959 ? _1947 : (-1);
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1967 = _1961 >> 31;
    float _1969 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1973 = _1967 & 3;
    float _1975 = _1963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1979 = _1961 + _1973;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1983 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1987 = _1979 >> 2;
    out.m_80.x = _1969;
    out.m_80.y = _1975;
    out.m_80.z = _1977;
    out.m_80.w = _1971;
    float _1989 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1993 = _1987 << 4;
    int _1995 = _1993 + 368;
    out.m_82.x = _1939;
    out.m_82.y = _1943;
    int _1997 = ~_387;
    int _1999 = _1997 + 1;
    float _2001 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2003 = int(_1871) + int(_1957);
    uint _2005 = uint(int(uint(_1995) >> uint(2)));
    uint _2007 = uint(int(uint(int(_2005)) >> uint(2)));
    int _2009 = int(_2005) & 3;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[int(_2007)][_2009];
    int _2013 = int(_2005) + 1;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    int _2017 = _2013 & 3;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[int(_2015)][_2017];
    out.m_84.x = _1989;
    out.m_84.y = _1983;
    out.m_84.z = _1991;
    out.m_84.w = _1949;
    int _2021 = _1961 & 3;
    bool _2023 = _2021 != 0;
    float _2025 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2027 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2029 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_86.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2031 = -_827;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2025);
    float _2035 = -_827;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2027);
    float _2039 = -_827;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2029);
    float _2043 = _849 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2045 = _849 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2047 = _1999 * _2003;
    int _2049 = _2047 + _1719;
    float _2051 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2033);
    float _2053 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2037);
    float _2055 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2041);
    float _2057 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1586);
    bool _2059 = uint(_2049) >= uint(_387);
    float _2061 = _2001 * _2051;
    float _2063 = _2001 * _2053;
    float _2065 = _2001 * _2055;
    int _2067 = _1961 & 3;
    bool _2069 = _2067 != 0;
    int _2071 = _1995 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    float _2089 = abs(_1067);
    float _2091 = log2(_2089);
    float _2093 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2095 = uint(_2067) > 1u;
    float _2097 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2043);
    int _2099 = _2023 ? 0 : 1;
    float _2101 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2045);
    bool _2103 = uint(_2067) >= 2u;
    float _2105 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2097);
    int _2107 = ~_2099;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2115 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2117 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2119 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2101);
    float _2121 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2113);
    float _2123 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2115);
    int _2125 = _2111;
    float _2127 = _1467;
    if (!_2095)
    {
        int _2129 = ~_2099;
        int _2131 = _2129 + 1;
        _2125 = _2131;
    }
    int _2133 = _2125;
    float _2135 = fma(_2093, _2057, _2061);
    bool _2137 = _2067 != 3;
    float _2139 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2141 = abs(_2133);
    float _2143 = fma(_2093, _2105, _2063);
    bool _2145 = !_2069;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2117);
    int _2151 = _2103 ? 0 : 1;
    float _2153 = exp2(_2139);
    float _2155 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    int _2157 = abs(_2147);
    float _2159 = fma(_2093, _2119, _2065);
    int _2161 = ~_2151;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    float _2167 = _1423 * 0.5;
    bool _2169 = _2067 != 3;
    float _2171 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2149);
    int _2173 = _2165;
    if (_2137)
    {
        int _2175 = ~_2151;
        int _2177 = _2175 + 1;
        _2173 = _2177;
    }
    int _2179 = _2173;
    float _2181 = -_1505;
    float _2183 = _2181 + 1.0;
    int _2185 = ~_2141;
    int _2187 = _2185 + 1;
    int _2189 = _2187 + 1;
    float _2191 = _2171 + _2159;
    float _2193 = _2155 + _2135;
    bool _2195 = !_2169;
    int _2197 = _2195 ? 0 : (-1);
    int _2199 = _2189 * as_type<int>(_2019);
    int _2201 = abs(_2179);
    float _2203 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2205 = ~_2157;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    bool _2213 = !_1743;
    int _2215 = _2213 ? 0 : 1;
    float _2217 = _2203 * _1507;
    int _2219 = abs(_2197);
    int _2221 = _2209 * as_type<int>(_2011);
    int _2223 = _2221 + _2199;
    float _2225 = _2211 + _2143;
    bool _2227 = !_2059;
    int _2229 = _2227 ? 0 : (-1);
    int _2231 = abs(_2215);
    bool _2233 = _1067 <= 8000.0;
    bool _2235 = isnan(_1067);
    bool _2237 = _2233 || _2235;
    bool _2239 = isnan(8000.0);
    bool _2241 = _2237 || _2239;
    float _2243 = float(_2241);
    float _2245 = fma(_2153, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2247 = precise::clamp(_2245, 0.0, 1.0);
    float _2249 = _1528 * _2217;
    int _2251 = ~_2201;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    float _2257 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2259 = ~_2003;
    int _2261 = _2259 + _2229;
    int _2263 = _2261 + 1;
    float _2265 = fma(_1518, _2249, _1516);
    int _2267 = _2255 * as_type<int>(_2079);
    int _2269 = _2267 + _2223;
    int _2271 = _387 * _2263;
    int _2273 = _2271 + _1719;
    int _2275 = ~_2219;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    float _2281 = fma(_2247, -2.0, 3.0);
    int _2283 = ~_2231;
    int _2285 = _2283 + 1;
    int _2287 = _2285 + 1;
    float _2289 = _2247 * _2247;
    bool _2291 = !_1667;
    int _2293 = _2291 ? _2273 : (-1);
    int _2295 = _2279 * as_type<int>(_2087);
    int _2297 = _2295 + _2269;
    float _2299 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2257);
    float _2301 = _2289 * _2281;
    int _2303 = _2297 * _2287;
    float _2305 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2299);
    float _2307 = -_2301;
    float _2309 = _2307 + 1.0;
    float _2311 = _1467 + _1423;
    int _2313 = _2293 * _2231;
    int _2315 = _2313 + _2303;
    float _2317 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    float _2319 = in.m_88.x;
    float _2321 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2301);
    float _2323 = fma(_1485, -0.5, _2167);
    float _2325 = _2317 + _1423;
    float _2327 = _2311 * 0.5;
    float _2329 = _2243 * _2321;
    float _2331 = float(_2315);
    float _2333 = _2325 * 0.5;
    out.m_90.x = _2193;
    out.m_90.y = _2225;
    out.m_90.z = _2191;
    float _2335 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2337 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2339 = isnan(_1221);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2345 = _2341 || _2343;
    out.m_92.x = _2327;
    out.m_92.y = _2323;
    out.m_92.z = _2333;
    out.m_92.w = _1423;
    float _2347 = _2183 * _2335;
    float _2349 = precise::clamp(_2347, 0.0, 1.0);
    out.m_94.x = _2331;
    float _2351 = -_2349;
    float _2353 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1467;
    out.gl_Position.y = _1485;
    out.gl_Position.z = _2317;
    out.gl_Position.w = _1423;
    float _2355 = _2353 * _2319;
    float _2357 = _1518 * _2217;
    float _2359 = -_2203;
    float _2361 = _2359 + 1.0;
    float _2363 = _2355 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2365 = _2203;
    float _2367 = _1423;
    float _2369 = _2333;
    float _2371 = _2357;
    float _2373 = _2361;
    if (!_2345)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2375 = _2365;
    float _2377 = fma(_1524, _2357, _1512);
    float _2379 = fma(_1526, _2357, _1514);
    float _2381 = _1518 * _2361;
    out.m_96.x = _2363;
    float _2383 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2385 = _2375;
    float _2387 = _2375;
    if (!_2345)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2389 = _2127;
    out.m_98.x = _2377;
    out.m_98.y = _2379;
    out.m_98.z = _2265;
    out.m_98.w = _2381;
    float _2391 = _2389;
    float _2393 = _2389;
    if (!_2345)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2395 = _2367;
    float _2397 = _2395;
    float _2399 = _2395;
    if (!_2345)
    {
        _2369 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2401 = _2369;
    float _2403 = _2401;
    float _2405 = _2401;
    if (!_2345)
    {
        _2371 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2407 = _2371;
    float _2409 = _2407;
    float _2411 = _2407;
    if (!_2345)
    {
        _2373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2413 = _2373;
    bool _2415 = !_2345;
    float _2417 = _2413;
    float _2419 = _2413;
    if (!_2415)
    {
        bool _2421 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2423 = isnan(_1221);
        bool _2425 = _2421 || _2423;
        bool _2427 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2429 = _2425 || _2427;
        if (!_2429)
        {
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2433 = _1221 + _2431;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2437 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2435;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2443 = 1.0 / _2437;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2461 = _2433 * _2443;
            float _2463 = precise::clamp(_2461, 0.0, 1.0);
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2469 = fma(_2463, _2441, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2471 = fma(_2463, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2473 = fma(_2463, _2447, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2475 = fma(_2463, _2451, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2477 = fma(_2463, _2455, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2479 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2393 = _2473;
            _2411 = _2477;
            _2387 = _2469;
            _2405 = _2475;
            _2399 = _2471;
            _2419 = _2479;
            _2481 = true;
        }
        else
        {
            bool _2483 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2485 = isnan(_1221);
            bool _2487 = _2483 || _2485;
            bool _2489 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2491 = _2487 || _2489;
            if (!_2491)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2493 = _2385;
            _2387 = _2493;
            if (!_2491)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2495 = _2391;
            _2393 = _2495;
            if (!_2491)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2497 = _2397;
            _2399 = _2497;
            if (!_2491)
            {
                _2403 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2499 = _2403;
            _2405 = _2499;
            if (!_2491)
            {
                _2409 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2501 = _2409;
            _2411 = _2501;
            if (!_2491)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2503 = _2417;
            bool _2505 = !_2491;
            _2419 = _2503;
            if (!_2505)
            {
                bool _2507 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2509 = isnan(_1221);
                bool _2511 = _2507 || _2509;
                bool _2513 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2515 = _2511 || _2513;
                if (!_2515)
                {
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2519 = _1221 + _2517;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2523 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2521;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2529 = 1.0 / _2523;
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2547 = _2519 * _2529;
                    float _2549 = precise::clamp(_2547, 0.0, 1.0);
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2555 = fma(_2549, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2557 = fma(_2549, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2559 = fma(_2549, _2533, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2561 = fma(_2549, _2537, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2563 = fma(_2549, _2541, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2565 = fma(_2549, _2545, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2393 = _2559;
                    _2411 = _2563;
                    _2387 = _2555;
                    _2405 = _2561;
                    _2399 = _2557;
                    _2419 = _2565;
                    _2481 = true;
                }
                else
                {
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2411 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2405 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2481 = false;
    float _2567 = _2393;
    float _2569 = _2411;
    float _2571 = _2387;
    float _2573 = _2405;
    float _2575 = _2399;
    float _2577 = _2419;
    float _2579 = fma(_2225, -0.5, 0.5);
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = -_2567;
    float _2585 = _2583 + _2569;
    float _2587 = _2383 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2589 = -_2571;
    float _2591 = _2589 + _2573;
    float _2593 = fma(_2581, _2585, _2567);
    out.m_100.x = 0.0;
    float _2595 = -_2575;
    float _2597 = _2595 + _2577;
    float _2599 = fma(_2581, _2591, _2571);
    float _2601 = _2593 * 0.586610972881317138671875;
    out.m_53.x = _2587;
    bool _2603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2605 = fma(_2581, _2597, _2575);
    float _2607 = fma(_2599, 0.298911988735198974609375, _2601);
    bool _2609 = _1191 > 0.0;
    bool _2611 = isnan(_1191);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan(0.0);
    bool _2617 = _2613 || _2615;
    float _2619 = fma(_2605, 0.114477999508380889892578125, _2607);
    float _2621 = -_2619;
    float _2623 = _2599 + _2621;
    float _2625 = -_2619;
    float _2627 = _2593 + _2625;
    float _2629 = -_2619;
    float _2631 = _2605 + _2629;
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    float _2635 = fma(_2627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    float _2637 = fma(_2631, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    bool _2639 = !_2603;
    if (!_2639)
    {
        float _2641 = -_1129;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2645 = -_1131;
        float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2649 = -_1133;
        float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2653 = _2643 * _2643;
        float _2655 = fma(_2647, _2647, _2653);
        float _2657 = fma(_2651, _2651, _2655);
        float _2659 = sqrt(_2657);
        float _2661 = rsqrt(_2657);
        float _2663 = -_2659;
        float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2667 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2669 = precise::clamp(_2667, 0.0, 1.0);
        float _2671 = _2647 * _2661;
        float _2673 = _2643 * _2661;
        float _2675 = abs(_2669);
        float _2677 = log2(_2675);
        float _2679 = _2651 * _2661;
        float _2681 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2683 = _2225 * _2673;
        float _2685 = -_2673;
        float _2687 = -_2681;
        float _2689 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2687);
        float _2691 = fma(_2193, _2671, _2683);
        float _2693 = -_2679;
        float _2695 = fma(_2693, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2689);
        float _2697 = fma(_2191, _2679, _2691);
        float _2699 = precise::clamp(_2697, 0.0, 1.0);
        float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2703 = _2695 + _2701;
        float _2705 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2707 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2709 = precise::clamp(_2707, 0.0, 1.0);
        float _2711 = exp2(_2705);
        float _2713 = _2711 * _2709;
        float _2715 = _2699 * _2713;
        float _2717 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2719 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2721 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2717;
        out.m_100.y = _2719;
        out.m_100.z = _2721;
    }
    out.m_74.x = _2633;
    out.m_74.y = _2635;
    out.m_74.z = _2637;
    if (_2617)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2723;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2481 = false;
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
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2791 = as_type<float>(_143);
        out.gl_Position.z = _2791;
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
    float _157 = in.m_55.x;
    float _159 = float(_121);
    bool _161 = _125 >= _159;
    bool _163 = !_155;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _133;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _125 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _145 = as_type<int>(_175);
    }
    int _177 = _145;
    out.m_57.x = _157;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2856 = as_type<float>(_177);
        out.gl_Position.z = _2856;
    }
    out.m_51.x = _171;
    if (_165)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _215;
    if (!_199)
    {
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _215 = _171;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = in.m_62.x;
    float _227 = in.m_62.y;
    bool _229 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_219);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_239;
    float _259 = _257 + 1.0;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    float _265 = 1.0 / _243;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = _255 * _259;
    float _271 = -_255;
    float _273 = _271 + 1.0;
    float _275 = _223 * _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    float _297 = _293 * _225;
    float _299 = _295 * _227;
    bool _301 = !_267;
    if (!_301)
    {
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _305 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _173 = _315;
    }
    float _317 = _173;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = _157 * 2.0;
    float _331 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _333 = in.m_64.x;
    float _335 = in.m_64.y;
    float _337 = in.m_64.z;
    float _339 = in.m_64.w;
    float _341 = _299 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = in.m_66.x;
    float _355 = in.m_66.y;
    float _357 = in.m_66.z;
    float _359 = in.m_66.w;
    float _361 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _363 = log2(_361);
    float _365 = in.m_68.x;
    float _367 = in.m_68.y;
    float _369 = in.m_68.z;
    float _371 = in.m_68.w;
    float _373 = in.m_55.y;
    float _375 = floor(_329);
    float _377 = float(_327);
    float _379 = in.m_55.z;
    float _381 = _363 * _125;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _387 = int(_385);
    float _389 = _321 * _335;
    float _391 = _321 * _355;
    float _393 = fma(_319, _333, _389);
    float _395 = exp2(_381);
    float _397 = _321 * _367;
    float _399 = fma(_319, _353, _391);
    bool _401 = _375 > 0.0;
    float _403 = _373 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _405 = _375 >= 0.0;
    bool _407 = isnan(_375);
    bool _409 = _405 || _407;
    bool _411 = isnan(0.0);
    bool _413 = _409 || _411;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _417 = 1.0 / _377;
    float _419 = fma(_403, -2.0, _383);
    float _421 = _373 * 2.0;
    float _423 = -_415;
    float _425 = fma(_331, 2.0, _423);
    float _427 = _157 + _373;
    float _429 = fma(_319, _365, _397);
    float _431 = fma(_323, _337, _393);
    float _433 = _427 + (-1.0);
    float _435 = _373 + _379;
    bool _437 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _439 = isnan(1.0);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _449 = 1.0 + _447;
    float _451 = fma(_323, _357, _399);
    float _453 = _435 + (-1.0);
    float _455 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _457 = _379 * 2.0;
    float _459 = 1.0 / _449;
    float _461 = fma(_323, _369, _429);
    float _463 = -_395;
    float _465 = _463 + 1.0;
    float _467 = _417 * _125;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = floor(_421);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _475 = float(_387);
    float _477 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _479 = _351 ? _465 : 0.0;
    float _481 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[78].w, _473);
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _495 = _493 != 0;
    float _497 = floor(_457);
    float _499 = _475 * _125;
    float _501 = -_125;
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[76].x, _425);
    float _505 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _477);
    float _507 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    float _509 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _481);
    if (_445)
    {
        float _511 = _479 * _459;
        _135 = _511;
    }
    float _513 = _135;
    int _515 = _413 ? 0 : 1;
    float _517 = _431 + _339;
    bool _519 = _471 > 0.0;
    float _521 = _451 + _359;
    bool _523 = _471 >= 0.0;
    bool _525 = isnan(_471);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = _461 + _371;
    bool _535 = !_491;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_487;
    int _541 = _539 ? 0 : 1;
    bool _543 = _497 >= 0.0;
    bool _545 = isnan(_497);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    bool _553 = !_495;
    int _555 = _553 ? 0 : 1;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    int _569 = ~_515;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    int _575 = _573;
    float _577 = _521;
    if (!_401)
    {
        int _579 = ~_515;
        int _581 = _579 + 1;
        _575 = _581;
    }
    int _583 = _575;
    bool _585 = !_559;
    int _587 = _585 ? 0 : 1;
    float _589 = in.m_70.x;
    float _591 = in.m_70.y;
    float _593 = in.m_70.z;
    int _595 = _531 ? 0 : 1;
    bool _597 = !_563;
    int _599 = _597 ? 0 : 1;
    int _601 = abs(_587);
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _521 + _603;
    int _607 = ~_595;
    int _609 = _607 + 1;
    int _611 = _609 + 1;
    int _613 = _611;
    if (!_519)
    {
        int _615 = ~_595;
        int _617 = _615 + 1;
        _613 = _617;
    }
    int _619 = _613;
    bool _621 = _497 > 0.0;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _625 = _533 + _623;
    int _627 = abs(_599);
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _631 = _517 + _629;
    float _633 = float(_583);
    float _635 = _605 * _605;
    float _637 = float(_627);
    int _639 = _551 ? 0 : 1;
    float _641 = fma(_631, _631, _635);
    float _643 = float(_601);
    float _645 = _637 * _633;
    int _647 = ~_639;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = fma(_625, _625, _641);
    int _655 = _651;
    if (!_621)
    {
        int _657 = ~_639;
        int _659 = _657 + 1;
        _655 = _659;
    }
    int _661 = _655;
    float _663 = _645 * (-2.0);
    float _665 = _373 + (-0.5);
    float _667 = sqrt(_653);
    float _669 = float(_661);
    float _671 = fma(_663, _591, _591);
    bool _673 = !_567;
    int _675 = _673 ? 0 : 1;
    float _677 = fma(_483, _663, _483);
    float _679 = _297 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _681 = _643 * _669;
    int _683 = abs(_675);
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[196].y, _671);
    float _687 = _157 + _379;
    float _689 = rsqrt(_653);
    float _691 = float(_619);
    float _693 = _679 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _695 = float(_683);
    float _697 = _687 + (-1.0);
    float _699 = _667 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _701 = _681 * (-2.0);
    float _703 = _695 * _691;
    float _705 = _379 + (-0.5);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = precise::min(_693, _699);
    float _711 = _157 + (-0.5);
    float _713 = fma(_701, _589, _589);
    float _715 = _703 * (-2.0);
    float _717 = fma(_455, _701, _455);
    float _719 = _689 * _709;
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].x, _713);
    float _723 = fma(_707, _715, _707);
    float _725 = fma(_715, _593, _593);
    float _727 = _605 * _719;
    float _729 = fma(_677, _513, _685);
    float _731 = fma(_717, _513, _721);
    float _733 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _735 = _631 * _719;
    float _737 = -_727;
    float _739 = _605 + _737;
    float _741 = _729 * 0.15915493667125701904296875;
    float _743 = fma(_723, _513, _733);
    float _745 = -_735;
    float _747 = _631 + _745;
    float _749 = _739 * _739;
    float _751 = _625 * _719;
    float _753 = _731 * 0.15915493667125701904296875;
    float _755 = _743 * 0.15915493667125701904296875;
    float _757 = fma(_747, _747, _749);
    float _759 = -_751;
    float _761 = _625 + _759;
    float _763 = _741 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _777 = _773 || _775;
    float _779 = fma(_761, _761, _757);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _741 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = sqrt(_779);
    float _797 = _753 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _753 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = _689 * _795;
    float _807 = _341 * _805;
    float _809 = _679 * _805;
    float _811 = _755 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = _799 * _793;
    float _817 = _799 * _765;
    float _819 = _807 * _767;
    float _821 = _805 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = _821 * 0.5;
    float _825 = _755 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = _803 * _765;
    float _831 = _803 * _793;
    float _833 = _799 * _813;
    float _835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _837 = _803 * _813;
    float _839 = _793 * _813;
    float _841 = _765 * _813;
    float _843 = _809 * _835;
    float _845 = _833 * _819;
    float _847 = _837 * _819;
    float _849 = fma(_827, _815, _829);
    float _851 = -_817;
    float _853 = fma(_827, _831, _851);
    float _855 = -_831;
    float _857 = fma(_827, _817, _855);
    float _859 = -_819;
    float _861 = _827 * _859;
    float _863 = fma(_849, _843, _845);
    float _865 = fma(_827, _829, _815);
    float _867 = fma(_853, _843, _847);
    float _869 = fma(_839, _843, _861);
    float _871 = fma(_857, _823, _863);
    float _873 = -_727;
    float _875 = _521 + _873;
    float _877 = fma(_865, _823, _867);
    float _879 = fma(_841, _823, _869);
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _885 = -_735;
    float _887 = _517 + _885;
    float _889 = _875 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].x, _881);
    float _893 = _875 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].x, _883);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _889);
    float _899 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].z, _891);
    float _901 = -_751;
    float _903 = _533 + _901;
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].z, _895);
    float _909 = _899 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _911 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[10].z, _897);
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[11].z, _905);
    float _915 = _907 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _917 = _533 + _909;
    float _919 = _911 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _923 = _517 + _915;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _927 = _917 + _925;
    float _929 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _931 = 1.0 / _921;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _935 = _923 + _933;
    float _937 = _927 * _927;
    float _939 = _919 + _921;
    float _941 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].x, _929);
    float _943 = fma(_935, _935, _937);
    float _945 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _947 = sqrt(_943);
    float _949 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _951 = _939 * _931;
    float _953 = _951 * 0.5;
    float _955 = _521 + _949;
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _957);
    float _961 = 1.0 / _959;
    bool _963 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = _877;
    float _967 = _949;
    float _969 = _929;
    float _971 = _943;
    float _973 = _947;
    float _975 = _959;
    float _977 = _751;
    float _979 = _955;
    float _981 = _699;
    if (!_963)
    {
        _965 = _923;
    }
    float _983 = _965;
    float _985 = _983;
    if (!_963)
    {
        _967 = _917;
    }
    float _987 = _967;
    float _989 = _987;
    if (!_963)
    {
        _969 = _955;
    }
    float _991 = _969;
    bool _993 = !_963;
    float _995 = _991;
    if (!_993)
    {
        float _997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _999 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1001 = _947 + _999;
        float _1003 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = rsqrt(_943);
        float _1007 = _1001 * _997;
        float _1009 = _1007 * 0.15915493667125701904296875;
        float _1011 = _1009 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        float _1015 = _1009 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        float _1019 = _1013 + (-1.0);
        float _1021 = fma(_1017, _1003, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1023 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1025 = _1005 * _1021;
        float _1027 = fma(_955, _1013, _1023);
        float _1029 = fma(_935, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1031 = fma(_927, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _985 = _1029;
        _995 = _1027;
        _989 = _1031;
        _971 = _1005;
        _973 = _1009;
    }
    float _1033 = _985;
    float _1035 = _995;
    float _1037 = _989;
    float _1039 = _971;
    float _1041 = _973;
    float _1043 = -_735;
    float _1045 = _1043 + _1033;
    float _1047 = -_727;
    float _1049 = _1047 + _1035;
    float _1051 = -_751;
    float _1053 = _1051 + _1037;
    float _1055 = _1049;
    float _1057 = _1045;
    float _1059 = _1039;
    float _1061 = _1041;
    if (_789)
    {
        _975 = 1.0;
    }
    float _1063 = _975;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1067 = _961 * _1065;
    float _1069 = _1063;
    if (_777)
    {
        _977 = _1049;
    }
    float _1071 = _977;
    float _1073 = _1071;
    if (_777)
    {
        _1055 = _1053;
    }
    float _1075 = _1055;
    float _1077 = _1075;
    if (!_777)
    {
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1081 = _875 + _1079;
        float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1085 = _887 + _1083;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = -_517;
        float _1091 = _1089 + _1033;
        float _1093 = _1081 * _1081;
        float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1097 = _903 + _1095;
        float _1099 = -_533;
        float _1101 = _1099 + _1037;
        float _1103 = fma(_1085, _1085, _1093);
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = fma(_1097, _1097, _1103);
        float _1109 = sqrt(_1107);
        float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1113 = -_521;
        float _1115 = _1113 + _1035;
        float _1117 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1119 = _1117 * _1105;
        float _1121 = _1111 * _1119;
        float _1123 = fma(_1091, _1121, _887);
        float _1125 = fma(_1115, _1121, _875);
        float _1127 = fma(_1101, _1121, _903);
        _1073 = _1125;
        _1057 = _1123;
        _1077 = _1127;
        _1059 = _1105;
    }
    float _1129 = _1073;
    float _1131 = _1057;
    float _1133 = _1077;
    float _1135 = _1059;
    float _1137 = _1135;
    if (!_789)
    {
        float _1139 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1147 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1145;
        float _1149 = _1141 * 6.283185482025146484375;
        float _1151 = cos(_1149);
        float _1153 = _1143 * 0.15915493667125701904296875;
        float _1155 = _1141 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = 1.0 / _1151;
        float _1161 = _1153 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = _1153 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = _1163 * _1165;
        float _1173 = 1.0 / _1147;
        float _1175 = 1.0 / _1171;
        float _1177 = _1169 * _1175;
        float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1181 = fma(_1067, _1177, _1179);
        float _1183 = _1181 * _1173;
        float _1185 = precise::clamp(_1183, 0.0, 1.0);
        _1137 = _1173;
        _1061 = _1141;
        _1069 = _1185;
    }
    float _1187 = _1137;
    float _1189 = _1061;
    float _1191 = _1069;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1129 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1131 + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1203 = _1133 + _1201;
    float _1205 = _1195 * _1195;
    float _1207 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1209 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1211 = fma(_1199, _1199, _1205);
    float _1213 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1207);
    float _1215 = fma(_1203, _1203, _1211);
    float _1217 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1213);
    float _1219 = rsqrt(_1215);
    float _1221 = sqrt(_1215);
    float _1223 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1225 = _1199 * _1223;
    float _1227 = _1203 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 * _1227;
    float _1233 = _1229 + _1231;
    float _1235 = sqrt(_1233);
    bool _1237 = _1235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1241 = _1235 + _1239;
    float _1243 = _1187;
    float _1245 = _1233;
    float _1247 = _1241;
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1251 = _1225;
    float _1253 = _1227;
    float _1255 = _1229;
    float _1257 = _1231;
    if (_1237)
    {
        float _1259 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1259;
    }
    float _1261 = _1243;
    if (_1237)
    {
        float _1263 = rsqrt(_1233);
        _1245 = _1263;
    }
    float _1265 = _1245;
    if (_1237)
    {
        float _1267 = _1241 * _1261;
        _1247 = _1267;
    }
    float _1269 = _1247;
    if (_1237)
    {
        float _1271 = _1269 * 0.15915493667125701904296875;
        _577 = _1271;
    }
    float _1273 = _577;
    float _1275 = _1261;
    if (_1237)
    {
        float _1277 = _1273 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        _1275 = _1279;
    }
    float _1281 = _1275;
    float _1283 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1285 = precise::max(0.0, _1283);
    float _1287 = _1189;
    float _1289 = _1285;
    if (_1237)
    {
        float _1291 = _1273 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        _1287 = _1293;
    }
    float _1295 = _1287;
    float _1297 = -_1223;
    float _1299 = -_1285;
    float _1301 = fma(_1195, _1297, _1299);
    float _1303 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1237)
    {
        float _1305 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1289 = _1305;
    }
    float _1307 = _1289;
    float _1309 = _1281;
    if (_1237)
    {
        float _1311 = fma(_1281, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _979 = _1311;
    }
    float _1313 = _979;
    if (!_1237)
    {
        _1309 = _1301;
    }
    float _1315 = _1309;
    float _1317 = floor(_1303);
    float _1319 = _1315;
    if (_1237)
    {
        float _1321 = _1295 + (-1.0);
        _1249 = _1321;
    }
    float _1323 = _1249;
    float _1325 = _1323;
    if (_1237)
    {
        float _1327 = _1265 * _1313;
        _981 = _1327;
    }
    float _1329 = _981;
    if (_1237)
    {
        float _1331 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1331;
    }
    float _1333 = _1325;
    if (_1237)
    {
        float _1335 = _1225 * _1329;
        _1251 = _1335;
    }
    float _1337 = _1251;
    if (_1237)
    {
        float _1339 = _1227 * _1329;
        _1253 = _1339;
    }
    float _1341 = _1253;
    if (_1237)
    {
        float _1343 = fma(_1301, _1295, _1333);
        _1319 = _1343;
    }
    float _1345 = _1319;
    if (_1237)
    {
        float _1347 = _1337 * _1337;
        _1255 = _1347;
    }
    float _1349 = _1255;
    if (_1237)
    {
        float _1351 = _1341 * _1341;
        _1257 = _1351;
    }
    float _1353 = _1257;
    float _1355 = fma(_1345, _1345, _1349);
    float _1357 = fma(_903, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1359 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1363 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1361);
    float _1365 = precise::clamp(_1363, 0.0, 1.0);
    float _1367 = _1355 + _1353;
    float _1369 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1371 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1359);
    float _1373 = -_1365;
    float _1375 = _1373 + 1.0;
    float _1377 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1369);
    float _1379 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1371);
    float _1381 = rsqrt(_1367);
    float _1383 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1209);
    float _1385 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1377);
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1391 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = abs(_1375);
    float _1399 = log2(_1397);
    float _1401 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1403 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1405 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    float _1407 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1409 = -_1317;
    float _1411 = _1303 + _1409;
    float _1413 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1405);
    float _1417 = _1381 * _1337;
    float _1419 = _1381 * _1345;
    float _1421 = floor(_1357);
    float _1423 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1415);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1427 = _1381 * _1341;
    float _1429 = -_1407;
    float _1431 = fma(_1429, _1403, 1.0);
    float _1433 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1435 = -_1425;
    float _1437 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1435);
    float _1439 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1441 = 1.0 / _1423;
    float _1443 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1445 = -_1427;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1437);
    float _1449 = _1419 + 1.0;
    float _1451 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1443);
    float _1453 = fma(_1447, -0.5, 0.5);
    float _1455 = fma(_1447, 0.5, 0.5);
    float _1457 = exp2(_1439);
    float _1459 = -_1421;
    float _1461 = _1357 + _1459;
    float _1463 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1433);
    float _1465 = fma(_1455, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1467 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1451);
    float _1469 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1463);
    float _1471 = fma(_1455, _1465, -0.212114393711090087890625);
    float _1473 = log2(_1431);
    float _1475 = fma(_1455, _1471, 1.570728778839111328125);
    float _1477 = _1467 * _1441;
    float _1479 = sqrt(_1453);
    float _1481 = -_1419;
    float _1483 = fma(_1457, _1449, _1481);
    float _1485 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1487 = fma(_1483, 0.5, 0.5);
    float _1489 = _1485 * _1441;
    float _1491 = _1473 * 0.693147182464599609375;
    float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1495 = fma(_1477, 0.5, 0.5);
    float _1497 = _1479 * 0.636619746685028076171875;
    float _1499 = fma(_1489, -0.5, 0.5);
    float _1501 = -_1475;
    float _1503 = fma(_1497, _1501, 1.0);
    float2 _4880 = float2(_1411, _1461);
    float _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4880, float2(0.0), isnan(_4880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4880, float2(0.0), isnan(_4880)), level(0.0)).x;
    float3 _4891 = float3(_1495, _1499, _1493);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4891, float3(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4891, float3(0.0), isnan(_4891)), level(0.0)).x;
    float3 _4902 = float3(_1495, _1499, _1493);
    float4 _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4902, float3(0.0), isnan(_4902)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4902, float3(0.0), isnan(_4902)), level(0.0)).xyzw;
    float _1512 = _1510.x;
    float _1514 = _1510.y;
    float _1516 = _1510.z;
    float _1518 = _1510.w;
    float2 _4918 = float2(_1503, _1487);
    float3 _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4918, float2(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4918, float2(0.0), isnan(_4918)), level(0.0)).xyz;
    float _1524 = _1522.x;
    float _1526 = _1522.y;
    float _1528 = _1522.z;
    float _1530 = float(uint(_387));
    float _1532 = trunc(_467);
    int _1534 = int(_1532);
    float _1536 = _499 * _167;
    int _1538 = abs(_537);
    float _1540 = -_509;
    float _1542 = _1540 + 1.0;
    int _1544 = ~_387;
    int _1546 = _1544 + 1;
    out.m_72.x = _887;
    out.m_72.y = _875;
    out.m_72.z = _903;
    int _1548 = abs(_555);
    float _1550 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1552 = 1.0 / _1530;
    bool _1554 = _157 > 0.5;
    out.m_74.w = _709;
    bool _1556 = _373 > 0.5;
    out.m_76.x = _809;
    bool _1558 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1560 = isnan(_317);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = trunc(_1536);
    int _1572 = int(_1570);
    float _1574 = float(uint(_1534));
    float _1576 = _849 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1580 = _1578 != 0;
    out.m_78.x = _1131;
    out.m_78.y = _1129;
    out.m_78.z = _1133;
    int _1582 = ~_387;
    int _1584 = _1582 + 1;
    float _1586 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    int _1588 = as_type<int>(_1552) + (-2);
    float _1590 = exp2(_1550);
    float _1592 = as_type<float>(_1588) * _1574;
    float _1594 = trunc(_1592);
    float _1596 = precise::max(_1594, 0.0);
    uint _1599 = uint(_1596);
    float _1601 = -_1590;
    float _1603 = _1601 + 1.0;
    int _1605 = _1546 * int(_1599);
    int _1607 = _1605 + _1534;
    float _1609 = float(uint(_1607));
    bool _1611 = !_1580;
    float _1613 = _1611 ? 7.345489978790283203125 : 1.0;
    float _1615 = as_type<float>(_1588) * _1609;
    float _1617 = _1613 * _157;
    float _1619 = trunc(_1615);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    float _1625 = floor(_1617);
    int _1627 = int(_1599) + int(_1623);
    float _1629 = float(_1534);
    int _1631 = _1584 * _1627;
    int _1633 = _1631 + _1534;
    bool _1635 = _1629 >= _475;
    bool _1637 = isnan(_1629);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan(_475);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = -_1625;
    float _1649 = _1617 + _1647;
    bool _1651 = uint(_1633) >= uint(_387);
    float _1653 = trunc(_1645);
    int _1655 = int(_1653);
    float _1657 = _1649 * _475;
    float _1659 = trunc(_1657);
    int _1661 = int(_1659);
    bool _1663 = !_1651;
    int _1665 = _1663 ? 0 : (-1);
    bool _1667 = _387 == 0;
    int _1669 = ~_1627;
    int _1671 = _1669 + _1665;
    int _1673 = _1671 + 1;
    int _1675 = ~_1655;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _387 * _1673;
    int _1683 = _1681 + _1534;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1687 = _1685 != 0;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1691 = _1689 != 0;
    bool _1693 = !_1667;
    int _1695 = _1693 ? _1683 : (-1);
    int _1697 = _387 + (-1);
    bool _1699 = !_1687;
    int _1701 = _1699 ? 0 : 1;
    int _1703 = _1695 * _1679;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1707 = _1705 != 0;
    int _1709 = abs(_1701);
    int _1711 = _1655 * _1697;
    int _1713 = _1711 + _1703;
    int _1715 = abs(_541);
    int _1717 = _1661 * _1709;
    int _1719 = _1717 + _1534;
    bool _1721 = !_1707;
    int _1723 = _1721 ? 0 : 1;
    int _1725 = _1713 * _1538;
    int _1727 = abs(_1723);
    int _1729 = _1572 * _1715;
    int _1731 = _1729 + _1725;
    int _1733 = ~_387;
    int _1735 = _1733 + 1;
    int _1737 = _1719 * _1548;
    int _1739 = _1737 + _1731;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1743 = _1741 != 0;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1747 = _317 + _1745;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1751 = _1749 != 0;
    int _1753 = _1661 * _1727;
    int _1755 = _1753 + _1739;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1765 = float(uint(_1719));
    float _1767 = float(uint(_1755));
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1771 = _1769 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1773 = as_type<float>(_1588) * _1765;
    float _1775 = -_197;
    int _1777 = _1556 ? as_type<int>(_1775) : as_type<int>(_197);
    float _1779 = as_type<float>(_1588) * _1767;
    float _1781 = 1.0 / _1771;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1787 = trunc(_1779);
    float _1789 = precise::max(_1787, 0.0);
    uint _1791 = uint(_1789);
    float _1793 = 1.0 / _1785;
    float _1795 = _1759 * _1781;
    bool _1797 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1799 = isnan(_317);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    bool _1809 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1811 = isnan(_317);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1817 = _1813 || _1815;
    float _1819 = float(_1817);
    float _1821 = fma(_1795, _1747, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1825 = _317 + _1823;
    float _1827 = -_1807;
    float _1829 = _1827 + 1.0;
    int _1831 = _1735 * int(_1791);
    int _1833 = _1831 + _1755;
    float _1835 = _1568 * _1829;
    float _1837 = float(uint(_1833));
    float _1839 = _1821 * _1835;
    float _1841 = _1763 * _1793;
    int _1843 = ~_387;
    int _1845 = _1843 + 1;
    float _1847 = as_type<float>(_1588) * _1837;
    float _1849 = -_1819;
    float _1851 = _1849 + 1.0;
    float _1853 = fma(_1841, _1825, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1855 = ~_387;
    int _1857 = _1855 + 1;
    float _1859 = _1807 * _1851;
    float _1861 = trunc(_1847);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    float _1867 = trunc(_1773);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = int(_1791) + int(_1865);
    float _1875 = -_1568;
    float _1877 = _1875 + 1.0;
    float _1879 = -_193;
    int _1881 = _1554 ? as_type<int>(_1879) : as_type<int>(_193);
    float _1883 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1839);
    bool _1885 = !_1691;
    float _1887 = _1885 ? _193 : as_type<float>(_1881);
    int _1889 = _1845 * _1873;
    int _1891 = _1889 + _1755;
    bool _1893 = !_1751;
    float _1895 = _1893 ? _197 : as_type<float>(_1777);
    float _1897 = fma(_1853, _1859, _1883);
    int _1899 = _1857 * int(_1871);
    int _1901 = _1899 + _1719;
    float _1903 = _1887 + 0.5;
    bool _1905 = uint(_1891) >= uint(_387);
    float _1907 = _1895 + (-0.5);
    float _1909 = fma(_1903, (*spvDescriptorSet0.vp_c9)._m0[80].x, _503);
    float _1911 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1897);
    bool _1913 = !_1905;
    int _1915 = _1913 ? 0 : (-1);
    float _1917 = -_1907;
    float _1919 = -_507;
    float _1921 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1919);
    float _1923 = -_505;
    float _1925 = _1923 + 1.0;
    float _1927 = float(uint(_1901));
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1931 = ~_1873;
    int _1933 = _1931 + _1915;
    int _1935 = _1933 + 1;
    float _1937 = -_1925;
    float _1939 = fma(_1887, _1937, _1909);
    float _1941 = as_type<float>(_1588) * _1927;
    float _1943 = fma(_1895, _1542, _1921);
    int _1945 = _387 * _1935;
    int _1947 = _1945 + _1755;
    float _1949 = _1911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    bool _1959 = !_1667;
    int _1961 = _1959 ? _1947 : (-1);
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1967 = _1961 >> 31;
    float _1969 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1973 = _1967 & 3;
    float _1975 = _1963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1979 = _1961 + _1973;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1983 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1987 = _1979 >> 2;
    out.m_80.x = _1969;
    out.m_80.y = _1975;
    out.m_80.z = _1977;
    out.m_80.w = _1971;
    float _1989 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1993 = _1987 << 4;
    int _1995 = _1993 + 368;
    out.m_82.x = _1939;
    out.m_82.y = _1943;
    int _1997 = ~_387;
    int _1999 = _1997 + 1;
    float _2001 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2003 = int(_1871) + int(_1957);
    uint _2005 = uint(int(uint(_1995) >> uint(2)));
    uint _2007 = uint(int(uint(int(_2005)) >> uint(2)));
    int _2009 = int(_2005) & 3;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[int(_2007)][_2009];
    int _2013 = int(_2005) + 1;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    int _2017 = _2013 & 3;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[int(_2015)][_2017];
    out.m_84.x = _1989;
    out.m_84.y = _1983;
    out.m_84.z = _1991;
    out.m_84.w = _1949;
    int _2021 = _1961 & 3;
    bool _2023 = _2021 != 0;
    float _2025 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2027 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2029 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_86.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2031 = -_827;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2025);
    float _2035 = -_827;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2027);
    float _2039 = -_827;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2029);
    float _2043 = _849 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2045 = _849 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2047 = _1999 * _2003;
    int _2049 = _2047 + _1719;
    float _2051 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2033);
    float _2053 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2037);
    float _2055 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2041);
    float _2057 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1586);
    bool _2059 = uint(_2049) >= uint(_387);
    float _2061 = _2001 * _2051;
    float _2063 = _2001 * _2053;
    float _2065 = _2001 * _2055;
    int _2067 = _1961 & 3;
    bool _2069 = _2067 != 0;
    int _2071 = _1995 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    float _2089 = abs(_1067);
    float _2091 = log2(_2089);
    float _2093 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2095 = uint(_2067) > 1u;
    float _2097 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2043);
    int _2099 = _2023 ? 0 : 1;
    float _2101 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2045);
    bool _2103 = uint(_2067) >= 2u;
    float _2105 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2097);
    int _2107 = ~_2099;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2115 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2117 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2119 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2101);
    float _2121 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2113);
    float _2123 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2115);
    int _2125 = _2111;
    float _2127 = _1467;
    if (!_2095)
    {
        int _2129 = ~_2099;
        int _2131 = _2129 + 1;
        _2125 = _2131;
    }
    int _2133 = _2125;
    float _2135 = fma(_2093, _2057, _2061);
    bool _2137 = _2067 != 3;
    float _2139 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2141 = abs(_2133);
    float _2143 = fma(_2093, _2105, _2063);
    bool _2145 = !_2069;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2117);
    int _2151 = _2103 ? 0 : 1;
    float _2153 = exp2(_2139);
    float _2155 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    int _2157 = abs(_2147);
    float _2159 = fma(_2093, _2119, _2065);
    int _2161 = ~_2151;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    float _2167 = _1423 * 0.5;
    bool _2169 = _2067 != 3;
    float _2171 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2149);
    int _2173 = _2165;
    if (_2137)
    {
        int _2175 = ~_2151;
        int _2177 = _2175 + 1;
        _2173 = _2177;
    }
    int _2179 = _2173;
    float _2181 = -_1505;
    float _2183 = _2181 + 1.0;
    int _2185 = ~_2141;
    int _2187 = _2185 + 1;
    int _2189 = _2187 + 1;
    float _2191 = _2171 + _2159;
    float _2193 = _2155 + _2135;
    bool _2195 = !_2169;
    int _2197 = _2195 ? 0 : (-1);
    int _2199 = _2189 * as_type<int>(_2019);
    int _2201 = abs(_2179);
    float _2203 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2205 = ~_2157;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    bool _2213 = !_1743;
    int _2215 = _2213 ? 0 : 1;
    float _2217 = _2203 * _1507;
    int _2219 = abs(_2197);
    int _2221 = _2209 * as_type<int>(_2011);
    int _2223 = _2221 + _2199;
    float _2225 = _2211 + _2143;
    bool _2227 = !_2059;
    int _2229 = _2227 ? 0 : (-1);
    int _2231 = abs(_2215);
    bool _2233 = _1067 <= 8000.0;
    bool _2235 = isnan(_1067);
    bool _2237 = _2233 || _2235;
    bool _2239 = isnan(8000.0);
    bool _2241 = _2237 || _2239;
    float _2243 = float(_2241);
    float _2245 = fma(_2153, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2247 = precise::clamp(_2245, 0.0, 1.0);
    float _2249 = _1528 * _2217;
    int _2251 = ~_2201;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    float _2257 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2259 = ~_2003;
    int _2261 = _2259 + _2229;
    int _2263 = _2261 + 1;
    float _2265 = fma(_1518, _2249, _1516);
    int _2267 = _2255 * as_type<int>(_2079);
    int _2269 = _2267 + _2223;
    int _2271 = _387 * _2263;
    int _2273 = _2271 + _1719;
    int _2275 = ~_2219;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    float _2281 = fma(_2247, -2.0, 3.0);
    int _2283 = ~_2231;
    int _2285 = _2283 + 1;
    int _2287 = _2285 + 1;
    float _2289 = _2247 * _2247;
    bool _2291 = !_1667;
    int _2293 = _2291 ? _2273 : (-1);
    int _2295 = _2279 * as_type<int>(_2087);
    int _2297 = _2295 + _2269;
    float _2299 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2257);
    float _2301 = _2289 * _2281;
    int _2303 = _2297 * _2287;
    float _2305 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2299);
    float _2307 = -_2301;
    float _2309 = _2307 + 1.0;
    float _2311 = _1467 + _1423;
    int _2313 = _2293 * _2231;
    int _2315 = _2313 + _2303;
    float _2317 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    float _2319 = in.m_88.x;
    float _2321 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2301);
    float _2323 = fma(_1485, -0.5, _2167);
    float _2325 = _2317 + _1423;
    float _2327 = _2311 * 0.5;
    float _2329 = _2243 * _2321;
    float _2331 = float(_2315);
    float _2333 = _2325 * 0.5;
    out.m_90.x = _2193;
    out.m_90.y = _2225;
    out.m_90.z = _2191;
    float _2335 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2337 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2339 = isnan(_1221);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2345 = _2341 || _2343;
    out.m_92.x = _2327;
    out.m_92.y = _2323;
    out.m_92.z = _2333;
    out.m_92.w = _1423;
    float _2347 = _2183 * _2335;
    float _2349 = precise::clamp(_2347, 0.0, 1.0);
    out.m_94.x = _2331;
    float _2351 = -_2349;
    float _2353 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1467;
    out.gl_Position.y = _1485;
    out.gl_Position.z = _2317;
    out.gl_Position.w = _1423;
    float _2355 = _2353 * _2319;
    float _2357 = _1518 * _2217;
    float _2359 = -_2203;
    float _2361 = _2359 + 1.0;
    float _2363 = _2355 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2365 = _2203;
    float _2367 = _1423;
    float _2369 = _2333;
    float _2371 = _2357;
    float _2373 = _2361;
    if (!_2345)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2375 = _2365;
    float _2377 = fma(_1524, _2357, _1512);
    float _2379 = fma(_1526, _2357, _1514);
    float _2381 = _1518 * _2361;
    out.m_96.x = _2363;
    float _2383 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2385 = _2375;
    float _2387 = _2375;
    if (!_2345)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2389 = _2127;
    out.m_98.x = _2377;
    out.m_98.y = _2379;
    out.m_98.z = _2265;
    out.m_98.w = _2381;
    float _2391 = _2389;
    float _2393 = _2389;
    if (!_2345)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2395 = _2367;
    float _2397 = _2395;
    float _2399 = _2395;
    if (!_2345)
    {
        _2369 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2401 = _2369;
    float _2403 = _2401;
    float _2405 = _2401;
    if (!_2345)
    {
        _2371 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2407 = _2371;
    float _2409 = _2407;
    float _2411 = _2407;
    if (!_2345)
    {
        _2373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2413 = _2373;
    bool _2415 = !_2345;
    float _2417 = _2413;
    float _2419 = _2413;
    if (!_2415)
    {
        bool _2421 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2423 = isnan(_1221);
        bool _2425 = _2421 || _2423;
        bool _2427 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2429 = _2425 || _2427;
        if (!_2429)
        {
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2433 = _1221 + _2431;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2437 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2435;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2443 = 1.0 / _2437;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2461 = _2433 * _2443;
            float _2463 = precise::clamp(_2461, 0.0, 1.0);
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2469 = fma(_2463, _2441, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2471 = fma(_2463, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2473 = fma(_2463, _2447, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2475 = fma(_2463, _2451, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2477 = fma(_2463, _2455, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2479 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2393 = _2473;
            _2411 = _2477;
            _2387 = _2469;
            _2405 = _2475;
            _2399 = _2471;
            _2419 = _2479;
            _2481 = true;
        }
        else
        {
            bool _2483 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2485 = isnan(_1221);
            bool _2487 = _2483 || _2485;
            bool _2489 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2491 = _2487 || _2489;
            if (!_2491)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2493 = _2385;
            _2387 = _2493;
            if (!_2491)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2495 = _2391;
            _2393 = _2495;
            if (!_2491)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2497 = _2397;
            _2399 = _2497;
            if (!_2491)
            {
                _2403 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2499 = _2403;
            _2405 = _2499;
            if (!_2491)
            {
                _2409 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2501 = _2409;
            _2411 = _2501;
            if (!_2491)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2503 = _2417;
            bool _2505 = !_2491;
            _2419 = _2503;
            if (!_2505)
            {
                bool _2507 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2509 = isnan(_1221);
                bool _2511 = _2507 || _2509;
                bool _2513 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2515 = _2511 || _2513;
                if (!_2515)
                {
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2519 = _1221 + _2517;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2523 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2521;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2529 = 1.0 / _2523;
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2547 = _2519 * _2529;
                    float _2549 = precise::clamp(_2547, 0.0, 1.0);
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2555 = fma(_2549, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2557 = fma(_2549, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2559 = fma(_2549, _2533, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2561 = fma(_2549, _2537, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2563 = fma(_2549, _2541, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2565 = fma(_2549, _2545, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2393 = _2559;
                    _2411 = _2563;
                    _2387 = _2555;
                    _2405 = _2561;
                    _2399 = _2557;
                    _2419 = _2565;
                    _2481 = true;
                }
                else
                {
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2411 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2405 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2481 = false;
    float _2567 = _2393;
    float _2569 = _2411;
    float _2571 = _2387;
    float _2573 = _2405;
    float _2575 = _2399;
    float _2577 = _2419;
    float _2579 = fma(_2225, -0.5, 0.5);
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = -_2567;
    float _2585 = _2583 + _2569;
    float _2587 = _2383 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2589 = -_2571;
    float _2591 = _2589 + _2573;
    float _2593 = fma(_2581, _2585, _2567);
    out.m_100.x = 0.0;
    float _2595 = -_2575;
    float _2597 = _2595 + _2577;
    float _2599 = fma(_2581, _2591, _2571);
    float _2601 = _2593 * 0.586610972881317138671875;
    out.m_53.x = _2587;
    bool _2603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2605 = fma(_2581, _2597, _2575);
    float _2607 = fma(_2599, 0.298911988735198974609375, _2601);
    bool _2609 = _1191 > 0.0;
    bool _2611 = isnan(_1191);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan(0.0);
    bool _2617 = _2613 || _2615;
    float _2619 = fma(_2605, 0.114477999508380889892578125, _2607);
    float _2621 = -_2619;
    float _2623 = _2599 + _2621;
    float _2625 = -_2619;
    float _2627 = _2593 + _2625;
    float _2629 = -_2619;
    float _2631 = _2605 + _2629;
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    float _2635 = fma(_2627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    float _2637 = fma(_2631, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    bool _2639 = !_2603;
    if (!_2639)
    {
        float _2641 = -_1129;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2645 = -_1131;
        float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2649 = -_1133;
        float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2653 = _2643 * _2643;
        float _2655 = fma(_2647, _2647, _2653);
        float _2657 = fma(_2651, _2651, _2655);
        float _2659 = sqrt(_2657);
        float _2661 = rsqrt(_2657);
        float _2663 = -_2659;
        float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2667 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2669 = precise::clamp(_2667, 0.0, 1.0);
        float _2671 = _2647 * _2661;
        float _2673 = _2643 * _2661;
        float _2675 = abs(_2669);
        float _2677 = log2(_2675);
        float _2679 = _2651 * _2661;
        float _2681 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2683 = _2225 * _2673;
        float _2685 = -_2673;
        float _2687 = -_2681;
        float _2689 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2687);
        float _2691 = fma(_2193, _2671, _2683);
        float _2693 = -_2679;
        float _2695 = fma(_2693, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2689);
        float _2697 = fma(_2191, _2679, _2691);
        float _2699 = precise::clamp(_2697, 0.0, 1.0);
        float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2703 = _2695 + _2701;
        float _2705 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2707 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2709 = precise::clamp(_2707, 0.0, 1.0);
        float _2711 = exp2(_2705);
        float _2713 = _2711 * _2709;
        float _2715 = _2699 * _2713;
        float _2717 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2719 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2721 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2717;
        out.m_100.y = _2719;
        out.m_100.z = _2721;
    }
    out.m_74.x = _2633;
    out.m_74.y = _2635;
    out.m_74.z = _2637;
    if (_2617)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2723;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2481 = false;
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
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2791 = as_type<float>(_143);
        out.gl_Position.z = _2791;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = in.m_55.x;
    float _159 = float(_121);
    bool _161 = _125 >= _159;
    bool _163 = !_155;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _133;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _125 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _145 = as_type<int>(_175);
    }
    int _177 = _145;
    out.m_57.x = _157;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2856 = as_type<float>(_177);
        out.gl_Position.z = _2856;
    }
    out.m_51.x = _171;
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _215;
    if (!_199)
    {
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        _215 = _171;
    }
    _217 = false;
    float _219 = _215;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _219 + _221;
    float _225 = in.m_62.x;
    float _227 = in.m_62.y;
    bool _229 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_219);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    bool _245 = _219 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_219);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_239;
    float _259 = _257 + 1.0;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    float _265 = 1.0 / _243;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = _255 * _259;
    float _271 = -_255;
    float _273 = _271 + 1.0;
    float _275 = _223 * _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    float _297 = _293 * _225;
    float _299 = _295 * _227;
    bool _301 = !_267;
    if (!_301)
    {
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _305 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _173 = _315;
    }
    float _317 = _173;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = _157 * 2.0;
    float _331 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _333 = in.m_64.x;
    float _335 = in.m_64.y;
    float _337 = in.m_64.z;
    float _339 = in.m_64.w;
    float _341 = _299 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = in.m_66.x;
    float _355 = in.m_66.y;
    float _357 = in.m_66.z;
    float _359 = in.m_66.w;
    float _361 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _363 = log2(_361);
    float _365 = in.m_68.x;
    float _367 = in.m_68.y;
    float _369 = in.m_68.z;
    float _371 = in.m_68.w;
    float _373 = in.m_55.y;
    float _375 = floor(_329);
    float _377 = float(_327);
    float _379 = in.m_55.z;
    float _381 = _363 * _125;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _387 = int(_385);
    float _389 = _321 * _335;
    float _391 = _321 * _355;
    float _393 = fma(_319, _333, _389);
    float _395 = exp2(_381);
    float _397 = _321 * _367;
    float _399 = fma(_319, _353, _391);
    bool _401 = _375 > 0.0;
    float _403 = _373 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _405 = _375 >= 0.0;
    bool _407 = isnan(_375);
    bool _409 = _405 || _407;
    bool _411 = isnan(0.0);
    bool _413 = _409 || _411;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _417 = 1.0 / _377;
    float _419 = fma(_403, -2.0, _383);
    float _421 = _373 * 2.0;
    float _423 = -_415;
    float _425 = fma(_331, 2.0, _423);
    float _427 = _157 + _373;
    float _429 = fma(_319, _365, _397);
    float _431 = fma(_323, _337, _393);
    float _433 = _427 + (-1.0);
    float _435 = _373 + _379;
    bool _437 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _439 = isnan(1.0);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _445 = _441 || _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _449 = 1.0 + _447;
    float _451 = fma(_323, _357, _399);
    float _453 = _435 + (-1.0);
    float _455 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _457 = _379 * 2.0;
    float _459 = 1.0 / _449;
    float _461 = fma(_323, _369, _429);
    float _463 = -_395;
    float _465 = _463 + 1.0;
    float _467 = _417 * _125;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _471 = floor(_421);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _475 = float(_387);
    float _477 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _469);
    float _479 = _351 ? _465 : 0.0;
    float _481 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[78].w, _473);
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _487 = _485 != 0;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _495 = _493 != 0;
    float _497 = floor(_457);
    float _499 = _475 * _125;
    float _501 = -_125;
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[76].x, _425);
    float _505 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _477);
    float _507 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _419);
    float _509 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _481);
    if (_445)
    {
        float _511 = _479 * _459;
        _135 = _511;
    }
    float _513 = _135;
    int _515 = _413 ? 0 : 1;
    float _517 = _431 + _339;
    bool _519 = _471 > 0.0;
    float _521 = _451 + _359;
    bool _523 = _471 >= 0.0;
    bool _525 = isnan(_471);
    bool _527 = _523 || _525;
    bool _529 = isnan(0.0);
    bool _531 = _527 || _529;
    float _533 = _461 + _371;
    bool _535 = !_491;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_487;
    int _541 = _539 ? 0 : 1;
    bool _543 = _497 >= 0.0;
    bool _545 = isnan(_497);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    bool _553 = !_495;
    int _555 = _553 ? 0 : 1;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _559 = _557 != 0;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _567 = _565 != 0;
    int _569 = ~_515;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    int _575 = _573;
    float _577 = _521;
    if (!_401)
    {
        int _579 = ~_515;
        int _581 = _579 + 1;
        _575 = _581;
    }
    int _583 = _575;
    bool _585 = !_559;
    int _587 = _585 ? 0 : 1;
    float _589 = in.m_70.x;
    float _591 = in.m_70.y;
    float _593 = in.m_70.z;
    int _595 = _531 ? 0 : 1;
    bool _597 = !_563;
    int _599 = _597 ? 0 : 1;
    int _601 = abs(_587);
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _521 + _603;
    int _607 = ~_595;
    int _609 = _607 + 1;
    int _611 = _609 + 1;
    int _613 = _611;
    if (!_519)
    {
        int _615 = ~_595;
        int _617 = _615 + 1;
        _613 = _617;
    }
    int _619 = _613;
    bool _621 = _497 > 0.0;
    float _623 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _625 = _533 + _623;
    int _627 = abs(_599);
    float _629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _631 = _517 + _629;
    float _633 = float(_583);
    float _635 = _605 * _605;
    float _637 = float(_627);
    int _639 = _551 ? 0 : 1;
    float _641 = fma(_631, _631, _635);
    float _643 = float(_601);
    float _645 = _637 * _633;
    int _647 = ~_639;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = fma(_625, _625, _641);
    int _655 = _651;
    if (!_621)
    {
        int _657 = ~_639;
        int _659 = _657 + 1;
        _655 = _659;
    }
    int _661 = _655;
    float _663 = _645 * (-2.0);
    float _665 = _373 + (-0.5);
    float _667 = sqrt(_653);
    float _669 = float(_661);
    float _671 = fma(_663, _591, _591);
    bool _673 = !_567;
    int _675 = _673 ? 0 : 1;
    float _677 = fma(_483, _663, _483);
    float _679 = _297 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _681 = _643 * _669;
    int _683 = abs(_675);
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[196].y, _671);
    float _687 = _157 + _379;
    float _689 = rsqrt(_653);
    float _691 = float(_619);
    float _693 = _679 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _695 = float(_683);
    float _697 = _687 + (-1.0);
    float _699 = _667 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _701 = _681 * (-2.0);
    float _703 = _695 * _691;
    float _705 = _379 + (-0.5);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = precise::min(_693, _699);
    float _711 = _157 + (-0.5);
    float _713 = fma(_701, _589, _589);
    float _715 = _703 * (-2.0);
    float _717 = fma(_455, _701, _455);
    float _719 = _689 * _709;
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].x, _713);
    float _723 = fma(_707, _715, _707);
    float _725 = fma(_715, _593, _593);
    float _727 = _605 * _719;
    float _729 = fma(_677, _513, _685);
    float _731 = fma(_717, _513, _721);
    float _733 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[196].z, _725);
    float _735 = _631 * _719;
    float _737 = -_727;
    float _739 = _605 + _737;
    float _741 = _729 * 0.15915493667125701904296875;
    float _743 = fma(_723, _513, _733);
    float _745 = -_735;
    float _747 = _631 + _745;
    float _749 = _739 * _739;
    float _751 = _625 * _719;
    float _753 = _731 * 0.15915493667125701904296875;
    float _755 = _743 * 0.15915493667125701904296875;
    float _757 = fma(_747, _747, _749);
    float _759 = -_751;
    float _761 = _625 + _759;
    float _763 = _741 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _777 = _773 || _775;
    float _779 = fma(_761, _761, _757);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _741 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = sqrt(_779);
    float _797 = _753 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _753 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = _689 * _795;
    float _807 = _341 * _805;
    float _809 = _679 * _805;
    float _811 = _755 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = _799 * _793;
    float _817 = _799 * _765;
    float _819 = _807 * _767;
    float _821 = _805 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = _821 * 0.5;
    float _825 = _755 * 6.283185482025146484375;
    float _827 = sin(_825);
    float _829 = _803 * _765;
    float _831 = _803 * _793;
    float _833 = _799 * _813;
    float _835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _837 = _803 * _813;
    float _839 = _793 * _813;
    float _841 = _765 * _813;
    float _843 = _809 * _835;
    float _845 = _833 * _819;
    float _847 = _837 * _819;
    float _849 = fma(_827, _815, _829);
    float _851 = -_817;
    float _853 = fma(_827, _831, _851);
    float _855 = -_831;
    float _857 = fma(_827, _817, _855);
    float _859 = -_819;
    float _861 = _827 * _859;
    float _863 = fma(_849, _843, _845);
    float _865 = fma(_827, _829, _815);
    float _867 = fma(_853, _843, _847);
    float _869 = fma(_839, _843, _861);
    float _871 = fma(_857, _823, _863);
    float _873 = -_727;
    float _875 = _521 + _873;
    float _877 = fma(_865, _823, _867);
    float _879 = fma(_841, _823, _869);
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _885 = -_735;
    float _887 = _517 + _885;
    float _889 = _875 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].x, _881);
    float _893 = _875 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _895 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].x, _883);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _889);
    float _899 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].z, _891);
    float _901 = -_751;
    float _903 = _533 + _901;
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _893);
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].z, _895);
    float _909 = _899 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _911 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[10].z, _897);
    float _913 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[11].z, _905);
    float _915 = _907 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _917 = _533 + _909;
    float _919 = _911 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _923 = _517 + _915;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _927 = _917 + _925;
    float _929 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _931 = 1.0 / _921;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _935 = _923 + _933;
    float _937 = _927 * _927;
    float _939 = _919 + _921;
    float _941 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].x, _929);
    float _943 = fma(_935, _935, _937);
    float _945 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _947 = sqrt(_943);
    float _949 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _951 = _939 * _931;
    float _953 = _951 * 0.5;
    float _955 = _521 + _949;
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[30].w, _957);
    float _961 = 1.0 / _959;
    bool _963 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _965 = _877;
    float _967 = _949;
    float _969 = _929;
    float _971 = _943;
    float _973 = _947;
    float _975 = _959;
    float _977 = _751;
    float _979 = _955;
    float _981 = _699;
    if (!_963)
    {
        _965 = _923;
    }
    float _983 = _965;
    float _985 = _983;
    if (!_963)
    {
        _967 = _917;
    }
    float _987 = _967;
    float _989 = _987;
    if (!_963)
    {
        _969 = _955;
    }
    float _991 = _969;
    bool _993 = !_963;
    float _995 = _991;
    if (!_993)
    {
        float _997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _999 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1001 = _947 + _999;
        float _1003 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = rsqrt(_943);
        float _1007 = _1001 * _997;
        float _1009 = _1007 * 0.15915493667125701904296875;
        float _1011 = _1009 * 6.283185482025146484375;
        float _1013 = cos(_1011);
        float _1015 = _1009 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        float _1019 = _1013 + (-1.0);
        float _1021 = fma(_1017, _1003, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1023 = _1019 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1025 = _1005 * _1021;
        float _1027 = fma(_955, _1013, _1023);
        float _1029 = fma(_935, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1031 = fma(_927, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _985 = _1029;
        _995 = _1027;
        _989 = _1031;
        _971 = _1005;
        _973 = _1009;
    }
    float _1033 = _985;
    float _1035 = _995;
    float _1037 = _989;
    float _1039 = _971;
    float _1041 = _973;
    float _1043 = -_735;
    float _1045 = _1043 + _1033;
    float _1047 = -_727;
    float _1049 = _1047 + _1035;
    float _1051 = -_751;
    float _1053 = _1051 + _1037;
    float _1055 = _1049;
    float _1057 = _1045;
    float _1059 = _1039;
    float _1061 = _1041;
    if (_789)
    {
        _975 = 1.0;
    }
    float _1063 = _975;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1067 = _961 * _1065;
    float _1069 = _1063;
    if (_777)
    {
        _977 = _1049;
    }
    float _1071 = _977;
    float _1073 = _1071;
    if (_777)
    {
        _1055 = _1053;
    }
    float _1075 = _1055;
    float _1077 = _1075;
    if (!_777)
    {
        float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1081 = _875 + _1079;
        float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1085 = _887 + _1083;
        float _1087 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = -_517;
        float _1091 = _1089 + _1033;
        float _1093 = _1081 * _1081;
        float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1097 = _903 + _1095;
        float _1099 = -_533;
        float _1101 = _1099 + _1037;
        float _1103 = fma(_1085, _1085, _1093);
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = fma(_1097, _1097, _1103);
        float _1109 = sqrt(_1107);
        float _1111 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1113 = -_521;
        float _1115 = _1113 + _1035;
        float _1117 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1119 = _1117 * _1105;
        float _1121 = _1111 * _1119;
        float _1123 = fma(_1091, _1121, _887);
        float _1125 = fma(_1115, _1121, _875);
        float _1127 = fma(_1101, _1121, _903);
        _1073 = _1125;
        _1057 = _1123;
        _1077 = _1127;
        _1059 = _1105;
    }
    float _1129 = _1073;
    float _1131 = _1057;
    float _1133 = _1077;
    float _1135 = _1059;
    float _1137 = _1135;
    if (!_789)
    {
        float _1139 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1147 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1145;
        float _1149 = _1141 * 6.283185482025146484375;
        float _1151 = cos(_1149);
        float _1153 = _1143 * 0.15915493667125701904296875;
        float _1155 = _1141 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = 1.0 / _1151;
        float _1161 = _1153 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = _1153 * 6.283185482025146484375;
        float _1169 = sin(_1167);
        float _1171 = _1163 * _1165;
        float _1173 = 1.0 / _1147;
        float _1175 = 1.0 / _1171;
        float _1177 = _1169 * _1175;
        float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1181 = fma(_1067, _1177, _1179);
        float _1183 = _1181 * _1173;
        float _1185 = precise::clamp(_1183, 0.0, 1.0);
        _1137 = _1173;
        _1061 = _1141;
        _1069 = _1185;
    }
    float _1187 = _1137;
    float _1189 = _1061;
    float _1191 = _1069;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1129 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1131 + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1203 = _1133 + _1201;
    float _1205 = _1195 * _1195;
    float _1207 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1209 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1211 = fma(_1199, _1199, _1205);
    float _1213 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1207);
    float _1215 = fma(_1203, _1203, _1211);
    float _1217 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1213);
    float _1219 = rsqrt(_1215);
    float _1221 = sqrt(_1215);
    float _1223 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1225 = _1199 * _1223;
    float _1227 = _1203 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 * _1227;
    float _1233 = _1229 + _1231;
    float _1235 = sqrt(_1233);
    bool _1237 = _1235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1241 = _1235 + _1239;
    float _1243 = _1187;
    float _1245 = _1233;
    float _1247 = _1241;
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1251 = _1225;
    float _1253 = _1227;
    float _1255 = _1229;
    float _1257 = _1231;
    if (_1237)
    {
        float _1259 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1259;
    }
    float _1261 = _1243;
    if (_1237)
    {
        float _1263 = rsqrt(_1233);
        _1245 = _1263;
    }
    float _1265 = _1245;
    if (_1237)
    {
        float _1267 = _1241 * _1261;
        _1247 = _1267;
    }
    float _1269 = _1247;
    if (_1237)
    {
        float _1271 = _1269 * 0.15915493667125701904296875;
        _577 = _1271;
    }
    float _1273 = _577;
    float _1275 = _1261;
    if (_1237)
    {
        float _1277 = _1273 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        _1275 = _1279;
    }
    float _1281 = _1275;
    float _1283 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1285 = precise::max(0.0, _1283);
    float _1287 = _1189;
    float _1289 = _1285;
    if (_1237)
    {
        float _1291 = _1273 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        _1287 = _1293;
    }
    float _1295 = _1287;
    float _1297 = -_1223;
    float _1299 = -_1285;
    float _1301 = fma(_1195, _1297, _1299);
    float _1303 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1237)
    {
        float _1305 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1289 = _1305;
    }
    float _1307 = _1289;
    float _1309 = _1281;
    if (_1237)
    {
        float _1311 = fma(_1281, _1307, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _979 = _1311;
    }
    float _1313 = _979;
    if (!_1237)
    {
        _1309 = _1301;
    }
    float _1315 = _1309;
    float _1317 = floor(_1303);
    float _1319 = _1315;
    if (_1237)
    {
        float _1321 = _1295 + (-1.0);
        _1249 = _1321;
    }
    float _1323 = _1249;
    float _1325 = _1323;
    if (_1237)
    {
        float _1327 = _1265 * _1313;
        _981 = _1327;
    }
    float _1329 = _981;
    if (_1237)
    {
        float _1331 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1331;
    }
    float _1333 = _1325;
    if (_1237)
    {
        float _1335 = _1225 * _1329;
        _1251 = _1335;
    }
    float _1337 = _1251;
    if (_1237)
    {
        float _1339 = _1227 * _1329;
        _1253 = _1339;
    }
    float _1341 = _1253;
    if (_1237)
    {
        float _1343 = fma(_1301, _1295, _1333);
        _1319 = _1343;
    }
    float _1345 = _1319;
    if (_1237)
    {
        float _1347 = _1337 * _1337;
        _1255 = _1347;
    }
    float _1349 = _1255;
    if (_1237)
    {
        float _1351 = _1341 * _1341;
        _1257 = _1351;
    }
    float _1353 = _1257;
    float _1355 = fma(_1345, _1345, _1349);
    float _1357 = fma(_903, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1359 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1363 = fma(_1221, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1361);
    float _1365 = precise::clamp(_1363, 0.0, 1.0);
    float _1367 = _1355 + _1353;
    float _1369 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1371 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1359);
    float _1373 = -_1365;
    float _1375 = _1373 + 1.0;
    float _1377 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1369);
    float _1379 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1371);
    float _1381 = rsqrt(_1367);
    float _1383 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1209);
    float _1385 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1377);
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1391 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = abs(_1375);
    float _1399 = log2(_1397);
    float _1401 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1403 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1405 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    float _1407 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1409 = -_1317;
    float _1411 = _1303 + _1409;
    float _1413 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1405);
    float _1417 = _1381 * _1337;
    float _1419 = _1381 * _1345;
    float _1421 = floor(_1357);
    float _1423 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1415);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1427 = _1381 * _1341;
    float _1429 = -_1407;
    float _1431 = fma(_1429, _1403, 1.0);
    float _1433 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1435 = -_1425;
    float _1437 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1435);
    float _1439 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1441 = 1.0 / _1423;
    float _1443 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1445 = -_1427;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1437);
    float _1449 = _1419 + 1.0;
    float _1451 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1443);
    float _1453 = fma(_1447, -0.5, 0.5);
    float _1455 = fma(_1447, 0.5, 0.5);
    float _1457 = exp2(_1439);
    float _1459 = -_1421;
    float _1461 = _1357 + _1459;
    float _1463 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1433);
    float _1465 = fma(_1455, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1467 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1451);
    float _1469 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1463);
    float _1471 = fma(_1455, _1465, -0.212114393711090087890625);
    float _1473 = log2(_1431);
    float _1475 = fma(_1455, _1471, 1.570728778839111328125);
    float _1477 = _1467 * _1441;
    float _1479 = sqrt(_1453);
    float _1481 = -_1419;
    float _1483 = fma(_1457, _1449, _1481);
    float _1485 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1487 = fma(_1483, 0.5, 0.5);
    float _1489 = _1485 * _1441;
    float _1491 = _1473 * 0.693147182464599609375;
    float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1495 = fma(_1477, 0.5, 0.5);
    float _1497 = _1479 * 0.636619746685028076171875;
    float _1499 = fma(_1489, -0.5, 0.5);
    float _1501 = -_1475;
    float _1503 = fma(_1497, _1501, 1.0);
    float2 _4880 = float2(_1411, _1461);
    float _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4880, float2(0.0), isnan(_4880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4880, float2(0.0), isnan(_4880)), level(0.0)).x;
    float3 _4891 = float3(_1495, _1499, _1493);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4891, float3(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4891, float3(0.0), isnan(_4891)), level(0.0)).x;
    float3 _4902 = float3(_1495, _1499, _1493);
    float4 _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4902, float3(0.0), isnan(_4902)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4902, float3(0.0), isnan(_4902)), level(0.0)).xyzw;
    float _1512 = _1510.x;
    float _1514 = _1510.y;
    float _1516 = _1510.z;
    float _1518 = _1510.w;
    float2 _4918 = float2(_1503, _1487);
    float3 _1522 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4918, float2(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4918, float2(0.0), isnan(_4918)), level(0.0)).xyz;
    float _1524 = _1522.x;
    float _1526 = _1522.y;
    float _1528 = _1522.z;
    float _1530 = float(uint(_387));
    float _1532 = trunc(_467);
    int _1534 = int(_1532);
    float _1536 = _499 * _167;
    int _1538 = abs(_537);
    float _1540 = -_509;
    float _1542 = _1540 + 1.0;
    int _1544 = ~_387;
    int _1546 = _1544 + 1;
    out.m_72.x = _887;
    out.m_72.y = _875;
    out.m_72.z = _903;
    int _1548 = abs(_555);
    float _1550 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1552 = 1.0 / _1530;
    bool _1554 = _157 > 0.5;
    out.m_74.w = _709;
    bool _1556 = _373 > 0.5;
    out.m_76.x = _809;
    bool _1558 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1560 = isnan(_317);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = trunc(_1536);
    int _1572 = int(_1570);
    float _1574 = float(uint(_1534));
    float _1576 = _849 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1580 = _1578 != 0;
    out.m_78.x = _1131;
    out.m_78.y = _1129;
    out.m_78.z = _1133;
    int _1582 = ~_387;
    int _1584 = _1582 + 1;
    float _1586 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    int _1588 = as_type<int>(_1552) + (-2);
    float _1590 = exp2(_1550);
    float _1592 = as_type<float>(_1588) * _1574;
    float _1594 = trunc(_1592);
    float _1596 = precise::max(_1594, 0.0);
    uint _1599 = uint(_1596);
    float _1601 = -_1590;
    float _1603 = _1601 + 1.0;
    int _1605 = _1546 * int(_1599);
    int _1607 = _1605 + _1534;
    float _1609 = float(uint(_1607));
    bool _1611 = !_1580;
    float _1613 = _1611 ? 7.345489978790283203125 : 1.0;
    float _1615 = as_type<float>(_1588) * _1609;
    float _1617 = _1613 * _157;
    float _1619 = trunc(_1615);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    float _1625 = floor(_1617);
    int _1627 = int(_1599) + int(_1623);
    float _1629 = float(_1534);
    int _1631 = _1584 * _1627;
    int _1633 = _1631 + _1534;
    bool _1635 = _1629 >= _475;
    bool _1637 = isnan(_1629);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan(_475);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = -_1625;
    float _1649 = _1617 + _1647;
    bool _1651 = uint(_1633) >= uint(_387);
    float _1653 = trunc(_1645);
    int _1655 = int(_1653);
    float _1657 = _1649 * _475;
    float _1659 = trunc(_1657);
    int _1661 = int(_1659);
    bool _1663 = !_1651;
    int _1665 = _1663 ? 0 : (-1);
    bool _1667 = _387 == 0;
    int _1669 = ~_1627;
    int _1671 = _1669 + _1665;
    int _1673 = _1671 + 1;
    int _1675 = ~_1655;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _387 * _1673;
    int _1683 = _1681 + _1534;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1687 = _1685 != 0;
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1691 = _1689 != 0;
    bool _1693 = !_1667;
    int _1695 = _1693 ? _1683 : (-1);
    int _1697 = _387 + (-1);
    bool _1699 = !_1687;
    int _1701 = _1699 ? 0 : 1;
    int _1703 = _1695 * _1679;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1707 = _1705 != 0;
    int _1709 = abs(_1701);
    int _1711 = _1655 * _1697;
    int _1713 = _1711 + _1703;
    int _1715 = abs(_541);
    int _1717 = _1661 * _1709;
    int _1719 = _1717 + _1534;
    bool _1721 = !_1707;
    int _1723 = _1721 ? 0 : 1;
    int _1725 = _1713 * _1538;
    int _1727 = abs(_1723);
    int _1729 = _1572 * _1715;
    int _1731 = _1729 + _1725;
    int _1733 = ~_387;
    int _1735 = _1733 + 1;
    int _1737 = _1719 * _1548;
    int _1739 = _1737 + _1731;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1743 = _1741 != 0;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1747 = _317 + _1745;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1751 = _1749 != 0;
    int _1753 = _1661 * _1727;
    int _1755 = _1753 + _1739;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1765 = float(uint(_1719));
    float _1767 = float(uint(_1755));
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1771 = _1769 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1773 = as_type<float>(_1588) * _1765;
    float _1775 = -_197;
    int _1777 = _1556 ? as_type<int>(_1775) : as_type<int>(_197);
    float _1779 = as_type<float>(_1588) * _1767;
    float _1781 = 1.0 / _1771;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1787 = trunc(_1779);
    float _1789 = precise::max(_1787, 0.0);
    uint _1791 = uint(_1789);
    float _1793 = 1.0 / _1785;
    float _1795 = _1759 * _1781;
    bool _1797 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1799 = isnan(_317);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    bool _1809 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1811 = isnan(_317);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1817 = _1813 || _1815;
    float _1819 = float(_1817);
    float _1821 = fma(_1795, _1747, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1825 = _317 + _1823;
    float _1827 = -_1807;
    float _1829 = _1827 + 1.0;
    int _1831 = _1735 * int(_1791);
    int _1833 = _1831 + _1755;
    float _1835 = _1568 * _1829;
    float _1837 = float(uint(_1833));
    float _1839 = _1821 * _1835;
    float _1841 = _1763 * _1793;
    int _1843 = ~_387;
    int _1845 = _1843 + 1;
    float _1847 = as_type<float>(_1588) * _1837;
    float _1849 = -_1819;
    float _1851 = _1849 + 1.0;
    float _1853 = fma(_1841, _1825, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1855 = ~_387;
    int _1857 = _1855 + 1;
    float _1859 = _1807 * _1851;
    float _1861 = trunc(_1847);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    float _1867 = trunc(_1773);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = int(_1791) + int(_1865);
    float _1875 = -_1568;
    float _1877 = _1875 + 1.0;
    float _1879 = -_193;
    int _1881 = _1554 ? as_type<int>(_1879) : as_type<int>(_193);
    float _1883 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1839);
    bool _1885 = !_1691;
    float _1887 = _1885 ? _193 : as_type<float>(_1881);
    int _1889 = _1845 * _1873;
    int _1891 = _1889 + _1755;
    bool _1893 = !_1751;
    float _1895 = _1893 ? _197 : as_type<float>(_1777);
    float _1897 = fma(_1853, _1859, _1883);
    int _1899 = _1857 * int(_1871);
    int _1901 = _1899 + _1719;
    float _1903 = _1887 + 0.5;
    bool _1905 = uint(_1891) >= uint(_387);
    float _1907 = _1895 + (-0.5);
    float _1909 = fma(_1903, (*spvDescriptorSet0.vp_c9)._m0[80].x, _503);
    float _1911 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1897);
    bool _1913 = !_1905;
    int _1915 = _1913 ? 0 : (-1);
    float _1917 = -_1907;
    float _1919 = -_507;
    float _1921 = fma(_1917, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1919);
    float _1923 = -_505;
    float _1925 = _1923 + 1.0;
    float _1927 = float(uint(_1901));
    float _1929 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1931 = ~_1873;
    int _1933 = _1931 + _1915;
    int _1935 = _1933 + 1;
    float _1937 = -_1925;
    float _1939 = fma(_1887, _1937, _1909);
    float _1941 = as_type<float>(_1588) * _1927;
    float _1943 = fma(_1895, _1542, _1921);
    int _1945 = _387 * _1935;
    int _1947 = _1945 + _1755;
    float _1949 = _1911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    bool _1959 = !_1667;
    int _1961 = _1959 ? _1947 : (-1);
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1967 = _1961 >> 31;
    float _1969 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1973 = _1967 & 3;
    float _1975 = _1963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1979 = _1961 + _1973;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1983 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1987 = _1979 >> 2;
    out.m_80.x = _1969;
    out.m_80.y = _1975;
    out.m_80.z = _1977;
    out.m_80.w = _1971;
    float _1989 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1993 = _1987 << 4;
    int _1995 = _1993 + 368;
    out.m_82.x = _1939;
    out.m_82.y = _1943;
    int _1997 = ~_387;
    int _1999 = _1997 + 1;
    float _2001 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2003 = int(_1871) + int(_1957);
    uint _2005 = uint(int(uint(_1995) >> uint(2)));
    uint _2007 = uint(int(uint(int(_2005)) >> uint(2)));
    int _2009 = int(_2005) & 3;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[int(_2007)][_2009];
    int _2013 = int(_2005) + 1;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    int _2017 = _2013 & 3;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[int(_2015)][_2017];
    out.m_84.x = _1989;
    out.m_84.y = _1983;
    out.m_84.z = _1991;
    out.m_84.w = _1949;
    int _2021 = _1961 & 3;
    bool _2023 = _2021 != 0;
    float _2025 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2027 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2029 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_86.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2031 = -_827;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2025);
    float _2035 = -_827;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2027);
    float _2039 = -_827;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2029);
    float _2043 = _849 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2045 = _849 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2047 = _1999 * _2003;
    int _2049 = _2047 + _1719;
    float _2051 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2033);
    float _2053 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2037);
    float _2055 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2041);
    float _2057 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1586);
    bool _2059 = uint(_2049) >= uint(_387);
    float _2061 = _2001 * _2051;
    float _2063 = _2001 * _2053;
    float _2065 = _2001 * _2055;
    int _2067 = _1961 & 3;
    bool _2069 = _2067 != 0;
    int _2071 = _1995 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    float _2089 = abs(_1067);
    float _2091 = log2(_2089);
    float _2093 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2095 = uint(_2067) > 1u;
    float _2097 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2043);
    int _2099 = _2023 ? 0 : 1;
    float _2101 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2045);
    bool _2103 = uint(_2067) >= 2u;
    float _2105 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2097);
    int _2107 = ~_2099;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    float _2113 = _857 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2115 = _857 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2117 = _857 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2119 = fma(_853, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2101);
    float _2121 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2113);
    float _2123 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2115);
    int _2125 = _2111;
    float _2127 = _1467;
    if (!_2095)
    {
        int _2129 = ~_2099;
        int _2131 = _2129 + 1;
        _2125 = _2131;
    }
    int _2133 = _2125;
    float _2135 = fma(_2093, _2057, _2061);
    bool _2137 = _2067 != 3;
    float _2139 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2141 = abs(_2133);
    float _2143 = fma(_2093, _2105, _2063);
    bool _2145 = !_2069;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2117);
    int _2151 = _2103 ? 0 : 1;
    float _2153 = exp2(_2139);
    float _2155 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    int _2157 = abs(_2147);
    float _2159 = fma(_2093, _2119, _2065);
    int _2161 = ~_2151;
    int _2163 = _2161 + 1;
    int _2165 = _2163 + 1;
    float _2167 = _1423 * 0.5;
    bool _2169 = _2067 != 3;
    float _2171 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2149);
    int _2173 = _2165;
    if (_2137)
    {
        int _2175 = ~_2151;
        int _2177 = _2175 + 1;
        _2173 = _2177;
    }
    int _2179 = _2173;
    float _2181 = -_1505;
    float _2183 = _2181 + 1.0;
    int _2185 = ~_2141;
    int _2187 = _2185 + 1;
    int _2189 = _2187 + 1;
    float _2191 = _2171 + _2159;
    float _2193 = _2155 + _2135;
    bool _2195 = !_2169;
    int _2197 = _2195 ? 0 : (-1);
    int _2199 = _2189 * as_type<int>(_2019);
    int _2201 = abs(_2179);
    float _2203 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2205 = ~_2157;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    float _2211 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    bool _2213 = !_1743;
    int _2215 = _2213 ? 0 : 1;
    float _2217 = _2203 * _1507;
    int _2219 = abs(_2197);
    int _2221 = _2209 * as_type<int>(_2011);
    int _2223 = _2221 + _2199;
    float _2225 = _2211 + _2143;
    bool _2227 = !_2059;
    int _2229 = _2227 ? 0 : (-1);
    int _2231 = abs(_2215);
    bool _2233 = _1067 <= 8000.0;
    bool _2235 = isnan(_1067);
    bool _2237 = _2233 || _2235;
    bool _2239 = isnan(8000.0);
    bool _2241 = _2237 || _2239;
    float _2243 = float(_2241);
    float _2245 = fma(_2153, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2247 = precise::clamp(_2245, 0.0, 1.0);
    float _2249 = _1528 * _2217;
    int _2251 = ~_2201;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    float _2257 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2259 = ~_2003;
    int _2261 = _2259 + _2229;
    int _2263 = _2261 + 1;
    float _2265 = fma(_1518, _2249, _1516);
    int _2267 = _2255 * as_type<int>(_2079);
    int _2269 = _2267 + _2223;
    int _2271 = _387 * _2263;
    int _2273 = _2271 + _1719;
    int _2275 = ~_2219;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    float _2281 = fma(_2247, -2.0, 3.0);
    int _2283 = ~_2231;
    int _2285 = _2283 + 1;
    int _2287 = _2285 + 1;
    float _2289 = _2247 * _2247;
    bool _2291 = !_1667;
    int _2293 = _2291 ? _2273 : (-1);
    int _2295 = _2279 * as_type<int>(_2087);
    int _2297 = _2295 + _2269;
    float _2299 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2257);
    float _2301 = _2289 * _2281;
    int _2303 = _2297 * _2287;
    float _2305 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2299);
    float _2307 = -_2301;
    float _2309 = _2307 + 1.0;
    float _2311 = _1467 + _1423;
    int _2313 = _2293 * _2231;
    int _2315 = _2313 + _2303;
    float _2317 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    float _2319 = in.m_88.x;
    float _2321 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2301);
    float _2323 = fma(_1485, -0.5, _2167);
    float _2325 = _2317 + _1423;
    float _2327 = _2311 * 0.5;
    float _2329 = _2243 * _2321;
    float _2331 = float(_2315);
    float _2333 = _2325 * 0.5;
    out.m_90.x = _2193;
    out.m_90.y = _2225;
    out.m_90.z = _2191;
    float _2335 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2337 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2339 = isnan(_1221);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2345 = _2341 || _2343;
    out.m_92.x = _2327;
    out.m_92.y = _2323;
    out.m_92.z = _2333;
    out.m_92.w = _1423;
    float _2347 = _2183 * _2335;
    float _2349 = precise::clamp(_2347, 0.0, 1.0);
    out.m_94.x = _2331;
    float _2351 = -_2349;
    float _2353 = fma(_2351, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1467;
    out.gl_Position.y = _1485;
    out.gl_Position.z = _2317;
    out.gl_Position.w = _1423;
    float _2355 = _2353 * _2319;
    float _2357 = _1518 * _2217;
    float _2359 = -_2203;
    float _2361 = _2359 + 1.0;
    float _2363 = _2355 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2365 = _2203;
    float _2367 = _1423;
    float _2369 = _2333;
    float _2371 = _2357;
    float _2373 = _2361;
    if (!_2345)
    {
        _2365 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2375 = _2365;
    float _2377 = fma(_1524, _2357, _1512);
    float _2379 = fma(_1526, _2357, _1514);
    float _2381 = _1518 * _2361;
    out.m_96.x = _2363;
    float _2383 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2385 = _2375;
    float _2387 = _2375;
    if (!_2345)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2389 = _2127;
    out.m_98.x = _2377;
    out.m_98.y = _2379;
    out.m_98.z = _2265;
    out.m_98.w = _2381;
    float _2391 = _2389;
    float _2393 = _2389;
    if (!_2345)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2395 = _2367;
    float _2397 = _2395;
    float _2399 = _2395;
    if (!_2345)
    {
        _2369 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2401 = _2369;
    float _2403 = _2401;
    float _2405 = _2401;
    if (!_2345)
    {
        _2371 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2407 = _2371;
    float _2409 = _2407;
    float _2411 = _2407;
    if (!_2345)
    {
        _2373 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2413 = _2373;
    bool _2415 = !_2345;
    float _2417 = _2413;
    float _2419 = _2413;
    if (!_2415)
    {
        bool _2421 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2423 = isnan(_1221);
        bool _2425 = _2421 || _2423;
        bool _2427 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2429 = _2425 || _2427;
        if (!_2429)
        {
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2433 = _1221 + _2431;
            float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2437 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2435;
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2443 = 1.0 / _2437;
            float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2459 = _2457 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2461 = _2433 * _2443;
            float _2463 = precise::clamp(_2461, 0.0, 1.0);
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2469 = fma(_2463, _2441, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2471 = fma(_2463, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2473 = fma(_2463, _2447, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2475 = fma(_2463, _2451, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2477 = fma(_2463, _2455, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2479 = fma(_2463, _2459, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2393 = _2473;
            _2411 = _2477;
            _2387 = _2469;
            _2405 = _2475;
            _2399 = _2471;
            _2419 = _2479;
            _2481 = true;
        }
        else
        {
            bool _2483 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2485 = isnan(_1221);
            bool _2487 = _2483 || _2485;
            bool _2489 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2491 = _2487 || _2489;
            if (!_2491)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2493 = _2385;
            _2387 = _2493;
            if (!_2491)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2495 = _2391;
            _2393 = _2495;
            if (!_2491)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2497 = _2397;
            _2399 = _2497;
            if (!_2491)
            {
                _2403 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2499 = _2403;
            _2405 = _2499;
            if (!_2491)
            {
                _2409 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2501 = _2409;
            _2411 = _2501;
            if (!_2491)
            {
                _2417 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2503 = _2417;
            bool _2505 = !_2491;
            _2419 = _2503;
            if (!_2505)
            {
                bool _2507 = _1221 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2509 = isnan(_1221);
                bool _2511 = _2507 || _2509;
                bool _2513 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2515 = _2511 || _2513;
                if (!_2515)
                {
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2519 = _1221 + _2517;
                    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2523 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2521;
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2529 = 1.0 / _2523;
                    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2539 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2541 = _2539 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2547 = _2519 * _2529;
                    float _2549 = precise::clamp(_2547, 0.0, 1.0);
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2555 = fma(_2549, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2557 = fma(_2549, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2559 = fma(_2549, _2533, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2561 = fma(_2549, _2537, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2563 = fma(_2549, _2541, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2565 = fma(_2549, _2545, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2393 = _2559;
                    _2411 = _2563;
                    _2387 = _2555;
                    _2405 = _2561;
                    _2399 = _2557;
                    _2419 = _2565;
                    _2481 = true;
                }
                else
                {
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2411 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2405 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2419 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2481 = false;
    float _2567 = _2393;
    float _2569 = _2411;
    float _2571 = _2387;
    float _2573 = _2405;
    float _2575 = _2399;
    float _2577 = _2419;
    float _2579 = fma(_2225, -0.5, 0.5);
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = -_2567;
    float _2585 = _2583 + _2569;
    float _2587 = _2383 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2589 = -_2571;
    float _2591 = _2589 + _2573;
    float _2593 = fma(_2581, _2585, _2567);
    out.m_100.x = 0.0;
    float _2595 = -_2575;
    float _2597 = _2595 + _2577;
    float _2599 = fma(_2581, _2591, _2571);
    float _2601 = _2593 * 0.586610972881317138671875;
    out.m_53.x = _2587;
    bool _2603 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2605 = fma(_2581, _2597, _2575);
    float _2607 = fma(_2599, 0.298911988735198974609375, _2601);
    bool _2609 = _1191 > 0.0;
    bool _2611 = isnan(_1191);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan(0.0);
    bool _2617 = _2613 || _2615;
    float _2619 = fma(_2605, 0.114477999508380889892578125, _2607);
    float _2621 = -_2619;
    float _2623 = _2599 + _2621;
    float _2625 = -_2619;
    float _2627 = _2593 + _2625;
    float _2629 = -_2619;
    float _2631 = _2605 + _2629;
    float _2633 = fma(_2623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    float _2635 = fma(_2627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    float _2637 = fma(_2631, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2619);
    bool _2639 = !_2603;
    if (!_2639)
    {
        float _2641 = -_1129;
        float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2645 = -_1131;
        float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2649 = -_1133;
        float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2653 = _2643 * _2643;
        float _2655 = fma(_2647, _2647, _2653);
        float _2657 = fma(_2651, _2651, _2655);
        float _2659 = sqrt(_2657);
        float _2661 = rsqrt(_2657);
        float _2663 = -_2659;
        float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2667 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2669 = precise::clamp(_2667, 0.0, 1.0);
        float _2671 = _2647 * _2661;
        float _2673 = _2643 * _2661;
        float _2675 = abs(_2669);
        float _2677 = log2(_2675);
        float _2679 = _2651 * _2661;
        float _2681 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2683 = _2225 * _2673;
        float _2685 = -_2673;
        float _2687 = -_2681;
        float _2689 = fma(_2685, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2687);
        float _2691 = fma(_2193, _2671, _2683);
        float _2693 = -_2679;
        float _2695 = fma(_2693, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2689);
        float _2697 = fma(_2191, _2679, _2691);
        float _2699 = precise::clamp(_2697, 0.0, 1.0);
        float _2701 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2703 = _2695 + _2701;
        float _2705 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2707 = _2703 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2709 = precise::clamp(_2707, 0.0, 1.0);
        float _2711 = exp2(_2705);
        float _2713 = _2711 * _2709;
        float _2715 = _2699 * _2713;
        float _2717 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2719 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2721 = _2715 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _2717;
        out.m_100.y = _2719;
        out.m_100.z = _2721;
    }
    out.m_74.x = _2633;
    out.m_74.y = _2635;
    out.m_74.z = _2637;
    if (_2617)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2723;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

