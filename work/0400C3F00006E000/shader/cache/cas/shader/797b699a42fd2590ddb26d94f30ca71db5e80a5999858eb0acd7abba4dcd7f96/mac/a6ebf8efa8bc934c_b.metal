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
    float4 m_64 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_70 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_88 [[user(locn16)]];
    float4 m_94 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3403 = false;
    bool _435 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_117);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_133);
        out.gl_Position.z = _3708;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _141;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _165 = _141 * _159;
    int _167 = 0;
    float _169 = _165;
    if (_157)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3780 = as_type<float>(_173);
        out.gl_Position.z = _3780;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _215 = !_189;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_60.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _165;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = 1.0 / _249;
    bool _261 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_241);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _253;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _257;
    float _283 = _245 * _259;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _241 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _241 + _289;
    float _293 = fma(_279, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = _287 * _275;
    bool _297 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_241);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    float _317 = fma(_311, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = _291 * _281;
    float _321 = -_271;
    float _323 = _321 + 1.0;
    bool _325 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_241);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _307 * _323;
    bool _339 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_241);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _335 * _315;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = -_335;
    float _363 = _361 + 1.0;
    float _365 = fma(_355, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = _349 * _363;
    float _371 = in.m_62.x;
    float _373 = in.m_62.y;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    float _379 = _293 * _369;
    float _381 = _317 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_365, _351, _391);
    float _401 = fma(_367, _351, _393);
    float _403 = fma(_395, _337, _399);
    float _405 = fma(_397, _337, _401);
    float _407 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    float _411 = _407 * _371;
    float _413 = _409 * _373;
    bool _415 = !_273;
    float _433;
    if (!_415)
    {
        float _417 = in.m_60.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _165;
    }
    _435 = false;
    float _437 = _433;
    bool _439 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_437);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_437);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = 1.0 / _453;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    float _479 = _465 * _477;
    float _481 = -_465;
    float _483 = _481 + 1.0;
    float _485 = _469 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _437 + _487;
    float _491 = fma(_485, _489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _495 = _491 * _479;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _495);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[116].x, _497);
    float _505 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _505;
    out.m_64.y = _507;
    out.m_64.z = _509;
    out.m_64.w = _511;
    bool _513 = !_471;
    if (!_513)
    {
        float _515 = in.m_60.x;
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _519 = _515 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _169 = _529;
    }
    float _531 = _169;
    float _533 = in.m_60.x;
    float _535 = in.m_60.y;
    float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _539 = log2(_537);
    float _541 = in.m_60.z;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _545 = _543 != 0;
    float _547 = _159 * _141;
    float _549 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _551 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = _533 * 2.0;
    float _557 = _535 * 2.0;
    bool _559 = _535 > 0.5;
    float _561 = _533 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _563 = _541 * 2.0;
    float _565 = floor(_557);
    int _567 = int(_471);
    int _569 = _189 ? 2 : 0;
    int _571 = _567 | _569;
    int _573 = _191 ? 4 : 0;
    int _575 = _571 | _573;
    int _577 = _545 ? 8 : 0;
    int _579 = _575 | _577;
    int _581 = false ? 16 : 0;
    int _583 = _579 | _581;
    int _585 = false ? 32 : 0;
    int _587 = _583 | _585;
    int _589 = _559 ? 64 : 0;
    int _591 = _587 | _589;
    int _593 = _591 & 64;
    float _595 = -_553;
    float _597 = fma(_561, 2.0, _595);
    float _599 = _535 + _533;
    float _601 = _535 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _603 = -_141;
    float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _597);
    float _607 = _599 + (-1.0);
    float _609 = floor(_555);
    float _611 = -_201;
    int _613 = _559 ? as_type<int>(_611) : as_type<int>(_201);
    float _615 = floor(_563);
    bool _617 = _609 > 0.0;
    bool _619 = _609 >= 0.0;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    int _629 = int(_617);
    int _631 = _189 ? 2 : 0;
    int _633 = _629 | _631;
    int _635 = _627 ? 4 : 0;
    int _637 = _633 | _635;
    int _639 = _545 ? 8 : 0;
    int _641 = _637 | _639;
    int _643 = false ? 16 : 0;
    int _645 = _641 | _643;
    int _647 = false ? 32 : 0;
    int _649 = _645 | _647;
    int _651 = _559 ? 64 : 0;
    int _653 = _649 | _651;
    int _655 = _653 & 8;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _663 = _661 != 0;
    bool _665 = _541 > 0.5;
    int _667 = _655;
    if (_545)
    {
        _667 = 0;
    }
    int _669 = _667;
    float _671 = -_217;
    int _673 = _665 ? as_type<int>(_671) : as_type<int>(_217);
    bool _675 = !_659;
    float _677 = _675 ? _201 : as_type<float>(_613);
    bool _679 = !_663;
    float _681 = _679 ? _217 : as_type<float>(_673);
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _693 = _691 != 0;
    int _695 = _669;
    if (!_545)
    {
        _695 = 2;
    }
    int _697 = _695;
    bool _699 = _565 >= 0.0;
    bool _701 = isnan(_565);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    int _709 = _627 ? 0 : 1;
    int _711 = _707 ? 0 : 1;
    bool _713 = _697 != 2;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _717 = int(_715);
    int _719 = ~_709;
    int _721 = _719 + 1;
    int _723 = _721 + 1;
    int _725 = _723;
    if (!_617)
    {
        int _727 = ~_709;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    bool _733 = _615 > 0.0;
    bool _735 = _615 >= 0.0;
    bool _737 = isnan(_615);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _747 = int(_745);
    bool _749 = !_689;
    int _751 = _749 ? 0 : 1;
    bool _753 = !_685;
    int _755 = _753 ? 0 : 1;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _759 = !_693;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_601, -2.0, _757);
    int _765 = _743 ? 0 : 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _777 = _775 != 0;
    float _779 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _781 = _565 > 0.0;
    float _783 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _763);
    float _785 = float(_717);
    int _787 = ~_765;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    float _793 = _757;
    float _795 = as_type<float>(_717);
    int _797 = _791;
    if (_713)
    {
        _793 = _533;
    }
    float _799 = _793;
    float _801 = 1.0 / _785;
    float _803 = _799;
    if (_713)
    {
        _795 = _535;
    }
    float _805 = _795;
    bool _807 = !_769;
    int _809 = _807 ? 0 : 1;
    float _811 = _805;
    if (!_733)
    {
        int _813 = ~_765;
        int _815 = _813 + 1;
        _797 = _815;
    }
    int _817 = _797;
    if (!_713)
    {
        _803 = _541;
    }
    float _819 = _803;
    if (!_713)
    {
        _811 = _533;
    }
    float _821 = _811;
    float _823 = _819 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _827 = abs(_809);
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _831 = ~_711;
    int _833 = _831 + 1;
    int _835 = _833 + 1;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _839 = _835;
    if (!_781)
    {
        int _841 = ~_711;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = _539 * _141;
    float _849 = float(_817);
    float _851 = -_829;
    float _853 = fma(_823, 2.0, _851);
    float _855 = fma(_825, -2.0, _837);
    float _857 = float(_827);
    float _859 = in.m_66.x;
    float _861 = in.m_66.y;
    float _863 = in.m_66.z;
    float _865 = exp2(_847);
    float _867 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _855);
    float _869 = _857 * _849;
    bool _871 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _873 = isnan(1.0);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _879 = _875 || _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _883 = 1.0 + _881;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _887 = float(_747);
    float _889 = _801 * _141;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _893 = 1.0 / _887;
    float _895 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[78].z, _885);
    float _897 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[78].w, _891);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _901 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _895);
    float _903 = -_865;
    float _905 = _903 + 1.0;
    bool _907 = !_773;
    int _909 = _907 ? 0 : 1;
    float _911 = 1.0 / _883;
    bool _913 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _921 = _917 || _919;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _925 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _897);
    float _927 = _869 * (-2.0);
    int _929 = abs(_909);
    float _931 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[88].z, _899);
    float _933 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[88].w, _923);
    float _935 = _921 ? _905 : 0.0;
    float _937 = _533 + (-0.5);
    float _939 = float(_731);
    float _941 = fma(_927, _859, _859);
    bool _943 = !_777;
    int _945 = _943 ? 0 : 1;
    float _947 = _893 * _141;
    float _949 = float(_929);
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _931);
    float _953 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _933);
    float _955 = -_141;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[86].x, _853);
    float _959 = _869;
    if (_879)
    {
        float _961 = _935 * _911;
        _161 = _961;
    }
    float _963 = _161;
    float _965 = fma(_779, _927, _779);
    float _967 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _941);
    int _969 = abs(_945);
    float _971 = _949 * _939;
    float _973 = _535 + _541;
    float _975 = fma(_965, _963, _967);
    float _977 = float(_845);
    float _979 = _971 * (-2.0);
    float _981 = float(_969);
    float _983 = _973 + (-1.0);
    float _985 = fma(_979, _861, _861);
    float _987 = _975 * 0.15915493667125701904296875;
    float _989 = _981 * _977;
    float _991 = _535 + (-0.5);
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _995 = _541 + _533;
    float _997 = _989 * (-2.0);
    float _999 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _985);
    float _1001 = _995 + (-1.0);
    float _1003 = fma(_997, _863, _863);
    float _1005 = _541 + (-0.5);
    float _1007 = fma(_993, _979, _993);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1011 = _987 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1003);
    float _1017 = fma(_1007, _963, _999);
    float _1019 = fma(_1009, _997, _1009);
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1023 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1025 = _1017 * 0.15915493667125701904296875;
    float _1027 = fma(_1019, _963, _1015);
    float _1029 = _987 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _549 * _1021;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1037 = _1035 != 0;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1045 = _1043 != 0;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1049 = _1047 != 0;
    float _1051 = _1027 * 0.15915493667125701904296875;
    float _1053 = in.m_46.x;
    float _1055 = in.m_46.y;
    float _1057 = in.m_46.z;
    bool _1059 = !_1041;
    int _1061 = _1059 ? 0 : 1;
    float _1063 = _1025 * 6.283185482025146484375;
    float _1065 = sin(_1063);
    bool _1067 = !_1037;
    int _1069 = _1067 ? 0 : 1;
    bool _1071 = !_1045;
    int _1073 = _1071 ? 0 : 1;
    bool _1075 = !_1049;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _1025 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    float _1083 = _1051 * 6.283185482025146484375;
    float _1085 = cos(_1083);
    float _1087 = _1013 * _1065;
    float _1089 = _1031 * _1065;
    float _1091 = _1051 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = _1013 * _1081;
    float _1097 = _1031 * _1081;
    float _1099 = _1013 * _1085;
    float _1101 = _1031 * _1085;
    float _1103 = _1081 * _1085;
    float _1105 = _1065 * _1085;
    float _1107 = _551 * _1023;
    float _1109 = _1099 * _1033;
    float _1111 = fma(_1093, _1095, _1089);
    float _1113 = -_1087;
    float _1115 = fma(_1093, _1097, _1113);
    float _1117 = -_1033;
    float _1119 = _1093 * _1117;
    float _1121 = -_1097;
    float _1123 = fma(_1093, _1087, _1121);
    float _1125 = _1101 * _1033;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = fma(_1111, _1107, _1109);
    float _1131 = fma(_1093, _1089, _1095);
    float _1133 = fma(_1103, _1107, _1119);
    float _1135 = fma(_1115, _1107, _1125);
    float _1137 = fma(_1123, _1127, _1129);
    float _1139 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1141 = fma(_1105, _1127, _1133);
    float _1143 = fma(_1131, _1127, _1135);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1147 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1139);
    float _1149 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1145);
    float _1155 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1147);
    float _1157 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1149);
    float _1159 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1151);
    float _1161 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1165 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1157);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1159);
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1171 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1175 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1177 = _1163 + _1169;
    float _1179 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1171);
    float _1181 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1183 = _1173 + _1175;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1187 = _1177 + _1185;
    float _1189 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1179);
    float _1191 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1183 + _1193;
    float _1197 = _1187 * _1187;
    float _1199 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1191);
    float _1201 = fma(_1195, _1195, _1197);
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1207 = sqrt(_1201);
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1211 = _1203 + _1205;
    float _1213 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1209);
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    bool _1217 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = _1213;
    float _1221 = _1057;
    float _1223 = _1183;
    if (!_1217)
    {
        _1219 = _1183;
    }
    float _1225 = _1219;
    float _1227 = _1225;
    if (!_1217)
    {
        _1221 = _1177;
    }
    float _1229 = _1221;
    float _1231 = _1229;
    if (!_1217)
    {
        _1223 = _1211;
    }
    float _1233 = _1223;
    bool _1235 = !_1217;
    float _1237 = _1233;
    if (!_1235)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1243 = _1207 + _1241;
        float _1245 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = rsqrt(_1201);
        float _1249 = _1243 * _1239;
        float _1251 = _1249 * 0.15915493667125701904296875;
        float _1253 = _1251 * 6.283185482025146484375;
        float _1255 = cos(_1253);
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        float _1261 = _1255 + (-1.0);
        float _1263 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = fma(_1259, _1245, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1267 = fma(_1211, _1255, _1263);
        float _1269 = _1247 * _1265;
        float _1271 = fma(_1195, _1269, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1273 = fma(_1187, _1269, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1237 = _1267;
        _1227 = _1271;
        _1231 = _1273;
    }
    float _1275 = _1237;
    float _1277 = _1227;
    float _1279 = _1231;
    float _1281 = -_1203;
    float _1283 = _1281 + _1275;
    float _1285 = -_1173;
    float _1287 = _1285 + _1277;
    float _1289 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1291 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1293 = _1283 * _1283;
    float _1295 = -_1163;
    float _1297 = _1295 + _1279;
    float _1299 = 1.0 / _1289;
    float _1301 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1291);
    float _1303 = fma(_1287, _1287, _1293);
    float _1305 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1301);
    float _1307 = fma(_1297, _1297, _1303);
    bool _1309 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1311 = isnan(0.5);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1317 = _1313 || _1315;
    float _1319 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1321 = sqrt(_1307);
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = _1319 + _1289;
    float _1335 = _1333 * _1299;
    float _1337 = _1335 * 0.5;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    float _1343 = 1.0 / _1341;
    bool _1345 = _1321 > 0.0;
    float _1347 = _1321;
    float _1349 = _1275;
    float _1351 = _1279;
    float _1353 = _1341;
    float _1355 = _1289;
    float _1357 = _1299;
    float _1359 = _1283;
    float _1361 = _1277;
    if (!_1345)
    {
        _1347 = _1277;
    }
    float _1363 = _1347;
    bool _1365 = !_1345;
    float _1367 = _1363;
    if (!_1365)
    {
        float _1369 = _211 * _211;
        float _1371 = fma(_209, _209, _1369);
        float _1373 = fma(_213, _213, _1371);
        float _1375 = rsqrt(_1307);
        float _1377 = sqrt(_1373);
        float _1379 = _1287 * _1375;
        float _1381 = _1283 * _1375;
        float _1383 = _1297 * _1375;
        bool _1385 = _1377 > 0.0;
        float _1387 = _1375;
        _1353 = _1377;
        _1357 = _1379;
        if (!_1385)
        {
            _1387 = _1277;
        }
        float _1389 = _1387;
        bool _1391 = !_1385;
        _1367 = _1389;
        if (!_1391)
        {
            float _1393 = rsqrt(_1373);
            float _1395 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1397 = _211 * _1393;
            float _1399 = _209 * _1393;
            float _1401 = _1381 * _1397;
            float _1403 = _213 * _1393;
            float _1405 = fma(_1379, _1399, _1401);
            float _1407 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1409 = fma(_1383, _1403, _1405);
            float _1411 = _1409 * _1407;
            float _1413 = fma(_209, _1411, _1277);
            float _1415 = fma(_211, _1411, _1275);
            float _1417 = fma(_213, _1411, _1279);
            _1349 = _1415;
            _1367 = _1413;
            _1351 = _1417;
            _1353 = _1403;
            _1355 = _1411;
        }
    }
    float _1419 = _1349;
    float _1421 = _1367;
    float _1423 = _1351;
    float _1425 = _1353;
    float _1427 = _1355;
    float _1429 = _1357;
    float _1431 = _1421;
    float _1433 = _1423;
    float _1435 = _1429;
    float _1437 = _1425;
    float _1439 = _1427;
    if (_1331)
    {
        _1359 = 1.0;
    }
    float _1441 = _1359;
    float _1443 = _1441;
    if (_1317)
    {
        _1361 = _1419;
    }
    float _1445 = _1361;
    float _1447 = _1445;
    if (!_1317)
    {
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1451 = _1203 + _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1455 = _1173 + _1453;
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1459 = -_1173;
        float _1461 = _1459 + _1421;
        float _1463 = _1451 * _1451;
        float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1467 = _1163 + _1465;
        float _1469 = fma(_1455, _1455, _1463);
        float _1471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1473 = fma(_1467, _1467, _1469);
        float _1475 = sqrt(_1473);
        float _1477 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1479 = precise::min(_1475, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1481 = _1479 * _1471;
        float _1483 = -_1203;
        float _1485 = _1483 + _1419;
        float _1487 = _1477 * _1481;
        float _1489 = -_1163;
        float _1491 = _1489 + _1423;
        float _1493 = fma(_1485, _1487, _1203);
        float _1495 = fma(_1461, _1487, _1173);
        float _1497 = fma(_1491, _1487, _1163);
        _1447 = _1493;
        _1431 = _1495;
        _1433 = _1497;
    }
    float _1499 = _1447;
    float _1501 = _1431;
    float _1503 = _1433;
    if (_1331)
    {
        _1435 = 1.0;
    }
    float _1505 = _1435;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1509 = _1343 * _1507;
    float _1511 = _1505;
    if (!_1331)
    {
        float _1513 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1515 = _1513 * 0.15915493667125701904296875;
        float _1517 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1519 = _1515 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = _1517 * 0.15915493667125701904296875;
        float _1525 = _1515 * 6.283185482025146484375;
        float _1527 = sin(_1525);
        float _1529 = 1.0 / _1521;
        float _1531 = _1523 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = _1527 * _1529;
        float _1537 = _1523 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1543 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1541;
        float _1545 = _1533 * _1535;
        float _1547 = 1.0 / _1543;
        float _1549 = 1.0 / _1545;
        float _1551 = _1539 * _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1555 = fma(_1509, _1551, _1553);
        float _1557 = _1555 * _1547;
        float _1559 = precise::clamp(_1557, 0.0, 1.0);
        _1437 = _1515;
        _1443 = _1559;
    }
    float _1561 = _1437;
    float _1563 = _1443;
    if (!_1331)
    {
        float _1565 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1571 = _1567 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = _1569 * 0.15915493667125701904296875;
        float _1577 = _1567 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        float _1581 = 1.0 / _1573;
        float _1583 = _1575 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1579 * _1581;
        float _1589 = _1575 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = _1585 * _1587;
        float _1595 = 1.0 / _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1599 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1597;
        float _1601 = 1.0 / _1599;
        float _1603 = _1591 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1607 = fma(_1509, _1603, _1605);
        float _1609 = _1607 * _1601;
        float _1611 = precise::clamp(_1609, 0.0, 1.0);
        float _1613 = -_1611;
        float _1615 = _1613 + 1.0;
        _1439 = _1593;
        _1511 = _1615;
    }
    float _1617 = _1439;
    float _1619 = _1511;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1499 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1501 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1503 + _1629;
    float _1633 = _1623 * _1623;
    float _1635 = fma(_1627, _1627, _1633);
    float _1637 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1631, _1631, _1635);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1627 * _1647;
    float _1651 = _1631 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1631;
    float _1669 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1671 = _1657;
    float _1673 = _1665;
    float _1675 = _1633;
    float _1677 = _1623;
    float _1679 = _1617;
    if (_1661)
    {
        float _1681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1681;
    }
    float _1683 = _1667;
    if (!_1661)
    {
        _1669 = _1653;
    }
    float _1685 = _1669;
    float _1687 = _1685;
    if (_1661)
    {
        float _1689 = rsqrt(_1657);
        _1671 = _1689;
    }
    float _1691 = _1671;
    float _1693 = _1691;
    if (_1661)
    {
        float _1695 = _1665 * _1683;
        _1673 = _1695;
    }
    float _1697 = _1673;
    if (_1661)
    {
        float _1699 = _1697 * 0.15915493667125701904296875;
        _1675 = _1699;
    }
    float _1701 = _1675;
    float _1703 = _1683;
    float _1705 = _1701;
    if (_1661)
    {
        float _1707 = _1701 * 6.283185482025146484375;
        float _1709 = sin(_1707);
        _1703 = _1709;
    }
    float _1711 = _1703;
    float _1713 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1715 = precise::max(0.0, _1713);
    float _1717 = _1561;
    float _1719 = _1715;
    if (_1661)
    {
        float _1721 = _1701 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = -_1647;
    float _1729 = -_1715;
    float _1731 = fma(_1623, _1727, _1729);
    if (_1661)
    {
        float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1733;
    }
    float _1735 = _1719;
    if (!_1661)
    {
        _1705 = _1731;
    }
    float _1737 = _1705;
    float _1739 = _1711;
    float _1741 = _1737;
    if (_1661)
    {
        float _1743 = fma(_1711, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1739 = _1743;
    }
    float _1745 = _1739;
    float _1747 = floor(_1637);
    float _1749 = _1745;
    if (_1661)
    {
        float _1751 = _1725 + (-1.0);
        _1677 = _1751;
    }
    float _1753 = _1677;
    float _1755 = _1753;
    if (_1661)
    {
        float _1757 = _1691 * _1745;
        _959 = _1757;
    }
    float _1759 = _959;
    if (!_1661)
    {
        _1749 = _1649;
    }
    float _1761 = _1749;
    float _1763 = _1761;
    if (_1661)
    {
        float _1765 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1679 = _1765;
    }
    float _1767 = _1679;
    if (_1661)
    {
        float _1769 = _1649 * _1759;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (!_1661)
    {
        _1693 = _1651;
    }
    float _1773 = _1693;
    float _1775 = _1773;
    if (_1661)
    {
        float _1777 = _1651 * _1759;
        _1775 = _1777;
    }
    float _1779 = _1775;
    if (_1661)
    {
        float _1781 = fma(_1731, _1725, _1767);
        _1741 = _1781;
    }
    float _1783 = _1741;
    if (_1661)
    {
        float _1785 = _1771 * _1771;
        _1687 = _1785;
    }
    float _1787 = _1687;
    if (!_1661)
    {
        _1755 = _1655;
    }
    float _1789 = _1755;
    float _1791 = _1789;
    if (_1661)
    {
        float _1793 = _1779 * _1779;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1783, _1783, _1787);
    float _1799 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1801 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1803 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1805 = fma(_1163, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1807 = _1797 + _1795;
    float _1809 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1811 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1813 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1801);
    float _1815 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1809);
    float _1817 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1811);
    float _1819 = rsqrt(_1807);
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1823 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1821);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1815);
    float _1829 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1803);
    float _1833 = -_1825;
    float _1835 = _1833 + 1.0;
    float _1837 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1813);
    float _1839 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1843 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1831);
    float _1845 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1847 = abs(_1835);
    float _1849 = log2(_1847);
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1841);
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1855 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1857 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1859 = _1819 * _1771;
    float _1861 = _1819 * _1783;
    float _1863 = floor(_1805);
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1857);
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1869 = _1819 * _1779;
    float _1871 = -_1855;
    float _1873 = fma(_1871, _1639, 1.0);
    float _1875 = -_1747;
    float _1877 = _1637 + _1875;
    float _1879 = -_1867;
    float _1881 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1879);
    float _1883 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1885 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1887 = 1.0 / _1865;
    float _1889 = -_1869;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1881);
    float _1893 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1895 = fma(_1891, -0.5, 0.5);
    float _1897 = fma(_1891, 0.5, 0.5);
    float _1899 = -_1863;
    float _1901 = _1805 + _1899;
    float _1903 = log2(_1873);
    float _1905 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1883);
    float _1907 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1893);
    float _1909 = fma(_1897, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1911 = _1861 + 1.0;
    float _1913 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1915 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1907);
    float _1917 = fma(_1897, _1909, -0.212114393711090087890625);
    float _1919 = exp2(_1885);
    float _1921 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1913);
    float _1923 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1915);
    float _1925 = fma(_1897, _1917, 1.570728778839111328125);
    float _1927 = _1921 * _1887;
    float _1929 = _1923 * _1887;
    float _1931 = sqrt(_1895);
    float _1933 = _1903 * 0.693147182464599609375;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1937 = fma(_1927, 0.5, 0.5);
    float _1939 = -_1861;
    float _1941 = fma(_1919, _1911, _1939);
    float2 _6538 = float2(_1877, _1901);
    float _1943 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6538, float2(0.0), isnan(_6538)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6538, float2(0.0), isnan(_6538)), level(0.0)).x;
    float _1945 = fma(_1941, 0.5, 0.5);
    float _1947 = _1931 * 0.636619746685028076171875;
    float _1949 = fma(_1929, -0.5, 0.5);
    float _1951 = -_1925;
    float _1953 = fma(_1947, _1951, 1.0);
    float3 _6561 = float3(_1937, _1949, _1935);
    float _1955 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6561, float3(0.0), isnan(_6561)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6561, float3(0.0), isnan(_6561)), level(0.0)).x;
    float3 _6572 = float3(_1937, _1949, _1935);
    float4 _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6572, float3(0.0), isnan(_6572)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6572, float3(0.0), isnan(_6572)), level(0.0)).xyzw;
    float _1960 = _1958.x;
    float _1962 = _1958.y;
    float _1964 = _1958.z;
    float _1966 = _1958.w;
    float2 _6588 = float2(_1953, _1945);
    float3 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1980 = int(_1978);
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1984 = _1982 != 0;
    float _1986 = -_901;
    float _1988 = _1986 + 1.0;
    bool _1990 = _593 != 0;
    float _1992 = -_925;
    float _1994 = _1992 + 1.0;
    bool _1996 = _533 > 0.5;
    out.m_68.x = _551;
    int _1998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2000 = _1998 != 0;
    float _2002 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2004 = int(_2002);
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2008 = _2006 != 0;
    float _2010 = -_951;
    float _2012 = _2010 + 1.0;
    int _2014 = abs(_761);
    float _2016 = -_953;
    float _2018 = _2016 + 1.0;
    float _2020 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_70.x = _1501;
    out.m_70.y = _1499;
    out.m_70.z = _1503;
    float _2022 = float(uint(_1980));
    float _2024 = trunc(_889);
    int _2026 = int(_2024);
    int _2028 = ~_1980;
    int _2030 = _2028 + 1;
    float _2032 = float(uint(_2004));
    float _2034 = 1.0 / _2022;
    int _2036 = ~_1980;
    int _2038 = _2036 + 1;
    int _2040 = ~_2004;
    int _2042 = _2040 + 1;
    int _2044 = ~_2004;
    int _2046 = _2044 + 1;
    float _2048 = 1.0 / _2032;
    float _2050 = trunc(_947);
    int _2052 = int(_2050);
    int _2054 = as_type<int>(_2034) + (-2);
    float _2056 = float(uint(_2026));
    int _2058 = ~_2004;
    int _2060 = _2058 + 1;
    int _2062 = as_type<int>(_2048) + (-2);
    float _2064 = as_type<float>(_2054) * _2056;
    float _2066 = exp2(_2020);
    float _2068 = float(uint(_2052));
    float _2070 = trunc(_2064);
    float _2072 = precise::max(_2070, 0.0);
    uint _2075 = uint(_2072);
    float _2077 = as_type<float>(_2062) * _2068;
    float _2079 = -_2066;
    float _2081 = _2079 + 1.0;
    float _2083 = trunc(_2077);
    float _2085 = precise::max(_2083, 0.0);
    uint _2087 = uint(_2085);
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2095 = _2038 * int(_2075);
    int _2097 = _2095 + _2026;
    float _2099 = 1.0 / _2091;
    float _2101 = float(uint(_2097));
    int _2103 = _2060 * int(_2087);
    int _2105 = _2103 + _2052;
    float _2107 = as_type<float>(_2054) * _2101;
    float _2109 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2111 = _531 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2115 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2113;
    float _2117 = float(uint(_2105));
    float _2119 = trunc(_2107);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = _2115 * _2099;
    float _2127 = _2115;
    float _2129 = _2117;
    float _2131 = _2099;
    float _2133 = _1865;
    float _2135 = _1923;
    float _2137 = _1921;
    if (_1984)
    {
        _2127 = 1.0;
    }
    float _2139 = _2127;
    float _2141 = as_type<float>(_2062) * _2117;
    float _2143 = _2139;
    if (!_1984)
    {
        _2143 = 7.345489978790283203125;
    }
    float _2145 = _2143;
    float _2147 = fma(_2125, _2111, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1984)
    {
        _2129 = _533;
    }
    float _2149 = _2129;
    float _2151 = _2149;
    if (_1984)
    {
        _2131 = 1.0;
    }
    float _2153 = _2131;
    float _2155 = trunc(_2141);
    float _2157 = precise::max(_2155, 0.0);
    uint _2159 = uint(_2157);
    float _2161 = _2153;
    if (!_1984)
    {
        _2151 = _535;
    }
    float _2163 = _2151;
    float _2165 = _2145 * _533;
    if (!_1984)
    {
        _2161 = 1.2345600128173828125;
    }
    float _2167 = _2161;
    float _2169 = float(_2026);
    bool _2171 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2173 = isnan(_531);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = _2167 * _2163;
    float _2185 = floor(_2165);
    int _2187 = int(_2075) + int(_2123);
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2191 = _2189 != 0;
    float _2193 = -_2181;
    float _2195 = _2193 + 1.0;
    bool _2197 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2199 = isnan(_531);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2205 = _2201 || _2203;
    float _2207 = float(_2205);
    int _2209 = _2030 * _2187;
    int _2211 = _2209 + _2026;
    int _2213 = int(_2087) + int(_2159);
    float _2215 = floor(_2183);
    float _2217 = float(_1980);
    float _2219 = _2207 * _2195;
    float _2221 = float(_2004);
    int _2223 = _2042 * _2213;
    int _2225 = _2223 + _2052;
    bool _2227 = _2169 >= _2217;
    bool _2229 = isnan(_2169);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(_2217);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = _2147 * _2219;
    float _2241 = -_201;
    int _2243 = _1996 ? as_type<int>(_2241) : as_type<int>(_201);
    float _2245 = -_2185;
    float _2247 = _2165 + _2245;
    float _2249 = float(_2052);
    bool _2251 = !_2191;
    float _2253 = _2251 ? _201 : as_type<float>(_2243);
    float _2255 = trunc(_2237);
    int _2257 = int(_2255);
    bool _2259 = _2249 >= _2221;
    bool _2261 = isnan(_2249);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(_2221);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2273 = uint(_2211) >= uint(_1980);
    float _2275 = _2253 + 0.5;
    bool _2277 = uint(_2225) >= uint(_2004);
    float _2279 = -_2215;
    float _2281 = _2183 + _2279;
    float _2283 = _2247 * _2217;
    float _2285 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[80].x, _605);
    bool _2287 = !_2273;
    int _2289 = _2287 ? 0 : (-1);
    float _2291 = trunc(_2269);
    int _2293 = int(_2291);
    bool _2295 = !_2277;
    int _2297 = _2295 ? 0 : (-1);
    float _2299 = _2217 * _547;
    int _2301 = ~_2187;
    int _2303 = _2301 + _2289;
    int _2305 = _2303 + 1;
    float _2307 = -_1988;
    float _2309 = fma(_2253, _2307, _2285);
    int _2311 = ~_2213;
    int _2313 = _2311 + _2297;
    int _2315 = _2313 + 1;
    float _2317 = _2221 * _547;
    bool _2319 = _1980 == 0;
    int _2321 = _1980 * _2305;
    int _2323 = _2321 + _2026;
    float _2325 = trunc(_2283);
    int _2327 = int(_2325);
    int _2329 = _2004 * _2315;
    int _2331 = _2329 + _2052;
    bool _2333 = _2004 == 0;
    bool _2335 = !_2319;
    int _2337 = _2335 ? _2323 : (-1);
    bool _2339 = !_2333;
    int _2341 = _2339 ? _2331 : (-1);
    float _2343 = _2281 * _2221;
    int _2345 = ~_2293;
    int _2347 = _2345 + 1;
    int _2349 = _2347 + 1;
    float _2351 = trunc(_2317);
    int _2353 = int(_2351);
    bool _2355 = !_2008;
    int _2357 = _2355 ? 0 : 1;
    int _2359 = ~_2257;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    int _2365 = _2341 * _2349;
    int _2367 = abs(_2357);
    int _2369 = _1980 + (-1);
    int _2371 = _2337 * _2363;
    int _2373 = abs(_751);
    float _2375 = trunc(_2343);
    int _2377 = int(_2375);
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2381 = _2379 != 0;
    int _2383 = _2327 * _2367;
    int _2385 = _2383 + _2026;
    int _2387 = _2004 + (-1);
    int _2389 = _2257 * _2369;
    int _2391 = _2389 + _2371;
    bool _2393 = !_2381;
    int _2395 = _2393 ? 0 : 1;
    int _2397 = abs(_1069);
    int _2399 = _2293 * _2387;
    int _2401 = _2399 + _2365;
    int _2403 = abs(_1061);
    float _2405 = trunc(_2299);
    int _2407 = int(_2405);
    float _2409 = float(uint(_2385));
    int _2411 = _2391 * _2373;
    int _2413 = abs(_2395);
    int _2415 = _2401 * _2403;
    int _2417 = abs(_755);
    float _2419 = as_type<float>(_2054) * _2409;
    float _2421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2423 = _2377 * _2413;
    int _2425 = _2423 + _2052;
    int _2427 = _2353 * _2397;
    int _2429 = _2427 + _2415;
    int _2431 = ~_1980;
    int _2433 = _2431 + 1;
    float _2435 = trunc(_2419);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    float _2441 = float(uint(_2425));
    int _2443 = _2407 * _2417;
    int _2445 = _2443 + _2411;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2449 = _2447 != 0;
    float _2451 = -_217;
    int _2453 = _1990 ? as_type<int>(_2451) : as_type<int>(_217);
    float _2455 = as_type<float>(_2062) * _2441;
    bool _2457 = !_2000;
    int _2459 = _2457 ? 0 : 1;
    int _2461 = _2385 * _2014;
    int _2463 = _2461 + _2445;
    int _2465 = abs(_1073);
    float _2467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2469 = abs(_2459);
    int _2471 = abs(_1077);
    int _2473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2475 = _2473 != 0;
    int _2477 = _2433 * int(_2439);
    int _2479 = _2477 + _2385;
    bool _2481 = !_2449;
    float _2483 = _2481 ? _217 : as_type<float>(_2453);
    float _2485 = trunc(_2455);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = float(uint(_2479));
    int _2493 = _2425 * _2465;
    int _2495 = _2493 + _2429;
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2499 = _2497 != 0;
    int _2501 = _2327 * _2469;
    int _2503 = _2501 + _2463;
    float _2505 = _2483 + (-0.5);
    float _2507 = abs(_1509);
    float _2509 = log2(_2507);
    int _2511 = ~_2004;
    int _2513 = _2511 + 1;
    float _2515 = as_type<float>(_2054) * _2491;
    float _2517 = float(uint(_2503));
    float _2519 = -_2505;
    float _2521 = -_783;
    float _2523 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2521);
    int _2525 = _2377 * _2471;
    int _2527 = _2525 + _2495;
    float _2529 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2531 = as_type<float>(_2054) * _2517;
    float _2533 = fma(_2483, _1994, _2523);
    float _2535 = float(uint(_2527));
    float _2537 = -_2207;
    float _2539 = _2537 + 1.0;
    int _2541 = ~_1980;
    int _2543 = _2541 + 1;
    int _2545 = _2513 * int(_2489);
    int _2547 = _2545 + _2425;
    float _2549 = trunc(_2531);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    float _2555 = as_type<float>(_2062) * _2535;
    float _2557 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2239);
    float _2559 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2561 = float(uint(_2547));
    out.m_72.x = _2309;
    out.m_72.y = _2533;
    float _2563 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2557);
    float _2565 = trunc(_2555);
    float _2567 = precise::max(_2565, 0.0);
    uint _2569 = uint(_2567);
    float _2571 = as_type<float>(_2062) * _2561;
    float _2573 = _2467 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2575 = _2563 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2577 = _677 + 0.5;
    int _2579 = _2543 * int(_2553);
    int _2581 = _2579 + _2503;
    float _2583 = exp2(_2559);
    float _2585 = _681 + (-0.5);
    float _2587 = fma(_2529, _2577, _957);
    out.m_74.w = _2575;
    float _2589 = float(uint(_2581));
    float _2591 = -_2573;
    float _2593 = -_867;
    float _2595 = fma(_2591, _2585, _2593);
    int _2597 = _2046 * int(_2569);
    int _2599 = _2597 + _2527;
    float _2601 = trunc(_2515);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    int _2607 = ~_1980;
    int _2609 = _2607 + 1;
    float _2611 = as_type<float>(_2054) * _2589;
    float _2613 = -_2012;
    float _2615 = fma(_677, _2613, _2587);
    float _2617 = float(uint(_2599));
    float _2619 = fma(_681, _2018, _2595);
    int _2621 = ~_1980;
    int _2623 = _2621 + 1;
    float _2625 = trunc(_2571);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    float _2631 = as_type<float>(_2062) * _2617;
    float _2633 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    int _2637 = ~_2004;
    int _2639 = _2637 + 1;
    out.m_76.x = _2615;
    out.m_76.y = _2619;
    float _2641 = trunc(_2611);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = int(_2439) + int(_2605);
    int _2649 = ~_2004;
    int _2651 = _2649 + 1;
    int _2653 = _2609 * _2647;
    int _2655 = _2653 + _2385;
    float _2657 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = trunc(_2631);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    int _2665 = int(_2489) + int(_2629);
    float _2667 = fma(_2635, -2.0, 3.0);
    bool _2669 = uint(_2655) >= uint(_1980);
    float _2671 = _2635 * _2635;
    float _2673 = -_1943;
    float _2675 = _2673 + 1.0;
    int _2677 = _2639 * _2665;
    int _2679 = _2677 + _2425;
    bool _2681 = !_2669;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = _2671 * _2667;
    int _2687 = int(_2553) + int(_2645);
    bool _2689 = uint(_2679) >= uint(_2004);
    float _2691 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2693 = ~_2647;
    int _2695 = _2693 + _2683;
    int _2697 = _2695 + 1;
    int _2699 = _2623 * _2687;
    int _2701 = _2699 + _2503;
    float _2703 = _2093 * _1955;
    int _2705 = int(_2569) + int(_2663);
    float _2707 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2709 = -_1093;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2691);
    bool _2713 = uint(_2701) >= uint(_1980);
    float _2715 = -_2093;
    float _2717 = _2715 + 1.0;
    float _2719 = -_1093;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2707);
    int _2723 = _2651 * _2705;
    int _2725 = _2723 + _2527;
    bool _2727 = !_2713;
    int _2729 = _2727 ? 0 : (-1);
    float _2731 = -_1093;
    float _2733 = fma(_2731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    bool _2735 = !_2689;
    int _2737 = _2735 ? 0 : (-1);
    float _2739 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2721);
    bool _2741 = uint(_2725) >= uint(_2004);
    float _2743 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2745 = ~_2687;
    int _2747 = _2745 + _2729;
    int _2749 = _2747 + 1;
    float _2751 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2711);
    int _2753 = ~_2665;
    int _2755 = _2753 + _2737;
    int _2757 = _2755 + 1;
    float _2759 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2743);
    bool _2761 = !_2741;
    int _2763 = _2761 ? 0 : (-1);
    int _2765 = _1980 * _2749;
    int _2767 = _2765 + _2503;
    float _2769 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2771 = _1980 * _2697;
    int _2773 = _2771 + _2385;
    int _2775 = ~_2705;
    int _2777 = _2775 + _2763;
    int _2779 = _2777 + 1;
    float _2781 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2783 = !_2319;
    int _2785 = _2783 ? _2767 : (-1);
    float _2787 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2789 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2733);
    float _2791 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2781);
    float _2793 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2795 = _2785 >> 31;
    float _2797 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2787);
    int _2799 = _2004 * _2779;
    int _2801 = _2799 + _2527;
    float _2803 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    int _2805 = _2795 & 3;
    float _2807 = -_2685;
    float _2809 = _2807 + 1.0;
    int _2811 = _2785 & 3;
    bool _2813 = _2811 != 0;
    float _2815 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2769);
    bool _2817 = !_2333;
    int _2819 = _2817 ? _2801 : (-1);
    float _2821 = fma(_2809, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2685);
    int _2823 = _2785 + _2805;
    float _2825 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2827 = _2819 >> 31;
    float _2829 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2803);
    int _2831 = _2823 >> 2;
    float _2833 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2825);
    bool _2835 = uint(_2811) >= 2u;
    float _2837 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2815);
    int _2839 = _2827 & 3;
    float _2841 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    int _2843 = _2831 << 4;
    int _2845 = _2843 + 368;
    float _2847 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2797);
    int _2849 = _2785 & 3;
    bool _2851 = _2849 != 0;
    float _2853 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2855 = _2819 + _2839;
    uint _2857 = uint(int(uint(_2845) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c9)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = _2835 ? 0 : 1;
    float _2875 = _2853 * _2739;
    bool _2877 = _2811 != 3;
    float _2879 = _2853 * _2751;
    int _2881 = _2851 ? 0 : 1;
    int _2883 = _2004 * _2757;
    int _2885 = _2883 + _2425;
    bool _2887 = uint(_2811) > 1u;
    int _2889 = _2855 >> 2;
    bool _2891 = _1509 <= 8000.0;
    bool _2893 = isnan(_1509);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan(8000.0);
    bool _2899 = _2895 || _2897;
    float _2901 = float(_2899);
    int _2903 = _2889 << 4;
    int _2905 = _2903 + 512;
    int _2907 = ~_2873;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = _2901 * _2821;
    uint _2915 = uint(int(uint(_2905) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = _2911;
    if (_2877)
    {
        int _2933 = ~_2873;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2791);
    int _2941 = ~_2881;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    float _2947 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2759);
    int _2949 = _2945;
    if (!_2887)
    {
        int _2951 = ~_2881;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    float _2957 = fma(_2271, _2939, _2875);
    bool _2959 = !_2813;
    int _2961 = _2959 ? 0 : 1;
    int _2963 = _2845 + 8;
    uint _2965 = uint(int(uint(_2963) >> uint(2)));
    uint _2967 = uint(int(uint(int(_2965)) >> uint(2)));
    int _2969 = int(_2965) & 3;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[int(_2967)][_2969];
    int _2973 = int(_2965) + 1;
    uint _2975 = uint(int(uint(_2973) >> uint(2)));
    int _2977 = _2973 & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    int _2981 = _2819 & 3;
    bool _2983 = _2981 != 0;
    out.m_78.x = _2939;
    out.m_78.y = _2947;
    out.m_78.z = _2847;
    int _2985 = _2819 & 3;
    bool _2987 = _2985 != 0;
    float _2989 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2991 = uint(_2981) > 1u;
    int _2993 = _2987 ? 0 : 1;
    int _2995 = _2905 + 8;
    uint _2997 = uint(int(uint(_2995) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = abs(_2955);
    float _3015 = fma(_2271, _2947, _2879);
    bool _3017 = !_2983;
    int _3019 = _3017 ? 0 : 1;
    float _3021 = _2675 * _2989;
    float _3023 = precise::clamp(_3021, 0.0, 1.0);
    bool _3025 = _2981 != 3;
    float _3027 = _1976 * _2703;
    int _3029 = ~_2993;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = _1966 * _2717;
    bool _3037 = uint(_2981) >= 2u;
    int _3039 = _3033;
    if (!_2991)
    {
        int _3041 = ~_2993;
        int _3043 = _3041 + 1;
        _3039 = _3043;
    }
    int _3045 = _3039;
    int _3047 = ~_3013;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = abs(_2961);
    int _3055 = abs(_3045);
    int _3057 = _3051 * as_type<int>(_2871);
    int _3059 = _3037 ? 0 : 1;
    int _3061 = ~_3059;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = ~_3053;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = _3065;
    if (_3025)
    {
        int _3075 = ~_3059;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    int _3081 = abs(_3019);
    int _3083 = _3071 * as_type<int>(_2863);
    int _3085 = _3083 + _3057;
    int _3087 = ~_3055;
    int _3089 = _3087 + 1;
    int _3091 = _3089 + 1;
    float _3093 = _1921 + _1865;
    int _3095 = abs(_2937);
    int _3097 = abs(_3079);
    int _3099 = _3091 * as_type<int>(_2929);
    int _3101 = ~_3081;
    int _3103 = _3101 + 1;
    int _3105 = _3103 + 1;
    float _3107 = _3093 * 0.5;
    int _3109 = ~_3095;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = fma(_2853, _2853, 1.0);
    bool _3117 = _2811 != 3;
    int _3119 = _3105 * as_type<int>(_2921);
    int _3121 = _3119 + _3099;
    int _3123 = ~_3097;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _3113 * as_type<int>(_2971);
    int _3131 = _3129 + _3085;
    bool _3133 = _2981 != 3;
    float _3135 = rsqrt(_3115);
    bool _3137 = !_3117;
    int _3139 = _3137 ? 0 : (-1);
    int _3141 = _3127 * as_type<int>(_3003);
    int _3143 = _3141 + _3121;
    bool _3145 = !_3133;
    int _3147 = _3145 ? 0 : (-1);
    bool _3149 = !_2499;
    int _3151 = _3149 ? 0 : 1;
    int _3153 = abs(_3139);
    bool _3155 = !_2475;
    int _3157 = _3155 ? 0 : 1;
    int _3159 = abs(_3147);
    int _3161 = abs(_3151);
    int _3163 = abs(_3157);
    float _3165 = _2853 * _2789;
    int _3167 = ~_3153;
    int _3169 = _3167 + 1;
    int _3171 = _3169 + 1;
    float _3173 = _2853 * _3135;
    int _3175 = ~_3159;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    float _3181 = fma(_2271, _2847, _3165);
    int _3183 = ~_3161;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    int _3189 = _3171 * as_type<int>(_2979);
    int _3191 = _3189 + _3131;
    int _3193 = ~_3163;
    int _3195 = _3193 + 1;
    int _3197 = _3195 + 1;
    int _3199 = _3179 * as_type<int>(_3011);
    int _3201 = _3199 + _3143;
    bool _3203 = !_2319;
    int _3205 = _3203 ? _2773 : (-1);
    int _3207 = _3191 * _3187;
    bool _3209 = !_2333;
    int _3211 = _3209 ? _2885 : (-1);
    int _3213 = _3201 * _3197;
    float _3215 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3217 = _3205 * _3161;
    int _3219 = _3217 + _3207;
    float _3221 = in.m_80.x;
    int _3223 = _3211 * _3163;
    int _3225 = _3223 + _3213;
    float _3227 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3215);
    float _3229 = -_2829;
    float _3231 = _3173 * _3229;
    float _3233 = -_2837;
    float _3235 = _3173 * _3233;
    float _3237 = -_2841;
    float _3239 = _3173 * _3237;
    float _3241 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3227);
    float _3243 = _2829 + _2957;
    float _3245 = fma(_3135, _2739, _3231);
    float _3247 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3241);
    float _3249 = fma(_3135, _2751, _3235);
    float _3251 = fma(_3135, _2789, _3239);
    float _3253 = _3247 + _1865;
    float _3255 = -_3023;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3259 = _1865 * 0.5;
    float _3261 = _3253 * 0.5;
    float _3263 = _2837 + _3015;
    float _3265 = fma(_1923, -0.5, _3259);
    float _3267 = _2841 + _3181;
    float _3269 = fma(_1966, _3027, _1964);
    float _3271 = _3257 * _3221;
    out.m_82.x = _3245;
    out.m_82.y = _3249;
    out.m_82.z = _3251;
    bool _3273 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3275 = isnan(_1645);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3281 = _3277 || _3279;
    float _3283 = _1563 * _1619;
    float _3285 = _3271 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.z = _3261;
    out.m_84.w = _1865;
    float _3287 = float(_3219);
    float _3289 = float(_3225);
    out.m_86.x = _3107;
    out.m_86.y = _3265;
    out.m_86.z = _3261;
    out.m_86.w = _1865;
    out.m_88.x = _3285;
    float _3291 = _1966 * _2703;
    out.m_90.x = _3243;
    out.m_90.y = _3263;
    out.m_90.z = _3267;
    float _3293 = fma(_1972, _3291, _1960);
    float _3295 = fma(_1974, _3291, _1962);
    out.m_92.x = _3287;
    out.m_92.y = _3289;
    float _3297 = _3283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3299 = _3283;
    float _3301 = _3287;
    float _3303 = _3247;
    if (!_3281)
    {
        _3299 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3305 = _3299;
    out.m_94.x = _3293;
    out.m_94.y = _3295;
    out.m_94.z = _3269;
    out.m_94.w = _3035;
    out.gl_Position.x = _1921;
    out.gl_Position.y = _1923;
    out.gl_Position.z = _3247;
    out.gl_Position.w = _1865;
    float _3307 = _3305;
    float _3309 = _3305;
    if (!_3281)
    {
        _3301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3311 = _3301;
    float _3313 = _3311;
    float _3315 = _3311;
    if (!_3281)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3317 = _2133;
    float _3319 = _3317;
    float _3321 = _3317;
    if (!_3281)
    {
        _3303 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3323 = _3303;
    float _3325 = _3323;
    float _3327 = _3323;
    if (!_3281)
    {
        _2135 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3329 = _2135;
    float _3331 = _3329;
    float _3333 = _3329;
    if (!_3281)
    {
        _2137 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3335 = _2137;
    bool _3337 = !_3281;
    float _3339 = _3335;
    float _3341 = _3335;
    if (!_3337)
    {
        bool _3343 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3345 = isnan(_1645);
        bool _3347 = _3343 || _3345;
        bool _3349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3351 = _3347 || _3349;
        if (!_3351)
        {
            float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3355 = _1645 + _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3359 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3357;
            float _3361 = 1.0 / _3359;
            float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3383 = _3355 * _3361;
            float _3385 = precise::clamp(_3383, 0.0, 1.0);
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3391 = fma(_3385, _3365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3393 = fma(_3385, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3395 = fma(_3385, _3369, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3397 = fma(_3385, _3373, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3399 = fma(_3385, _3377, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3401 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3321 = _3393;
            _3341 = _3399;
            _3315 = _3391;
            _3333 = _3397;
            _3327 = _3395;
            _3309 = _3401;
            _3403 = true;
        }
        else
        {
            bool _3405 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3407 = isnan(_1645);
            bool _3409 = _3405 || _3407;
            bool _3411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3413 = _3409 || _3411;
            if (!_3413)
            {
                _3313 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3415 = _3313;
            _3315 = _3415;
            if (!_3413)
            {
                _3319 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3417 = _3319;
            _3321 = _3417;
            if (!_3413)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3419 = _3325;
            _3327 = _3419;
            if (!_3413)
            {
                _3331 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3421 = _3331;
            _3333 = _3421;
            if (!_3413)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3423 = _3339;
            _3341 = _3423;
            if (!_3413)
            {
                _3307 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3425 = _3307;
            bool _3427 = !_3413;
            _3309 = _3425;
            if (!_3427)
            {
                bool _3429 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3431 = isnan(_1645);
                bool _3433 = _3429 || _3431;
                bool _3435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3437 = _3433 || _3435;
                if (!_3437)
                {
                    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3441 = _1645 + _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3445 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3443;
                    float _3447 = 1.0 / _3445;
                    float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3451 = _3449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3457 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3459 = _3457 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3463 = _3461 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3467 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3469 = _3441 * _3447;
                    float _3471 = precise::clamp(_3469, 0.0, 1.0);
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3477 = fma(_3471, _3451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3479 = fma(_3471, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3481 = fma(_3471, _3455, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3483 = fma(_3471, _3459, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3485 = fma(_3471, _3463, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3487 = fma(_3471, _3467, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3321 = _3479;
                    _3341 = _3485;
                    _3315 = _3477;
                    _3333 = _3483;
                    _3327 = _3481;
                    _3309 = _3487;
                    _3403 = true;
                }
                else
                {
                    _3321 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3315 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3333 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3309 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3403 = false;
    float _3489 = _3321;
    float _3491 = _3341;
    float _3493 = _3315;
    float _3495 = _3333;
    float _3497 = _3327;
    float _3499 = _3309;
    float _3501 = _3297 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3503 = fma(_3263, -0.5, 0.5);
    float _3505 = precise::clamp(_3503, 0.0, 1.0);
    float _3507 = -_3489;
    float _3509 = _3507 + _3491;
    float _3511 = -_3493;
    float _3513 = _3511 + _3495;
    out.m_49.x = _3501;
    float _3515 = fma(_3505, _3509, _3489);
    float _3517 = -_3497;
    float _3519 = _3517 + _3499;
    float _3521 = fma(_3505, _3513, _3493);
    float _3523 = _3515 * 0.586610972881317138671875;
    bool _3525 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3527 = fma(_3505, _3519, _3497);
    out.m_96.x = 0.0;
    float _3529 = fma(_3521, 0.298911988735198974609375, _3523);
    bool _3531 = _1563 > 0.0;
    bool _3533 = isnan(_1563);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan(0.0);
    bool _3539 = _3535 || _3537;
    float _3541 = fma(_3527, 0.114477999508380889892578125, _3529);
    bool _3543 = _1619 <= 0.0;
    bool _3545 = !_3539;
    bool _3547 = _3543 || _3545;
    float _3549 = -_3541;
    float _3551 = _3521 + _3549;
    float _3553 = -_3541;
    float _3555 = _3515 + _3553;
    float _3557 = -_3541;
    float _3559 = _3527 + _3557;
    float _3561 = fma(_3551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3563 = fma(_3555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3565 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    bool _3567 = !_3525;
    if (!_3567)
    {
        float _3569 = -_1499;
        float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3573 = -_1501;
        float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3577 = -_1503;
        float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3581 = _3571 * _3571;
        float _3583 = fma(_3575, _3575, _3581);
        float _3585 = fma(_3579, _3579, _3583);
        float _3587 = sqrt(_3585);
        float _3589 = rsqrt(_3585);
        float _3591 = -_3587;
        float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3597 = precise::clamp(_3595, 0.0, 1.0);
        float _3599 = _3575 * _3589;
        float _3601 = _3571 * _3589;
        float _3603 = abs(_3597);
        float _3605 = log2(_3603);
        float _3607 = _3579 * _3589;
        float _3609 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3611 = _3263 * _3601;
        float _3613 = -_3601;
        float _3615 = -_3609;
        float _3617 = fma(_3613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3615);
        float _3619 = fma(_3243, _3599, _3611);
        float _3621 = -_3607;
        float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3617);
        float _3625 = fma(_3267, _3607, _3619);
        float _3627 = precise::clamp(_3625, 0.0, 1.0);
        float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3631 = _3623 + _3629;
        float _3633 = _3605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3635 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3637 = precise::clamp(_3635, 0.0, 1.0);
        float _3639 = exp2(_3633);
        float _3641 = _3639 * _3637;
        float _3643 = _3627 * _3641;
        float _3645 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3647 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3649 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3645;
        out.m_96.y = _3647;
        out.m_96.z = _3649;
    }
    out.m_98.x = _3561;
    out.m_98.y = _3563;
    out.m_98.z = _3565;
    if (!_3547)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3651;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3403 = false;
    bool _435 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_117);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_133);
        out.gl_Position.z = _3708;
    }
    if (!_121)
    {
        return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _141;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _165 = _141 * _159;
    int _167 = 0;
    float _169 = _165;
    if (_157)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3780 = as_type<float>(_173);
        out.gl_Position.z = _3780;
    }
    if (_157)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _215 = !_189;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_60.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _165;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = 1.0 / _249;
    bool _261 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_241);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _253;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _257;
    float _283 = _245 * _259;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _241 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _241 + _289;
    float _293 = fma(_279, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = _287 * _275;
    bool _297 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_241);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    float _317 = fma(_311, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = _291 * _281;
    float _321 = -_271;
    float _323 = _321 + 1.0;
    bool _325 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_241);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _307 * _323;
    bool _339 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_241);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _335 * _315;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = -_335;
    float _363 = _361 + 1.0;
    float _365 = fma(_355, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = _349 * _363;
    float _371 = in.m_62.x;
    float _373 = in.m_62.y;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    float _379 = _293 * _369;
    float _381 = _317 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_365, _351, _391);
    float _401 = fma(_367, _351, _393);
    float _403 = fma(_395, _337, _399);
    float _405 = fma(_397, _337, _401);
    float _407 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    float _411 = _407 * _371;
    float _413 = _409 * _373;
    bool _415 = !_273;
    float _433;
    if (!_415)
    {
        float _417 = in.m_60.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _165;
    }
    _435 = false;
    float _437 = _433;
    bool _439 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_437);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_437);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = 1.0 / _453;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    float _479 = _465 * _477;
    float _481 = -_465;
    float _483 = _481 + 1.0;
    float _485 = _469 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _437 + _487;
    float _491 = fma(_485, _489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _495 = _491 * _479;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _495);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[116].x, _497);
    float _505 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _505;
    out.m_64.y = _507;
    out.m_64.z = _509;
    out.m_64.w = _511;
    bool _513 = !_471;
    if (!_513)
    {
        float _515 = in.m_60.x;
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _519 = _515 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _169 = _529;
    }
    float _531 = _169;
    float _533 = in.m_60.x;
    float _535 = in.m_60.y;
    float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _539 = log2(_537);
    float _541 = in.m_60.z;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _545 = _543 != 0;
    float _547 = _159 * _141;
    float _549 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _551 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = _533 * 2.0;
    float _557 = _535 * 2.0;
    bool _559 = _535 > 0.5;
    float _561 = _533 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _563 = _541 * 2.0;
    float _565 = floor(_557);
    int _567 = int(_471);
    int _569 = _189 ? 2 : 0;
    int _571 = _567 | _569;
    int _573 = _191 ? 4 : 0;
    int _575 = _571 | _573;
    int _577 = _545 ? 8 : 0;
    int _579 = _575 | _577;
    int _581 = false ? 16 : 0;
    int _583 = _579 | _581;
    int _585 = false ? 32 : 0;
    int _587 = _583 | _585;
    int _589 = _559 ? 64 : 0;
    int _591 = _587 | _589;
    int _593 = _591 & 64;
    float _595 = -_553;
    float _597 = fma(_561, 2.0, _595);
    float _599 = _535 + _533;
    float _601 = _535 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _603 = -_141;
    float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _597);
    float _607 = _599 + (-1.0);
    float _609 = floor(_555);
    float _611 = -_201;
    int _613 = _559 ? as_type<int>(_611) : as_type<int>(_201);
    float _615 = floor(_563);
    bool _617 = _609 > 0.0;
    bool _619 = _609 >= 0.0;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    int _629 = int(_617);
    int _631 = _189 ? 2 : 0;
    int _633 = _629 | _631;
    int _635 = _627 ? 4 : 0;
    int _637 = _633 | _635;
    int _639 = _545 ? 8 : 0;
    int _641 = _637 | _639;
    int _643 = false ? 16 : 0;
    int _645 = _641 | _643;
    int _647 = false ? 32 : 0;
    int _649 = _645 | _647;
    int _651 = _559 ? 64 : 0;
    int _653 = _649 | _651;
    int _655 = _653 & 8;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _663 = _661 != 0;
    bool _665 = _541 > 0.5;
    int _667 = _655;
    if (_545)
    {
        _667 = 0;
    }
    int _669 = _667;
    float _671 = -_217;
    int _673 = _665 ? as_type<int>(_671) : as_type<int>(_217);
    bool _675 = !_659;
    float _677 = _675 ? _201 : as_type<float>(_613);
    bool _679 = !_663;
    float _681 = _679 ? _217 : as_type<float>(_673);
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _693 = _691 != 0;
    int _695 = _669;
    if (!_545)
    {
        _695 = 2;
    }
    int _697 = _695;
    bool _699 = _565 >= 0.0;
    bool _701 = isnan(_565);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    int _709 = _627 ? 0 : 1;
    int _711 = _707 ? 0 : 1;
    bool _713 = _697 != 2;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _717 = int(_715);
    int _719 = ~_709;
    int _721 = _719 + 1;
    int _723 = _721 + 1;
    int _725 = _723;
    if (!_617)
    {
        int _727 = ~_709;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    bool _733 = _615 > 0.0;
    bool _735 = _615 >= 0.0;
    bool _737 = isnan(_615);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _747 = int(_745);
    bool _749 = !_689;
    int _751 = _749 ? 0 : 1;
    bool _753 = !_685;
    int _755 = _753 ? 0 : 1;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _759 = !_693;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_601, -2.0, _757);
    int _765 = _743 ? 0 : 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _777 = _775 != 0;
    float _779 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _781 = _565 > 0.0;
    float _783 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _763);
    float _785 = float(_717);
    int _787 = ~_765;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    float _793 = _757;
    float _795 = as_type<float>(_717);
    int _797 = _791;
    if (_713)
    {
        _793 = _533;
    }
    float _799 = _793;
    float _801 = 1.0 / _785;
    float _803 = _799;
    if (_713)
    {
        _795 = _535;
    }
    float _805 = _795;
    bool _807 = !_769;
    int _809 = _807 ? 0 : 1;
    float _811 = _805;
    if (!_733)
    {
        int _813 = ~_765;
        int _815 = _813 + 1;
        _797 = _815;
    }
    int _817 = _797;
    if (!_713)
    {
        _803 = _541;
    }
    float _819 = _803;
    if (!_713)
    {
        _811 = _533;
    }
    float _821 = _811;
    float _823 = _819 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _827 = abs(_809);
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _831 = ~_711;
    int _833 = _831 + 1;
    int _835 = _833 + 1;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _839 = _835;
    if (!_781)
    {
        int _841 = ~_711;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = _539 * _141;
    float _849 = float(_817);
    float _851 = -_829;
    float _853 = fma(_823, 2.0, _851);
    float _855 = fma(_825, -2.0, _837);
    float _857 = float(_827);
    float _859 = in.m_66.x;
    float _861 = in.m_66.y;
    float _863 = in.m_66.z;
    float _865 = exp2(_847);
    float _867 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _855);
    float _869 = _857 * _849;
    bool _871 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _873 = isnan(1.0);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _879 = _875 || _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _883 = 1.0 + _881;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _887 = float(_747);
    float _889 = _801 * _141;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _893 = 1.0 / _887;
    float _895 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[78].z, _885);
    float _897 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[78].w, _891);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _901 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _895);
    float _903 = -_865;
    float _905 = _903 + 1.0;
    bool _907 = !_773;
    int _909 = _907 ? 0 : 1;
    float _911 = 1.0 / _883;
    bool _913 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _921 = _917 || _919;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _925 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _897);
    float _927 = _869 * (-2.0);
    int _929 = abs(_909);
    float _931 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[88].z, _899);
    float _933 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[88].w, _923);
    float _935 = _921 ? _905 : 0.0;
    float _937 = _533 + (-0.5);
    float _939 = float(_731);
    float _941 = fma(_927, _859, _859);
    bool _943 = !_777;
    int _945 = _943 ? 0 : 1;
    float _947 = _893 * _141;
    float _949 = float(_929);
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _931);
    float _953 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _933);
    float _955 = -_141;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[86].x, _853);
    float _959 = _869;
    if (_879)
    {
        float _961 = _935 * _911;
        _161 = _961;
    }
    float _963 = _161;
    float _965 = fma(_779, _927, _779);
    float _967 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _941);
    int _969 = abs(_945);
    float _971 = _949 * _939;
    float _973 = _535 + _541;
    float _975 = fma(_965, _963, _967);
    float _977 = float(_845);
    float _979 = _971 * (-2.0);
    float _981 = float(_969);
    float _983 = _973 + (-1.0);
    float _985 = fma(_979, _861, _861);
    float _987 = _975 * 0.15915493667125701904296875;
    float _989 = _981 * _977;
    float _991 = _535 + (-0.5);
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _995 = _541 + _533;
    float _997 = _989 * (-2.0);
    float _999 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _985);
    float _1001 = _995 + (-1.0);
    float _1003 = fma(_997, _863, _863);
    float _1005 = _541 + (-0.5);
    float _1007 = fma(_993, _979, _993);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1011 = _987 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1003);
    float _1017 = fma(_1007, _963, _999);
    float _1019 = fma(_1009, _997, _1009);
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1023 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1025 = _1017 * 0.15915493667125701904296875;
    float _1027 = fma(_1019, _963, _1015);
    float _1029 = _987 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _549 * _1021;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1037 = _1035 != 0;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1045 = _1043 != 0;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1049 = _1047 != 0;
    float _1051 = _1027 * 0.15915493667125701904296875;
    float _1053 = in.m_46.x;
    float _1055 = in.m_46.y;
    float _1057 = in.m_46.z;
    bool _1059 = !_1041;
    int _1061 = _1059 ? 0 : 1;
    float _1063 = _1025 * 6.283185482025146484375;
    float _1065 = sin(_1063);
    bool _1067 = !_1037;
    int _1069 = _1067 ? 0 : 1;
    bool _1071 = !_1045;
    int _1073 = _1071 ? 0 : 1;
    bool _1075 = !_1049;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _1025 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    float _1083 = _1051 * 6.283185482025146484375;
    float _1085 = cos(_1083);
    float _1087 = _1013 * _1065;
    float _1089 = _1031 * _1065;
    float _1091 = _1051 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = _1013 * _1081;
    float _1097 = _1031 * _1081;
    float _1099 = _1013 * _1085;
    float _1101 = _1031 * _1085;
    float _1103 = _1081 * _1085;
    float _1105 = _1065 * _1085;
    float _1107 = _551 * _1023;
    float _1109 = _1099 * _1033;
    float _1111 = fma(_1093, _1095, _1089);
    float _1113 = -_1087;
    float _1115 = fma(_1093, _1097, _1113);
    float _1117 = -_1033;
    float _1119 = _1093 * _1117;
    float _1121 = -_1097;
    float _1123 = fma(_1093, _1087, _1121);
    float _1125 = _1101 * _1033;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = fma(_1111, _1107, _1109);
    float _1131 = fma(_1093, _1089, _1095);
    float _1133 = fma(_1103, _1107, _1119);
    float _1135 = fma(_1115, _1107, _1125);
    float _1137 = fma(_1123, _1127, _1129);
    float _1139 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1141 = fma(_1105, _1127, _1133);
    float _1143 = fma(_1131, _1127, _1135);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1147 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1139);
    float _1149 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1145);
    float _1155 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1147);
    float _1157 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1149);
    float _1159 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1151);
    float _1161 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1165 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1157);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1159);
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1171 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1175 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1177 = _1163 + _1169;
    float _1179 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1171);
    float _1181 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1183 = _1173 + _1175;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1187 = _1177 + _1185;
    float _1189 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1179);
    float _1191 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1183 + _1193;
    float _1197 = _1187 * _1187;
    float _1199 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1191);
    float _1201 = fma(_1195, _1195, _1197);
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1207 = sqrt(_1201);
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1211 = _1203 + _1205;
    float _1213 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1209);
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    bool _1217 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = _1213;
    float _1221 = _1057;
    float _1223 = _1183;
    if (!_1217)
    {
        _1219 = _1183;
    }
    float _1225 = _1219;
    float _1227 = _1225;
    if (!_1217)
    {
        _1221 = _1177;
    }
    float _1229 = _1221;
    float _1231 = _1229;
    if (!_1217)
    {
        _1223 = _1211;
    }
    float _1233 = _1223;
    bool _1235 = !_1217;
    float _1237 = _1233;
    if (!_1235)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1243 = _1207 + _1241;
        float _1245 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = rsqrt(_1201);
        float _1249 = _1243 * _1239;
        float _1251 = _1249 * 0.15915493667125701904296875;
        float _1253 = _1251 * 6.283185482025146484375;
        float _1255 = cos(_1253);
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        float _1261 = _1255 + (-1.0);
        float _1263 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = fma(_1259, _1245, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1267 = fma(_1211, _1255, _1263);
        float _1269 = _1247 * _1265;
        float _1271 = fma(_1195, _1269, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1273 = fma(_1187, _1269, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1237 = _1267;
        _1227 = _1271;
        _1231 = _1273;
    }
    float _1275 = _1237;
    float _1277 = _1227;
    float _1279 = _1231;
    float _1281 = -_1203;
    float _1283 = _1281 + _1275;
    float _1285 = -_1173;
    float _1287 = _1285 + _1277;
    float _1289 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1291 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1293 = _1283 * _1283;
    float _1295 = -_1163;
    float _1297 = _1295 + _1279;
    float _1299 = 1.0 / _1289;
    float _1301 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1291);
    float _1303 = fma(_1287, _1287, _1293);
    float _1305 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1301);
    float _1307 = fma(_1297, _1297, _1303);
    bool _1309 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1311 = isnan(0.5);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1317 = _1313 || _1315;
    float _1319 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1321 = sqrt(_1307);
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = _1319 + _1289;
    float _1335 = _1333 * _1299;
    float _1337 = _1335 * 0.5;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    float _1343 = 1.0 / _1341;
    bool _1345 = _1321 > 0.0;
    float _1347 = _1321;
    float _1349 = _1275;
    float _1351 = _1279;
    float _1353 = _1341;
    float _1355 = _1289;
    float _1357 = _1299;
    float _1359 = _1283;
    float _1361 = _1277;
    if (!_1345)
    {
        _1347 = _1277;
    }
    float _1363 = _1347;
    bool _1365 = !_1345;
    float _1367 = _1363;
    if (!_1365)
    {
        float _1369 = _211 * _211;
        float _1371 = fma(_209, _209, _1369);
        float _1373 = fma(_213, _213, _1371);
        float _1375 = rsqrt(_1307);
        float _1377 = sqrt(_1373);
        float _1379 = _1287 * _1375;
        float _1381 = _1283 * _1375;
        float _1383 = _1297 * _1375;
        bool _1385 = _1377 > 0.0;
        float _1387 = _1375;
        _1353 = _1377;
        _1357 = _1379;
        if (!_1385)
        {
            _1387 = _1277;
        }
        float _1389 = _1387;
        bool _1391 = !_1385;
        _1367 = _1389;
        if (!_1391)
        {
            float _1393 = rsqrt(_1373);
            float _1395 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1397 = _211 * _1393;
            float _1399 = _209 * _1393;
            float _1401 = _1381 * _1397;
            float _1403 = _213 * _1393;
            float _1405 = fma(_1379, _1399, _1401);
            float _1407 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1409 = fma(_1383, _1403, _1405);
            float _1411 = _1409 * _1407;
            float _1413 = fma(_209, _1411, _1277);
            float _1415 = fma(_211, _1411, _1275);
            float _1417 = fma(_213, _1411, _1279);
            _1349 = _1415;
            _1367 = _1413;
            _1351 = _1417;
            _1353 = _1403;
            _1355 = _1411;
        }
    }
    float _1419 = _1349;
    float _1421 = _1367;
    float _1423 = _1351;
    float _1425 = _1353;
    float _1427 = _1355;
    float _1429 = _1357;
    float _1431 = _1421;
    float _1433 = _1423;
    float _1435 = _1429;
    float _1437 = _1425;
    float _1439 = _1427;
    if (_1331)
    {
        _1359 = 1.0;
    }
    float _1441 = _1359;
    float _1443 = _1441;
    if (_1317)
    {
        _1361 = _1419;
    }
    float _1445 = _1361;
    float _1447 = _1445;
    if (!_1317)
    {
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1451 = _1203 + _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1455 = _1173 + _1453;
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1459 = -_1173;
        float _1461 = _1459 + _1421;
        float _1463 = _1451 * _1451;
        float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1467 = _1163 + _1465;
        float _1469 = fma(_1455, _1455, _1463);
        float _1471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1473 = fma(_1467, _1467, _1469);
        float _1475 = sqrt(_1473);
        float _1477 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1479 = precise::min(_1475, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1481 = _1479 * _1471;
        float _1483 = -_1203;
        float _1485 = _1483 + _1419;
        float _1487 = _1477 * _1481;
        float _1489 = -_1163;
        float _1491 = _1489 + _1423;
        float _1493 = fma(_1485, _1487, _1203);
        float _1495 = fma(_1461, _1487, _1173);
        float _1497 = fma(_1491, _1487, _1163);
        _1447 = _1493;
        _1431 = _1495;
        _1433 = _1497;
    }
    float _1499 = _1447;
    float _1501 = _1431;
    float _1503 = _1433;
    if (_1331)
    {
        _1435 = 1.0;
    }
    float _1505 = _1435;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1509 = _1343 * _1507;
    float _1511 = _1505;
    if (!_1331)
    {
        float _1513 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1515 = _1513 * 0.15915493667125701904296875;
        float _1517 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1519 = _1515 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = _1517 * 0.15915493667125701904296875;
        float _1525 = _1515 * 6.283185482025146484375;
        float _1527 = sin(_1525);
        float _1529 = 1.0 / _1521;
        float _1531 = _1523 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = _1527 * _1529;
        float _1537 = _1523 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1543 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1541;
        float _1545 = _1533 * _1535;
        float _1547 = 1.0 / _1543;
        float _1549 = 1.0 / _1545;
        float _1551 = _1539 * _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1555 = fma(_1509, _1551, _1553);
        float _1557 = _1555 * _1547;
        float _1559 = precise::clamp(_1557, 0.0, 1.0);
        _1437 = _1515;
        _1443 = _1559;
    }
    float _1561 = _1437;
    float _1563 = _1443;
    if (!_1331)
    {
        float _1565 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1571 = _1567 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = _1569 * 0.15915493667125701904296875;
        float _1577 = _1567 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        float _1581 = 1.0 / _1573;
        float _1583 = _1575 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1579 * _1581;
        float _1589 = _1575 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = _1585 * _1587;
        float _1595 = 1.0 / _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1599 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1597;
        float _1601 = 1.0 / _1599;
        float _1603 = _1591 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1607 = fma(_1509, _1603, _1605);
        float _1609 = _1607 * _1601;
        float _1611 = precise::clamp(_1609, 0.0, 1.0);
        float _1613 = -_1611;
        float _1615 = _1613 + 1.0;
        _1439 = _1593;
        _1511 = _1615;
    }
    float _1617 = _1439;
    float _1619 = _1511;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1499 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1501 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1503 + _1629;
    float _1633 = _1623 * _1623;
    float _1635 = fma(_1627, _1627, _1633);
    float _1637 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1631, _1631, _1635);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1627 * _1647;
    float _1651 = _1631 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1631;
    float _1669 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1671 = _1657;
    float _1673 = _1665;
    float _1675 = _1633;
    float _1677 = _1623;
    float _1679 = _1617;
    if (_1661)
    {
        float _1681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1681;
    }
    float _1683 = _1667;
    if (!_1661)
    {
        _1669 = _1653;
    }
    float _1685 = _1669;
    float _1687 = _1685;
    if (_1661)
    {
        float _1689 = rsqrt(_1657);
        _1671 = _1689;
    }
    float _1691 = _1671;
    float _1693 = _1691;
    if (_1661)
    {
        float _1695 = _1665 * _1683;
        _1673 = _1695;
    }
    float _1697 = _1673;
    if (_1661)
    {
        float _1699 = _1697 * 0.15915493667125701904296875;
        _1675 = _1699;
    }
    float _1701 = _1675;
    float _1703 = _1683;
    float _1705 = _1701;
    if (_1661)
    {
        float _1707 = _1701 * 6.283185482025146484375;
        float _1709 = sin(_1707);
        _1703 = _1709;
    }
    float _1711 = _1703;
    float _1713 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1715 = precise::max(0.0, _1713);
    float _1717 = _1561;
    float _1719 = _1715;
    if (_1661)
    {
        float _1721 = _1701 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = -_1647;
    float _1729 = -_1715;
    float _1731 = fma(_1623, _1727, _1729);
    if (_1661)
    {
        float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1733;
    }
    float _1735 = _1719;
    if (!_1661)
    {
        _1705 = _1731;
    }
    float _1737 = _1705;
    float _1739 = _1711;
    float _1741 = _1737;
    if (_1661)
    {
        float _1743 = fma(_1711, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1739 = _1743;
    }
    float _1745 = _1739;
    float _1747 = floor(_1637);
    float _1749 = _1745;
    if (_1661)
    {
        float _1751 = _1725 + (-1.0);
        _1677 = _1751;
    }
    float _1753 = _1677;
    float _1755 = _1753;
    if (_1661)
    {
        float _1757 = _1691 * _1745;
        _959 = _1757;
    }
    float _1759 = _959;
    if (!_1661)
    {
        _1749 = _1649;
    }
    float _1761 = _1749;
    float _1763 = _1761;
    if (_1661)
    {
        float _1765 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1679 = _1765;
    }
    float _1767 = _1679;
    if (_1661)
    {
        float _1769 = _1649 * _1759;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (!_1661)
    {
        _1693 = _1651;
    }
    float _1773 = _1693;
    float _1775 = _1773;
    if (_1661)
    {
        float _1777 = _1651 * _1759;
        _1775 = _1777;
    }
    float _1779 = _1775;
    if (_1661)
    {
        float _1781 = fma(_1731, _1725, _1767);
        _1741 = _1781;
    }
    float _1783 = _1741;
    if (_1661)
    {
        float _1785 = _1771 * _1771;
        _1687 = _1785;
    }
    float _1787 = _1687;
    if (!_1661)
    {
        _1755 = _1655;
    }
    float _1789 = _1755;
    float _1791 = _1789;
    if (_1661)
    {
        float _1793 = _1779 * _1779;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1783, _1783, _1787);
    float _1799 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1801 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1803 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1805 = fma(_1163, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1807 = _1797 + _1795;
    float _1809 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1811 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1813 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1801);
    float _1815 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1809);
    float _1817 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1811);
    float _1819 = rsqrt(_1807);
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1823 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1821);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1815);
    float _1829 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1803);
    float _1833 = -_1825;
    float _1835 = _1833 + 1.0;
    float _1837 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1813);
    float _1839 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1843 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1831);
    float _1845 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1847 = abs(_1835);
    float _1849 = log2(_1847);
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1841);
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1855 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1857 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1859 = _1819 * _1771;
    float _1861 = _1819 * _1783;
    float _1863 = floor(_1805);
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1857);
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1869 = _1819 * _1779;
    float _1871 = -_1855;
    float _1873 = fma(_1871, _1639, 1.0);
    float _1875 = -_1747;
    float _1877 = _1637 + _1875;
    float _1879 = -_1867;
    float _1881 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1879);
    float _1883 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1885 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1887 = 1.0 / _1865;
    float _1889 = -_1869;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1881);
    float _1893 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1895 = fma(_1891, -0.5, 0.5);
    float _1897 = fma(_1891, 0.5, 0.5);
    float _1899 = -_1863;
    float _1901 = _1805 + _1899;
    float _1903 = log2(_1873);
    float _1905 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1883);
    float _1907 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1893);
    float _1909 = fma(_1897, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1911 = _1861 + 1.0;
    float _1913 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1915 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1907);
    float _1917 = fma(_1897, _1909, -0.212114393711090087890625);
    float _1919 = exp2(_1885);
    float _1921 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1913);
    float _1923 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1915);
    float _1925 = fma(_1897, _1917, 1.570728778839111328125);
    float _1927 = _1921 * _1887;
    float _1929 = _1923 * _1887;
    float _1931 = sqrt(_1895);
    float _1933 = _1903 * 0.693147182464599609375;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1937 = fma(_1927, 0.5, 0.5);
    float _1939 = -_1861;
    float _1941 = fma(_1919, _1911, _1939);
    float2 _6538 = float2(_1877, _1901);
    float _1943 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6538, float2(0.0), isnan(_6538)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6538, float2(0.0), isnan(_6538)), level(0.0)).x;
    float _1945 = fma(_1941, 0.5, 0.5);
    float _1947 = _1931 * 0.636619746685028076171875;
    float _1949 = fma(_1929, -0.5, 0.5);
    float _1951 = -_1925;
    float _1953 = fma(_1947, _1951, 1.0);
    float3 _6561 = float3(_1937, _1949, _1935);
    float _1955 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6561, float3(0.0), isnan(_6561)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6561, float3(0.0), isnan(_6561)), level(0.0)).x;
    float3 _6572 = float3(_1937, _1949, _1935);
    float4 _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6572, float3(0.0), isnan(_6572)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6572, float3(0.0), isnan(_6572)), level(0.0)).xyzw;
    float _1960 = _1958.x;
    float _1962 = _1958.y;
    float _1964 = _1958.z;
    float _1966 = _1958.w;
    float2 _6588 = float2(_1953, _1945);
    float3 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1980 = int(_1978);
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1984 = _1982 != 0;
    float _1986 = -_901;
    float _1988 = _1986 + 1.0;
    bool _1990 = _593 != 0;
    float _1992 = -_925;
    float _1994 = _1992 + 1.0;
    bool _1996 = _533 > 0.5;
    out.m_68.x = _551;
    int _1998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2000 = _1998 != 0;
    float _2002 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2004 = int(_2002);
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2008 = _2006 != 0;
    float _2010 = -_951;
    float _2012 = _2010 + 1.0;
    int _2014 = abs(_761);
    float _2016 = -_953;
    float _2018 = _2016 + 1.0;
    float _2020 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_70.x = _1501;
    out.m_70.y = _1499;
    out.m_70.z = _1503;
    float _2022 = float(uint(_1980));
    float _2024 = trunc(_889);
    int _2026 = int(_2024);
    int _2028 = ~_1980;
    int _2030 = _2028 + 1;
    float _2032 = float(uint(_2004));
    float _2034 = 1.0 / _2022;
    int _2036 = ~_1980;
    int _2038 = _2036 + 1;
    int _2040 = ~_2004;
    int _2042 = _2040 + 1;
    int _2044 = ~_2004;
    int _2046 = _2044 + 1;
    float _2048 = 1.0 / _2032;
    float _2050 = trunc(_947);
    int _2052 = int(_2050);
    int _2054 = as_type<int>(_2034) + (-2);
    float _2056 = float(uint(_2026));
    int _2058 = ~_2004;
    int _2060 = _2058 + 1;
    int _2062 = as_type<int>(_2048) + (-2);
    float _2064 = as_type<float>(_2054) * _2056;
    float _2066 = exp2(_2020);
    float _2068 = float(uint(_2052));
    float _2070 = trunc(_2064);
    float _2072 = precise::max(_2070, 0.0);
    uint _2075 = uint(_2072);
    float _2077 = as_type<float>(_2062) * _2068;
    float _2079 = -_2066;
    float _2081 = _2079 + 1.0;
    float _2083 = trunc(_2077);
    float _2085 = precise::max(_2083, 0.0);
    uint _2087 = uint(_2085);
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2095 = _2038 * int(_2075);
    int _2097 = _2095 + _2026;
    float _2099 = 1.0 / _2091;
    float _2101 = float(uint(_2097));
    int _2103 = _2060 * int(_2087);
    int _2105 = _2103 + _2052;
    float _2107 = as_type<float>(_2054) * _2101;
    float _2109 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2111 = _531 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2115 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2113;
    float _2117 = float(uint(_2105));
    float _2119 = trunc(_2107);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = _2115 * _2099;
    float _2127 = _2115;
    float _2129 = _2117;
    float _2131 = _2099;
    float _2133 = _1865;
    float _2135 = _1923;
    float _2137 = _1921;
    if (_1984)
    {
        _2127 = 1.0;
    }
    float _2139 = _2127;
    float _2141 = as_type<float>(_2062) * _2117;
    float _2143 = _2139;
    if (!_1984)
    {
        _2143 = 7.345489978790283203125;
    }
    float _2145 = _2143;
    float _2147 = fma(_2125, _2111, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1984)
    {
        _2129 = _533;
    }
    float _2149 = _2129;
    float _2151 = _2149;
    if (_1984)
    {
        _2131 = 1.0;
    }
    float _2153 = _2131;
    float _2155 = trunc(_2141);
    float _2157 = precise::max(_2155, 0.0);
    uint _2159 = uint(_2157);
    float _2161 = _2153;
    if (!_1984)
    {
        _2151 = _535;
    }
    float _2163 = _2151;
    float _2165 = _2145 * _533;
    if (!_1984)
    {
        _2161 = 1.2345600128173828125;
    }
    float _2167 = _2161;
    float _2169 = float(_2026);
    bool _2171 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2173 = isnan(_531);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = _2167 * _2163;
    float _2185 = floor(_2165);
    int _2187 = int(_2075) + int(_2123);
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2191 = _2189 != 0;
    float _2193 = -_2181;
    float _2195 = _2193 + 1.0;
    bool _2197 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2199 = isnan(_531);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2205 = _2201 || _2203;
    float _2207 = float(_2205);
    int _2209 = _2030 * _2187;
    int _2211 = _2209 + _2026;
    int _2213 = int(_2087) + int(_2159);
    float _2215 = floor(_2183);
    float _2217 = float(_1980);
    float _2219 = _2207 * _2195;
    float _2221 = float(_2004);
    int _2223 = _2042 * _2213;
    int _2225 = _2223 + _2052;
    bool _2227 = _2169 >= _2217;
    bool _2229 = isnan(_2169);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(_2217);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = _2147 * _2219;
    float _2241 = -_201;
    int _2243 = _1996 ? as_type<int>(_2241) : as_type<int>(_201);
    float _2245 = -_2185;
    float _2247 = _2165 + _2245;
    float _2249 = float(_2052);
    bool _2251 = !_2191;
    float _2253 = _2251 ? _201 : as_type<float>(_2243);
    float _2255 = trunc(_2237);
    int _2257 = int(_2255);
    bool _2259 = _2249 >= _2221;
    bool _2261 = isnan(_2249);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(_2221);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2273 = uint(_2211) >= uint(_1980);
    float _2275 = _2253 + 0.5;
    bool _2277 = uint(_2225) >= uint(_2004);
    float _2279 = -_2215;
    float _2281 = _2183 + _2279;
    float _2283 = _2247 * _2217;
    float _2285 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[80].x, _605);
    bool _2287 = !_2273;
    int _2289 = _2287 ? 0 : (-1);
    float _2291 = trunc(_2269);
    int _2293 = int(_2291);
    bool _2295 = !_2277;
    int _2297 = _2295 ? 0 : (-1);
    float _2299 = _2217 * _547;
    int _2301 = ~_2187;
    int _2303 = _2301 + _2289;
    int _2305 = _2303 + 1;
    float _2307 = -_1988;
    float _2309 = fma(_2253, _2307, _2285);
    int _2311 = ~_2213;
    int _2313 = _2311 + _2297;
    int _2315 = _2313 + 1;
    float _2317 = _2221 * _547;
    bool _2319 = _1980 == 0;
    int _2321 = _1980 * _2305;
    int _2323 = _2321 + _2026;
    float _2325 = trunc(_2283);
    int _2327 = int(_2325);
    int _2329 = _2004 * _2315;
    int _2331 = _2329 + _2052;
    bool _2333 = _2004 == 0;
    bool _2335 = !_2319;
    int _2337 = _2335 ? _2323 : (-1);
    bool _2339 = !_2333;
    int _2341 = _2339 ? _2331 : (-1);
    float _2343 = _2281 * _2221;
    int _2345 = ~_2293;
    int _2347 = _2345 + 1;
    int _2349 = _2347 + 1;
    float _2351 = trunc(_2317);
    int _2353 = int(_2351);
    bool _2355 = !_2008;
    int _2357 = _2355 ? 0 : 1;
    int _2359 = ~_2257;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    int _2365 = _2341 * _2349;
    int _2367 = abs(_2357);
    int _2369 = _1980 + (-1);
    int _2371 = _2337 * _2363;
    int _2373 = abs(_751);
    float _2375 = trunc(_2343);
    int _2377 = int(_2375);
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2381 = _2379 != 0;
    int _2383 = _2327 * _2367;
    int _2385 = _2383 + _2026;
    int _2387 = _2004 + (-1);
    int _2389 = _2257 * _2369;
    int _2391 = _2389 + _2371;
    bool _2393 = !_2381;
    int _2395 = _2393 ? 0 : 1;
    int _2397 = abs(_1069);
    int _2399 = _2293 * _2387;
    int _2401 = _2399 + _2365;
    int _2403 = abs(_1061);
    float _2405 = trunc(_2299);
    int _2407 = int(_2405);
    float _2409 = float(uint(_2385));
    int _2411 = _2391 * _2373;
    int _2413 = abs(_2395);
    int _2415 = _2401 * _2403;
    int _2417 = abs(_755);
    float _2419 = as_type<float>(_2054) * _2409;
    float _2421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2423 = _2377 * _2413;
    int _2425 = _2423 + _2052;
    int _2427 = _2353 * _2397;
    int _2429 = _2427 + _2415;
    int _2431 = ~_1980;
    int _2433 = _2431 + 1;
    float _2435 = trunc(_2419);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    float _2441 = float(uint(_2425));
    int _2443 = _2407 * _2417;
    int _2445 = _2443 + _2411;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2449 = _2447 != 0;
    float _2451 = -_217;
    int _2453 = _1990 ? as_type<int>(_2451) : as_type<int>(_217);
    float _2455 = as_type<float>(_2062) * _2441;
    bool _2457 = !_2000;
    int _2459 = _2457 ? 0 : 1;
    int _2461 = _2385 * _2014;
    int _2463 = _2461 + _2445;
    int _2465 = abs(_1073);
    float _2467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2469 = abs(_2459);
    int _2471 = abs(_1077);
    int _2473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2475 = _2473 != 0;
    int _2477 = _2433 * int(_2439);
    int _2479 = _2477 + _2385;
    bool _2481 = !_2449;
    float _2483 = _2481 ? _217 : as_type<float>(_2453);
    float _2485 = trunc(_2455);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = float(uint(_2479));
    int _2493 = _2425 * _2465;
    int _2495 = _2493 + _2429;
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2499 = _2497 != 0;
    int _2501 = _2327 * _2469;
    int _2503 = _2501 + _2463;
    float _2505 = _2483 + (-0.5);
    float _2507 = abs(_1509);
    float _2509 = log2(_2507);
    int _2511 = ~_2004;
    int _2513 = _2511 + 1;
    float _2515 = as_type<float>(_2054) * _2491;
    float _2517 = float(uint(_2503));
    float _2519 = -_2505;
    float _2521 = -_783;
    float _2523 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2521);
    int _2525 = _2377 * _2471;
    int _2527 = _2525 + _2495;
    float _2529 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2531 = as_type<float>(_2054) * _2517;
    float _2533 = fma(_2483, _1994, _2523);
    float _2535 = float(uint(_2527));
    float _2537 = -_2207;
    float _2539 = _2537 + 1.0;
    int _2541 = ~_1980;
    int _2543 = _2541 + 1;
    int _2545 = _2513 * int(_2489);
    int _2547 = _2545 + _2425;
    float _2549 = trunc(_2531);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    float _2555 = as_type<float>(_2062) * _2535;
    float _2557 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2239);
    float _2559 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2561 = float(uint(_2547));
    out.m_72.x = _2309;
    out.m_72.y = _2533;
    float _2563 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2557);
    float _2565 = trunc(_2555);
    float _2567 = precise::max(_2565, 0.0);
    uint _2569 = uint(_2567);
    float _2571 = as_type<float>(_2062) * _2561;
    float _2573 = _2467 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2575 = _2563 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2577 = _677 + 0.5;
    int _2579 = _2543 * int(_2553);
    int _2581 = _2579 + _2503;
    float _2583 = exp2(_2559);
    float _2585 = _681 + (-0.5);
    float _2587 = fma(_2529, _2577, _957);
    out.m_74.w = _2575;
    float _2589 = float(uint(_2581));
    float _2591 = -_2573;
    float _2593 = -_867;
    float _2595 = fma(_2591, _2585, _2593);
    int _2597 = _2046 * int(_2569);
    int _2599 = _2597 + _2527;
    float _2601 = trunc(_2515);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    int _2607 = ~_1980;
    int _2609 = _2607 + 1;
    float _2611 = as_type<float>(_2054) * _2589;
    float _2613 = -_2012;
    float _2615 = fma(_677, _2613, _2587);
    float _2617 = float(uint(_2599));
    float _2619 = fma(_681, _2018, _2595);
    int _2621 = ~_1980;
    int _2623 = _2621 + 1;
    float _2625 = trunc(_2571);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    float _2631 = as_type<float>(_2062) * _2617;
    float _2633 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    int _2637 = ~_2004;
    int _2639 = _2637 + 1;
    out.m_76.x = _2615;
    out.m_76.y = _2619;
    float _2641 = trunc(_2611);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = int(_2439) + int(_2605);
    int _2649 = ~_2004;
    int _2651 = _2649 + 1;
    int _2653 = _2609 * _2647;
    int _2655 = _2653 + _2385;
    float _2657 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = trunc(_2631);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    int _2665 = int(_2489) + int(_2629);
    float _2667 = fma(_2635, -2.0, 3.0);
    bool _2669 = uint(_2655) >= uint(_1980);
    float _2671 = _2635 * _2635;
    float _2673 = -_1943;
    float _2675 = _2673 + 1.0;
    int _2677 = _2639 * _2665;
    int _2679 = _2677 + _2425;
    bool _2681 = !_2669;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = _2671 * _2667;
    int _2687 = int(_2553) + int(_2645);
    bool _2689 = uint(_2679) >= uint(_2004);
    float _2691 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2693 = ~_2647;
    int _2695 = _2693 + _2683;
    int _2697 = _2695 + 1;
    int _2699 = _2623 * _2687;
    int _2701 = _2699 + _2503;
    float _2703 = _2093 * _1955;
    int _2705 = int(_2569) + int(_2663);
    float _2707 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2709 = -_1093;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2691);
    bool _2713 = uint(_2701) >= uint(_1980);
    float _2715 = -_2093;
    float _2717 = _2715 + 1.0;
    float _2719 = -_1093;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2707);
    int _2723 = _2651 * _2705;
    int _2725 = _2723 + _2527;
    bool _2727 = !_2713;
    int _2729 = _2727 ? 0 : (-1);
    float _2731 = -_1093;
    float _2733 = fma(_2731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    bool _2735 = !_2689;
    int _2737 = _2735 ? 0 : (-1);
    float _2739 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2721);
    bool _2741 = uint(_2725) >= uint(_2004);
    float _2743 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2745 = ~_2687;
    int _2747 = _2745 + _2729;
    int _2749 = _2747 + 1;
    float _2751 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2711);
    int _2753 = ~_2665;
    int _2755 = _2753 + _2737;
    int _2757 = _2755 + 1;
    float _2759 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2743);
    bool _2761 = !_2741;
    int _2763 = _2761 ? 0 : (-1);
    int _2765 = _1980 * _2749;
    int _2767 = _2765 + _2503;
    float _2769 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2771 = _1980 * _2697;
    int _2773 = _2771 + _2385;
    int _2775 = ~_2705;
    int _2777 = _2775 + _2763;
    int _2779 = _2777 + 1;
    float _2781 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2783 = !_2319;
    int _2785 = _2783 ? _2767 : (-1);
    float _2787 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2789 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2733);
    float _2791 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2781);
    float _2793 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2795 = _2785 >> 31;
    float _2797 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2787);
    int _2799 = _2004 * _2779;
    int _2801 = _2799 + _2527;
    float _2803 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    int _2805 = _2795 & 3;
    float _2807 = -_2685;
    float _2809 = _2807 + 1.0;
    int _2811 = _2785 & 3;
    bool _2813 = _2811 != 0;
    float _2815 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2769);
    bool _2817 = !_2333;
    int _2819 = _2817 ? _2801 : (-1);
    float _2821 = fma(_2809, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2685);
    int _2823 = _2785 + _2805;
    float _2825 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2827 = _2819 >> 31;
    float _2829 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2803);
    int _2831 = _2823 >> 2;
    float _2833 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2825);
    bool _2835 = uint(_2811) >= 2u;
    float _2837 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2815);
    int _2839 = _2827 & 3;
    float _2841 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    int _2843 = _2831 << 4;
    int _2845 = _2843 + 368;
    float _2847 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2797);
    int _2849 = _2785 & 3;
    bool _2851 = _2849 != 0;
    float _2853 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2855 = _2819 + _2839;
    uint _2857 = uint(int(uint(_2845) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c9)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = _2835 ? 0 : 1;
    float _2875 = _2853 * _2739;
    bool _2877 = _2811 != 3;
    float _2879 = _2853 * _2751;
    int _2881 = _2851 ? 0 : 1;
    int _2883 = _2004 * _2757;
    int _2885 = _2883 + _2425;
    bool _2887 = uint(_2811) > 1u;
    int _2889 = _2855 >> 2;
    bool _2891 = _1509 <= 8000.0;
    bool _2893 = isnan(_1509);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan(8000.0);
    bool _2899 = _2895 || _2897;
    float _2901 = float(_2899);
    int _2903 = _2889 << 4;
    int _2905 = _2903 + 512;
    int _2907 = ~_2873;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = _2901 * _2821;
    uint _2915 = uint(int(uint(_2905) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = _2911;
    if (_2877)
    {
        int _2933 = ~_2873;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2791);
    int _2941 = ~_2881;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    float _2947 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2759);
    int _2949 = _2945;
    if (!_2887)
    {
        int _2951 = ~_2881;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    float _2957 = fma(_2271, _2939, _2875);
    bool _2959 = !_2813;
    int _2961 = _2959 ? 0 : 1;
    int _2963 = _2845 + 8;
    uint _2965 = uint(int(uint(_2963) >> uint(2)));
    uint _2967 = uint(int(uint(int(_2965)) >> uint(2)));
    int _2969 = int(_2965) & 3;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[int(_2967)][_2969];
    int _2973 = int(_2965) + 1;
    uint _2975 = uint(int(uint(_2973) >> uint(2)));
    int _2977 = _2973 & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    int _2981 = _2819 & 3;
    bool _2983 = _2981 != 0;
    out.m_78.x = _2939;
    out.m_78.y = _2947;
    out.m_78.z = _2847;
    int _2985 = _2819 & 3;
    bool _2987 = _2985 != 0;
    float _2989 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2991 = uint(_2981) > 1u;
    int _2993 = _2987 ? 0 : 1;
    int _2995 = _2905 + 8;
    uint _2997 = uint(int(uint(_2995) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = abs(_2955);
    float _3015 = fma(_2271, _2947, _2879);
    bool _3017 = !_2983;
    int _3019 = _3017 ? 0 : 1;
    float _3021 = _2675 * _2989;
    float _3023 = precise::clamp(_3021, 0.0, 1.0);
    bool _3025 = _2981 != 3;
    float _3027 = _1976 * _2703;
    int _3029 = ~_2993;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = _1966 * _2717;
    bool _3037 = uint(_2981) >= 2u;
    int _3039 = _3033;
    if (!_2991)
    {
        int _3041 = ~_2993;
        int _3043 = _3041 + 1;
        _3039 = _3043;
    }
    int _3045 = _3039;
    int _3047 = ~_3013;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = abs(_2961);
    int _3055 = abs(_3045);
    int _3057 = _3051 * as_type<int>(_2871);
    int _3059 = _3037 ? 0 : 1;
    int _3061 = ~_3059;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = ~_3053;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = _3065;
    if (_3025)
    {
        int _3075 = ~_3059;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    int _3081 = abs(_3019);
    int _3083 = _3071 * as_type<int>(_2863);
    int _3085 = _3083 + _3057;
    int _3087 = ~_3055;
    int _3089 = _3087 + 1;
    int _3091 = _3089 + 1;
    float _3093 = _1921 + _1865;
    int _3095 = abs(_2937);
    int _3097 = abs(_3079);
    int _3099 = _3091 * as_type<int>(_2929);
    int _3101 = ~_3081;
    int _3103 = _3101 + 1;
    int _3105 = _3103 + 1;
    float _3107 = _3093 * 0.5;
    int _3109 = ~_3095;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = fma(_2853, _2853, 1.0);
    bool _3117 = _2811 != 3;
    int _3119 = _3105 * as_type<int>(_2921);
    int _3121 = _3119 + _3099;
    int _3123 = ~_3097;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _3113 * as_type<int>(_2971);
    int _3131 = _3129 + _3085;
    bool _3133 = _2981 != 3;
    float _3135 = rsqrt(_3115);
    bool _3137 = !_3117;
    int _3139 = _3137 ? 0 : (-1);
    int _3141 = _3127 * as_type<int>(_3003);
    int _3143 = _3141 + _3121;
    bool _3145 = !_3133;
    int _3147 = _3145 ? 0 : (-1);
    bool _3149 = !_2499;
    int _3151 = _3149 ? 0 : 1;
    int _3153 = abs(_3139);
    bool _3155 = !_2475;
    int _3157 = _3155 ? 0 : 1;
    int _3159 = abs(_3147);
    int _3161 = abs(_3151);
    int _3163 = abs(_3157);
    float _3165 = _2853 * _2789;
    int _3167 = ~_3153;
    int _3169 = _3167 + 1;
    int _3171 = _3169 + 1;
    float _3173 = _2853 * _3135;
    int _3175 = ~_3159;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    float _3181 = fma(_2271, _2847, _3165);
    int _3183 = ~_3161;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    int _3189 = _3171 * as_type<int>(_2979);
    int _3191 = _3189 + _3131;
    int _3193 = ~_3163;
    int _3195 = _3193 + 1;
    int _3197 = _3195 + 1;
    int _3199 = _3179 * as_type<int>(_3011);
    int _3201 = _3199 + _3143;
    bool _3203 = !_2319;
    int _3205 = _3203 ? _2773 : (-1);
    int _3207 = _3191 * _3187;
    bool _3209 = !_2333;
    int _3211 = _3209 ? _2885 : (-1);
    int _3213 = _3201 * _3197;
    float _3215 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3217 = _3205 * _3161;
    int _3219 = _3217 + _3207;
    float _3221 = in.m_80.x;
    int _3223 = _3211 * _3163;
    int _3225 = _3223 + _3213;
    float _3227 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3215);
    float _3229 = -_2829;
    float _3231 = _3173 * _3229;
    float _3233 = -_2837;
    float _3235 = _3173 * _3233;
    float _3237 = -_2841;
    float _3239 = _3173 * _3237;
    float _3241 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3227);
    float _3243 = _2829 + _2957;
    float _3245 = fma(_3135, _2739, _3231);
    float _3247 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3241);
    float _3249 = fma(_3135, _2751, _3235);
    float _3251 = fma(_3135, _2789, _3239);
    float _3253 = _3247 + _1865;
    float _3255 = -_3023;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3259 = _1865 * 0.5;
    float _3261 = _3253 * 0.5;
    float _3263 = _2837 + _3015;
    float _3265 = fma(_1923, -0.5, _3259);
    float _3267 = _2841 + _3181;
    float _3269 = fma(_1966, _3027, _1964);
    float _3271 = _3257 * _3221;
    out.m_82.x = _3245;
    out.m_82.y = _3249;
    out.m_82.z = _3251;
    bool _3273 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3275 = isnan(_1645);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3281 = _3277 || _3279;
    float _3283 = _1563 * _1619;
    float _3285 = _3271 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.z = _3261;
    out.m_84.w = _1865;
    float _3287 = float(_3219);
    float _3289 = float(_3225);
    out.m_86.x = _3107;
    out.m_86.y = _3265;
    out.m_86.z = _3261;
    out.m_86.w = _1865;
    out.m_88.x = _3285;
    float _3291 = _1966 * _2703;
    out.m_90.x = _3243;
    out.m_90.y = _3263;
    out.m_90.z = _3267;
    float _3293 = fma(_1972, _3291, _1960);
    float _3295 = fma(_1974, _3291, _1962);
    out.m_92.x = _3287;
    out.m_92.y = _3289;
    float _3297 = _3283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3299 = _3283;
    float _3301 = _3287;
    float _3303 = _3247;
    if (!_3281)
    {
        _3299 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3305 = _3299;
    out.m_94.x = _3293;
    out.m_94.y = _3295;
    out.m_94.z = _3269;
    out.m_94.w = _3035;
    out.gl_Position.x = _1921;
    out.gl_Position.y = _1923;
    out.gl_Position.z = _3247;
    out.gl_Position.w = _1865;
    float _3307 = _3305;
    float _3309 = _3305;
    if (!_3281)
    {
        _3301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3311 = _3301;
    float _3313 = _3311;
    float _3315 = _3311;
    if (!_3281)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3317 = _2133;
    float _3319 = _3317;
    float _3321 = _3317;
    if (!_3281)
    {
        _3303 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3323 = _3303;
    float _3325 = _3323;
    float _3327 = _3323;
    if (!_3281)
    {
        _2135 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3329 = _2135;
    float _3331 = _3329;
    float _3333 = _3329;
    if (!_3281)
    {
        _2137 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3335 = _2137;
    bool _3337 = !_3281;
    float _3339 = _3335;
    float _3341 = _3335;
    if (!_3337)
    {
        bool _3343 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3345 = isnan(_1645);
        bool _3347 = _3343 || _3345;
        bool _3349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3351 = _3347 || _3349;
        if (!_3351)
        {
            float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3355 = _1645 + _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3359 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3357;
            float _3361 = 1.0 / _3359;
            float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3383 = _3355 * _3361;
            float _3385 = precise::clamp(_3383, 0.0, 1.0);
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3391 = fma(_3385, _3365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3393 = fma(_3385, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3395 = fma(_3385, _3369, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3397 = fma(_3385, _3373, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3399 = fma(_3385, _3377, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3401 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3321 = _3393;
            _3341 = _3399;
            _3315 = _3391;
            _3333 = _3397;
            _3327 = _3395;
            _3309 = _3401;
            _3403 = true;
        }
        else
        {
            bool _3405 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3407 = isnan(_1645);
            bool _3409 = _3405 || _3407;
            bool _3411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3413 = _3409 || _3411;
            if (!_3413)
            {
                _3313 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3415 = _3313;
            _3315 = _3415;
            if (!_3413)
            {
                _3319 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3417 = _3319;
            _3321 = _3417;
            if (!_3413)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3419 = _3325;
            _3327 = _3419;
            if (!_3413)
            {
                _3331 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3421 = _3331;
            _3333 = _3421;
            if (!_3413)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3423 = _3339;
            _3341 = _3423;
            if (!_3413)
            {
                _3307 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3425 = _3307;
            bool _3427 = !_3413;
            _3309 = _3425;
            if (!_3427)
            {
                bool _3429 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3431 = isnan(_1645);
                bool _3433 = _3429 || _3431;
                bool _3435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3437 = _3433 || _3435;
                if (!_3437)
                {
                    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3441 = _1645 + _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3445 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3443;
                    float _3447 = 1.0 / _3445;
                    float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3451 = _3449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3457 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3459 = _3457 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3463 = _3461 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3467 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3469 = _3441 * _3447;
                    float _3471 = precise::clamp(_3469, 0.0, 1.0);
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3477 = fma(_3471, _3451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3479 = fma(_3471, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3481 = fma(_3471, _3455, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3483 = fma(_3471, _3459, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3485 = fma(_3471, _3463, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3487 = fma(_3471, _3467, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3321 = _3479;
                    _3341 = _3485;
                    _3315 = _3477;
                    _3333 = _3483;
                    _3327 = _3481;
                    _3309 = _3487;
                    _3403 = true;
                }
                else
                {
                    _3321 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3315 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3333 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3309 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3403 = false;
    float _3489 = _3321;
    float _3491 = _3341;
    float _3493 = _3315;
    float _3495 = _3333;
    float _3497 = _3327;
    float _3499 = _3309;
    float _3501 = _3297 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3503 = fma(_3263, -0.5, 0.5);
    float _3505 = precise::clamp(_3503, 0.0, 1.0);
    float _3507 = -_3489;
    float _3509 = _3507 + _3491;
    float _3511 = -_3493;
    float _3513 = _3511 + _3495;
    out.m_49.x = _3501;
    float _3515 = fma(_3505, _3509, _3489);
    float _3517 = -_3497;
    float _3519 = _3517 + _3499;
    float _3521 = fma(_3505, _3513, _3493);
    float _3523 = _3515 * 0.586610972881317138671875;
    bool _3525 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3527 = fma(_3505, _3519, _3497);
    out.m_96.x = 0.0;
    float _3529 = fma(_3521, 0.298911988735198974609375, _3523);
    bool _3531 = _1563 > 0.0;
    bool _3533 = isnan(_1563);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan(0.0);
    bool _3539 = _3535 || _3537;
    float _3541 = fma(_3527, 0.114477999508380889892578125, _3529);
    bool _3543 = _1619 <= 0.0;
    bool _3545 = !_3539;
    bool _3547 = _3543 || _3545;
    float _3549 = -_3541;
    float _3551 = _3521 + _3549;
    float _3553 = -_3541;
    float _3555 = _3515 + _3553;
    float _3557 = -_3541;
    float _3559 = _3527 + _3557;
    float _3561 = fma(_3551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3563 = fma(_3555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3565 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    bool _3567 = !_3525;
    if (!_3567)
    {
        float _3569 = -_1499;
        float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3573 = -_1501;
        float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3577 = -_1503;
        float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3581 = _3571 * _3571;
        float _3583 = fma(_3575, _3575, _3581);
        float _3585 = fma(_3579, _3579, _3583);
        float _3587 = sqrt(_3585);
        float _3589 = rsqrt(_3585);
        float _3591 = -_3587;
        float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3597 = precise::clamp(_3595, 0.0, 1.0);
        float _3599 = _3575 * _3589;
        float _3601 = _3571 * _3589;
        float _3603 = abs(_3597);
        float _3605 = log2(_3603);
        float _3607 = _3579 * _3589;
        float _3609 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3611 = _3263 * _3601;
        float _3613 = -_3601;
        float _3615 = -_3609;
        float _3617 = fma(_3613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3615);
        float _3619 = fma(_3243, _3599, _3611);
        float _3621 = -_3607;
        float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3617);
        float _3625 = fma(_3267, _3607, _3619);
        float _3627 = precise::clamp(_3625, 0.0, 1.0);
        float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3631 = _3623 + _3629;
        float _3633 = _3605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3635 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3637 = precise::clamp(_3635, 0.0, 1.0);
        float _3639 = exp2(_3633);
        float _3641 = _3639 * _3637;
        float _3643 = _3627 * _3641;
        float _3645 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3647 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3649 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3645;
        out.m_96.y = _3647;
        out.m_96.z = _3649;
    }
    out.m_98.x = _3561;
    out.m_98.y = _3563;
    out.m_98.z = _3565;
    if (!_3547)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3651;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3403 = false;
    bool _435 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_117);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_133);
        out.gl_Position.z = _3708;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _141;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _165 = _141 * _159;
    int _167 = 0;
    float _169 = _165;
    if (_157)
    {
        float _171 = _163 * 5.0;
        _167 = as_type<int>(_171);
    }
    int _173 = _167;
    out.m_53.x = _165;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3780 = as_type<float>(_173);
        out.gl_Position.z = _3780;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _215 = !_189;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_60.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _165;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = 1.0 / _249;
    bool _261 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _263 = isnan(_241);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _253;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _257;
    float _283 = _245 * _259;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _241 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = _241 + _289;
    float _293 = fma(_279, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _295 = _287 * _275;
    bool _297 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_241);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    float _317 = fma(_311, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = _291 * _281;
    float _321 = -_271;
    float _323 = _321 + 1.0;
    bool _325 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_241);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _307 * _323;
    bool _339 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_241);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = _335 * _315;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = -_335;
    float _363 = _361 + 1.0;
    float _365 = fma(_355, _295, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _369 = _349 * _363;
    float _371 = in.m_62.x;
    float _373 = in.m_62.y;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    float _379 = _293 * _369;
    float _381 = _317 * _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _399 = fma(_365, _351, _391);
    float _401 = fma(_367, _351, _393);
    float _403 = fma(_395, _337, _399);
    float _405 = fma(_397, _337, _401);
    float _407 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    float _411 = _407 * _371;
    float _413 = _409 * _373;
    bool _415 = !_273;
    float _433;
    if (!_415)
    {
        float _417 = in.m_60.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _165;
    }
    _435 = false;
    float _437 = _433;
    bool _439 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_437);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _455 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_437);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _473 = 1.0 / _453;
    float _475 = -_449;
    float _477 = _475 + 1.0;
    float _479 = _465 * _477;
    float _481 = -_465;
    float _483 = _481 + 1.0;
    float _485 = _469 * _473;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _437 + _487;
    float _491 = fma(_485, _489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _495 = _491 * _479;
    float _497 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _495);
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _503 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[116].x, _497);
    float _505 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = _501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _511 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _505;
    out.m_64.y = _507;
    out.m_64.z = _509;
    out.m_64.w = _511;
    bool _513 = !_471;
    if (!_513)
    {
        float _515 = in.m_60.x;
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _519 = _515 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _169 = _529;
    }
    float _531 = _169;
    float _533 = in.m_60.x;
    float _535 = in.m_60.y;
    float _537 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _539 = log2(_537);
    float _541 = in.m_60.z;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _545 = _543 != 0;
    float _547 = _159 * _141;
    float _549 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _551 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = _533 * 2.0;
    float _557 = _535 * 2.0;
    bool _559 = _535 > 0.5;
    float _561 = _533 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _563 = _541 * 2.0;
    float _565 = floor(_557);
    int _567 = int(_471);
    int _569 = _189 ? 2 : 0;
    int _571 = _567 | _569;
    int _573 = _191 ? 4 : 0;
    int _575 = _571 | _573;
    int _577 = _545 ? 8 : 0;
    int _579 = _575 | _577;
    int _581 = false ? 16 : 0;
    int _583 = _579 | _581;
    int _585 = false ? 32 : 0;
    int _587 = _583 | _585;
    int _589 = _559 ? 64 : 0;
    int _591 = _587 | _589;
    int _593 = _591 & 64;
    float _595 = -_553;
    float _597 = fma(_561, 2.0, _595);
    float _599 = _535 + _533;
    float _601 = _535 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _603 = -_141;
    float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[76].x, _597);
    float _607 = _599 + (-1.0);
    float _609 = floor(_555);
    float _611 = -_201;
    int _613 = _559 ? as_type<int>(_611) : as_type<int>(_201);
    float _615 = floor(_563);
    bool _617 = _609 > 0.0;
    bool _619 = _609 >= 0.0;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    int _629 = int(_617);
    int _631 = _189 ? 2 : 0;
    int _633 = _629 | _631;
    int _635 = _627 ? 4 : 0;
    int _637 = _633 | _635;
    int _639 = _545 ? 8 : 0;
    int _641 = _637 | _639;
    int _643 = false ? 16 : 0;
    int _645 = _641 | _643;
    int _647 = false ? 32 : 0;
    int _649 = _645 | _647;
    int _651 = _559 ? 64 : 0;
    int _653 = _649 | _651;
    int _655 = _653 & 8;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _663 = _661 != 0;
    bool _665 = _541 > 0.5;
    int _667 = _655;
    if (_545)
    {
        _667 = 0;
    }
    int _669 = _667;
    float _671 = -_217;
    int _673 = _665 ? as_type<int>(_671) : as_type<int>(_217);
    bool _675 = !_659;
    float _677 = _675 ? _201 : as_type<float>(_613);
    bool _679 = !_663;
    float _681 = _679 ? _217 : as_type<float>(_673);
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _689 = _687 != 0;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _693 = _691 != 0;
    int _695 = _669;
    if (!_545)
    {
        _695 = 2;
    }
    int _697 = _695;
    bool _699 = _565 >= 0.0;
    bool _701 = isnan(_565);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    int _709 = _627 ? 0 : 1;
    int _711 = _707 ? 0 : 1;
    bool _713 = _697 != 2;
    float _715 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _717 = int(_715);
    int _719 = ~_709;
    int _721 = _719 + 1;
    int _723 = _721 + 1;
    int _725 = _723;
    if (!_617)
    {
        int _727 = ~_709;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    bool _733 = _615 > 0.0;
    bool _735 = _615 >= 0.0;
    bool _737 = isnan(_615);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _747 = int(_745);
    bool _749 = !_689;
    int _751 = _749 ? 0 : 1;
    bool _753 = !_685;
    int _755 = _753 ? 0 : 1;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _759 = !_693;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_601, -2.0, _757);
    int _765 = _743 ? 0 : 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _777 = _775 != 0;
    float _779 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _781 = _565 > 0.0;
    float _783 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _763);
    float _785 = float(_717);
    int _787 = ~_765;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    float _793 = _757;
    float _795 = as_type<float>(_717);
    int _797 = _791;
    if (_713)
    {
        _793 = _533;
    }
    float _799 = _793;
    float _801 = 1.0 / _785;
    float _803 = _799;
    if (_713)
    {
        _795 = _535;
    }
    float _805 = _795;
    bool _807 = !_769;
    int _809 = _807 ? 0 : 1;
    float _811 = _805;
    if (!_733)
    {
        int _813 = ~_765;
        int _815 = _813 + 1;
        _797 = _815;
    }
    int _817 = _797;
    if (!_713)
    {
        _803 = _541;
    }
    float _819 = _803;
    if (!_713)
    {
        _811 = _533;
    }
    float _821 = _811;
    float _823 = _819 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _827 = abs(_809);
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _831 = ~_711;
    int _833 = _831 + 1;
    int _835 = _833 + 1;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _839 = _835;
    if (!_781)
    {
        int _841 = ~_711;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = _539 * _141;
    float _849 = float(_817);
    float _851 = -_829;
    float _853 = fma(_823, 2.0, _851);
    float _855 = fma(_825, -2.0, _837);
    float _857 = float(_827);
    float _859 = in.m_66.x;
    float _861 = in.m_66.y;
    float _863 = in.m_66.z;
    float _865 = exp2(_847);
    float _867 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _855);
    float _869 = _857 * _849;
    bool _871 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _873 = isnan(1.0);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _879 = _875 || _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _883 = 1.0 + _881;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _887 = float(_747);
    float _889 = _801 * _141;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _893 = 1.0 / _887;
    float _895 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[78].z, _885);
    float _897 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[78].w, _891);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _901 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _895);
    float _903 = -_865;
    float _905 = _903 + 1.0;
    bool _907 = !_773;
    int _909 = _907 ? 0 : 1;
    float _911 = 1.0 / _883;
    bool _913 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _921 = _917 || _919;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _925 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _897);
    float _927 = _869 * (-2.0);
    int _929 = abs(_909);
    float _931 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[88].z, _899);
    float _933 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[88].w, _923);
    float _935 = _921 ? _905 : 0.0;
    float _937 = _533 + (-0.5);
    float _939 = float(_731);
    float _941 = fma(_927, _859, _859);
    bool _943 = !_777;
    int _945 = _943 ? 0 : 1;
    float _947 = _893 * _141;
    float _949 = float(_929);
    float _951 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _931);
    float _953 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _933);
    float _955 = -_141;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[86].x, _853);
    float _959 = _869;
    if (_879)
    {
        float _961 = _935 * _911;
        _161 = _961;
    }
    float _963 = _161;
    float _965 = fma(_779, _927, _779);
    float _967 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _941);
    int _969 = abs(_945);
    float _971 = _949 * _939;
    float _973 = _535 + _541;
    float _975 = fma(_965, _963, _967);
    float _977 = float(_845);
    float _979 = _971 * (-2.0);
    float _981 = float(_969);
    float _983 = _973 + (-1.0);
    float _985 = fma(_979, _861, _861);
    float _987 = _975 * 0.15915493667125701904296875;
    float _989 = _981 * _977;
    float _991 = _535 + (-0.5);
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _995 = _541 + _533;
    float _997 = _989 * (-2.0);
    float _999 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _985);
    float _1001 = _995 + (-1.0);
    float _1003 = fma(_997, _863, _863);
    float _1005 = _541 + (-0.5);
    float _1007 = fma(_993, _979, _993);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1011 = _987 * 6.283185482025146484375;
    float _1013 = cos(_1011);
    float _1015 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1003);
    float _1017 = fma(_1007, _963, _999);
    float _1019 = fma(_1009, _997, _1009);
    float _1021 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1023 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _1025 = _1017 * 0.15915493667125701904296875;
    float _1027 = fma(_1019, _963, _1015);
    float _1029 = _987 * 6.283185482025146484375;
    float _1031 = sin(_1029);
    float _1033 = _549 * _1021;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1037 = _1035 != 0;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1045 = _1043 != 0;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1049 = _1047 != 0;
    float _1051 = _1027 * 0.15915493667125701904296875;
    float _1053 = in.m_46.x;
    float _1055 = in.m_46.y;
    float _1057 = in.m_46.z;
    bool _1059 = !_1041;
    int _1061 = _1059 ? 0 : 1;
    float _1063 = _1025 * 6.283185482025146484375;
    float _1065 = sin(_1063);
    bool _1067 = !_1037;
    int _1069 = _1067 ? 0 : 1;
    bool _1071 = !_1045;
    int _1073 = _1071 ? 0 : 1;
    bool _1075 = !_1049;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = _1025 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    float _1083 = _1051 * 6.283185482025146484375;
    float _1085 = cos(_1083);
    float _1087 = _1013 * _1065;
    float _1089 = _1031 * _1065;
    float _1091 = _1051 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = _1013 * _1081;
    float _1097 = _1031 * _1081;
    float _1099 = _1013 * _1085;
    float _1101 = _1031 * _1085;
    float _1103 = _1081 * _1085;
    float _1105 = _1065 * _1085;
    float _1107 = _551 * _1023;
    float _1109 = _1099 * _1033;
    float _1111 = fma(_1093, _1095, _1089);
    float _1113 = -_1087;
    float _1115 = fma(_1093, _1097, _1113);
    float _1117 = -_1033;
    float _1119 = _1093 * _1117;
    float _1121 = -_1097;
    float _1123 = fma(_1093, _1087, _1121);
    float _1125 = _1101 * _1033;
    float _1127 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1129 = fma(_1111, _1107, _1109);
    float _1131 = fma(_1093, _1089, _1095);
    float _1133 = fma(_1103, _1107, _1119);
    float _1135 = fma(_1115, _1107, _1125);
    float _1137 = fma(_1123, _1127, _1129);
    float _1139 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1141 = fma(_1105, _1127, _1133);
    float _1143 = fma(_1131, _1127, _1135);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1147 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1139);
    float _1149 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1151 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1145);
    float _1155 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1147);
    float _1157 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1149);
    float _1159 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1151);
    float _1161 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1163 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1165 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1157);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1159);
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1171 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1175 = _1167 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1177 = _1163 + _1169;
    float _1179 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1171);
    float _1181 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1183 = _1173 + _1175;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1187 = _1177 + _1185;
    float _1189 = fma(_1057, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1179);
    float _1191 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1183 + _1193;
    float _1197 = _1187 * _1187;
    float _1199 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1191);
    float _1201 = fma(_1195, _1195, _1197);
    float _1203 = _1189 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1205 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1207 = sqrt(_1201);
    float _1209 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1211 = _1203 + _1205;
    float _1213 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1209);
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    bool _1217 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1219 = _1213;
    float _1221 = _1057;
    float _1223 = _1183;
    if (!_1217)
    {
        _1219 = _1183;
    }
    float _1225 = _1219;
    float _1227 = _1225;
    if (!_1217)
    {
        _1221 = _1177;
    }
    float _1229 = _1221;
    float _1231 = _1229;
    if (!_1217)
    {
        _1223 = _1211;
    }
    float _1233 = _1223;
    bool _1235 = !_1217;
    float _1237 = _1233;
    if (!_1235)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1243 = _1207 + _1241;
        float _1245 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = rsqrt(_1201);
        float _1249 = _1243 * _1239;
        float _1251 = _1249 * 0.15915493667125701904296875;
        float _1253 = _1251 * 6.283185482025146484375;
        float _1255 = cos(_1253);
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        float _1261 = _1255 + (-1.0);
        float _1263 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = fma(_1259, _1245, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1267 = fma(_1211, _1255, _1263);
        float _1269 = _1247 * _1265;
        float _1271 = fma(_1195, _1269, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1273 = fma(_1187, _1269, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1237 = _1267;
        _1227 = _1271;
        _1231 = _1273;
    }
    float _1275 = _1237;
    float _1277 = _1227;
    float _1279 = _1231;
    float _1281 = -_1203;
    float _1283 = _1281 + _1275;
    float _1285 = -_1173;
    float _1287 = _1285 + _1277;
    float _1289 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1291 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1293 = _1283 * _1283;
    float _1295 = -_1163;
    float _1297 = _1295 + _1279;
    float _1299 = 1.0 / _1289;
    float _1301 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1291);
    float _1303 = fma(_1287, _1287, _1293);
    float _1305 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1301);
    float _1307 = fma(_1297, _1297, _1303);
    bool _1309 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1311 = isnan(0.5);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1317 = _1313 || _1315;
    float _1319 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1321 = sqrt(_1307);
    bool _1323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1325 = isnan(0.5);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1331 = _1327 || _1329;
    float _1333 = _1319 + _1289;
    float _1335 = _1333 * _1299;
    float _1337 = _1335 * 0.5;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    float _1343 = 1.0 / _1341;
    bool _1345 = _1321 > 0.0;
    float _1347 = _1321;
    float _1349 = _1275;
    float _1351 = _1279;
    float _1353 = _1341;
    float _1355 = _1289;
    float _1357 = _1299;
    float _1359 = _1283;
    float _1361 = _1277;
    if (!_1345)
    {
        _1347 = _1277;
    }
    float _1363 = _1347;
    bool _1365 = !_1345;
    float _1367 = _1363;
    if (!_1365)
    {
        float _1369 = _211 * _211;
        float _1371 = fma(_209, _209, _1369);
        float _1373 = fma(_213, _213, _1371);
        float _1375 = rsqrt(_1307);
        float _1377 = sqrt(_1373);
        float _1379 = _1287 * _1375;
        float _1381 = _1283 * _1375;
        float _1383 = _1297 * _1375;
        bool _1385 = _1377 > 0.0;
        float _1387 = _1375;
        _1353 = _1377;
        _1357 = _1379;
        if (!_1385)
        {
            _1387 = _1277;
        }
        float _1389 = _1387;
        bool _1391 = !_1385;
        _1367 = _1389;
        if (!_1391)
        {
            float _1393 = rsqrt(_1373);
            float _1395 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1397 = _211 * _1393;
            float _1399 = _209 * _1393;
            float _1401 = _1381 * _1397;
            float _1403 = _213 * _1393;
            float _1405 = fma(_1379, _1399, _1401);
            float _1407 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1409 = fma(_1383, _1403, _1405);
            float _1411 = _1409 * _1407;
            float _1413 = fma(_209, _1411, _1277);
            float _1415 = fma(_211, _1411, _1275);
            float _1417 = fma(_213, _1411, _1279);
            _1349 = _1415;
            _1367 = _1413;
            _1351 = _1417;
            _1353 = _1403;
            _1355 = _1411;
        }
    }
    float _1419 = _1349;
    float _1421 = _1367;
    float _1423 = _1351;
    float _1425 = _1353;
    float _1427 = _1355;
    float _1429 = _1357;
    float _1431 = _1421;
    float _1433 = _1423;
    float _1435 = _1429;
    float _1437 = _1425;
    float _1439 = _1427;
    if (_1331)
    {
        _1359 = 1.0;
    }
    float _1441 = _1359;
    float _1443 = _1441;
    if (_1317)
    {
        _1361 = _1419;
    }
    float _1445 = _1361;
    float _1447 = _1445;
    if (!_1317)
    {
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1451 = _1203 + _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1455 = _1173 + _1453;
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1459 = -_1173;
        float _1461 = _1459 + _1421;
        float _1463 = _1451 * _1451;
        float _1465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1467 = _1163 + _1465;
        float _1469 = fma(_1455, _1455, _1463);
        float _1471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1473 = fma(_1467, _1467, _1469);
        float _1475 = sqrt(_1473);
        float _1477 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1479 = precise::min(_1475, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1481 = _1479 * _1471;
        float _1483 = -_1203;
        float _1485 = _1483 + _1419;
        float _1487 = _1477 * _1481;
        float _1489 = -_1163;
        float _1491 = _1489 + _1423;
        float _1493 = fma(_1485, _1487, _1203);
        float _1495 = fma(_1461, _1487, _1173);
        float _1497 = fma(_1491, _1487, _1163);
        _1447 = _1493;
        _1431 = _1495;
        _1433 = _1497;
    }
    float _1499 = _1447;
    float _1501 = _1431;
    float _1503 = _1433;
    if (_1331)
    {
        _1435 = 1.0;
    }
    float _1505 = _1435;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1509 = _1343 * _1507;
    float _1511 = _1505;
    if (!_1331)
    {
        float _1513 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1515 = _1513 * 0.15915493667125701904296875;
        float _1517 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1519 = _1515 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = _1517 * 0.15915493667125701904296875;
        float _1525 = _1515 * 6.283185482025146484375;
        float _1527 = sin(_1525);
        float _1529 = 1.0 / _1521;
        float _1531 = _1523 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = _1527 * _1529;
        float _1537 = _1523 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1543 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1541;
        float _1545 = _1533 * _1535;
        float _1547 = 1.0 / _1543;
        float _1549 = 1.0 / _1545;
        float _1551 = _1539 * _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1555 = fma(_1509, _1551, _1553);
        float _1557 = _1555 * _1547;
        float _1559 = precise::clamp(_1557, 0.0, 1.0);
        _1437 = _1515;
        _1443 = _1559;
    }
    float _1561 = _1437;
    float _1563 = _1443;
    if (!_1331)
    {
        float _1565 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1571 = _1567 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        float _1575 = _1569 * 0.15915493667125701904296875;
        float _1577 = _1567 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        float _1581 = 1.0 / _1573;
        float _1583 = _1575 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1579 * _1581;
        float _1589 = _1575 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = _1585 * _1587;
        float _1595 = 1.0 / _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1599 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1597;
        float _1601 = 1.0 / _1599;
        float _1603 = _1591 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1607 = fma(_1509, _1603, _1605);
        float _1609 = _1607 * _1601;
        float _1611 = precise::clamp(_1609, 0.0, 1.0);
        float _1613 = -_1611;
        float _1615 = _1613 + 1.0;
        _1439 = _1593;
        _1511 = _1615;
    }
    float _1617 = _1439;
    float _1619 = _1511;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1623 = _1499 + _1621;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1627 = _1501 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1631 = _1503 + _1629;
    float _1633 = _1623 * _1623;
    float _1635 = fma(_1627, _1627, _1633);
    float _1637 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1631, _1631, _1635);
    float _1643 = rsqrt(_1641);
    float _1645 = sqrt(_1641);
    float _1647 = _1643 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1649 = _1627 * _1647;
    float _1651 = _1631 * _1647;
    float _1653 = _1649 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 + _1655;
    float _1659 = sqrt(_1657);
    bool _1661 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1659 + _1663;
    float _1667 = _1631;
    float _1669 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1671 = _1657;
    float _1673 = _1665;
    float _1675 = _1633;
    float _1677 = _1623;
    float _1679 = _1617;
    if (_1661)
    {
        float _1681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1667 = _1681;
    }
    float _1683 = _1667;
    if (!_1661)
    {
        _1669 = _1653;
    }
    float _1685 = _1669;
    float _1687 = _1685;
    if (_1661)
    {
        float _1689 = rsqrt(_1657);
        _1671 = _1689;
    }
    float _1691 = _1671;
    float _1693 = _1691;
    if (_1661)
    {
        float _1695 = _1665 * _1683;
        _1673 = _1695;
    }
    float _1697 = _1673;
    if (_1661)
    {
        float _1699 = _1697 * 0.15915493667125701904296875;
        _1675 = _1699;
    }
    float _1701 = _1675;
    float _1703 = _1683;
    float _1705 = _1701;
    if (_1661)
    {
        float _1707 = _1701 * 6.283185482025146484375;
        float _1709 = sin(_1707);
        _1703 = _1709;
    }
    float _1711 = _1703;
    float _1713 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1715 = precise::max(0.0, _1713);
    float _1717 = _1561;
    float _1719 = _1715;
    if (_1661)
    {
        float _1721 = _1701 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = -_1647;
    float _1729 = -_1715;
    float _1731 = fma(_1623, _1727, _1729);
    if (_1661)
    {
        float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1733;
    }
    float _1735 = _1719;
    if (!_1661)
    {
        _1705 = _1731;
    }
    float _1737 = _1705;
    float _1739 = _1711;
    float _1741 = _1737;
    if (_1661)
    {
        float _1743 = fma(_1711, _1735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1739 = _1743;
    }
    float _1745 = _1739;
    float _1747 = floor(_1637);
    float _1749 = _1745;
    if (_1661)
    {
        float _1751 = _1725 + (-1.0);
        _1677 = _1751;
    }
    float _1753 = _1677;
    float _1755 = _1753;
    if (_1661)
    {
        float _1757 = _1691 * _1745;
        _959 = _1757;
    }
    float _1759 = _959;
    if (!_1661)
    {
        _1749 = _1649;
    }
    float _1761 = _1749;
    float _1763 = _1761;
    if (_1661)
    {
        float _1765 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1679 = _1765;
    }
    float _1767 = _1679;
    if (_1661)
    {
        float _1769 = _1649 * _1759;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (!_1661)
    {
        _1693 = _1651;
    }
    float _1773 = _1693;
    float _1775 = _1773;
    if (_1661)
    {
        float _1777 = _1651 * _1759;
        _1775 = _1777;
    }
    float _1779 = _1775;
    if (_1661)
    {
        float _1781 = fma(_1731, _1725, _1767);
        _1741 = _1781;
    }
    float _1783 = _1741;
    if (_1661)
    {
        float _1785 = _1771 * _1771;
        _1687 = _1785;
    }
    float _1787 = _1687;
    if (!_1661)
    {
        _1755 = _1655;
    }
    float _1789 = _1755;
    float _1791 = _1789;
    if (_1661)
    {
        float _1793 = _1779 * _1779;
        _1791 = _1793;
    }
    float _1795 = _1791;
    float _1797 = fma(_1783, _1783, _1787);
    float _1799 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1801 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1803 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1805 = fma(_1163, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1807 = _1797 + _1795;
    float _1809 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1811 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1813 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1801);
    float _1815 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1809);
    float _1817 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1811);
    float _1819 = rsqrt(_1807);
    float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1823 = fma(_1645, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1821);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1815);
    float _1829 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1803);
    float _1833 = -_1825;
    float _1835 = _1833 + 1.0;
    float _1837 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1813);
    float _1839 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1843 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1831);
    float _1845 = _1837 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1847 = abs(_1835);
    float _1849 = log2(_1847);
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1841);
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1855 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1857 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1859 = _1819 * _1771;
    float _1861 = _1819 * _1783;
    float _1863 = floor(_1805);
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1857);
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1869 = _1819 * _1779;
    float _1871 = -_1855;
    float _1873 = fma(_1871, _1639, 1.0);
    float _1875 = -_1747;
    float _1877 = _1637 + _1875;
    float _1879 = -_1867;
    float _1881 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1879);
    float _1883 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1885 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1887 = 1.0 / _1865;
    float _1889 = -_1869;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1881);
    float _1893 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1895 = fma(_1891, -0.5, 0.5);
    float _1897 = fma(_1891, 0.5, 0.5);
    float _1899 = -_1863;
    float _1901 = _1805 + _1899;
    float _1903 = log2(_1873);
    float _1905 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1883);
    float _1907 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1893);
    float _1909 = fma(_1897, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1911 = _1861 + 1.0;
    float _1913 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1915 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1907);
    float _1917 = fma(_1897, _1909, -0.212114393711090087890625);
    float _1919 = exp2(_1885);
    float _1921 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1913);
    float _1923 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1915);
    float _1925 = fma(_1897, _1917, 1.570728778839111328125);
    float _1927 = _1921 * _1887;
    float _1929 = _1923 * _1887;
    float _1931 = sqrt(_1895);
    float _1933 = _1903 * 0.693147182464599609375;
    float _1935 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1937 = fma(_1927, 0.5, 0.5);
    float _1939 = -_1861;
    float _1941 = fma(_1919, _1911, _1939);
    float2 _6538 = float2(_1877, _1901);
    float _1943 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6538, float2(0.0), isnan(_6538)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6538, float2(0.0), isnan(_6538)), level(0.0)).x;
    float _1945 = fma(_1941, 0.5, 0.5);
    float _1947 = _1931 * 0.636619746685028076171875;
    float _1949 = fma(_1929, -0.5, 0.5);
    float _1951 = -_1925;
    float _1953 = fma(_1947, _1951, 1.0);
    float3 _6561 = float3(_1937, _1949, _1935);
    float _1955 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6561, float3(0.0), isnan(_6561)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6561, float3(0.0), isnan(_6561)), level(0.0)).x;
    float3 _6572 = float3(_1937, _1949, _1935);
    float4 _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6572, float3(0.0), isnan(_6572)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6572, float3(0.0), isnan(_6572)), level(0.0)).xyzw;
    float _1960 = _1958.x;
    float _1962 = _1958.y;
    float _1964 = _1958.z;
    float _1966 = _1958.w;
    float2 _6588 = float2(_1953, _1945);
    float3 _1970 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6588, float2(0.0), isnan(_6588)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6588, float2(0.0), isnan(_6588)), level(0.0)).xyz;
    float _1972 = _1970.x;
    float _1974 = _1970.y;
    float _1976 = _1970.z;
    float _1978 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1980 = int(_1978);
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1984 = _1982 != 0;
    float _1986 = -_901;
    float _1988 = _1986 + 1.0;
    bool _1990 = _593 != 0;
    float _1992 = -_925;
    float _1994 = _1992 + 1.0;
    bool _1996 = _533 > 0.5;
    out.m_68.x = _551;
    int _1998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2000 = _1998 != 0;
    float _2002 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2004 = int(_2002);
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2008 = _2006 != 0;
    float _2010 = -_951;
    float _2012 = _2010 + 1.0;
    int _2014 = abs(_761);
    float _2016 = -_953;
    float _2018 = _2016 + 1.0;
    float _2020 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_70.x = _1501;
    out.m_70.y = _1499;
    out.m_70.z = _1503;
    float _2022 = float(uint(_1980));
    float _2024 = trunc(_889);
    int _2026 = int(_2024);
    int _2028 = ~_1980;
    int _2030 = _2028 + 1;
    float _2032 = float(uint(_2004));
    float _2034 = 1.0 / _2022;
    int _2036 = ~_1980;
    int _2038 = _2036 + 1;
    int _2040 = ~_2004;
    int _2042 = _2040 + 1;
    int _2044 = ~_2004;
    int _2046 = _2044 + 1;
    float _2048 = 1.0 / _2032;
    float _2050 = trunc(_947);
    int _2052 = int(_2050);
    int _2054 = as_type<int>(_2034) + (-2);
    float _2056 = float(uint(_2026));
    int _2058 = ~_2004;
    int _2060 = _2058 + 1;
    int _2062 = as_type<int>(_2048) + (-2);
    float _2064 = as_type<float>(_2054) * _2056;
    float _2066 = exp2(_2020);
    float _2068 = float(uint(_2052));
    float _2070 = trunc(_2064);
    float _2072 = precise::max(_2070, 0.0);
    uint _2075 = uint(_2072);
    float _2077 = as_type<float>(_2062) * _2068;
    float _2079 = -_2066;
    float _2081 = _2079 + 1.0;
    float _2083 = trunc(_2077);
    float _2085 = precise::max(_2083, 0.0);
    uint _2087 = uint(_2085);
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2095 = _2038 * int(_2075);
    int _2097 = _2095 + _2026;
    float _2099 = 1.0 / _2091;
    float _2101 = float(uint(_2097));
    int _2103 = _2060 * int(_2087);
    int _2105 = _2103 + _2052;
    float _2107 = as_type<float>(_2054) * _2101;
    float _2109 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2111 = _531 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2115 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2113;
    float _2117 = float(uint(_2105));
    float _2119 = trunc(_2107);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = _2115 * _2099;
    float _2127 = _2115;
    float _2129 = _2117;
    float _2131 = _2099;
    float _2133 = _1865;
    float _2135 = _1923;
    float _2137 = _1921;
    if (_1984)
    {
        _2127 = 1.0;
    }
    float _2139 = _2127;
    float _2141 = as_type<float>(_2062) * _2117;
    float _2143 = _2139;
    if (!_1984)
    {
        _2143 = 7.345489978790283203125;
    }
    float _2145 = _2143;
    float _2147 = fma(_2125, _2111, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1984)
    {
        _2129 = _533;
    }
    float _2149 = _2129;
    float _2151 = _2149;
    if (_1984)
    {
        _2131 = 1.0;
    }
    float _2153 = _2131;
    float _2155 = trunc(_2141);
    float _2157 = precise::max(_2155, 0.0);
    uint _2159 = uint(_2157);
    float _2161 = _2153;
    if (!_1984)
    {
        _2151 = _535;
    }
    float _2163 = _2151;
    float _2165 = _2145 * _533;
    if (!_1984)
    {
        _2161 = 1.2345600128173828125;
    }
    float _2167 = _2161;
    float _2169 = float(_2026);
    bool _2171 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2173 = isnan(_531);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = _2167 * _2163;
    float _2185 = floor(_2165);
    int _2187 = int(_2075) + int(_2123);
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2191 = _2189 != 0;
    float _2193 = -_2181;
    float _2195 = _2193 + 1.0;
    bool _2197 = _531 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2199 = isnan(_531);
    bool _2201 = _2197 || _2199;
    bool _2203 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2205 = _2201 || _2203;
    float _2207 = float(_2205);
    int _2209 = _2030 * _2187;
    int _2211 = _2209 + _2026;
    int _2213 = int(_2087) + int(_2159);
    float _2215 = floor(_2183);
    float _2217 = float(_1980);
    float _2219 = _2207 * _2195;
    float _2221 = float(_2004);
    int _2223 = _2042 * _2213;
    int _2225 = _2223 + _2052;
    bool _2227 = _2169 >= _2217;
    bool _2229 = isnan(_2169);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(_2217);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = _2147 * _2219;
    float _2241 = -_201;
    int _2243 = _1996 ? as_type<int>(_2241) : as_type<int>(_201);
    float _2245 = -_2185;
    float _2247 = _2165 + _2245;
    float _2249 = float(_2052);
    bool _2251 = !_2191;
    float _2253 = _2251 ? _201 : as_type<float>(_2243);
    float _2255 = trunc(_2237);
    int _2257 = int(_2255);
    bool _2259 = _2249 >= _2221;
    bool _2261 = isnan(_2249);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(_2221);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2273 = uint(_2211) >= uint(_1980);
    float _2275 = _2253 + 0.5;
    bool _2277 = uint(_2225) >= uint(_2004);
    float _2279 = -_2215;
    float _2281 = _2183 + _2279;
    float _2283 = _2247 * _2217;
    float _2285 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[80].x, _605);
    bool _2287 = !_2273;
    int _2289 = _2287 ? 0 : (-1);
    float _2291 = trunc(_2269);
    int _2293 = int(_2291);
    bool _2295 = !_2277;
    int _2297 = _2295 ? 0 : (-1);
    float _2299 = _2217 * _547;
    int _2301 = ~_2187;
    int _2303 = _2301 + _2289;
    int _2305 = _2303 + 1;
    float _2307 = -_1988;
    float _2309 = fma(_2253, _2307, _2285);
    int _2311 = ~_2213;
    int _2313 = _2311 + _2297;
    int _2315 = _2313 + 1;
    float _2317 = _2221 * _547;
    bool _2319 = _1980 == 0;
    int _2321 = _1980 * _2305;
    int _2323 = _2321 + _2026;
    float _2325 = trunc(_2283);
    int _2327 = int(_2325);
    int _2329 = _2004 * _2315;
    int _2331 = _2329 + _2052;
    bool _2333 = _2004 == 0;
    bool _2335 = !_2319;
    int _2337 = _2335 ? _2323 : (-1);
    bool _2339 = !_2333;
    int _2341 = _2339 ? _2331 : (-1);
    float _2343 = _2281 * _2221;
    int _2345 = ~_2293;
    int _2347 = _2345 + 1;
    int _2349 = _2347 + 1;
    float _2351 = trunc(_2317);
    int _2353 = int(_2351);
    bool _2355 = !_2008;
    int _2357 = _2355 ? 0 : 1;
    int _2359 = ~_2257;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    int _2365 = _2341 * _2349;
    int _2367 = abs(_2357);
    int _2369 = _1980 + (-1);
    int _2371 = _2337 * _2363;
    int _2373 = abs(_751);
    float _2375 = trunc(_2343);
    int _2377 = int(_2375);
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2381 = _2379 != 0;
    int _2383 = _2327 * _2367;
    int _2385 = _2383 + _2026;
    int _2387 = _2004 + (-1);
    int _2389 = _2257 * _2369;
    int _2391 = _2389 + _2371;
    bool _2393 = !_2381;
    int _2395 = _2393 ? 0 : 1;
    int _2397 = abs(_1069);
    int _2399 = _2293 * _2387;
    int _2401 = _2399 + _2365;
    int _2403 = abs(_1061);
    float _2405 = trunc(_2299);
    int _2407 = int(_2405);
    float _2409 = float(uint(_2385));
    int _2411 = _2391 * _2373;
    int _2413 = abs(_2395);
    int _2415 = _2401 * _2403;
    int _2417 = abs(_755);
    float _2419 = as_type<float>(_2054) * _2409;
    float _2421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2423 = _2377 * _2413;
    int _2425 = _2423 + _2052;
    int _2427 = _2353 * _2397;
    int _2429 = _2427 + _2415;
    int _2431 = ~_1980;
    int _2433 = _2431 + 1;
    float _2435 = trunc(_2419);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    float _2441 = float(uint(_2425));
    int _2443 = _2407 * _2417;
    int _2445 = _2443 + _2411;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2449 = _2447 != 0;
    float _2451 = -_217;
    int _2453 = _1990 ? as_type<int>(_2451) : as_type<int>(_217);
    float _2455 = as_type<float>(_2062) * _2441;
    bool _2457 = !_2000;
    int _2459 = _2457 ? 0 : 1;
    int _2461 = _2385 * _2014;
    int _2463 = _2461 + _2445;
    int _2465 = abs(_1073);
    float _2467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2469 = abs(_2459);
    int _2471 = abs(_1077);
    int _2473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2475 = _2473 != 0;
    int _2477 = _2433 * int(_2439);
    int _2479 = _2477 + _2385;
    bool _2481 = !_2449;
    float _2483 = _2481 ? _217 : as_type<float>(_2453);
    float _2485 = trunc(_2455);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = float(uint(_2479));
    int _2493 = _2425 * _2465;
    int _2495 = _2493 + _2429;
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2499 = _2497 != 0;
    int _2501 = _2327 * _2469;
    int _2503 = _2501 + _2463;
    float _2505 = _2483 + (-0.5);
    float _2507 = abs(_1509);
    float _2509 = log2(_2507);
    int _2511 = ~_2004;
    int _2513 = _2511 + 1;
    float _2515 = as_type<float>(_2054) * _2491;
    float _2517 = float(uint(_2503));
    float _2519 = -_2505;
    float _2521 = -_783;
    float _2523 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2521);
    int _2525 = _2377 * _2471;
    int _2527 = _2525 + _2495;
    float _2529 = _2421 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2531 = as_type<float>(_2054) * _2517;
    float _2533 = fma(_2483, _1994, _2523);
    float _2535 = float(uint(_2527));
    float _2537 = -_2207;
    float _2539 = _2537 + 1.0;
    int _2541 = ~_1980;
    int _2543 = _2541 + 1;
    int _2545 = _2513 * int(_2489);
    int _2547 = _2545 + _2425;
    float _2549 = trunc(_2531);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    float _2555 = as_type<float>(_2062) * _2535;
    float _2557 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2239);
    float _2559 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2561 = float(uint(_2547));
    out.m_72.x = _2309;
    out.m_72.y = _2533;
    float _2563 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2557);
    float _2565 = trunc(_2555);
    float _2567 = precise::max(_2565, 0.0);
    uint _2569 = uint(_2567);
    float _2571 = as_type<float>(_2062) * _2561;
    float _2573 = _2467 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2575 = _2563 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2577 = _677 + 0.5;
    int _2579 = _2543 * int(_2553);
    int _2581 = _2579 + _2503;
    float _2583 = exp2(_2559);
    float _2585 = _681 + (-0.5);
    float _2587 = fma(_2529, _2577, _957);
    out.m_74.w = _2575;
    float _2589 = float(uint(_2581));
    float _2591 = -_2573;
    float _2593 = -_867;
    float _2595 = fma(_2591, _2585, _2593);
    int _2597 = _2046 * int(_2569);
    int _2599 = _2597 + _2527;
    float _2601 = trunc(_2515);
    float _2603 = precise::max(_2601, 0.0);
    uint _2605 = uint(_2603);
    int _2607 = ~_1980;
    int _2609 = _2607 + 1;
    float _2611 = as_type<float>(_2054) * _2589;
    float _2613 = -_2012;
    float _2615 = fma(_677, _2613, _2587);
    float _2617 = float(uint(_2599));
    float _2619 = fma(_681, _2018, _2595);
    int _2621 = ~_1980;
    int _2623 = _2621 + 1;
    float _2625 = trunc(_2571);
    float _2627 = precise::max(_2625, 0.0);
    uint _2629 = uint(_2627);
    float _2631 = as_type<float>(_2062) * _2617;
    float _2633 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2635 = precise::clamp(_2633, 0.0, 1.0);
    int _2637 = ~_2004;
    int _2639 = _2637 + 1;
    out.m_76.x = _2615;
    out.m_76.y = _2619;
    float _2641 = trunc(_2611);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = int(_2439) + int(_2605);
    int _2649 = ~_2004;
    int _2651 = _2649 + 1;
    int _2653 = _2609 * _2647;
    int _2655 = _2653 + _2385;
    float _2657 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = trunc(_2631);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    int _2665 = int(_2489) + int(_2629);
    float _2667 = fma(_2635, -2.0, 3.0);
    bool _2669 = uint(_2655) >= uint(_1980);
    float _2671 = _2635 * _2635;
    float _2673 = -_1943;
    float _2675 = _2673 + 1.0;
    int _2677 = _2639 * _2665;
    int _2679 = _2677 + _2425;
    bool _2681 = !_2669;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = _2671 * _2667;
    int _2687 = int(_2553) + int(_2645);
    bool _2689 = uint(_2679) >= uint(_2004);
    float _2691 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2693 = ~_2647;
    int _2695 = _2693 + _2683;
    int _2697 = _2695 + 1;
    int _2699 = _2623 * _2687;
    int _2701 = _2699 + _2503;
    float _2703 = _2093 * _1955;
    int _2705 = int(_2569) + int(_2663);
    float _2707 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2709 = -_1093;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2691);
    bool _2713 = uint(_2701) >= uint(_1980);
    float _2715 = -_2093;
    float _2717 = _2715 + 1.0;
    float _2719 = -_1093;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2707);
    int _2723 = _2651 * _2705;
    int _2725 = _2723 + _2527;
    bool _2727 = !_2713;
    int _2729 = _2727 ? 0 : (-1);
    float _2731 = -_1093;
    float _2733 = fma(_2731, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    bool _2735 = !_2689;
    int _2737 = _2735 ? 0 : (-1);
    float _2739 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2721);
    bool _2741 = uint(_2725) >= uint(_2004);
    float _2743 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2745 = ~_2687;
    int _2747 = _2745 + _2729;
    int _2749 = _2747 + 1;
    float _2751 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2711);
    int _2753 = ~_2665;
    int _2755 = _2753 + _2737;
    int _2757 = _2755 + 1;
    float _2759 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2743);
    bool _2761 = !_2741;
    int _2763 = _2761 ? 0 : (-1);
    int _2765 = _1980 * _2749;
    int _2767 = _2765 + _2503;
    float _2769 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2771 = _1980 * _2697;
    int _2773 = _2771 + _2385;
    int _2775 = ~_2705;
    int _2777 = _2775 + _2763;
    int _2779 = _2777 + 1;
    float _2781 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2783 = !_2319;
    int _2785 = _2783 ? _2767 : (-1);
    float _2787 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2789 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2733);
    float _2791 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2781);
    float _2793 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2795 = _2785 >> 31;
    float _2797 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2787);
    int _2799 = _2004 * _2779;
    int _2801 = _2799 + _2527;
    float _2803 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    int _2805 = _2795 & 3;
    float _2807 = -_2685;
    float _2809 = _2807 + 1.0;
    int _2811 = _2785 & 3;
    bool _2813 = _2811 != 0;
    float _2815 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2769);
    bool _2817 = !_2333;
    int _2819 = _2817 ? _2801 : (-1);
    float _2821 = fma(_2809, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2685);
    int _2823 = _2785 + _2805;
    float _2825 = _1123 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2827 = _2819 >> 31;
    float _2829 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2803);
    int _2831 = _2823 >> 2;
    float _2833 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2825);
    bool _2835 = uint(_2811) >= 2u;
    float _2837 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2815);
    int _2839 = _2827 & 3;
    float _2841 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    int _2843 = _2831 << 4;
    int _2845 = _2843 + 368;
    float _2847 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2797);
    int _2849 = _2785 & 3;
    bool _2851 = _2849 != 0;
    float _2853 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2855 = _2819 + _2839;
    uint _2857 = uint(int(uint(_2845) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c9)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = _2835 ? 0 : 1;
    float _2875 = _2853 * _2739;
    bool _2877 = _2811 != 3;
    float _2879 = _2853 * _2751;
    int _2881 = _2851 ? 0 : 1;
    int _2883 = _2004 * _2757;
    int _2885 = _2883 + _2425;
    bool _2887 = uint(_2811) > 1u;
    int _2889 = _2855 >> 2;
    bool _2891 = _1509 <= 8000.0;
    bool _2893 = isnan(_1509);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan(8000.0);
    bool _2899 = _2895 || _2897;
    float _2901 = float(_2899);
    int _2903 = _2889 << 4;
    int _2905 = _2903 + 512;
    int _2907 = ~_2873;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    float _2913 = _2901 * _2821;
    uint _2915 = uint(int(uint(_2905) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = _2911;
    if (_2877)
    {
        int _2933 = ~_2873;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2791);
    int _2941 = ~_2881;
    int _2943 = _2941 + 1;
    int _2945 = _2943 + 1;
    float _2947 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2759);
    int _2949 = _2945;
    if (!_2887)
    {
        int _2951 = ~_2881;
        int _2953 = _2951 + 1;
        _2949 = _2953;
    }
    int _2955 = _2949;
    float _2957 = fma(_2271, _2939, _2875);
    bool _2959 = !_2813;
    int _2961 = _2959 ? 0 : 1;
    int _2963 = _2845 + 8;
    uint _2965 = uint(int(uint(_2963) >> uint(2)));
    uint _2967 = uint(int(uint(int(_2965)) >> uint(2)));
    int _2969 = int(_2965) & 3;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[int(_2967)][_2969];
    int _2973 = int(_2965) + 1;
    uint _2975 = uint(int(uint(_2973) >> uint(2)));
    int _2977 = _2973 & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    int _2981 = _2819 & 3;
    bool _2983 = _2981 != 0;
    out.m_78.x = _2939;
    out.m_78.y = _2947;
    out.m_78.z = _2847;
    int _2985 = _2819 & 3;
    bool _2987 = _2985 != 0;
    float _2989 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2991 = uint(_2981) > 1u;
    int _2993 = _2987 ? 0 : 1;
    int _2995 = _2905 + 8;
    uint _2997 = uint(int(uint(_2995) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = abs(_2955);
    float _3015 = fma(_2271, _2947, _2879);
    bool _3017 = !_2983;
    int _3019 = _3017 ? 0 : 1;
    float _3021 = _2675 * _2989;
    float _3023 = precise::clamp(_3021, 0.0, 1.0);
    bool _3025 = _2981 != 3;
    float _3027 = _1976 * _2703;
    int _3029 = ~_2993;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = _1966 * _2717;
    bool _3037 = uint(_2981) >= 2u;
    int _3039 = _3033;
    if (!_2991)
    {
        int _3041 = ~_2993;
        int _3043 = _3041 + 1;
        _3039 = _3043;
    }
    int _3045 = _3039;
    int _3047 = ~_3013;
    int _3049 = _3047 + 1;
    int _3051 = _3049 + 1;
    int _3053 = abs(_2961);
    int _3055 = abs(_3045);
    int _3057 = _3051 * as_type<int>(_2871);
    int _3059 = _3037 ? 0 : 1;
    int _3061 = ~_3059;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    int _3067 = ~_3053;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = _3065;
    if (_3025)
    {
        int _3075 = ~_3059;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    int _3081 = abs(_3019);
    int _3083 = _3071 * as_type<int>(_2863);
    int _3085 = _3083 + _3057;
    int _3087 = ~_3055;
    int _3089 = _3087 + 1;
    int _3091 = _3089 + 1;
    float _3093 = _1921 + _1865;
    int _3095 = abs(_2937);
    int _3097 = abs(_3079);
    int _3099 = _3091 * as_type<int>(_2929);
    int _3101 = ~_3081;
    int _3103 = _3101 + 1;
    int _3105 = _3103 + 1;
    float _3107 = _3093 * 0.5;
    int _3109 = ~_3095;
    int _3111 = _3109 + 1;
    int _3113 = _3111 + 1;
    float _3115 = fma(_2853, _2853, 1.0);
    bool _3117 = _2811 != 3;
    int _3119 = _3105 * as_type<int>(_2921);
    int _3121 = _3119 + _3099;
    int _3123 = ~_3097;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _3113 * as_type<int>(_2971);
    int _3131 = _3129 + _3085;
    bool _3133 = _2981 != 3;
    float _3135 = rsqrt(_3115);
    bool _3137 = !_3117;
    int _3139 = _3137 ? 0 : (-1);
    int _3141 = _3127 * as_type<int>(_3003);
    int _3143 = _3141 + _3121;
    bool _3145 = !_3133;
    int _3147 = _3145 ? 0 : (-1);
    bool _3149 = !_2499;
    int _3151 = _3149 ? 0 : 1;
    int _3153 = abs(_3139);
    bool _3155 = !_2475;
    int _3157 = _3155 ? 0 : 1;
    int _3159 = abs(_3147);
    int _3161 = abs(_3151);
    int _3163 = abs(_3157);
    float _3165 = _2853 * _2789;
    int _3167 = ~_3153;
    int _3169 = _3167 + 1;
    int _3171 = _3169 + 1;
    float _3173 = _2853 * _3135;
    int _3175 = ~_3159;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    float _3181 = fma(_2271, _2847, _3165);
    int _3183 = ~_3161;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    int _3189 = _3171 * as_type<int>(_2979);
    int _3191 = _3189 + _3131;
    int _3193 = ~_3163;
    int _3195 = _3193 + 1;
    int _3197 = _3195 + 1;
    int _3199 = _3179 * as_type<int>(_3011);
    int _3201 = _3199 + _3143;
    bool _3203 = !_2319;
    int _3205 = _3203 ? _2773 : (-1);
    int _3207 = _3191 * _3187;
    bool _3209 = !_2333;
    int _3211 = _3209 ? _2885 : (-1);
    int _3213 = _3201 * _3197;
    float _3215 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3217 = _3205 * _3161;
    int _3219 = _3217 + _3207;
    float _3221 = in.m_80.x;
    int _3223 = _3211 * _3163;
    int _3225 = _3223 + _3213;
    float _3227 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3215);
    float _3229 = -_2829;
    float _3231 = _3173 * _3229;
    float _3233 = -_2837;
    float _3235 = _3173 * _3233;
    float _3237 = -_2841;
    float _3239 = _3173 * _3237;
    float _3241 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3227);
    float _3243 = _2829 + _2957;
    float _3245 = fma(_3135, _2739, _3231);
    float _3247 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3241);
    float _3249 = fma(_3135, _2751, _3235);
    float _3251 = fma(_3135, _2789, _3239);
    float _3253 = _3247 + _1865;
    float _3255 = -_3023;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3259 = _1865 * 0.5;
    float _3261 = _3253 * 0.5;
    float _3263 = _2837 + _3015;
    float _3265 = fma(_1923, -0.5, _3259);
    float _3267 = _2841 + _3181;
    float _3269 = fma(_1966, _3027, _1964);
    float _3271 = _3257 * _3221;
    out.m_82.x = _3245;
    out.m_82.y = _3249;
    out.m_82.z = _3251;
    bool _3273 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3275 = isnan(_1645);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3281 = _3277 || _3279;
    float _3283 = _1563 * _1619;
    float _3285 = _3271 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_84.z = _3261;
    out.m_84.w = _1865;
    float _3287 = float(_3219);
    float _3289 = float(_3225);
    out.m_86.x = _3107;
    out.m_86.y = _3265;
    out.m_86.z = _3261;
    out.m_86.w = _1865;
    out.m_88.x = _3285;
    float _3291 = _1966 * _2703;
    out.m_90.x = _3243;
    out.m_90.y = _3263;
    out.m_90.z = _3267;
    float _3293 = fma(_1972, _3291, _1960);
    float _3295 = fma(_1974, _3291, _1962);
    out.m_92.x = _3287;
    out.m_92.y = _3289;
    float _3297 = _3283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3299 = _3283;
    float _3301 = _3287;
    float _3303 = _3247;
    if (!_3281)
    {
        _3299 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3305 = _3299;
    out.m_94.x = _3293;
    out.m_94.y = _3295;
    out.m_94.z = _3269;
    out.m_94.w = _3035;
    out.gl_Position.x = _1921;
    out.gl_Position.y = _1923;
    out.gl_Position.z = _3247;
    out.gl_Position.w = _1865;
    float _3307 = _3305;
    float _3309 = _3305;
    if (!_3281)
    {
        _3301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3311 = _3301;
    float _3313 = _3311;
    float _3315 = _3311;
    if (!_3281)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3317 = _2133;
    float _3319 = _3317;
    float _3321 = _3317;
    if (!_3281)
    {
        _3303 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3323 = _3303;
    float _3325 = _3323;
    float _3327 = _3323;
    if (!_3281)
    {
        _2135 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3329 = _2135;
    float _3331 = _3329;
    float _3333 = _3329;
    if (!_3281)
    {
        _2137 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3335 = _2137;
    bool _3337 = !_3281;
    float _3339 = _3335;
    float _3341 = _3335;
    if (!_3337)
    {
        bool _3343 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3345 = isnan(_1645);
        bool _3347 = _3343 || _3345;
        bool _3349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3351 = _3347 || _3349;
        if (!_3351)
        {
            float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3355 = _1645 + _3353;
            float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3359 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3357;
            float _3361 = 1.0 / _3359;
            float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3365 = _3363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3375 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3377 = _3375 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3379 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3381 = _3379 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3383 = _3355 * _3361;
            float _3385 = precise::clamp(_3383, 0.0, 1.0);
            float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3391 = fma(_3385, _3365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3393 = fma(_3385, _3389, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3395 = fma(_3385, _3369, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3397 = fma(_3385, _3373, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3399 = fma(_3385, _3377, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3401 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3321 = _3393;
            _3341 = _3399;
            _3315 = _3391;
            _3333 = _3397;
            _3327 = _3395;
            _3309 = _3401;
            _3403 = true;
        }
        else
        {
            bool _3405 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3407 = isnan(_1645);
            bool _3409 = _3405 || _3407;
            bool _3411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3413 = _3409 || _3411;
            if (!_3413)
            {
                _3313 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3415 = _3313;
            _3315 = _3415;
            if (!_3413)
            {
                _3319 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3417 = _3319;
            _3321 = _3417;
            if (!_3413)
            {
                _3325 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3419 = _3325;
            _3327 = _3419;
            if (!_3413)
            {
                _3331 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3421 = _3331;
            _3333 = _3421;
            if (!_3413)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3423 = _3339;
            _3341 = _3423;
            if (!_3413)
            {
                _3307 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3425 = _3307;
            bool _3427 = !_3413;
            _3309 = _3425;
            if (!_3427)
            {
                bool _3429 = _1645 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3431 = isnan(_1645);
                bool _3433 = _3429 || _3431;
                bool _3435 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3437 = _3433 || _3435;
                if (!_3437)
                {
                    float _3439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3441 = _1645 + _3439;
                    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3445 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3443;
                    float _3447 = 1.0 / _3445;
                    float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3451 = _3449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3455 = _3453 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3457 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3459 = _3457 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3463 = _3461 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3467 = _3465 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3469 = _3441 * _3447;
                    float _3471 = precise::clamp(_3469, 0.0, 1.0);
                    float _3473 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3475 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3477 = fma(_3471, _3451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3479 = fma(_3471, _3475, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3481 = fma(_3471, _3455, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3483 = fma(_3471, _3459, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3485 = fma(_3471, _3463, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3487 = fma(_3471, _3467, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3321 = _3479;
                    _3341 = _3485;
                    _3315 = _3477;
                    _3333 = _3483;
                    _3327 = _3481;
                    _3309 = _3487;
                    _3403 = true;
                }
                else
                {
                    _3321 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3315 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3333 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3327 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3309 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3403 = false;
    float _3489 = _3321;
    float _3491 = _3341;
    float _3493 = _3315;
    float _3495 = _3333;
    float _3497 = _3327;
    float _3499 = _3309;
    float _3501 = _3297 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3503 = fma(_3263, -0.5, 0.5);
    float _3505 = precise::clamp(_3503, 0.0, 1.0);
    float _3507 = -_3489;
    float _3509 = _3507 + _3491;
    float _3511 = -_3493;
    float _3513 = _3511 + _3495;
    out.m_49.x = _3501;
    float _3515 = fma(_3505, _3509, _3489);
    float _3517 = -_3497;
    float _3519 = _3517 + _3499;
    float _3521 = fma(_3505, _3513, _3493);
    float _3523 = _3515 * 0.586610972881317138671875;
    bool _3525 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3527 = fma(_3505, _3519, _3497);
    out.m_96.x = 0.0;
    float _3529 = fma(_3521, 0.298911988735198974609375, _3523);
    bool _3531 = _1563 > 0.0;
    bool _3533 = isnan(_1563);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan(0.0);
    bool _3539 = _3535 || _3537;
    float _3541 = fma(_3527, 0.114477999508380889892578125, _3529);
    bool _3543 = _1619 <= 0.0;
    bool _3545 = !_3539;
    bool _3547 = _3543 || _3545;
    float _3549 = -_3541;
    float _3551 = _3521 + _3549;
    float _3553 = -_3541;
    float _3555 = _3515 + _3553;
    float _3557 = -_3541;
    float _3559 = _3527 + _3557;
    float _3561 = fma(_3551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3563 = fma(_3555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    float _3565 = fma(_3559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3541);
    bool _3567 = !_3525;
    if (!_3567)
    {
        float _3569 = -_1499;
        float _3571 = _3569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3573 = -_1501;
        float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3577 = -_1503;
        float _3579 = _3577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3581 = _3571 * _3571;
        float _3583 = fma(_3575, _3575, _3581);
        float _3585 = fma(_3579, _3579, _3583);
        float _3587 = sqrt(_3585);
        float _3589 = rsqrt(_3585);
        float _3591 = -_3587;
        float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3597 = precise::clamp(_3595, 0.0, 1.0);
        float _3599 = _3575 * _3589;
        float _3601 = _3571 * _3589;
        float _3603 = abs(_3597);
        float _3605 = log2(_3603);
        float _3607 = _3579 * _3589;
        float _3609 = _3599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3611 = _3263 * _3601;
        float _3613 = -_3601;
        float _3615 = -_3609;
        float _3617 = fma(_3613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3615);
        float _3619 = fma(_3243, _3599, _3611);
        float _3621 = -_3607;
        float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3617);
        float _3625 = fma(_3267, _3607, _3619);
        float _3627 = precise::clamp(_3625, 0.0, 1.0);
        float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3631 = _3623 + _3629;
        float _3633 = _3605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3635 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3637 = precise::clamp(_3635, 0.0, 1.0);
        float _3639 = exp2(_3633);
        float _3641 = _3639 * _3637;
        float _3643 = _3627 * _3641;
        float _3645 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3647 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3649 = _3643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3645;
        out.m_96.y = _3647;
        out.m_96.z = _3649;
    }
    out.m_98.x = _3561;
    out.m_98.y = _3563;
    out.m_98.z = _3565;
    if (!_3547)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3651;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

